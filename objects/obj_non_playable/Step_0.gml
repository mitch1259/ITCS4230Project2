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

switch location_state {
	case LocationState.Ground:
		horizontal_collision();
		if !place_meeting(x, y + 1, obj_block) {
			set_location_state(LocationState.Air);
			break;
		}
		break;
	case LocationState.Air:
		horizontal_collision();
		vertical_collision();
		break;
}

