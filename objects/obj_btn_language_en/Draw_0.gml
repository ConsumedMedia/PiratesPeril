draw_self();
draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _label = "FULLSCREEN: " + (global.pp_progression.settings.fullscreen ? "ON" : "OFF");
draw_text_color(x, text_y, _label, c_black, c_black, c_black, c_black, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
