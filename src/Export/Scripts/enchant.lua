if not loadStatFile then
	dofile("statdesc.lua")
end
loadStatFile("stat_descriptions.txt")

local lab = {
	[32] = "NORMAL",
	[53] = "CRUEL",
	[66] = "MERCILESS",
	[75] = "ENDGAME",
	[83] = "DEDICATION",
}
local sourceOrder = { "NORMAL", "CRUEL", "MERCILESS", "ENDGAME", "DEDICATION", "ENKINDLING", "INSTILLING", "HARVEST", "HEIST" }

local function doLabEnchantment(fileName, group)
	local byDiff = { }
	for _, mod in ipairs(dat("Mods"):GetRowList("GenerationType", 10)) do
		if mod.Family[1].Id == group and mod.SpawnWeights[1] > 0 then
			local stats, orders = describeMod(mod)
			local diff = lab[mod.Level]
			byDiff[diff] = byDiff[diff] or { }
			table.insert(byDiff[diff], stats)
		end
	end
	local out = io.open(fileName, "w")
	out:write('-- This file is automatically generated, do not edit!\n')
	out:write('-- Item data (c) Grinding Gear Games\n\nreturn {\n')
	for _, diff in ipairs(sourceOrder) do
		if byDiff[diff] then
			out:write('\t["'..diff..'"] = {\n')
			for _, stats in ipairs(byDiff[diff]) do
				out:write('\t\t"'..table.concat(stats, '/')..'",\n')
			end
			out:write('\t},\n')
		end
	end
	out:write('}')
	out:close()
end

doLabEnchantment("../Data/EnchantmentBoots.lua", "ConditionalBuffEnchantment")
doLabEnchantment("../Data/EnchantmentGloves.lua", "TriggerEnchantment")
doLabEnchantment("../Data/EnchantmentBelt.lua", "BuffEnchantment")

local function doOtherEnchantment(fileName, groupsList)
	local byDiff = { }
	for generation in pairs(groupsList) do
		for _, mod in ipairs(dat("Mods"):GetRowList("GenerationType", generation)) do
			if groupsList[generation][mod.Family[1].Id] then
				local stats, orders = describeMod(mod)
				local diff = groupsList[generation][mod.Family[1].Id]
				byDiff[diff] = byDiff[diff] or { }
				table.insert(byDiff[diff], stats)
			end
		end
	end
	local out = io.open(fileName, "w")
	out:write('-- This file is automatically generated, do not edit!\n')
	out:write('-- Item data (c) Grinding Gear Games\n\nreturn {\n')
	for _, diff in ipairs(sourceOrder) do
		if byDiff[diff] then
			out:write('\t["'..diff..'"] = {\n')
			for _, stats in ipairs(byDiff[diff]) do
				out:write('\t\t"'..table.concat(stats, '/')..'",\n')
			end
			out:write('\t},\n')
		end
	end
	out:write('}')
	out:close()
end

-- Harvest flask enchants stat descriptions don't read properly yet
doOtherEnchantment("../Data/EnchantmentFlask.lua", { --[3] = { ["FlaskEnchantment"] = "HARVEST" },
	[21] = { ["FlaskEnchantment"] = "ENKINDLING" },
	[22] = { ["FlaskEnchantment"] = "INSTILLING" } })
doOtherEnchantment("../Data/EnchantmentBody.lua", { [3] = { ["AlternateArmourQuality"] = "HARVEST", ["EnchantmentHeistArmour"] = "HEIST" } })
doOtherEnchantment("../Data/EnchantmentWeapon.lua", { [3] = { ["AlternateWeaponQuality"] = "HARVEST", ["EnchantmentHeistWeapon"] = "HEIST" } })

local skillMap = {
	["Summone?d?RagingSpirit"] = "Summon Raging Spirit",
	["SpiritOffering"] = "Spirit Offering",
	["Discharge"] = "Discharge",
	["AncestorTotem[^S][^l]"] = "Ancestral Protector",
	["AncestorTotemSlamMelee"] = "Ancestral Warchief",
	["AnimateGuardian"] = "Animate Guardian",
	["AnimateWeapon"] = "Animate Weapon",
	["BlinkArrow"] = "Blink Arrow",
	["ConversionTrap"] = "Conversion Trap",
	["MirrorArrow"] = "Mirror Arrow",
	["Spectre"] = "Raise Spectre",
	["Zombie"] = "Raise Zombie",
	["ChaosGolem"] = "Summon Chaos Golem",
	["FlameGolem"] = "Summon Flame Golem",
	["IceGolem"] = "Summon Ice Golem",
	["LightningGolem"] = "Summon Lightning Golem",
	["StoneGolem"] = "Summon Stone Golem",
	["Skeleton"] = "Summon Skeletons",
	["Bladefall"] = "Bladefall",
	["BlastRain"] = "Blast Rain",
	["ChargedAttack"] = "Blade Flurry",
	["Desecrate"] = "Desecrate",
	["DetonateDead"] = "Detonate Dead",
	["DevouringTotem"] = "Devouring Totem",
	["DominatingBlow"] = "Dominating Blow",
	["FireBeam"] = "Scorching Ray",
	["Firestorm"] = "Firestorm",
	["FreezeMine"] = "Freeze Mine",
	["EnchantmentFrenzy"] = "Frenzy",
	["GroundSlam"] = "Ground Slam",
	["HeavyStrike"] = "Heavy Strike",
	["IceSpear"] = "Ice Spear",
	["ImmortalCall"] = "Immortal Call",
	["Incinerate"] = "Incinerate",
	["KineticBlast"] = "Kinetic Blast",
	["LightningArrow"] = "Lightning Arrow",
	["ChargedDash"] = "Charged Dash",
	["PhaseRun"] = "Phase Run",
	["Puncture"] = "Puncture",
	["RejuvinationTotem"] = "Rejuvenation Totem",
	["ShockNova"] = "Shock Nova",
	["SpectralThrow"] = "Spectral Throw",
	["TectonicSlam"] = "Tectonic Slam",
	["VolatileDead"] = "Volatile Dead",
	["BoneLance"] = "Unearth",
	["CorpseEruption"] = "Cremation",
	["PowerSiphon"] = "Power Siphon",
	["Smite"] = "Smite",
	["ConsecratedPath"] = "Consecrated Path",
	["ScourgeArrow"] = "Scourge Arrow",
	["HolyRelic"] = "Summon Holy Relic",
	["HeraldOfAgony"] = "Herald of Agony",
	["HeraldOfPurity"] = "Herald of Purity",
	["Bane"] = "Bane",
	["DivineIre"] = "Divine Ire",
	["PurifyingFlame"] = "Purifying Flame",
	["Soulrend"] = "Soulrend",
	["StormBurst"] = "Storm Burst",
	["CarrionGolem"] = "Summon Carrion Golem",
	["Steelskin"] = "Steelskin",
	["[^d]Dash"] = "Dash",
	["Bladestorm"] = "Bladestorm",
	["Perforate"] = "Perforate",
	["Frostblink"] = "Frostblink",
	["ChainHook"] = "Chain Hook",
	["Berserk"] = "Berserk",
	["WitheringStep"] = "Withering Step",
	["SnappingAdder"] = "Venom Gyre",
	["PlagueBearer"] = "Plague Bearer",
	["SummonSkitterbots"] = "Summon Skitterbots",
	["ArtilleryBallista"] = "Artillery Ballista",
	["ArcaneCloak"] = "Arcane Cloak",
	["KineticBolt"] = "Kinetic Bolt",
	["BladeBlast"] = "Blade Blast",
	["RuneBlast"] = "Stormbind",
	["Spellslinger"] = "Spellslinger",
	["AncestralCry"] = "Ancestral Cry",
	["EnduringCry"] = "Enduring Cry",
	["SeismicCry"] = "Seismic Cry",
	["Sunder"] = "Sunder",
	["Earthshatter"] = "Earthshatter",
	["ArcanistBrand"] = "Arcanist Brand",
	["BlazingSalvo"] = "Blazing Salvo",
	["Anger"] = "Anger",
	["Clarity"] = "Clarity",
	["Determination"] = "Determination",
	["Discipline"] = "Discipline",
	["Grace"] = "Grace",
	["Haste"] = "Haste",
	["Hatred"] = "Hatred",
	["Malevolence"] = "Malevolence",
	["Precision"] = "Precision",
	["Pride"] = "Pride",
	["Vitality"] = "Vitality",
	["Wrath"] = "Wrath",
	["Zealotry"] = "Zealotry",
	["PurityOfElements"] = "Purity of Elements",
	["PurityOfFire"] = "Purity of Fire",
	["PurityOfIce"] = "Purity of Ice",
	["PurityOfLightning"] = "Purity of Lightning",
	["MortarBarrageMine"] = "Pyroclast Mine",
	["ColdProjectileMine"] = "Icicle Mine",
	["LightningExplosionMine"] = "Stormblast Mine",
	["FleshAndStone"] = "Flesh and Stone",
	["DreadBanner"] = "Dread Banner",
	["WarBanner"] = "War Banner",
	["FrostShield"] = "Frost Shield",
	["VoidSphere"] = "Void Sphere",
	["CracklingLance"] = "Crackling Lance",
	["SigilOfPower"] = "Sigil of Power",
	["Hexblast"] = "Hexblast",
	["FlameWall"] = "Flame Wall",
	["WaterSphere"] = "Hydrosphere",
	["CorruptingFever"] = "Corrupting Fever",
	["Bloodreap"] = "Reap",
	["BladeTrap"] = "Blade Trap",
	["EyeOfWinter"] = "Eye of Winter",
	["StormRain"] = "Storm Rain",
	["RageVortex"] = "Rage Vortex",
	["ShieldCrush"] = "Shield Crush",
	["SummonedReaper"] = "Summon Reaper",
	["Boneshatter"] = "Boneshatter",
	["SpectralHelix"] = "Spectral Helix",
	["DefianceBanner"] = "Defiance Banner",
	["EnergyBlade"] = "Energy Blade",
	["Tornado"] = "Tornado",
	["TornadoShot"] = "Tornado Shot",
	["VolcanicFissure"] = "Volcanic Fissure",
}

local bySkill = { }
for _, mod in ipairs(dat("Mods"):GetRowList("GenerationType", 10)) do
	if mod.Family[1].Id == "SkillEnchantment" and mod.SpawnWeights[1] > 0 then
		local stats = { mod.Stat1, mod.Stat2, mod.Stat3, mod.Stat4, mod.Stat5, mod.Stat6 }
		local skill
		for _, stat in pairs(stats) do
			for _, activeSkill in ipairs(dat("ActiveSkills"):GetRowList("SkillSpecificStat", stat)) do
				local isVaal = false
				for _, skillType in ipairs(activeSkill.SkillTypes) do
					if skillType == 39 then
						isVaal = true
						break
					end
				end
				if not isVaal and activeSkill.DisplayName ~= "" then
					skill = activeSkill.DisplayName
					break
				end
			end
		end
		if not skill then
			for id, name in pairs(skillMap) do
				if mod.Id:match(id) then
					skill = name
					break
				end
			end
		end
		local stats, orders = describeMod(mod)
		if not skill or not stats[1] then
			printf("%s\n%s", mod.Id, stats[1])
		else
			bySkill[skill] = bySkill[skill] or { }
			local diff = lab[mod.Level]
			bySkill[skill][diff] = bySkill[skill][diff] or { }
			table.insert(bySkill[skill][diff], stats)
		end
	end
end
local skillOrder = { }
for skill in pairs(bySkill) do
	table.insert(skillOrder, skill)
end
table.sort(skillOrder)
local out = io.open("../Data/EnchantmentHelmet.lua", "w")
out:write('-- This file is automatically generated, do not edit!\n')
out:write('-- Item data (c) Grinding Gear Games\n\nreturn {\n')
for _, skill in pairs(skillOrder) do
	out:write('\t["'..skill..'"] = {\n')
	for _, diff in ipairs(sourceOrder) do
		if bySkill[skill][diff] then
			out:write('\t\t["'..diff..'"] = {\n')
			for _, stats in ipairs(bySkill[skill][diff]) do
				out:write('\t\t\t"'..table.concat(stats, '/')..'",\n')
			end
			out:write('\t\t},\n')
		end
	end
	out:write('\t},\n')
end
out:write('}')
out:close()

print("Enchantments exported.")
