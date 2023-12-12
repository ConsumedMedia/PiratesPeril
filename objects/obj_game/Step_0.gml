powerup_time -= delta_time / 1000000;

if !(room == rm_game)
{	
	gamepad_set_vibration(0, 0, 0);
}

if (points <= 1950)
{
	level = 1;
}
else if (points <= 2000)
{
	level = 2;
}