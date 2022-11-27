/// @description Initialize variables and functions

opponent = noone;

sprite_index = sprite_idle;
mask_index = sprite_idle;

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
			//show_debug_message("Location state: Ground");

			vspeed = 0;
			gravity = 0;
			location_state = LocationState.Ground;
			break;
		case LocationState.Air:
			//show_debug_message("Location state: Air");

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
	var collision = instance_place(x , y + vspeed + gravity, obj_block);

	if collision != noone {
		if (vspeed + gravity) > 0 {
			//show_debug_message("Collision: Floor");

			y = collision.bbox_top - (bbox_bottom - y);
			set_location_state(LocationState.Ground);
		} else {
			//show_debug_message("Collision: Ceiling");

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
			//show_debug_message("Collision: Right Wall");

			x = collision.bbox_left - (bbox_right - x);
		} else {
			//show_debug_message("Collision: Left Wall");

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
	Punch,
	Kick,
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

		case CharacterAction.Punch:
		case CharacterAction.Kick:
			switch new_action {
				case CharacterAction.None:
					sprite_index = sprite_idle;
					break;

				case CharacterAction.Special:
					show_debug_message("Active action: Special");

					sprite_index = sprite_idle;

					if instance_exists(hitbox) {
						instance_destroy(hitbox);
					}
					hitbox = noone;
					break;
				}
			break;

		case CharacterAction.None:
			switch new_action {
				case CharacterAction.Punch:
					show_debug_message("Active action: Punch");

					sprite_index = sprite_punch;
					hspeed = 0;

					vertical_collision();

					alarm[0] = punch_total_time;
					break;

				case CharacterAction.Kick:
					show_debug_message("Active action: Kick");

					sprite_index = sprite_kick;
					hspeed = 0;

					vertical_collision();

					alarm[0] = kick_total_time;
					break;

				case CharacterAction.Dash:
					show_debug_message("Active action: Dash");

					hspeed = sign(hspeed) * dash_speed;
					vspeed = 0;
					gravity = 0;

					horizontal_collision();

					alarm[0] = dash_time;
					break;

				case CharacterAction.Special:
					show_debug_message("Active action: Special");
					break;
			}
			break;
	}

	character_action = new_action;
}

#endregion

#region Character action: implementation

dash_time = dash_time * game_get_speed(gamespeed_fps);

punch_total_time = floor(sprite_get_number(sprite_punch) * (game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_punch)));
kick_total_time = floor(sprite_get_number(sprite_kick) * (game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_kick)));

punch_stun_time = punch_stun_time * game_get_speed(gamespeed_fps);
kick_stun_time = kick_stun_time * game_get_speed(gamespeed_fps);

/// @desc Run punch action
function punch() {
	vertical_collision();

	var time_elapsed = punch_total_time - alarm[0];

	if time_elapsed == punch_active_frame {
		// If start up is finished, activate punch
		hitbox = instance_create_layer(0, 0, "Instances", obj_hitbox,
			{parent: id, damage: punch_damage, x_offset: punch_x_offset, y_offset: punch_y_offset, height: punch_height, width: punch_width}
		);
	} else if time_elapsed == punch_recovery_frame {
		// If punch is finished and player is in recovery
		if instance_exists(hitbox) {
			instance_destroy(hitbox);
		}
		hitbox = noone;
	}
}

/// @desc Run kick action
function kick() {
	vertical_collision();

	var time_elapsed = kick_total_time - alarm[0];

	if time_elapsed == kick_active_frame {
		// If start up is finished, activate kick
		hitbox = instance_create_layer(0, 0, "Instances", obj_hitbox,
			{parent: id, damage: kick_damage, x_offset: kick_x_offset, y_offset: kick_y_offset, height: kick_height, width: kick_width}
		);
	} else if time_elapsed == kick_recovery_frame {
		// If kick is finished and player is in recovery
		if instance_exists(hitbox) {
			instance_destroy(hitbox);
		}
		hitbox = noone;
	}
}

/// @desc Run dash action
function dash() {
	horizontal_collision();
}

/// @desc Run special action
function special() {
	alarm[0] = 1; // Instantly finish (until implemented)
}

#endregion

#region Hit and Hurt

hitbox = noone;

/// @desc Deal damage to `self`
/// @param {real} damage damage dealt
function hurt(damage) {
	hp -= damage;
}

/// @desc Deal damage to opponent and increase energy
/// @param {real} damage damage dealt
function hit(damage) {
	opponent.hurt(damage);
	
	//try both, maybe both together??
	energy += energy_gain;
	energy += damage
}

#endregion
