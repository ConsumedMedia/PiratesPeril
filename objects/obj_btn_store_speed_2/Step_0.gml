/// @description Insert description here

// button locked until player health = 4
if (obj_store.ship_speed_btn_2 == false)
{	
	image_index = 1;
	image_alpha = .5;
	speed_2 = " ";
} else if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	speed_2 = lang("Buy");

} else if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	speed_2 = "10";
	text_y = y;
}

