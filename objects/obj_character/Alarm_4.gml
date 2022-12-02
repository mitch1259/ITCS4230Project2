/// @description Insert description here
// You can write your code in this editor

if energy > 0 and character_action == CharacterAction.Crouch{
	energy -= 0.1 / game_get_speed(gamespeed_fps)
	alarm[4] += 1
}
if energy <= 0 then set_character_action(CharacterAction.None)