function draw_window_minecraft() {
	// draw_window_minecraft()
	var x1, y1, a, b, c, stabx, stabw, str, nsel;
	curs = cr_default
	x1 = floor(rw / 2 - 245)
	y1 = floor(rh / 2 - 225)
	draw_window(x1, y1, x1 + 490, y1 + 450)
	draw_set_font(fnt_mainbold)
	draw_text(x1 + 8, y1 + 8, "Minecraft Compatibility")
	draw_set_font(fnt_main)
	draw_text(x1 + 16, y1 + 32, "Due to the limitations of note blocks, the song must meet certain criteria in order\nto be properly imported into Minecraft.")

	yy = y1 + 50

	b = 8
	str[0] = "Schematic"
	str[1] = "Data Pack"
	nsel = -1

	// Draw tabs
	for (a = 0; a < 2; a += 1) {
	    c = mouse_rectangle(x1 + b, yy + 28, string_width(str[a]) + 12, 18)
	    if (selected_tab_mc = a) {
	        stabx = b - 2
	        stabw = string_width(str[a]) + 15
	    } else {
	        draw_sprite(spr_tabbuttons, 0 + 3 * c + 6 * theme, x1 + b, yy + 28)
	        draw_sprite_ext(spr_tabbuttons, 1 + 3 * c + 6 * theme, x1 + b + 2, yy + 28, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
	        draw_sprite(spr_tabbuttons, 2 + 3 * c + 6 * theme, x1 + b + string_width(str[a]) + 10, yy + 28)
	        draw_text(x1 + b + 6, yy + 30, str[a])
	    }
	    if (mouse_check_button_pressed(mb_left) && c) nsel = a
	    b += string_width(str[a]) + 12
	}
	if (theme = 0) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, yy + 46, x1 + 484, yy + 350, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, yy + 46, x1 + 484, yy + 350, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx, yy + 26, x1 + stabx + stabw, yy + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, yy + 26, x1 + stabx + stabw, yy + 26 + 20, 1)
	    draw_set_color(c_white)
	    draw_rectangle(x1 + stabx + 1, yy + 46, x1 + stabx + stabw - 1, yy + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, yy + 28, str[selected_tab_mc])
	} else if(theme = 1){
	    draw_sprite(spr_tabbuttons, 12, x1 + stabx - 1, yy + 26)
	    draw_sprite_ext(spr_tabbuttons, 13, x1 + stabx + 1, yy + 26, stabw / 2 - 1, 1, 0, -1, 1)
	    draw_sprite(spr_tabbuttons, 14, x1 + stabx + stabw - 1, yy + 26)
	    draw_text(x1 + stabx + 8, yy + 28, str[selected_tab_mc])
		draw_window(x1 + 6, yy + 46, x1 + 484, yy + 350)
	} else {
		draw_set_color(c_dark)
	    draw_rectangle(x1 + 6, yy + 46, x1 + 484, yy + 350, 0) 
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, yy + 46, x1 + 484, yy + 350, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx, yy + 26, x1 + stabx + stabw, yy + 26 + 20, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + stabx, yy + 26, x1 + stabx + stabw, yy + 26 + 20, 1)
	    draw_set_color(c_dark)
	    draw_rectangle(x1 + stabx + 1, yy + 46, x1 + stabx + stabw - 1, yy + 47, 0)
	    draw_theme_color()
	    draw_text(x1 + stabx + 8, yy + 28, str[selected_tab_mc])
	}
	if (nsel > -1) selected_tab_mc = nsel
	selected_tab_mc += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
	if (selected_tab_mc < 0) selected_tab_mc = 1
	if (selected_tab_mc > 1) selected_tab_mc = 0

	// Draw content
	yy += 65
	if (selected_tab_mc = 0) { // Schematic

		if(tempo = 10 || tempo = 5 || tempo = 2.5){
			// compatible
			draw_sprite(spr_yesno, 1, x1 + 25, yy + 8)
		} else {
			// not compatible
			draw_sprite(spr_yesno, 0, x1 + 25, yy + 8)
		}

		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "The tempo must be either 2.5, 5 or 10 ticks per second.")
		draw_set_font(fnt_main)

		if (tempo = 10 || tempo = 5 || tempo = 2.5) {    
			draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
		    draw_text(x1 + 45, yy + 16, "The tempo is " + string(tempo) + " ticks per second.")
		} else {
			draw_set_color(c_red)
		    draw_text(x1 + 45, yy + 16, "The tempo is " + string(tempo) + " ticks per second.")
		    if (draw_button2(x1 + 45, yy + 34, 140, "Fix tempo for schematic")) {
		        var otempo = tempo
		        if (otempo > 10) tempo = 10
		        if (otempo < 10) tempo = 10
		        if (otempo < 7.5) tempo = 5
		        if (otempo < 3.75) tempo = 2.5
		    }
		}
		draw_theme_color()

		yy += 90
		draw_sprite(spr_yesno, block_outside = 0, x1 + 25, yy + 8)
		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "All blocks must be within Minecraft's 2 octave range.")
		draw_set_font(fnt_main)
		if (block_outside > 0) {    
		    draw_set_color(c_red)
		    if (block_outside = 1) {
		        draw_text(x1 + 45, yy + 16, "There is 1 block outside the 2 octave range.")
		    } else {
		        draw_text(x1 + 45, yy + 16, "There are " + string(block_outside) + " blocks outside the 2 octave range.")
		    }
		    if (draw_button2(x1 + 45, yy + 34, 120, "Select lower blocks")) {
		        select_outside(true, false)
		        window = 0
		    }
			if (draw_button2(x1 + 175, yy + 34, 120, "Select higher blocks")) {
		        select_outside(false, true)
		        window = 0
		    }
		    if (draw_button2(x1 + 305, yy + 34, 100, "Transpose notes")) {
		        if (question("Transpose notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) {
		            select_all(-1, 0)
		            selection_transpose()
		            selection_place(0)
		        }
		    }
		} else {
		    draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
		    draw_text(x1 + 45, yy + 16, "There are no blocks outside the 2 octave range.")
		}
		draw_theme_color()

		yy += 90
		draw_sprite(spr_yesno, block_custom = 0, x1 + 25, yy + 8)
		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "No custom instruments must be used.")
		draw_set_font(fnt_main)
		if (block_custom > 0) {    
		    draw_set_color(c_red)
		    if (block_custom = 1) draw_text(x1 + 45, yy + 16, "There is 1 block with custom instruments.")
		    else draw_text(x1 + 45, yy + 16, "There are " + string(block_custom) + " blocks with custom instruments.")
		    if (draw_button2(x1 + 45, yy + 34, 160, "Select affected blocks")) {
		        select_custom()
		        window = 0
		    }
		} else {
		    draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
		    draw_text(x1 + 45, yy + 16, "There are no blocks with custom instruments.")
		}
		draw_theme_color()
	
	} else { // Datapack
		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "Any tempo works when exporting as a data pack.")
		draw_set_font(fnt_main)
		draw_text(x1 + 45, yy + 16, "However, the tempos 0.25, 0.5, 1, 1.25, 2, 2.5, 4, 5, 10 and 20 t/s work better.")

		if (tempo = 20 || tempo = 10 || tempo = 5 || tempo = 4 || tempo = 2.5 || tempo = 2 || tempo = 1.25 || tempo = 1 || tempo = 0.5 || tempo = 0.25) {    
			draw_sprite(spr_yesno, 1, x1 + 25, yy + 8)	
			draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
			draw_text(x1 + 45, yy + 32, "The tempo is " + string(tempo) + " ticks per second.")
		} else {
			draw_sprite(spr_yesno, 2, x1 + 25, yy + 8)	
		    draw_set_color(c_orange)
		    draw_text(x1 + 45, yy + 32, "The tempo is " + string(tempo) + " ticks per second.")
			if (draw_button2(x1 + 45, yy + 50, 180, "Optimize tempo for data pack")) {
			    var otempo
				otempo = tempo
				if (otempo >= 15) tempo = 20
		        if (otempo < 15) tempo = 10
		        if (otempo < 7.5) tempo = 5
		        if (otempo < 4.5) tempo = 4
		        if (otempo < 3.25) tempo = 2.5
				if (otempo < 2.25) tempo = 2
				if (otempo < 1.625) tempo = 1.25
				if (otempo < 1.125) tempo = 1
				if (otempo < 0.75) tempo = 0.5
				if (otempo < 0.375) tempo = 0.25
		    }
		}
		draw_theme_color()

		yy += 90
		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "Using a resource pack, you may extend the supported range to 6 octaves.")
		draw_set_font(fnt_main)
		draw_text(x1 + 45, yy + 16, "To play without one, all blocks must be within Minecraft's 2 octave range.")	
		if (block_outside > 0) {
		draw_sprite(spr_yesno, 2, x1 + 25, yy + 8)
		    draw_set_color(c_orange)
		    if (block_outside = 1) {
		        draw_text(x1 + 45, yy + 32, "There is 1 block outside the 2 octave range.")
		    } else {
		        draw_text(x1 + 45, yy + 32, "There are " + string(block_outside) + " blocks outside the 2 octave range.")
		    }
		    if (draw_button2(x1 + 45, yy + 50, 120, "Select lower blocks")) {
		        select_outside(true, false)
		        window = 0
		    }
			if (draw_button2(x1 + 175, yy + 50, 120, "Select higher blocks")) {
		        select_outside(false, true)
		        window = 0
		    }
		    if (draw_button2(x1 + 305, yy + 50, 100, "Transpose notes")) {
		        if (question("Transpose notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) {
		            select_all(-1, 0)
		            selection_transpose()
		            selection_place(0)
		        }
		    }
		} else {
			draw_sprite(spr_yesno, 1, x1 + 25, yy + 8)
		    draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
		    draw_text(x1 + 45, yy + 32, "There are no blocks outside the 2 octave range.")
		}
		draw_theme_color()

		yy += 90
		draw_set_font(fnt_mainbold)
		draw_text(x1 + 45, yy, "Using a resource pack, you may play custom instruments in Minecraft.")
		draw_set_font(fnt_main)
		draw_text(x1 + 45, yy + 16, "To play without one, no custom instruments must be used.")
		if (block_custom > 0) {
			draw_sprite(spr_yesno, 2, x1 + 25, yy + 8)
		    draw_set_color(c_orange)
		    if (block_custom = 1) draw_text(x1 + 45, yy + 32, "There is 1 block with custom instruments.")
		    else draw_text(x1 + 45, yy + 32, "There are " + string(block_custom) + " blocks with custom instruments.")
			if (draw_button2(x1 + 45, yy + 50, 160, "Select affected blocks")) {
		        select_custom()
		        window = 0
		    }
		} else {
			draw_sprite(spr_yesno, 1, x1 + 25, yy + 8)
		    draw_set_color(c_green)
			if (theme == 2) draw_set_color(c_lime)
		    draw_text(x1 + 45, yy + 32, "There are no blocks with custom instruments.")
		}
		draw_theme_color()
	}

	if (draw_button2(x1 + 240 - 36, y1 + 413, 72, "OK")) window = 0
	window_set_cursor(cr_default)



}
