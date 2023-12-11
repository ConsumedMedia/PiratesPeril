/// @description buy more health
// Inherit the parent event
event_inherited();

if (obj_game.points < global.points) || !(file_exists("savedgames.save"))
{
	//show_debug_message("Game points GREATER than global");
	SaveGame();
}

LoadGame();

TransitionStart(rm_menu, sq_fadeout, sq_fadein);