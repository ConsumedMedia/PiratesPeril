/// @description Insert description here

event_inherited();

if (obj_game.coins >= 15) && (obj_store.powerup_time == 2)
{
	obj_game.coins -= 15;
	obj_store.powerup_btn_btn_3 = true;
	image_index = 1;
	obj_store.powerup_time = 10;
	//show_debug_message("coins: " + string(obj_game.coins));
	//show_debug_message("player health: " + string(obj_game.player_health));
}