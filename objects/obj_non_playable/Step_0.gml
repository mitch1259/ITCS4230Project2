/// @description Face opponent and move

event_inherited();

switch active_combo {
	case ComboState.None:
		move();

		horizontal_collision();
		vertical_collision();
		break;
	case ComboState.Dash:
		dash();
		break;
}
