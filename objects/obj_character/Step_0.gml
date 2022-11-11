/// @description Face opponent and do character action
if hp <= 0 then room_goto_next()


if character_action == CharacterAction.None {
	if x < opponent.x {
		image_xscale = 1;
	} else {
		image_xscale = -1;
	}
}

switch character_action {
	case CharacterAction.Punch:
		punch();
		break;
	case CharacterAction.Kick:
		kick();
		break;
	case CharacterAction.Dash:
		dash();
		break;
	case CharacterAction.Special:
		special();
		break;
}
