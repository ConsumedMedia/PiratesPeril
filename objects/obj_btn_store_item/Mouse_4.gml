/// @description buy more health
// Inherit the parent event
event_inherited();

if (obj_game.coins >= 5) && (obj_store.ship_health_btn == false)
{
	obj_game.coins -= 5;
	obj_store.ship_health_btn = true;
	image_index = 1;
	obj_store.ship_health = 1;
	show_debug_message("coins: " + string(obj_game.coins));
	show_debug_message("player health: " + string(obj_game.player_health));
}