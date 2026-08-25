/// @description set lang to russian

event_inherited();

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
room_goto(rm_remap);
