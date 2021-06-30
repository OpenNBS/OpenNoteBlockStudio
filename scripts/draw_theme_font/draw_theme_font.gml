function draw_theme_font(type) {
	var font;
	var fluent = (theme != 3);
	switch (type) {
		case font_info_big:
			font = fluent ? fnt_info_big : fnt_wslui_info_big;
			break;
		case font_info_med:
			font = fluent ? fnt_info_med : fnt_wslui_info_med;
			break;
		case font_info_med_bold:
			font = fluent ? fnt_info_med_bold : fnt_wslui_info_med;
			break;
		case font_main:
			font = fluent ? fnt_main : fnt_wslui;
			break;
		case font_main_bold:
			font = fluent ? fnt_mainbold : fnt_wslui_bold;
			break;
		case font_small:
			font = fluent ? fnt_small : fnt_wslui_small;
			break;
		case font_small_bold:
			font = fluent ? fnt_smallbold : fnt_wslui_small_bold;
			break;
	} 
	draw_set_font(font);
}
