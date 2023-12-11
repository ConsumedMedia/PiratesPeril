/// @description 

x = mouse_x;
y = mouse_y;

//default check
//if (mouse_x < 0 or mouse_x > 480)
//{
//	image_blend = c_red;
//}
//else 
//{
//	image_blend = c_white;
//}

 
 if gamepad_is_connected(0) 
{
var xaxis = gamepad_axis_value(0, gp_axislh);
var yaxis = gamepad_axis_value(0, gp_axislv);
var spd_max = 16; // Maximum cursor speed for the gamepad.

offset_x += (spd_max*xaxis);
offset_y += (spd_max*yaxis);

x = (view_xview+view_wview/2) + offset_x;
y = (view_yview+view_hview/2) + offset_y;

x = clamp(x, view_xview, view_xview+view_wview);
y = clamp(y, view_yview, view_yview+view_hview);

}

