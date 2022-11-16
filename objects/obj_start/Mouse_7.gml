/// @description Start Game
// You can write your code in this editor

if room == Start {
	room_goto(PlayGame)
	score = 0
}

if room == EndRoom and obj_persistent.playerone == CharacterName.Luna {
	if obj_persistent.playertwo == CharacterName.Paulina {
		obj_persistent.playertwo = CharacterName.Sean
		room_goto(PlayGame)
	} else if obj_persistent.playertwo == CharacterName.Sean {
		// obj_persistent.playertwo = CharacterName.Jessica
		// room_goto(PlayGame)
	}
}