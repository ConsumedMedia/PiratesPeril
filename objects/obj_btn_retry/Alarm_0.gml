event_inherited();
ProgressionStartRun();
if (!obj_btn_sound_fx.sound_fx_off) audio_play_sound(snd_btn, 1, false);
TransitionStart(rm_game, sq_fadeout, sq_fadein);
