alarm[0] = 50;
instance_create_layer(x, y, "Instances", obj_bullet_enemy);
		if obj_btn_sound_fx.sound_fx_off == false
		{	
			audio_play_sound(snd_cannon_fire, 0, false, 1, 0, random_range(0.8, 1.2));
		}
	
		