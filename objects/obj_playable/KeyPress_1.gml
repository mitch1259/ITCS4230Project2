/// @description Check combo

if active_combo != ComboState.None {
	// If using combo, don't check for another combo
	exit;
}

var is_valid_key = false;

#region Add to combo if valid

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

if keyboard_check_pressed(move_left_key) {
	add_to_combo(ComboKey.Left);
	is_valid_key = true;
}

if keyboard_check_pressed(move_right_key) {
	add_to_combo(ComboKey.Left);
	is_valid_key = true;
}

#endregion

if is_valid_key and current_combo_idx == array_length(current_combo) {
	// If valid key and current combo is correct length
	var combo = current_combo_validity();

	if combo == ComboState.None {
		// If invalid combo
		exit;
	}

	clear_current_combo();

	hspeed = get_x_movement();
	set_active_combo(combo);
}
