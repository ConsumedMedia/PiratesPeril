draw_self();
//draw_sprite_ext(spr_boat_wake, wake_index, x, y, 1, 1, image_angle, c_white, 1);


//draw_sprite(spr_boat_wake,wake_index,x,y);
if instance_exists(obj_player)
{
	image_angle = point_direction(x, y, obj_player.x, obj_player.y);
}