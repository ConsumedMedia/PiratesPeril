/// @description Insert description here
alarm[0] = random(450);

//instance_create_layer(x, y, "Instances", obj_rock);

var inst = instance_create_layer(x, y, "Instances", obj_rock);
with (inst)
{
	yspeed = 1;
}