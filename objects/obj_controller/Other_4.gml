/// @description Spawn characters

switch game_mode {
	case GameMode.VsComputer:
		break;
	case GameMode.VsPlayer:
		player1 = instance_create_layer(192, 768, "Instances", obj_tester1);
		player2 = instance_create_layer(1728, 768, "Instances", obj_tester2);

		player1.opponent = player2;
		player2.opponent = player1;
		break;
}
