/// @description 
event_inherited();

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}

if (obj_game.points < global.points) || !(file_exists("savedgames.save"))
{
	SaveGame();
	show_debug_message("Save Game");
}


// end game
game_end();    