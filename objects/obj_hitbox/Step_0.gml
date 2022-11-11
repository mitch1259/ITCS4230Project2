/// @description Check for collision and hurt opponent

sync_location();

var collisions = ds_list_create();

var len = collision_rectangle_list(X1, Y1, X2, Y2, obj_character, false, true, collisions, false);

for (var i = 0; i < len; i++) {
	var collision = collisions[| i];

	if collision == parent.opponent {
		show_debug_message("Hit opponent");

		parent.hit(damage);
		instance_destroy();
	}
}

ds_list_destroy(collisions);
