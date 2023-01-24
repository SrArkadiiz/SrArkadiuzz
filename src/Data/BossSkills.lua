-- This file is automatically generated, do not edit!
-- Path of Building
--
-- Boss Skill Presets
-- Boss Skill data (c) Grinding Gear Games
--
return {
	["Atziri Flameblast"] = {
		DamageType = "Spell",
		DamageMultipliers = {
			Fire = { 32.111392306475, 0.16055696153238 }
		},
		DamagePenetrations = {
			FirePen = ""
		},
		UberDamagePenetrations = {
			FirePen = 10
		},
		speed = 12500,
		Uberspeed = 25000,
		critChance = 0,
		earlierUber = true,
		tooltip = "The Uber variant has 10 ^xB97123Fire^7 penetration (Applied on Pinnacle And Uber)"
	},
	["Shaper Ball"] = {
		DamageType = "SpellProjectile",
		DamageMultipliers = {
			Cold = { 6.8607995326932, 0.034303997663466 }
		},
		DamagePenetrations = {
			ColdPen = 25
		},
		UberDamagePenetrations = {
			ColdPen = 40
		},
		speed = 1400,
		tooltip = "Allocating Cosmic Wounds increases the penetration to 40% (Applied on Uber) and adds 2 projectiles"
	},
	["Shaper Slam"] = {
		DamageType = "Melee",
		DamageMultipliers = {
			Physical = { 10.852802745427, 0.054264013727137 }
		},
		UberDamageMultiplier = 2,
		speed = 3510,
		Uberspeed = 1755,
		critChance = 0,
		tooltip = "Cannot be Evaded.  Allocating Cosmic Wounds increases Damage by a further 100% (Applied on Uber) and cannot be blocked or dodged"
	},
	["Sirus Meteor"] = {
		DamageType = "Spell",
		DamageMultipliers = {
			Physical = { 6.6279000401592, 0.033139500200796 },
			Lightning = { 6.6279000401592, 0.033139500200796 },
			Fire = { 6.6279000401592, 0.033139500200796 },
			Chaos = { 6.6279000401592, 0.033139500200796 }
		},
		UberDamageMultiplier = 1.5,
		speed = 1500,
		tooltip = "Earlier ones with less walls do less damage. Allocating The Perfect Storm increases Damage by a further 50% (Applied on Uber)"
	},
	["Exarch Ball"] = {
		DamageType = "SpellProjectile",
		DamageMultipliers = {
			Fire = { 8.6631988609397, 0.043315994304699 }
		},
		speed = 1000,
		critChance = 0,
		tooltip = "Spawns 8-18 waves of balls depending on which fight and which ball phase"
	},
	["Eater Beam"] = {
		DamageType = "Spell",
		DamageMultipliers = {
			Lightning = { 7.0740005841335, 0.14148001168267 }
		},
		speed = 2500,
		tooltip = "Allocating Insatiable Appetite causes the beam to always shock for at least 30%"
	},
	["Maven Fireball"] = {
		DamageType = "SpellProjectile",
		DamageMultipliers = {
			Fire = { 7.5455996495199, 0.0377279982476 }
		},
		UberDamageMultiplier = 2,
		DamagePenetrations = {
			FirePen = ""
		},
		UberDamagePenetrations = {
			FirePen = 30
		},
		speed = 3000,
		tooltip = "Allocating Throw the Gauntlet increases Damage by a further 100% (Applied on Uber) and causes the fireball to have 30 ^xB97123Fire^7 penetration (Applied on Uber)"
	},
	["Maven MemoryGame"] = {
		DamageType = "Melee",
		DamageMultipliers = {
			Lightning = { 17.263199834496, 0.086315999172478 },
			Cold = { 17.263199834496, 0.086315999172478 },
			Fire = { 17.263199834496, 0.086315999172478 }
		},
		speed = 7500,
		tooltip = "Is three separate hits, and has a large DoT effect.  Neither is taken into account here.  \n	i.e. Hits before death should be more than 3 to survive"
	},
}
