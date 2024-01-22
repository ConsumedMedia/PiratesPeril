/// @description set lang to french

event_inherited();

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
//lang_set("fr");
obj_game.selected_lang = "fr";
lang_set(obj_game.selected_lang);