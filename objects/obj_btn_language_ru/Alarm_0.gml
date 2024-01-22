/// @description set lang to russian

event_inherited();

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
//lang_set("ru");
obj_game.selected_lang = "ru";
lang_set(obj_game.selected_lang);