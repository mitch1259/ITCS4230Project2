/// @description Initialize variables and functions

opponent = noone;

#region Location state

location_state = LocationState.Ground;

enum LocationState {
	Ground,
	Air,
}

/// @desc Transition between location states
/// @param {real} state LocationState
function set_location_state(state) {
	switch state {
		case LocationState.Ground:
			show_debug_message("Location state: Ground");

			vspeed = 0;
			gravity = 0;
			location_state = LocationState.Ground;
			break;
		case LocationState.Air:
			show_debug_message("Location state: Air");

			gravity = gravity_force;
			location_state = LocationState.Air;
			break;
	}
}

#endregion

#region Collision checks

/// @desc Checks for and fixes `y` on vertical collisions
/// @returns {bool} Did collide
function vertical_collision() {
	var collision = instance_place(x , y + vspeed, obj_block);

	if collision != noone {
		if vspeed > 0 {
			show_debug_message("Collision: Floor");

			y = collision.bbox_top - (bbox_bottom - y);
			set_location_state(LocationState.Ground);
		} else {
			show_debug_message("Collision: Ceiling");

			y = collision.bbox_bottom - (bbox_top - y);
			vspeed = 0;
		}

		return true;
	}

	return false;
}

/// @desc Checks for and fixes `x` on horizontal collisions
/// @returns {bool} Did collide
function horizontal_collision() {
	var collision = instance_place(x + hspeed, y, obj_block);

	if collision != noone {
		if hspeed > 0 {
			show_debug_message("Collision: Right Wall");

			x = collision.bbox_left - (bbox_right - x);
		} else {
			show_debug_message("Collision: Left Wall");

			x = collision.bbox_right - (bbox_left - x);
		}

		hspeed = 0;

		return true;
	}

	return false;
}

#endregion

#region Character action

character_action = CharacterAction.None;

enum CharacterAction {
	None,
	Dash,
	Special,
}

/// @desc Transition between character actions
/// @param {real} new_action CharacterAction
function set_character_action(new_action) {
	// Nested switches can be read as "Switch from `character_action` to `new_action`"
	switch character_action {
		case CharacterAction.Dash:
			switch new_action {
				case CharacterAction.None:
					if location_state == LocationState.Air {
						gravity = gravity_force;
					}
					break;
			}
			break;

		case CharacterAction.None:
			switch new_action {
				case CharacterAction.Dash:
					show_debug_message("Active combo: Dash");
					vspeed = 0;
					gravity = 0;
					alarm[0] = 0.10 * game_get_speed(gamespeed_fps);
					break;

				case CharacterAction.Special:
					show_debug_message("Active combo: Special");
					break;
			}
			break;
	}

	character_action = new_action;
}

#endregion

#region Character action: functions

/// @desc Run dash action
function dash() {
	hspeed = sign(hspeed) * move_speed * 7;
	horizontal_collision();
}

/// @desc Run special action
function special() {
	alarm[0] = 1; // Instantly finish (until implemented)
}

#endregion

#region Hit and Hurt

function hurt(damage) {
	hp -= damage;
}

function hit(damage) {
	opponent.hurt(damage);
	energy += energy_gain;
}

#endregion
