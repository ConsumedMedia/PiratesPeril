/// @description check to see if music is already playing or if sound was selected off

if !audio_is_playing(snd_pirate_shooter_loop) && (image_index == 0) 
{	
	audio_play_sound(snd_pirate_shooter_loop, 0, true);
}
