/// @description Check for collision and hurt opponent

sync_location();

var collision = collision_rectangle(X1, Y1, X2, Y2, obj_character, false, true);

if collision == parent.opponent {
	show_debug_message("Hit opponent");

	parent.hit(damage);
	instance_destroy();
}
