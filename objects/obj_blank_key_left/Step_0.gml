/// @description Insert description here
// You can write your code in this editor

var binding_left = input_binding_get("left");
var binding_icon = input_binding_get_icon(binding_left);
var binding_name = input_binding_get_name(binding_left);

if binding_icon != undefined 
{
	var sprite_name = sprite_get_name(binding_icon);

	sprite_index = sprite_name;
}

show_debug_message("sprite_name = " + string(sprite_name));

show_debug_message("binding_left is: " + string(binding_left));
show_debug_message("binding_icon is: " + string(binding_icon));
show_debug_message("binding_name is: " + string(binding_name));





















