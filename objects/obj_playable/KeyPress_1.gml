/// @description Check combo

var is_valid_key = false;

// Set combos
if keyboard_check_pressed(action1_key) {
	show_debug_message("Key pressed: Action 1");

	add_to_combo(ComboKey.Action1);
	is_valid_key = true;
}

if keyboard_check_pressed(action2_key) {
	show_debug_message("Key pressed: Action 2");

	add_to_combo(ComboKey.Action2);
	is_valid_key = true;
}

if keyboard_check_pressed(action3_key) {
	show_debug_message("Key pressed: Action 3");

	add_to_combo(ComboKey.Action3);
	is_valid_key = true;
}

if is_valid_key and current_combo_idx == array_length(current_combo) {
	// If valid key and current combo is correct length
	active_combo = current_combo_validity();

	if active_combo != ComboState.None {
		// If valid combo, disable combo timeout
		alarm[0] = -1;
	}

	switch active_combo {
		case ComboState.Special:
			show_debug_message("Active combo: Special");
			break;
	}
}
