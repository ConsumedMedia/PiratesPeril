/// @description Insert description here
alarm[0] = random(450);

//instance_create_layer(x, y, "Instances", obj_rock);
if (instance_number(obj_enemy) < 5) && (obj_game.level == 1)
{
	var inst = instance_create_layer(x, y, "Instances", obj_enemy,
	{
		direction : image_angle,
		image_angle : 90,
	});
}
else if (instance_number(obj_enemy) < 5) && (obj_game.level == 2)
{
	if (random(3) >= 2)
		{
			var inst = instance_create_layer(x, y, "Instances", obj_enemy2,
	{
		direction : image_angle,
		image_angle : 90,
	});
		} 
		else 
		{	
			var inst = instance_create_layer(x, y, "Instances", obj_enemy,
			{
				direction : image_angle,
				image_angle : 90,
			});
		}
}