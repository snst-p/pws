--[[

character = {
	name = "name", 	
	character_id = 0,
	magic = "magic"			(type of magic)
	stats = {},				(table with set of stats)
	EXP = 0,				(amount of EXP the character has)
	LVL = 1, 				(EXP level of the character)
	status = {]				(Status: effects, hitpoints)
		status_effects = {},
		hitpoints, 
	},
	moves = {}, 			(List of moves of the character)
}

]]-- 

moves = require 'battle-info/move_info'

characters = {
	leiko = {
		name = "Leiko",
		character_id = 1,
		magic = "purple",
		stats = {
			attack = 4,
			defense = 3,
			focus = 1,
			speed = 3,
			hp = 3,
		},
		EXP = 0,
		LVL = 1,
		status = {
			status_effects = {}
		},
		move = {
			moves.flower_dance,
			moves.scratch,
			moves.humiliate, 
		},
	},
	kana = {
		name = "Kana",
		character_id = 2,
		magic = "blue",
		stats = {
			attack = 4,
			defense = 3,
			focus = 4,
			speed = 2,
			hp = 1, 
		},
		EXP = 0,
		LVL = 1,
		status = {
			status_effects = {}
		},
		move = {
			moves.calamity,
			moves.sunsteel_strike,
			moves.meditate,
		},
	},
	hiko = {
		name = "Hiko",
		character_id = 3,
		magic = "green",
		stats = {
			attack = 1,
			defense = 4,
			focus = 3,
			speed = 4,
			hp = 2,
		},
		EXP = 0,
		LVL = 1,
		status = {
			status_effects = {}
		},
		move = {
			moves.floral_healing, 
			moves.dance, 
			moves.drain,

		}
	},
	irene = {
		name = "Irene", 
		character_id = 4, 
		magic = "purple", 
		stats = {
			attack = 3, 
			defense = 1, 
			focus = 3,
			speed = 3, 
			hp = 4,
		},
		EXP = 0,
		LVL = 1,
		status = {
			status_effects = {}
		},
		move = {
			moves.wrath,
			moves.poison_powder,
			moves.captivating_curse, 
		},
		-- cooldown for Irene's special move
		cooldown = {false, 0}, 
	},
}

-- set actual hitpoints
characters.hiko.status.hp = characters.hiko.stats.hp * 100
characters.leiko.status.hp = characters.leiko.stats.hp * 100
characters.kana.status.hp = characters.kana.stats.hp * 100
characters.irene.status.hp = characters.irene.stats.hp * 100

return characters