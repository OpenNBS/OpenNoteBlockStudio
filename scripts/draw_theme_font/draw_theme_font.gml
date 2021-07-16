function draw_theme_font(type) {
	var font;
	var fluent = (theme != 3);
	switch (type) {
		case font_info_big:
			font = (language != "Chinese") ? (fluent ? fnt_info_big : fnt_wslui_info_big) : fnt_src_info_big;
			break;
		case font_info_med:
			font = (language != "Chinese") ? (fluent ? fnt_info_med : fnt_wslui_info_med) : fnt_src_info_med;
			break;
		case font_info_med_bold:
			font = (language != "Chinese") ? (fluent ? fnt_info_med_bold : fnt_wslui_info_med_bold) : fnt_src_info_med_bold;
			break;
		case font_main:
			font = (language != "Chinese") ? (fluent ? fnt_main : fnt_wslui) : fnt_src;
			break;
		case font_main_bold:
			font = (language != "Chinese") ? (fluent ? fnt_mainbold : fnt_wslui_bold) : fnt_src_bold;
			break;
		case font_small:
			font = (language != "Chinese") ? (fluent ? fnt_small : fnt_wslui_small) : fnt_src_small;
			break;
		case font_small_bold:
			font = (language != "Chinese") ? (fluent ? fnt_smallbold : fnt_wslui_small_bold) : fnt_src_small_bold;
			break;
	} 
	draw_set_font(font);
}
