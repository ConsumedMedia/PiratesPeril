y = ystart;
if (room == rm_game) || (room == rm_store) exit;

// btn sound FX check if on
if sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
if (image_index == 0)
{
	image_index = 1;
	sound_fx_off = true;
	
	
}
 else if (image_index == 1)
 {
	
	 image_index = 0;
	 sound_fx_off = false;
	
 }  