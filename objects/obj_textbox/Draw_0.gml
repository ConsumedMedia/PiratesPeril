/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x, text_y, lang("Help"), c_white, c_white, c_white, c_white, 1);

//draw_text(x, y, btn_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

// show help text

instance_create_layer(width / 2, height - 120, "Instances", obj_controls);
