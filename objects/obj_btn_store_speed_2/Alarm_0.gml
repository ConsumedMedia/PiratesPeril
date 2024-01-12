/// @description Insert description here

event_inherited();

if (obj_game.coins >= 10) && (obj_store.ship_speed == 0)
{
	obj_game.coins -= 10;
	obj_store.ship_speed_btn_3 = true;
	image_index = 1;
	obj_store.ship_speed = 2;

	
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
}