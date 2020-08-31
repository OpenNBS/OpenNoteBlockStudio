function draw_block(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	// draw_block(x, y, ins, key, pan, vel, pit, alpha, selalpha)
	var xx, yy, ins, key, pan, vel, pit, alpha, salpha, index, iscustom, sprite, frame, ins, num1, num2;
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
	
	iscustom = (index >= first_custom_index)
	if (iscustom) {
		frame = (index - first_custom_index) % 18 + first_custom_index
	} else {
		frame = index
	}

	if (use_colors) {
		if (use_shapes) {
			sprite = spr_block_color_shape
		} else {
			sprite = spr_block_color
		}
	} else {
		if (use_shapes) {
			sprite = spr_block_shape
		} else {
			sprite = spr_block
			frame = 1
		}
	}
	draw_sprite_ext(sprite, frame, xx, yy, 1, 1, 0, -1, alpha)
	draw_set_alpha(1)
	if (use_icons) {
		draw_sprite_ext(spr_instrumenticons, index, xx + 16, yy + 16, 1, 1, 0, -1, alpha)
		if (iscustom) {
			ins = (index - first_custom_index + 1) % 100
			num1 = floor(ins / 10)
			num2 = ins % 10
			draw_sprite(spr_numbers_mc, num1, xx + 16 + 3, yy + 16 + 4)
			draw_sprite(spr_numbers_mc, num2, xx + 16 + 9, yy + 16 + 4)
		}
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

	if (show_incompatible && (ins.user || key < 33 || key > 57)) {
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
	if (show_numbers) {
		if (editmode == 0) draw_text(xx + 16 - 8 * (use_icons), yy + 16, condstr(key < 33, " < ") + condstr(key > 57, " > ") + condstr(key > 32 && key < 58, string(key - 33)))
		else if (editmode == 1) draw_text(xx + 16 - 8 * (use_icons), yy + 16, string_format(vel, 1, 0))
		else if (editmode == 2) draw_text(xx + 16 - 8 * (use_icons), yy + 16, condstr(pan < 100, "L ") + condstr(pan > 100, "R ") + string_format(abs(pan - 100), 1, 0))
		else if (editmode == 3) draw_text(xx + 16 - 8 * (use_icons), yy + 16, condstr(pit > 0, "+") + string_format(pit, 1, 0))
	}
	if(theme=2) draw_set_color(c_white)
	else draw_set_color(c_yellow)
	draw_text(xx + 16, yy + 4, get_keyname(key, show_octaves))



}
