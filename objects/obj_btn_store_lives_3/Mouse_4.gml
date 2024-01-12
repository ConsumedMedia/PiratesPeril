/// @description buy more health
// Inherit the parent event
//event_inherited();
image_index = 1;
text_y = y + 5;

if !(image_alpha == .5)
{
	if obj_btn_sound_fx.sound_fx_off == false
	{
		audio_play_sound(snd_btn, 1, false);
	}
}

alarm[0] = 10;