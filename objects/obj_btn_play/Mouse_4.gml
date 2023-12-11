/// @description player selects bnt_play
// Inherit the parent event
event_inherited();
if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}

if (obj_store.ship_health <= 1)
{
	obj_store.ship_health = 0;
}