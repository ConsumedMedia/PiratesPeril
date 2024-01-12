/// @description draw GUI IF player object exists
if instance_exists(obj_player)
//if (room == rm_game)
{
	draw_text_transformed(10, 10, lang("Score") + ": " + string(points), 1, 1, 0);
	//draw_text_transformed(10, 40, "Health: " + string(player_health), .5, .5, 1);
	draw_text_transformed(10, 40, lang("Health") + ": ", 1, 1, 0);
	
	// drawing the heart sprites
	/// once i build out the store, i will have to figure out how to dynamically add more lives IF purchased
	if player_health == 1 
	{
		draw_sprite_ext(spr_heart, 0, 140, 50, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 2
	{
		draw_sprite_ext(spr_heart, 0, 140, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 160, 50, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 3
	{
		draw_sprite_ext(spr_heart, 0, 140, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 160, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 180, 50, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 4
	{
		draw_sprite_ext(spr_heart, 0, 140, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 160, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 180, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 200, 50, 1, 1, 1, c_white, 1);
	}
	else if player_health == 5
	{
		draw_sprite_ext(spr_heart, 0, 140, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 160, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 180, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 200, 50, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 220, 50, 1, 1, 1, c_white, 1);
	}
	
	//temp position place this in the main menu / menu died
	if variable_instance_exists(id, "highscore")
	{
		draw_text_transformed(10, 70, lang("High Score") + ": " + string(highscore), 1, 1, 0);
	}
	
	if variable_instance_exists(id, "coins")
	{
		draw_text_transformed(10, 100, lang("Coins") + ": " + string(coins), 1, 1, 0);
	}
}
	
	if (room == rm_store)
	{
		draw_text_transformed(270, 50, lang("Plunderer's Port"), 1, 1, 0);
		draw_text_transformed(250, 120, lang("Stock up for yer travels"), .75, .75, 0);
		//show_debug_message("store title");
	}
	
	if (room == rm_languages)
	{
		draw_text_transformed_color(300, 150, lang("Language") , 1.5, 1.5, 0, c_black, c_black, c_black, c_black,1);
		
	}

//code to draw the pause menu
if (paused == true)
{
	//draw_set_color(c_black);
	//draw_set_alpha(0.60);
	//draw_set_font(fnt_game);
	if gamepad_is_connected(global.gamepad)
	{
		draw_text(270, 200, "Paused");
		draw_text_transformed(180, 250, "Press 'Start' to Continue", .5, .5, 0);
	}
	else 
	{
		draw_text(270, 200, lang("paused"));
		//draw_text(270, 200, "Paused");
		//draw_text_transformed(180, 250, "Press 'ESC' to Continue", .5, .5, 0);
		draw_text_transformed(180, 250, lang("press 'esc' to continue"), .5, .5, 0);
	}
}