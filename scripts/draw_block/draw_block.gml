// draw_block(x, y, ins, key, pan, vel, pit, alpha, selalpha)
var xx, yy, ins, key, pan, vel, pit, alpha, salpha, index;
xx = argument0
yy = argument1
ins = argument2
key = argument3
pan = argument4
vel = argument5
pit = argument6
alpha = argument7
salpha = argument8

index = ds_list_find_index(instrument_list, ins)

//If index isnt found, don't draw
if(index = -1)return;

//For custom instruments, pick the last frame from spr_block
if(index >= first_custom_index) {
	draw_sprite_ext(spr_block, 48, xx, yy, 1, 1, 0, -1, alpha)
} else {
	draw_sprite_ext(spr_block, index +  (16 * draw_type), xx, yy, 1, 1, 0, -1, alpha)
}

//Draw a red or blue tint in the block when the pitch is off
if (pit < 0) {
	draw_set_color(c_red)
	draw_set_alpha(min(0.5, (-pit / 100) * alpha * 0.25))
	draw_rectangle(xx, yy, xx + 32, yy + 32, false)
} else if (pit > 0) {
	draw_set_color(c_blue)
	draw_set_alpha(min(0.5, (pit / 100) * alpha * 0.25))
	draw_rectangle(xx, yy, xx + 32, yy + 32, false)
}

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
if (show_numbers) draw_text(xx + 16 - 8 * (draw_type = 1), yy + 16, condstr(key < 33, " < ") + condstr(key > 57, " > ") + condstr(key > 32 && key < 58, string(key - 33)))
if(theme=2) draw_set_color(c_white)
else draw_set_color(c_yellow)
draw_text(xx + 16, yy + 4, get_keyname(key, show_octaves))
