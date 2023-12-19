/// @description Enemy bullet


if (powerup == 2) exit;


 if !(obj_game.player_health < 0)
	{
		obj_game.player_health -= 1;
		effect_create_above(ef_explosion, x, y, 1, c_orange);
		instance_destroy(other);	
	}
