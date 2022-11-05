/// @description Face opponent and move

event_inherited();

switch active_combo {
	case ComboState.None:
		if location_state == LocationState.Ground {
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
		} else if location_state == LocationState.Air {
			// Set speed
			vspeed = clamp(vspeed, -max_vspeed, max_vspeed);
			hspeed = get_x_movement() * move_speed;

			// Manage collisions
			horizontal_collision();
			vertical_collision();
		}
		break;
	case ComboState.Dash:
		alarm[0] = 1; // Instantly finish (until implemented)
		break;
	case ComboState.Special:
		alarm[0] = 1; // Instantly finish (until implemented)
		break;
}
