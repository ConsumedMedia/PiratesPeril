/// @description draw high scrore text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw_text(x, y, "Your high score is: " + string(global.points));
draw_text_transformed_color(x, y, lang("your high score is")+ ": " + string(obj_game.highscore), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);
draw_text_transformed_color(x, y + 30, lang("collected coins") + ": " + string(obj_game.saved_coins), 0.5, 0.5, 0, c_black, c_black, c_black, c_black,1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);   