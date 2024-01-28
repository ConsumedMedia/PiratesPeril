if (obj_game.powerup_time < 0)
{	
	
	var _obj = choose(obj_powerup_spread, obj_powerup_ghost, obj_powerup_side_spread, obj_powerup_fast_shot, obj_powerup_x2, obj_powerup_stop_enemy);
	instance_create_layer(x, y, "Instances", _obj);
	obj_game.powerup_time = 20;
}
if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_rockdestroy, 0, false, 1, 0, random_range(0.6, 1.1));
}
if (obj_player.powerup == 5)
{
	obj_game.points += 100;
}
else 
{
	obj_game.points += 50;
}

enemy_life -= 1;
instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1, c_orange);

direction = random(360);

 if enemy_life == 1
{
	sprite_index = spr_boat_enemy1_2;

}

else if enemy_life == 0

{
	enemy_life = 2;
	instance_destroy();
	if (obj_game.level == 1)
	{
		instance_create_layer(x, y, "Instances", obj_coin_silver);
	}
	else if (obj_game.level == 2)
	{
		if (random(10) >= 9)
		{
			instance_create_layer(x, y, "Instances", obj_coin_gold);
		} 
		else 
		{	
			instance_create_layer(x, y, "Instances", obj_coin_silver);
		}
	}
	else if (obj_game.level == 3)
	{
		if (random(10) >= 8)
		{
			instance_create_layer(x, y, "Instances", obj_emerald);
		} 
		else if (random(10) >= 6)
		{	
			instance_create_layer(x, y, "Instances", obj_coin_gold);
		}
		else 
		{
			instance_create_layer(x, y, "Instances", obj_coin_silver);
		}
	}
}
