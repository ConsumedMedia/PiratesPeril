/// @description Insert description here
event_inherited();
// button locked until player health = 4
if (obj_store.powerup_btn_3 == false)
{	
	image_index = 1;
	image_alpha = .5;
	powerups_3 = " ";
} else if (place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 2;
	powerups_3 = lang("Buy");

} else if (!place_meeting(x, y, obj_mouse_cursor))
{
	image_index = 0;
	powerups_3 = "15";
	text_y = y;
}