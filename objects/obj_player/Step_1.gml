/// @description collision of obj_wall
coll = false
var wl = collision_circle(x,y,40,obj_wall,false,false)
if wl != noone{
	coll = true
}else{
	coll = false
}

//show_debug_message($"x:{coll}")