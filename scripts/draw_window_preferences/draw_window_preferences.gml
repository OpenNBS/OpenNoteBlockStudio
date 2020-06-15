// draw_window_preferences()
var x1, y1, a, b, c, as, stabx, stabw, nsel, str;
curs = cr_default
nsel = -1
x1 = floor(window_width / 2 - 250)
y1 = floor(window_height / 2 - 200)
draw_window(x1, y1, x1 + 500, y1 + 400)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Preferences")
draw_set_font(fnt_main)
b = 8
str[0] = "General"
str[1] = "Appearance"
str[2] = "Usability"
str[3] = "Playback"
if (theme = 1) {
    draw_window(x1 + 4, y1 + 45, x1 + 496, y1 + 364)
}
for (a = 0; a < 4; a += 1) {
    c = mouse_rectangle(x1 + b, y1 + 28, string_width(str[a]) + 12, 18)
    if (selected_tab = a) {
        stabx = b - 2
        stabw = string_width(str[a]) + 15
    } else {
		draw_sprite(spr_tabbuttons, 0 + 3 * c + 6 * theme, x1 + b, y1 + 28)
		draw_sprite_ext(spr_tabbuttons, 1 + 3 * c + 6 * theme, x1 + b + 2, y1 + 28, string_width(str[a]) / 2 + 4, 1, 0, -1, 1)
		draw_sprite(spr_tabbuttons, 2 + 3 * c + 6 * theme, x1 + b + string_width(str[a]) + 10, y1 + 28)		
        draw_text(x1 + b + 6, y1 + 30, str[a])
    }
    if (mouse_check_button_pressed(mb_left) && c) nsel = a
    b += string_width(str[a]) + 12
}
if (theme = 0 || theme = 2) {
    draw_set_color(c_white)
	if(theme = 2) draw_set_color(c_dark)
    draw_rectangle(x1 + 6, y1 + 46, x1 + 494, y1 + 362, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 46, x1 + 494, y1 + 362, 1)
    draw_set_color(c_white)
	if(theme = 2) draw_set_color(c_dark)
    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + stabx, y1 + 26, x1 + stabx + stabw, y1 + 26 + 20, 1)
    draw_set_color(c_white)
	if(theme = 2) draw_set_color(c_dark)
    draw_rectangle(x1 + stabx + 1, y1 + 46, x1 + stabx + stabw - 1, y1 + 47, 0)
    draw_theme_color()
    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab])
    draw_set_color(make_color_rgb(213, 223, 229))
    if(theme = 0) draw_roundrect(x1 + 10, y1 + 50, x1 + 490, y1 + 358, 1)
}else{
    draw_sprite(spr_tabbuttons, 18, x1 + stabx - 1, y1 + 26)
    draw_sprite_ext(spr_tabbuttons, 19, x1 + stabx + 1, y1 + 26, stabw / 2 - 1, 1, 0, -1, 1)
    draw_sprite(spr_tabbuttons, 20, x1 + stabx + stabw - 1, y1 + 26)
    draw_text(x1 + stabx + 8, y1 + 28, str[selected_tab])
}
if (nsel > -1) selected_tab = nsel
selected_tab += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
if (selected_tab < 0) selected_tab = 3
if (selected_tab > 3) selected_tab = 0
draw_theme_color()
if (selected_tab = 0) {
    draw_areaheader(x1 + 22, y1 + 74, 218, 65, "Startup")
    if (draw_checkbox(x1 + 40, y1 + 90, show_welcome, "Show greeting window", "Whether to show the greeting window\nwhen the program is opened.")) show_welcome=!show_welcome
    if (draw_checkbox(x1 + 40, y1 + 110, check_update, "Check for updates", "Whether to check for any updates\nwhen the program is opened.")) check_update=!check_update
	
	// Auto-saving
	draw_areaheader(x1 + 258, y1 + 74, 220, 65, "Auto-saving")
	as = autosave
	if (draw_checkbox(x1 + 276, y1 + 90, autosave, "Enable auto-saving", "Whether the song should automatically\nbe saved every now and then.")) autosave=!autosave
	if (as != autosave) {
	    changed = 1
	    if (autosave = 0) tonextsave = 0
	    if (autosave = 1) tonextsave = autosavemins
	}
	if (autosave = 0) {
	    draw_set_color(c_gray)
	    draw_text(x1 + 306, y1 + 110, "Interval:       minute" + condstr(autosavemins > 1, "s"))
		draw_text(x1 + 355, y1 + 110, autosavemins)
	    draw_theme_color()
	} else {
		draw_text(x1 + 306, y1 + 110, "Interval:       minute" + condstr(autosavemins > 1, "s"))
		as = autosavemins
		autosavemins = median(1, draw_dragvalue(2, x1 + 355, y1 + 110, autosavemins, 1), 60)
		if (autosavemins != a) {changed = 1 tonextsave = autosavemins}
	}
	popup_set_window(x1 + 306, y1 + 110, 180, 16, "The amount of minutes between each auto-save.")
	
    draw_areaheader(x1 + 22, y1 + 164, 218, 80, "Theme")
    if (draw_radiobox(x1 + 40, y1 + 164 + 16, theme == 0, "Aqua", "Use the aqua theme.")) {theme = 0 change_theme()}
	if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 20, theme == 2, "Dark", "Use the dark theme.")) {theme = 2 change_theme()}
    if (draw_radiobox(x1 + 40, y1 + 164 + 16 + 20 + 20, theme == 1, "90s", "Use the 90s theme.")) {theme = 1 change_theme()}
    draw_areaheader(x1+258,y1+164,220,60,"Max frame rate (experimental)")
    if (draw_radiobox(x1+274,y1+164+16,!refreshrate,"30FPS","Run the program at 30FPS.")) {
        game_set_speed(30,gamespeed_fps)
		refreshrate=0
    }
    if (draw_radiobox(x1+274,y1+164+16+20,refreshrate,"60FPS","Run the program at 60FPS.")) {
        game_set_speed(60,gamespeed_fps)
		refreshrate=1
    }

	draw_text(x1 + 22, y1 + 260, "Song folder: " + string_truncate(songfolder, 360))
    popup_set_window(x1 + 22, y1 + 260, 430, 18, songfolder)
    if (draw_button2(x1 + 22, y1 + 276, 76, "Open")) {
        if (!directory_exists_lib(songfolder)) {
            message("The indicated folder doesn't exist!", "Error")
        } else {
            open_url(songfolder)
        }
    }
    if (draw_button2(x1 + 22 + 84, y1 + 276, 76, "Change")) {
        message("Select the directory where saving/loading should be opened in.", "")
        a = string(get_save_filename_ext("", "Select song folder", songfolder, "Song folder"))
        if (a != "") songfolder = filename_dir(a)
    }
    if (draw_button2(x1 + 22 + 84 + 84, y1 + 276, 96, "Use default")) songfolder = songs_directory
	
	draw_text(x1 + 22, y1 + 310, "Pattern folder: " + string_truncate(patternfolder, 360))
    popup_set_window(x1 + 22, y1 + 300, 430, 18, patternfolder)
    if (draw_button2(x1 + 22, y1 + 326, 76, "Open")) {
        if (!directory_exists_lib(patternfolder)) {
            message("The indicated folder doesn't exist!", "Error")
        } else {
            open_url(patternfolder)
        }
    }
    if (draw_button2(x1 + 22 + 84, y1 + 326, 76, "Change")) {
        message("Select the directory where patterns can be imported/exported to.", "")
        a = string(get_save_filename_ext("", "Select patterns folder", patternfolder, "Pattern folder"))
        if (a != "") patternfolder = filename_dir(a)
    }
    if (draw_button2(x1 + 22 + 84 + 84, y1 + 326, 96, "Use default")) patternfolder = pattern_directory
} else if (selected_tab = 1) {
    draw_areaheader(x1 + 22, y1 + 74, 456, 170, "Note blocks")
    if (draw_radiobox(x1 + 40, y1 + 90, draw_type = 0, "Use colored note blocks", "If the instruments should be identified with\ndifferent colors.")) draw_type = 0
    if (draw_radiobox(x1 + 40, y1 + 110, draw_type = 1, "Show instrument icons", "If the instruments should be identified with\ntheir respective icons.")) draw_type = 1
	if (draw_radiobox(x1 + 40, y1 + 130, draw_type = 2, "Use different shapes for each instrument", "If the instruments should be identified\nwith different shapes.")) draw_type = 2
		
    if (draw_checkbox(x1 + 40, y1 + 160, show_numbers, "Show key numbers", "Whether to show the amount of right-clicks required\nfor each note block.")) show_numbers=!show_numbers
    if (draw_checkbox(x1 + 40, y1 + 180, show_octaves, "Show octave numbers", "Whether the number of the octave the note block\nis in should be shown.")) show_octaves=!show_octaves
	if (draw_checkbox(x1 + 40, y1 + 200, fade, "No fading", "Disables transparency animations on note block sprites")) fade = !fade
	if (draw_checkbox(x1 + 40, y1 + 220, show_layers, "Show layer boxes", "Whether the layer boxes should be\nshown to the right of the workspace.")) show_layers = !show_layers
    draw_areaheader(x1 + 22, y1 + 260, 456, 95, "Piano")
    if (draw_checkbox(x1 + 40, y1 + 276, show_piano, "Show piano", "Whether the piano should be visible.")) show_piano = !show_piano
    if (draw_checkbox(x1 + 40, y1 + 296, show_keynames, "Show key names", "If the names of the keys should be shown.")) show_keynames=!show_keynames
    if (draw_checkbox(x1 + 40, y1 + 316, show_keyboard, "Show keyboard shortcuts", "Show the keyboard shortcuts of the keys.")) show_keyboard=!show_keyboard
    if (draw_checkbox(x1 + 40, y1 + 336, show_notechart, "Show note chart when hovering over keys", "Whether to show a note chart\nwhen hovering over the keys.")) show_notechart=!show_notechart
    if (!show_piano) draw_set_color(c_gray)
	draw_text(x1 + 180, y1 + 275, "Keys to show:")
	if (show_piano) {
		keysmax = median(20, draw_dragvalue(4, x1 + 260, y1 + 275, keysmax, 2), 50)
	} else {
		draw_text(x1 + 260, y1 + 275, keysmax)
	}
	draw_theme_color()
    popup_set_window(x1 + 180, y1 + 275, 150, 21, "The amount of keys to show. A high number may\nslow down the program on old computers.")
} else if (selected_tab = 2) {
    draw_areaheader(x1 + 22, y1 + 74, 456, 120, "Mouse wheel")
    if (draw_radiobox(x1 + 40, y1 + 90, mousewheel = 0, "Use mouse wheel to scroll through the song", "Use the mouse wheel to scroll through\nthe song horizontally or vertically.")) mousewheel = 0
    if (draw_radiobox(x1 + 40, y1 + 110, mousewheel = 1, "Use mouse wheel to change instrument", "Use the mouse wheel to toggle between\nthe available instruments.")) mousewheel = 1
    if (draw_radiobox(x1 + 40, y1 + 130, mousewheel = 2, "Use mouse wheel to change key", "Use the mouse wheel to toggle\nbetween the keys on the piano.")) mousewheel = 2
    if (draw_checkbox(x1 + 40, y1 + 158, changepitch, "Change note properties when scrolling over notes", "Whether scrolling when hovering over a note should change its key,\nvelocity, panning or pitch, according to the currently selected edit mode.")) changepitch=!changepitch
	//draw_text(x1 + 40, y1 + 178, "Tip: Hold Shift while scrolling over a note to change a whole octave,\nor fine-tune its velocity, panning or pitch.")
    draw_areaheader(x1 + 22, y1 + 220, 456, 105, "Piano")
    if (draw_checkbox(x1 + 40, y1 + 236, select_lastpressed, "Set selected key to pressed one", "If the selected key should be set\nto the one pressed using the keyboard.")) select_lastpressed=!select_lastpressed
    draw_text(x1 + 40, y1 + 270, "Right-click on keys to change their shortcuts.")
    if (draw_button2(x1 + 40, y1 + 290, 160, "Reset key shortcuts")) {
        if (question("Are you sure?", "Confirm")) init_keys()
    }
} else if (selected_tab = 3) {
    draw_areaheader(x1 + 22, y1 + 74, 456, 125, "Marker")
    if (draw_checkbox(x1 + 40, y1 + 90, marker_follow, "Follow marker when playing", "Automatically scroll along with the\nmarker when playing the song.")) marker_follow=!marker_follow
    if (draw_radiobox(x1 + 70, y1 + 110, marker_pagebypage, "Page by page", "Scroll with the marker every page.", !marker_follow)) marker_pagebypage = 1
    if (draw_radiobox(x1 + 70, y1 + 130, !marker_pagebypage, "Tick by tick", "Scroll with the marker every tick.", !marker_follow)) marker_pagebypage = 0
    if (draw_checkbox(x1 + 40, y1 + 150, marker_start, "Start playing in section", "Whether to always start playing\nat the start of the active section.")) marker_start=!marker_start
    if (draw_checkbox(x1 + 40, y1 + 170, marker_end, "Stop playing after section", "Whether to stop playing when the\nmarker passes the active section.")) marker_end=!marker_end
    draw_areaheader(x1 + 22, y1 + 224, 218, 100, "Playing")
    if (draw_checkbox(x1 + 32, y1 + 224 + 16, realvolume, "Show layer volumes", "Whether to show the volume of layers.")) realvolume=!realvolume
	if (draw_checkbox(x1 + 32, y1 + 244 + 16, realstereo, "Disable stereo", "Disables stereo playback.")) realstereo = !realstereo
	if (draw_checkbox(x1 + 32, y1 + 264 + 16, looptobarend, "Loop to bar end", "Loops to the end of the bar/measure.")) looptobarend = !looptobarend
	if (draw_checkbox(x1 + 32, y1 + 284 + 16, show_soundcount, "Show number of active sounds", "Displays the number of sounds that are\ncurrently playing in the status bar.")) show_soundcount = !show_soundcount
	draw_areaheader(x1 + 233 + 22, y1 + 224, 223, 60, "Tempo unit")
	if (draw_radiobox(x1 + 233 + 32, y1 + 224 + 16, !use_bpm, "Ticks per second (t/s)", "Display song tempos in ticks per second.")) use_bpm = 0
	if (draw_radiobox(x1 + 233 + 32, y1 + 244 + 16, use_bpm, "Beats per minute (BPM)", "Display song tempos in beats per minute.")) use_bpm = 1
}
if (draw_button2(x1 + 420, y1 + 368, 72, "OK")) window = 0
window_set_cursor(curs)
