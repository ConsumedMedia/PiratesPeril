/// @description Insert description here


event_inherited();

if (obj_game.coins >= 5) && (obj_store.powerup_btn == true)
{
	obj_game.coins -= 5;
	obj_store.powerup_btn_2 = true;
	obj_store.powerup_btn = false;
	image_index = 1;
	obj_store.powerup_time = 3;
	
	obj_btn_store_powerup_2.image_index = 0;
	obj_btn_store_powerup_2.image_alpha = 1;
	obj_btn_store_powerup_2.powerups_2 = "10";
	
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
}