if (obj_game.player_health < 3) && (obj_store.ship_health == 0)
{
	sprite_index = spr_boat_wake2;
}
else if (obj_game.player_health < 4) && (obj_store.ship_health == 1)
{
	sprite_index = spr_boat_wake2;
}

x = obj_player.x;
y = obj_player.y;

image_angle = obj_player.image_angle;
	