draw_set_font(fnt_game);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (room == rm_game && instance_exists(obj_player))
{
    draw_text(10, 10, "SCORE: " + string(points));
    draw_text(10, 40, "HEALTH:");
    for (var i = 0; i < player_health; i++)
    {
        draw_sprite(spr_heart, 0, 140 + (i * 20), 50);
    }
    draw_text(10, 70, "HIGH SCORE: " + string(highscore));
    draw_text(10, 100, "RUN COINS: " + string(run_coins));
    draw_text(10, 130, "REPUTATION: " + string(level));

    if (global.pp_progression.quest.active || global.pp_progression.quest.complete)
    {
        draw_text(10, 160, "FERRETS: " + string(global.pp_progression.quest.rescued)
            + "/" + string(PP_FERRET_TARGET));
    }
}

if (room == rm_store)
{
    draw_set_halign(fa_center);
    draw_text(400, 50, "PLUNDERER'S PORT");
    draw_text_transformed(400, 120, "STOCK UP FOR YER TRAVELS", 0.75, 0.75, 0);
    draw_set_halign(fa_left);
}

if (room == rm_languages)
{
    draw_set_halign(fa_center);
    draw_text(400, 150, "SETTINGS");
    draw_set_halign(fa_left);
}

if (room == rm_menu_died)
{
    draw_set_alpha(0.88);
    draw_set_color(make_color_rgb(35, 43, 52));
    draw_roundrect(120, 120, 680, 265, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(400, 145, global.pp_new_high_score ? "NEW HIGH SCORE!" : "RUN COMPLETE");
    draw_text_transformed(400, 182, "SCORE: " + string(global.pp_last_run_score), 0.65, 0.65, 0);
    draw_text_transformed(400, 212, "RUN COINS: " + string(global.pp_last_run_coins)
        + "   BANKED: " + string(global.pp_last_banked_coins), 0.5, 0.5, 0);
    if (global.pp_progression.quest.active || global.pp_progression.quest.complete)
    {
        draw_text_transformed(400, 238, "FERRETS: " + string(global.pp_progression.quest.rescued)
            + "/" + string(PP_FERRET_TARGET), 0.5, 0.5, 0);
    }
    draw_set_halign(fa_left);
}

if (paused)
{
    // Cover the still-running room effect with the last complete gameplay
    // frame, then add a stable pause treatment in GUI space.
    if (surface_exists(pause_surface))
    {
        draw_surface_stretched(pause_surface, 0, 0, 800, 800);
    }

    draw_set_alpha(0.52);
    draw_set_color(c_black);
    draw_rectangle(0, 0, 800, 800, false);

    draw_set_alpha(0.92);
    draw_set_color(make_color_rgb(35, 43, 52));
    draw_roundrect(210, 210, 590, 665, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(400, 275, "PAUSED");
    draw_text_transformed(400, 330, "ESC / START: QUICK RESUME", 0.45, 0.45, 0);

    for (var i = 0; i < array_length(pause_menu_labels); i++)
    {
        var _button_y = 430 + i * 70;
        var _selected = (i == pause_menu_selected);

        draw_set_color(_selected ? c_yellow : make_color_rgb(74, 84, 94));
        draw_roundrect(260, _button_y - 25, 540, _button_y + 25, false);
        draw_set_color(_selected ? c_black : c_white);
        draw_text_transformed(400, _button_y, pause_menu_labels[i], 0.65, 0.65, 0);
    }

    draw_set_color(c_white);
    draw_text_transformed(400, 635, "UP/DOWN: SELECT   ENTER/A: CONFIRM", 0.38, 0.38, 0);

    // Normal Draw events are beneath the frozen GUI snapshot, so redraw the
    // active custom cursor here for mouse navigation.
    if (instance_exists(obj_mouse_cursor))
    {
        var _cursor_index = global.pp_progression.cosmetics.selected;
        if (_cursor_index == 4)
        {
            draw_sprite_ext(spr_ferret_32, 0, obj_mouse_cursor.x, obj_mouse_cursor.y,
                0.75, 0.75, 0, c_white, obj_mouse_cursor.image_alpha);
        }
        else
        {
            draw_sprite_ext(spr_mouse_cursor, clamp(_cursor_index, 0, 3),
                obj_mouse_cursor.x, obj_mouse_cursor.y, 0.5, 0.5, 0,
                c_white, obj_mouse_cursor.image_alpha);
        }
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
