function string_width_dynamic(str){
	var lines = 0;
	var linewidth = [0];
	var totalwidth = 0;
	var longline = 0;
	for (var i = 1; i <= string_length(str); i += 1) {
		draw_theme_font(obj_controller.currentfont, (string_ord_at(str, i) > 127))
		linewidth[lines] += string_width(string_char_at(str, i))
		if (string_char_at(str, i) = "\n") {lines += 1 array_push(linewidth, 0)}
	}
	for (var i = 0; i <= lines; i += 1) {
		if (linewidth[i] >= linewidth[longline]) longline = i
	}
	totalwidth = linewidth[longline]
	draw_theme_font(obj_controller.currentfont)
	return totalwidth
}