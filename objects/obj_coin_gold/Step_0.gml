/// @description make dissapear after 5 sec

if dissapear == true
{
	image_alpha = lerp(image_alpha, 0, 0.1);

	if image_alpha == 0
	{
		//show_debug_message("Coin Gone");
		instance_destroy();
	}
}




