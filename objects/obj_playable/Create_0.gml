/// @description Initialize variables and functions

event_inherited();

/// @desc Gets x movement from keyboard
/// @returns {real} x movement
function get_x_movement() {
	var x_movement = 0;

	if keyboard_check(move_left_key) {
		x_movement -= 1;
	}
	if keyboard_check(move_right_key) {
		x_movement += 1;
	}

	return x_movement;
}
