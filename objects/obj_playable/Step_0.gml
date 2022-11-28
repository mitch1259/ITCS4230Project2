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
			sprite_index = sprite_jump
			alarm[0] = 30
			set_location_state(LocationState.Air);
			set_character_action(CharacterAction.Jump)
		}
		if keyboard_check(crouch_key) {
			sprite_index = sprite_crouch
			alarm[0] = 1
			set_character_action(CharacterAction.Crouch)
			
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
		if sprite_index != sprite_jump then sprite_index = sprite_idle

		// Manage collisions
		horizontal_collision();
		vertical_collision();
		break;
}
