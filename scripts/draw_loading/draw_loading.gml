/*draw_loading(caption, desc, percent)
var caption, desc, perc, x1, y1;
caption = argument0
desc = argument1
perc = argument2
x1 = floor(window_width / 2 - 150)
y1 = floor(window_height / 2 - 50)
draw_set_color(0)
draw_window(x1, y1, x1 + 300, y1 + 100)
draw_set_font(fnt_mainbold)
draw_text(x1 + 16, y1 + 16, caption)
draw_set_font(fnt_main)
draw_set_halign(fa_center)
draw_text(floor(window_width / 2), y1 + 40, desc)
draw_set_color(10512464)
draw_rectangle(x1 + 30, y1 + 60, x1 + 30 + perc * 240, y1 + 80, 0)
draw_set_color(0)
draw_rectangle(x1 + 30, y1 + 60, x1 + 270, y1 + 80, 1)
if (perc > 0.5) draw_set_color(c_white)
draw_text(floor(window_width / 2), y1 + 65, string(floor(perc * 100)) + "% done")
draw_set_halign(fa_left)
screen_refresh()
