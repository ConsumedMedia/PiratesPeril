/// @description Controller Cursor code
if gamepad_is_connected(0)
{
	if (place_meeting(x, y, obj_mouse_cursor))
	{
		image_index = 1;
		lives_btn_txt = lang("Add Extra Lives");
		draw_text_transformed_color(x + 10, y, lives_btn_txt, .5, .5, 0, c_white, c_white, c_white, c_white, 1);
		
		
		//if (gamepad_button_check_pressed(0, gp_face1))
		//{
		//	y = ystart + 4;
		//	alarm[0] = 10;
		//}
	} 
	else 
	{	
		image_index = 0;
		lives_btn_txt = lang("Lives");
		draw_text_transformed_color(x + 10, y, lives_btn_txt, .5, .5, 0, c_white, c_white, c_white, c_white, 1);
		
		image_alpha = 1;
	}		
}