if (text_alarm == 1) {
	text_alarm--;
	// check for the ending
	if (pos <= pos_end) {
		if (pos_end-pos < text_rate) {
			text_rate = pos_end+1;
		}
		var guiW = display_get_gui_width();
		var guiH = display_get_gui_height();
		// check the character(s) we are adding for spaces
		var add = string_copy(txt, pos, text_rate);
		if (string_count(" ", add) == 0) {
			str += add;
			pos += text_rate;
			text_alarm = text_alarm_set;
		} else {
			// Get the index of the space character in the addendum
			var spaceIndex = string_pos(" ", add);
			// Add everything before the space to the str while removing it from the addendum
			str += string_copy(add, 1, spaceIndex -1);
			add = string_copy(add, spaceIndex, string_length(add)-spaceIndex+1);
			// Get the next space character and next add
			var nextSpaceIndex = string_pos_ext(" ", txt, pos+text_rate);
			var nextAdd = string_copy(txt, pos+spaceIndex-1, nextSpaceIndex-pos);
			var workingStr = str+nextAdd;
			
			// Set font just to be safe
			draw_set_font(font);
			var w = string_width(workingStr);
			var h = string_height(workingStr);
			
			// Check horizontal spacing
			if (w > guiW-3*border_thickness) {
				//check height
				if (h > guiH*1/4-3*border_thickness) {
					pos += spaceIndex;
					new_page = true;
				} else {
					add = string_replace(add, " ", "\n");
					str += add;
					pos += text_rate;
					text_alarm = text_alarm_set;
				}
		} else {
			str += add;
			pos += text_rate;
			text_alarm = text_alarm_set;
		}
	}
} else {
	finished = true;
}
}

if (text_alarm > 1) text_alarm--;

if (new_page && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(global.gamepad, gp_face1))){
	str = "";
	text_alarm = text_alarm_set;
	new_page = false;
}