/// @description Check combo

switch character_action {
	case CharacterAction.Dash:
	case CharacterAction.Special:
		exit;
}

var is_valid_key = false;

#region Add to combo if valid

if keyboard_check_pressed(action1_key) {
	//show_debug_message("Key pressed: Action 1");

	if character_action != CharacterAction.Punch and character_action != CharacterAction.Kick {
		set_character_action(CharacterAction.Punch);
	}

	add_to_combo(ComboKey.Action1);
	is_valid_key = true;
}

if keyboard_check_pressed(action2_key) {
	//show_debug_message("Key pressed: Action 2");

	if character_action != CharacterAction.Kick and character_action != CharacterAction.Punch {
		set_character_action(CharacterAction.Kick);
	}

	add_to_combo(ComboKey.Action2);
	is_valid_key = true;
}

if keyboard_check_pressed(action3_key) {
	//show_debug_message("Key pressed: Action 3");

	add_to_combo(ComboKey.Action3);
	is_valid_key = true;
}

if keyboard_check_pressed(move_left_key) {
	add_to_combo(ComboKey.Left);
	is_valid_key = true;
}

if keyboard_check_pressed(move_right_key) {
	add_to_combo(ComboKey.Right);
	is_valid_key = true;
}

#endregion

if is_valid_key and current_combo_idx == array_length(current_combo) {
	// If valid key and current combo is correct length
	var action = current_combo_validity();

	if action == CharacterAction.None {
		// If invalid combo
		exit;
	}

	clear_current_combo();

	if action == CharacterAction.Special and energy < 0.5 {
		exit;
	}

	hspeed = get_x_movement();
	set_character_action(action);
}
