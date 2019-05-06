// draw_window(x1, y1, x2, y2)
var x1, y1, x2, y2;
x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
draw_set_color(15790320)
if (theme = 1) draw_set_color(13160660)
if (theme = 2) draw_set_color(c_dark)
draw_rectangle(x1, y1, x2 - 1, y2 - 1, 0)
draw_sprite(spr_interface2, 0 + 8 * theme, x1, y1)
draw_sprite_ext(spr_interface2, 1 + 8 * theme, x1, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, 1)
draw_sprite(spr_interface2, 2 + 8 * theme, x1, y2 - 2)
draw_sprite_ext(spr_interface2, 3 + 8 * theme, x1 + 2, y2 - 2, (x2 - x1 - 4) / 2, 1, 0, -1, 1)
draw_sprite(spr_interface2, 4 + 8 * theme, x2 - 2, y2 - 2)
draw_sprite_ext(spr_interface2, 5 + 8 * theme, x2 - 2, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, 1)
draw_sprite(spr_interface2, 6 + 8 * theme, x2 - 2, y1)
draw_sprite_ext(spr_interface2, 7 + 8 * theme, x1 + 2, y1, (x2 - x1 - 4) / 2, 1, 0, -1, 1)
set_theme_color(false)
