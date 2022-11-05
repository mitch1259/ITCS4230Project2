/// @description Spawn characters

player1 = instance_create_layer(192, 768, "Instances", obj_tester1);

switch game_mode {
	case GameMode.VsComputer:
		player2 = instance_create_layer(1728, 768, "Instances", obj_non_playable);
		break;
	case GameMode.VsPlayer:
		player2 = instance_create_layer(1728, 768, "Instances", obj_tester2);
		break;
}

player1.opponent = player2;
player2.opponent = player1;
