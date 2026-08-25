if (instance_exists(obj_player)) RunDirectorSpawn(x, y, image_angle);
alarm[0] = irandom_range(60, RunDirectorSpawnDelay(obj_game.points));
