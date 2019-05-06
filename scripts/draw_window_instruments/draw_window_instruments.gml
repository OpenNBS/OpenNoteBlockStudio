// draw_window_instruments()
var x1, y1, a, b, c, str, menun, menua, menub;
curs = cr_default
menun = -1
x1 = floor(window_width / 2 - 275)
y1 = floor(window_height / 2 - 175)
draw_window(x1, y1, x1 + 550, y1 + 350)
draw_set_font(fnt_mainbold)
draw_text(x1 + 10, y1 + 8, "Instrument Settings")
draw_set_font(fnt_main)
draw_text(x1 + 12, y1 + 31, "These settings only apply to this song. To import the settings from another\nsong, click \"Import\". The sound files must be located in the \"Sounds\" folder.")
draw_set_color(c_white)
draw_rectangle(x1 + 12, y1 + 66, x1 + 535, y1 + 310, 0)
if (!theme) {
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 12, y1 + 66, x1 + 535, y1 + 310, 1)
} else {
    draw_area(x1 + 11, y1 + 65, x1 + 535, y1 + 312)
}
if (draw_button2(x1 + 455, y1 + 34, 80, "Open Folder")) open_url(sounds_directory)
// Tabs
draw_window(x1 + 13 + 194 + 160 + 80, y1 + 67, x1 + 14 + 194 + 160 + 80 + 88, y1 + 67 + 20)
popup_set_window(x1 + 13 + 194 + 160 + 80, y1 + 67, 88, 20, "Whether notes of this type should be\npressed when the marker reaches them.")
draw_text(x1 + 18 + 194 + 160 + 80, y1 + 70, "Press")
draw_window(x1 + 13 + 194 + 160, y1 + 67, x1 + 14 + 194 + 160 + 80, y1 + 67 + 20)
popup_set_window(x1 + 13 + 194 + 160, y1 + 67, 80, 20, "The default key pitch of the sound file.")
draw_text(x1 + 18 + 194 + 160, y1 + 70, "Pitch")
draw_window(x1 + 13 + 194, y1 + 67, x1 + 14 + 194 + 160, y1 + 67 + 20)
popup_set_window(x1 + 13 + 194, y1 + 67, 160, 20, "The sound file of this instrument.")
draw_text(x1 + 18 + 194, y1 + 70, "Sound")
draw_window(x1 + 13, y1 + 67, x1 + 14 + 194, y1 + 67 + 20)
popup_set_window(x1 + 13, y1 + 67, 194, 20, "The name of this instrument.")
draw_text(x1 + 18, y1 + 70, "Name")
if (draw_button2(x1 + 12, y1 + 318, 80, "Import")) load_instruments("")
c = 0
if (draw_button2(x1 + 256, y1 + 318, 80, "Add", user_instruments >= 9) && wmenu = 0) {
    changed = true
    insselect = ds_list_size(instrument_list)
    ds_list_add(instrument_list, new_instrument("Custom instrument #" + string(user_instruments + 1), "", true))
    c = 1
}
var userselect = -1;
if (insselect > -1 && instrument_list[| insselect].user)
    userselect = instrument_list[| insselect]
if (draw_button2(x1 + 340, y1 + 318, 80, "Remove", userselect < 0) && wmenu = 0) {
    changed = 1
    with (userselect) {
        instrument_free()
        ds_list_delete_value(other.instrument_list, userselect)
        instance_destroy()
    }
    insselect = min(ds_list_size(instrument_list) - 1, insselect)
    if (instrument = userselect)
        instrument = instrument_list[| 0]
    user_instruments--
    c = 1
}
if (draw_button2(x1 + 455, y1 + 318, 80, "OK") && wmenu = 0) window = 0
if (mouse_check_button_pressed(mb_left)) {
    insedit = -1
}
if (mouse_check_button_released(mb_left) && c = 0) {
    if (!mouse_rectangle(x1 + 14, y1 + 88, 476, min(ds_list_size(instrument_list) * 20, 220))) insselect = -1
}
// Instruments
for (a = 0; a <= 10; a += 1) {
    b = floor(sb_val[3]) + a
    if (b >= ds_list_size(instrument_list)) break
    var ins = instrument_list[| b];
    if (insselect = b) {
        draw_set_color(10512468)
        draw_rectangle(x1 + 14, y1 + 106 + 20 * a - 20, x1 + 520, y1 + 106 + 20 * a, 0)
    }
    draw_set_color(12632256)
    draw_line(x1 + 14, y1 + 106 + 20 * a, x1 + 520, y1 + 106 + 20 * a)
    draw_set_color(make_color_rgb(120, 120, 120))
    if (ins.user) set_theme_color(false)
    if (insselect = b) draw_set_color(c_white)
    // INS NAME
    ins.name = draw_text_edit(b + 5, ins.name, x1 + 18, y1 + 90 + 20 * a, 178, 20, 1, b < 10)
    // INS SOUND
    draw_set_color(make_color_rgb(120, 120, 120))
    if (ins.user) {set_theme_color(false)}
    if (!ins.loaded) draw_set_color(c_red)
    if (insselect = b) draw_set_color(c_white)
    draw_text(x1 + 18 + 194, y1 + 90 + 20 * a, condstr(ins.filename = "", "None") + ins.filename)
    if (ins.filename = "") popup_set_window(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20, "No sound file has been selected\nfor this instrument.")
    else if (!ins.loaded) popup_set_window(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20, "This sound file could not be found.")
    if (mouse_rectangle(x1 + 14 + 194, y1 + 88 + 20 * a, 160, 20) && insselect = b && wmenu = 0) {
        if (mouse_check_button_pressed(mb_left)) {
            if (ins.user) {
                fn = string(get_open_filename_ext("Supported sounds (*.ogg;*.wav;*.mp3)|*.ogg;*.wav;*.mp3", "", sounds_directory, "Load sound file"))
                if (file_exists_lib(fn)) {
                    var newfn = sounds_directory + filename_name(fn);
                    file_copy_lib(fn, newfn)
                    changed = true
                    with (ins) {
                        filename = filename_name(newfn)
                        if (loaded)
                            instrument_free()
                        instrument_load()
                    }
                }
            } else {
                message("The sound file for this instrument cannot be changed.", "Error")
            }
        }
        if (ins.user) curs = cr_handpoint
    }
    // INS KEY
    draw_set_color(make_color_rgb(120, 120, 120))
    if (ins.user) {set_theme_color(false)}
    if (insselect = b) draw_set_color(c_white)
    if (ins.user) {
        if (draw_abutton(x1 + 18 + 194 + 216, y1 + 88 + 20 * a) && wmenu = 0) {
            var key, oct;
            str = ""
            key = 0
            oct = 0
            str += "Octave 0|\\|"
            while (1) {
                str += check(ins.key = key) + get_keyname(key, 1) + "|"
                key += 1
                if (key = 88) break
                if ((key - 3) mod 12 = 0) {
                    oct += 1
                    str += "/|Octave " + string(oct) + "|\\|"
                }
            }
            str += "/"
            menu = show_menu_ext("instruments_pitch", x1 + 18 + 194 + 155, y1 + 106 + 20 * a, str)
            menu.menub = b
        }
    }
    draw_text(x1 + 18 + 194 + 160, y1 + 90 + 20 * a, get_keyname(ins.key, 1))
    // INS PRESS
    set_theme_color(false)
    if (insselect = b) draw_set_color(c_white)
    draw_text(x1 + 18 + 194 + 160 + 80, y1 + 90 + 20 * a, test(ins.press, "Yes", "No"))
    if (draw_abutton(x1 + 18 + 194 + 175 + 112, y1 + 88 + 20 * a) && wmenu = 0) {
        menu = show_menu_ext("instruments_press", x1 + 18 + 194 + 235, y1 + 106 + 20 * a, check(ins.press) + "Yes|" + check(!ins.press) + "No")
        menu.menub = b
    }
    if (mouse_rectangle(x1 + 14, y1 + 88 + 20 * a, 460, 20) && wmenu = 0) {
        if (mouse_check_button_pressed(mb_left)) {
            insselect = b
        }
    }
}
if (wmenu = 1 && !mouse_check_button(mb_left)) wmenu = 0
draw_set_color(12632256)
draw_line(x1 + 13 + 194, y1 + 87, x1 + 13 + 194, y1 + 86 + 20 * a)
draw_line(x1 + 13 + 194 + 160, y1 + 87, x1 + 13 + 194 + 160, y1 + 86 + 20 * a)
draw_line(x1 + 13 + 194 + 160 + 80, y1 + 87, x1 + 13 + 194 + 160 + 80, y1 + 86 + 20 * a)
draw_scrollbar(insscrollbar, x1 + 14 + 194 + 160 + 80 + 70, y1 + 88, 21, 9, ds_list_size(instrument_list) - 2, 0, 1)
window_set_cursor(curs)
