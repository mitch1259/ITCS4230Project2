/// @description Face opponent and move

event_inherited();

if character_action != CharacterAction.None {
	exit;
}

switch location_state {
	case LocationState.Ground:
		// Set speed
		if keyboard_check(jump_key) {
			vspeed -= jump_force;
			set_location_state(LocationState.Air);
		}
		hspeed = get_x_movement() * move_speed;

		// Manage collisions
		horizontal_collision();
		if !place_meeting(x, y + 1, obj_block) {
			set_location_state(LocationState.Air);
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
