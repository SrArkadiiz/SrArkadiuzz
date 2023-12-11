-- This file is automatically generated, do not edit!
-- Item data (c) Grinding Gear Games
local itemBases = ...

itemBases["Ironwood Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "Damaging Hits always Stun Enemies that are on Full Life",
	implicitModTypes = { { "attack" }, },
	req = { },
}
itemBases["Ashbark Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "All Damage can Ignite",
	implicitModTypes = { { "elemental", "fire", "attack", "ailment" }, },
	req = { },
}
itemBases["Fulgurite Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "All Damage can Shock",
	implicitModTypes = { { "elemental", "lightning", "attack", "ailment" }, },
	req = { },
}
itemBases["Poisonberry Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "All Damage can Poison",
	implicitModTypes = { { "poison", "chaos", "attack", "ailment" }, },
	req = { },
}
itemBases["Rosethorn Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "+25% to Critical Strike Chance against Enemies that are on Full Life",
	implicitModTypes = { { "attack", "critical" }, },
	req = { },
}
itemBases["Oakbranch Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "Culling Strike",
	implicitModTypes = { { "attack" }, },
	req = { },
}
itemBases["Borealwood Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "All Damage can Freeze",
	implicitModTypes = { { "elemental", "cold", "attack", "ailment" }, },
	req = { },
}
itemBases["Blood Sap Tincture"] = {
	type = "Tincture",
	tags = { tincture = true, default = true, },
	implicit = "Bleeding you inflict on non-Bleeding Enemies deals 30% more Damage",
	implicitModTypes = { { "bleed", "physical", "attack", "ailment" }, },
	req = { },
}
