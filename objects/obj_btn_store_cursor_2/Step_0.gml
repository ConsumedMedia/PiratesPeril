/// @description Insert description here
event_inherited();

if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	cursor_2 = lang("Buy");
	obj_shop_mouse_cursor.image_index = 2;
}

if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	cursor_2 = "5";
	text_y = y;
	if (obj_store.player_cursor_0 == true)
	{
		obj_shop_mouse_cursor.image_index = 0;
	}
}