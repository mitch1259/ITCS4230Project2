/// @description Initialize variables and functions

opponent = noone;

#region Location state

location_state = LocationState.Ground;

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

#endregion

#region Collision checks

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

#endregion

#region Combos

active_combo = ComboState.None;
current_combo = array_create(2);
current_combo_idx = 0;
combo_timeout = 0.25 * game_get_speed(gamespeed_fps);

enum ComboState {
	None,
	Dash,
	Special,
}
enum ComboKey {
	Up,
	Left,
	Right,
	Action1,
	Action2,
	Action3,
}

// Right now combos must be the same length
combo_list = [
	{combo: ComboState.Dash, keys: [ComboKey.Left, ComboKey.Left]},
	{combo: ComboState.Dash, keys: [ComboKey.Right, ComboKey.Right]},
	{combo: ComboState.Special, keys: [ComboKey.Action1, ComboKey.Action2]},
	{combo: ComboState.Special, keys: [ComboKey.Action2, ComboKey.Action1]},
];

/// @desc Adds a key to the current combo and (re)starts combo timeout
/// @param {real} key key pressed
function add_to_combo(key) {
	if current_combo_idx == array_length(current_combo) {
		clear_current_combo();
	}

	current_combo[current_combo_idx] = key;
	current_combo_idx += 1;
	alarm[0] = combo_timeout;
}

/// @desc Clears current combo
function clear_current_combo() {
	current_combo_idx = 0;
	alarm[0] = -1;
}

/// @desc Checks is current combo is valid
/// @returns {real} valid combo or none if invalid
function current_combo_validity() {
	var current_combo_len = array_length(current_combo);

	for (var combo_list_idx = 0; combo_list_idx < array_length(combo_list); combo_list_idx++) {
		// Iterate through all valid combos
		var valid_combo = combo_list[combo_list_idx];
		var is_valid_combo = true;

		//if current_combo_len != array_length(valid_combo.keys) {
		//	// If combo lengths are not the same
		//	continue;
		//}

		for (var i = 0; i < current_combo_len; i++) {
			// Iterate through combo keys
			if valid_combo.keys[i] != current_combo[i] {
				// If current combo doesn't match valid combo
				is_valid_combo = false;
				break;
			}
		}

		if is_valid_combo {
			return valid_combo.combo;
		}
	}

	return ComboState.None;
}

#endregion

#region Actions

/// @desc Run dash combo
function dash() {
	hspeed = sign(hspeed) * move_speed * 7;
	horizontal_collision();
}

#endregion

#region Hit and Hurt

function hurt(damage) {
	hp -= damage;
}

function hit(damage) {
	opponent.hurt(damage);
	energy += energy_gain;
}

#endregion
