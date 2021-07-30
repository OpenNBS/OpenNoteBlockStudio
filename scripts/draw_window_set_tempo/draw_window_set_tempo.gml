function draw_window_set_tempo() {
	// draw_window_set_tempo()
	var bpm_multiplier = use_bpm ? 15 : 1
	var input = string_format(tempo * bpm_multiplier, 0, 2)
	var xx, w
	if (!use_bpm) {
		xx = 108
		w = 64
	} else {
		xx = 101
		w = 74
	}
	draw_set_alpha(1)
	input = draw_inputbox(100, xx, 57, w, input, "Enter the new tempo (in " + condstr(use_bpm, "beats per minute", "ticks per second") + ")")
	
	// Prevent closing the box if user clicked on top of it
	if (mouse_check_button_pressed(mb_left)) {
		settempo = mouse_rectangle(108, 57, 64, 22)
	}
	
	// Set tempo and close
	if ((mouse_check_button_released(mb_left) && !settempo && !mouse_rectangle(xx, 57, w, 22)) || keyboard_check_pressed(vk_enter)) {
		tempo = real(string_digits_symbol(string_replace(input, ",", "."), ".") / bpm_multiplier)
		if (tempo >= 1000) {
			tempo /= 100
		} else if (tempo >= 100) {
			tempo /= 10
		}
		tempo = median(0.25, tempo, 60)
		settempo = 0
		window = 0
	}
	
	// Cancel
	if (keyboard_check_pressed(vk_escape)) {
		settempo = 0
		window = 0
	}
}

