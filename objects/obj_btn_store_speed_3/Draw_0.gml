/// @description draw text on btn
draw_self();

draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//draw_text_color(x, y, btn_text, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_color(x, text_y, speed_3, .5, .5, 0, c_black, c_black, c_black, c_black, 1);

//draw_text(x, y, btn_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
