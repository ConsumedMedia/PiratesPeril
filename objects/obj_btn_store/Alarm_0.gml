/// @description player movies to rm_menu
event_inherited();

if (obj_store.ship_health <= 1)
		{
			obj_store.ship_health = 0;
		}
//also check for coins
if (obj_game.points < global.points) || !(file_exists("savedgames.save"))
{
	//show_debug_message("Game points GREATER than global");
	SaveGame();
}

LoadGame();

TransitionStart(rm_store, sq_fadeout, sq_fadein);