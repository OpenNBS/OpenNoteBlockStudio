/// @function draw_piano_key(isblack, xx, yy, color, alpha, key, showkeybind, showclicks, ispressed)
/// @description Draw a piano key.
function draw_piano_key(isblack, xx, yy, color, alpha, key, showkeybind, showclicks, ispressed) {
	
	var sprite_offset = 0;
	var dark = 0;
	if (theme == 3) {
		sprite_offset = 6;
		if (fdark) {
			dark = 6;
		}
	}
	
	// Black
	if (isblack) {
		
		// Key
		draw_sprite_ext(spr_piano, 2 + sprite_offset + dark, xx, yy, 1, 1, 0, color, 1)
		if (alpha < 3) draw_sprite_ext(spr_piano, 5 + sprite_offset, xx, yy, 1, 1, 0, window_background, 0.8 - alpha / 3)
		
	    draw_sprite_ext(spr_piano, 1 + sprite_offset + dark, xx, yy + floor(7 * ispressed), 1, 1, 0, color, 1)
	    if (alpha < 3) draw_sprite_ext(spr_piano, 4 + sprite_offset, xx, yy + floor(7 * ispressed), 1, 1, 0, window_background, 0.8 - alpha / 3)
	    
		// Text
	    draw_set_alpha(alpha / 3)
	    draw_set_halign(fa_center)
		draw_theme_font(font_main_bold)
		
		if (theme == 3 && fdark) {
			draw_set_color(color)
		} else {
			draw_set_color(c_white)
		}
		
	    if (show_keynames) {
	        draw_text(xx + 19, yy + 29 + floor(7 * ispressed) - 4 * (showkeybind) - 4 * (showkeybind && showclicks) - 6 * (showclicks), get_keyname(key, 1))
	    }
		
		if (showclicks) {
			draw_text(xx + 19, yy + 34 + floor(7 * ispressed) - 8 * showkeybind, string(key - 33))
		}
		
		draw_theme_font(font_main)
	    if (showkeybind) {
	        if ((editline mod 15) < 7 || key_edit != key) draw_text(xx + 19, yy + 39 + floor(7 * ispressed), chr(piano_key[key]))
	    }
		
	    draw_set_halign(fa_left)
	}
	
	// White
	else {
		
		// Key
	    draw_sprite_ext(spr_piano, 0 + sprite_offset + dark, xx, yy, 1, 1, 0, color, 1)
	    if (alpha < 3) draw_sprite_ext(spr_piano, 3 + sprite_offset, xx, yy, 1, 1, 0, window_background, 0.8 - alpha / 3)
		
		// Text
		draw_set_alpha(alpha / 3)
	    draw_set_halign(fa_center)
		draw_theme_font(font_main_bold)
		if (theme == 3 && fdark) {
			draw_set_color(color)
		} else {
			draw_set_color(c_black)
		}
		
	    if (show_keynames) {
	        draw_text(xx + 20, yy + 85 - 4 * showkeybind - 4 * (showkeybind && showclicks) - 6 * (showclicks), get_keyname(key, 1))
	    }
		
		if (showclicks) {
			draw_text(xx + 20, yy + 85 + 5 - 8 * showkeybind, string(key - 33))
		}
		
		draw_theme_font(font_main)
	    if (showkeybind) {
	        if ((editline mod 15) < 7 || key_edit != key) draw_text(xx + 20, yy + 95, chr(piano_key[key]))
	    }
		
		draw_set_halign(fa_left)
	}
}