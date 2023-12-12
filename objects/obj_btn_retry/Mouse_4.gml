/// @description player selects bnt_retry
// Inherit the parent event
event_inherited();

if (obj_store.ship_health <= 1)
{
	obj_store.ship_health = 0;
}