// draw_window_setvelocity()
var x1, y1, a, b, str, total_vals, val, decr, inc;
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 80)
y1 = floor(window_height / 2 - 80)
draw_window(x1, y1, x1 + 140, y1 + 130)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Set Note Velocity")
if (selected = 0) return 0
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
}
draw_areaheader(x1 + 10, y1 + 53, 120, 35, "Velocity")
setvel = median(0, draw_dragvalue(10, x1 + 55, y1 + 65, setvel, 0.1), 100)

draw_theme_color()
if (draw_button2(x1 + 10, y1 + 98, 60, "OK")) {
	str = selection_code
	val = 0
	arr_data = selection_to_array(str)
	window = 0
	total_vals = string_count("|", str)
	val = 0
	while (val < total_vals) {
		val += 4
		arr_data[val] = setvel
		val += 3
		while arr_data[val] != -1 {
			val += 3
			arr_data[val] = setvel
			val += 3
		}
		val ++
	}
	str = array_to_selection(arr_data, total_vals)
	selection_load(selection_x,selection_y,str,true)
	if(!keyboard_check(vk_alt)) selection_place(false)
	history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
}
if (draw_button2(x1 + 70, y1 + 98, 60, "Cancel")) {window = 0}
window_set_cursor(curs)