-- This file is automatically generated, do not edit!
-- The Pantheon data (c) Grinding Gear Games

return {
	["TheBrineKing"] = {
		isMajorGod = true,
		souls = {
			[1] = { name = "Soul of the Brine King",
				mods = {
					-- cannot_be_stunned_if_have_been_stunned_or_blocked_stunning_hit_in_past_2_seconds
					[1] = { line = "You cannot be Stunned if you've been Stunned or Blocked a Stunning Hit in the past 2 seconds", value = { 1 }, },
				},
			},
			[2] = { name = "Glace",
				mods = {
					-- base_stun_recovery_+%
					[1] = { line = "30% increased Stun and Block Recovery", value = { 30 }, },
				},
			},
			[3] = { name = "Ambrius, Legion Slayer",
				mods = {
					-- cannot_be_frozen_if_you_have_been_frozen_recently
					[1] = { line = "You cannot be Frozen if you've been Frozen Recently", value = { 100 }, },
				},
			},
			[4] = { name = "Captain Tanner Lightfoot",
				mods = {
					-- chill_effectiveness_on_self_+%
					[1] = { line = "50% reduced Effect of Chill on you", value = { -50 }, },
				},
			},
		},
	},
	["Arakaali"] = {
		isMajorGod = true,
		souls = {
			[1] = { name = "Soul of Arakaali",
				mods = {
					-- degen_effect_+%
					[1] = { line = "5% reduced Damage taken from Damage Over Time", value = { -5 }, },
					-- avoid_lightning_damage_%
					[2] = { line = "10% chance to Avoid Lightning Damage from Hits", value = { 10 }, },
				},
			},
			[2] = { name = "Queen of the Great Tangle",
				mods = {
					-- life_and_energy_shield_recovery_rate_+%_if_stopped_taking_damage_over_time_recently
					[1] = { line = "50% increased Recovery rate of Life and Energy Shield if you've stopped taking Damage Over Time Recently", value = { 50 }, },
				},
			},
			[3] = { name = "Shavronne the Sickening",
				mods = {
					-- shocked_effect_on_self_+%
					[1] = { line = "30% reduced Effect of Shock on you", value = { -30 }, },
					-- base_self_shock_duration_-%
					[2] = { line = "30% reduced Shock Duration on you", value = { 30 }, },
				},
			},
			[4] = { name = "Thraxia",
				mods = {
					-- additional_chaos_resistance_against_damage_over_time_%
					[1] = { line = "+25% Chaos Resistance against Damage Over Time", value = { 25 }, },
				},
			},
		},
	},
	["Solaris"] = {
		isMajorGod = true,
		souls = {
			[1] = { name = "Soul of Solaris",
				mods = {
					-- physical_damage_reduction_%_if_only_one_enemy_nearby
					[1] = { line = "6% additional Physical Damage Reduction while there is only one nearby Enemy", value = { 6 }, },
					-- take_half_area_damage_from_hit_%_chance
					[2] = { line = "20% chance to take 50% less Area Damage from Hits", value = { 20 }, },
				},
			},
			[2] = { name = "The Gorgon",
				mods = {
					-- elemental_damage_taken_+%_if_not_hit_recently
					[1] = { line = "8% reduced Elemental Damage taken if you haven't been Hit Recently", value = { -8 }, },
				},
			},
			[3] = { name = "Eater of Souls",
				mods = {
					-- self_take_no_extra_damage_from_critical_strikes_if_have_been_crit_recently
					[1] = { line = "Take no Extra Damage from Critical Strikes if you have taken a Critical Strike Recently", value = { 1 }, },
				},
			},
			[4] = { name = "Kitava, The Destroyer",
				mods = {
					-- avoid_ailments_%_from_crit
					[1] = { line = "50% chance to avoid Ailments from Critical Strikes", value = { 50 }, },
				},
			},
		},
	},
	["Lunaris"] = {
		isMajorGod = true,
		souls = {
			[1] = { name = "Soul of Lunaris",
				mods = {
					-- physical_damage_reduction_%_per_nearby_enemy
					[1] = { line = "1% additional Physical Damage Reduction for each nearby Enemy, up to 8%", value = { 1 }, },
					-- movement_speed_+%_per_nearby_enemy
					[2] = { line = "1% increased Movement Speed for each nearby Enemy, up to 8%", value = { 1 }, },
				},
			},
			[2] = { name = "Ancient Architect",
				mods = {
					-- base_avoid_projectiles_%_chance
					[1] = { line = "10% chance to avoid Projectiles", value = { 10 }, },
				},
			},
			[3] = { name = "Excellis Aurafix",
				mods = {
					-- dodge_attacks_and_spells_%_chance_if_have_been_hit_recently
					[1] = { line = "5% chance to Dodge Attack and Spell Hits if you've been Hit Recently", value = { 5 }, },
				},
			},
			[4] = { name = "The Hallowed Husk",
				mods = {
					-- avoid_chained_projectile_%_chance
					[1] = { line = "Avoid Projectiles that have Chained", value = { 100 }, },
				},
			},
		},
	},
	["Abberath"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Abberath",
				mods = {
					-- fire_damage_taken_+%_while_moving
					[1] = { line = "5% reduced Fire Damage taken while moving", value = { -5 }, },
					-- unaffected_by_burning_ground
					[2] = { line = "Unaffected by Burning Ground", value = { 1 }, },
				},
			},
			[2] = { name = "Mephod, the Earth Scorcher",
				mods = {
					-- base_self_ignite_duration_-%
					[1] = { line = "50% reduced Ignite Duration on you", value = { 50 }, },
					-- movement_speed_+%_while_on_burning_ground
					[2] = { line = "10% increased Movement Speed while on Burning Ground", value = { 10 }, },
				},
			},
		},
	},
	["Gruthkul"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Gruthkul",
				mods = {
					-- physical_damage_reduction_%_per_hit_you_have_taken_recently
					[1] = { line = "1% additional Physical Damage Reduction for each Hit you've taken Recently up to a maximum of 5%", value = { 1 }, },
				},
			},
			[2] = { name = "Erebix, Light's Bane",
				mods = {
					-- enemies_that_hit_you_with_attack_recently_attack_speed_+%
					[1] = { line = "Enemies that have Hit you with an Attack Recently have 8% reduced Attack Speed", value = { -8 }, },
				},
			},
		},
	},
	["Yugul"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Yugul",
				mods = {
					-- reflect_damage_taken_+%
					[1] = { line = "25% reduced Reflected Damage taken", value = { -25 }, },
					-- reflect_chill_and_freeze_%_chance
					[2] = { line = "50% chance to Reflect Enemy Chills and Freezes", value = { 50 }, },
				},
			},
			[2] = { name = "Varhesh, Shimmering Aberration",
				mods = {
					-- cold_damage_taken_+%_if_have_been_hit_recently
					[1] = { line = "5% reduced Cold Damage taken if you've been Hit Recently", value = { -5 }, },
				},
			},
		},
	},
	["Shakari"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Shakari",
				mods = {
					-- chaos_damage_taken_+%
					[1] = { line = "5% reduced Chaos Damage taken", value = { -5 }, },
					-- chaos_damage_taken_over_time_+%_while_in_caustic_cloud
					[2] = { line = "25% reduced Chaos Damage over Time taken while on Caustic Ground", value = { -25 }, },
				},
			},
			[2] = { name = "Terror of the Infinite Drifts",
				mods = {
					-- immune_to_poison
					[1] = { line = "Immune to Poison", value = { 1 }, },
				},
			},
		},
	},
	["Tukohama"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Tukohama",
				mods = {
					-- while_stationary_gain_additional_physical_damage_reduction_%
					[1] = { line = "While stationary, gain 2% additional Physical Damage Reduction every second, up to a maximum of 8%", value = { 2 }, },
				},
			},
			[2] = { name = "Tahsin, Warmaker",
				mods = {
					-- while_stationary_gain_life_regeneration_rate_per_minute_%
					[1] = { line = "While stationary, gain 0.5% of Life Regenerated per second every second, up to a maximum of 2%", value = { 30 }, },
				},
			},
		},
	},
	["Ralakesh"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Ralakesh",
				mods = {
					-- physical_damage_over_time_taken_+%_while_moving
					[1] = { line = "25% reduced Physical Damage over Time Damage taken while moving", value = { -25 }, },
					-- base_avoid_bleed_%
					[2] = { line = "25% chance to avoid Bleeding", value = { 25 }, },
				},
			},
			[2] = { name = "Drek, Apex Hunter",
				mods = {
					-- cannot_be_blinded
					[1] = { line = "Cannot be Blinded", value = { 1 }, },
					-- avoid_maim_%_chance
					[2] = { line = "You cannot be Maimed", value = { 100 }, },
				},
			},
		},
	},
	["Garukhan"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Garukhan",
				mods = {
					-- additional_%_chance_to_evade_attacks_if_you_have_taken_a_savage_hit_recently
					[1] = { line = "+5% chance to Evade Attacks if you've taken a Savage Hit Recently", value = { 5 }, },
				},
			},
			[2] = { name = "Stalker of the Endless Dunes",
				mods = {
					-- enchantment_boots_movement_speed_+%_when_not_hit_for_4_seconds
					[1] = { line = "6% increased Movement Speed if you haven't been Hit Recently", value = { 6 }, },
				},
			},
		},
	},
	["Ryslatha"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Ryslatha",
				mods = {
					-- life_flasks_gain_X_charges_every_3_seconds_if_you_have_not_used_a_life_flask_recently
					[1] = { line = "Life Flasks gain 3 Charges every 3 seconds if you haven't used a Life Flask Recently", value = { 3 }, },
				},
			},
			[2] = { name = "Gorulis, Will-Thief",
				mods = {
					-- life_recovery_+%_from_flasks_while_on_low_life
					[1] = { line = "60% increased Life Recovery from Flasks used when on Low Life", value = { 60 }, },
				},
			},
		},
	},
}