--
-- export The Pantheon data
--

local function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

local function zip(a, b)
    local zipped = { }
	for i, _ in pairs(a) do
		table.insert(zipped, { a[i], tostring(b[i]) })
    end
	return zipped
end

if not loadStatFile then
	dofile("statdesc.lua")
end
loadStatFile("stat_descriptions.txt")

local out = io.open("../Data/3_0/Pantheons.lua", "w")
out:write('-- This file is automatically generated, do not edit!\n')
out:write('-- The Pantheon data (c) Grinding Gear Games\n\n')
out:write('return {\n')

for i, p in pairs(dat"PantheonPanelLayout":GetRowList("IsDisabled", false)) do
    out:write('\t["', p.Id, '"] = {\n')
    out:write('\t\tisMajorGod = ', tostring(p.IsMajorGod), ',\n')
    out:write('\t\tsouls = {\n')

    local gods = {
        { name = p.GodName1, statKeys = dat"PantheonPanelLayout":ReadCellText(p._rowIndex, 8), values = p.Effect1_Values },
    	{ name = p.GodName2, statKeys = dat"PantheonPanelLayout":ReadCellText(p._rowIndex,10), values = p.Effect2_Values },
    	{ name = p.GodName3, statKeys = dat"PantheonPanelLayout":ReadCellText(p._rowIndex,13), values = p.Effect3_Values },
    	{ name = p.GodName4, statKeys = dat"PantheonPanelLayout":ReadCellText(p._rowIndex,15), values = p.Effect4_Values },
    }
    for i, god in pairs(gods) do
        if next(god.statKeys) then
            out:write('\t\t\t[', i, '] = { ')
            out:write('name = "', god.name, '",\n')
            out:write('\t\t\t\tmods = {\n')
            for j, souls in pairs(zip(god.statKeys, god.values)) do
                local key = souls[1]
                local value = tonumber(souls[2])
                local stats = { }
                stats[key] = { min = value, max = value }
                out:write('\t\t\t\t\t-- ', key, '\n')
                out:write('\t\t\t\t\t[', j, '] = { line = "', table.concat(describeStats(stats), ' '), '", ')
                out:write('value = { ', value, ' }, ')
                out:write('},\n')

            end
            out:write('\t\t\t\t},\n')
            out:write('\t\t\t},\n')
        end
    end
    
    out:write('\t\t},\n')
    out:write('\t},\n')
end

out:write('}')
out:close()

print("Pantheon data exported.")