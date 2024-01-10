/// @description player selects bnt_quit
// Inherit the parent event
//event_inherited();

image_index = 1;
text_y = y + 10;
alarm[0] = 10;

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}

if (obj_store.ship_health <= 1)
{
	obj_store.ship_health = 0;
}  