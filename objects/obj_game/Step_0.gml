powerup_time -= delta_time / 1000000;

if !(room == rm_game)
{	
	gamepad_set_vibration(0, 0, 0);
	
}

if (points <= 950)
{
	level = 1;
	//show_debug_message("level 1");
}
else if (points <= 1950)
{
	level = 2;
	//show_debug_message("level 2");
}
else if (points <= 2950)
{
	level = 3;
	//show_debug_message("level 3");
}

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
    if gamepad_is_connected(i)
    {
        global.gp[i] = true;
		global.gamepad = i;
    }
    else
    {
        global.gp[i] = false;
    }
}

if gamepad_is_connected(global.gamepad)
{
	if gamepad_button_check_pressed(global.gamepad, gp_start)
	{
		if (room == rm_game) && (paused == false)
{
	paused = true;
	instance_deactivate_all(true);
	instance_activate_object(obj_btn_sound);
	instance_activate_object(obj_btn_sound_fx);
	instance_activate_object(obj_mouse_cursor);
	
	
	// create buttons to appear ONLY when game paused.
}
else if (room == rm_game) && (paused == true) 
{
	paused = false;
	instance_activate_all();
	//instance_deactivate_object(obj_btn_sound);
	//instance_deactivate_object(obj_btn_sound_fx);
	instance_deactivate_object(obj_mouse_cursor);
	//exit;
}
	}
}
