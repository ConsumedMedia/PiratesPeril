/// @description Insert description here
event_inherited();
if (obj_store.ship_speed_btn == false)
{	
	image_index = 1;
	image_alpha = .5;
	speed_1 = " ";
} else if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	speed_1 = lang("Buy");

} else if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	speed_1 = "5";
	text_y = y;
}



