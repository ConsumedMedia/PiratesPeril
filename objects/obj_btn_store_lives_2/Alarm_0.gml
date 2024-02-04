/// @description Insert description here

event_inherited();

if (obj_game.coins >= 10) && (obj_store.ship_health_btn_2 == true)
{
	obj_game.coins -= 10;
	obj_store.ship_health_btn_3 = true;
	obj_store.ship_health_btn_2 = false;
	image_index = 1;
	obj_store.ship_health = 2;
	
	obj_btn_store_lives_3.image_index = 0;
	obj_btn_store_lives_3.image_alpha = 1;
	obj_btn_store_lives_3.lives_3 = "15";

	
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
	show_debug_message("ship health: " + string(obj_store.ship_health));
}