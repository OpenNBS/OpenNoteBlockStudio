// draw_window_save_options()
var x1, y1;
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 72)
y1 = floor(window_height / 2 - 80)
draw_window(x1, y1, x1 + 140, y1 + 147)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Save Options")
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 117, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 117, 1)
}
draw_theme_color()

if (draw_radiobox(x1 + 15, y1 + 35, save_version = 4, "V4", "Includes Note Velocity/Pan/Pitch and Looping")) save_version = 4
if (draw_radiobox(x1 + 15, y1 + 50, save_version = 3, "V3", "Includes Song Length Short")) save_version = 3
if (draw_radiobox(x1 + 15, y1 + 65, save_version = 2, "V2", "Includes Layer Stereo")) save_version = 2
if (draw_radiobox(x1 + 15, y1 + 80, save_version = 1, "V1", "Includes Custom Instrument Index")) save_version = 1
if (draw_radiobox(x1 + 15, y1 + 95, save_version = 0, "Classic", "Doesn't have any of the above, but works on all versions.")) save_version = 0

if (draw_button2(x1 + 40, y1 + 120, 60, "OK")) {
	if save_version != nbs_version question("Some of the song's data will be lost if you save in a previous version! Are you sure?", "Confirm")
	changed = 1
	window = 0
	}
window_set_cursor(curs)