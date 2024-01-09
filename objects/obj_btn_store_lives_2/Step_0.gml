/// @description Insert description here

// button locked until player health = 4
if (obj_game.player_health <= 4)
{	
	image_index = 1;
	image_alpha = .5;
}
else 
{
	event_inherited();
}
