/// @description IF not in menu then HIDE btn

if gamepad_is_connected(0)
{
	if (place_meeting(x, y, obj_mouse_cursor))
	{
		image_alpha = 0.6;
		if (gamepad_button_check_pressed(0, gp_face1))
		{
			y = ystart + 4;
			alarm[0] = 10;
		}
	} 
	else 
	{	
		image_alpha = 1;
	}		
}

if (room == rm_game) || (room == rm_store)
{
	image_alpha = 0;
}
else if (room == rm_menu_died) || (room == rm_menu)
{
	image_alpha = 1;
}