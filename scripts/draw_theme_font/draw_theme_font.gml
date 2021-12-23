function draw_theme_font() {
	var font, type, lang, index;
	var fluent = (obj_controller.theme == 3);
	lang = 0
	type = argument[0]
	if (argument_count > 1) lang = argument[1]
	index = lang ? 2 : fluent
	font = obj_controller.font_table[@ type][@ index]
	obj_controller.currentfont = type
	draw_set_font(font);
}
