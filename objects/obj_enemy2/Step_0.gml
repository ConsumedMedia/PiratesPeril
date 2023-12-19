move_wrap(true, true, sprite_width);


img_index += img_speed;
wake_index = img_index;

if (yspeed == 1)
{
	direction = 0;
	x += speed;
}

image_alpha = 1;
//previous_x = x;
//previous_y = y;

//if (obj_game.level == 3)
//{
	//alarm[0] = 50;	
//}