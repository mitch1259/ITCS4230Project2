/// @description Insert description here
// You can write your code in this editor


if hp <= 0 {
	obj_persistent.win = true
	room_goto(EndRoom)
}

// Inherit the parent event
event_inherited();

