/// @description Face opponent and move

if hp <= 0 {
	obj_persistent.win = true
	room_goto(EndRoom)
}

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
