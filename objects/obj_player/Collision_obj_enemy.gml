/// @description player AFTER getting hit by enemy
if (powerup == 2) exit;


 if !(obj_game.player_health < 0)
	{
		obj_game.player_health -= 1;
		effect_create_above(ef_explosion, x, y, 1, c_orange);
		//instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_fire_blast);
		instance_destroy(other);	
	}

 	






