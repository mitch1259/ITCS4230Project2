/// @description Set Sprite
// You can write your code in this editor

if room == Start{
	if !audio_is_playing(snd_background3) {
		audio_stop_all()
		audio_play_sound(snd_background3, 3, true)
	}
	sprite_index = spr_logo
	if path_done then path_ended();
} else {
	sprite_index = noone
	if room != CharSelect and round_cur != 3 then audio_stop_sound(snd_background3)
}