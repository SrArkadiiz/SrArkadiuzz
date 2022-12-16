-- Path of Building
--
-- Module: Trade Query
-- Provides PoB Trader pane for interacting with PoE Trade
--


local dkjson = require "dkjson"

local get_time = os.time
local t_insert = table.insert
local t_remove = table.remove
local m_max = math.max
local m_min = math.min
local m_ceil = math.ceil

local baseSlots = { "Weapon 1", "Weapon 2", "Helmet", "Body Armour", "Gloves", "Boots", "Amulet", "Ring 1", "Ring 2", "Belt", "Flask 1", "Flask 2", "Flask 3", "Flask 4", "Flask 5" }


local TradeQueryClass = newClass("TradeQuery", function(self, itemsTab)
	self.itemsTab = itemsTab
	self.itemsTab.leagueDropList = { }
	self.totalPrice = { }
	self.controls = { }
	-- table of price results index by slot and number of fetched results
	self.resultTbl = { }
	self.sortedResultTbl = { }
	self.itemIndexTbl = { }

	-- default set of trade item sort selection
	self.pbSortSelectionIndex = 1
	self.pbCurrencyConversion = { }
	self.currencyConversionTradeMap = { }
	self.lastCurrencyConversionRequest = 0
	self.lastCurrencyFileTime = { }
	self.pbFileTimestampDiff = { }
	self.pbRealm = ""

	self.tradeQueryRequests = new("TradeQueryRequests", self)
	table.insert(main.onFrameFuncs, function()
		self.tradeQueryRequests:ProcessQueue()
	end)

    -- set 
    self.storedGlobalCacheDPSView = GlobalCache.useFullDPS
	GlobalCache.useFullDPS = GlobalCache.numActiveSkillInFullDPS > 0
end)

---Fetch currency short-names from Poe API (used for PoeNinja price pairing)
---@param callback fun()
function TradeQueryClass:FetchCurrencyConversionTable(callback)
	launch:DownloadPage(
		"https://www.pathofexile.com/api/trade/data/static",
		function(response, errMsg)
			if errMsg then
				callback(response, errMsg)
				return
			end
			local obj = dkjson.decode(response.body)
			local currencyConversionTradeMap = {}
			local currencyTable
			for _, value in pairs(obj.result) do
				if value.id and value.id == "Currency" then
					currencyTable = value.entries
					break
				end
			end
			for _, value in pairs(currencyTable) do
				currencyConversionTradeMap[value.text] = value.id
			end
			self.currencyConversionTradeMap = currencyConversionTradeMap
			if callback then
				callback()
			end
		end)
end


-- Method to pull down and interpret available leagues from PoE
function TradeQueryClass:PullLeagueList()
	launch:DownloadPage(
		"https://api.pathofexile.com/leagues?type=main&compact=1",
		function(response, errMsg)
			if errMsg then
				self:SetNotice(self.controls.pbNotice, "Error: " .. tostring(errMsg))
				return "POE ERROR", "Error: "..errMsg
			else
				local json_data = dkjson.decode(response.body)
				if not json_data then
					self:SetNotice(self.controls.pbNotice, "Failed to Get PoE League List response")
					return
				end
				self.itemsTab.leagueDropList = {}
				for _, league_data in pairs(json_data) do
					if not league_data.id:find("SSF") then
						t_insert(self.itemsTab.leagueDropList,league_data.id)
					end
				end
				self.controls.league:SetList(self.itemsTab.leagueDropList)
				self.controls.league.selIndex = 1
				self.pbLeague = self.itemsTab.leagueDropList[self.controls.league.selIndex]
				self:SetCurrencyConversionButton()
			end
		end)
end

-- Method to convert currency to chaos equivalent
function TradeQueryClass:ConvertCurrencyToChaos(currency, amount)
	local conversionTable = self.pbCurrencyConversion[self.pbLeague]

	-- we take the ceiling of all prices to integer chaos
	-- to prevent dealing with shenanigans of people asking 4.9 chaos
	if conversionTable and conversionTable[currency:lower()] then
		--ConPrintf("Converted '"..currency.."' at " ..tostring(conversionTable[currency:lower()]))
		return m_ceil(amount * conversionTable[currency:lower()])
	elseif currency:lower() == "chaos" then
		return m_ceil(amount)
	else
		ConPrintf("Unhandled Currency Conversion: '" .. currency:lower() .. "'")
		return m_ceil(amount)
	end
end

-- Method to pull down and interpret the PoE.Ninja JSON endpoint data
function TradeQueryClass:PullPoENinjaCurrencyConversion(league)
	local now = get_time()
	-- Limit PoE Ninja Currency Conversion request to 1 per hour
	if (now - self.lastCurrencyConversionRequest) < 3600 then
		self:SetNotice(self.controls.pbNotice, "PoE Ninja Rate Limit Exceeded: " .. tostring(3600 - (now - self.lastCurrencyConversionRequest)))
		return
	end
	-- We are getting currency short-names from Poe API before getting PoeNinja rates
	-- Potentially, currency short-names could be cached but this request runs 
	-- once per hour at most and the Poe API response is already Cloudflare cached
	self:FetchCurrencyConversionTable(function(data, errMsg)
		if errMsg then
			self:SetNotice(self.controls.pbNotice, "Error: " .. tostring(errMsg))
			return
		end
		self.pbCurrencyConversion[league] = { }
		self.lastCurrencyConversionRequest = now
		launch:DownloadPage(
			"https://poe.ninja/api/data/CurrencyRates?league=" .. league:gsub(" ", "+"),	
			function(response, errMsg)
				if errMsg then
					self:SetNotice(self.controls.pbNotice, "Error: " .. tostring(errMsg))
					return
				end
				local json_data = dkjson.decode(response.body)
				if not json_data then
					self:SetNotice(self.controls.pbNotice, "Failed to Get PoE Ninja response")
					return
				end
				self:PriceBuilderProcessPoENinjaResponse(json_data, self.controls)
				local print_str = ""
				for key, value in pairs(self.pbCurrencyConversion[self.pbLeague]) do
					print_str = print_str .. '"'..key..'": '..tostring(value)..','
				end
				local foo = io.open("../"..self.pbLeague.."_currency_values.json", "w")
				foo:write("{" .. print_str .. '"updateTime": ' .. tostring(get_time()) .. "}")
				foo:close()
				self:SetCurrencyConversionButton()
			end)
	end)
end

-- Method to process the PoE.Ninja response
function TradeQueryClass:PriceBuilderProcessPoENinjaResponse(resp)
	if resp then
		-- Populate the chaos-converted values for each tradeId
		for currencyName, chaosEquivalent in pairs(resp) do
			if self.currencyConversionTradeMap[currencyName] then
				self.pbCurrencyConversion[self.pbLeague][self.currencyConversionTradeMap[currencyName]] = chaosEquivalent
			else
				ConPrintf("Unhandled Currency Name: '"..currencyName.."'")
			end
		end
	else
		self:SetNotice(self.controls.pbNotice, "PoE Ninja JSON Processing Error")
	end
end

-- Opens the item pricing popup
function TradeQueryClass:PriceItem()
	self.tradeQueryGenerator = new("TradeQueryGenerator", self)

	-- Count number of rows to render
	local row_count = 3 + #baseSlots
	-- Count sockets
	for _, slot in pairs(self.itemsTab.sockets) do
		if not slot.inactive then
			row_count = row_count + 1
		end
	end

	-- Set main Price Builder pane height and width
	local row_height = 20
	local top_pane_alignment_ref = nil
	local top_pane_alignment_width = 0
	local top_pane_alignment_height = 8
	-- Row spacing reference is now the name, which is a smaller font than the total height
	local pane_height = (top_pane_alignment_height + row_height) * row_count - 4*row_count + 50
	local pane_width = 850
	local cnt = 1

	local newItemList = { }
	for index, itemSetId in ipairs(self.itemsTab.itemSetOrderList) do
		local itemSet = self.itemsTab.itemSets[itemSetId]
		t_insert(newItemList, itemSet.title or "Default")
	end
	self.controls.setSelect = new("DropDownControl", {"TOPLEFT", nil, "TOPLEFT"}, 16, 15, 200, 20, newItemList, function(index, value)
		self.itemsTab:SetActiveItemSet(self.itemsTab.itemSetOrderList[index])
		self.itemsTab:AddUndoState()
	end)
	self.controls.setSelect.enableDroppedWidth = true
	self.controls.setSelect.enabled = function()
		return #self.itemsTab.itemSetOrderList > 1
	end

	self.controls.poesessidButton = new("ButtonControl", {"TOPLEFT", self.controls.setSelect, "BOTTOMLEFT"}, 0, 4, 200, row_height, function() return main.POESESSID ~= "" and "Change POESESSID" or colorCodes.WARNING.."Missing POESESSID" end, function()
		local poesessid_controls = {}
		poesessid_controls.sessionInput = new("EditControl", nil, 0, 18, 350, 18, main.POESESSID, nil, "%X", 32)
		poesessid_controls.sessionInput:SetProtected(true)
		poesessid_controls.sessionInput.placeholder = "Enter your session ID here"
		poesessid_controls.sessionInput.tooltipText = "You can get this from your web browser's cookies while logged into the Path of Exile website."
		poesessid_controls.save = new("ButtonControl", {"TOPRIGHT", poesessid_controls.sessionInput, "TOP"}, -8, 24, 90, row_height, "Save", function()
			main.POESESSID = poesessid_controls.sessionInput.buf
			main:ClosePopup()
			main:SaveSettings()
		end)
		poesessid_controls.save.enabled = function() return #poesessid_controls.sessionInput.buf == 32 or poesessid_controls.sessionInput.buf == "" end
		poesessid_controls.cancel = new("ButtonControl", {"TOPLEFT", poesessid_controls.sessionInput, "TOP"}, 8, 24, 90, row_height, "Cancel", function()
			main:ClosePopup()
		end)
		main:OpenPopup(364, 72, "Change session ID", poesessid_controls)
	end)

	-- Item sort dropdown
	self.sortSelectionList = {
		"Default",
		"Price",
		"Highest DPS",
		"DPS / Price",
	}
	self.controls.itemSortSelection = new("DropDownControl", {"TOPRIGHT", nil, "TOPRIGHT"}, -12, 15, 100, 18, self.sortSelectionList, function(index, value)
		self.pbSortSelectionIndex = index
	end)
	self.controls.itemSortSelection.tooltipText = "Weighted Sum searches will always sort\nusing descending weighted sum."
	self.controls.itemSortSelection:SetSel(self.pbSortSelectionIndex)
	self.controls.itemSortSelectionLabel = new("LabelControl", {"TOPRIGHT", self.controls.itemSortSelection, "TOPLEFT"}, -4, 0, 60, 16, "^7Sort By:")

	self.maxFetchPerSearchDefault = 2
	self.controls.fetchCountEdit = new("EditControl", {"TOPRIGHT",self.controls.itemSortSelection,"BOTTOMRIGHT"}, 0, 4, 154, row_height, "", "Fetch Pages", "%D", 3, function(buf)
		self.maxFetchPages = m_min(m_max(tonumber(buf) or self.maxFetchPerSearchDefault, 1), 10)
		self.tradeQueryRequests.maxFetchPerSearch = 10 * self.maxFetchPages
		self.controls.fetchCountEdit.focusValue = self.maxFetchPages
	end)
	self.controls.fetchCountEdit.focusValue = self.maxFetchPerSearchDefault
	self.tradeQueryRequests.maxFetchPerSearch = 10 * self.maxFetchPerSearchDefault
	self.controls.fetchCountEdit:SetText(tostring(self.maxFetchPages or self.maxFetchPerSearchDefault))
	function self.controls.fetchCountEdit:OnFocusLost()
		self:SetText(tostring(self.focusValue))
	end
	self.controls.fetchCountEdit.tooltipFunc = function(tooltip)
		tooltip:Clear()
		tooltip:AddLine(16, "Specify maximum number of item pages to retrieve per search from PoE Trade.")
		tooltip:AddLine(16, "Each page fetches up to 10 items.")
		tooltip:AddLine(16, "Acceptable Range is: 1 to 10")
	end

	-- League selection
	self.controls.leagueLabel = new("LabelControl", {"TOPLEFT", self.controls.setSelect, "TOPRIGHT"}, 8, 0, 20, 16, "^7League:")
	self.controls.league = new("DropDownControl", {"TOPLEFT", self.controls.leagueLabel, "TOPRIGHT"}, 8, 0, 150, 18, self.itemsTab.leagueDropList, function(index, value)
		self.pbLeague = value
		self:SetCurrencyConversionButton()
	end)
	self.controls.league.enabled = function()
		return #self.itemsTab.leagueDropList > 1
	end

	-- Realm selection
	local realmDropList = { "PC", "Xbox", "Sony" }
	self.controls.realmLabel = new("LabelControl", {"TOPLEFT", self.controls.leagueLabel, "TOPLEFT"}, 8, 24, 20, 16, "^7Realm:")
	self.controls.realm = new("DropDownControl", {"TOPLEFT", self.controls.realmLabel, "TOPRIGHT"}, 8, 0, 150, 18, realmDropList, function(index, value)
		self.pbRealm = value:lower() .. "/"
		if value == "PC" then self.pbRealm = "" end
	end)

	-- Individual slot rows
	top_pane_alignment_ref = {"TOPLEFT", self.controls.poesessidButton, "BOTTOMLEFT"}
	for _, slotName in ipairs(baseSlots) do
		self:PriceItemRowDisplay(cnt, {name = slotName}, top_pane_alignment_ref, top_pane_alignment_width, top_pane_alignment_height, row_height)
		top_pane_alignment_ref = {"TOPLEFT", self.controls["name"..cnt], "BOTTOMLEFT"}
		cnt = cnt + 1
	end
	local activeSocketList = { }
	for nodeId, slot in pairs(self.itemsTab.sockets) do
		if not slot.inactive then
			t_insert(activeSocketList, nodeId)
		end
	end
	table.sort(activeSocketList)
	for _, nodeId in pairs(activeSocketList) do
		self:PriceItemRowDisplay(cnt, {name = self.itemsTab.sockets[nodeId].label, ref = nodeId}, top_pane_alignment_ref, top_pane_alignment_width, top_pane_alignment_height, row_height)
		top_pane_alignment_ref = {"TOPLEFT", self.controls["name"..cnt], "BOTTOMLEFT"}
		cnt = cnt + 1
	end
	self.controls.fullPrice = new("LabelControl", nil, -3, pane_height - 58, pane_width - 256, row_height, "")
	self.controls.close = new("ButtonControl", nil, 0, pane_height - 30, 90, row_height, "Done", function()
		GlobalCache.useFullDPS = self.storedGlobalCacheDPSView
		main:ClosePopup()
	end)

	self.controls.updateCurrencyConversion = new("ButtonControl", {"TOPLEFT", nil, "TOPLEFT"}, 16, pane_height - 30, 240, row_height, "Get Currency Conversion Rates", function()
		self:PullPoENinjaCurrencyConversion(self.pbLeague)
	end)
	self.controls.pbNotice = new("LabelControl",  {"BOTTOMRIGHT", nil, "BOTTOMRIGHT"}, -8, -16, 300, 16, "")
	main:OpenPopup(pane_width, pane_height, "Build Pricer", self.controls)

	if #self.itemsTab.leagueDropList == 0 then
		self:PullLeagueList()
	else
		self.controls.league:SelByValue(self.pbLeague)
		self.pbLeague = self.itemsTab.leagueDropList[self.controls.league.selIndex]
		self:SetCurrencyConversionButton()
	end
end

-- Method to update the Currency Conversion button label
function TradeQueryClass:SetCurrencyConversionButton()
	local currencyLabel = "Update Currency Conversion Rates"
	self.pbFileTimestampDiff[self.controls.league.selIndex] = nil
	local values_file = io.open("../"..self.pbLeague.."_currency_values.json", "r")
	if values_file then
		local lines = values_file:read "*a"
		values_file:close()
		self.pbCurrencyConversion[self.pbLeague] = dkjson.decode(lines)
		self.lastCurrencyFileTime[self.controls.league.selIndex]  = self.pbCurrencyConversion[self.pbLeague]["updateTime"]
		self.pbFileTimestampDiff[self.controls.league.selIndex] = get_time() - self.lastCurrencyFileTime[self.controls.league.selIndex]
		if self.pbFileTimestampDiff[self.controls.league.selIndex] < 3600 then
			-- Less than 1 hour (60 * 60 = 3600)
			currencyLabel = "Currency Rates are very recent"
		elseif self.pbFileTimestampDiff[self.controls.league.selIndex] < (24 * 3600) then
			-- Less than 1 day
			currencyLabel = "Currency Rates are recent"
		end
	else
		currencyLabel = "Get Currency Conversion Rates"
	end
	self.controls.updateCurrencyConversion.label = currencyLabel
	self.controls.updateCurrencyConversion.enabled = function()
		return self.pbFileTimestampDiff[self.controls.league.selIndex] == nil or self.pbFileTimestampDiff[self.controls.league.selIndex] >= 3600
	end
	self.controls.updateCurrencyConversion.tooltipFunc = function(tooltip)
		tooltip:Clear()
		if self.lastCurrencyFileTime[self.controls.league.selIndex] ~= nil then
			self.pbFileTimestampDiff[self.controls.league.selIndex] = get_time() - self.lastCurrencyFileTime[self.controls.league.selIndex]
		end
		if self.pbFileTimestampDiff[self.controls.league.selIndex] == nil or self.pbFileTimestampDiff[self.controls.league.selIndex] >= 3600 then
			tooltip:AddLine(16, "Currency Conversion rates are pulled from PoE Ninja")
			tooltip:AddLine(16, "Updates are limited to once per hour and not necessary more than once per day")
		elseif self.pbFileTimestampDiff[self.controls.league.selIndex] ~= nil and self.pbFileTimestampDiff[self.controls.league.selIndex] < 3600 then
			tooltip:AddLine(16, "Conversion Rates are less than an hour old (" .. tostring(self.pbFileTimestampDiff[self.controls.league.selIndex]) .. " seconds old)")
		end
	end
end

-- Method to set the notice message in upper right of PoB Trader pane
function TradeQueryClass:SetNotice(notice_control, msg)
	if msg:find("No Matching Results") then
		msg = colorCodes.WARNING .. msg
	elseif msg:find("Error:") then
		msg = colorCodes.NEGATIVE .. msg
	end
	notice_control.label = msg
end

-- Method to update controls after a search is completed
function TradeQueryClass:UpdateControlsWithItems(slotTbl, index)
	self.sortedResultTbl[index] = self:SortFetchResults(slotTbl, index)
	self.itemIndexTbl[index] = 1
	self.controls["priceButton"..index].tooltipText = "Sorted by " .. self.sortSelectionList[self.pbSortSelectionIndex]
	local pb_index = self.sortedResultTbl[index][1].index
	self.totalPrice[index] = {
		currency = self.resultTbl[index][pb_index].currency,
		amount = self.resultTbl[index][pb_index].amount,
	}
	self.controls.fullPrice.label = "Total Price: " .. self:GetTotalPriceString()
	local dropdownLabels = {}
	for i = 1, #self.resultTbl[index] do
		local pb_index = self.sortedResultTbl[index][i].index
		local item = new("Item", self.resultTbl[index][pb_index].item_string)
		table.insert(dropdownLabels, colorCodes[item.rarity]..item.name)
	end
	self.controls["resultDropdown"..index]:SetList(dropdownLabels)
end

-- Method to set the current result return in the pane based of an index
function TradeQueryClass:SetFetchResultReturn(slotIndex, index)
	if self.resultTbl[slotIndex] and self.resultTbl[slotIndex][index] then
		self.totalPrice[slotIndex] = {
			currency = self.resultTbl[slotIndex][index].currency,
			amount = self.resultTbl[slotIndex][index].amount,
		}
		self.controls.fullPrice.label = "Total Price: " .. self:GetTotalPriceString()
	end
end

-- Method to sort the fetched results
function TradeQueryClass:SortFetchResults(slotTbl, trade_index)
	local newTbl = {}
	if self.pbSortSelectionIndex == 1 then
		for index, tbl in pairs(self.resultTbl[trade_index]) do
			t_insert(newTbl, { outputAttr = index, index = index })
		end
		return newTbl
	end
	if self.pbSortSelectionIndex > 2 then
		local slot = slotTbl.ref and self.itemsTab.sockets[slotTbl.ref] or self.itemsTab.slots[slotTbl.name]
		local slotName = slotTbl.ref and "Jewel " .. tostring(slotTbl.ref) or slotTbl.name
		local calcFunc, calcBase = self.itemsTab.build.calcsTab:GetMiscCalculator()
		for index, tbl in pairs(self.resultTbl[trade_index]) do
			local item = new("Item", tbl.item_string)
			local output = calcFunc({ repSlotName = slotName, repItem = item }, {})
			local newDPS = GlobalCache.useFullDPS and output.FullDPS or m_max(output.TotalDPS, m_max(output.TotalDot, output.CombinedAvg))
			if self.pbSortSelectionIndex == 4 then
				local chaosAmount = self:ConvertCurrencyToChaos(tbl.currency, tbl.amount)
				--print(tbl.amount, tbl.currency, item.name)
				if chaosAmount > 0 then
					t_insert(newTbl, { outputAttr = newDPS / chaosAmount, index = index })
				end
			else
				if tbl.amount > 0 then
					t_insert(newTbl, { outputAttr = newDPS, index = index })
				end
			end
		end
		table.sort(newTbl, function(a,b) return a.outputAttr > b.outputAttr end)
	else
		for index, tbl in pairs(self.resultTbl[trade_index]) do
			local chaosAmount = self:ConvertCurrencyToChaos(tbl.currency, tbl.amount)
			if chaosAmount > 0 then
				t_insert(newTbl, { outputAttr = chaosAmount, index = index })
			end
		end
		table.sort(newTbl, function(a,b) return a.outputAttr < b.outputAttr end)
	end
	return newTbl
end


-- Method to generate pane elements for each item slot
function TradeQueryClass:PriceItemRowDisplay(str_cnt, slotTbl, top_pane_alignment_ref, top_pane_alignment_width, top_pane_alignment_height, row_height)
	local controls = self.controls
	local activeSlotRef = slotTbl.ref and self.itemsTab.activeItemSet[slotTbl.ref] or self.itemsTab.activeItemSet[slotTbl.name]
	controls["name"..str_cnt] = new("LabelControl", top_pane_alignment_ref, top_pane_alignment_width, top_pane_alignment_height, 100, row_height-4, "^7"..slotTbl.name)
	controls["bestButton"..str_cnt] = new("ButtonControl", {"TOPLEFT",controls["name"..str_cnt],"TOPLEFT"}, 100 + 8, 0, 80, row_height, "Find best", function()
		self.tradeQueryGenerator:RequestQuery(slotTbl.ref and self.itemsTab.sockets[slotTbl.ref] or self.itemsTab.slots[slotTbl.name], { slotTbl = slotTbl, controls = controls, str_cnt = str_cnt }, function(context, query)
			self.pbSortSelectionIndex = 1
			context.controls["priceButton"..context.str_cnt].label = "Searching..."
			self.tradeQueryRequests:SearchWithQuery(self.pbLeague, query, 
				function(items, errMsg)
					if errMsg then
						self:SetNotice(context.controls.pbNotice, colorCodes.NEGATIVE .. errMsg)
						context.controls["priceButton"..context.str_cnt].label =  "Price Item"
						return
					else
						self:SetNotice(context.controls.pbNotice, "")
					end
					self.resultTbl[context.str_cnt] = items
					self:UpdateControlsWithItems(context.slotTbl, context.str_cnt)
					context.controls["priceButton"..context.str_cnt].label =  "Price Item"
				end,
				{
					callbackQueryId = function(queryId)
						controls["uri"..context.str_cnt]:SetText("https://www.pathofexile.com/trade/search/".. self.pbRealm .. self.pbLeague:gsub(" ", "+") .."/".. queryId)
					end
				}
			)
		end)
	end)
	controls["bestButton"..str_cnt].enabled = function() return main.POESESSID ~= "" end
	controls["bestButton"..str_cnt].shown = function() return not self.resultTbl[str_cnt] end
	controls["bestButton"..str_cnt].tooltipText = "Creates a weighted search to find the highest DPS items for this slot.  This requires a valid session ID."
	controls["uri"..str_cnt] = new("EditControl", {"TOPLEFT",controls["bestButton"..str_cnt],"TOPRIGHT"}, 8, 0, 518, row_height, nil, nil, "^%C\t\n", nil, nil, nil)
	controls["uri"..str_cnt]:SetPlaceholder("Paste trade URL here...")
	if activeSlotRef and activeSlotRef.pbURL ~= "" and activeSlotRef.pbURL ~= nil then
		controls["uri"..str_cnt]:SetText(activeSlotRef.pbURL)
	end
	controls["uri"..str_cnt].tooltipFunc = function(tooltip)
		tooltip:Clear()
		if controls["uri"..str_cnt].buf:find('^https://www.pathofexile.com/trade/search/') ~= nil then
			tooltip:AddLine(16, "Control + click to open in web-browser or click 'Price Item' to do it in PoB")
		end
	end
	controls["priceButton"..str_cnt] = new("ButtonControl", {"TOPLEFT",controls["uri"..str_cnt],"TOPRIGHT"}, 8, 0, 100, row_height, "Price Item",
		function()
			controls["priceButton"..str_cnt].label = "Searching..."
			self.tradeQueryRequests:SearchWithURL(controls["uri"..str_cnt], function(items, errMsg)
				if errMsg then
					self:SetNotice(controls.pbNotice, "Error: " .. errMsg)
				else
					self.resultTbl[str_cnt] = items
					self:UpdateControlsWithItems(slotTbl, str_cnt)
					self:SetNotice(controls.pbNotice, "")
				end
				controls["priceButton"..str_cnt].label = "Price Item"
			end)
		end)
	controls["priceButton"..str_cnt].enabled = function()
		local validURL = controls["uri"..str_cnt].buf:find('^https://www.pathofexile.com/trade/search/')
		if not activeSlotRef and slotTbl.ref then
			self.itemsTab.activeItemSet[slotTbl.ref] = { pbURL = "" }
			activeSlotRef = self.itemsTab.activeItemSet[slotTbl.ref]
		end
		if validURL then
			activeSlotRef.pbURL = controls["uri"..str_cnt].buf
		elseif controls["uri"..str_cnt].buf == "" then
			activeSlotRef.pbURL = ""
		end
		local isSearching = controls["priceButton"..str_cnt].label == "Searching..."
		return validURL and not isSearching
	end
	local clampItemIndex = function(index)
		return m_min(m_max(index or 1, 1), self.sortedResultTbl[str_cnt] and #self.sortedResultTbl[str_cnt] or 1)
	end
	controls["changeButton"..str_cnt] = new("ButtonControl", {"TOPLEFT",controls["name"..str_cnt],"TOPLEFT"}, 100 + 8, 0, 80, row_height, "<< Search", function()
		self.itemIndexTbl[str_cnt] = nil
		self.sortedResultTbl[str_cnt] = nil
		self.resultTbl[str_cnt] = nil
		self.totalPrice[str_cnt] = nil
		self.controls.fullPrice.label = "Total Price: " .. self:GetTotalPriceString()
	end)
	controls["changeButton"..str_cnt].shown = function() return self.resultTbl[str_cnt] end
	local dropdownLabels = {}
	for _, sortedResult in ipairs(self.sortedResultTbl[str_cnt] or {}) do
		local item = new("Item", self.resultTbl[str_cnt][sortedResult.index].item_string)
		table.insert(dropdownLabels, colorCodes[item.rarity]..item.name)
	end
	controls["resultDropdown"..str_cnt] = new("DropDownControl", {"TOPLEFT",controls["changeButton"..str_cnt],"TOPRIGHT"}, 8, 0, 325, row_height, dropdownLabels, function(index)
		self.itemIndexTbl[str_cnt] = self.sortedResultTbl[str_cnt][index].index
		self:SetFetchResultReturn(str_cnt, self.itemIndexTbl[str_cnt])
	end)
	controls["resultDropdown"..str_cnt].tooltipFunc = function(tooltip, mode, index, itemId)
			local pb_index = self.sortedResultTbl[str_cnt][index].index
			local item = new("Item", self.resultTbl[str_cnt][pb_index].item_string)
			tooltip:Clear()
			self.itemsTab:AddItemTooltip(tooltip, item, self)
		end
	controls["importButton"..str_cnt] = new("ButtonControl", {"TOPLEFT",controls["resultDropdown"..str_cnt],"TOPRIGHT"}, 8, 0, 100, row_height, "Import Item", function()
		self.itemsTab:CreateDisplayItemFromRaw(self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].item_string)
		local item = self.itemsTab.displayItem
		-- pass "true" to not auto equip it as we will have our own logic
		self.itemsTab:AddDisplayItem(true)
		-- Autoequip it
		local slot = slotTbl.ref and self.itemsTab.sockets[slotTbl.ref] or self.itemsTab.slots[slotTbl.name]
		if slot and slotTbl.name == slot.label and slot:IsShown() and self.itemsTab:IsItemValidForSlot(item, slot.slotName) then
			slot:SetSelItemId(item.id)
			self.itemsTab:PopulateSlots()
			self.itemsTab:AddUndoState()
			self.itemsTab.build.buildFlag = true
		end
	end)
	controls["importButton"..str_cnt].tooltipFunc = function(tooltip)
		tooltip:Clear()
		if self.itemIndexTbl[str_cnt] and self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].item_string then
			-- TODO: item parsing bug caught here.
			-- item.baseName is nil and throws error in the following AddItemTooltip func
			-- if the item is unidentified
			local item = new("Item", self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].item_string)
			self.itemsTab:AddItemTooltip(tooltip, item, nil, true)
		end
	end
	controls["importButton"..str_cnt].enabled = function()
		return self.itemIndexTbl[str_cnt] and self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].item_string ~= nil
	end
	-- Whisper so we can copy to clipboard
	controls["whisperButton"..str_cnt] = new("ButtonControl", {"TOPLEFT",controls["importButton"..str_cnt],"TOPRIGHT"}, 8, 0, 185, row_height, function()
		return self.totalPrice[str_cnt] and "Whisper for " .. self.totalPrice[str_cnt].amount .. " " .. self.totalPrice[str_cnt].currency or "Whisper"
	end, function()
		Copy(self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].whisper)
	end)
	controls["whisperButton"..str_cnt].enabled = function()
		return self.itemIndexTbl[str_cnt] and self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].whisper ~= nil
	end
	controls["whisperButton"..str_cnt].tooltipFunc = function(tooltip)
		tooltip:Clear()
		if self.itemIndexTbl[str_cnt] and self.resultTbl[str_cnt][self.itemIndexTbl[str_cnt]].item_string then
			tooltip.center = true
			tooltip:AddLine(16, "Copies the item purchase whisper to the clipboard")
		end
	end
end

-- Method to update the Total Price string sum of all items
function TradeQueryClass:GetTotalPriceString()
	local text = ""
	local sorted_price = { }
	for _, entry in pairs(self.totalPrice) do
		if sorted_price[entry.currency] then
			sorted_price[entry.currency] = sorted_price[entry.currency] + entry.amount
		else
			sorted_price[entry.currency] = entry.amount
		end
	end
	for currency, value in pairs(sorted_price) do
		text = text .. tostring(value) .. " " .. currency .. ", "
	end
	if text ~= "" then
		text = text:sub(1, -3)
	end
	return text
end
