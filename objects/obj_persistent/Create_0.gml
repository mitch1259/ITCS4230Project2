/// @description Logo Path
// You can write your code in this editor

path_start(path_logo, 60, path_action_stop, true)

function path_ended() {
	instance_create_layer(608, 864, "Instances", obj_start)
	obj_start.image_xscale = 0.5
	obj_start.image_yscale = 0.5
	instance_create_layer(1024, 864, "Instances", obj_select_char)
	obj_select_char.image_xscale = 0.5
	obj_select_char.image_yscale = 0.5
	path_done = true
}