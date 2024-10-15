/// @description Insert description here
event_inherited();
// button locked until player health = 4
if (obj_store.ship_health_btn_3 == false)
{	
	image_index = 1;
	image_alpha = .5;
	lives_3 = " ";
}

if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	lives_3 = lang("Buy");
}

if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	text_y = y;
	lives_3 = "15";
}