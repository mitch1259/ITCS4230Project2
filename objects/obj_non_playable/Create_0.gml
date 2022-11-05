/// @description Initialize variables and functions

event_inherited();

alarm[1] = 1.0 * game_get_speed(gamespeed_fps);

#region Action state

action_state = ActionState.DoNothing;

enum ActionState {
	DoNothing,
	MoveTowards,
	MoveAway,
}

/// @desc Transition between action states
/// @param {real} state ActionState
function set_action_state(state) {
	switch state {
		case ActionState.DoNothing:
			move = do_nothing;
			hspeed = 0;
			break;
		case ActionState.MoveTowards:
			move = move_towards;
			break;
		case ActionState.MoveAway:
			move = move_away;
			break;
	}

	action_state = state;
}

#endregion

#region Movement

/// @desc Do nothing
function do_nothing() {}

/// @desc Move towards `opponent`
function move_towards() {
	var x_movement = sign(opponent.x - x);

	hspeed = x_movement * move_speed;
}

/// @desc Move away from `opponent`
function move_away() {
	var x_movement = sign(x - opponent.x);

	if x_movement == 0 {
		// If at the same location as the opponent, move right
		x_movement = 1;
	}

	hspeed = x_movement * move_speed;

	if abs(x - opponent.x) <= 256 and place_meeting(x + hspeed, y, obj_block) {
		// If trapped between player and wall, do dash action
		if location_state == LocationState.Ground {
			hspeed = -x_movement;
			active_combo = ComboState.Dash;
			alarm[0] = 0.10 * game_get_speed(gamespeed_fps);
		}
	}
}

set_action_state(ActionState.DoNothing);

#endregion
