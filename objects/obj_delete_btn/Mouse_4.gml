/// @description delete SAVED Json file

if file_exists("savedgame.save")
{
	file_delete(working_directory + "savedgame.save");
	show_debug_message("file deleted");
} 
else
{
	show_debug_message("no file deleted");
}