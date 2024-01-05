draw_self();

if (alarm[0] > 0)
{	
	draw_set_halign(fa_center);
	var _time = round(alarm[0] / 60);
	draw_text_transformed(x, y - 60, _time, 1, 1, 0);
	draw_set_halign(fa_left);
}