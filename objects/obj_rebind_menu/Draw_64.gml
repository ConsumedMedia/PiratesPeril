draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// A dedicated panel keeps the controls readable without relying on the old,
// stretched textbox sprite.
draw_set_alpha(0.88);
draw_set_color(make_color_rgb(45, 53, 62));
draw_roundrect(100, 150, 700, 615, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_text(400, 125, "CONTROLS");

for (var i = 0; i < array_length(actions); i++)
{
    var _y = row_start + i * row_gap;
    var _colour = (i == selected) ? c_yellow : c_white;

    if (i == selected)
    {
        draw_set_alpha(0.16);
        draw_set_color(c_yellow);
        draw_roundrect(125, _y - 19, 675, _y + 19, false);
        draw_set_alpha(1);
    }

    draw_set_color(_colour);
    draw_set_halign(fa_right);
    draw_text_transformed(375, _y, labels[i], 0.72, 0.72, 0);
    draw_set_halign(fa_left);
    draw_text_transformed(425, _y, "< " + PPInputKeyName(variable_struct_get(global.pp_bindings, actions[i])) + " >", 0.72, 0.72, 0);
}

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(400, 562, global.pp_rebind_message, 0.48, 0.48, 0);
draw_text_transformed(400, 594, "UP/DOWN: SELECT   ENTER/A: REBIND   ESC/B: BACK", 0.38, 0.38, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
