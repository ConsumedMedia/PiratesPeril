/// @description load game + create variables

points = 0;
powerup_time = 10;
player_health = 3;
highscore = 0;

global.points = highscore;

level = 1;
paused = false;

coin_death = 0;
coins = 0;
saved_coins = 0;


 if file_exists("savedgame.save")
{
	LoadGame();
}