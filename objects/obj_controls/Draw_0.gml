/// @description draw help
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if gamepad_is_connected(0)
{
	draw_text_transformed_color(x, y, "Move with Arrow Pad \nShoot by\nPressing 'A' button\nPause game with ESC", 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
}
else 
{	
	draw_text_transformed_color(x, y, controls_text1, 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y - 30, controls_text2, 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y - 60, controls_text3, 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);   