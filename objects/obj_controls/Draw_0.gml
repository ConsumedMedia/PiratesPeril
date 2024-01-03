/// @description draw help
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if gamepad_is_connected(0)
{
	//draw_text_transformed_color(x, y, "Move with Arrow Pad \nShoot by\nPressing 'A' button\nPause game with ESC", 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y, lang("move with left stick or d pad"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y + 30, lang("shoot with pressing A button"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y + 60, lang("pause game with ESC"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
}
else 
{	
	draw_text_transformed_color(x, y, lang("move with arrow keys or WASD"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y + 30, lang("shoot with mouse or spacebar"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	draw_text_transformed_color(x, y + 60, lang("pause game with ESC"), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
	
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);   