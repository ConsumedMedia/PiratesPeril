/// @description Insert description here

// button locked until player health = 4
if (obj_store.ship_health_btn == false)
{	
	image_index = 1;
	image_alpha = .5;
	lives_2 = " ";
}
else 
{
	event_inherited();
}
