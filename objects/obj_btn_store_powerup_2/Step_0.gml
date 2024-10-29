/// @description Insert description here

// button locked until player health = 4
if (obj_store.powerup_btn_2 == false)
{	
	image_index = 1;
	image_alpha = .5;
	powerups_2 = " ";
} else if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	powerups_2 = lang("Buy");

} else if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	powerups_2 = "10";
	text_y = y;
}
