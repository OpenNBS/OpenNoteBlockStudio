// draw_button2(x, y, w, str[, lock])
var xx, yy, w, str, lock, m;
xx = argument[0]
yy = argument[1]
w = argument[2]
str = argument[3]
lock = 0
if (argument_count > 4)
    lock = argument[4]
m = 0
if (lock = 1) {
    draw_sprite_ext(spr_button, 10 + 6 * theme, xx, yy, w / 3, 1, 0, -1, 1)
    draw_sprite(spr_button, 9 + 6 * theme, xx, yy)
    draw_sprite(spr_button, 11 + 6 * theme, xx + w - 3, yy)
    draw_set_color(10526880)
} else {
    m = mouse_rectangle(xx, yy, w, 23) && w_isdragging = 0
    if (m) m += mouse_check_button(mb_left)
    draw_sprite_ext(spr_button, 1 + m * 3 + 12 * theme, xx, yy, w / 3, 1, 0, -1, 1)
    draw_sprite(spr_button, m * 3 + 12 * theme, xx, yy)
    draw_sprite(spr_button, 2 + m * 3 + 12 * theme, xx + w - 3, yy)
    draw_set_color(0)
}
draw_set_halign(fa_center)
if (lock && theme) {
    draw_set_color(c_white)
    draw_text(xx + w / 2 + (m = 2) + 1, yy + 4 + (m = 2) + 1, str)
    draw_set_color(10526880)
}
draw_text(xx + w / 2 + (m = 2), yy + 4 + (m = 2), str)
draw_set_halign(fa_left)
return (m && mouse_check_button_released(mb_left))
