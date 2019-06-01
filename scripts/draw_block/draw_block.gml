// draw_block(x, y, ins, key, alpha, selalpha)
var xx, yy, ins, key, alpha, salpha, index;
xx = argument0
yy = argument1
ins = argument2
key = argument3
alpha = argument4
salpha = argument5

index = ds_list_find_index(instrument_list, ins)
if (ins.user || !use_colored)
    index += 16
if(theme=2) draw_sprite_ext(spr_altblock, index, xx, yy, 1, 1, 0, -1, alpha)
else draw_sprite_ext(spr_block, index, xx, yy, 1, 1, 0, -1, alpha)
if (ins.user || key < 33 || key > 57) {
    draw_set_color(c_red)
    draw_set_alpha(1)
    draw_rectangle(xx, yy, xx + 32, yy + 32, 1)
}
draw_set_color(c_white)
if (salpha > 0) {
    draw_sprite_ext(spr_block_sel, 0, xx, yy, 1, 1, 0, -1, salpha)
    draw_set_alpha(1)
} else {
    draw_set_alpha(alpha + 0.25)
}
if (show_numbers) draw_text(xx + 16 - 8 * !use_colored, yy + 16, condstr(key < 33, " < ") + condstr(key > 57, " > ") + condstr(key > 32 && key < 58, string(key - 33)))
if(theme=2) draw_set_color(c_white)
else draw_set_color(c_yellow)
draw_text(xx + 16, yy + 4, get_keyname(key, show_octaves))
