// draw_window_macro_tremolo()
var x1, y1, a, i, pattern, str, total_vals, val;
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 72)
y1 = floor(window_height / 2 - 145)
draw_window(x1, y1, x1 + 150, y1 + 240)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Tremolo")
draw_set_color(c_red)
draw_text(x1 + 8, y1 + 23, "(CANNOT BE UNDONE)")
draw_theme_color()
if (selected = 0) return 0
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 208, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 134, y1 + 208, 1)
}
draw_theme_color()

if (draw_radiobox(x1 + 15, y1 + 43, tremolotype = 0, "No fading", "Just repeats notes.")) tremolotype = 0 
if (draw_radiobox(x1 + 15, y1 + 58, tremolotype = 1, "Fade in", "Fades in until note changes.")) tremolotype = 1 
if (draw_radiobox(x1 + 15, y1 + 73, tremolotype = 2, "Fade out", "Fades out until note changes.")) tremolotype = 2 
if tremolotype = 0 draw_set_color(c_gray)
if (draw_radiobox(x1 + 15, y1 + 88, fade_auto = 1, "Automatic fade", "Fade is calculated relative to tick duration of note.")) fade_auto = 1 
if (draw_radiobox(x1 + 15, y1 + 103, fade_auto = 0, "Manual fade", "Specify decay and sustain of fade.")) fade_auto = 0 

if fade_auto = 1 draw_set_color(c_gray)
else draw_theme_color()
draw_text(x1 + 15, y1 + 123, "Attack/Decay:")
draw_theme_color()
leg_dec = median(1, draw_dragvalue(8, x1 + 15, y1 + 138, leg_dec, 0.5), 100)

if fade_auto = 1 draw_set_color(c_gray)
else draw_theme_color()
draw_text(x1 + 15, y1 + 156, "Sustain:")
draw_theme_color()
leg_sus = median(1, draw_dragvalue(9, x1 + 15, y1 + 170, leg_sus, 0.5), 100)

draw_text(x1 + 15, y1 + 188, "Spacing:")
trem_spacing = median(1, draw_dragvalue(3, x1 + 80, y1 + 188, trem_spacing, 1), 2)
popup_set_window(x1 + 40, y1 + 183, 180, 21, "The amount of ticks between repetitions.")

draw_theme_color()
if (draw_button2(x1 + 10, y1 + 215, 60, "OK")) {
	if (leg_dec > 100 || leg_dec < 0|| leg_sus > 100|| leg_sus < 0) {
		message("Values must be between 1 and 100.", "Error")
		return 1
	}
	if tremolotype = 0 macro_tremolo()
	if tremolotype = 1 macro_tremolo_fadein()
	if tremolotype = 2 macro_tremolo_fadeout()
	window = 0
}
if (draw_button2(x1 + 80, y1 + 215, 60, "Cancel")) {window = 0}
window_set_cursor(curs)