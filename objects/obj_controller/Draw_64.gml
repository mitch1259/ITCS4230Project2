/// @description Insert description here
// You can write your code in this editor



if instance_exists(obj_tester1) draw_healthbar(8,8,256,32,obj_tester1.hp * 100,c_black,c_red,c_lime,0,true,true)
if instance_exists(obj_tester2) draw_healthbar(room_width-256,8,room_width-8,32,obj_tester2.hp * 100,c_black,c_red,c_lime,0,true,true)