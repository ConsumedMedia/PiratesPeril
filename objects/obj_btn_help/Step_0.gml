/// @description check for controller

if gamepad_is_connected(0)
{
	if (place_meeting(x, y, obj_mouse_cursor)) && !(image_index == 1)
	{
		image_index = 2;
		if (gamepad_button_check_pressed(global.gamepad, gp_face1))
		{
			image_index = 1;
			text_y = y + 10;
			alarm[0] = 10;

			if (obj_store.ship_health <= 1)
			{
				obj_store.ship_health = 0;
			}
		} else if (gamepad_button_check_released(global.gamepad, gp_face1))
		{
			text_y = y;
			image_index = 2;
		}
	} 
	else 
	{	
		image_index = 0;
		text_y = y;
	}		
}
