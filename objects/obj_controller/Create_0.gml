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
