if (global.pp_progression.settings.music_enabled && !audio_is_playing(snd_pirate_shooter_loop))
{
    audio_play_sound(snd_pirate_shooter_loop, 0, true);
}
image_index = global.pp_progression.settings.music_enabled ? 0 : 1;
