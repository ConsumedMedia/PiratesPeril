if (instance_exists(obj_player))
{
speed = 10;
//direction = obj_enemy2.image_angle;
direction = point_direction(x, y, obj_player.x, obj_player.y);
var _bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
			_bullet.direction += 10;
			_bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
			_bullet.direction -= 10;
}




