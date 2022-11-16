/// @description Spawn characters
var player1_selection = obj_persistent.playerone;
var player2_selection = obj_persistent.playertwo;

var p1_data = get_character_data(player1_selection);
var p2_data = get_character_data(player2_selection);

var p1_x = 64 + sprite_get_xoffset(p1_data.sprite_idle);
var p1_y = (64 * 16) - (sprite_get_height(p1_data.sprite_idle) - sprite_get_yoffset(p1_data.sprite_idle));

var p2_x = room_width - 64 - (sprite_get_width(p2_data.sprite_idle) - sprite_get_xoffset(p2_data.sprite_idle));
var p2_y = (64 * 16) - (sprite_get_height(p2_data.sprite_idle) - sprite_get_yoffset(p2_data.sprite_idle));

player1 = instance_create_layer(p1_x, p1_y, "Instances", obj_player1, p1_data);

switch game_mode {
	case GameMode.VsComputer:
		player2 = instance_create_layer(p2_x, p2_y, "Instances", obj_non_playable, p2_data);
		break;

	case GameMode.VsPlayer:
		player2 = instance_create_layer(p2_x, p2_y, "Instances", obj_player2, p2_data);
		break;
}

player1.opponent = player2;
player2.opponent = player1;

delete p1_data;
delete p2_data;
