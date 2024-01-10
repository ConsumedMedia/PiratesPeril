/// @description Insert description here

event_inherited();

if (obj_game.coins >= 15) && (obj_store.ship_health == 2)
{
	obj_game.coins -= 15;
	obj_store.ship_health_btn_3 = true;
	image_index = 1;
	obj_store.ship_health = 1;
	show_debug_message("coins: " + string(obj_game.coins));
	show_debug_message("player health: " + string(obj_game.player_health));
}