/// @description Initialize variables and functions
if obj_persistent.is_ai == true {
	game_mode = GameMode.VsComputer;
} else {
	game_mode = GameMode.VsPlayer;
}
player1 = noone;
player2 = noone;

enum GameMode {
	VsComputer,
	VsPlayer,
}

audio_stop_all()

if obj_persistent.round_cur == 1 {
	audio_play_sound(snd_background1, 6, true)
} else if obj_persistent.round_cur == 2 {
	audio_play_sound(snd_background2, 5, true)
} else if obj_persistent.round_cur == 3 {
	audio_play_sound(snd_background3, 4, true)
}