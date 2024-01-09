/// @description Insert description here

// button locked until player health = 5
if (obj_game.player_health <= 5)
{	
	image_index = 1;
	image_alpha = .5;
}
else 
{
	event_inherited();
}
