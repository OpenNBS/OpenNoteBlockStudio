// draw_window_mp3_export()

var x1, y1
curs = cr_default
x1 = floor(window_width / 2 - 125)
y1 = floor(window_height / 2 - 135)
draw_window(x1, y1, x1 + 250, y1 + 270)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "MP3 Export")
draw_set_font(fnt_main) 

draw_sprite(spr_mp3_exp, sch_exp_layout, x1 + 20, y1)

//Locked layers
if (draw_checkbox(x1 + 16, y1 + 190, mp3_includelocked, "Include locked layers", "Whether to export locked layers in the MP3.")) mp3_includelocked= !mp3_includelocked
 
//Submit button
if (draw_button2(x1 + 165, y1 + 238, 72, "Export", false)) mp3_export()

if (draw_button2(x1 + 10, y1 + 238, 72, "Cancel", false)) {
	window = 0
}