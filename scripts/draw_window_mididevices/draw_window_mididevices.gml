function draw_window_mididevices() {
	// draw_window_instruments()
	var x1, y1, a, b, c, str, menun, menua, menub;
	windowanim = 1
	if (theme = 3) draw_set_alpha(windowalpha)
	curs = cr_default
	menun = -1
	x1 = floor(rw / 2 - 250)
	y1 = floor(rh / 2 - 175) + windowoffset
	draw_window(x1, y1, x1 + 500, y1 + 350)
	draw_theme_font(font_main_bold)
	if (language != 1) draw_text_dynamic(x1 + 8, y1 + 8, "MIDI device manager")
	else draw_text_dynamic(x1 + 8, y1 + 8, "MIDI设备管理器")
	draw_theme_font(font_main)
	if (language != 1) draw_text_dynamic(x1 + 12, y1 + 32, "Here you can see the MIDI devices connected via USB.\nMore than one device can be connected at the same time.")
	else draw_text_dynamic(x1 + 12, y1 + 32, "你可以查看通过USB连接的MIDI设备。可以同时连接多个设备。")
	draw_set_color(c_white)
	if(theme = 2) draw_set_color(c_dark)
	if (fdark && theme = 3) draw_set_color(2829099)
	draw_rectangle(x1 + 12, y1 + 66, x1 + 488, y1 + 310, 0)
	if (theme = 0) {
	    draw_set_color(make_color_rgb(137, 140, 149))
	    draw_rectangle(x1 + 12, y1 + 66, x1 + 488, y1 + 310, 1)
	} else {
	    if (theme != 3) draw_area(x1 + 11, y1 + 65, x1 + 489, y1 + 312)
	    else draw_area(x1 + 11, y1 + 65 + 2, x1 + 489, y1 + 312)
	}
	// Tabs
	if (language != 1) {
	draw_window(x1 + 13 + 250 + 75, y1 + 67, x1 + 14 + 250 + 75 + 64 + 85 + 1, y1 + 67 + 20, 1) 
	popup_set_window(x1 + 13 + 250 + 75, y1 + 67, 64 + 85, 20, "The instrument that note block added by this device\nwhen recording should have.")
	draw_text_dynamic(x1 + 18 + 250 + 75, y1 + 70, "Instrument")

	draw_window(x1 + 13 - 2, y1 + 67, x1 + 14 + 250 + 75, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 - 2, y1 + 67, 250 + 75, 20, "The name of the device.")
	draw_text_dynamic(x1 + 18, y1 + 70, "Name")

	if (draw_button2(x1 + 408, y1 + 318, 80, "OK") && wmenu = 0 && (windowopen = 1 || theme != 3)) windowclose = 1
	} else {
	draw_window(x1 + 13 + 250 + 75, y1 + 67, x1 + 14 + 250 + 75 + 64 + 85 + 1, y1 + 67 + 20, 1) 
	popup_set_window(x1 + 13 + 250 + 75, y1 + 67, 64 + 85, 20, "为该MIDI设备指定的音色。")
	draw_text_dynamic(x1 + 18 + 250 + 75, y1 + 70, "音色")

	draw_window(x1 + 13 - 2, y1 + 67, x1 + 14 + 250 + 75, y1 + 67 + 20, 1)
	popup_set_window(x1 + 13 - 2, y1 + 67, 250 + 75, 20, "该设备的名称。")
	draw_text_dynamic(x1 + 18, y1 + 70, "名称")

	if (draw_button2(x1 + 408, y1 + 318, 80, "确定") && wmenu = 0 && (windowopen = 1 || theme != 3)) windowclose = 1
	}

	// Instruments
	for (a = 0; a < 11; a += 1) {
	    if (a >= midi_input_devices()) break
	    draw_set_color(12632256)
	    draw_line(x1 + 14, y1 + 106 + 20 * a, x1 + 14 + 250 + 75 + 64 + 85, y1 + 106 + 20 * a)
	    draw_theme_color()
	    draw_text_dynamic(x1 + 18, y1 + 90 + 20 * a, midi_input_device_name(a))
	    var insname;
		if (language != 1) {
	    if (mididevice_instrument[a] = -3) insname = "Disable device"
		else if (mididevice_instrument[a] = -2) insname = "None"
		else if (mididevice_instrument[a] = -1) insname = "Use selected"
	    else insname = string_replace_all(mididevice_instrument[a].name, "\n", "\\\n")
		} else {
		if (mididevice_instrument[a] = -3) insname = "禁用设备"
		else if (mididevice_instrument[a] = -2) insname = "无"
		else if (mididevice_instrument[a] = -1) insname = "使用选择的"
	    else insname = string_replace_all(mididevice_instrument[a].name, "\n", "\\\n")
		}
	    draw_text_dynamic(x1 + 18 + 250 + 75, y1 + 90 + 20 * a, insname)
	    if (draw_abutton(x1 + 18 + 250 + 75 + 64 + 85 - 24, y1 + 88 + 20 * a)) {
	        var inslist, menu;
	        inslist = check(mididevice_instrument[a] = -3) + "禁用设备|" + check(mididevice_instrument[a] = -2) + "无|" + check(mididevice_instrument[a] = -1) + "使用选择的|-|"
	        for (b = 0; b < ds_list_size(instrument_list); b += 1) {
	            var ins = instrument_list[| b];
	            if (b = first_custom_index) inslist += "-|"
	            inslist += check(mididevice_instrument[a] = ins) + clean(ins.name) +"|"
	        }
	        menu = show_menu_ext("mididevices_ins", x1 + 18 + 250 + 70, y1 + 86 + 20 * a + 20, inslist)
	        menu.mididevice = a
	    }
	}
	if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0
	draw_set_color(12632256)
	draw_line(x1 + 18 + 250 + 70, y1 + 87, x1 + 18 + 250 + 70, y1 + 86 + 20 * a)
	draw_line(x1 + 18 + 250 + 70 + 64 + 85, y1 + 87, x1 + 18 + 250 + 70 + 64 + 85, y1 + 86 + 20 * a)
	window_set_cursor(curs)
	window_set_cursor(cr_default)
}
