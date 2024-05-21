// LOAD GAME script
function LoadGame()
{
	if (file_exists("savedgame.save"))
	{
		var _buffer = buffer_load("savedgame.save");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _loadData = json_parse(_string);
		
		while (array_length(_loadData) > 0)
		{
			var _loadEntity = array_pop(_loadData);
			
			with (obj_game) 
			{
				highscore = _loadEntity.highscore;
				saved_coins = _loadEntity.saved_coins;
				selected_lang = _loadEntity.selected_lang;
				//seen_thor = _loadEntity.seen_thor;
				//collected_ferrets = _loadEntity.collected_ferrets;
				//thor = _loadEntity.thor;
			}
		}
	}
	//show_debug_message("Game Loaded! " + _string);	
}