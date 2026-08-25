draw_set_font(fnt_game);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (instance_exists(obj_player))
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
    draw_text(10, 10, "BANKED COINS: " + string(global.pp_progression.banked_coins));
}

if (room == rm_languages)
{
    draw_set_halign(fa_center);
    draw_text(400, 150, "SETTINGS");
    draw_set_halign(fa_left);
}

if (room == rm_menu_died)
{
    draw_set_halign(fa_center);
    draw_text(400, 70, global.pp_new_high_score ? "NEW HIGH SCORE!" : "RUN COMPLETE");
    draw_text_transformed(400, 110, "SCORE: " + string(global.pp_last_run_score), 0.75, 0.75, 0);
    draw_text_transformed(400, 140, "RUN COINS: " + string(global.pp_last_run_coins)
        + "   BANKED: " + string(global.pp_last_banked_coins), 0.5, 0.5, 0);
    if (global.pp_progression.quest.active || global.pp_progression.quest.complete)
    {
        draw_text_transformed(400, 165, "FERRETS: " + string(global.pp_progression.quest.rescued)
            + "/" + string(PP_FERRET_TARGET), 0.5, 0.5, 0);
    }
    draw_set_halign(fa_left);
}

if (paused)
{
    draw_set_halign(fa_center);
    draw_text(400, 250, "PAUSED");
    draw_text_transformed(400, 300, "PRESS ESC OR START TO CONTINUE", 0.5, 0.5, 0);
    draw_set_halign(fa_left);
}
