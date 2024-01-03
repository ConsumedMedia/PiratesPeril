/// @description set lang to english

event_inherited();

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
lang_set("en");
