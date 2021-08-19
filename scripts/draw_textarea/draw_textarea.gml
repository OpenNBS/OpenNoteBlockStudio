function draw_textarea() {
	// draw_textarea(id, x, y, w, h, val, str)
	var i, xx, yy, w, h, val, str, on, focus, hoffset;
	i = argument[0]
	xx = argument[1]
	yy = argument[2]
	w = argument[3]
	h = argument[4]
	val = argument[5]
	str = argument[6]
	hoffset = 0
	if (argument_count > 7) hoffset = argument[7] 
	draw_set_color(c_white)

	on = mouse_rectangle(xx, yy, w, h)
	focus = text_focus = i
	
	if(theme = 2) draw_set_color(3552822)
	if (theme = 3) draw_set_color(16514043)
	if (theme = 3 && on && !focus) draw_set_color(16185078)
	if (theme = 3 && fdark) draw_set_color(2960685)
	if (theme = 3 && fdark && on && !focus) draw_set_color(3289650)
	draw_rectangle(xx, yy, xx + w, yy + h, 0)
	popup_set_window(xx, yy, w, h, str)

	if (theme = 0) {
	    draw_sprite(spr_textbox, 0 + 8 * on, xx, yy)
	    draw_sprite_ext(spr_textbox, 1 + 8 * on, xx, yy + 2, 1, (h - 4) / 2, 0, -1, 1)
	    draw_sprite(spr_textbox, 2 + 8 * on, xx, yy + h - 2)
	    draw_sprite_ext(spr_textbox, 3 + 8 * on, xx + 2, yy + h - 2, (w - 4) / 2, 1, 0, -1, 1)
	    draw_sprite(spr_textbox, 4 + 8 * on, xx + w - 2, yy + h - 2)
	    draw_sprite_ext(spr_textbox, 5 + 8 * on, xx + w - 2, yy + 2, 1, (h - 4) / 2, 0, -1, 1)
	    draw_sprite(spr_textbox, 6 + 8 * on, xx + w - 2, yy)
	    draw_sprite_ext(spr_textbox, 7 + 8 * on, xx + 2, yy, (w - 4) / 2, 1, 0, -1, 1)
	} else if (theme = 3) {
		draw_sprite(spr_textbox_f, 0 + 8 * on + 16 * focus + 32, xx, yy)
	    draw_sprite_ext(spr_textbox_f, 1 + 8 * on + 16 * focus + 32, xx, yy + 2, 1, (h - 4) / 2, 0, -1, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 2 + 8 * on + 16 * focus + 32, xx, yy + h - 2, 1, 1, 0, accent[3] * focus - !focus, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 3 + 8 * on + 16 * focus + 32, xx + 2, yy + h - 2, (w - 4) / 2, 1, 0, accent[3] * focus - !focus, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 4 + 8 * on + 16 * focus + 32, xx + w - 2, yy + h - 2, 1, 1, 0, accent[3] * focus - !focus, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 5 + 8 * on + 16 * focus + 32, xx + w - 2, yy + 2, 1, (h - 4) / 2, 0, -1, draw_get_alpha())
	    draw_sprite(spr_textbox_f, 6 + 8 * on + 16 * focus + 32, xx + w - 2, yy)
	    draw_sprite_ext(spr_textbox_f, 7 + 8 * on + 16 * focus + 32, xx + 2, yy, (w - 4) / 2, 1, 0, -1, draw_get_alpha())
	} else {
	    draw_area(xx, yy, xx + w, yy + h)
	}
	draw_theme_color()
	return draw_text_edit(i, val, xx + 3, yy + 3 + hoffset, w - 6, h - 6, 0, 0)



}
