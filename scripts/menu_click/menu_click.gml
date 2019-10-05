// menu_click(sel)
var sel, m, a, b, c, d, e;
sel = argument0
m = menu_shown
menu_shown = ""
window -= w_menu
wmenu = 1
if (window = 0) window = w_releasemouse
if (sel = -1) return 0
switch (m) {
    case "file": {
        if (sel = 0) new_song()
        if (sel = 1) load_song("")
        for (b = 0; b < 11; b += 1) if (recent_song[b] = "") break
        for (c = 0; c < b; c += 1) {
            if (sel = 3 + c && recent_song[c] != "") {
                if (!file_exists_lib(recent_song[c])) {
                    message("Could not find file:\n" + recent_song[c], "Error")
                    for (d = 0; d < 10; d += 1) {
                        if (recent_song[d] = recent_song[c]) {
                            for (e = d; e < 10; e += 1) {
                                recent_song[e] = recent_song[e + 1]
                                recent_song_time[e] = recent_song_time[e + 1]
                            }
                        }
                    }
                    recent_song[10] = ""
                    recent_song_time[10] = 0
                } else {
                    load_song(recent_song[c])
                }
            }
        }
        if (sel = b + 3) {
            for (c = 0; c < 11; c += 1) {
                recent_song[c] = ""
                recent_song_time[c] = 0
            }
        }
        if (sel = b + 4) save_song(filename)
        if (sel = b + 5) save_song("")
        if (sel = b + 7) pattern_export("")
        if (sel = b + 6) pattern_import("")
        if (sel = b + 8) open_midi("")
        if (sel = b + 9) open_schematic("")
        if (sel = b + 10) window = w_mp3_export
        if (sel = b + 11) {
            if (calculate_size()) window = w_schematic_export
        }
		if(sel = b + 12) window = w_datapack_export
        if (sel = b + 13) game_end()
        break
    }
    case "edit": {
        if (sel = 0) action_undo()
        if (sel = 1) action_redo()
        if (sel = 2) action_copy()
        if (sel = 3) action_cut()
        if (sel = 4) action_paste(starta, startb)
        if (sel = 5) action_delete()
        if (sel = 6) select_all(-1, 0)
        if (sel = 7) selection_place(0)
        if (sel = 8) selection_invert()
        if (sel = 9) select_all(instrument, 0)
        if (sel = 10) select_all(instrument, 1)
        if (sel = 11) selection_changekey(12)
        if (sel = 12) selection_changekey(-12)
        if (sel = 13) selection_changekey(1)
        if (sel = 14) selection_changekey(-1)
        if (sel = 15) selection_changepit(10)
        if (sel = 16) selection_changepit(-10)
        if (sel > 17 && sel < 18 + ds_list_size(instrument_list)) selection_changeins(instrument_list[| sel - 18])
        if (sel = 18 + ds_list_size(instrument_list)) selection_expand()
        if (sel = 19 + ds_list_size(instrument_list)) selection_compress()
        if (sel = 21 + ds_list_size(instrument_list)) window = w_tremolo
        if (sel = 22 + ds_list_size(instrument_list)) window = w_stereosize
		if (sel = 23 + ds_list_size(instrument_list)) window = w_arpeggio
		if (sel = 24 + ds_list_size(instrument_list)) window = w_stagger
        if (sel = 25 + ds_list_size(instrument_list)) macro_chorus()
		if (sel = 26 + ds_list_size(instrument_list)) macro_glissando_up()
		if (sel = 27 + ds_list_size(instrument_list)) macro_glissando_down()
        if (sel = 28 + ds_list_size(instrument_list)) macro_volumelfo()
        if (sel = 29 + ds_list_size(instrument_list)) macro_vibrato()
        if (sel = 30 + ds_list_size(instrument_list)) window = w_portamento
        if (sel = 31 + ds_list_size(instrument_list)) macro_fadein()
        if (sel = 32 + ds_list_size(instrument_list)) macro_fadeout()
        if (sel = 33 + ds_list_size(instrument_list)) macro_replacekey()
        if (sel = 34 + ds_list_size(instrument_list)) macro_reset()
        if (sel = 35 + ds_list_size(instrument_list)) {
            if (question("Transpose selected notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) selection_transpose()
        }
        break
    }
    case "editext": {
        if (sel = 0) action_copy()
        if (sel = 1) action_cut()
        if (sel = 2) action_paste(obj_menu.pastex, obj_menu.pastey)
        if (sel = 3) action_delete()
        if (sel = 4) select_all(-1, 0)
        if (sel = 5) selection_place(0)
        if (sel = 6) selection_invert()
        if (sel = 7) {
            selection_place(0)
            selection_add(obj_menu.menuc + 1, 0, enda, endb, 0, 0)
        }
        if (sel = 8) {
            selection_place(0)
            selection_add(0, 0, obj_menu.menuc, endb, 0, 0)
        }
        if (sel = 9) select_all(instrument, 0)
        if (sel = 10) select_all(instrument, 1)
        if (sel = 11) selection_changekey(12)
        if (sel = 12) selection_changekey(-12)
        if (sel = 13) selection_changekey(1)
        if (sel = 14) selection_changekey(-1)
        if (sel = 15) selection_changepit(10)
        if (sel = 16) selection_changepit(-10)
        if (sel > 17 && sel < 18 + ds_list_size(instrument_list)) selection_changeins(instrument_list[| sel - 18])
        if (sel = 18 + ds_list_size(instrument_list)) selection_expand()
        if (sel = 19 + ds_list_size(instrument_list)) selection_compress()
        if (sel = 21 + ds_list_size(instrument_list)) window = w_tremolo
        if (sel = 22 + ds_list_size(instrument_list)) window = w_stereosize
		if (sel = 23 + ds_list_size(instrument_list)) window = w_arpeggio
		if (sel = 24 + ds_list_size(instrument_list)) window = w_stagger
        if (sel = 25 + ds_list_size(instrument_list)) macro_chorus()
		if (sel = 26 + ds_list_size(instrument_list)) macro_glissando_up()
		if (sel = 27 + ds_list_size(instrument_list)) macro_glissando_down()
        if (sel = 28 + ds_list_size(instrument_list)) macro_volumelfo()
        if (sel = 29 + ds_list_size(instrument_list)) macro_vibrato()
        if (sel = 30 + ds_list_size(instrument_list)) window = w_portamento
        if (sel = 31 + ds_list_size(instrument_list)) macro_fadein()
        if (sel = 32 + ds_list_size(instrument_list)) macro_fadeout()
        if (sel = 33 + ds_list_size(instrument_list)) macro_replacekey()
        if (sel = 34 + ds_list_size(instrument_list)) macro_reset()
        if (sel = 35 + ds_list_size(instrument_list)) {
            if (question("Transpose selected notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) selection_transpose()
        }
        break
    }
    case "settings": {
        b = ds_list_size(instrument_list)
        for (a = 0; a < b; a += 1) {
            if (sel = a + 1) instrument = instrument_list[| a]
        }
        if (sel = b + 1) window = w_instruments
        if (sel = b + 2) window = w_songinfoedit
        if (sel = b + 3) window = w_properties
        if (sel = b + 4) {selection_place(0) window = w_stats}
        if (sel = b + 5) window = w_mididevices
        if (sel = b + 6) window = w_preferences
        break
    }
    case "help": {
        if (sel = 1) open_url("http://www.youtube.com/watch?v=2oD9Bw_Qau4")
        if (sel = 2) open_url("http://www.youtube.com/watch?v=NIxNTK6nfJI")
        if (sel = 3) open_url("http://www.youtube.com/watch?v=JMPkf7bS8lQ")
        if (sel = 4) open_url("http://www.youtube.com/watch?v=Cg6dAcEjTs0")
        if (sel = 5) open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
        if (sel = 6) open_url(link_topic)
        if (sel = 7) open_url("http://minecraft.gamepedia.com/Programs_and_editors/Minecraft_Note_Block_Studio")
        if (sel = 8) window = w_changelist
        if (sel = 9) window = w_about
        if (sel = 10) open_url("https://github.com/HielkeMinecraft/OpenNoteBlockStudio")
        break
    }
    case "section": {
        if (sel = 0) {
            section_exists = 0
            section_start = 0
            section_end = 0
        }
        if (sel = 1) {
            starta = section_start
            sb_val[0] = starta
        }
        if (sel = 2) {
            starta = section_end - 1
            sb_val[0] = starta
        }
        if (sel = 3) selection_add(section_start, 0, section_end - 1, endb, 0, 0)
        if (sel = 4) marker_start=!marker_start
        if (sel = 5) marker_end=!marker_end
        break
    }
    case "schexport_insblock": {
        var str, block, data;
        str = obj_menu.item_shortcut[obj_menu.selmenu, obj_menu.selitem]
        block = real(string_copy(str, 1, string_pos(", ", str) - 1))
        data = real(string_delete(str, 1, string_pos(", ", str)))
        sch_exp_ins_block[obj_menu.menub] = block
        sch_exp_ins_data[obj_menu.menub] = data
        break
    }
    case "schexport_block": {
        var str, block, data;
        str = obj_menu.item_shortcut[obj_menu.selmenu, obj_menu.selitem]
        block = real(string_copy(str, 1, string_pos(", ", str) - 1))
        data = real(string_delete(str, 1, string_pos(", ", str)))
        if (obj_menu.menua = 0) {
            sch_exp_walkway_block = block
            sch_exp_walkway_data = data
        } else if (obj_menu.menua = 1) {
            sch_exp_circuit_block = block
            sch_exp_circuit_data = data
        } else if (obj_menu.menua = 2) {
            sch_exp_ground_block = block
            sch_exp_ground_data = data
        }
        break
    }
    case "midiimport_ins": {
        midi_channelins[obj_menu.menub] = sel - 1
        break
    }
    case "midiimport_octave": {
        midi_channeloctave[obj_menu.menub] = sel - 3
        break
    }
    case "midiimport_percins": {
        midi_percins[obj_menu.menub] = sel - 1
        break
    }
    case "midiimport_percpitch": {
        midi_percpitch[obj_menu.menub] = sel - floor((sel + 9) / 13) - 1
        break
    }
    case "instruments_press": {
        instrument_list[| obj_menu.menub].press = !sel
        break
    }
    case "instruments_pitch": {
        instrument_list[| obj_menu.menub].key = sel - floor((sel + 9) / 13) - 1
        break
    }
    case "mididevices_ins": {
        if (sel - 1 < 0)
            mididevice_instrument[obj_menu.mididevice] = -1
        else
            mididevice_instrument[obj_menu.mididevice] = instrument_list[| sel - 1]
        break
    }
}
mouse_clear(mb_left)
io_clear()
