/// @description Set Sprite
// You can write your code in this editor

if room == Start {
	sprite_index = spr_logo
	if path_done {
		instance_create_layer(608, 864, "Instances", obj_start)
		obj_start.image_xscale = 0.5
		obj_start.image_yscale = 0.5
		instance_create_layer(1024, 864, "Instances", obj_select_char)
		obj_select_char.image_xscale = 0.5
		obj_select_char.image_yscale = 0.5
	}
} else {
	sprite_index = noone
}