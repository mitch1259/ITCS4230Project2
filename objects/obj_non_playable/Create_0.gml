/// @description Initialize variables and functions

event_inherited();

punch_damage = punch_damage * obj_persistent.round_cur
kick_damage = kick_damage * obj_persistent.round_cur
special_damage = special_damage * obj_persistent.round_cur

alarm[1] = 1.0 * game_get_speed(gamespeed_fps);

#region Macros

#macro PUNCH_X (x + (image_xscale * punch_x_offset))
#macro PUNCH_Y (y + (image_yscale * punch_y_offset))
#macro PUNCH_X1 (PUNCH_X - (punch_width / 2))
#macro PUNCH_Y1 (PUNCH_Y - (punch_height / 2))
#macro PUNCH_X2 (PUNCH_X + (punch_width / 2))
#macro PUNCH_Y2 (PUNCH_Y + (punch_height / 2))
	
#macro KICK_X (x + (image_xscale * kick_x_offset))
#macro KICK_Y (y + (image_yscale * kick_y_offset))
#macro KICK_X1 (KICK_X - (kick_width / 2))
#macro KICK_Y1 (KICK_Y - (kick_height / 2))
#macro KICK_X2 (KICK_X + (kick_width / 2))
#macro KICK_Y2 (KICK_Y + (kick_height / 2))

#endregion

#region AI action

ai_action = AiAction.DoNothing;

enum AiAction {
	DoNothing,
	MoveTowards,
	MoveAway,
	Attack,
	DashTowards,
	DashAway,
}

/// @desc Transition between action states
/// @param {real} new_action ActionState
function set_ai_action(new_action) {
	switch new_action {
		case AiAction.DoNothing:
			hspeed = 0;
			sprite_index = sprite_idle;
			image_speed = 1;
			break;

		case AiAction.MoveTowards:
			set_character_action(CharacterAction.Walk);
			image_speed = walk_speed;
			break;

		case AiAction.MoveAway:
			set_character_action(CharacterAction.Walk);
			image_speed = -walk_speed;
			break;

		case AiAction.DashTowards:
			move_towards();
			set_character_action(CharacterAction.Dash);
			break;

		case AiAction.DashAway:
			move_away();
			set_character_action(CharacterAction.Dash);
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
