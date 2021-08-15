function menu_draw() {
	// menu_draw()
	if (ani < 1) ani += 0.1 * (30 / room_speed) * (1 / obj_controller.currspeed)
	else ani = 1
	var m, menux, menuy, noclick, o, theme, cm;
	theme = obj_controller.theme;
	menux[0] = sx
	menuy[0] = sy
	sel = -1
	noclick = 0
	o = obj_controller;
	for (m = 0; m < menus; m += 1) {
	    if (!menu_show[m]) continue
	    var dx, dy, i, iy, hei;
		dx = menux[m]
	    dx = menux[m] - (dx + menu_wid[m] > o.rw) * menu_wid[m] - (dx + menu_wid[m] > o.rw) * menu_wid[0] * (m > 0)// - (dx + menu_wid[m - (m > 0)] > o.rw) * (menu_show[m - (m > 0)]) * (m > 0) * menu_wid[m - (m > 0)]
	    dy = menuy[m]
		cm = floor(m * 0.5)
	    hei = menu_hei[m] * (1 - power(1 - ani, 2))
	    if (dy + hei > o.rh) dy = o.rh - hei
	    iy = 8
	    if (!o.fdark) draw_theme_color()
	    else draw_set_color(197379)
	    draw_set_alpha(0.25)
	    if (theme = 3) draw_rectangle(dx + menu_wid[m] - 7, dy + hei - 7, dx + menu_wid[m] + 1, dy + hei + 1, 0)
	    draw_set_alpha(1)
	    if (o.theme != 3) draw_set_color(window_background)
	    else draw_set_color(16382457)
		if (obj_controller.fdark && theme = 3) draw_set_color(2829099)
		if (o.theme = 3) {
			draw_sprite(spr_shadowext, 0 + 5 * (obj_controller.fdark && theme = 3), dx + 4, dy + hei + 1)
			draw_sprite_ext(spr_shadowext, 1 + 5 * (obj_controller.fdark && theme = 3), dx + 9, dy + hei + 1, menu_wid[m] - 7, 1, 0, -1, 1)
			draw_sprite(spr_shadowext, 2 + 5 * (obj_controller.fdark && theme = 3), dx + menu_wid[m] + 1, dy + hei + 1)
			draw_sprite_ext(spr_shadowext, 3 + 5 * (obj_controller.fdark && theme = 3), dx + menu_wid[m] + 1, dy + 9, 1, hei - 7, 0, -1, 1)
			draw_sprite(spr_shadowext, 4 + 5 * (obj_controller.fdark && theme = 3), dx + menu_wid[m] + 1, dy + 4)
		}
		if (theme = 3) draw_surface_blur(application_surface, dx, dy, menu_wid[m], hei, 0.5)
		if (theme = 3) draw_set_alpha(0.6)
	    if (theme != 3) draw_rectangle(dx, dy, dx + menu_wid[m], dy + hei, 0)
		else draw_roundrect(dx, dy, dx + menu_wid[m], dy + hei, 0)
	    draw_set_alpha(0.25)
	    draw_theme_color()
	    if (o.theme != 3) draw_line(dx + 29, dy + 3, dx + 29, dy + hei - 3)
	    draw_set_alpha(1)
	    draw_set_color(c_white)
	    if (o.theme != 3) draw_line(dx + 30, dy + 3, dx + 30, dy + hei - 3)
	    draw_theme_color()
	    draw_set_alpha(0.25)
	    if (theme != 3) draw_rectangle(dx, dy, dx + menu_wid[m], dy + hei, 1)
	    else draw_roundrect(dx, dy, dx + menu_wid[m], dy + hei, 1)
	    draw_set_alpha(1)
	    for (i = 0; i < items[m]; i += 1) {
	        if (iy >= hei - 3) break
	        if (item_str[m, i] = "-") { // Separator
	            draw_set_alpha(0.25)
	            draw_theme_color()
	            draw_line(dx + 32, dy + iy - 2, dx + menu_wid[m] - 3, dy + iy - 2)
	            draw_set_alpha(1)
	            draw_set_color(c_white)
	            draw_line(dx + 32, dy + iy - 1, dx + menu_wid[m] - 3, dy + iy - 1)
	            iy += 6
	        } else {
	            var issel;
				var inaissel;
	            issel = (mouse_rectangle(dx + 3, dy + iy - 5, menu_wid[m] - 5, 22))
	            inaissel = (mouse_rectangle(dx + 3, dy + iy - 5, menu_wid[m] - 5, 22))
	            if (issel) { // Close higher menus
	                var om;
	                for (om = m + 1; om < menus; om += 1) menu_show[om] = 0
	                if (ani = 1) {
	                    sel = item_n[m, i]
	                    if (item_hasmenu[m, i] > 0 || item_inactive[m, i]) noclick = 1
	                }
	                selmenu = m
	                selitem = i
	            }
	            if (item_inactive[m, i]) issel = 0
	            if (item_hasmenu[m, i] > 0) {
	                if (menu_show[item_hasmenu[m, i]]) issel = 1
	                if (issel) {
	                    menu_show[item_hasmenu[m, i]] = 1
	                    menux[item_hasmenu[m, i]] = dx + menu_wid[m] - 3
	                    menuy[item_hasmenu[m, i]] = dy + iy - 8
	                }
	            }
	            draw_theme_color()
	            if (issel) {
					if (o.theme != 3) {
	                draw_set_color(16684072)
	                draw_rectangle(dx + 3, dy + iy - 5, dx + menu_wid[m] - 2, dy + iy - 5 + 22, 0)
	                draw_set_color(c_white)
					} else {
					draw_set_color(15987699)
					if (obj_controller.fdark) draw_set_color(4276545)
	                draw_roundrect(dx + 3, dy + iy - 5, dx + menu_wid[m] - 2, dy + iy - 5 + 22, 0)
	                draw_theme_color()
					}
	            } //else if (inaissel && !obj_controller.fdark) {
					//if (o.theme = 3) {
	                //draw_set_color(15132390)
	                //draw_rectangle(dx + 3, dy + iy - 5, dx + menu_wid[m] - 2, dy + iy - 5 + 22, 0)
	                //draw_set_color(c_black)
					//}
				//}
	            draw_set_alpha(1 - 0.5 * item_inactive[m, i])
	            draw_text(dx + 36, dy + iy, item_str[m, i])
	            if (item_shortcut[m, i] != "") {
	                draw_set_halign(fa_right)
	                draw_text(dx + menu_wid[m] - 20, dy + iy, item_shortcut[m, i])
	                draw_set_halign(fa_left)
	            }
				if (theme != 3) {
	            if (item_image[m, i] > -1) draw_sprite(spr_icons, item_image[m, i], dx + 2, dy + iy - 6)
				} else {
					if (obj_controller.fdark && theme = 3) {
						if (item_image[m, i] > -1) draw_sprite(spr_icons_d, item_image[m, i], dx + 2, dy + iy - 6)
					} else {
						if (item_image[m, i] > -1) draw_sprite(spr_icons_f, item_image[m, i], dx + 2, dy + iy - 6)
					}
				}
				var color;
				if(obj_controller.theme = 2) {
					if(issel)color = c_black;
					else color = c_white;
				}else{
					if(issel)color = c_white;
					else color = c_black;
				}	
				if (theme != 3) {
	            if (item_hasmenu[m, i] > 0) draw_sprite_ext(spr_icons, icons.SUB_MENU, dx + menu_wid[m] - 24, dy + iy - 6, 1, 1, 0, color, draw_get_alpha())
				} else {
					if (obj_controller.fdark && theme = 3) {
						if (item_hasmenu[m, i] > 0) draw_sprite_ext(spr_icons_d, icons.SUB_MENU, dx + menu_wid[m] - 24, dy + iy - 6, 1, 1, 0, color, draw_get_alpha())
					} else {
						if (item_hasmenu[m, i] > 0) draw_sprite_ext(spr_icons_f, icons.SUB_MENU, dx + menu_wid[m] - 24, dy + iy - 6, 1, 1, 0, color, draw_get_alpha())
					}
				}
	            draw_set_alpha(1)
	            iy += 22
	        }
	    }
	}
	if (mouse_check_button_released(mb_left) && ani = 1 && !noclick) {
		if (m && mouse_check_button_released(mb_left) && obj_controller.windowsound && theme = 3) with (obj_controller) play_sound(soundhide, 45, 100, 100, 0)
	    var a;
	    a = sel
	    with (obj_controller) menu_click(a)
	    instance_destroy()
	}
	draw_theme_color()
	


}
