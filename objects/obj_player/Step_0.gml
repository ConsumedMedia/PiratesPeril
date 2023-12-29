  /// @description player controls
  
  
// direction and movement

var _right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(global.gamepad, gp_padr);
var _left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(global.gamepad, gp_padl);
var _up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(global.gamepad, gp_padu);
var _down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(global.gamepad, gp_padd);

var _xinput = _right - _left;
var _yinput = _down - _up;

//var haxis = gamepad_axis_value(global.gamepad, gp_axislh);
//var vaxis = gamepad_axis_value(global.gamepad, gp_axislv);
/*
if gamepad_is_connected(global.gamepad) 
{
var xaxis = gamepad_axis_value(global.gamepad, gp_axislh);
var yaxis = gamepad_axis_value(global.gamepad, gp_axislv);
var spd_max = 4; // Maximum cursor speed for the gamepad.

offset_x += (spd_max*xaxis);
offset_y += (spd_max*yaxis);

//x = (view_xview+view_wview/2) + offset_x;
//y = (view_yview+view_hview/2) + offset_y;

//x = clamp(x, view_xview, view_xview+view_wview);
//y = clamp(y, view_yview, view_yview+view_hview);
//dir = point_direction(0,0, yaxis, xaxis);



}
*/

//move_and_collide(xaxis * my_speed, yaxis * my_speed, obj_wall);

//move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall);

//dir = point_direction(0,0, _yinput, _xinput);
//dir = point_direction(0, 0, xaxis, yaxis);
/*
switch(dir) {
	case 0:  sprite_index = spr_boat_right; break;
	case 45: sprite_index = spr_boat_right; image_angle = 45; break;
	case 90: sprite_index = spr_boat_up; break;
	case 135: sprite_index = spr_boat_up; image_angle = 45; break;
	case 180: sprite_index = spr_boat_left; break;
	case 225: sprite_index = spr_boat_left; image_angle = 45; break;
	case 270: sprite_index = spr_boat_down; break;
	case 315: sprite_index = spr_boat_down; image_angle = 45; break;
}
*/

/*
if keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(global.gamepad, gp_padu)
{
	//image_angle -= 0.03;
	//motion_add(image_angle, 0.03);
	//image_angle = 90;
	//sprite_index = spr_boat_up;
	
	if (image_angle > 90) 
	{
		 // Decrease the image_angle by 3
        image_angle -= 3;
	}
		// Clamp the image_angle to not go below 90
        if (image_angle < 90) 
		{
			 image_angle += 3;
            //image_angle = 90;
        }
		if (image_angle == 90)
		{	
			image_angle = 90;
		}
	
	
	dir = 90;
}

if keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(global.gamepad, gp_padd)
{
	//image_angle -= 0.03;
	//motion_add(image_angle, -0.03);
	//image_angle = 270;
	//sprite_index = spr_boat_down;
	
	// Check if the image_angle is less than 270
    if (image_angle < 270) 
	{
        // Increase the image_angle by 3
        image_angle += 3;
	}

        // Clamp the image_angle to not go above 270
        if (image_angle > 270) 
		{
            //image_angle = 270;
			 image_angle -= 3;
        }
		
		if (image_angle == 0)
		{
			image_angle -= 3;
		}
		
		if (image_angle == 270) || (image_angle == -90)
		{	
			image_angle = 270;
		}
		
		
	
	dir = 270;
}

if keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(global.gamepad, gp_padl)
{
	//image_angle += 4;
	//image_angle = 180;
	//sprite_index = spr_boat_left;
	
	 // Check if the image_angle is greater than 180
    if (image_angle > 180) 
	{
        // Decrease the image_angle by 3
        image_angle -= 4;
	}
        // Adjust for wrapping around
        if (image_angle < 180) 
		{
            image_angle += 4;
        }

        // Clamp the image_angle to not go below 180
        if (image_angle == 180) 
		{
            image_angle = 180;
        }
	
	
	dir = 180;
}

if keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(global.gamepad, gp_padr)
{
	//image_angle -= 4;
	//image_angle = 0;
	//sprite_index = spr_boat_right;
	
	if (image_angle < 0 ) 
		{
        // Increase the image_angle by 3
        image_angle += 4;
		}

        // Adjust for wrapping around
        if (image_angle >= 0) 
		{
            image_angle -= 4;
        }

        // Clamp the image_angle to not exceed 360 (or go below 0)
        if (image_angle == 0) 
		{
            image_angle = 0;
        } else if (image_angle > 360) {
            image_angle = 360;
        }
    
	
	dir = 0;
}

// Normalize the image_angle
image_angle = (image_angle + 360) % 360;

// Determine direction based on input
var target_angle = -1;
if (keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(global.gamepad, gp_padu)) {
    //target_angle = 90;
	target_angle = 270;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(global.gamepad, gp_padd)) {
    //target_angle = 270;
	target_angle = 90;
}
if (keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(global.gamepad, gp_padl)) {
    //target_angle = 180;
	target_angle = 0;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(global.gamepad, gp_padr)) {
    //target_angle = 0;
	target_angle = 180;
}

// Adjust image_angle towards target_angle
if (target_angle != -1) {
    var diff = angle_difference(image_angle, target_angle);
    if (diff > 0) {
        image_angle += min(3, diff); // Adjust by 3 degrees or the remaining difference, whichever is smaller
    } else if (diff < 0) {
        image_angle += max(-3, diff); // Adjust by -3 degrees or the remaining difference, whichever is larger
    }
}

// Normalize the image_angle again after adjustment
image_angle = (image_angle + 360) % 360;

*/

// Normalize the image_angle
image_angle = (image_angle + 360) % 360;

if (!variable_global_exists("last_direction")) {
    global.last_direction = ""; // or "none"
}

// Initialize variables
var right_pressed = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(global.gamepad, gp_padr);
var left_pressed = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(global.gamepad, gp_padl);
var up_pressed = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(global.gamepad, gp_padu);
var down_pressed = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(global.gamepad, gp_padd);

// Initialize joystick values
var left_stick_x = gamepad_axis_value(global.gamepad, gp_axislh);
var left_stick_y = gamepad_axis_value(global.gamepad, gp_axislv);
var joystick_angle = point_direction(0, 0, left_stick_x, left_stick_y);
var joystick_magnitude = sqrt(left_stick_x * left_stick_x + left_stick_y * left_stick_y);
var joystick_deadzone = 0.25;

var target_angle = image_angle;  // Default to current angle

// Determine the target angle from joystick or keyboard/gamepad input
if (joystick_magnitude > joystick_deadzone) {
    target_angle = joystick_angle;
    global.last_direction = "joystick";
	image_angle = target_angle;
} else {
 
// Determine the target angle based on the key pressed
if (up_pressed) { target_angle = 270; global.last_direction = "up";}
if (down_pressed) { target_angle = 90; global.last_direction = "down";}
if (left_pressed) { target_angle = 0; global.last_direction = "left";}
if (right_pressed) { target_angle = 180; global.last_direction = "right";}

// Handle conflicting inputs (right and left pressed simultaneously)
if (right_pressed && left_pressed) {
    // Determine the direction to turn based on the current angle
    if (abs(angle_difference(image_angle, 0)) < abs(angle_difference(image_angle, 180))) {
        target_angle = 180;  // Closer to right, turn right
    } else {
        target_angle = 0;  // Closer to left, turn left
    }
}
if (global.last_direction == "left") && (target_angle == 180)
{
	show_debug_message("going from left to right");
	image_angle = 180
}
}
if gamepad_is_connected(global.gamepad)
{
	move_and_collide(left_stick_x * my_speed, left_stick_y * my_speed, obj_wall, 1, 1, 1);
	
	// Adjust image_angle towards target_angle

var diff = angle_difference(image_angle, target_angle);
if (diff > 0) {
    image_angle += min(5, diff);  // Adjust by 3 degrees or the remaining difference, whichever is smaller
} else if (diff < 0) {
    image_angle += max(-5, diff);  // Adjust by -3 degrees or the remaining difference, whichever is larger
}
	
} else {
	move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall, 1, 1, 1);
	
	if place_meeting(x, y, obj_wall)
	{
		x = xprevious + 10;
		y = yprevious + 10;
	}
	
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	var _diff = angle_difference(_dir, image_angle);
	image_angle += _diff * 0.1;	
}



// Normalize the image_angle again after adjustment
image_angle = (image_angle + 360) % 360;



// fire cannon
if mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepad, gp_face1)
{
	if (!cooldown) {
				
	instance_create_layer(x, y, "Instances", obj_bullet);
	if obj_btn_sound_fx.sound_fx_off == false
	{	
		audio_play_sound(snd_cannon_fire, 0, false, 1, 0, random_range(0.8, 1.2));
	}
	
// add cannons IF powerup is enabled	
	if powerup == 1
	{
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 10;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 10;
	}
	if powerup == 3
	{
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 90;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 90;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 180;
	}
	cooldown = true;
	alarm[1] = 30;
}
}

// player died
if (obj_game.player_health == 0 || obj_game.player_health <= 0)

{
	effect_create_above(ef_explosion, x, y, 1, c_orange);
	instance_destroy(obj_wake);
	obj_game.player_health = 3;
	obj_store.ship_health = 0;
	obj_game.coin_death = obj_game.coins * 0.10;
	obj_game.coins = obj_game.coins - obj_game.coin_death;
	show_debug_message("coin death: " + string(obj_game.coin_death));
	gamepad_set_vibration(0, 1, 1);
	instance_destroy();
	

// transition to rm_menu_died
	with (obj_game) 
	{	
		alarm[0] = 120;
	}

	if obj_btn_sound_fx.sound_fx_off == false 
	{
			audio_play_sound(snd_lose, 0, false);
	}
	TransitionStart(rm_menu_died, sq_fadeout, sq_fadein);
} 

// change player sprite when hit by enemy
if (obj_game.player_health == 2)
{
	image_index = 1;
}
else if (obj_game.player_health == 1)
{
	image_index = 2;
}