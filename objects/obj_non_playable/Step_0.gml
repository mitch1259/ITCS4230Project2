/// @description Face opponent and move

if hp <= 0 {
	obj_persistent.win = true
	room_goto(EndRoom)
}

event_inherited();

if character_action != CharacterAction.None {
	exit;
}

switch ai_action {
	case AiAction.DoNothing:
		do_nothing();
		break;
	case AiAction.MoveAway:
		move_away();
		break;
	case AiAction.MoveTowards:
		move_towards();
		break;
}

horizontal_collision();
vertical_collision();
