y = ystart;
global.pp_progression.settings.music_enabled = !global.pp_progression.settings.music_enabled;
if (global.pp_progression.settings.music_enabled)
{
    image_index = 0;
    if (!audio_is_playing(snd_pirate_shooter_loop)) audio_play_sound(snd_pirate_shooter_loop, 0, true);
}
else
{
    image_index = 1;
    audio_stop_sound(snd_pirate_shooter_loop);
}
SaveGame();
