--
-- export skill costs data
--

local out = io.open("../Data/Costs.lua", "w")
out:write('-- This file is automatically generated, do not edit!\n')
out:write('-- Skill costs data (c) Grinding Gear Games\n\n')
out:write('return {\n')

local costSize = 0
for c in dat("CostTypes"):Rows() do
	costSize = costSize + 1
	out:write('\t[', c._rowIndex, '] = {\n')
	out:write('\t\tResource = "', tostring(c.Resource), '",\n')
	out:write('\t\tStat = ', c.Stat and ('"'..tostring(c.Stat.Id)..'"') or tostring(c.Stat), ',\n')
	out:write('\t\tResourceString = "', tostring(c.ResourceString), '",\n')
	out:write('\t\tDivisor = ', c.Divisor, ',\n')
	out:write('\t},\n')
end

-- special case for soul cost
do
	out:write('\t[', costSize + 1, '] = {\n')
	out:write('\t\tResource = "', "Soul", '",\n')
	out:write('\t\tStat = ', '" "', ',\n')
	out:write('\t\tResourceString = "', "{0} Souls", '",\n')
	out:write('\t\tDivisor = ', tostring(1), ',\n')
	out:write('\t}\n')
end

out:write('}\n')
out:close()

print("Skill costs data exported.")
