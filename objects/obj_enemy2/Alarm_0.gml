alarm[0] = 150;
//show_debug_message("Alarm 0 in obj_enemy2");
if (obj_game.level == 3) && (instance_exists(obj_player))
{
	if (!enemy_cooldown)
	{
	//show_debug_message("in the level 3 IF statement");
	//alarm[0] = 50;
	instance_create_layer(x, y, "Instances", obj_bullet_enemy);
		if obj_btn_sound_fx.sound_fx_off == false
		{	
			audio_play_sound(snd_cannon_fire, 0, false, 1, 0, random_range(0.8, 1.2));
		}
		enemy_cooldown = true;
		alarm[1] = 70;
	}
}
else exit;

		