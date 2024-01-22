/// @description IF player has coins

event_inherited();

if (obj_game.coins >= 5) && (obj_store.player_cursor_0 == true)
{
	obj_game.coins -= 5;
	obj_store.player_cursor_1 = true;
	image_index = 1;
	obj_store.player_cursor = 1;
	
}

if obj_store.player_cursor_1 == true
{
	obj_store.player_cursor = 1;
}