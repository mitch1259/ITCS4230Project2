/// @description Determine Win/Lose
// You can write your code in this editor

if hp <= 0 {
	obj_persistent.win = false
	room_goto(EndRoom)
}

// Inherit the parent event
event_inherited();

