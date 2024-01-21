-- This file is automatically generated, do not edit!
-- Path of Building
--
-- Minion Data
-- Monster data (c) Grinding Gear Games
--
local minions, mod = ...

minions["RaisedZombie"] = {
	name = "Raised Zombie",
	monsterCategory = "Undead",
	life = 3.75,
	armour = 0.7,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.65,
	damageSpread = 0.4,
	attackTime = 1.17,
	attackRange = 11,
	accuracy = 3.4,
	limit = "ActiveZombieLimit",
	skillList = {
		"Melee",
		"ZombieSlam",
		"GAZombieCorpseGroundImpact",
	},
	modList = {
		mod("Armour", "INC", 40, 0, 0), -- MonsterImplicitDamageReduction1 [physical_damage_reduction_rating_+% = 40]
		mod("StunThreshold", "INC", 30, 0, 0), -- RaiseZombieStunThreshold [stun_threshold_+% = 30]
	},
}

minions["SummonedChaosGolem"] = {
	name = "Chaos Golem",
	monsterCategory = "Construct",
	life = 6.9,
	energyShield = 0.2,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 60,
	damage = 2.9,
	damageSpread = 0.2,
	attackTime = 1,
	attackRange = 8,
	accuracy = 3.4,
	limit = "ActiveGolemLimit",
	skillList = {
		"Melee",
		"SandstormChaosElementalSummoned",
		"ChaosElementalCascadeSummoned",
		"SandstormChaosElementalSummonedEmpowered",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
		mod("LifeRegenPercent", "BASE", 1, 0, 0), -- SummonedGolemLifeRegeneration [life_regeneration_rate_per_minute_% = 60]
	},
}

minions["SummonedFlameGolem"] = {
	name = "Flame Golem",
	monsterCategory = "Construct",
	life = 5.82,
	energyShield = 0.4,
	fireResist = 70,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.5,
	damageSpread = 0.2,
	attackTime = 1,
	attackRange = 6,
	accuracy = 3.4,
	damageFixup = 0.22,
	limit = "ActiveGolemLimit",
	skillList = {
		"FireElementalFlameRedSummoned",
		"FireElementalConeSummoned",
		"FireElementalMortarSummoned",
		"FireElementalMeteorSummoned",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
		-- MonsterSpeedAndDamageFixupLarge [monster_base_type_attack_cast_speed_+%_and_damage_-%_final = 22]
		mod("LifeRegenPercent", "BASE", 1, 0, 0), -- SummonedGolemLifeRegeneration [life_regeneration_rate_per_minute_% = 60]
	},
}

minions["SummonedIceGolem"] = {
	name = "Ice Golem",
	monsterCategory = "Construct",
	life = 5.82,
	energyShield = 0.4,
	fireResist = 40,
	coldResist = 70,
	lightningResist = 40,
	chaosResist = 20,
	damage = 3.06,
	damageSpread = 0.2,
	attackTime = 0.85,
	attackRange = 6,
	accuracy = 3.4,
	limit = "ActiveGolemLimit",
	skillList = {
		"Melee",
		"IceElementalIceCyclone",
		"IceElementalSpearSummoned",
		"IceElementalSpearSummonedDeathNova",
		"DeathExplodeIceElementalSummoned",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
		mod("LifeRegenPercent", "BASE", 1, 0, 0), -- SummonedGolemLifeRegeneration [life_regeneration_rate_per_minute_% = 60]
	},
}

minions["SummonedLightningGolem"] = {
	name = "Lightning Golem",
	monsterCategory = "Construct",
	life = 5.82,
	energyShield = 0.2,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 70,
	chaosResist = 20,
	damage = 1.5,
	damageSpread = 0.2,
	attackTime = 1.17,
	attackRange = 8,
	accuracy = 3.4,
	damageFixup = 0.22,
	limit = "ActiveGolemLimit",
	skillList = {
		"LightningGolemArcSummoned",
		"LightningGolemWrath",
		"MonsterProjectileSpellLightningGolemSummoned",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
		-- MonsterSpeedAndDamageFixupLarge [monster_base_type_attack_cast_speed_+%_and_damage_-%_final = 22]
		mod("LifeRegenPercent", "BASE", 1, 0, 0), -- SummonedGolemLifeRegeneration [life_regeneration_rate_per_minute_% = 60]
	},
}

minions["SummonedStoneGolem"] = {
	name = "Stone Golem",
	monsterCategory = "Construct",
	life = 7.25,
	armour = 0.6,
	evasion = 0.4,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.7,
	damageSpread = 0.2,
	attackTime = 1,
	attackRange = 10,
	accuracy = 3.4,
	weaponType1 = "One Handed Sword",
	limit = "ActiveGolemLimit",
	skillList = {
		"Melee",
		"RockGolemSlam",
		"RockGolemMinionWhirlingBlades",
	},
	modList = {
		mod("LifeRegenPercent", "BASE", 2, 0, 0), -- SummonedGolemLifeRegenerationStone [life_regeneration_rate_per_minute_% = 120]
	},
}

minions["SummonedRagingSpirit"] = {
	name = "Raging Spirit",
	monsterCategory = "Construct",
	life = 2.16,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.02,
	damageSpread = 0.2,
	attackTime = 0.57,
	attackRange = 8,
	accuracy = 3.4,
	limit = "ActiveRagingSpiritLimit",
	skillList = {
		"SumonRagingSpiritMelee",
	},
	modList = {
		mod("PhysicalDamageConvertToFire", "BASE", 100, 0, 0), -- RagingSpiritConvertPhysToFire [base_physical_damage_%_to_convert_to_fire = 100]
		mod("PhysicalMin", "BASE", 4, 0, 65536), -- RagingSpiritAddedPhys [attack_minimum_added_physical_damage = 4]
		mod("PhysicalMax", "BASE", 5, 0, 65536), -- RagingSpiritAddedPhys [attack_maximum_added_physical_damage = 5]
		-- CannotGainAfflictedMods [cannot_have_affliction_mods = 1]
		mod("Speed", "MORE", 40, 1, 0), -- MonsterSummonedSkullFastAttack1 [active_skill_attack_speed_+%_final = 40]
	},
}

minions["SummonedEssenceSpirit"] = {
	name = "Essence Spirit",
	monsterCategory = "Construct",
	life = 2.25,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.28,
	damageSpread = 0.2,
	attackTime = 0.57,
	attackRange = 8,
	accuracy = 3.4,
	skillList = {
		"RagingSpiritMeleeAttack",
		"SpectralSkullShieldCharge",
	},
	modList = {
		mod("Speed", "MORE", 40, 1, 0), -- MonsterSummonedSkullFastAttack1 [active_skill_attack_speed_+%_final = 40]
		mod("Condition:FullLife", "FLAG", true),
	},
}

minions["SummonedSpectralWolf"] = {
	name = "Spectral Wolf Companion",
	monsterCategory = "Beast",
	life = 11,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 6.2,
	damageSpread = 0.2,
	attackTime = 1.5,
	attackRange = 11,
	accuracy = 3.4,
	weaponType1 = "Dagger",
	limit = "ActiveWolfLimit",
	skillList = {
		"MeleeAtAnimationSpeed",
	},
	modList = {
		mod("PhysicalDamageLifeLeech", "BASE", 100, 1, 0), -- SummonedWolfLifeLeech [life_leech_from_physical_attack_damage_permyriad = 10000]
	},
}

minions["RaisedSkeleton"] = {
	name = "Summoned Skeleton",
	monsterCategory = "Humanoid",
	life = 1.05,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.45,
	damageSpread = 0.4,
	attackTime = 0.8,
	attackRange = 8,
	accuracy = 3.4,
	weaponType1 = "One Handed Sword",
	weaponType2 = "Shield",
	limit = "ActiveSkeletonLimit",
	skillList = {
		"Melee",
		"MonsterQuickDodgeRunUnarmed",
	},
	modList = {
		mod("BlockChance", "BASE", 30, 0, 0), -- MonsterAttackBlock30Bypass15 [monster_base_block_% = 30]
		mod("BlockEffect", "BASE", 15, 0, 0), -- MonsterAttackBlock30Bypass15 [base_block_%_damage_taken = 15]
		-- SummonSkeletonsSkeletonIsWarrior [summoned_skeleton_is_warrior = 1]
	},
}

minions["RaisedSkeletonCaster"] = {
	name = "Summoned Skeleton Caster",
	monsterCategory = "Humanoid",
	life = 1.05,
	energyShield = 0.4,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0.98,
	damageSpread = 0.3,
	attackTime = 1.07,
	attackRange = 46,
	accuracy = 3.4,
	limit = "ActiveSkeletonLimit",
	skillList = {
		"SkeletonMinionProjectileCold",
		"SkeletonMinionProjectileFire",
		"SkeletonMinionProjectileLightning",
	},
	modList = {
		-- SummonSkeletonsSkeletonIsMage [summoned_skeleton_is_mage = 1]
	},
}

minions["RaisedSkeletonArcher"] = {
	name = "Summoned Skeleton Archer",
	monsterCategory = "Humanoid",
	life = 1.05,
	evasion = 0.25,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0.98,
	damageSpread = 0.16,
	attackTime = 1.33,
	attackRange = 40,
	accuracy = 3.4,
	weaponType1 = "Bow",
	limit = "ActiveSkeletonLimit",
	skillList = {
		"Melee",
	},
	modList = {
	},
}

minions["Clone"] = {
	name = "Clone",
	monsterCategory = "Construct",
	life = 1,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 0.83,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"Melee",
	},
	modList = {
		mod("EnergyShield", "BASE", 10, 0, 0), -- MirrorArrowEnergyShield [base_maximum_energy_shield = 10]
	},
}

minions["ArrowClone"] = {
	name = "Clone",
	monsterCategory = "Construct",
	life = 1.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 0.83,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"BlinkMirrorArrowMelee",
	},
	modList = {
		mod("EnergyShield", "BASE", 10, 0, 0), -- MirrorArrowEnergyShield [base_maximum_energy_shield = 10]
	},
}

minions["ArrowCloneRoA"] = {
	name = "Clone",
	monsterCategory = "Construct",
	life = 1.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 0.83,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"RainOfArrowsCloneShot",
	},
	modList = {
		mod("EnergyShield", "BASE", 10, 0, 0), -- MirrorArrowEnergyShield [base_maximum_energy_shield = 10]
	},
}

minions["ArrowCloneEle"] = {
	name = "Clone",
	monsterCategory = "Construct",
	life = 1.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 0.83,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"ElementalHitCloneShot",
	},
	modList = {
		mod("EnergyShield", "BASE", 10, 0, 0), -- MirrorArrowEnergyShield [base_maximum_energy_shield = 10]
	},
}

minions["SpiderMinion"] = {
	name = "Spider Minion",
	monsterCategory = "Beast",
	life = 1.8,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.76,
	damageSpread = 0.2,
	attackTime = 0.96,
	attackRange = 7,
	accuracy = 3.4,
	weaponType1 = "One Handed Sword",
	limit = "ActiveSpiderLimit",
	skillList = {
		"SummonedSpiderViperStrike",
	},
	modList = {
		-- SummonedSpiderPhasing [phase_through_objects = 1]
		-- SummonedSpiderPhasing [suppress_phasing_visual = 1]
	},
}

minions["AnimatedWeapon"] = {
	name = "Animated Weapon",
	monsterCategory = "Construct",
	life = 4,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"Melee",
	},
	modList = {
		-- EmergeSpeedLow [emerge_speed_+% = 100]
	},
}

minions["AnimatedArmour"] = {
	name = "Animated Guardian",
	monsterCategory = "Construct",
	life = 5,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 3.4,
	skillList = {
		"Melee",
		"AnimateGuardianSmite",
	},
	modList = {
		-- LabyrinthArrowTrapDamageTakenAnimateArmour [damage_taken_+%_from_arrow_traps_final = -90]
		mod("Speed", "MORE", 10, ModFlag.Attack, 0, { type = "Condition", var = "DualWielding" }),
		mod("BlockChance", "BASE", 15, 0, 0, { type = "Condition", var = "DualWielding" }),
	},
}

minions["IcyRagingSpirit"] = {
	name = "Grave Spirit",
	monsterCategory = "Construct",
	life = 3.75,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.5,
	damageSpread = 0.2,
	attackTime = 0.57,
	attackRange = 8,
	accuracy = 3.4,
	skillList = {
		"RagingSpiritMeleeAttack",
	},
	modList = {
		mod("PhysicalDamageConvertToCold", "BASE", 50, 0, 0), -- MonsterSummonedElementalCold [base_physical_damage_%_to_convert_to_cold = 50]
		-- MonsterCannotBeChainedFrom_ [cannot_be_chained_from = 1]
		mod("Speed", "MORE", 40, 1, 0), -- MonsterSummonedSkullFastAttack1 [active_skill_attack_speed_+%_final = 40]
	},
}

minions["UniqueAnimatedWeapon"] = {
	name = "Dancing Dervish",
	monsterCategory = "Construct",
	life = 5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 105,
	accuracy = 3.4,
	skillList = {
		"Melee",
		"DancingDervishCycloneChannelled",
	},
	modList = {
	},
}

minions["SummonedPhantasm"] = {
	name = "Summoned Phantasm",
	monsterCategory = "Undead",
	life = 1.58,
	energyShield = 0.2,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1.1,
	damageSpread = 0.2,
	attackTime = 1.17,
	attackRange = 6,
	accuracy = 1,
	limit = "ActivePhantasmLimit",
	skillList = {
		"Melee",
		"SummonPhantasmFadingProjectile",
		"SummonPhantasmFadingProjectile2",
	},
	modList = {
	},
}

minions["HeraldOfAgonySpiderPlated"] = {
	name = "Agony Crawler",
	monsterCategory = "Beast",
	life = 1.5,
	fireResist = 0,
	coldResist = 0,
	lightningResist = 0,
	chaosResist = 0,
	damage = 1.5,
	damageSpread = 0.2,
	attackTime = 1.3,
	attackRange = 12,
	accuracy = 3.4,
	weaponType1 = "One Handed Sword",
	skillList = {
		"HeraldOfAgonyMinionMortar",
		"HeraldOfAgonyMinionTailSpike",
		"HeraldOfAgonyMinionCleave",
		"Melee",
	},
	modList = {
		mod("PhysicalDamageConvertToChaos", "BASE", 40, 0, 0), -- MonsterConvertToChaosHeraldOfAgony1 [base_physical_damage_%_to_convert_to_chaos = 40]
		mod("Condition:CannotBeDamaged", "FLAG", 1, 0, 0), -- MonsterCannotBeDamaged [base_cannot_be_damaged = 1]
		mod("Condition:FullLife", "FLAG", true),
	},
}

minions["AxisEliteSoldierHeraldOfLight"] = {
	name = "Sentinel of Purity",
	monsterCategory = "Humanoid",
	life = 3.4,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 3.04,
	damageSpread = 0.2,
	attackTime = 0.83,
	attackRange = 12,
	accuracy = 3.4,
	weaponType1 = "Staff",
	limit = "ActiveSentinelOfPurityLimit",
	skillList = {
		"Melee",
		"HeraldOfLightMinionSlam",
		"ChampionTeleport",
		"SentinelHolySlam",
	},
	modList = {
	},
}

minions["HolyLivingRelic"] = {
	name = "Holy Relic",
	monsterCategory = "Construct",
	life = 6,
	energyShield = 0.6,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	limit = "ActiveHolyRelicLimit",
	skillList = {
		"RelicTriggeredNova",
		"RelicTeleport",
	},
	modList = {
		-- EmergeSpeedHigh [emerge_speed_+% = 0]
	},
}

minions["AxisEliteSoldierDominatingBlow"] = {
	name = "Sentinel of Dominance",
	monsterCategory = "Humanoid",
	life = 4,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.8,
	damageSpread = 0.2,
	attackTime = 0.83,
	attackRange = 11,
	accuracy = 3.4,
	weaponType1 = "One Handed Mace",
	weaponType2 = "Shield",
	skillList = {
		"Melee",
		"DominatingBlowMinionCharge",
		"SentinelHolySlam",
	},
	modList = {
		-- MonsterCastsShieldChargeText [monster_casts_shield_charge_text = 1]
		mod("BlockChance", "BASE", 40, 0, 0), -- MonsterAttackBlock40Bypass20 [monster_base_block_% = 40]
		mod("BlockEffect", "BASE", 20, 0, 0), -- MonsterAttackBlock40Bypass20 [base_block_%_damage_taken = 20]
	},
}

minions["AxisEliteSoldierDominatingBlowVaal"] = {
	name = "Ascended Sentinel of Dominance",
	monsterCategory = "Humanoid",
	life = 4,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.8,
	damageSpread = 0.2,
	attackTime = 0.83,
	attackRange = 28,
	accuracy = 3.4,
	skillList = {
		"TeleportVaalDomination",
		"GAVaalDominationTeleportSlam",
		"VaalDominationSunderMelee",
		"VaalDominationSunder",
		"GAVaalDominationLargeSlam",
		"VaalDominationMelee",
	},
	modList = {
		mod("Damage", "MORE", 200),
		mod("DamageTaken", "MORE", -70),
	},
}

minions["AbsolutionTemplarJudge"] = {
	name = "Sentinel of Absolution",
	monsterCategory = "Humanoid",
	life = 4,
	energyShield = 0.2,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.8,
	damageSpread = 0.2,
	attackTime = 1.17,
	attackRange = 9,
	accuracy = 1,
	weaponType1 = "One Handed Mace",
	skillList = {
		"Melee",
		"AbsolutionMinion",
		"AbsolutionMinionEmpowered",
	},
	modList = {
	},
}

minions["AbsolutionTemplarJudgeVaal"] = {
	name = "Ascended Sentinel of Absolution",
	monsterCategory = "Humanoid",
	life = 4,
	energyShield = 0.2,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.8,
	damageSpread = 0.2,
	attackTime = 1.17,
	attackRange = 9,
	accuracy = 1,
	skillList = {
		"AbsolutionMinionVaal",
		"AbsolutionMinionVaalCascade",
		"GTVaalAbsolutionLarge",
		"VaalAbsolutionDelayedBlast",
		"GSVaalAbsolutionEmerge",
	},
	modList = {
		mod("Damage", "MORE", 200),
		mod("DamageTaken", "MORE", -70),
	},
}

minions["RhoaUniqueSummoned"] = {
	name = "Summoned Rhoa",
	monsterCategory = "Beast",
	life = 9,
	armour = 0.2,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 4.28,
	damageSpread = 0.2,
	attackTime = 0.93,
	attackRange = 14,
	accuracy = 3.4,
	limit = "ActiveBeastMinionLimit",
	skillList = {
		"MeleeAtAnimationSpeedUnique",
		"SummonedRhoaShieldCharge",
	},
	modList = {
		mod("SkillData", "LIST", { key = "cannotBeEvaded", value = true }, 0, 0), -- MonsterAlwaysHits [global_always_hit = 1]
		-- MonsterNearbyEnemiesAreIntimidated [is_intimidated = 1]
		-- MonsterNearbyEnemiesAreIntimidated [local_display_nearby_enemies_are_intimidated = 1]
	},
}

minions["SnakeSpitUniqueSummoned"] = {
	name = "Summoned Cobra",
	monsterCategory = "Beast",
	baseDamageIgnoresAttackSpeed = true,
	life = 9,
	armour = 0.15,
	evasion = 0.15,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 3.23,
	damageSpread = 0.2,
	attackTime = 1.1,
	attackRange = 9,
	accuracy = 3.4,
	limit = "ActiveBeastMinionLimit",
	skillList = {
		"SummonedSnakeProjectile",
	},
	modList = {
		mod("SkillData", "LIST", { key = "cannotBeEvaded", value = true }, 0, 0), -- MonsterAlwaysHits [global_always_hit = 1]
		mod("PhysicalDamageConvertToChaos", "BASE", 30, 0, 0), -- MonsterSnakeChaos [base_physical_damage_%_to_convert_to_chaos = 30]
	},
}

minions["DropBearUniqueSummoned"] = {
	name = "Summoned Ursa",
	monsterCategory = "Beast",
	baseDamageIgnoresAttackSpeed = true,
	life = 9,
	armour = 0.5,
	evasion = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 3.53,
	damageSpread = 0.2,
	attackTime = 1.1,
	attackRange = 10,
	accuracy = 3.4,
	weaponType1 = "One Handed Mace",
	limit = "ActiveBeastMinionLimit",
	skillList = {
		"MeleeAtAnimationSpeedUnique",
		"DropBearSummonedGroundSlam",
		"DropBearSummonedRallyingCry",
	},
	modList = {
		mod("SkillData", "LIST", { key = "cannotBeEvaded", value = true }, 0, 0), -- MonsterAlwaysHits [global_always_hit = 1]
	},
}

minions["SummonedCarrionGolem"] = {
	name = "Carrion Golem",
	monsterCategory = "Construct",
	life = 5.82,
	energyShield = 0.4,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 0.6,
	damageSpread = 0.2,
	attackTime = 0.9,
	attackRange = 13,
	accuracy = 3.4,
	limit = "ActiveGolemLimit",
	skillList = {
		"BoneGolemMultiAttack",
		"BoneGolemCascade",
		"BoneGolemLeapSlam",
		"EGBoneGolemConsumeCorpse",
		"BoneGolemCascadeEmpowered",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
		mod("LifeRegenPercent", "BASE", 1, 0, 0), -- SummonedGolemLifeRegeneration [life_regeneration_rate_per_minute_% = 60]
	},
}

minions["SkitterbotCold"] = {
	name = "Chilling Skitterbot",
	monsterCategory = "Construct",
	life = 1,
	fireResist = 0,
	coldResist = 0,
	lightningResist = 0,
	chaosResist = 0,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"SkitterbotDetonateMines",
		"SkitterbotWait",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
	},
}

minions["SkitterbotLightning"] = {
	name = "Shocking Skitterbot",
	monsterCategory = "Construct",
	life = 1,
	fireResist = 0,
	coldResist = 0,
	lightningResist = 0,
	chaosResist = 0,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"SkitterbotDetonateMines",
		"SkitterbotWait",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
	},
}

minions["SummonedReaper"] = {
	name = "Reaper",
	monsterCategory = "Undead",
	life = 3.74,
	armour = 1,
	evasion = 1,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 2.4,
	damageSpread = 0.2,
	attackTime = 1.5,
	attackRange = 13,
	accuracy = 3.4,
	weaponType1 = "One Handed Sword",
	weaponType2 = "One Handed Sword",
	skillList = {
		"ReaperConsumeMinionForHeal",
		"ReaperConsumeMinionForBuff",
		"SummonedReaperMelee",
		"SummonedReaperDash",
		"SummonedReaperUltimate",
		"GASummonReaperUltimateLeftSlash",
		"GASummonReaperUltimateRightSlash",
		"EAASummonedReaperComboAttack",
		"GASummonReaperComboWhirl",
		"GASummonReaperComboLeftSlash",
		"GASummonReaperComboRightSlash",
		"GASummonReaperDashImpactSlash",
		"GASummonReaperDash",
	},
	modList = {
		-- MonsterNoDropsOrExperience [monster_no_drops_or_experience = 1]
	},
}

minions["SummonedArbalists"] = {
	name = "Summoned Arbalist",
	monsterCategory = "Undead",
	life = 7.41,
	evasion = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 4.29,
	damageSpread = 0.2,
	attackTime = 1,
	attackRange = 60,
	accuracy = 3.4,
	limit = "ActiveArbalistLimit",
	skillList = {
		"MPWExpeditionSummonedArbalestProjectile",
	},
	modList = {
		mod("Condition:CannotBeDamaged", "FLAG", 1, 0, 0), -- MonsterCannotBeDamaged [base_cannot_be_damaged = 1]
	},
}

minions["GuardianSentinel"] = {
	name = "Sentinel of Radiance",
	monsterCategory = "Humanoid",
	life = 12,
	armour = 0.5,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 20,
	damageSpread = 0.2,
	attackTime = 0.83,
	attackRange = 17,
	accuracy = 3.4,
	skillList = {
		"TeleportVaalDomination",
		"VaalDominationMelee",
	},
	modList = {
	},
}

-- This is a fake Minion to apply all 3 auras
minions["GuardianRelicAll"] = {
	name = "All Relics",
	life = 4,
	energyShield = 0.6,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"RelicTeleport",
		"Anger",
		"Hatred",
		"Wrath",
	},
	modList = {
		-- EmergeSpeedHigh [emerge_speed_+% = 0]
	},
}

minions["GuardianRelicFire"] = {
	name = "Fire Relic",
	monsterCategory = "Construct",
	life = 4,
	energyShield = 0.6,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"RelicTeleport",
		"Anger",
	},
	modList = {
		-- EmergeSpeedHigh [emerge_speed_+% = 0]
	},
}

minions["GuardianRelicCold"] = {
	name = "Cold Relic",
	monsterCategory = "Construct",
	life = 4,
	energyShield = 0.6,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"RelicTeleport",
		"Hatred",
	},
	modList = {
		-- EmergeSpeedHigh [emerge_speed_+% = 0]
	},
}

minions["GuardianRelicLightning"] = {
	name = "Lightning Relic",
	monsterCategory = "Construct",
	life = 4,
	energyShield = 0.6,
	fireResist = 40,
	coldResist = 40,
	lightningResist = 40,
	chaosResist = 20,
	damage = 1,
	damageSpread = 0,
	attackTime = 1,
	attackRange = 6,
	accuracy = 1,
	skillList = {
		"RelicTeleport",
		"Wrath",
	},
	modList = {
		-- EmergeSpeedHigh [emerge_speed_+% = 0]
	},
}
