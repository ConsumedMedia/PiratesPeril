/// @description load game + create variables

points = 0;
powerup_time = 10;
player_health = 3;
highscore = 0;

wind = false;
wind_direction = 0;
wind_speed = 0;
wind_x = 0;
wind_y = 0;

player_wind_x = wind_x * (wind_direction + wind_speed);
player_wind_y = wind_y * (wind_direction + wind_speed);

global.points = highscore;
global.gamepad = 0;

level = 1;
paused = false;

coin_death = 0;
coins = 0;
saved_coins = 0;

lang_set("en");

 if file_exists("savedgame.save")
{
	LoadGame();
}