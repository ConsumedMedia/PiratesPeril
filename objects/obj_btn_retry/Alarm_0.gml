/// @description player goes to room_game
event_inherited();
if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
if (obj_game.points < global.points) || !(file_exists("savedgames.save"))
{
	//show_debug_message("Game points GREATER than global");
	SaveGame();
}

LoadGame();
obj_game.points = 0;
TransitionStart(rm_game, sq_fadeout, sq_fadein);