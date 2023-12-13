/// @description load game + create variables

points = 0;
powerup_time = 10;
player_health = 3;
highscore = 0;
global.points = highscore;
level = 1;
coin_death = 0;
coins = 0;
//if !(variable_instance_exists(id, "saved_coins"))
//{
saved_coins = 0;
//}

 if file_exists("savedgame.save")
{
	LoadGame();
}