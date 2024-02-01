move_wrap(true, true, sprite_width);


img_index += img_speed;
wake_index = img_index;
if instance_exists(obj_player)
{
	if (obj_player.powerup == 6) 
	{
		speed = 0;
	}
	else if !(obj_player.powerup == 6)
	{
		speed = 1;
	}
}
else
{
	
	//show_debug_message("obj_enemy speed = ", speed);
	if (yspeed == 1)
	{
		
		direction = 0;
		x += speed;
	}
}

image_alpha = 1;
//previous_x = x;
//previous_y = y;