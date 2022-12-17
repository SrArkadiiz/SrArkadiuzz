-- This file is automatically generated, do not edit!
-- Item data (c) Grinding Gear Games
local itemBases = ...


itemBases["Iron Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 6, ArmourBaseMax = 9, },
	req = { str = 6, },
}
itemBases["Plated Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 39, ArmourBaseMax = 50, },
	req = { level = 11, str = 20, },
}
itemBases["Bronze Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 77, ArmourBaseMax = 96, },
	req = { level = 23, str = 36, },
}
itemBases["Steel Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 116, ArmourBaseMax = 127, },
	req = { level = 35, str = 52, },
}
itemBases["Antique Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 129, ArmourBaseMax = 154, },
	req = { level = 39, str = 58, },
}
itemBases["Ancient Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 154, ArmourBaseMax = 173, },
	req = { level = 47, str = 68, },
}
itemBases["Goliath Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["armour"] = true, ["str_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 174, ArmourBaseMax = 200, },
	req = { level = 53, str = 77, },
}
itemBases["Vaal Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["armour"] = true, ["top_tier_base_item_type"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 232, ArmourBaseMax = 266, },
	req = { level = 63, str = 100, },
}
itemBases["Titan Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["armour"] = true, ["top_tier_base_item_type"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 242, ArmourBaseMax = 278, },
	req = { level = 69, str = 98, },
}
itemBases["Taxing Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["not_for_sale"] = true, ["armour"] = true, ["default"] = true, },
	implicit = "Exerted Attacks deal (25-30)% increased Damage\nWarcry Skills have +2 seconds to Cooldown",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { ArmourBaseMin = 35, ArmourBaseMax = 41, },
	req = { level = 10, str = 18, },
}
itemBases["Gruelling Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["not_for_sale"] = true, ["armour"] = true, ["default"] = true, },
	implicit = "Exerted Attacks deal (30-40)% increased Damage\nWarcry Skills have +2 seconds to Cooldown",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { ArmourBaseMin = 132, ArmourBaseMax = 152, },
	req = { level = 40, str = 59, },
}
itemBases["Debilitation Gauntlets"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["not_for_sale"] = true, ["armour"] = true, ["default"] = true, },
	implicit = "Exerted Attacks deal (40-50)% increased Damage\nWarcry Skills have +2 seconds to Cooldown",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { ArmourBaseMin = 236, ArmourBaseMax = 271, },
	req = { level = 70, str = 101, },
}
itemBases["Spiked Gloves"] = {
	type = "Gloves",
	subType = "Armour",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_armour"] = true, ["not_for_sale"] = true, ["atlas_base_type"] = true, ["armour"] = true, ["glovesatlasstr"] = true, ["default"] = true, },
	implicit = "(16-20)% increased Melee Damage",
	implicitModTypes = { { "damage", "attack" }, },
	armour = { ArmourBaseMin = 220, ArmourBaseMax = 253, },
	req = { level = 70, str = 95, },
}

itemBases["Rawhide Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 13, EvasionBaseMax = 18, },
	req = { dex = 9, },
}
itemBases["Goathide Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 32, EvasionBaseMax = 42, },
	req = { level = 9, dex = 17, },
}
itemBases["Deerskin Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 71, EvasionBaseMax = 88, },
	req = { level = 21, dex = 33, },
}
itemBases["Nubuck Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 109, EvasionBaseMax = 122, },
	req = { level = 33, dex = 50, },
}
itemBases["Eelskin Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 125, EvasionBaseMax = 148, },
	req = { level = 38, dex = 56, },
}
itemBases["Sharkskin Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 148, EvasionBaseMax = 163, },
	req = { level = 45, dex = 66, },
}
itemBases["Shagreen Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 177, EvasionBaseMax = 212, },
	req = { level = 54, dex = 78, },
}
itemBases["Stealth Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["dex_armour"] = true, ["armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 231, EvasionBaseMax = 265, },
	req = { level = 62, dex = 97, },
}
itemBases["Slink Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["dex_armour"] = true, ["armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 242, EvasionBaseMax = 278, },
	req = { level = 70, dex = 95, },
}
itemBases["Gauche Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["dex_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "25% reduced Attack Damage with Main Hand\n(40-50)% increased Attack Damage with Off Hand",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { EvasionBaseMin = 35, EvasionBaseMax = 41, },
	req = { level = 10, dex = 18, },
}
itemBases["Southswing Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["dex_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "25% reduced Attack Damage with Main Hand\n(40-50)% increased Attack Damage with Off Hand",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { EvasionBaseMin = 132, EvasionBaseMax = 152, },
	req = { level = 40, dex = 59, },
}
itemBases["Sinistral Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["dex_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "25% reduced Attack Damage with Main Hand\n(40-50)% increased Attack Damage with Off Hand",
	implicitModTypes = { { "attack" }, { "attack" }, },
	armour = { EvasionBaseMin = 236, EvasionBaseMax = 271, },
	req = { level = 70, dex = 101, },
}
itemBases["Gripped Gloves"] = {
	type = "Gloves",
	subType = "Evasion",
	socketLimit = 4,
	tags = { ["glovesatlasdex"] = true, ["gloves"] = true, ["not_for_sale"] = true, ["atlas_base_type"] = true, ["armour"] = true, ["dex_armour"] = true, ["default"] = true, },
	implicit = "(14-18)% increased Projectile Attack Damage",
	implicitModTypes = { { "damage", "attack" }, },
	armour = { EvasionBaseMin = 220, EvasionBaseMax = 253, },
	req = { level = 70, dex = 95, },
}

itemBases["Wool Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 5, EnergyShieldBaseMax = 7, },
	req = { int = 9, },
}
itemBases["Velvet Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 10, EnergyShieldBaseMax = 13, },
	req = { level = 12, int = 21, },
}
itemBases["Silk Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 18, EnergyShieldBaseMax = 23, },
	req = { level = 25, int = 39, },
}
itemBases["Embroidered Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 25, EnergyShieldBaseMax = 28, },
	req = { level = 36, int = 54, },
}
itemBases["Satin Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 28, EnergyShieldBaseMax = 33, },
	req = { level = 41, int = 60, },
}
itemBases["Samite Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 32, EnergyShieldBaseMax = 37, },
	req = { level = 47, int = 68, },
}
itemBases["Conjurer Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 37, EnergyShieldBaseMax = 44, },
	req = { level = 55, int = 79, },
}
itemBases["Arcanist Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["int_armour"] = true, ["armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 45, EnergyShieldBaseMax = 52, },
	req = { level = 60, int = 95, },
}
itemBases["Sorcerer Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["int_armour"] = true, ["armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EnergyShieldBaseMin = 49, EnergyShieldBaseMax = 57, },
	req = { level = 69, int = 97, },
}
itemBases["Leyline Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["int_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "30% reduced maximum Mana\n(25-30)% chance when you pay a Skill's Cost to gain that much Mana",
	implicitModTypes = { { "resource", "mana" }, { "resource", "mana" }, },
	armour = { EnergyShieldBaseMin = 9, EnergyShieldBaseMax = 10, },
	req = { level = 10, int = 18, },
}
itemBases["Aetherwind Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["int_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "30% reduced maximum Mana\n(25-30)% chance when you pay a Skill's Cost to gain that much Mana",
	implicitModTypes = { { "resource", "mana" }, { "resource", "mana" }, },
	armour = { EnergyShieldBaseMin = 28, EnergyShieldBaseMax = 32, },
	req = { level = 40, int = 59, },
}
itemBases["Nexus Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["int_armour"] = true, ["armour"] = true, ["not_for_sale"] = true, ["default"] = true, },
	implicit = "30% reduced maximum Mana\n(25-30)% chance when you pay a Skill's Cost to gain that much Mana",
	implicitModTypes = { { "resource", "mana" }, { "resource", "mana" }, },
	armour = { EnergyShieldBaseMin = 47, EnergyShieldBaseMax = 54, },
	req = { level = 70, int = 101, },
}
itemBases["Fingerless Silk Gloves"] = {
	type = "Gloves",
	subType = "Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["int_armour"] = true, ["not_for_sale"] = true, ["atlas_base_type"] = true, ["armour"] = true, ["glovesatlasint"] = true, ["default"] = true, },
	implicit = "(12-16)% increased Spell Damage",
	implicitModTypes = { { "caster_damage", "damage", "caster" }, },
	armour = { EnergyShieldBaseMin = 45, EnergyShieldBaseMax = 52, },
	req = { level = 70, int = 95, },
}

itemBases["Fishscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 9, ArmourBaseMax = 12, EvasionBaseMin = 9, EvasionBaseMax = 12, },
	req = { str = 5, dex = 5, },
}
itemBases["Ironscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 28, ArmourBaseMax = 37, EvasionBaseMin = 28, EvasionBaseMax = 37, },
	req = { level = 15, str = 14, dex = 14, },
}
itemBases["Bronzescale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 50, ArmourBaseMax = 62, EvasionBaseMin = 50, EvasionBaseMax = 62, },
	req = { level = 27, str = 22, dex = 22, },
}
itemBases["Steelscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 65, ArmourBaseMax = 75, EvasionBaseMin = 65, EvasionBaseMax = 75, },
	req = { level = 36, str = 29, dex = 29, },
}
itemBases["Serpentscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 78, ArmourBaseMax = 87, EvasionBaseMin = 78, EvasionBaseMax = 87, },
	req = { level = 43, str = 34, dex = 34, },
}
itemBases["Wyrmscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 88, ArmourBaseMax = 104, EvasionBaseMin = 88, EvasionBaseMax = 104, },
	req = { level = 49, str = 38, dex = 38, },
}
itemBases["Hydrascale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 106, ArmourBaseMax = 122, EvasionBaseMin = 106, EvasionBaseMax = 122, },
	req = { level = 59, str = 45, dex = 45, },
}
itemBases["Dragonscale Gauntlets"] = {
	type = "Gloves",
	subType = "Armour/Evasion",
	socketLimit = 4,
	tags = { ["str_dex_armour"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 121, ArmourBaseMax = 139, EvasionBaseMin = 121, EvasionBaseMax = 139, },
	req = { level = 67, str = 51, dex = 51, },
}

itemBases["Chain Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 14, ArmourBaseMax = 20, EnergyShieldBaseMin = 4, EnergyShieldBaseMax = 6, },
	req = { level = 7, str = 8, int = 8, },
}
itemBases["Ringmail Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 35, ArmourBaseMax = 46, EnergyShieldBaseMin = 8, EnergyShieldBaseMax = 10, },
	req = { level = 19, str = 16, int = 16, },
}
itemBases["Mesh Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 58, ArmourBaseMax = 67, EnergyShieldBaseMin = 12, EnergyShieldBaseMax = 14, },
	req = { level = 32, str = 26, int = 26, },
}
itemBases["Riveted Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 67, ArmourBaseMax = 77, EnergyShieldBaseMin = 14, EnergyShieldBaseMax = 16, },
	req = { level = 37, str = 29, int = 29, },
}
itemBases["Zealot Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 78, ArmourBaseMax = 92, EnergyShieldBaseMin = 16, EnergyShieldBaseMax = 19, },
	req = { level = 43, str = 34, int = 34, },
}
itemBases["Soldier Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 92, ArmourBaseMax = 103, EnergyShieldBaseMin = 19, EnergyShieldBaseMax = 21, },
	req = { level = 51, str = 40, int = 40, },
}
itemBases["Legion Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 103, ArmourBaseMax = 121, EnergyShieldBaseMin = 21, EnergyShieldBaseMax = 25, },
	req = { level = 57, str = 44, int = 44, },
}
itemBases["Crusader Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["str_int_armour"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { ArmourBaseMin = 121, ArmourBaseMax = 139, EnergyShieldBaseMin = 25, EnergyShieldBaseMax = 28, },
	req = { level = 66, str = 51, int = 51, },
}
itemBases["Apothecary's Gloves"] = {
	type = "Gloves",
	subType = "Armour/Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["str_int_armour"] = true, ["not_for_sale"] = true, ["atlas_base_type"] = true, ["armour"] = true, ["glovesatlasstrint"] = true, ["default"] = true, },
	implicit = "(14-18)% increased Damage over Time",
	implicitModTypes = { { "damage" }, },
	armour = { ArmourBaseMin = 108, ArmourBaseMax = 124, EnergyShieldBaseMin = 29, EnergyShieldBaseMax = 33, },
	req = { level = 70, str = 46, int = 59, },
}

itemBases["Wrapped Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 11, EvasionBaseMax = 15, EnergyShieldBaseMin = 3, EnergyShieldBaseMax = 5, },
	req = { level = 5, dex = 6, int = 6, },
}
itemBases["Strapped Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 30, EvasionBaseMax = 39, EnergyShieldBaseMin = 7, EnergyShieldBaseMax = 9, },
	req = { level = 16, dex = 14, int = 14, },
}
itemBases["Clasped Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 57, EvasionBaseMax = 65, EnergyShieldBaseMin = 12, EnergyShieldBaseMax = 14, },
	req = { level = 31, dex = 25, int = 25, },
}
itemBases["Trapper Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 65, EvasionBaseMax = 77, EnergyShieldBaseMin = 14, EnergyShieldBaseMax = 16, },
	req = { level = 36, dex = 29, int = 29, },
}
itemBases["Ambush Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 81, EvasionBaseMax = 91, EnergyShieldBaseMin = 17, EnergyShieldBaseMax = 19, },
	req = { level = 45, dex = 35, int = 35, },
}
itemBases["Carnal Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["dex_int_armour"] = true, ["armour"] = true, ["gloves"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 90, EvasionBaseMax = 101, EnergyShieldBaseMin = 19, EnergyShieldBaseMax = 21, },
	req = { level = 50, dex = 39, int = 39, },
}
itemBases["Assassin's Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["default"] = true, ["dex_int_armour"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 104, EvasionBaseMax = 123, EnergyShieldBaseMin = 21, EnergyShieldBaseMax = 25, },
	req = { level = 58, dex = 45, int = 45, },
}
itemBases["Murder Mitts"] = {
	type = "Gloves",
	subType = "Evasion/Energy Shield",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["top_tier_base_item_type"] = true, ["armour"] = true, ["default"] = true, ["dex_int_armour"] = true, },
	implicitModTypes = { },
	armour = { EvasionBaseMin = 121, EvasionBaseMax = 139, EnergyShieldBaseMin = 25, EnergyShieldBaseMax = 28, },
	req = { level = 67, dex = 51, int = 51, },
}

itemBases["Runic Gloves"] = {
	type = "Gloves",
	subType = "Ward",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["not_for_sale"] = true, ["armour"] = true, ["ward_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { WardBaseMin = 24, WardBaseMax = 28, },
	req = { level = 24, str = 16, dex = 16, int = 16, },
}
itemBases["Runic Gages"] = {
	type = "Gloves",
	subType = "Ward",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["not_for_sale"] = true, ["armour"] = true, ["ward_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { WardBaseMin = 62, WardBaseMax = 71, },
	req = { level = 48, str = 31, dex = 31, int = 31, },
}
itemBases["Runic Gauntlets"] = {
	type = "Gloves",
	subType = "Ward",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["not_for_sale"] = true, ["armour"] = true, ["ward_armour"] = true, ["default"] = true, },
	implicitModTypes = { },
	armour = { WardBaseMin = 102, WardBaseMax = 117, },
	req = { level = 69, str = 38, dex = 38, int = 38, },
}

itemBases["Golden Bracers"] = {
	type = "Gloves",
	socketLimit = 4,
	tags = { ["gloves"] = true, ["not_for_sale"] = true, ["armour"] = true, ["demigods"] = true, ["default"] = true, },
	implicit = "+(20-30) to maximum Life",
	implicitModTypes = { { "resource", "life" }, },
	armour = { },
	req = { level = 12, },
}
