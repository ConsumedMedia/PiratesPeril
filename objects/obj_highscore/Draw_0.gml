draw_set_font(fnt_game);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x, y, "LOCAL HIGH SCORE: " + string(global.pp_progression.high_score), 0.5, 0.5, 0);
draw_text_transformed(x, y + 24, "BANKED COINS: " + string(global.pp_progression.banked_coins), 0.5, 0.5, 0);

if (!global.pp_steam.available)
{
    draw_text_transformed(x, y + 48, "STEAM LEADERBOARD AVAILABLE WHEN ONLINE", 0.35, 0.35, 0);
}
else if (array_length(global.pp_steam.leaderboard_entries) == 0)
{
    draw_text_transformed(x, y + 48, "LOADING GLOBAL TOP 10...", 0.35, 0.35, 0);
}
else
{
    for (var i = 0; i < array_length(global.pp_steam.leaderboard_entries); i++)
    {
        var _entry = global.pp_steam.leaderboard_entries[i];
        var _line = string(_entry.rank) + ". " + _entry.player_name + "  " + string(_entry.score);
        draw_text_transformed(x, y + 48 + (i * 18), _line, 0.35, 0.35, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
