/// @description IF player has coins

event_inherited();

if (obj_game.coins >= 5) && (obj_store.ship_health_btn == true)
{
	obj_game.coins -= 5;
	obj_store.ship_health_btn_2 = true;
	obj_store.ship_health_btn = false;
	image_index = 1;
	obj_store.ship_health = 1;
	
	obj_btn_store_lives_2.image_index = 0;
	obj_btn_store_lives_2.image_alpha = 1;
	obj_btn_store_lives_2.lives_2 = "10";
	
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
}