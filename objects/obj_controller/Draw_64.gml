/// @description Draw health bars

if instance_exists(player1) {
	draw_healthbar(8, 8, 256, 32, player1.hp * 100, c_black, c_red, c_lime, 0, true, true);
	draw_healthbar(8, 40, 256, 50, player1.energy * 100, c_black, c_purple, c_purple, 0, true, true);
}

if instance_exists(player2) {
	draw_healthbar(room_width - 256, 8, room_width - 8, 32, player2.hp * 100, c_black, c_red, c_lime, 0, true, true);
	draw_healthbar(room_width - 256, 40, room_width - 8, 50, player2.energy * 100, c_black, c_purple, c_purple, 0, true, true);
}
