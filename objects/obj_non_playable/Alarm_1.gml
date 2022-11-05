/// @description Choose next action

alarm[1] = 0.10 * game_get_speed(gamespeed_fps);

if abs(x - opponent.x) > 640 {
	// If opponent is far away
	set_action_state(ActionState.MoveTowards);
} else if abs(x - opponent.x) < 256 {
	// If opponent is too close
	set_action_state(ActionState.MoveAway);
} else {
	if random(1.0) > (1 / 3) {
		// If sticking to same action
		exit;
	}
	
	switch irandom(2) {
		case 0:
			set_action_state(ActionState.MoveTowards);
			break;
		case 1:
			set_action_state(ActionState.MoveAway);
			break;
		case 2:
			set_action_state(ActionState.DoNothing);
			break;
	}
}
