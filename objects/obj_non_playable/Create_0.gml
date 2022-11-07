/// @description Initialize variables and functions

event_inherited();

alarm[1] = 1.0 * game_get_speed(gamespeed_fps);

#region AI action

ai_action = AiAction.DoNothing;

enum AiAction {
	DoNothing,
	MoveTowards,
	MoveAway,
}

/// @desc Transition between action states
/// @param {real} new_action ActionState
function set_ai_action(new_action) {
	switch new_action {
		case AiAction.DoNothing:
			hspeed = 0;
			break;
		case AiAction.MoveTowards:
			break;
		case AiAction.MoveAway:
			break;
	}

	ai_action = new_action;
}

#endregion

#region AI action: Movement

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

	if abs(x - opponent.x) < (dash_speed * dash_time) and place_meeting(x + hspeed, y, obj_block) {
		// If trapped between player and wall, do dash action
		hspeed = -hspeed;
		set_character_action(CharacterAction.Dash);
	}
}

#endregion
