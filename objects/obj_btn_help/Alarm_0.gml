/// @description Insert description here

//event_inherited();
image_index = 1;

if obj_btn_sound_fx.sound_fx_off == false
{
	audio_play_sound(snd_btn, 1, false);
}
// show help text
if (instance_exists(obj_controls))
{
	instance_destroy(obj_controls);
} 
else 
{
	if (instance_exists(obj_highscore))
	{	
		instance_destroy(obj_highscore);
	}
	instance_create_layer(room_width / 2, room_height - 120, "Instances", obj_controls);
}
