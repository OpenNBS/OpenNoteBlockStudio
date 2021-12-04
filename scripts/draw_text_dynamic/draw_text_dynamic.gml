function draw_text_dynamic(x, y, string){
	// draw_text_dynamic()
	var width = 0;
	var lines = 0;
	var linewidth = [0];
	var totalwidth = 0;
	var longline = 0;
	var halign = draw_get_halign();
	var char, char_code, is_ascii, y_offset;
	draw_set_halign(fa_left)
	if (halign != fa_left) {
		for (var i = 1; i <= string_length(string); i += 1) {
			char = string_char_at(string, i)
			char_code = ord(char)
			is_ascii = char_code <= 127
			
			draw_theme_font(obj_controller.currentfont, !is_ascii)
			linewidth[lines] += string_width(char)
			if (char = "\n") {lines += 1 array_push(linewidth, 0)}
		}
		for (var i = 0; i <= lines; i += 1) {
			if (linewidth[i] >= linewidth[longline]) longline = i
		}
		totalwidth = linewidth[longline]
		lines = 0
	}
	for(var i = 1; i <= string_length(string); i += 1) {
		char = string_char_at(string, i)
		char_code = ord(char)
		is_ascii = char_code <= 127
		draw_theme_font(obj_controller.currentfont, !is_ascii)
		y_offset = is_ascii + lines * 16
		
		if (halign = fa_left) draw_text (x + width, y - 1 * y_offset, char)
		else if (halign = fa_center) draw_text (x - floor(linewidth[lines] / 2) + width, y - 1 * y_offset, char)
		else if (halign = fa_right) draw_text (x - linewidth[lines] + width, y - 1 * y_offset, char)
		width += string_width(char)
		if (char = "\n") {lines += 1 width = 0}
	}
	draw_set_halign(halign)
	draw_theme_font(obj_controller.currentfont)
}