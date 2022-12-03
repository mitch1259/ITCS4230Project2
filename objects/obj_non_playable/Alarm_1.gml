/// @description Choose next ai action

alarm[1] = 0.10 * game_get_speed(gamespeed_fps);

if ai_action != AiAction.Attack and ai_action != AiAction.DashTowards and ai_action != AiAction.DashAway and random(1.0) < 0.66 {
	// Sticking to same action
	exit;
}

var random_val = random(1.0);

if location_state != LocationState.Air and random(1.0) < 0.10 {
	vspeed -= jump_force;
	set_character_action(CharacterAction.Jump);
	set_location_state(LocationState.Air);
}

if collision_rectangle(PUNCH_X1, PUNCH_Y1, PUNCH_X2, PUNCH_Y2, opponent, false, true) != noone {
	// If opponent is in range

	if place_meeting(x + move_speed, y, obj_block) or place_meeting(x - move_speed, y, obj_block) {
		// If trapped between player and wall
		if energy >= 0.5 {
			set_ai_action(AiAction.Attack);
			set_character_action(CharacterAction.Special);
		} else {
			if random_val < 0.50 {
				set_ai_action(AiAction.Attack);
				set_character_action(CharacterAction.Punch);
			} else {
				set_ai_action(AiAction.Attack);
				set_character_action(CharacterAction.Kick);
			}
		}
	} else {
		// (attack_random < a + (b..c)): action has probability of 'a' and 'b..c' is sum of prior probabilities
		if random_val < 0.10 {
			set_ai_action(AiAction.DashAway);
		} else if random_val < 0.35 + (0.10) {
			set_ai_action(AiAction.MoveAway);
		} else if random_val < 0.30 + (0.35 + 0.10) {
			set_ai_action(AiAction.Attack);
			set_character_action(CharacterAction.Punch);
		} else if random_val < 0.20 + (0.30 + 0.35 + 0.10) {
			set_ai_action(AiAction.Attack);
			set_character_action(CharacterAction.Kick);
		} else if random_val < 0.05 + (0.20 + 0.30 + 0.35 + 0.10) {
			if energy >= 0.5 {
				set_ai_action(AiAction.Attack);
				set_character_action(CharacterAction.Special);
			} else {
				set_ai_action(AiAction.MoveAway);
			}
		}
	}
} else {
	if random_val < 0.40 {
		set_ai_action(AiAction.MoveTowards);
	} else if random_val < 0.20 + (0.40) {
		set_ai_action(AiAction.MoveAway);
	} else if random_val < 0.30 + (0.20 + 0.40) {
		set_ai_action(AiAction.DoNothing);
	} else if random_val < 0.10 + (0.30 + 0.20 + 0.40) {
		set_ai_action(AiAction.DashTowards);
	}
}
