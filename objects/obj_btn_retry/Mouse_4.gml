/// @description player selects bnt_retry
// Inherit the parent event
event_inherited();
text_y = y + 10;
image_index = 1;
if (obj_store.ship_health <= 1)
{
	obj_store.ship_health = 0;
}