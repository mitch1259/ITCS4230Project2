/// @description Face opponent and move

event_inherited();

switch character_action {
	case CharacterAction.None:
	case CharacterAction.Crouch:
	case CharacterAction.Jump:
	case CharacterAction.Walk:
		break;
	default:
		exit;
}

switch location_state {
	case LocationState.Ground:
		if keyboard_check(jump_key) {
			vspeed -= jump_force;
			set_character_action(CharacterAction.Jump);
			set_location_state(LocationState.Air);
			break;
		}

		if character_action != CharacterAction.Crouch and keyboard_check(crouch_key) {
			// If started crouching
			set_character_action(CharacterAction.Crouch);
		} else if character_action == CharacterAction.Crouch and !keyboard_check(crouch_key) {
			// If stopped crouching
			set_character_action(CharacterAction.None);
		}

		if character_action != CharacterAction.Crouch {
			hspeed = get_x_movement() * move_speed;

			if hspeed > 0 {
				set_character_action(CharacterAction.Walk);
				image_speed = walk_speed * image_xscale;
			} else if hspeed < 0 {
				set_character_action(CharacterAction.Walk);
				image_speed = -walk_speed * image_xscale;
			} else if /* hspeed == 0 and */ character_action == CharacterAction.Walk {
				set_character_action(CharacterAction.None);
			}
		}

		// Manage collisions
		horizontal_collision();
		if !place_meeting(x, y + 1, obj_block) {
			set_location_state(LocationState.Air);
			break;
		}
		break;

	case LocationState.Air:
		// Set speed
		vspeed = clamp(vspeed, -max_vspeed, max_vspeed);
		hspeed = get_x_movement() * move_speed;

		// Manage collisions
		horizontal_collision();
		vertical_collision();
		break;
}
