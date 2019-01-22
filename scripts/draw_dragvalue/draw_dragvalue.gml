// draw_dragvalue(id, x, y, val, sensitivity[, lock])
var i, xx, yy, v, m, ma, mi, s, lock;
i = argument[0]
xx = argument[1]
yy = argument[2]
v = argument[3]
s = argument[4]
lock = 0
if (argument_count > 5)
    lock = argument[5]
m = mouse_rectangle(xx - 8, yy - 4, string_width(string(v)) + 16, string_height(string(v)) + 4)
if (v < 20 || i > 1) {
    if (lock = 0) {
        draw_text(xx, yy, string(v))
    } else {
        draw_set_color(c_white)
        draw_text(xx + 1, yy + 1, string(v))
        draw_set_color(8421504)
        draw_text(xx, yy, string(v))
    }
} else {
    draw_text(xx, yy, "No limit")
}
if (lock) return v
if (w_isdragging = 0) {
    if (m) curs = cr_size_ns
    if (m && mouse_check_button_pressed(mb_left)) {
        w_isdragging = i
        w_dragvalue = 0
    }
} else if (w_isdragging = i) {
    w_dragvalue += 0.1 * (mouse_yprev - mouse_y) / s
    v += floor(w_dragvalue)
    w_dragvalue -= floor(w_dragvalue)
    curs = cr_size_ns
}
return v

