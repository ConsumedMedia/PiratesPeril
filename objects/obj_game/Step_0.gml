SteamServiceTick();
PPInputUpdateDevice();

if (keyboard_check_pressed(vk_f11))
{
    global.pp_progression.settings.fullscreen = !global.pp_progression.settings.fullscreen;
    PPDisplayApply();
    SaveGame();
}

if (room == rm_game && PPInputPausePressed()) PPPauseToggle();
if (paused)
{
    PPPauseMenuUpdate();
    exit;
}

powerup_time -= delta_time / 1000000;
level = RunDirectorReputation(points);

if (level != last_level)
{
    last_level = level;
    var _wind_strength = [0.3, 0.5, 0.7, 1.0, 1.5][level - 1];
    var _wind_sign = choose(-1, 1);
    wind_x = _wind_strength * _wind_sign;
    wind_y = _wind_strength * _wind_sign;

    if (level >= 3) SteamServiceUnlock("ACH_REPUTATION_3");
    if (level >= 5) SteamServiceUnlock("ACH_REPUTATION_5");
}

wind_dir = choose(wind_x, wind_y);
player_wind_x = wind_x * (wind_direction + wind_speed);
player_wind_y = wind_y * (wind_direction + wind_speed);
