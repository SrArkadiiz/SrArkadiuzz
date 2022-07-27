if not loadStatFile then
	dofile("statdesc.lua")
end
loadStatFile("stat_descriptions.txt")

function table.containsId(table, element)
  for _, value in pairs(table) do
    if value.Id == element then
      return true
    end
  end
  return false
end

local function writeMods(outName, condFunc)
	local out = io.open(outName, "w")
	out:write('-- This file is automatically generated, do not edit!\n')
	out:write('-- Item data (c) Grinding Gear Games\n\nreturn {\n')
	for mod in dat("Mods"):Rows() do
		if condFunc(mod) then
			if mod.Domain == 16 and string.match(outName, "Item") then
				if mod.SpawnTags[1].Id == "abyss_jewel" and mod.SpawnTags[2].Id == "jewel" and #mod.SpawnTags == 3 then
					print("[Item]: Skipping '" .. mod.Id .. "'")
					goto continue
				end
			elseif mod.Domain == 16 and string.match(outName, "JewelAbyss") then
				if not table.containsId(mod.SpawnTags, "abyss_jewel") then
					print("[Abyss Jewel]: Skipping '" .. mod.Id .. "'")
					goto continue
				end
			elseif mod.Domain == 16 and string.match(outName, "Jewel") then
				if not table.containsId(mod.SpawnTags, "jewel") then
					print("[Jewel]: Skipping '" .. mod.Id .. "'")
					goto continue
				end
			end
			local stats, orders = describeMod(mod)
			if #orders > 0 then
				out:write('\t["', mod.Id, '"] = { ')
				if mod.GenerationType == 1 then
					out:write('type = "Prefix", ')
				elseif mod.GenerationType == 2 then
					out:write('type = "Suffix", ')
				--elseif mod.GenerationType == 3 then
				--	out:write('type = "Synthesis", ')
				elseif mod.GenerationType == 5 then
					out:write('type = "Corrupted", ')
				elseif mod.GenerationType == 24 then
					out:write('type = "ScourgeUpside", ')
				elseif mod.GenerationType == 25 then
					out:write('type = "ScourgeDownside", ')
				elseif mod.GenerationType == 28 then
					out:write('type = "Exarch", ')
				elseif mod.GenerationType == 29 then
					out:write('type = "Eater", ')
				end
				out:write('affix = "', mod.Name, '", ')
				for index, value in pairs(mod.Family) do
					if string.find(value.Id, "LocalDisplayNearbyEnemy") and #stats > index and #orders > index then
						table.remove(stats, index)
						table.remove(orders, index)
						break
					end
 				end
				if string.find(mod.Id, "EldritchImplicitUniquePresence") and #stats > 0 and #orders > 0 then
					for i, stat in ipairs(stats) do
						stats[i] = 	"While a Unique Enemy is in your Presence, ".. stat
					end
				end
				if string.find(mod.Id, "EldritchImplicitPinnaclePresence") and #stats > 0 and #orders > 0 then
					for i, stat in ipairs(stats) do
						stats[i] = "While a Pinnacle Atlas Boss is in your Presence, ".. stat
					end
				end
				out:write('"', table.concat(stats, '", "'), '", ')
				out:write('statOrderKey = "', table.concat(orders, ','), '", ')
				out:write('statOrder = { ', table.concat(orders, ', '), ' }, ')
				out:write('level = ', mod.Level, ', group = "', mod.Type.Id, '", ')
				out:write('weightKey = { ')
				for _, tag in ipairs(mod.SpawnTags) do
					out:write('"', tag.Id, '", ')
				end
				out:write('}, ')
				out:write('weightVal = { ', table.concat(mod.SpawnWeights, ', '), ' }, ')
				out:write('weightMultiplierKey = { ')
				for _, tag in ipairs(mod.GenerationWeightTags) do
					out:write('"', tag.Id, '", ')
				end
				out:write('}, ')
				out:write('weightMultiplierVal = { ', table.concat(mod.GenerationWeightValues, ', '), ' }, ')
				if mod.Tags[1] then
					out:write('tags = { ')
					for _, tag in ipairs(mod.Tags) do
						out:write('"', tag.Id, '", ')
					end
					out:write('}, ')
				end
				out:write('modTags = { ', stats.modTags, ' }, ')
				out:write('},\n')
			else
				print("Mod '"..mod.Id.."' has no stats")
			end
		end
		::continue::
	end
	out:write('}')
	out:close()
end

writeMods("../Data/ModItem.lua", function(mod)
	return (mod.Domain == 1 or mod.Domain == 16)
			and (mod.GenerationType == 1 or mod.GenerationType == 2 or mod.GenerationType == 5 or mod.GenerationType == 25 or mod.GenerationType == 24
			or mod.GenerationType == 28 or mod.GenerationType == 29) -- Eldritch Implicits
			and not mod.Id:match("^Hellscape[UpDown]+sideMap") -- Exclude Scourge map mods
			and #mod.AuraFlags == 0
end)
writeMods("../Data/ModFlask.lua", function(mod)
	return mod.Domain == 2 and (mod.GenerationType == 1 or mod.GenerationType == 2)
end)
writeMods("../Data/ModJewel.lua", function(mod)
	return (mod.Domain == 10 or mod.Domain == 16) and (mod.GenerationType == 1 or mod.GenerationType == 2 or mod.GenerationType == 5)
end)
writeMods("../Data/ModJewelAbyss.lua", function(mod)
	return (mod.Domain == 13 or mod.Domain == 16) and (mod.GenerationType == 1 or mod.GenerationType == 2 or mod.GenerationType == 5)
end)
writeMods("../Data/ModJewelCluster.lua", function(mod)
	return (mod.Domain == 21 and (mod.GenerationType == 1 or mod.GenerationType == 2)) or (mod.Domain == 10 and mod.GenerationType == 5)
end)
writeMods("../Data/Uniques/Special/WatchersEye.lua", function(mod)
	return mod.Family[1].Id == "AuraBonus" and mod.GenerationType == 3 and not mod.Id:match("^Synthesis")
end)
writeMods("../Data/ModVeiled.lua", function(mod)
	return mod.Domain == 28 and (mod.GenerationType == 1 or mod.GenerationType == 2)
end)


print("Mods exported.")
