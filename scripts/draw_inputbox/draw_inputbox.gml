// draw_inputbox(id, x, y, w, val, str)
var i, xx, yy, w, val, str, on;
i = argument0
xx = argument1
yy = argument2
w = argument3
val = argument4
str = argument5
popup_set_window(xx, yy, w, 21, str)

on = (mouse_rectangle(xx, yy, w, 21))
draw_theme_color()
draw_sprite_ext(spr_inputbox, 1 + on * 3 + 6 * theme, xx, yy, w, 1, 0, -1, 1)
draw_sprite(spr_inputbox, on * 3 + 6 * theme, xx, yy)
draw_sprite(spr_inputbox, 2 + on * 3 + 6 * theme, xx + w - 2, yy)
return draw_text_edit(i, val, xx + 3, yy + 3, w - 3, 21, 1, 0)
