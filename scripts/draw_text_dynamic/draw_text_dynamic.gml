function draw_text_dynamic(x, y, string){
	// draw_text_dynamic()
	var width = 0;
	var lines = 0;
	var linewidth = [0];
	var totalwidth = 0;
	var longline = 0;
	var halign = draw_get_halign();
	draw_set_halign(fa_left)
	if (halign != fa_left) {
		for (var i = 1; i <= string_length(string); i += 1) {
			draw_theme_font(obj_controller.currentfont, (string_ord_at(string, i) > 127))
			linewidth[lines] += string_width(string_char_at(string, i))
			if (string_char_at(string, i) = "\n") {lines += 1 array_push(linewidth, 0)}
		}
		for (var i = 0; i <= lines; i += 1) {
			if (linewidth[i] >= linewidth[longline]) longline = i
		}
		totalwidth = linewidth[longline]
		lines = 0
	}
	for(var i = 1; i <= string_length(string); i += 1) {
		draw_theme_font(obj_controller.currentfont, (string_ord_at(string, i) > 127))
		if (halign = fa_left) draw_text(x + width, y - 2 * (string_ord_at(string, i) > 127) + lines * 16, string_char_at(string, i))
		else if (halign = fa_center) draw_text(x - floor(linewidth[lines] / 2) + width, y - 2 * (string_ord_at(string, i) > 127) + lines * 16, string_char_at(string, i))
		else if (halign = fa_right) draw_text(x - linewidth[lines] + width, y - 2 * (string_ord_at(string, i) > 127) + lines * 16, string_char_at(string, i))
		width += string_width(string_char_at(string, i))
		if (string_char_at(string, i) = "\n") {lines += 1 width = 0}
	}
	draw_set_halign(halign)
	draw_theme_font(obj_controller.currentfont)
}