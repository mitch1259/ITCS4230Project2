/// @description Insert description here
// You can write your code in this editor

// The reason every if begins with room == EndRoom is bc this object gets created before obj_persistent,
// so we use something that is guaranteed false when the game starts. It is also true when we need the
// functionality so it works well
if room == EndRoom and (obj_persistent.playerone == obj_persistent.playertwo or obj_persistent.is_ai == false or obj_persistent.win == false) {
	obj_back.x = 960
	obj_back.y = 832
	instance_destroy()
}