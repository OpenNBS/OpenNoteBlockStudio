function draw_theme_font() {
	var font, type, lang, index, is_hires, force_lores;
	var fluent = (obj_controller.theme == 3);
	lang = 0
	type = argument[0]
	force_lores = 0
	if (argument_count > 1) lang = argument[1]
	if (argument_count > 2) force_lores = argument[2]
	index = lang ? 2 : fluent
	is_hires = obj_controller.hires * !force_lores * (obj_controller.theme = 3)
	font = obj_controller.font_table[@ is_hires][@ type][@ index]
	obj_controller.currentfont = type
	draw_set_font(font);
}
