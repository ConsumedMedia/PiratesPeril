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
if instance_exists(obj_thor_textbox) && obj_thor_textbox.finished == false 
{
	
}
else
{
	obj_game.seen_thor = 1;
	TransitionStart(rm_menu, sq_fadeout, sq_fadein);
}
