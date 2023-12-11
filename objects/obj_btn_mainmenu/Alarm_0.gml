/// @description player movies to rm_menu
event_inherited();

// go to game
//room_goto(rm_menu);

if (obj_game.points < global.points) || !(file_exists("savedgames.save"))
{
	//show_debug_message("Game points GREATER than global");
	SaveGame();
}

LoadGame();

TransitionStart(rm_menu, sq_fadeout, sq_fadein);
