function draw_frame(argument0, argument1, argument2, argument3) {
	// draw_frame(x1, y1, x2, y2)
	var x1, y1, x2, y2;
	x1 = argument0
	y1 = argument1
	x2 = argument2
	y2 = argument3
	draw_sprite(spr_interface4, 0, x1, y1)
	draw_sprite_ext(spr_interface4, 1, x1, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, draw_get_alpha())
	draw_sprite(spr_interface4, 2, x1, y2 - 2)
	draw_sprite_ext(spr_interface4, 3, x1 + 2, y2 - 2, (x2 - x1 - 4) / 2, 1, 0, -1, draw_get_alpha())
	draw_sprite(spr_interface4, 4, x2 - 2, y2 - 2)
	draw_sprite_ext(spr_interface4, 5, x2 - 2, y1 + 2, 1, (y2 - y1 - 4) / 2, 0, -1, draw_get_alpha())
	draw_sprite(spr_interface4, 6, x2 - 2, y1)
	draw_sprite_ext(spr_interface4, 7, x1 + 2, y1, (x2 - x1 - 4) / 2, 1, 0, -1, draw_get_alpha())



}
