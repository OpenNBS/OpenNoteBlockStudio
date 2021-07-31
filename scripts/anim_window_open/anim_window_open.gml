function anim_window_open() {
	// Opening and closing animation for windows.
	
	var duration = 0.25
	var delta = 1 / (room_speed * duration * currspeed)
	
	// Fluent (fade)
	if (theme = 3) {
		if (windowopen = 0) {
			if (windowprogress < 1) {
				windowprogress += delta
				windowprogress = min(windowprogress, 1)
				windowalpha = ease_out_sine(windowprogress)
				windowoffset = (1 - ease_out_sine(windowprogress)) * 12
			} else {
				windowprogress = 1
				windowalpha = 1
				windowopen = 1
			}
		}
		if (windowclose = 1) {
			if (windowprogress > 0) {
				windowprogress -= delta
				windowprogress = max(windowprogress, 0)
				windowalpha = ease_in_sine(windowprogress)
				windowoffset = -(1 - ease_in_sine(windowprogress)) * 12
			} else {
				windowprogress = 0
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