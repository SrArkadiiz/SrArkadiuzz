if not loadStatFile then
	dofile("statdesc.lua")
end
loadStatFile("stat_descriptions.txt")

local out = io.open("../Data/TattooPassives.lua", "w")

local stats = dat("Stats")
local alternatePassiveSkillDat = dat("passiveskilloverrides")
local alternatePassiveSkillTattoosDat = dat("passiveskilltattoos")

local tattoo_PASSIVE_GROUP = 1e9

---@type fun(thing:string|table|number):string
function stringify(thing)
	if type(thing) == 'string' then
		return thing
	elseif type(thing) == 'number' then
		return ""..thing;
	elseif type(thing) == 'table' then
		local s = "{";
		for k,v in pairs(thing) do
			s = s.."\n\t"
			if type(k) == 'number' then
				s = s.."["..k.."] = "
			else
				s = s.."[\""..k.."\"] = "
			end
			if type(v) == 'string' then
				s = s.."\""..stringify(v).."\", "
			else
				if type(v) == "boolean" then
					v = v and "true" or "false"
				end
				val = stringify(v)..", "
				if type(v) == "table" then
					val = string.gsub(val, "\n", "\n\t")
				end
				s = s..val;
			end
		end
		return s.."\n}"
	end
end

function parseStats(datFileRow, tattooPassive)
	local descOrders = {}
	for idx,statKey in pairs(datFileRow.StatsKeys) do
		local refRow = type(statKey) == "number" and statKey + 1 or statKey._rowIndex
		local statId = stats:ReadCell(refRow, 1)
		local range = datFileRow["StatValues"]

		local stat = {}
		stat[statId] = {
			["min"] = range[1],
			["max"] = range[2] or range[1],
			["index"] = idx
		}
		-- Describing stats here to get the orders
		print(statId or "nil")
		prettyPrintTable(range)
		local statLines, orders = describeStats(stat)
		prettyPrintTable(orders)
		stat[statId].statOrder = orders[1]
		tattooPassive.stats[statId] = stat[statId]
		for i, line in ipairs(statLines) do
			table.insert(tattooPassive.sd, line)
			descOrders[line] = orders[i]
		end
	end
	-- Have to re-sort since we described the stats earlier
	table.sort(tattooPassive.sd, function(a, b) return descOrders[a] < descOrders[b] end)
	local sortedStats = {}
	for stat in pairs(tattooPassive.stats) do
		table.insert(sortedStats, stat)
	end
	-- Finally get what we want, sorted stats by order
	table.sort(sortedStats, function(a, b) return (tattooPassive.stats[a].statOrder or 0) < (tattooPassive.stats[b].statOrder or 0) end)
	tattooPassive.sortedStats = sortedStats
end

---@type table <string, table> @this is the structure used to generate the final data file Data/TattooPassives
local data = { }
data.nodes = { }
data.groups = { }

for i=1, alternatePassiveSkillDat.rowCount do
	---@type table<string, boolean|string|number>
	local datFileRow = {}
	for j=1,#alternatePassiveSkillDat.cols-1 do
		local key = alternatePassiveSkillDat.spec[j].name
		datFileRow[key] = alternatePassiveSkillDat:ReadCell(i, j)
	end

	local tattooDatRow = {}
	for j=1, #alternatePassiveSkillTattoosDat.cols-1 do
		local key = alternatePassiveSkillTattoosDat.spec[j].name
		tattooDatRow[key] = alternatePassiveSkillTattoosDat:ReadCell(i,j)
	end
	---@type table<string, boolean|string|number|table>
	local tattooPassiveNode = {}
	-- id
	tattooPassiveNode.id = datFileRow.Id
	-- icon
	tattooPassiveNode.icon = datFileRow.DDSIcon
	-- node name
	tattooPassiveNode.dn = datFileRow.Name
	-- display text
	tattooPassiveNode.sd = {}
	tattooPassiveNode.stats = {}
	tattooPassiveNode.isTattoo = true

	tattooPassiveNode.targetType = tattooDatRow.NodeTarget.Type
	tattooPassiveNode.targetValue = tattooDatRow.NodeTarget.Value

	parseStats(datFileRow, tattooPassiveNode)

	data.nodes[datFileRow.Id] = tattooPassiveNode
end

data.groups[tattoo_PASSIVE_GROUP] = {
    ["x"] = -6500,
    ["y"] = -6500,
    ["oo"] = {},
    ["n"] = {}
}

for k,v in pairs(data.nodes) do
	table.insert(data.groups[tattoo_PASSIVE_GROUP].n, k)
end

str = stringify(data)

out:write("-- This file is automatically generated, do not edit!\n-- Item data (c) Grinding Gear Games\n\n")
out:write("return "..str)
out:close()

print("tattoo passives exported.")
