/// @description Insert description here
alarm[0] = random(450);

//instance_create_layer(x, y, "Instances", obj_rock);
if instance_number(obj_enemy) < 5
{
	var inst = instance_create_layer(x, y, "Instances", obj_enemy);
	with (inst)
	{
		yspeed = 1;
	}
}