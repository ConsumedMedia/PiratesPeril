move_wrap(true, true, 100);
//image_angle += 1;

img_index += img_speed;
wake_index = img_index;

//image_angle = point_direction(x, y, obj_player.x, obj_player.y);

if (yspeed == 1)
{
	direction = 0;
	x += speed;
}

image_alpha = 1;
previous_x = x;
previous_y = y;