/// @description draw GUI IF player object exists
if instance_exists(obj_player)
//if (room == rm_game)
{
	draw_text_transformed(10, 10, "Score: " + string(points), .5, .5, 1);
	//draw_text_transformed(10, 40, "Health: " + string(player_health), .5, .5, 1);
	draw_text_transformed(10, 40, "Health: ", .5, .5, 1);
	
	// drawing the heart sprites
	/// once i build out the store, i will have to figure out how to dynamically add more lives IF purchased
	if player_health == 1 
	{
		draw_sprite_ext(spr_heart, 0, 150, 40, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 2
	{
		draw_sprite_ext(spr_heart, 0, 150, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 170, 40, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 3
	{
		draw_sprite_ext(spr_heart, 0, 150, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 170, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 190, 40, 1, 1, 1, c_white, 1);
		
	}
	else if player_health == 4
	{
		draw_sprite_ext(spr_heart, 0, 150, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 170, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 190, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 210, 40, 1, 1, 1, c_white, 1);
	}
	else if player_health == 5
	{
		draw_sprite_ext(spr_heart, 0, 150, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 170, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 190, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 210, 40, 1, 1, 1, c_white, 1);
		draw_sprite_ext(spr_heart, 0, 230, 40, 1, 1, 1, c_white, 1);
	}
	
	//temp position place this in the main menu / menu died
	if variable_instance_exists(id, "highscore")
	{
		draw_text_transformed(10, 70, "Highscore: " + string(highscore), .5, .5, 1);
	}
	
	if variable_instance_exists(id, "coins")
	{
		draw_text_transformed(10, 100, "Coins: " + string(coins), .5, .5, 1);
	}
}
	
	if (room == rm_store)
	{
		draw_text_transformed(100, 50, "Plunderer's Port", 1, 1, 0);
		draw_text_transformed(150, 120, "Stock up for yer travels!", .5, .5, 0);
		//show_debug_message("store title");
	}

//code to draw the pause menu
if (paused == true)
{
	//draw_set_color(c_black);
	//draw_set_alpha(0.60);
	//draw_set_font(fnt_menu);
	if gamepad_is_connected(global.gamepad)
	{
		draw_text(270, 200, "Paused");
		draw_text_transformed(180, 250, "Press 'Start' to Continue", .5, .5, 0);
	}
	else 
	{
		draw_text(270, 200, "Paused");
		draw_text_transformed(180, 250, "Press 'ESC' to Continue", .5, .5, 0);
	}
}