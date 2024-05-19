if gamepad_is_connected(0)
{
	txt = lang("Pirate Help") + " " + lang("move with left stick or d pad") + " " + lang("shoot with pressing A button") + " " + lang("pause game with ESC");

} else
{
	txt = lang("Pirate Help") + " " + lang("move with arrow keys or WASD") + " " + lang("shoot with mouse or spacebar") + " " + lang("pause game with ESC");
}

str = "";
pos = 1;
pos_end = string_length(txt);

back_color = c_dkgray;
border_color = c_black;
text_color = c_white;

font = fnt_game;

border_thickness = 12;

text_alarm_set = 5;
text_alarm = text_alarm_set;
text_rate = 2;

new_page = false;
finished = false;