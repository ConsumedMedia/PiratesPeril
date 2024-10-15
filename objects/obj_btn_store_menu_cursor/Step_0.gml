/// @description check for controller

if gamepad_is_connected(0)
{
	if (place_meeting(x, y, obj_mouse_cursor))
	{
		image_index = 1;
		cursor_btn_txt = lang("Select Cursor");
		draw_text_transformed_color(x + 10, y, cursor_btn_txt, .5, .5, 0, c_white, c_white, c_white, c_white, 1);
		
		image_alpha = 0.6;
		if (gamepad_button_check_pressed(0, gp_face1))
		{
			y = ystart + 4;
			alarm[0] = 10;
		}
	} 
	else 
	{	
		image_index = 0;
		cursor_btn_txt = lang("Cursor");
		draw_text_transformed_color(x + 10, y, cursor_btn_txt, .5, .5, 0, c_white, c_white, c_white, c_white, 1);
		
		image_alpha = 1;
	}		
}