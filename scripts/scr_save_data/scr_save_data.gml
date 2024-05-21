// SAVE GAME script
function SaveGame()
{
	global.points = obj_game.points;
//make save array
var _saveData = array_create(0);
//for every instance, create a struct and add it to the array
with (obj_game)
{
	//if (obj_game.points > highscore)
	//{
		
		highscore = global.points;
		saved_coins = coins;
		
		var _saveEntity = 
		{
			highscore : highscore,
			saved_coins : saved_coins,
			selected_lang : selected_lang,
			//seen_thor : seen_thor,
			//collected_ferrets : collected_ferrets,
			//thor : thor,
		}
	//}
	array_push(_saveData, _saveEntity);
}
//turn all this data into a JSON string and save it via a buffer
var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

//show_debug_message("Game Saved! " + _string);
}