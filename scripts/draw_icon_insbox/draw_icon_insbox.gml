function draw_icon_insbox() {
	// draw_icon(i, xx, yy, str[, boxed[, isaction[, pressed]]])
	var i, a, xx, yy, str, boxed, isaction, pressed, clickable, sprite, ins, num1, num2;
	i = argument[0]
	xx = argument[1]
	yy = argument[2]
	str = argument[3]
	// boxed = true only makes the button active when the instrument box is open
	boxed = (argument_count > 4 ? argument[4] : false)
	// isaction is set to true for the expand/collapse buttons
	isaction = (argument_count > 5 ? argument[5] : true)
	pressed = (argument_count > 6 ? argument[6] : false)
	clickable = (boxed ? window == w_insbox : window == 0)
	popup_set_window(xx, yy, 25, 25, str)
	a = (mouse_rectangle(xx, yy, 25, 25) && (clickable) && sb_drag = -1)
	a += ((mouse_check_button(mb_left) || mouse_check_button_released(mb_left)) && a)
	if (pressed = 1) {
	    draw_sprite(spr_frame1, 2 + 3 * theme, xx, yy)
	} else {
	    draw_sprite(spr_frame1, a + 3 * theme, xx, yy)
	}
	sprite = isaction ? i : icons.INS_1 + min(i, first_custom_index)
	draw_sprite(spr_icons, sprite, xx + (a = 2 || pressed = 1), yy + (a = 2 || pressed = 1))
	if (!isaction && i >= first_custom_index) {
		ins = (i - first_custom_index + 1) % 100
		num1 = floor(ins / 10)
		num2 = ins % 10
		draw_sprite(spr_numbers, num1, xx + 11 + (a = 2 || pressed = 1), yy + 12+ (a = 2 || pressed = 1))
		draw_sprite(spr_numbers, num2, xx + 16 + (a = 2 || pressed = 1), yy + 12 + (a = 2 || pressed = 1))
	}
	if (i = 7 || i = 8) return (a = 2)
	return (a && mouse_check_button_released(mb_left))



}
