function anim_window_open() {
	// Opening and closing animation for windows.
	
	var duration = 0.25
	var delta = 1 / (room_speed * duration)
	
	// Fluent (fade)
	if (theme = 3) {
		if (windowopen = 0) {
			if (windowalpha < 1) {
				windowalpha += delta
				windowalpha = min(windowalpha, 1)
				windowoffset = ease_in_sine(1 - windowalpha) * 20
			} else {
				windowalpha = 1
				windowopen = 1
			}
		}
		if (windowclose = 1) {
			if (windowalpha > 0) {
				windowalpha -= delta
				windowalpha = max(windowalpha, 0)
				windowoffset = ease_out_sine(1 - windowalpha) * 20
			} else {
				windowalpha = 0
				windowclose = 0
				windowopen = 0
				windowanim = 0
				window = 0
				selected_tab = 0
				selected_tab_dat = 0
				selected_tab_mc = 0
				selected_tab_sch = 0
			}
		}
	}
	
	// Others (instant)
	else {
		if (windowopen = 0) {
			windowalpha = 1
			windowopen = 1
		}
		if (windowclose = 1) {
			windowclose = 0
			windowanim = 0
			window = 0
			selected_tab = 0
			selected_tab_dat = 0
			selected_tab_mc = 0
			selected_tab_sch = 0
		}
	}
	
	draw_set_alpha(1)
}