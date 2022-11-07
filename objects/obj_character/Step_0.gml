/// @description Face opponent and do character action

if x < opponent.x {
	image_xscale = 1;
} else {
	image_xscale = -1;
}

switch character_action {
	case CharacterAction.Dash:
		dash();
		break;
	case CharacterAction.Special:
		special();
		break;
}
