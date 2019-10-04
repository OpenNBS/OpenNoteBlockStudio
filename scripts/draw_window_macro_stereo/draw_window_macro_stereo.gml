// draw_window_stereo_macro()
var x1, y1, a, b, width, str, total_vals, val;
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 80)
y1 = floor(window_height / 2 - 80)
draw_window(x1, y1, x1 + 140, y1 + 130)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Stereo Macro")
width = ""
if (selected = 0) return 0
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
}
if (draw_checkbox(x1 + 10, y1 + 30, stereo_reverse, "Reversed", "Delay is done in the inverse direction.")) stereo_reverse=!stereo_reverse
draw_areaheader(x1 + 10, y1 + 53, 120, 35, "Stereo Size")
a = string(width)
width = draw_textarea(4, x1 + 15, y1 + 60, 113, 25, string(width), "Must be between 1 and 100.") 
if (a != width) {
	width = string_digits(width)
}

draw_theme_color()
if (draw_button2(x1 + 10, y1 + 98, 60, "OK")) {
	if (width > 100 || width < 0) {
		message("Size must be between 1 and 100.", "Error")
		return 1
	}
	str = selection_code
	arr_data = selection_to_array(str)
	window = 0
	total_vals = string_count("|", str)
	val = 0
	while (val < total_vals) {
		// First column panned left
		val += 5
		if stereo_reverse = 1 {
			arr_data[val] = 0 - (width-100)
		} else arr_data[val] = 200 + (width-100)
		val += 2
		while arr_data[val] != -1 {
			val += 4
			if stereo_reverse = 1 {
				arr_data[val] = 0 - (width-100)
			} else arr_data[val] = 200 + (width-100)
			val += 2
		}
		// Second column panned right
		val += 6
		if val >= total_vals break
		if stereo_reverse = 1 {
		arr_data[val] = 200 + (width-100)
		} else arr_data[val] = 0 - (width-100)
		val += 2
		while arr_data[val] != -1 {
			val += 4
			if stereo_reverse = 1 {
				arr_data[val] = 200 + (width-100)
			} else arr_data[val] = 0 - (width-100)
			val += 2
		}
		val ++
	}
	str = array_to_selection(arr_data, total_vals)
	selection_load(selection_x,selection_y,str,true)
	selection_code_update()
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
}
if (draw_button2(x1 + 70, y1 + 98, 60, "Cancel")) {window = 0}
window_set_cursor(curs)