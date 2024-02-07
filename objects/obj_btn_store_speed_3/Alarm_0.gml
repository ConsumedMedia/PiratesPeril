/// @description Insert description here

event_inherited();

if (obj_game.coins >= 15) && (obj_store.ship_speed_btn_3 == true)
{
	obj_game.coins -= 15;
	obj_store.ship_speed_btn_3 = false;
	image_index = 1;
	obj_store.ship_speed = 3;
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
}