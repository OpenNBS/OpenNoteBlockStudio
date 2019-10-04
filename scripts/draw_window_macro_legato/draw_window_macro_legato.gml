// draw_window_macro_legato()
var x1, y1, a, i, pattern, str, total_vals, val;
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 80)
y1 = floor(window_height / 2 - 80)
draw_window(x1, y1, x1 + 140, y1 + 130)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Legato")
if (selected = 0) return 0
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 92, 1)
}
if (draw_radiobox(x1 + 15, y1 + 40, legatotype = 0, "No Fading", "Just repeats notes.")) legatotype = 0 
if (draw_radiobox(x1 + 15, y1 + 55, legatotype = 1, "Fade In", "Fades in until note changes.")) legatotype = 1 
if (draw_radiobox(x1 + 15, y1 + 70, legatotype = 2, "Fade Out", "Fades out until note changes.")) legatotype = 2 
draw_theme_color()
if (draw_button2(x1 + 10, y1 + 98, 60, "OK")) {
	if legatotype = 0 macro_legato()
	if legatotype = 1 macro_legato_fadein()
	if legatotype = 2 macro_legato_fadeout()
	window = 0
}
if (draw_button2(x1 + 70, y1 + 98, 60, "Cancel")) {window = 0}
window_set_cursor(curs)