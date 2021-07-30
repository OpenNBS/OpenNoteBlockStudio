function draw_window_stats() {
	// draw_window_stats()
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	var x1, y1, a, n;
	x1 = floor(rw / 2 - 150)
	y1 = floor(rh / 2 - 200) + windowoffset
	draw_window(x1, y1, x1 + 300, y1 + 400)
	draw_theme_font(font_main_bold)
	draw_text(x1 + 8, y1 + 8, "Song Stats")
	draw_theme_font(font_main)
	if (!theme) {
	    draw_set_color(c_white)
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 294, y1 + 362, 0)
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 6, y1 + 26, x1 + 294, y1 + 362, 1)
	}
	draw_areaheader(x1 + 16, y1 + 40, 264, 150, "Note blocks")
	draw_scrollbar(statscrollbarv, x1 + 260, y1 + 48, 18, 5, ds_list_size(instrument_list), 0, 1)
	for (a = 0; a < 5; a += 1) {
	    var ins;
	    n = floor(sb_val[statscrollbarv]) + a
	    if (n >= ds_list_size(instrument_list)) break
	    ins = instrument_list[| n];
		if (ins.user) {
			draw_icon_customins(x1 + 32, y1 + 64 + 18 * a, n - first_custom_index, 1, true)
		} else {
			draw_sprite(spr_instrumenticons, n, x1 + 32, y1 + 64 + 18 * a)
		}
	    draw_text(x1 + 50, y1 + 65 + 18 * a, "x" + string(ins.num_blocks) + " (" + string(floor(ins.num_blocks / max(0.001, totalblocks) * 100)) + "%)")
	    popup_set_window(x1 + 32, y1 + 64 + 18 * a, 100, 18, ins.name)
	}
	draw_text(x1 + 32, y1 + 156, "Total: " + string(totalblocks))
	draw_areaheader(x1 + 16, y1 + 210, 264, 140, "Work stats")
	draw_text(x1 + 32, y1 + 226, "Minutes spent:\nLeft clicks:\nRight clicks:\nBlocks created:\nBlocks deleted:")
	draw_set_halign(fa_right)
	draw_text(x1 + 260, y1 + 226, string(floor(work_mins)) + "\n" + string(work_left) + "\n" + string(work_right) + "\n" + string(work_add) + "\n" + string(work_remove))
	draw_set_halign(fa_left)
	if (draw_button2(x1 + 200, y1 + 320, 72, "Reset")) {
	    if (question("Are you sure? This cannot be undone.", "Confirm")) {
	        work_mins = 0
	        work_left = 0
	        work_right = 0
	        work_add = 0
	        work_remove = 0
	        changed = 1
	    }
	}
	if (draw_button2(x1 + 220, y1 + 368, 72, "OK") && (windowopen = 1 || theme != 3)) windowclose = 1
	window_set_cursor(cr_default)
}
