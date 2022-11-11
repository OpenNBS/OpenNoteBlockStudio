function string_height_dynamic(str){
	var height;
	draw_theme_font(obj_controller.currentfont, 0, 1)
	height = string_height(str)
	draw_theme_font(obj_controller.currentfont)
	return height;
}