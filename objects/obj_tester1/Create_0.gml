/// @description Initialize enum and functions

enum LocationState {
	Ground,
	Air,
}

/// @desc Transition between location states
/// @param {real} state LocationState
function set_location_state(state) {
	switch state {
		case LocationState.Ground:
			show_debug_message("Location state: Ground");

			vspeed = 0;
			gravity = 0;
			location_state = LocationState.Ground;
			break;
		case LocationState.Air:
			show_debug_message("Location state: Air");

			gravity = gravity_force;
			location_state = LocationState.Air;
			break;
	}
}

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

/// @desc Checks for and fixes `y` on vertical collisions
/// @returns {bool} Did collide
function vertical_collision() {
	var collision = instance_place(x , y + vspeed, obj_block);

	if collision != noone {
		if vspeed > 0 {
			show_debug_message("Collision: Floor");

			y = collision.bbox_top - (bbox_bottom - y);
			set_location_state(LocationState.Ground);
		} else {
			show_debug_message("Collision: Ceiling");

			y = collision.bbox_bottom - (bbox_top - y);
			vspeed = 0;
		}

		return true;
	}

	return false;
}

/// @desc Checks for and fixes `x` on horizontal collisions
/// @returns {bool} Did collide
function horizontal_collision() {
	var collision = instance_place(x + hspeed, y, obj_block);

	if collision != noone {
		if hspeed > 0 {
			show_debug_message("Collision: Right Wall");

			x = collision.bbox_left - (bbox_right - x);
		} else {
			show_debug_message("Collision: Left Wall");

			x = collision.bbox_right - (bbox_left - x);
		}

		hspeed = 0;

		return true;
	}

	return false;
}
