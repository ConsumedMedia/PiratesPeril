/// @description Insert description here

// button locked until player health = 4
if (obj_store.ship_health_btn_2 == false)
{	
	image_index = 1;
	image_alpha = .5;
	lives_2 = " ";
}

if (place_meeting(x, y, obj_mouse_cursor)) && (obj_store.ship_health_btn == true)
{
	image_index = 2;
	lives_2 = lang("Buy");
}

if (!place_meeting(x, y, obj_mouse_cursor)) && (obj_store.ship_health_btn == true)
{
	image_index = 0;
	text_y = y;
	lives_2 = "10";
}
