function menu_click(argument0) {
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
						save_settings()
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
				save_settings()
	        }
	        if (sel = b + 4) save_song(filename)
	        if (sel = b + 5) save_song("")
			if (sel = b + 6) window = w_saveoptions
	        if (sel = b + 7) pattern_import("")
	        if (sel = b + 8) pattern_export("")
	        if (sel = b + 9) open_midi("")
	        if (sel = b + 10) open_schematic("")
	        if (sel = b + 11) window = w_mp3_export
	        if (sel = b + 12) {
	            if (calculate_size()) window = w_schematic_export
	        }
	        if (sel = b + 13) {
	            if (calculate_size()) window = w_branch_export
	        }
			if(sel = b + 14) window = w_datapack_export
	        if (sel = b + 15) game_end()
	        break
	    }
	    case "edit": {
			if ((editmode = m_key) && (sel >= 15)) {
				sel += 2
			}
			var insoffset = ds_list_size(instrument_list) + insmenu - 1
			var ins = sel - 18
			ins -= floor(ins / 26) // subtract the "More..." entries to get the instrument number
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
	        if (sel = 11) mode_action(1)
	        if (sel = 12) mode_action(2)
	        if (sel = 13) mode_action(3)
	        if (sel = 14) mode_action(4)
	        if (sel = 15 && editmode != m_key) mode_action(5)
	        if (sel = 16 && editmode != m_key) mode_action(6)
	        if (sel > 17 && sel < 18 + insoffset) selection_changeins(instrument_list[| ins])
	        if (sel = 18 + insoffset) selection_expand()
	        if (sel = 19 + insoffset) selection_compress()
	        if (sel = 21 + insoffset) window = w_tremolo
	        if (sel = 22 + insoffset) window = w_stereo
			if (sel = 23 + insoffset) window = w_arpeggio
	        if (sel = 24 + insoffset) window = w_portamento
	        if (sel = 25 + insoffset) macro_vibrato()
			if (sel = 26 + insoffset) window = w_stagger
	        if (sel = 27 + insoffset) macro_chorus()
	        if (sel = 28 + insoffset) macro_velocitylfo()
	        if (sel = 29 + insoffset) macro_fadein()
	        if (sel = 30 + insoffset) macro_fadeout()
	        if (sel = 31 + insoffset) macro_replacekey()
	        if (sel = 32 + insoffset) window = w_setvelocity
	        if (sel = 33 + insoffset) window = w_setpanning
	        if (sel = 34 + insoffset) window = w_setpitch
	        if (sel = 35 + insoffset) macro_reset()
	        if (sel = 36 + insoffset) {
	            if (question("Transpose selected notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) selection_transpose()
	        }
	        break
	    }
	    case "editext": {
			if ((editmode = m_key) && (sel >= 15)) {
				sel += 2
			}
			var insoffset = ds_list_size(instrument_list) + insmenu - 1
			var ins = sel - 18
			ins -= floor((ins) / 26) // subtract the "More..." entries to get the instrument number
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
	        if (sel = 11) mode_action(1)
	        if (sel = 12) mode_action(2)
	        if (sel = 13) mode_action(3)
	        if (sel = 14) mode_action(4)
	        if (sel = 15 && editmode != m_key) mode_action(5)
	        if (sel = 16 && editmode != m_key) mode_action(6)
	        if (sel > 17 && sel < 18 + insoffset) selection_changeins(instrument_list[| ins])
	        if (sel = 18 + insoffset) selection_expand()
	        if (sel = 19 + insoffset) selection_compress()
	        if (sel = 21 + insoffset) window = w_tremolo
	        if (sel = 22 + insoffset) window = w_stereo
			if (sel = 23 + insoffset) window = w_arpeggio
	        if (sel = 24 + insoffset) window = w_portamento
	        if (sel = 25 + insoffset) macro_vibrato()
			if (sel = 26 + insoffset) window = w_stagger
	        if (sel = 27 + insoffset) macro_chorus()
	        if (sel = 28 + insoffset) macro_velocitylfo()
	        if (sel = 29 + insoffset) macro_fadein()
	        if (sel = 30 + insoffset) macro_fadeout()
	        if (sel = 31 + insoffset) macro_replacekey()
	        if (sel = 32 + insoffset) window = w_setvelocity
	        if (sel = 33 + insoffset) window = w_setpanning
	        if (sel = 34 + insoffset) window = w_setpitch
	        if (sel = 35 + insoffset) macro_reset()
	        if (sel = 36 + insoffset) {
	            if (question("Transpose selected notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) selection_transpose()
	        }
	        break
	    }
	    case "settings": {
			var insoffset = ds_list_size(instrument_list) + insmenu - 1
			var ins = sel - 1
			ins -= floor((ins) / 26) // subtract the "More..." entries to get the instrument number
	        if (sel < insoffset + 1) instrument = instrument_list[| ins]
	        if (sel = insoffset + 1) window = w_instruments
	        if (sel = insoffset + 2) window = w_songinfoedit
	        if (sel = insoffset + 3) window = w_properties
	        if (sel = insoffset + 4) {selection_place(0) window = w_stats}
	        if (sel = insoffset + 5) window = w_mididevices
	        if (sel = insoffset + 6) window = w_preferences
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
	        if (sel - 3 < 0)
	            mididevice_instrument[obj_menu.mididevice] = sel - 3
	        else
	            mididevice_instrument[obj_menu.mididevice] = instrument_list[| sel - 3]
	        break
	    }
		case "refreshrate": {
			if (sel = 0) game_set_speed(30,gamespeed_fps)
			else if (sel = 1) game_set_speed(60,gamespeed_fps)
			else if (sel = 2) game_set_speed(120,gamespeed_fps)
			else if (sel = 3) game_set_speed(144,gamespeed_fps)
			else if (sel = 4) game_set_speed(114514,gamespeed_fps)
			refreshrate = sel
			break
		}
		case "theme": {
			if (sel = 0) theme = 0
			else if (sel = 2) theme = 1
			else if (sel = 1) theme = 2
			else if (sel = 3) theme = 3
			break
		}
		case "filep": {
	        if (sel = 0) load_song("")
	        for (b = 0; b < 11; b += 1) if (recent_song[b] = "") break
	        for (c = 0; c < b; c += 1) {
	            if (sel = 2 + c && recent_song[c] != "") {
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
						save_settings()
	                } else {
	                    load_song(recent_song[c])
	                }
	            }
	        }
	        if (sel = b + 2) {
	            for (c = 0; c < 11; c += 1) {
	                recent_song[c] = ""
	                recent_song_time[c] = 0
	            }
				save_settings()
	        }
	        if (sel = b + 3) open_midi("")
	        if (sel = b + 4) open_schematic("")
	        if (sel = b + 5) game_end()
	        break
	    }
		case "settingsp": {
	        if (sel = 0) window = w_songinfo
	        if (sel = 1) window = w_stats
	        if (sel = 2) window = w_preferences
	        break
	    }
		case "tempo": {
			if (sel = 0) use_bpm = false
			else if (sel = 1) use_bpm = true
			else if (sel = 2) tempo = 10
			else if (sel = 3) tempo = 12
			else if (sel = 4) tempo = 14
			else if (sel = 5) tempo = 16
			else if (sel = 6) tempo = 18
			else if (sel = 7) tempo = 20
			else if (sel = 8) tempo = 30
			else if (sel = 9) tempo = 60
			else if (sel = 10) window = w_tempotapper

		}
	}
	mouse_clear(mb_left)
	io_clear()



}
