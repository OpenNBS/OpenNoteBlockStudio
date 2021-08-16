function draw_theme_font() {
	var font, type, lang;
	var fluent = (obj_controller.theme != 3);
	lang = 0
	type = argument[0]
	if (argument_count > 1) lang = argument[1] 
	switch (type) {
		case font_info_big:
			font = (!lang) ? (fluent ? fnt_info_big : fnt_wslui_info_big) : fnt_src_info_big;
			break;
		case font_info_med:
			font = (!lang) ? (fluent ? fnt_info_med : fnt_wslui_info_med) : fnt_src_info_med;
			break;
		case font_info_med_bold:
			font = (!lang) ? (fluent ? fnt_info_med_bold : fnt_wslui_info_med_bold) : fnt_src_info_med_bold;
			break;
		case font_main:
			font = (!lang) ? (fluent ? fnt_main : fnt_wslui) : fnt_src;
			break;
		case font_main_bold:
			font = (!lang) ? (fluent ? fnt_mainbold : fnt_wslui_bold) : fnt_src_bold;
			break;
		case font_small:
			font = (!lang) ? (fluent ? fnt_small : fnt_wslui_small) : fnt_src_small;
			break;
		case font_small_bold:
			font = (!lang) ? (fluent ? fnt_smallbold : fnt_wslui_small_bold) : fnt_src_small_bold;
			break;
		case font_med:
			font = (!lang) ? fnt_wslui_med : fnt_src_med;
			break;
	} 
	obj_controller.currentfont = type
	draw_set_font(font);
}
