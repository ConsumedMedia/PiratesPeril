/// Persistent game bootstrap.
randomize();

points = 0;
run_coins = 0;
coins = 0;
saved_coins = 0;
highscore = 0;
player_health = 3;
powerup_time = 10;
level = 1;
last_level = 1;
paused = false;

wind = false;
wind_direction = 0;
wind_speed = 0.2;
wind_x = 0.3;
wind_y = 0.3;
wind_dir = wind_x;
player_wind_x = 0;
player_wind_y = 0;

selected_lang = "en";
seen_thor = false;
thor = false;
ferrets_active = false;
collected_ferrets = 0;

ProgressionInit();
PPInputInit();
SteamServiceInit();
PPDisplayApply();
lang_set("en");
