function draw_window_set_tempo() {
	// draw_window_set_tempo()
	var bpm_multiplier = use_bpm ? 15 : 1
	var input = string_format(tempo * bpm_multiplier, 0, 2)
	input = draw_inputbox(100, 108, 57, 64, input, "Enter the new tempo value (in " + condstr(use_bpm, "BPM", "t/s") + ")")
	
	}
	
	if ((mouse_check_button_released(mb_left) && !mouse_rectangle(108, 57, 64, 22)) || keyboard_check_pressed(vk_enter)) {
		tempo = real(string_digits_symbol(string_replace(input, ",", "."), ".") / bpm_multiplier)
		if (tempo >= 1000) {
			tempo /= 100
		} else if (tempo >= 100) {
			tempo /= 10
		}
		tempo = median(0.25, tempo, 60)
		window = 0
	}
	if (keyboard_check_pressed(vk_escape)) {
		window = 0
	}
}

