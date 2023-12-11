y = ystart;
if (room == rm_game) || (room == rm_store) exit;

// btn sound FX check if on
if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}


// selection of btn image based on on or off
if (image_index == 0)
{
	image_index = 1;
	audio_stop_sound(snd_pirate_shooter_loop);
}
 else if (image_index == 1)
 {
	
if !audio_is_playing(snd_pirate_shooter_loop) 
{	
	audio_play_sound(snd_pirate_shooter_loop, 0, true);
}
	 image_index = 0;
 }