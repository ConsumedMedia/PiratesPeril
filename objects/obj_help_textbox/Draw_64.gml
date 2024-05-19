 // Get gui width and height
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

// Draw the backing and the border
draw_set_color(back_color);
draw_rectangle(0, guiH * 3/4, guiW, guiH, false);
draw_set_color(border_color);
draw_line_width(0, guiH * 3/4 + border_thickness/2, guiW, guiH * 3/4 + border_thickness/2, border_thickness);
draw_line_width(0, guiH-border_thickness/2, guiW, guiH-border_thickness/2, border_thickness);
draw_line_width(border_thickness/2, guiH * 3/4, border_thickness/2, guiH, border_thickness);
draw_line_width(guiW-border_thickness/2, guiH * 3/4, guiW-border_thickness/2, guiH, border_thickness);

// Set the font as well as the alignment
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(text_color);
draw_text(border_thickness*3/2, guiH*3/4+border_thickness*3/2, str);
