function anim_window_open() {
	// Opening and closing animation for windows.
	
	// Fluent (fade)
	if (theme = 3) {
		if (windowopen = 0) {
			if (windowalpha < 1) {
				if (refreshrate = 0) windowalpha += 1/3.75
				else if (refreshrate = 1) windowalpha += 1/7.5
				else if (refreshrate = 2) windowalpha += 1/15
				else if (refreshrate = 3) windowalpha += 1/18
				else windowalpha += 1/20
			} else {
				windowalpha = 1
				windowopen = 1
			}
		}
		if (windowclose = 1) {
			if (windowalpha > 0) {
				if (refreshrate = 0) windowalpha -= 1/3.75
				else if (refreshrate = 1) windowalpha -= 1/7.5
				else if (refreshrate = 2) windowalpha -= 1/15
				else if (refreshrate = 3) windowalpha -= 1/18
				else windowalpha -= 1/20
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