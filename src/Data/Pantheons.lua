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
			[2] = { name = "Shock and Horror",
				mods = {
					-- base_stun_recovery_+%
					[1] = { line = "30% increased Stun and Block Recovery", value = { 30 }, },
				},
			},
			[3] = { name = "Puruna, the Challenger",
				mods = {
					-- base_avoid_freeze_%
					[1] = { line = "Cannot be Frozen", value = { 100 }, },
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
					[1] = { line = "10% reduced Damage taken from Damage Over Time", value = { -10 }, },
				},
			},
			[2] = { name = "Arachnoxia",
				mods = {
					-- life_and_energy_shield_recovery_rate_+%_if_stopped_taking_damage_over_time_recently
					[1] = { line = "20% increased Recovery rate of Life and Energy Shield if you've stopped taking Damage Over Time Recently", value = { 20 }, },
				},
			},
			[3] = { name = "Queen of the Great Tangle",
				mods = {
					-- debuff_time_passed_+%
					[1] = { line = "Debuffs on you expire 20% faster", value = { 20 }, },
				},
			},
			[4] = { name = "Murgeth Bogsong",
				mods = {
					-- additional_chaos_resistance_against_damage_over_time_%
					[1] = { line = "+40% Chaos Resistance against Damage Over Time", value = { 40 }, },
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
			[2] = { name = "Sumter the Twisted",
				mods = {
					-- elemental_damage_taken_+%_if_not_hit_recently
					[1] = { line = "8% reduced Elemental Damage taken if you haven't been Hit Recently", value = { -8 }, },
				},
			},
			[3] = { name = "Vision of Justice",
				mods = {
					-- self_take_no_extra_damage_from_critical_strikes_if_have_been_crit_recently
					[1] = { line = "Take no Extra Damage from Critical Strikes if you have taken a Critical Strike Recently", value = { 1 }, },
				},
			},
			[4] = { name = "The Infernal King",
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
			[2] = { name = "Sebbert, Crescent's Point",
				mods = {
					-- base_avoid_projectiles_%_chance
					[1] = { line = "10% chance to avoid Projectiles", value = { 10 }, },
				},
			},
			[3] = { name = "Herald of Thunder",
				mods = {
					-- elemental_damage_taken_+%_if_been_hit_recently
					[1] = { line = "6% reduced Elemental Damage taken if you have been Hit Recently", value = { -6 }, },
				},
			},
			[4] = { name = "The Sanguine Siren",
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
					-- pantheon_abberath_ignite_duration_on_self_+%_final
					[1] = { line = "60% less Duration of Ignite on You", value = { -60 }, },
				},
			},
			[2] = { name = "Mephod, the Earth Scorcher",
				mods = {
					-- unaffected_by_burning_ground
					[1] = { line = "Unaffected by Burning Ground", value = { 1 }, },
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
					-- reflect_damage_taken_and_minion_reflect_damage_taken_+%
					[1] = { line = "You and your Minions take 50% reduced Reflected Damage", value = { -50 }, },
					-- reflect_hexes_chance_%
					[2] = { line = "50% chance to Reflect Hexes", value = { 50 }, },
				},
			},
			[2] = { name = "Piety the Empyrean",
				mods = {
					-- curse_effect_on_self_+%
					[1] = { line = "30% reduced Effect of Curses on you", value = { -30 }, },
				},
			},
		},
	},
	["Shakari"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Shakari",
				mods = {
					-- pantheon_shakari_self_poison_duration_+%_final
					[1] = { line = "50% less Duration of Poisons on You", value = { -50 }, },
					-- cannot_be_poisoned_if_x_poisons_on_you
					[2] = { line = "You cannot be Poisoned while there are at least 3 Poisons on you", value = { 3 }, },
				},
			},
			[2] = { name = "The Restless Shade",
				mods = {
					-- chaos_damage_taken_+%
					[1] = { line = "5% reduced Chaos Damage taken", value = { -5 }, },
					-- chaos_damage_taken_over_time_+%_while_in_caustic_cloud
					[2] = { line = "25% reduced Chaos Damage over Time taken while on Caustic Ground", value = { -25 }, },
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
					[1] = { line = "While stationary, gain 3% additional Physical Damage Reduction every second, up to a maximum of 9%", value = { 3 }, },
				},
			},
			[2] = { name = "The Cursed King",
				mods = {
					-- life_regeneration_rate_per_minute_%_while_stationary
					[1] = { line = "Regenerate 2% of Life per second while stationary", value = { 120 }, },
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
					[1] = { line = "25% reduced Physical Damage over Time taken while moving", value = { -25 }, },
					-- no_extra_bleed_damage_while_moving
					[2] = { line = "Moving while Bleeding doesn't cause you to take extra Damage", value = { 1 }, },
				},
			},
			[2] = { name = "Drek, Apex Hunter",
				mods = {
					-- cannot_gain_corrupted_blood_while_you_have_at_least_5_stacks
					[1] = { line = "Corrupted Blood cannot be inflicted on you if you have at least 5 Corrupted Blood Debuffs on you", value = { 1 }, },
				},
			},
		},
	},
	["Garukhan"] = {
		isMajorGod = false,
		souls = {
			[1] = { name = "Soul of Garukhan",
				mods = {
					-- shocked_effect_on_self_+%
					[1] = { line = "60% reduced Effect of Shock on you", value = { -60 }, },
				},
			},
			[2] = { name = "Stalker of the Endless Dunes",
				mods = {
					-- cannot_be_blinded
					[1] = { line = "Cannot be Blinded", value = { 1 }, },
					-- avoid_maim_%_chance
					[2] = { line = "You cannot be Maimed", value = { 100 }, },
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
			[2] = { name = "The Forgotten Soldier",
				mods = {
					-- life_recovery_+%_from_flasks_while_on_low_life
					[1] = { line = "60% increased Life Recovery from Flasks used when on Low Life", value = { 60 }, },
				},
			},
		},
	},
}