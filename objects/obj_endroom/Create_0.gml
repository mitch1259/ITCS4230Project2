/// @description Set win/lose
// You can write your code in this editor
if obj_persistent.win == true and obj_persistent.is_ai == true {
	sprite_index = spr_win
} 

if obj_persistent.is_ai == false {
	if obj_persistent.win == true {
		sprite_index = spr_winlose
	} else {
		sprite_index = spr_losewin
	}
}