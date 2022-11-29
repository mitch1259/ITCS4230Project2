/// @description Start Game
// You can write your code in this editor

if room == Start {
	
	if obj_persistent.is_ai == true {
		if obj_persistent.playerone == CharacterName.Paulina then obj_persistent.playertwo = CharacterName.Luna
		if obj_persistent.playerone == CharacterName.Sean then obj_persistent.playertwo = CharacterName.Luna
		if obj_persistent.playerone == CharacterName.Luna then obj_persistent.playertwo = CharacterName.Paulina
	}
	
	room_goto(PlayGame)
	score = 0
}

if room == EndRoom and obj_persistent.playerone == CharacterName.Luna {
	if obj_persistent.playertwo == CharacterName.Paulina {
		obj_persistent.playertwo = CharacterName.Sean
		obj_persistent.round_cur = 2
		room_goto(PlayGame)
	} else if obj_persistent.playertwo == CharacterName.Sean {
		obj_persistent.playertwo = CharacterName.Luna
		obj_persistent.round_cur = 3
		room_goto(PlayGame)
	}
}

if room == EndRoom and obj_persistent.playerone == CharacterName.Paulina {
	if obj_persistent.playertwo == CharacterName.Luna {
		obj_persistent.playertwo = CharacterName.Sean
		obj_persistent.round_cur = 2
		room_goto(PlayGame)
	} else if obj_persistent.playertwo == CharacterName.Sean {
		obj_persistent.playertwo = CharacterName.Paulina
		obj_persistent.round_cur = 3
		room_goto(PlayGame)
	}
}

if room == EndRoom and obj_persistent.playerone == CharacterName.Sean {
	if obj_persistent.playertwo == CharacterName.Luna {
		obj_persistent.playertwo = CharacterName.Paulina
		obj_persistent.round_cur = 2
		room_goto(PlayGame)
	} else if obj_persistent.playertwo == CharacterName.Paulina {
		obj_persistent.playertwo = CharacterName.Sean
		obj_persistent.round_cur = 3
		room_goto(PlayGame)
	}
}