  /// @description player controls
  
// direction and movement

var _right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(global.gamepad, gp_padr);
var _left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(global.gamepad, gp_padl);
var _up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(global.gamepad, gp_padu);
var _down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(global.gamepad, gp_padd);

var _xinput = _right - _left;
var _yinput = _down - _up;


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
if gamepad_is_connected(global.gamepad){
	if !coll{
		move_and_collide(left_stick_x * my_speed, left_stick_y * my_speed, obj_wall, 1, 1, 1);
	}
	// Adjust image_angle towards target_angle
	var diff = angle_difference(image_angle, target_angle);
	if (diff > 0){
	    image_angle += min(5, diff);  // Adjust by 3 degrees or the remaining difference, whichever is smaller
	}else
	if (diff < 0){
	    image_angle += max(-5, diff);  // Adjust by -3 degrees or the remaining difference, whichever is larger
	}
	
}else{
	if !coll{
		move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_wall, 1, 1, 1);
		x += obj_game.wind_x;
		if (!place_meeting(x, y, obj_wall)){
			previous_x = x;
			previous_y = y;
		}
		if (place_meeting(x, y, obj_wall)){		 
			x = previous_x;
			y = previous_y;
		}
	}
	
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	var _diff = angle_difference(_dir, image_angle);
	image_angle += _diff * 0.1;	
}


// Normalize the image_angle again after adjustment
image_angle = (image_angle + 360) % 360;


if coll{
	var cl = collision_rectangle(x-16,y-1,x-8,y+1,obj_wall,false,false)
	var cr = collision_rectangle(x+8,y-1,x+16,y+1,obj_wall,false,false)
	var cu = collision_rectangle(x-1,y-8,x+1,y-16,obj_wall,false,false)
	var cd = collision_rectangle(x-1,y+8,x+1,y+16,obj_wall,false,false)
	
	if cl == noone{
		if left_pressed{x -= my_speed}
	}
	if cr == noone{
		if right_pressed{x += my_speed}
	}
	if cu == noone{
		if up_pressed{y -= my_speed}
	}
	if cd == noone{
		if down_pressed{y += my_speed}
	}
}
/*
if (obj_game.wind == false)
{
	obj_game.wind_x = 5
}
*/

// fire cannon
if mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepad, gp_face1)
{
	if (!cooldown) 
	{
				
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
		
		if !(powerup == 4)
		{
			cooldown = true;
			alarm[1] = 30;
		}
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