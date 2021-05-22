function draw_window(argument0, argument1, argument2, argument3) {
	// draw_window(x1, y1, x2, y2)
	var x1, y1, x2, y2;
	x1 = argument0
	y1 = argument1
	x2 = argument2
	y2 = argument3
	draw_set_color(15790320)
	if (theme = 1) draw_set_color(13160660)
	if (theme = 2) draw_set_color(c_dark)
	if (theme = 3) draw_set_color(c_white)
	if (theme = 3) {
		draw_sprite(spr_shadow, 0, x1 - 16, y1 - 16)
		draw_sprite_ext(spr_shadow, 1, x1 - 16, y1, 1, y2 - y1, 0, -1, 1)
		draw_sprite(spr_shadow, 2, x1 - 16, y2 + 1)
		draw_sprite_ext(spr_shadow, 3, x1, y2 + 1, x2 - x1, 1, 0, -1, 1)
		draw_sprite(spr_shadow, 4, x2 + 1, y2 + 1)
		draw_sprite_ext(spr_shadow, 5, x2 + 1, y1, 1, y2 - y1, 0, -1, 1)
		draw_sprite(spr_shadow, 6, x2 + 1, y1 - 16)
		draw_sprite_ext(spr_shadow, 7, x1, y1 - 16, x2 - x1, 1, 0, -1, 1)
	}
	draw_rectangle(x1, y1, x2 - 1, y2 - 1, 0)
	draw_sprite(spr_interface2, 0 + 8 * theme, x1, y1)
	draw_sprite_ext(spr_interface2, 1 + 8 * theme, x1, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, 1)
	draw_sprite(spr_interface2, 2 + 8 * theme, x1, y2 - 2)
	draw_sprite_ext(spr_interface2, 3 + 8 * theme, x1 + 2, y2 - 2, (x2 - x1 - 4) / 2, 1, 0, -1, 1)
	draw_sprite(spr_interface2, 4 + 8 * theme, x2 - 2, y2 - 2)
	draw_sprite_ext(spr_interface2, 5 + 8 * theme, x2 - 2, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, 1)
	draw_sprite(spr_interface2, 6 + 8 * theme, x2 - 2, y1)
	draw_sprite_ext(spr_interface2, 7 + 8 * theme, x1 + 2, y1, (x2 - x1 - 4) / 2, 1, 0, -1, 1)
	draw_theme_color()



}
