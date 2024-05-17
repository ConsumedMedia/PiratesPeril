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

if (obj_game.seen_thor == false) && (obj_game.thor == 0)
{
	if obj_game.level >= 1
	{
		//if random(1) == 1
		//{
			TransitionStart(rm_thor_help, sq_fadeout, sq_fadein);
			//show_debug_message("Seen Thor: " + string(obj_game.seen_thor));
		//}
	}	
}
else if obj_game.seen_thor == true
{
	TransitionStart(rm_store, sq_fadeout, sq_fadein);
	//show_debug_message("seen thor: " + string(obj_game.seen_thor));
}