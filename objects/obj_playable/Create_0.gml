/// @description Initialize variables and functions

event_inherited();

#region Combos

current_combo = array_create(2);
current_combo_idx = 0;
combo_timeout = combo_timeout * game_get_speed(gamespeed_fps);

enum ComboKey {
	Up,
	Left,
	Right,
	Action1,
	Action2,
	Action3,
}

// Right now combos must be the same length
all_combos = [
	{ action: CharacterAction.Dash, keys: [ComboKey.Left, ComboKey.Left] },
	{ action: CharacterAction.Dash, keys: [ComboKey.Right, ComboKey.Right] },
	{ action: CharacterAction.Special, keys: [ComboKey.Action1, ComboKey.Action2] },
	{ action: CharacterAction.Special, keys: [ComboKey.Action2, ComboKey.Action1] },
];

/// @desc Adds a key to the current combo and (re)starts combo timeout
/// @param {real} key key pressed
function add_to_combo(key) {
	if current_combo_idx == array_length(current_combo) {
		clear_current_combo();
	}

	current_combo[current_combo_idx] = key;
	current_combo_idx += 1;
	alarm[1] = combo_timeout;
}

/// @desc Clears current combo
function clear_current_combo() {
	current_combo_idx = 0;
	alarm[1] = -1;
}

/// @desc Checks is current combo is valid
/// @returns {real} CharacterAction or CharacterAction.None if invalid
function current_combo_validity() {
	var current_combo_len = array_length(current_combo);

	for (var all_combos_idx = 0; all_combos_idx < array_length(all_combos); all_combos_idx++) {
		// Iterate through all valid combos
		var valid_combo = all_combos[all_combos_idx];
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
			return valid_combo.action;
		}
	}

	return CharacterAction.None;
}

#endregion

/// @desc Gets x movement from keyboard
/// @returns {real} x movement

moving = false

function get_x_movement() {
	var x_movement = 0;

	if keyboard_check(move_left_key) and character_action != CharacterAction.Crouch {
		x_movement -= 1;
		sprite_index = sprite_walk
		if image_xscale = -1 {
			image_speed = 0.5
		} else {
			image_speed = -0.5
		}
		if moving {
			alarm[2] += 1
		} else {
			alarm[2] = 2
			moving = true
		}
	}
	if keyboard_check(move_right_key) and character_action != CharacterAction.Crouch {
		x_movement += 1;
		sprite_index = sprite_walk
		if image_xscale = 1 {
			image_speed = 0.5
		} else {
			image_speed = -0.5
		}
		if moving {
			alarm[2] += 1
		} else {
			alarm[2] = 2
			moving = true
		}
	}

	return x_movement;
}
