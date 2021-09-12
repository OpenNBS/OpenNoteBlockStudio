function draw_inputbox() {
	// draw_inputbox(id, x, y, w, val, str)
	var i, xx, yy, w, val, str, on, focus, alpha, prevalpha;
	i = argument[0]
	xx = argument[1]
	yy = argument[2]
	w = argument[3]
	val = argument[4]
	str = argument[5]
	alpha = 1
	prevalpha = draw_get_alpha()
	if (argument_count > 6) alpha = argument[6]
	popup_set_window(xx, yy, w, 21, str)

	on = (mouse_rectangle(xx, yy, w, 21))
	focus = text_focus = i
	if (theme = 3) draw_set_color(16579836)
	if (theme = 3 && on) draw_set_color(16185078)
	if (theme = 3 && focus) draw_set_color(c_white)
	if (theme = 3 && fdark) draw_set_color(2960685)
	if (theme = 3 && fdark && on && !focus) draw_set_color(3289650)
	draw_set_alpha(alpha * draw_get_alpha() * !focus + focus)
	if (theme != 3 || !focus || !fdark) draw_rectangle(xx + 1, yy + 1, xx + w - 1, yy + 21 - 1, 0)
	draw_set_alpha(prevalpha)
	draw_theme_color()
	if (theme != 3) {
	if(on){
		draw_sprite_ext(spr_inputbox_s_middle, theme, xx, yy, w, 1, 0, -1, 1)
		draw_sprite(spr_inputbox_s_left, theme, xx, yy)
		draw_sprite(spr_inputbox_s_right, theme, xx + w - 2, yy)
	}else{
		draw_sprite_ext(spr_inputbox_n_middle, theme, xx, yy, w, 1, 0, -1, 1)
		draw_sprite(spr_inputbox_n_left, theme, xx, yy)
		draw_sprite(spr_inputbox_n_right, theme, xx + w - 2, yy)
	}
	} else {
	draw_sprite_ext(spr_inputbox_n_middle, 3 + fdark, xx + 2, yy, w - 4, 1, 0, -1, draw_get_alpha())
	draw_sprite_ext(spr_inputbox_n_left, 3 + fdark, xx, yy, 1, 1, 0, -1, draw_get_alpha())
	draw_sprite_ext(spr_inputbox_n_right, 3 + fdark, xx + w - 2, yy, 1, 1, 0, -1, draw_get_alpha())
	if(focus){
	    draw_sprite_ext(spr_textbox_f, 2 + 16 * focus + !fdark * 32, xx, yy + 19, 1, 1, 0, accent[6] * focus - !focus, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 3 + 16 * focus + !fdark * 32, xx + 2, yy + 19, (w - 4) / 2, 1, 0, accent[6] * focus - !focus, draw_get_alpha())
	    draw_sprite_ext(spr_textbox_f, 4 + 16 * focus + !fdark * 32, xx + w - 2, yy + 19, 1, 1, 0, accent[6] * focus - !focus, draw_get_alpha())
	}
	}

	return draw_text_edit(i, val, xx + 3, yy + 3, w - 3, 21, 1, 0)



}
