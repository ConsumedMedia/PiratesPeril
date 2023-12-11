  /// @description player controls
  
  
// direction and movement
if keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu)
{
	motion_add(image_angle, 0.03);
	stopped = false;
}

if keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd)
{
	motion_add(image_angle, -0.03);
	stopped = false;
}

if keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl)
{
	image_angle += 4;
	stopped = false;
}

if keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr)
{
	image_angle -= 4;
	stopped = false;
}

move_wrap(true, true, 0);

// fire cannon
if mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)
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
}

// player died
if (obj_game.player_health == 0 || obj_game.player_health <= 0)

{
	effect_create_above(ef_explosion, x, y, 1, c_orange);
	instance_destroy(obj_wake);
	obj_game.player_health = 3;
	obj_store.ship_health = 0;
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