steam_update();

powerup_time -= delta_time / 1000000;

if !(room == rm_game)
{	
	gamepad_set_vibration(0, 0, 0);
	
}
if instance_exists(obj_player)
{
	if random(2) == 2
	{
		 wind_dir = wind_y;
		// show_debug_message("random was 2");
	}
	else 
	{
		 wind_dir = wind_x;
		 // show_debug_message("random was 1");
	}
}

if (points <= 950) // under 1000
{
	//show_debug_message("Thor: " + string(thor));
	level = 1;
	//show_debug_message("wind_dir: " + string(wind_dir));
}
else if (points <= 1950) // under 2000
{
	level = 2;
	if irandom(2) == 1
	{
		wind_x = .5;
		wind_y = .5;
	}
	else
	{
		wind_x = -.5;
		wind_y = -.5;
	}
	//show_debug_message("wind_dir: " + string(wind_dir));
}
else if (points <= 2950) // under 3000
{
	level = 3;
	if irandom(2) == 1
	{
		wind_x = .7;
		wind_y = .7;
	}
	else
	{
		wind_x = -.7;
		wind_y = -.7;
	}
	
	//show_debug_message("wind_dir: " + string(wind_dir));
}
else if (points <= 3950) // under 4000
{
	level = 4;
	if irandom(2) == 1
	{
		wind_x = 1;
		wind_y = 1;
	}
	else
	{
		wind_x = -1;
		wind_y = -1;
	}
	
	//show_debug_message("wind_dir: " + string(wind_dir));
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
	instance_activate_object(input_controller_object);
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
	}
}
