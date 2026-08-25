event_inherited();
global.pp_progression.settings.music_enabled = !global.pp_progression.settings.music_enabled;
if (global.pp_progression.settings.music_enabled)
{
    if (!audio_is_playing(snd_pirate_shooter_loop)) audio_play_sound(snd_pirate_shooter_loop, 0, true);
}
else audio_stop_sound(snd_pirate_shooter_loop);
SaveGame();
