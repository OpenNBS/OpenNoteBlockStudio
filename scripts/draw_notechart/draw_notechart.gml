// draw_notechart(x, y, key, sharp)
var x1, xx, yy, key, sharp, a;
x1 = argument0
xx = median(0, x1 - 32, window_width - 320)
yy = argument1
key = argument2
sharp = argument3
draw_sprite(spr_notechart, 0, xx, yy - 320 + 1)
draw_sprite(spr_notechart, 1 + (x1 > window_width - 250), x1 - 16 * (x1 > window_width - 250), yy)

draw_set_color(0)
draw_set_alpha(0.25)
for (a = 0; a < 11; a += 1) {
    if (a != 5) {
        draw_line(xx + 32, yy - 250 + 16 * a, xx + 320 - 32, yy - 250 + 16 * a)
    }
}
draw_set_alpha(1)
draw_line(xx + 32, yy - 250, xx + 32, yy - 250 + 16 * 4)
draw_line(xx + 32, yy - 250 + 16 * 6, xx + 32, yy - 250 + 16 * 10)
draw_sprite(spr_Gclef, 0, xx + 58, yy - 250 + 16 * 3)
draw_sprite(spr_Fclef, 0, xx + 48, yy - 250 + 16 * 7)
draw_sprite(spr_note, sharp + 2 * (key > 22), xx + 152, yy - 250 - 8 * (key - 33))
if (key > 22 && key < 25) {
    draw_set_alpha(0.25)
    draw_line(xx + 122, yy - 250 + 16 * 5, xx + 180, yy - 250 + 16 * 5)
}
for (a = 1; a < floor((key - 31) / 2); a += 1) {
    draw_set_alpha(0.25)
    draw_line(xx + 122, yy - 250 - 16 * a, xx + 180, yy - 250 - 16 * a)
}
for (a = 0; a < 7 - ceil(key / 2); a += 1) {
    draw_set_alpha(0.25)
    draw_line(xx + 122, yy - 250 + 176 + 16 * a, xx + 180, yy - 250 + 176 + 16 * a)
}
draw_set_alpha(1)
