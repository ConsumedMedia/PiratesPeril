/// @description Controller Cursor Code
if gamepad_is_connected(0)
{
	if (place_meeting(x, y, obj_mouse_cursor))
	{
		
		//if (gamepad_button_check_pressed(0, gp_face1))
		//{
		//	y = ystart + 4;
		//	alarm[0] = 10;
		//}
	} 
	else 
	{	
		image_alpha = 1;
	}		
}