// draw_window_clip_editor()
var x1, y1, a, b; 
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 220)
y1 = floor(window_height / 2 - 215)
draw_window(x1, y1, x1 + 440, y1 + 430)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Secret Clipboard Editor")
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 1)
}
draw_areaheader(x1 + 22, y1 + 48, 396, 330, "Clipboard")
a = clipboard
clipboard = draw_textarea(4, x1 + 32, y1 + 23 * 3, 370, 300, string(clipboard), "Edit the clipboard code.") 
if (a != clipboard) {
	selection_copied = string(clipboard)
/*
												// TODO: Check if length has changed, and what new length is.

	if (selection_l > selection_arraylength) { // Apply new length
	    for (a = selection_arraylength + 1; a <= nw; a += 1) {
	        selection_colfirst[a] = -1
	        selection_collast[a] = -1
	        for (b = 0; b <= selection_arrayheight; b += 1) {
	            selection_exists[a, b] = 0
	        }
	    }
    selection_arraylength = selection_l
	}
*/
}

draw_theme_color()
if (draw_button2(x1 + 320, y1 + 398, 72, "OK")) {window = 0}
window_set_cursor(curs)