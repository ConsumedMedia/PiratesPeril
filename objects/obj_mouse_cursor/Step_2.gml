/// @description 
/* if gamepad_is_connected(0) 
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
*/
if (room == rm_game) && (obj_game.paused == false)
{
	invisible_timer--;
	
	if (invisible_timer <= 0)
	{
		image_alpha -= 0.05;
	}
}
else
 {
	 image_alpha = 1;
	 invisible_timer = invisible_time;
 }