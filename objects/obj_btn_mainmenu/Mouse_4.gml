/// @description player selects bnt_mainmenu
// Inherit the parent event
//event_inherited();

image_index = 1;
text_y = y + 10;
alarm[0] = 10;

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
