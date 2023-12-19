if (instance_exists(obj_player))
{
speed = 10;
//direction = obj_enemy2.image_angle;
direction = point_direction(x, y, obj_player.x, obj_player.y);
}




