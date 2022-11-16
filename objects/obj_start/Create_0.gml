/// @description Insert description here
// You can write your code in this editor
if (room == EndRoom and obj_persistent.playerone == CharacterName.Luna and (obj_persistent.playertwo == CharacterName.Sean or obj_persistent.playertwo == CharacterName.Luna)) or (room == EndRoom and obj_persistent.playerone != CharacterName.Luna) { // Change Sean to Jessica later
	obj_back.x = 960
	obj_back.y = 832
	instance_destroy()
}