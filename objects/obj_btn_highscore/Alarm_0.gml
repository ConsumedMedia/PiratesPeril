event_inherited();
if (!obj_btn_sound_fx.sound_fx_off) audio_play_sound(snd_btn, 1, false);

if (instance_exists(obj_highscore))
{
    instance_destroy(obj_highscore);
}
else
{
    SteamServiceRequestLeaderboard();
    instance_create_layer(room_width / 2, 610, "Instances", obj_highscore);
}
