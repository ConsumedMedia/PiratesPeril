/// @description 

x = mouse_x;
y = mouse_y;

// Constrain x position within room width
if (x < 0) x = 0;
if (x > room_width) x = room_width;

// Constrain y position within room height
if (y < 0) y = 0;
if (y > room_height) y = room_height;

//default check
//if (mouse_x < 0 or mouse_x > 480)
//{
//	image_blend = c_red;
//}
//else 
//{
//	image_blend = c_white;
//}

 
if PPInputHasGamepad()
{
var xaxis = gamepad_axis_value(global.gamepad, gp_axislh);
var yaxis = gamepad_axis_value(global.gamepad, gp_axislv);
var spd_max = 16; // Maximum cursor speed for the gamepad.

offset_x += (spd_max*xaxis);
offset_y += (spd_max*yaxis);

x = (view_xview+view_wview/2) + offset_x;
y = (view_yview+view_hview/2) + offset_y;

x = clamp(x, view_xview, view_xview+view_wview);
y = clamp(y, view_yview, view_yview+view_hview);

}

var _game_paused = instance_exists(obj_game) ? obj_game.paused : false;
var _cursor_index = 0;
if (variable_global_exists("pp_progression"))
{
	_cursor_index = global.pp_progression.cosmetics.selected;
}
else if (instance_exists(obj_store))
{
	_cursor_index = obj_store.player_cursor;
}

if (!_game_paused)
{
	if (_cursor_index == 0)
	{
		image_index = 0;
	}

	if (_cursor_index == 1)
	{
		image_index = 1;
	}

	if (_cursor_index == 2)
	{
		image_index = 2;
	}
	if (_cursor_index >= 3)
	{
		image_index = 3;
	}
}
