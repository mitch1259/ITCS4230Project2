/// @description Choose next ai action

alarm[1] = 0.10 * game_get_speed(gamespeed_fps);

if abs(x - opponent.x) > 640 {
	// If opponent is far away
	set_ai_action(AiAction.MoveTowards);
} else if abs(x - opponent.x) < 256 {
	// If opponent is too close
	set_ai_action(AiAction.MoveAway);
} else {
	if random(1.0) > (1 / 3) {
		// If sticking to same action
		exit;
	}

	switch irandom(2) {
		case 0:
			set_ai_action(AiAction.MoveTowards);
			break;
		case 1:
			set_ai_action(AiAction.MoveAway);
			break;
		case 2:
			set_ai_action(AiAction.DoNothing);
			break;
	}
}
