--local out = io.open("../Data/BossSkills.lua", "w")
--out:write('-- This file is automatically generated, do not edit!\n')
--out:write('-- Boss Skill data (c) Grinding Gear Games\n\nreturn {\n')
--out:write('}')
--out:close()

local m_ceil = math.ceil
local m_min = math.min
local m_max = math.max

local rarityDamageMult = {
	--Unique = (1 + dat("Mods"):GetRow("Id", "MonsterUnique5").Stat1Value[1] / 100) * (1 - dat("Mods"):GetRow("Id", "MonsterUnique8").Stat1Value[1] / 100)
}

local directiveTable = {}

-- #boss [<Display name>] <MonsterId> <earlierUber>
-- Initialises the boss
directiveTable.boss = function(state, args, out)
	local displayName, monsterId, earlierUber = args:match("(%w+) (.+) (%w+)")
	if not displayName then
		displayName = args
		monsterId = args
	end
	local bossData = dat("MonsterVarieties"):GetRow("Id", monsterId)
	state.boss = { displayName = displayName, damageRange = bossData.Type.DamageSpread, damageMult = bossData.DamageMultiplier, critChance = m_ceil(bossData.CriticalStrikeChance / 100) }
	if earlierUber == "true" then
		state.boss.earlierUber = true
	end
	for _, mod in ipairs(bossData.Mods) do
		if mod.Id == "MonsterMapBoss" then
			state.boss.rarity = "Unique"
			break
		end
	end
end

-- #skill [<Display name>] <GrantedEffectId> <GrantedEffectId2>
-- Initialises the skill data and emits the skill header
directiveTable.skill = function(state, args, out)
	local displayName, grantedId, grantedId2 = args:match("(%w+) (%w+) (%w+)")
	if not grantedId then
		displayName, grantedId = args:match("(%w+) (%w+)")
	end
	local DamageType = "Melee"
	local skillData = dat("GrantedEffects"):GetRow("Id", grantedId)
	for _, skillType in ipairs(skillData.ActiveSkill.SkillTypes) do
		if skillType.Id == "Spell" then
			if DamageType == "Projectile" then
				DamageType = "SpellProjectile"
			else
				DamageType = "Spell"
			end
		elseif skillType.Id  == "Projectile" then
			if DamageType == "Spell" then
				DamageType = "SpellProjectile"
			else
				DamageType = "Projectile"
			end
		end
	end
	local GrantedEffectStatSets = dat("GrantedEffectStatSets"):GetRow("Id", grantedId)
	local statsPerLevel = dat("GrantedEffectStatSetsPerLevel"):GetRowList("GrantedEffect", skillData)
	if DamageType == "Melee" then
		for _, implicitStat in ipairs(GrantedEffectStatSets.ImplicitStats) do
			if implicitStat.Id  == "base_is_projectile" then
				DamageType = "Projectile"
				break
			end
		end
	end
	state.skill = { displayName = displayName, DamageType = DamageType, GrantedEffectStatSets = GrantedEffectStatSets, statsPerLevel = statsPerLevel }
	if grantedId2 then
		state.skill.statsPerLevel2 = dat("GrantedEffectStatSetsPerLevel"):GetRowList("GrantedEffect", dat("GrantedEffects"):GetRow("Id", grantedId2))
	end
	out:write('	["', state.boss.displayName, " ", displayName, '"] = {\n')
end

-- #skillData <SkillExtraDamageMult> <SkillUberDamageMult> <speed> <critChance> 
-- <PhysDamageMult> <PhysDamageRange> <LightningDamageMult> ... <ChaosDamageMult> <ChaosDamageRange>
-- Emits the skill modifiers
directiveTable.skillData = function(state, args, out)
	local DamageData = {}
	local SkillExtraDamageMult, SkillUberDamageMult, speed, critChance
	SkillExtraDamageMult, SkillUberDamageMult, speed, critChance = args:match("(%d+) (%d+) (%d+) (%d+)")
	if args:match("phys") then
		DamageData["PhysDamageMult"], DamageData["PhysDamageRange"] = args:match("phys{(%d+) (%d+)}")
	else
		DamageData["PhysDamageMult"], DamageData["PhysDamageRange"] =  0, 0
	end
	if args:match("lightning") then
		DamageData["LightningDamageMult"], DamageData["LightningDamageRange"] = args:match("lightning{(%d+) (%d+)}")
	else
		DamageData["LightningDamageMult"], DamageData["LightningDamageRange"] = 0, 0
	end
	if args:match("cold") then
		DamageData["ColdDamageMult"], DamageData["ColdDamageRange"] = args:match("cold{(%d+) (%d+)}")
	else
		DamageData["ColdDamageMult"], DamageData["ColdDamageRange"] = 0, 0
	end
	if args:match("fire") then
		DamageData["FireDamageMult"], DamageData["FireDamageRange"] = args:match("fire{(%d+) (%d+)}")
	else
		DamageData["FireDamageMult"], DamageData["FireDamageRange"] = 0, 0
	end
	if args:match("chaos") then
		DamageData["ChaosDamageMult"], DamageData["ChaosDamageRange"] = args:match("chaos{(%d+) (%d+)}")
	else
		DamageData["ChaosDamageMult"], DamageData["ChaosDamageRange"] = 0, 0
	end
	DamageData["PhysOverwhelm"], DamageData["PhysUberOverwhelm"], DamageData["PhysToLightning"], DamageData["PhysToCold"], DamageData["PhysToFire"], DamageData["PhysToChaos"], DamageData["LightningPen"], DamageData["LightningUberPen"], DamageData["ColdPen"], DamageData["ColdUberPen"], DamageData["FirePen"], DamageData["FireUberPen"], DamageData["ChaosPen"], DamageData["ChaosUberPen"] = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	local skill = state.skill
	for i, constStat in ipairs(skill.GrantedEffectStatSets.ConstantStats) do
		if constStat.Id == "skill_physical_damage_%_to_convert_to_lightning" then
			DamageData["PhysToLightning"] = skill.GrantedEffectStatSets.ConstantStatsValues[i]
		elseif constStat.Id == "skill_physical_damage_%_to_convert_to_cold" then
			DamageData["PhysToCold"] = skill.GrantedEffectStatSets.ConstantStatsValues[i]
		elseif constStat.Id == "skill_physical_damage_%_to_convert_to_fire" then
			DamageData["PhysToFire"] = skill.GrantedEffectStatSets.ConstantStatsValues[i]
		elseif constStat.Id == "skill_physical_damage_%_to_convert_to_chaos" then
			DamageData["PhysToChaos"] = skill.GrantedEffectStatSets.ConstantStatsValues[i]
		end
	end
	for level, statsPerLevel in ipairs(skill.statsPerLevel) do
		for i, additonalStat in ipairs(statsPerLevel.AdditionalStats) do
			if additonalStat.Id == "base_reduce_enemy_lightning_resistance_%" then
				DamageData["Lightning"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_cold_resistance_%" then
				DamageData["Cold"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_fire_resistance_%" then
				DamageData["Fire"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_chaos_resistance_%" then
				DamageData["Chaos"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
			end
		end
	end
	local boss = state.boss
	if boss.earlierUber then
		local statsPerLevel = skill.statsPerLevel2[2]
		for i, additonalStat in ipairs(statsPerLevel.AdditionalStats) do
			if additonalStat.Id == "base_reduce_enemy_lightning_resistance_%" then
				DamageData["LightningUberPen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_cold_resistance_%" then
				DamageData["ColdUberPen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_fire_resistance_%" then
				DamageData["FireUberPen"] = statsPerLevel.AdditionalStatsValues[i]
			elseif additonalStat.Id == "base_reduce_enemy_chaos_resistance_%" then
				DamageData["ChaosUberPen"] = statsPerLevel.AdditionalStatsValues[i]
			end
		end
	elseif skill.statsPerLevel2 then 
		for level, statsPerLevel in ipairs(skill.statsPerLevel2) do
			for i, additonalStat in ipairs(statsPerLevel.AdditionalStats) do
				if additonalStat.Id == "base_reduce_enemy_lightning_resistance_%" then
					DamageData["Lightning"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
				elseif additonalStat.Id == "base_reduce_enemy_cold_resistance_%" then
					DamageData["Cold"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
				elseif additonalStat.Id == "base_reduce_enemy_fire_resistance_%" then
					DamageData["Fire"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
				elseif additonalStat.Id == "base_reduce_enemy_chaos_resistance_%" then
					DamageData["Chaos"..(level > 1 and "Uber" or "").."Pen"] = statsPerLevel.AdditionalStatsValues[i]
				end
			end
		end
	end
	-- cleanup/precompute some data
	for ind, val in pairs(DamageData) do
		DamageData[ind] = tonumber(val)
	end
	DamageData["PhysOverwhelm"] = (DamageData["PhysOverwhelm"] == 0) and (DamageData["PhysUberOverwhelm"] ~= 0 and "" or DamageData["PhysOverwhelm"]) or DamageData["PhysOverwhelm"]
	for _, damageType in ipairs({"Lightning", "Cold", "Fire"}) do
		DamageData[damageType.."Pen"] = (DamageData[damageType.."Pen"] == 0) and (DamageData[damageType.."UberPen"] ~= 0 and "" or DamageData[damageType.."Pen"]) or DamageData[damageType.."Pen"]
	end
	SkillExtraDamageMult = SkillExtraDamageMult == "0" and 1 or  SkillExtraDamageMult / 100
	speed = (speed == "700") and 0 or tonumber(speed)
	critChance = (critChance == "0") and ((boss.critChance ~= 5) and boss.critChance or 0) or ((critChance == "500") and 0 or m_ceil(critChance / 100))
	-- output
	if skill.DamageType then
		out:write('		DamageType = "', skill.DamageType,'",\n')
	end
	if DamageData.PhysDamageMult == 0 and DamageData.LightningDamageMult == 0 and DamageData.ColdDamageMult == 0 and DamageData.FireDamageMult == 0 and DamageData.ChaosDamageMult == 0 then
		print("error skill: "..skill.displayName.." has no damage")
	end
	out:write('		DamageMultipliers = {\n')
	local dCount = 0
	local physConversions = { 1, 0, 0, 0, 0 }
	if DamageData.PhysDamageMult ~= 0 then
		local totalConversions = DamageData.PhysToLightning + DamageData.PhysToCold + DamageData.PhysToFire + DamageData.PhysToChaos
		physConversions = { m_max(1 - totalConversions / 100, 0), DamageData.PhysToLightning / m_max(totalConversions, 100), DamageData.PhysToCold / m_max(totalConversions, 100), DamageData.PhysToFire / m_max(totalConversions, 100), DamageData.PhysToChaos / m_max(totalConversions, 100) }
	end
	if DamageData.PhysDamageMult ~= 0 and physConversions[1] ~= 0 then
		dCount = dCount + 1
		local damageRange = (DamageData.PhysDamageRange == 0) and (boss.damageRange / 100) or DamageData.PhysDamageRange / 100
		local calcedMult = DamageData.PhysDamageMult / 1000 * physConversions[1] * SkillExtraDamageMult * boss.damageMult / 100 * (rarityDamageMult[boss.rarity] or 1)
		local MultMin, MultMax =  calcedMult * ( 1 - damageRange ), calcedMult * damageRange * 2 / 100
		out:write('			Physical = { ', MultMin, ', ', MultMax, ' }')
	else
		DamageData["PhysOverwhelm"] = 0
	end
	for i, damageType in ipairs({"Lightning", "Cold", "Fire", "Chaos"}) do
		if DamageData[damageType.."DamageMult"] ~= 0 or physConversions[i + 1] ~= 0 then
			dCount = dCount + 1
			local damageRange = (DamageData[damageType.."DamageRange"] == 0) and (boss.damageRange / 100) or DamageData[damageType.."DamageRange"] / 100
			local calcedMult = (DamageData[damageType.."DamageMult"] / 1000 + DamageData.PhysDamageMult / 1000 * physConversions[i + 1]) * SkillExtraDamageMult * boss.damageMult / 100 * (rarityDamageMult[boss.rarity] or 1)
			local MultMin, MultMax =  calcedMult * ( 1 - damageRange ), calcedMult * damageRange * 2 / 100
			out:write(dCount > 1 and ',\n' or '', '			', damageType, ' = { ', MultMin, ', ', MultMax, ' }')
		else
			DamageData[damageType.."Pen"] = 0
			DamageData[damageType.."UberPen"] = 0
		end
	end
	out:write('\n		}')
	if SkillUberDamageMult ~= "0" then
		out:write(',\n		UberDamageMultiplier = ', (1 + SkillUberDamageMult / 100))
	end
	if DamageData["PhysOverwhelm"] ~= 0 or DamageData["LightningPen"] ~= 0 or DamageData["ColdPen"] ~= 0 or DamageData["FirePen"] ~= 0 then
		out:write(',\n		DamagePenetrations = {\n')
		dCount = 0
		for i, penType in ipairs({"PhysOverwhelm", "LightningPen", "ColdPen", "FirePen"}) do
			if DamageData[penType] ~= 0 then
				dCount = dCount + 1
				out:write(dCount > 1 and ',\n' or '', '			', penType, ' = ', (DamageData[penType] == "" and '""' or DamageData[penType]))
			end
		end
		out:write('\n		}')
		if DamageData["PhysUberOverwhelm"] ~= 0 or DamageData["LightningUberPen"] ~= 0 or DamageData["ColdUberPen"] ~= 0 or DamageData["FireUberPen"] ~= 0 then
			out:write(',\n		UberDamagePenetrations = {\n')
			dCount = 0
			for i, penType in ipairs({"PhysUberOverwhelm", "LightningUberPen", "ColdUberPen", "FireUberPen"}) do
				if DamageData[penType] ~= 0 then
					dCount = dCount + 1
					out:write(dCount > 1 and ',\n' or '', '			', penType:gsub("Uber", ""), ' = ', DamageData[penType])
				end
			end
			out:write('\n		}')
		end
	end
	if speed ~= 0 then
		out:write(',\n		speed = ', speed)
	end
	if critChance ~= 0 then
		if critChance == 1000 then
			out:write(',\n		critChance = 0')
		else
			out:write(',\n		critChance = ', critChance)
		end
	end
	if boss.earlierUber then
		out:write(',\n		earlierUber = true')
	end
end

 -- #tooltip
 directiveTable.tooltip = function(state, args, out)
	if args then
		out:write(',\n		tooltip = ', args,'\n')
	end
	out:write('	},\n')
	state.skill = nil
end

processTemplateFile("bossSkills", "", "../Data/", directiveTable)

print("Boss skill data exported.")
