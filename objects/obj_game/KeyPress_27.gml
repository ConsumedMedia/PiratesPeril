/// @description pausing the game

if (room == rm_game) && (paused == false)
{
	paused = true;
	instance_deactivate_all(true);
	instance_activate_object(obj_btn_sound);
	instance_activate_object(obj_btn_sound_fx);
	instance_activate_object(obj_mouse_cursor);
	instance_activate_layer("Instances_1");
	instance_activate_object(obj_ocean);
	
	// create buttons to appear ONLY when game paused.
}
else if (room == rm_game) && (paused == true) 
{
	paused = false;
	instance_activate_all();
	//instance_deactivate_object(obj_btn_sound);
	//instance_deactivate_object(obj_btn_sound_fx);
	//instance_deactivate_object(obj_mouse_cursor);
	//exit;
}