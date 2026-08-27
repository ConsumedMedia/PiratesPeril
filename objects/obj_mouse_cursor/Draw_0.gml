/// @description Insert description here
// You can write your code in this editor
image_xscale = .5;
image_yscale = .5;

var _cursor_index = 0;
if (variable_global_exists("pp_progression"))
{
    _cursor_index = global.pp_progression.cosmetics.selected;
}
else if (instance_exists(obj_store))
{
    _cursor_index = obj_store.player_cursor;
}

if (_cursor_index == 4)
{
    draw_sprite_ext(spr_ferret_32, 0, x, y, 0.75, 0.75, 0, c_white, image_alpha);
}
else
{
    draw_self();
}






















