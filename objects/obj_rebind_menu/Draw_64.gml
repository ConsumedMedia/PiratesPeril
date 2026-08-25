draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(400, 90, "CONTROLS");

for (var i = 0; i < array_length(actions); i++)
{
    var _y = 190 + i * 52;
    var _colour = (i == selected) ? c_yellow : c_white;
    draw_set_color(_colour);
    draw_text(400, _y, labels[i] + "   < " + PPInputKeyName(variable_struct_get(global.pp_bindings, actions[i])) + " >");
}

draw_set_color(c_white);
draw_text(400, 640, global.pp_rebind_message);
draw_text(400, 700, "ARROWS / D-PAD: SELECT   ENTER / A: CHANGE   ESC / B: BACK");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
