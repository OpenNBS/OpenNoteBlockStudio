function control_draw() {
	// control_draw()
	var a, b, c, d, e, f, g, p, l, s, exist, str, str2, m, xx, x1, y1, x2, y2, iconcolor, showmenu, totalcols, totalrows, compx, prev, colr;

	var targetspeed = 1000000 / room_speed
	currspeed = targetspeed / delta_time
	
	rw = floor(window_width * (1 / window_scale))
	rh = floor(window_height * (1 / window_scale))
	
	// Update window scale
	if (window_scale != prev_scale) {
		camera_set_view_size(cam_window, rw, rh)
	}
	prev_scale = window_scale
	
	if (channelstoggle) channels = 32768
	else channels = 256
	
	curs = cr_default
	showmenu = 0
	cursmarker = 0
	compx = 180
	window_set_caption(condstr((filename = "" || filename = "-player") && (midiname = "" || !isplayer), "Unsaved song") + condstr(filename != "-player", filename_name(filename)) + condstr((filename = "" || filename = "-player") && midiname != "" && isplayer, midiname) + condstr(changed && filename != "" && filename != "-player", "*") + " - Minecraft Note Block Studio" + condstr(isplayer, " - Player Mode"))
	// Performance indicator: "(" + string_format(currspeed * 100, 1, 0) + "%) "
	draw_set_alpha(1)
	draw_theme_color()
	draw_theme_font(font_main)
	editline += 1
	if refreshrate = 1 game_set_speed(60,gamespeed_fps)
	if refreshrate = 2 game_set_speed(120,gamespeed_fps)
	if refreshrate = 3 game_set_speed(144,gamespeed_fps)
	if refreshrate = 4 game_set_speed(114514,gamespeed_fps)
	if (editline > 60) editline = 0
	if (delay > 0) delay -= 1 / (room_speed / 20)
	if (delay < 0) delay = 0
	work_mins += 1 / (room_speed * 60)
	
	file_dnd_set_files("*.nbs", 1, 0, 0)
	dndfile = file_dnd_get_files()

	remove_emitters()

	if (selected = 0) {
		if (block_outside = 0 && block_custom = 0) {
			if ((tempo = 10 || tempo = 5 || tempo = 2.5) && block_pitched = 0) compatible = 1
			else compatible = 2
		} else compatible = 0
	}

	sela = -1
	selb = -1
	selbx = -1
	selby = -1
	if (window = 0) {
	    if (mouse_check_button_pressed(mb_left)) {
	        work_left += 1
	        key_edit = -1
	    }
	    if (mouse_check_button_pressed(mb_right)) work_right += 1
	}

	if (key_edit > -1) {
	    if (!show_keyboard) key_edit = -1
	    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_escape)) {
	        piano_key[key_edit] = 0
	        key_edit = -1
			save_settings()
	    } else if (keyboard_check_pressed(vk_anykey)) {
	        piano_key[key_edit] = keyboard_lastkey
	        key_edit = -1
			save_settings()
	    }
	}

	if (!isplayer) {
	// Autosave
	if (autosave && filename_ext(filename) = ".nbs") {
	    tonextsave -= 1 / room_speed / 60
	    if (tonextsave <= 0 && playing == 0) save_song(filename)
	}

	// Auto-recovery
	if (totalblocks > 0) {
		tonextbackup -= 1 / room_speed / 60
		if (tonextbackup <= 0 && playing == 0) {
			save_song(backup_file, true)
			tonextbackup = backupmins
		}
	}

	// Toggle blackout mode
	if (keyboard_check_pressed(vk_f10)) {
		blackout = !blackout
		if (blackout) set_msg("Blackout mode => ON")
		else set_msg("Blackout mode => OFF")
	}
	// Toggle fullscreen
	if (keyboard_check_pressed(vk_f11)) {
		fullscreen = !fullscreen
		if (fullscreen) set_msg("Fullscreen => ON")
		else set_msg("Fullscreen => OFF")
	}
	}

	if (theme = 0) window_background = 15790320
	if (theme = 1) window_background = 13160660
	if (theme = 2) window_background = c_dark
	// if (theme = 3) window_background = c_white
	if (theme = 3) window_background = 15987699
	if (theme = 3 && fdark) window_background = 2105376
	draw_clear(window_background)

	iconcolor = c_black
	if (theme = 2 || (theme = 3)) iconcolor = c_white

	// Calculate area
	if (!fullscreen && show_layers) {
		totalcols = floor((rw - 8 - 270) / 32)
	} else {
		totalcols = floor(rw / 32) + 1
	}
	rhval = 270
	if (!show_piano) {
		rhval = 130
	}
	if (fullscreen) {
		rhval = 32
	}
	totalrows = floor((rh - rhval) / 32)
	if (fullscreen) totalrows += 1
	if (min(keysmax, floor((rw - 32) / 39)) != keysshow) {
	    startkey = 27 - floor(min(keysmax, floor((rw - 32) / 39)) / 2)
	    sharpkeys = 0
	    for (a = 0; a < startkey; a += 1) {
	        b = a mod 7
	        if (b != 1 && b != 4) sharpkeys += 1
	    }
	}
	keysshow = min(keysmax, floor((rw - 32) / 39))
	x1 = -2
	if (!fullscreen && show_layers) {
		x1 = 264
	}
	if (fullscreen) {
		y1 = -2
	} else {
		y1 = 52
	}
	if ((window = 0 || select > 0) && playing = 0 && !isplayer) {
	    if (mouse_rectangle(x1 + 2, y1 + 34, totalcols * 32, totalrows * 32) || select > 0) {
	        sela = floor((mouse_x - (x1 + 2)) / 32)
	        selb = floor((mouse_y - (y1 + 34)) / 32)
	        curs = cr_handpoint
        
	    }
	    if (mouse_rectangle(x1 + 2 + floor(marker_pos * 32 - starta * 32) - 8, y1, 16, totalrows * 32 + 32) && mouse_rectangle(x1 + 2, y1 + 2, totalcols * 32, totalrows * 32 + 64) && select = 0 && window = 0) {
	        cursmarker = 1
	        curs = cr_size_we
	        if (mouse_check_button(mb_left)) {
	            window = w_dragmarker
	        }
	    }
	    if (section_exists) {
	        if (mouse_rectangle(x1 + 2 + floor(section_start * 32 - starta * 32) - 8, y1, 16, totalrows * 32 + 32) && select = 0 && window = 0 && cursmarker = 0) {
	            cursmarker = 1
	            curs = cr_size_we
	            if (mouse_check_button(mb_left)) {
	                window = w_dragsection_start
	            }
	        }
	        if (mouse_rectangle(x1 + 2 + floor(section_end * 32 - starta * 32) - 8, y1, 16, totalrows * 32 + 32) && select = 0 && window = 0 && cursmarker = 0) {
	            cursmarker = 1
	            curs = cr_size_we
	            if (mouse_check_button(mb_left)) {
	                window = w_dragsection_end
	            }
	        }
	    }
	    if (mouse_rectangle(x1 + 2, y1 + 2, totalcols * 32, 32) && window = 0) {
	        if (select = 0 && playing = 0 && mouse_check_button_pressed(mb_right)) {
	            show_menu_ext("section", mouse_x, mouse_y, inactive(!section_exists) + "Remove section|"+
	                                                inactive(!section_exists || section_start > enda) + "Jump to beginning of section|"+
	                                                inactive(!section_exists || section_end > enda) + "Jump to ending of section|-|"+
	                                                inactive(!section_exists) + "Select all blocks in section|-|"+
	                                                check(marker_start) + "Start playing in section|"+
	                                                check(marker_end) + "Stop playing after section")
	        }
	        if (mouse_check_button_pressed(mb_left)) {
	            timeline_pressa = starta + floor((mouse_x - (x1 + 2)) / 32)
	        }
	        if (mouse_check_button_released(mb_left)) {
	            marker_pos = starta + (mouse_x - (x1 + 2)) / 32
	        }
	        if (mouse_check_button(mb_left)) {
	            if (starta + floor((mouse_x - (x1 + 2)) / 32)<>timeline_pressa && timeline_pressa > -1) {
	                window = w_dragsection_end
	                section_exists = 1
	                section_end = starta + floor((mouse_x - (x1 + 2)) / 32)
	                section_start = timeline_pressa
	                timeline_pressa = -1
	            }
	        }
	    }
	}
	exist = 0
	if (((sela > -1 && selb > -1) || select > 0) && !isplayer) {
	    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right) || mouse_check_button_pressed(mb_middle)) clickinarea = 1
	    selbx = starta + sela
	    selby = startb + selb
	    if (select = 0 && selected = 0 && selbx < arraylength && selby < arrayheight) {
	        exist = song_exists[selbx, selby]
	        if (exist && cursmarker = 0) {
	            if (changepitch && (mouse_wheel_up() || mouse_wheel_down())) {
					var diff = mouse_wheel_up() - mouse_wheel_down()
					// If shift is not pressed, do increments of a single key or 10 steps at once.
					if (!keyboard_check(vk_shift) && (editmode != m_key)) {
						diff *= 10
					}
					// If shift is pressed, do increments of a whole octave or fine-tune increments to one step
					if (keyboard_check(vk_shift) && (editmode = m_key)) {
						diff *= 12
					}
					var key = song_key[selbx, selby]
					var vel = song_vel[selbx, selby]
					var pan = song_pan[selbx, selby]
					var pit = song_pit[selbx, selby]
					if (editmode = m_key) {
						key = median(0, key + diff, 87)
					} else if (editmode = m_vel) {
						vel = median(0, vel + diff, 100)
					} else if (editmode = m_pan) {
						pan = median(0, pan + diff, 200)
					} else if (editmode = m_pit) {
						pit += diff
					}
					change_block_manual(selbx, selby, song_ins[selbx, selby], key, vel, pan, pit)
	            }
	        }
	    }
	}
	if (mousewheel = 1 && window = 0 && (exist = 0 || changepitch = 0) && !isplayer) {
	    var insindex = ds_list_find_index(instrument_list, instrument)
	    if (mouse_wheel_down() && insindex > 0) {
	        insindex--
	        instrument = instrument_list[| insindex]
	        play_sound(instrument, selected_key, 100 ,100, 0)
	    }
	    if (mouse_wheel_up() && insindex < ds_list_size(instrument_list) - 1) {
	        insindex++
	        instrument = instrument_list[| insindex]
	        play_sound(instrument, selected_key, 100 ,100, 0)
	    }
	}
	if (mousewheel = 2 && window = 0 && (exist = 0 || changepitch = 0) && !isplayer) {
	    if (mouse_wheel_down() && selected_key > 0) {
	        selected_key -= 1
	        play_sound(instrument, selected_key, 100 ,100, 0)
	    }
	    if (mouse_wheel_up() && selected_key < 87) {
	        selected_key += 1
	        play_sound(instrument, selected_key, 100 ,100, 0)
	    }
	}

	// Draw note blocks
	draw_set_halign(fa_center)
	for (b = 0; b <= totalrows; b += 1) {
	    lockedlayer[startb + b] = 0
	    if (solostr != "") {
	        if (string_count("|" + string(startb + b) + "|", solostr) = 0) {
	            lockedlayer[startb + b] = 1
	        } else if (layerlock[startb + b] = 1) {
	            lockedlayer[startb + b] = 1
	        }
	    } else if (startb + b < endb2) {
	        if (layerlock[startb + b] = 1) {
	            lockedlayer[startb + b] = 1
	        }
	    }
	}
	if (!isplayer) {
	if (blackout) {
		draw_set_color(c_black)
		draw_rectangle(x1 + 2, y1 + 34, x1 + 2 + 32 * totalcols, y1 + 34 + 32 * totalrows, false)
	}
	if (theme = 3 && !blackout) {
		draw_set_color(16382457)
		if (fdark) draw_set_color(2565927)
		draw_rectangle(x1 + 2, y1 + 34, x1 + 2 + 32 * totalcols, y1 + 34 + 32 * totalrows, false)
	}
	}
	for (a = 0; a < totalcols; a += 1) {
		if (!blackout) {
			if ((starta + a) mod (timesignature * 4) == 0) {
				draw_set_alpha(0.3)
				if (window_scale < 1) draw_set_alpha(0.6) //Issue #254, make the lines more obvious when scaled down
				if (!isplayer) draw_rectangle(x1 + 2 + 32 * a, y1 + 34, (x1 + 2 + 32 * a) + 1, y1 + 34 + totalrows * 32, false)
			} else {
				draw_set_alpha(0.1)
				if ((starta + a) mod 4 == 0) draw_set_alpha(0.25)
				if (!isplayer) draw_line(x1 + 2 + 32 * a, y1 + 34, x1 + 2 + 32 * a, y1 + 34 + totalrows * 32)
			}
		}
	    for (b = 0; b < totalrows; b += 1) {
	        if (starta + a <= enda) {
	            if (startb + b <= endb) {
	                if (colamount[starta + a] > 0) {
	                    if (startb + b >= colfirst[starta + a] && startb + b <= collast[starta + a]) {
	                        if (song_exists[starta + a, startb + b]) {
	                            s = 0 // Selected
	                            if (fade=0) c = 0.5 * (song_vel[starta + a, startb + b] / 100) + 0.25
								else c = 1
	                            if (lockedlayer[startb + b] = 0) c += 0.5 * (1 - (min(1000, current_time - song_played[starta + a, startb + b]) / 1000))
	                            if (playing = 0) {
	                                if (select = 1 && lockedlayer[startb + b] = 0) {
	                                    s = (starta + a >= min(select_pressa, selbx) && starta + a <= max(select_pressa, selbx) && startb + b >= min(select_pressb, selby) && startb + b <= max(select_pressb, selby))
	                                }
	                                if (fade=0) c += ((selbx = starta + a && selby = startb + b && select = 0 && window = 0  && cursmarker = 0) || s) * 0.5
	                            }
	                            if (!isplayer) draw_block(x1 + 2 + 32 * a, y1 + 34 + 32 * b, song_ins[starta + a, startb + b], song_key[starta + a, startb + b], song_pan[starta + a, startb + b], song_vel[starta + a, startb + b], song_pit[starta + a, startb + b], c, s * 0.8)
	                        }
	                    }
	                } else {
	                    break
	                }
	            } else {
	                break
	            }
	        } else {
	            break
	        }
	    }
	    draw_theme_color()
	}
	draw_set_alpha(1)
	draw_set_halign(fa_left)

	// Play column
	if (floor(marker_pos) != floor(marker_prevpos) && floor(marker_pos) <= enda && (floor(marker_pos) != section_end || window = w_dragmarker || forward<>0 || marker_end = 0 || marker_prevpos >= section_end)) {
	    var diff = floor(marker_pos) - floor(marker_prevpos)
	    var start
	    if (diff < 0 || diff > 3) {
	        start = floor(marker_pos)
	    } else {
	        start = floor(marker_prevpos) + 1
	    }
	    for (i = start; i <= floor(marker_pos); i++) {
	        xx = i
		    if (colamount[xx] > 0) {
		        for (b = colfirst[xx]; b <= collast[xx]; b += 1) {
		            if (song_exists[xx, b]) {
		                a = 1
		                if (b < endb2) {
							c = (layervol[b] /100) * song_vel[xx, b]
							if layerstereo[b] = 100 {
								d = song_pan[xx, b]
							} else { 
								d = (layerstereo[b] + song_pan[xx, b]) / 2
							}
							e = song_pit[xx, b]
						}
		                if (solostr != "") {
		                    if (string_count("|" + string(b) + "|", solostr) = 0) {
		                        a = 0
		                    } else if (layerlock[b] = 1) {
		                        a = 0
		                    }
		                } else if (b < endb2) {
		                    if (layerlock[b] = 1) {
		                        a = 0
		                    }
		                }
		                if (record = 1 && playing = 1) {
		                    if (current_time - song_added[xx, b] < 1000) a = 0
		                }
		                if (a) {
		                    if (song_ins[xx, b].loaded) play_sound(song_ins[xx, b], song_key[xx, b], c , d, e)
							if (instrument_list[| ds_list_find_index(instrument_list, song_ins[xx, b])].name = "Tempo Changer") tempo = floor(abs(e)) / 15
		                    if (song_ins[xx, b].press) key_played[song_key[xx, b]] = current_time
		                    song_played[xx, b] = current_time
		                }
		            }
		        }
		    }
		}
	}
	if (window = w_dragselection) {
	    selection_x = starta + floor((mouse_x - (x1 + 2)) / 32) - select_pressa
	    selection_y = startb + floor((mouse_y - (y1 + 34)) / 32) - select_pressb
	    curs = cr_size_all
	}

	// Draw selection
	if (selected > 0) selection_draw(x1 + 2, y1 + 34, totalcols, totalrows)
	marker_prevpos = marker_pos
	if (window = w_dragselection) {
	    if (!mouse_check_button(mb_left)) {
	        selection_x = max(0, selection_x)
	        selection_y = max(0, selection_y)
	        history_set(h_selectmove, selection_x, selection_y, selection_sx, selection_sy)
	        window = w_releasemouse
	    }
	}
	if (!isplayer) {

	// Draw locked layers
	for (b = 0; b < totalrows; b += 1) {
	    if (lockedlayer[startb + b]) draw_sprite_ext(spr_lock, 0, x1 + 2, y1 + 34 + b * 32, totalcols, 1, 0, -1, 0.25)
	}

	// Controls
	if (sela > -1 && selb > -1 && window = 0 && cursmarker = 0 && clickinarea = 1) {
	    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
	        if (mouse_check_button_pressed(mb_left) && !keyboard_check(vk_control) && selected > 0) {
	            selection_place(0)
	            dontplace = 1
	        }
			if (mouse_check_button_pressed(mb_left) && keyboard_check(vk_control)) {selection_add(starta + sela, startb + selb, starta + sela, startb + selb, 0, 0)}
	        select_pressx = mouse_x
	        select_pressy = mouse_y
	        select_pressa = starta + sela
	        select_pressb = startb + selb
	    }
	    if (mouse_check_button(mb_left)) {
	        if ((starta + sela != select_pressa || startb + selb != select_pressb) && select_pressx != -1) {
	            select = 1
	        }
	    }
	    if (mouse_check_button_released(mb_left)) {
	        if (selected = 0) {
	            if (dontplace = 0) {
	                if (exist = 1) {
	                    change_block_manual(selbx, selby, instrument, selected_key, 100, 100, 0)
	                } else {
	                    add_block_manual(starta + sela, startb + selb, instrument, selected_key, 100, 100, 0)
	                    draw_set_halign(fa_center)
	                    draw_block(x1 + 2 + 32 * sela, y1 + 34 + 32 * selb, instrument, selected_key, 100, 100, 0, 0.5, 0)    
						draw_theme_color()
	                    draw_set_halign(fa_left)
	                    draw_set_alpha(1)
	                }
	            }
	        } else {
	            if (select = 0 && !keyboard_check(vk_control)) selection_place(0)
	        }
	        dontplace = 0
	    }
		if (mouse_check_button_pressed(mb_middle)) {
			if (exist = 1) {
				selected_key = song_key[selbx, selby]
				instrument = song_ins[selbx, selby]
				play_sound(instrument, selected_key, 100, 100, 0)
			}
				
		}
		if (mouse_check_button_pressed(mb_right) && keyboard_check(vk_control)) {selection_remove(starta + sela, startb + selb, starta + sela, startb + selb, 0, 0)}
	    if (mouse_check_button(mb_right) && !keyboard_check(vk_control)) {
	        if ((starta + sela != select_pressa || startb + selb != select_pressb) && select_pressx != -1) {
	            select = 2
	        } else if (exist = 1) {
	            remove_block_manual(selbx, selby)
	            select_pressx = -1
	        }
	    }
	    if (mouse_check_button_released(mb_right)) {
	        if (starta + sela = select_pressa && startb + selb = select_pressb && select_pressx != -1 && !keyboard_check(vk_control)) {
	            str = ""
	            customstr = ""
				insmenu = 1
	            for (a = 0; a < ds_list_size(instrument_list); a += 1) {
	                var ins = instrument_list[| a];
	                if (ins.user)
	                    customstr += "...to " + clean(ins.name) + "|"
	                else
	                    str += "...to " + clean(ins.name) + "|"
					if (a % 25 == 0 && a > 1 && a < ds_list_size(instrument_list) - 1) {
						customstr += "-|More...|\\|"
						insmenu++
					}
				}
	            menu = show_menu_ext("editext", mouse_x, mouse_y, inactive(selected = 0) + icon(icons.COPY - (selected = 0)) + "Ctrl+C$Copy|"+
	                                      inactive(selected = 0) + icon(icons.CUT - (selected = 0)) + "Ctrl+X$Cut|"+
	                                      inactive(selection_copied = "") + icon(icons.PASTE - (selection_copied = "")) + "Ctrl+V$Paste|"+
	                                      inactive(selected = 0) + icon(icons.DELETE - (selected = 0)) + "Delete$Delete|-|"+
	                                      inactive(totalblocks = 0) + "Ctrl+A$Select all|"+
	                                      inactive(selected = 0) + "Deselect all|"+
	                                      inactive(selected = 0 && totalblocks = 0) + "Ctrl+I$Invert selection|-|"+
	                                      inactive(totalblocks = 0 || selbx >= enda) + "Select all to the right ->|"+
	                                      inactive(totalblocks = 0 || selbx <= 0) + "Select all to the left <-|-|"+
	                                      inactive(instrument.num_blocks = 0) + "Select all " + clean(instrument.name) + "|"+
	                                      inactive(instrument.num_blocks = totalblocks) + "Select all but " + clean(instrument.name) + "|-|"+
	                                        inactive(selected = 0) + "Ctrl+E$" + get_mode_actions(1) + "|"+
	                                        inactive(selected = 0) + "Ctrl+D$" + get_mode_actions(2) + "|"+
	                                        inactive(selected = 0) + "Ctrl+R$" + get_mode_actions(3) + "|"+
	                                        inactive(selected = 0) + "Ctrl+F$" + get_mode_actions(4) + "|"+
											condstr((editmode != m_key), inactive(selected = 0) + "Ctrl+T$" + get_mode_actions(5) + "|") +
											condstr((editmode != m_key), inactive(selected = 0) + "Ctrl+G$" + get_mode_actions(6) + "|") +
	                                        inactive(selected = 0) + "Change instrument...|\\|" + str + condstr(customstr != "", "-|")  + customstr + string_repeat("/|", insmenu) + "-|" +
	                                        inactive(selected = 0 || selection_l = 0) + "Expand selection|"+
	                                        inactive(selected = 0 || selection_l = 0) + "Compress selection|"+
	                                        inactive(selected = 0 || selection_l = 0) + "Macros...|\\||"+
											"Ctrl+Shift+A$Tremolo...|"+
											"Ctrl+Shift+S$Stereo...|"+
											"Ctrl+Shift+D$Arpeggio...|"+
											"Ctrl+Shift+F$Portamento...|"+
											"Ctrl+Shift+G$Vibrato|"+
											"Ctrl+Shift+H$Stagger...|"+
											"Ctrl+Shift+J$Chorus|"+
											"Ctrl+Shift+K$Volume LFO|"+
											"Ctrl+Shift+Q$Fade in|"+
											"Ctrl+Shift+W$Fade out|"+
											"Ctrl+Shift+E$Replace key|"+
											"Ctrl+Shift+R$Set velocity...|"+
											"Ctrl+Shift+T$Set panning...|"+
											"Ctrl+Shift+Y$Set pitch...|"+
											"Ctrl+Shift+U$Reset all properties|"+
											"/|-|"+
	                                        inactive(selected = 0) + "Transpose notes outside octave range|")
	            menu.menuc = selbx
	            menu.pastex = selbx
	            menu.pastey = selby
	        }
	    }
	}
	}
	// Keyboard shortcuts
	if (window = 0 && text_focus = -1) {
	    if (playing = 0) {
	        if (keyboard_check(vk_control) && !keyboard_check(vk_shift)) {
	            if (keyboard_check_pressed(ord("N")) && !isplayer) new_song()
	            if (keyboard_check_pressed(ord("O"))) load_song("")
	            if (keyboard_check_pressed(ord("S")) && !isplayer) save_song(filename)
	            if (keyboard_check_pressed(ord("A")) && !isplayer) select_all(-1, 0)
	            if (keyboard_check_pressed(ord("A")) && keyboard_check(vk_shift) && !isplayer) selection_place(0)
	            if (keyboard_check_pressed(ord("I")) && !isplayer) selection_invert()
	            if (keyboard_check_pressed(ord("C")) && !isplayer) action_copy()
	            if (keyboard_check_pressed(ord("X")) && !isplayer) action_cut()
	            if (keyboard_check_pressed(ord("V")) && !isplayer) {
	                if (selbx > -1 && selby > -1) action_paste(selbx, selby)
	                else action_paste(starta, startb)
	            }
	            if (keyboard_check_pressed(ord("Z")) && !isplayer) action_undo()
	            if (keyboard_check_pressed(ord("Y")) && !isplayer) action_redo()
	            if (keyboard_check_pressed(ord("E")) && !isplayer) mode_action(1)
	            if (keyboard_check_pressed(ord("D")) && !isplayer) mode_action(2)
	            if (keyboard_check_pressed(ord("R")) && !isplayer) mode_action(3)
	            if (keyboard_check_pressed(ord("F")) && !isplayer) mode_action(4)
	            if ((editmode != m_key) && (keyboard_check_pressed(ord("T"))) && !isplayer) mode_action(5)
	            if ((editmode != m_key) && (keyboard_check_pressed(ord("G"))) && !isplayer) mode_action(6)
	            if (keyboard_check_pressed(ord("P"))) window = w_preferences
	            if (keyboard_check_pressed(187)) {
					if (window_scale >= 0.5 && window_scale < 0.67) {window_scale = 0.67 set_msg("Window Scale => 67%")}
					else if (window_scale < 0.75) {window_scale = 0.75 set_msg("Window Scale => 75%")}
					else if (window_scale < 0.8) {window_scale = 0.8 set_msg("Window Scale => 80%")}
					else if (window_scale < 0.9) {window_scale = 0.9 set_msg("Window Scale => 90%")}
					else if (window_scale < 1) {window_scale = 1 set_msg("Window Scale => 100%")}
					else if (window_scale < 1.25) {window_scale = 1.25 set_msg("Window Scale => 125%")}
					else if (window_scale < 1.5) {window_scale = 1.5 set_msg("Window Scale => 150%")}
					else if (window_scale < 1.75) {window_scale = 1.75 set_msg("Window Scale => 175%")}
					else if (window_scale < 2) {window_scale = 2 set_msg("Window Scale => 200%")}
					else if (window_scale < 2.5) {window_scale = 2.5 set_msg("Window Scale => 250%")}
					else if (window_scale < 3) {window_scale = 3 set_msg("Window Scale => 300%")}
					else if (window_scale < 3.5) {window_scale = 3.5 set_msg("Window Scale => 350%")}
					else if (window_scale < 4) {window_scale = 4 set_msg("Window Scale => 400%")}
				}
	            if (keyboard_check_pressed(189)) {
					if (window_scale <= 4 && window_scale > 3.5) {window_scale = 3.5 set_msg("Window Scale => 350%")}
					else if (window_scale > 3) {window_scale = 3 set_msg("Window Scale => 300%")}
					else if (window_scale > 2.5) {window_scale = 2.5 set_msg("Window Scale => 250%")}
					else if (window_scale > 2) {window_scale = 2 set_msg("Window Scale => 200%")}
					else if (window_scale > 1.75) {window_scale = 1.75 set_msg("Window Scale => 175%")}
					else if (window_scale > 1.5) {window_scale = 1.5 set_msg("Window Scale => 150%")}
					else if (window_scale > 1.25) {window_scale = 1.25 set_msg("Window Scale => 125%")}
					else if (window_scale > 1) {window_scale = 1 set_msg("Window Scale => 100%")}
					else if (window_scale > 0.9) {window_scale = 0.9 set_msg("Window Scale => 90%")}
					else if (window_scale > 0.8) {window_scale = 0.8 set_msg("Window Scale => 80%")}
					else if (window_scale > 0.75) {window_scale = 0.75 set_msg("Window Scale => 75%")}
					else if (window_scale > 0.67) {window_scale = 0.67 set_msg("Window Scale => 67%")}
					else if (window_scale > 0.5) {window_scale = 0.5 set_msg("Window Scale => 50%")}
				}
	        }
	        if (keyboard_check_pressed(vk_delete) && selected > 0 && !isplayer) {
				selection_delete(0)
				changed = 1
			}
	        if (sb_sel = 0 && !isplayer) {
	            if (keyboard_check_pressed(vk_home)) starta = 0
	            if (keyboard_check_pressed(vk_end)) starta = enda
	            if (keyboard_check_pressed(vk_pageup)) starta += totalcols
	            if (keyboard_check_pressed(vk_pagedown)) starta -= totalcols
	            starta = median(0, starta, enda)
	            sb_val[0] = starta
	        }
	        if (sb_sel = 1 && !isplayer) {
	            if (keyboard_check_pressed(vk_home)) startb = 0
	            if (keyboard_check_pressed(vk_end)) startb = endb
	            if (keyboard_check_pressed(vk_pageup)) startb += totalrows
	            if (keyboard_check_pressed(vk_pagedown)) startb -= totalrows
	            startb = median(0, startb, endb)
	            sb_val[1] = startb
	        }
	    }
	    if (keyboard_check(vk_right)) forward = 1
	    if (keyboard_check(vk_left)) forward = -1
	    if (keyboard_check_pressed(vk_enter)) {
	        playing = 0
	        marker_pos = 0
	        marker_prevpos = 0
	    }
		if (keyboard_check_pressed(vk_space)) toggle_playing(totalcols) timestoloop = real(loopmax)
	    if (keyboard_check_pressed(vk_f1)) {
	        open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
	    }
		// Instrument shortcuts
		if (keyboard_check_pressed(ord("M")) && keyboard_check(vk_control) && keyboard_check(vk_shift) && theme = 3) {
			if (!isplayer) playing = 0 
			window = w_setaccent
		}
		if (keyboard_check_pressed(vk_f5) && keyboard_check(vk_control) && keyboard_check(vk_shift) && theme = 3) {
			rainbowtoggle = !rainbowtoggle
			if (rainbowtoggle) {
				set_msg("Rainbow => ON")
			} else {
				set_msg("Rainbow => OFF")
				draw_accent_init()
			}
		}
		if (!isplayer) {
	    if (keyboard_check(vk_control)) {
		
			//First 10 (only ctrl)
			if(!keyboard_check(vk_shift)){
			   for (a = 1; a <= 10; a++) {
	             if (keyboard_check_pressed(ord(string(a % 10)))) {
	                instrument = instrument_list[| a - 1]
	                play_sound(instrument, selected_key, 100 ,100, 0)
	             }
	           }
			}else{
			  //Last 6 (ctrl+shift)
			  for (a = 1; a <= 6; a++) {
				if (keyboard_check_pressed(ord(string(a % 10)))) {
					instrument = instrument_list[| a + 9]
					play_sound(instrument, selected_key, 100 ,100, 0)
				}
			  }
		   }
		}
		// Control+Shift Stuff (Macros, Clip Editor)
		if (keyboard_check(vk_control)) {
			if (keyboard_check_pressed(ord("P"))&& keyboard_check(vk_shift)) {
				playing = 0 
				text_exists[59] = 0
				window = w_clip_editor
				}
			if (keyboard_check_pressed(ord("I"))&& keyboard_check(vk_shift)) {
				playing = 0 
				window = w_tempotapper
				}
			// Macro Hotkeys
			if selected != 0 {
				if (keyboard_check_pressed(ord("A"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_tremolo
					}
				if (keyboard_check_pressed(ord("S"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_stereo
					}
				if (keyboard_check_pressed(ord("D"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_arpeggio
					}
				if (keyboard_check_pressed(ord("F"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_portamento
					}
				if (keyboard_check_pressed(ord("G"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_vibrato()
					}
				if (keyboard_check_pressed(ord("H"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_stagger
					}
				if (keyboard_check_pressed(ord("J"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_chorus()
					}
				if (keyboard_check_pressed(ord("K"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_velocitylfo()
					}
				if (keyboard_check_pressed(ord("Q"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_fadein()
					}
				if (keyboard_check_pressed(ord("W"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_fadeout()
					}
				if (keyboard_check_pressed(ord("E"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_replacekey()
					}
				if (keyboard_check_pressed(ord("R"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_setvelocity
					}
				if (keyboard_check_pressed(ord("T"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_setpanning
					}
				if (keyboard_check_pressed(ord("Y"))&& keyboard_check(vk_shift)) {
					playing = 0 
					window = w_setpitch
					}
				if (keyboard_check_pressed(ord("U"))&& keyboard_check(vk_shift)) {
					playing = 0 
					macro_reset()
					}
			}
		}
		}
	}
	if (keyboard_check_pressed(vk_f7) && playing = 0) {
	    if (refreshrate = 0){
			game_set_speed(60,gamespeed_fps)
			refreshrate = 1
			set_msg("FPS => 60")
		} else if (refreshrate = 1) {
			game_set_speed(120,gamespeed_fps)
			refreshrate = 2
			set_msg("FPS => 120")
		} else if (refreshrate = 2) {
			game_set_speed(144,gamespeed_fps)
			refreshrate = 3
			set_msg("FPS => 144")
		} else if (refreshrate = 3) {
			game_set_speed(114514,gamespeed_fps)
			refreshrate = 4
			set_msg("FPS => Unlimited")
		} else if (refreshrate = 4) {
			game_set_speed(30,gamespeed_fps)
			refreshrate = 0
			set_msg("FPS => 30")
		}
	}
	if (!isplayer) {
	// Selecting note blocks
	if (select > 0) {
	    curs = cr_handpoint
	    window = 0.1
	    x2 = mouse_x
	    y2 = mouse_y
	    if (starta = 0) x2 = max(x1 + 2, mouse_x)
	    if (startb = 0) y2 = max(y1 + 34, mouse_y)
		if (theme != 3) {
			draw_set_color(c_blue)
			if (select = 2) draw_set_color(c_red)
		} else {
			draw_set_color(14120960)
			if (select = 2) draw_set_color(c_red)
		}
	    draw_set_alpha(0.25)
	    draw_rectangle(select_pressx, select_pressy, x2, y2, 0)
	    draw_set_alpha(1)
	    draw_rectangle(select_pressx, select_pressy, x2, y2, 1)
	    draw_theme_color()
	}

	// Timeline and markers
	draw_sprite_ext(spr_timeline, (0 + theme = 2 + (fdark && theme = 3)) * !blackout + blackout * 2, x1 + 2, y1 + 2, totalcols * 32 + 20, 1, 0, -1, 1)
	draw_theme_font(font_small)
	draw_set_halign(fa_left)
	draw_theme_color()
	if (blackout) draw_set_color(c_white)
	c = 1
	if (tempo < 3.5) c = 5
	if (tempo < 1) c = 10
	if (tempo < 0.5) c = 30
	if (tempo > 11) c = 0.5
	if (tempo > 18) c = 0.25
	a = ceil(starta / (tempo * c)) * c
	xx = (ceil(starta / (tempo * c)) - (starta / (tempo * c))) * (32 * tempo * c)

	while (xx < totalcols * 32 + 16) {
	    if (a > 0) draw_set_halign(fa_center)
	    draw_text(x1 + 2 + xx, y1 + 2, time_str(a))
	    draw_set_alpha(0.6)
	    draw_line(x1 + 2 + xx, y1 + 2 + 12, x1 + 2 + xx, y1 + 2 + 15)
	    draw_set_alpha(1)
	    draw_set_halign(fa_left)
	    xx += (32 * tempo) * c
	    a += c
	}

	for (a = 0; a <= totalcols; a += 1) {
	    b = ((starta + a) mod 4 == 0)
	    draw_set_alpha(0.6)
	    draw_line(x1 + 2 + 32 * a, y1 + 33, x1 + 2 + 32 * a, y1 + 30 - 3 * b)
	    draw_set_alpha(1)
	    if (b) {
	        if (a > 0) draw_set_halign(fa_center)
	        draw_text(x1 + 2 + 32 * a, y1 + 17, string(starta + a))
	        draw_set_halign(fa_left)
	    }
	}
	}
	// Marker
	if (playing = 0) metronome_played = -1
	if (playing = 1 || forward<>0) {
	    if (playing = 1) marker_pos += (tempo / room_speed) * (1 / currspeed)
	    if (forward != 0) {
	        marker_pos += (tempo / room_speed) * (1 / currspeed) * (forward - (forward < 0 && playing = 1))
	    }
		//metronome
		if (metronome && !isplayer) {
			if room_speed >= 60 {
			var pos = floor(marker_pos -0.1)
			} else pos = floor(marker_pos -0.4)
			if (tempo = 30) pos -= 1
			// show_debug_message(marker_pos)
			if ((pos mod 4 == 0) && (metronome_played < pos)) {
				ins = instrument_list[| 4]
				if (pos mod (4 * timesignature) == 0) {
					if (!loop || pos < enda + 1) { // avoid double ticks when looping
						if (ins.loaded) play_sound(ins, 57, 100, 100, 0)
					}
				} else {
					if (ins.loaded) play_sound(ins, 45, 100, 100, 0)
				}
				metronome_played = pos + 1
			}
		}
		//loop song
		if (loop_session = 1 && marker_pos > enda + 1 && (!looptobarend || marker_pos mod (timesignature * 4) < 1)) {
			timestoloop --
			starta = loopstart
			marker_pos = starta
			metronome_played = -1
			sb_val[scrollbarh] = starta
			if loopmax != 0 {
				if timestoloop < 0 {
					playing = 0
					timestoloop = real(loopmax)
				}
			} 
		}
	    if (marker_pos > enda + totalcols) {
	        marker_pos = enda + totalcols
	        playing = 0
	    }
	    if (marker_end && marker_pos >= section_end && marker_prevpos < section_end) {
	        marker_pos = section_end
	        playing = 0
	    }
	    if (marker_follow = 1) {
	        if (marker_pagebypage = 1) {
	            if (floor(marker_pos) >= starta + totalcols - 1 && starta < enda) {
	                starta = marker_pos - 1
	                starta = median(0, starta, enda)
	                sb_val[scrollbarh] = starta
	            }
	            if (floor(marker_pos) < starta + 1 && forward = -1 && starta > 0) {
	                starta = floor(marker_pos) - totalcols + 1
	                starta = median(0, starta, enda)
	                sb_val[scrollbarh] = starta
	            }
	        } else {
	            starta = median(0, marker_pos - ceil(totalcols / 2), enda)
	            sb_val[scrollbarh] = starta
	        }
	    }
	}
	if (!isplayer) {
	if (window = w_dragmarker) {
	    marker_pos = (mouse_x - x1 + 2) / 32 + starta
	    curs = cr_size_we
	    if (!mouse_check_button(mb_left)) {
	        window = w_releasemouse
	    }
	}
	if (window = w_dragselection || window = w_dragsection_start || window = w_dragsection_end || select > 0) {
	    a = starta
	    b = startb
	    if (mouse_x > x1 + 2 + 32 * totalcols - 32) {
	        if (refreshrate >= 2) dragincxr += 0.025
	        else dragincxr += 0.1
	        dragincxr = min(dragincxr, 4)
	        starta += ceil(dragincxr)
	    } else dragincxr = 0
	    if (mouse_x < x1 + 32) {
	        if (refreshrate >= 2) dragincxl += 0.025
	        else dragincxl += 0.1
	        dragincxl = min(dragincxl, 4)
	        starta -= ceil(dragincxl)
	    } else dragincxl = 0
	    if (mouse_y > y1 + 34 + totalrows * 32) {
	        if (refreshrate >= 2) dragincyd += 0.025
	        else dragincyd += 0.1
	        dragincyd = min(dragincyd, 4)
	        startb += ceil(dragincyd)
	    } else dragincyd = 0
	    if (mouse_y < y1 + 34 + 32) {
	        if (refreshrate >= 2) dragincyu += 0.025
	        else dragincyu += 0.1
	        dragincyu = min(dragincyu, 4)
	        startb -= ceil(dragincyu)
	    } else dragincyu = 0
	    starta = median(0, starta, enda)
	    startb = median(0, startb, endb)
	    if (select > 0) {
	        select_pressx += 32 * (a - starta)
	        select_pressy += 32 * (b - startb)
	        // select_pressa += (a - starta)
	        // select_pressb += (b - startb)
	    }
	    sb_val[0] = starta
	    sb_val[1] = startb
	}
	// Section
	if (window = w_dragsection_start) {
	    section_start = starta + round((mouse_x - (x1 + 2)) / 32)
	    if (!mouse_check_button(mb_left)) {
	        window = w_releasemouse
	        if (section_end = section_start) section_exists = 0
	        a = section_start
	        section_start = min(section_start, section_end)
	        section_end = max(a, section_end)
	    }
	}
	if (window = w_dragsection_end) {
	    section_end = starta + round((mouse_x - (x1 + 2)) / 32)
	    if (!mouse_check_button(mb_left)) {
	        window = w_releasemouse
	        if (section_end = section_start) section_exists = 0
	        a = section_start
	        section_start = min(section_start, section_end)
	        section_end = max(a, section_end)
	    }
	}
	if (section_exists) {
	    section_start = median(0, section_start, enda + totalcols)
	    section_end = median(0, section_end, enda + totalcols)
	    draw_set_alpha(0.25)
	    draw_set_color(c_blue)
	    draw_rectangle(x1 + 2 + floor(section_start - starta + 0.5) * 32, y1 + 2, x1 + 2 + floor(section_end - starta + 0.5) * 32, y1 + 33, 0)
	    draw_theme_color()
	    draw_set_alpha(1)
	    a = floor(section_start * 32 - starta * 32)
	    draw_sprite(spr_marker, 2 + (section_end < section_start) * 2, x1 + 2 + floor((a / 32) + 0.5) * 32, y1 + 2)
	    draw_sprite_ext(spr_marker, 3 + (section_end < section_start) * 2, x1 + 2 + floor((a / 32) + 0.5) * 32, y1 + 2, 1, totalrows * 2 + 10, 0, -1, 1)
	    a = floor(section_end * 32 - starta * 32)
	    draw_sprite(spr_marker, 4 - (section_end < section_start) * 2, x1 + 2 + floor((a / 32) + 0.5) * 32, y1 + 2)
	    draw_sprite_ext(spr_marker, 5 - (section_end < section_start) * 2, x1 + 2 + floor((a / 32) + 0.5) * 32, y1 + 2, 1, totalrows * 2 + 10, 0, -1, 1)
	}
	}

	marker_pos = median(0, marker_pos, enda + totalcols)
	if (!isplayer) {
	a = floor(marker_pos * 32 - starta * 32)
	draw_sprite_ext(spr_marker, 0 + 6 * (theme = 2 || blackout) + 8 * (theme = 3 && !blackout), x1 + 2 + a, y1 + 2, 1, 1, 0, accent[3] * (theme = 3) - !(theme = 3), 1)
	draw_sprite_ext(spr_marker, 1 + 6 * (theme = 2 || blackout) + 8 * (theme = 3 && !blackout), x1 + 2 + a, y1 + 2, 1, totalrows * 2 + 10, 0, accent[3] * (theme = 3) - !(theme = 3), 1)


	draw_theme_font(font_main)
	if (!fullscreen) {
		draw_set_color(15790320)
		if (theme = 1) draw_set_color(13160660)
		if (theme = 2) draw_set_color(c_dark)
		if (theme = 3) draw_set_color(15987699)
		if (theme = 3 && fdark) draw_set_color(2105376)
		draw_rectangle(0, 0, x1, rh, 0)
		draw_rectangle(0, 0, rw, y1, 0)
		draw_rectangle(0, y1 + totalrows * 32 + 52, rw, rh, 0)
		draw_rectangle(x1 + totalcols * 32 + 20, 0, rw, rh, 0)
		draw_rectangle(x1 + totalcols * 32 + 2, y1 + totalrows * 32 + 32, x1 + totalcols * 32 + 2 + 17, y1 + totalrows * 32 + 32 + 18, 0)
		draw_area(x1, y1, x1 + totalcols * 32 + 20, y1 + totalrows * 32 + 52)
	}
	draw_theme_color()

	// Scrollbars
	if (!fullscreen) {
		starta = draw_scrollbar(scrollbarh, x1, y1 + totalrows * 32 + 34, 32, totalcols - 1, enda + totalcols - 1, (exist && changepitch) || mousewheel > 0, 0)
		startb = draw_scrollbar(scrollbarv, x1 + totalcols * 32 + 2, y1 + 34, 32, totalrows - 1, endb + totalrows - 1, (exist && changepitch) || mousewheel > 0, 0)
	} else {
		// horizontal rise animation
		if (mouse_rectangle(0, rh - 25, rw, rh)) {
			if (window = 0 && sbh_anim < 16) sbh_anim += (2 * 30 / room_speed)
		} else if (sb_drag = -1) {
			if (sbh_anim > 0) sbh_anim -= (2 * 30 / room_speed)
		}
		// vertical rise animation
		if (mouse_rectangle(rw - 25, 0, rw, rh)) {
			if (window = 0 && sbv_anim < 16) sbv_anim += (2 * 30 / room_speed)
		} else if (sb_drag = -1) {
			if (sbv_anim > 0) sbv_anim -= (2 * 30 / room_speed)
		}
		starta = draw_scrollbar(scrollbarh, 0, rh - sbh_anim, 32, ((rw - 16) / 32) - 1, enda + totalcols - 2, (exist && changepitch) || mousewheel > 0, 0)
		startb = draw_scrollbar(scrollbarv, rw - sbv_anim, rhval, 32, ((rh - rhval - 16) / 32) - 1, endb + totalrows - 2, (exist && changepitch) || mousewheel > 0, 0)
		// the fifth parameters are totalrows & totalcols before rounding: ((rh - rhval) / 32), ((rw - 8) / 32)
		// this is so it stretches to fill the whole width/height of the screen instead of clipping to the note block area size
	}
	// Fullscreen button
	if (fullscreen) {
		xx = rw - sbv_anim
		yy = rh - 16
	} else {
		xx = x1 + totalcols * 32
		yy = y1 + totalrows * 32 + 34
	}
	if (theme = 0) draw_set_color(15790320)
	if (theme = 1) draw_set_color(13160660)
	if (theme = 2) draw_set_color(c_dark)
	if (theme = 3) draw_set_color(15987699)
	if (theme = 3 && fdark) draw_set_color(2105376)
	draw_rectangle(xx, yy, xx + 16, yy + 16, false)
	if (draw_layericon(7 + fullscreen, xx, yy, condstr(!fullscreen, "Expand workspace", "Return"), 0, 0)) {
		fullscreen = !fullscreen
		if (fullscreen) set_msg("Fullscreen => ON")
		else set_msg("Fullscreen => OFF")
		dontplace = 1
	}
	draw_theme_color()

	// Draw layers
	for (b = 0; b < totalrows; b += 1) {
		if (startb + b >= endb2) {
		    layername[startb + b] = ""
		    layerlock[startb + b] = 0
		    layervol[startb + b] = 100
			layerstereo[startb + b] = 100
		    rowamount[startb + b] = 0
		    endb2 = startb + b + 1
		}
		x1 = 4
		y1 = 54 + 32 + b * 32 - 1
		if (!fullscreen && show_layers) {
			// Name
			m = mouse_rectangle(x1 + 10, y1 + 10, 75, 13)
		    draw_sprite(spr_layerbox, 0 + (theme = 2) + (2 + fdark) * (theme = 3), x1, y1)
		    popup_set(x1 + 10, y1 + 10, 75, 13, "The name for this layer")
			draw_theme_font(font_small)
			prev = layername[startb + b]
			if (theme != 3) {
			layername[startb + b] = draw_text_edit(400 + startb + b, layername[startb + b], x1 + 11, y1 + 10, 72, 14, 1, 0)
			} else {
			layername[startb + b] = draw_textarea(400 + startb + b, x1 + 9, y1 + 4, 72, 24, string(layername[startb + b]), "The name of this layer.")
			}
			if (layername[startb + b] = "") {
		        draw_set_color(c_gray)
				if(theme = 2 || (fdark && theme = 3)) draw_set_color(make_color_rgb(160, 160, 160))
		        draw_text(x1 + 11, y1 + 10, "Layer " + string(startb + b + 1))
		    }
			if (prev != layername[startb + b]) changed = 1
		    draw_theme_color()
		    // Vol
		    if (realvolume) {
		        c = ((dragvolb = startb + b && window = w_dragvol) || (mouse_rectangle(x1 + 88, y1 + 5, 16, 25) && window = 0))
		        if (startb + b >= endb2) {
		            a = 100
		        } else {
		            a = layervol[startb + b]
		        }
				if(theme != 3) {
		        draw_sprite_ext(spr_volume, a / 30, x1 + 91, y1 + 11 - c * 5, 1, 1, 0, iconcolor, 0.7)
				} else {
				draw_sprite_ext(spr_volume_f, a / 30 + 4 * (!fdark), x1 + 91, y1 + 11 - c * 5, 1, 1, 0, iconcolor, 1)
				}
		        popup_set(x1 + 90, y1 + 5, 12, 17, "Volume of this layer: " + string(a) + "%\n(Click and drag to change)")
		        if (c) {
		        draw_theme_font(font_small)
		            draw_set_halign(fa_center)
		            draw_text(x1 + 98, y1 + 18, string(a) + "%")
		            draw_set_halign(fa_left)
		            draw_theme_font(font_main)
		            curs = cr_size_ns
		            if (mouse_check_button_pressed(mb_left)) {
		                window = w_dragvol
		                dragvolb = startb + b
		                dragvol = layervol[startb + b]
		            }
		        }
		    }
			// Stereo
		    if (!realstereo) {
		        c = ((dragstereob = startb + b && window = w_dragstereo) || (mouse_rectangle(x1 + 108, y1 + 5, 16, 25) && window = 0))
		        if (startb + b >= endb2) {
		            a = 100
		        } else {
		            a = layerstereo[startb + b]
		        }
				if (theme != 3) {
		        draw_sprite_ext(spr_stereo, a / 50, x1 + 110, y1 + 11 - c * 5, 1, 1, 0, iconcolor, 0.7)
				} else {
				draw_sprite_ext(spr_stereo_f, a / 50 + 5 * (!fdark), x1 + 110, y1 + 11 - c * 5, 1, 1, 0, iconcolor, 1)
				}
				var stereostr
				if (a > 100) { stereostr = "R " + string(a-100) }
				if (a = 100) { stereostr = "Center" }
				if (a < 100) { stereostr = "L " + string(-(a-100)) }
		        popup_set(x1 + 110, y1 + 5, 12, 17, "Stereo pan: " + stereostr + "\n(Click and drag to change)")
		        if (c) {
		            draw_theme_font(font_small)
		            draw_set_halign(fa_center)
					if a > 100 {draw_text(x1 + 116, y1 + 18, "R " + string(a-100))}
					if a = 100 {draw_text(x1 + 116, y1 + 18, "MONO")}
					if a < 100 {draw_text(x1 + 116, y1 + 18, "L " + string((a-100)*-1))	}
		            draw_set_halign(fa_left)
		            draw_theme_font(font_small)
		            curs = cr_size_ns
		            if (mouse_check_button_pressed(mb_left)) {
		                window = w_dragstereo
		                dragstereob = startb + b
		                dragstereo = layerstereo[startb + b]
		            }
		        }
			}
		    // Lock button
		    p = 0
		    if (startb + b < endb2) p = (layerlock[startb + b] = 1)
		    if (draw_layericon(0, x1 + 126-!realvolume-realstereo * 10, y1 + 8, "Lock this layer", 0, p)) {
		        if (layerlock[startb + b] = 2) solostr = string_replace_all(solostr, "|" + string(startb + b) + "|", "")
		        if (layerlock[startb + b] = 1) {layerlock[startb + b] = 0} else {layerlock[startb + b] = 1}
				changed = 1
		    }
		    // Solo button
		    p = 0
		    if (startb + b < endb2) p = (layerlock[startb + b] = 2)
		    if (draw_layericon(1, x1 + 144 - !realvolume-realstereo * 10, y1 + 8, "Solo this layer", 0, p)) {
		        if (layerlock[startb + b] = 2) {
		            layerlock[startb + b] = 0
		            solostr = string_replace_all(solostr, "|" + string(startb + b) + "|", "")
		        } else {
		            layerlock[startb + b] = 2
		            solostr += "|" + string(startb + b) + "|"
		        }
		    }
			// Select all
		    if (draw_layericon(2, x1 + 162 - !realvolume-realstereo * 10, y1 + 8, "Select all note blocks in this layer\n(Hold Ctrl to select multiple layers)", 0, 0)) {
		        playing = 0
				if (!keyboard_check(vk_control)) {
					selection_place(0)
				}
		        selection_add(0, startb + b, enda, startb + b, 0, 0)
		    }
			// Add layer
		    if (draw_layericon(3, x1 + 180 - !realvolume-realstereo * 10, y1 + 8, "Add empty layer here", 0, 0)) {
		        playing = 0
				add_layer(startb + b, false)
		    }
			// Remove layer
			if (draw_layericon(4, x1 + 198 - !realvolume-realstereo * 10, y1 + 8, "Remove this layer", 0, 0)) {
		        playing = 0
				remove_layer(startb + b, false)
			}
			// Shift layer up
			if ((startb + b > 0) && draw_layericon(5, x1 + 216 - !realvolume-realstereo * 10, y1 + 8, "Shift layer up", 0, 0)) {
			    playing = 0
				shift_layers(startb + b, startb + b - 1, false)
			}
			// Shift layer down
			if (draw_layericon(6, x1 + 234 - !realvolume-realstereo * 10 - (startb + b = 0) * 8, y1 + 8, "Shift layer down", 0, 0)) {
			    playing = 0
				shift_layers(startb + b, startb + b + 1, false)
			}
		}
	}
	if (window = w_dragvol) {
		prev = layervol[dragvolb]
		dragvol += (mouse_yprev - mouse_y)
		dragvol = median(0, dragvol, 100)
		if (!keyboard_check(vk_shift)) {
			layervol[dragvolb] = floor(dragvol / 10) * 10
		} else {
			layervol[dragvolb] = dragvol
		}
		if (layervol[dragvolb] != prev) changed = 1
		if (!mouse_check_button(mb_left)) {
		    window = w_releasemouse
		}
	}
	if (window = w_dragstereo) {
		prev = layerstereo[dragstereob]
		dragstereo += (mouse_yprev - mouse_y)
		dragstereo = median(0, dragstereo, 200)
		if (!keyboard_check(vk_shift)) {
			layerstereo[dragstereob] = floor(dragstereo / 10) * 10
		} else {
			layerstereo[dragstereob] = dragstereo
		}
		if (layerstereo[dragstereob] != prev) changed = 1
		if (!mouse_check_button(mb_left)) {
		    window = w_releasemouse
		}
	}
	// Macro Bar
	if (selected != 0 && show_piano) {
	if (theme != 3) {
		if (show_layers) {
			draw_sprite_ext(spr_iconbar, 0, x1, y1+32,1, 1.3, 0, -1, 1)
			draw_sprite_ext(spr_iconbar, 1, x1, y1+32, 258, 1.3, 0, -1, 1)
			draw_sprite_ext(spr_iconbar, 2, 258, y1+32, 1, 1.3, 0, -1, 1)
		} else {
			draw_sprite_ext(spr_iconbar, 0, x1, y1+52 ,1, 0.75, 0, -1, 1)
			draw_sprite_ext(spr_iconbar, 1, x1, y1+52, 383, 0.75, 0, -1, 1)
			draw_sprite_ext(spr_iconbar, 2, 383, y1+52, 1, 0.75, 0, -1, 1)
		}
	} else {
		draw_set_color(make_color_rgb(70, 70, 70))
		if (show_layers) draw_roundrect(x1, y1 + 32, x1 + 255, y1 + 32 + 38, 1)
		else draw_roundrect(x1, y1 + 52, x1 + 380, y1 + 52 + 21, 1)
	}
	xx = x1 + 6
	var yy = y1+37
	if (!show_layers) yy += 18
	if (draw_macroicon(0, xx, yy, "Tremolo...", 0, 0)) {playing = 0 window = w_tremolo} xx += 25
	if (draw_macroicon(1, xx, yy, "Stereo...", 0, 0)) {playing = 0 window = w_stereo} xx += 25
	if (draw_macroicon(2, xx, yy, "Arpeggio...", 0, 0)) {playing = 0 window = w_arpeggio} xx += 25
	if (draw_macroicon(3, xx, yy, "Portamento...", 0, 0)) {playing = 0 window = w_portamento} xx += 25
	if (draw_macroicon(4, xx, yy, "Vibrato", 0, 0)) {playing = 0 macro_vibrato()} xx += 25
	if (draw_macroicon(5, xx, yy, "Stagger...", 0, 0)) {playing = 0 window = w_stagger} xx += 25
	if (draw_macroicon(6, xx, yy, "Chorus", 0, 0)) {playing = 0 macro_chorus()} xx += 25
	if (draw_macroicon(7, xx, yy, "Volume LFO", 0, 0)) {playing = 0 macro_velocitylfo()} xx += 25
	if (draw_macroicon(8, xx, yy, "Fade in", 0, 0)) {playing = 0 macro_fadein()} xx += 25
	if (draw_macroicon(9, xx, yy, "Fade out", 0, 0)) {playing = 0 macro_fadeout()} xx += 25
	if (show_layers) {
		xx = x1 + 6
		yy += 16
	}
	if (draw_macroicon(10, xx, yy, "Replace key", 0, 0)) {playing = 0 macro_replacekey()} xx += 25
	if (draw_macroicon(11, xx, yy, "Set velocity...", 0, 0)) {playing = 0 window = w_setvelocity} xx += 25
	if (draw_macroicon(12, xx, yy, "Set panning...", 0, 0)) {playing = 0 window = w_setpanning} xx += 25
	if (draw_macroicon(13, xx, yy, "Set pitch...", 0, 0)) {playing = 0 window = w_setpitch} xx += 25
	if (draw_macroicon(14, xx, yy, "Reset all properties", 0, 0)) {playing = 0 macro_reset()} xx += 25
	}
	}

	// Tabs
	if (!fullscreen) {
	if (theme = 0) draw_sprite_ext(spr_tabbar, 0, 0, 0, rw, 1, 0, -1, 1)
	tab_x = 1
	draw_theme_font(font_small)
	draw_theme_color()
	if (draw_tab("File")) {
	    str = ""
	    for (b = 0; b < 11; b += 1) {
	        if (recent_song[b] = "") break
	        c = floor(date_second_span(recent_song_time[b], date_current_datetime()))
	        str += seconds_to_str(c) + "$" + string_truncate(clean(filename_name(recent_song[b])), 310) + "|"
	    }
	    if (!isplayer) show_menu_ext("file", 0, 19, icon(icons.NEW)+"Ctrl + N$New song|"+
	                             icon(icons.OPEN)+"Ctrl+O$Open song...|Recent songs...|\\|" + str + condstr(recent_song[0] != "", "-|Clear recent songs") + condstr(recent_song[0] = "", "^!No recent songs") + "|/|-|"+
	                             icon(icons.SAVE)+"Ctrl+S$Save song|"+
	                             icon(icons.SAVE_AS)+"Save song as a new file...|Save options...|-|"+
	                             "Import pattern...|"+"Export pattern...|"+"Import from MIDI...|Import from schematic...|-|"+
	                             inactive(totalblocks = 0) + "Export as MP3...|"+
	                             inactive(totalblocks = 0) + "Export as schematic...|"+
	                             inactive(totalblocks = 0) + "Export as branch schematic...|"+
								 inactive(totalblocks = 0) + "Export as data pack...|-|" + 
	                             "Alt + F4$Exit")
		else show_menu_ext("filep", 0, 19, icon(icons.OPEN)+"Ctrl+O$Open song...|Recent songs...|\\|" + str + condstr(recent_song[0] != "", "-|Clear recent songs") + condstr(recent_song[0] = "", "^!No recent songs") + "|/|-|"+"Import from MIDI...|Import from schematic...|-|" + "Alt + F4$Exit")
							
	}
	if (!isplayer) if (draw_tab("Edit")) {
	    str = ""
	    customstr = ""
		insmenu = 1
	    for (a = 0; a < ds_list_size(instrument_list); a += 1) {
	        var ins = instrument_list[| a];
	        if (ins.user)
	            customstr += "...to " + clean(ins.name) + "|"
	        else
	            str += "...to " + clean(ins.name) + "|"
			if (a % 25 == 0 && a > 1 && a < ds_list_size(instrument_list) - 1) {
				customstr += "-|More...|\\|"
				insmenu++
			}
	    }
	    show_menu_ext("edit", 29, 19, inactive(historypos = historylen) + icon(icons.UNDO - (historypos = historylen)) + "Ctrl+Z$Undo|"+
	                              inactive(historypos = 0) + icon(icons.REDO - (historypos = 0)) + "Ctrl+Y$Redo|-|"+
	                              inactive(selected = 0) + icon(icons.COPY - (selected = 0)) + "Ctrl+C$Copy|"+
	                              inactive(selected = 0) + icon(icons.CUT - (selected = 0)) + "Ctrl+X$Cut|"+
	                              inactive(selection_copied = "") + icon(icons.PASTE - (selection_copied = "")) + "Ctrl+V$Paste|"+
	                              inactive(selected = 0) + icon(icons.DELETE - (selected = 0)) + "Delete$Delete|-|"+
	                              inactive(totalblocks = 0) + "Ctrl+A$Select all|"+
	                              inactive(selected = 0) + "Deselect all|"+
	                              inactive(selected = 0 && totalblocks = 0) + "Ctrl+I$Invert selection|-|"+
	                              inactive(instrument.num_blocks = 0) + "Select all " + clean(instrument.name) + "|"+
	                              inactive(instrument.num_blocks = totalblocks) + "Select all but " + clean(instrument.name) + "|-|"+
	                                inactive(selected = 0) + "Ctrl+E$" + get_mode_actions(1) + "|"+
	                                inactive(selected = 0) + "Ctrl+D$" + get_mode_actions(2) + "|"+
	                                inactive(selected = 0) + "Ctrl+R$" + get_mode_actions(3) + "|"+
	                                inactive(selected = 0) + "Ctrl+F$" + get_mode_actions(4) + "|"+
											condstr((editmode != m_key), inactive(selected = 0) + "Ctrl+T$" + get_mode_actions(5) + "|") +
											condstr((editmode != m_key), inactive(selected = 0) + "Ctrl+G$" + get_mode_actions(6) + "|") +
	                                inactive(selected = 0) + "Change instrument...|\\|" + str + condstr(customstr != "", "-|") + customstr + string_repeat("/|", insmenu) + "-|" +
	                                inactive(selected = 0 || selection_l = 0) + "Expand selection|"+
	                                inactive(selected = 0 || selection_l = 0) + "Compress selection|"+
	                                inactive(selected = 0 || selection_l = 0) + "Macros...|\\||"+ "Tremolo...|"+ "Stereo...|"+ "Arpeggio...|"+ "Portamento...|"+ "Vibrato|"+ "Stagger...|"+ "Chorus|"+ "Volume LFO|"+ "Fade in|"+ "Fade out|"+ "Replace key|"+ "Set velocity...|"+ "Set panning...|"+ "Set pitch...|"+ "Reset all properties|"+ "/|-|"+
	                                inactive(selected = 0) + "Transpose notes outside octave range")
	}
	if (draw_tab("Settings")) {
	    str = ""
	    customstr = ""
		insmenu = 1
	    for (a = 0; a < ds_list_size(instrument_list); a++) {
	        var ins = instrument_list[| a];
	        if (ins.user)
	            customstr += check(instrument = ins) + clean(ins.name) + "|"
	        else{
				if(a < 10){
					 str += check(instrument = ins) + "Ctrl+" + string((a + 1) % 10) + "$" + clean(ins.name) + "|"
				}else{
				  str += check(instrument = ins) + "      Ctrl+Shift+" + string((a + 1) % 10) + "$" + clean(ins.name) + "|"
				}
			}
			if (a % 25 == 0 && a > 1 && a < ds_list_size(instrument_list) - 1) {
				customstr += "-|More...|\\|"
				insmenu++
			}
	    }
	    if (!isplayer) show_menu_ext("settings", 59, 19, "Instrument|\\|" + str + condstr(customstr != "", "-|") + customstr + string_repeat("/|", insmenu) +
	                        icon(icons.INSTRUMENTS)+"Instrument settings...|/|-|" + icon(icons.INFORMATION) + "Song info...|" + icon(icons.PROPERTIES) + "Song properties...|Song stats...|-|" + icon(icons.MIDI_INPUT) + "MIDI device manager|Preferences...")
		else show_menu_ext("settingsp", 29, 19, icon(icons.INFORMATION) + "Song info...|" + "Song stats...|-|" + "Preferences...")
	}
	if (draw_tab("Help")) {
	    show_menu_ext("help", 109 - 30 * isplayer, 19, icon(icons.HELP) + "Tutorial videos|\\|Part 1: Composing note block music|Part 2: Opening MIDI files|Part 3: Importing songs into Minecraft|Part 4: Editing songs made in Minecraft     |-|F1$View all|/|-|" + icon(icons.INTERNET) + "Minecraft Forums topic...|Minecraft Wiki page...|-|Changelist...|About...|GitHub...")
	}

	// Icons
	if (theme != 3) {
	draw_sprite(spr_iconbar, 0, 0, 20)
	draw_sprite_ext(spr_iconbar, 1, 2, 20, (rw - 4), 1, 0, -1, 1)
	draw_sprite(spr_iconbar, 2, rw - 2, 20)
	} else {
	draw_sprite(spr_iconbar, 3 + fdark * 3, 0, 20)
	draw_sprite_ext(spr_iconbar, 4 + fdark * 3, 2, 20, (rw - 4), 1, 0, -1, 1)
	draw_sprite(spr_iconbar, 5 + fdark * 3, rw - 2, 20)
	}
	xx = 6
	yy = 23
	if (!isplayer) if (draw_icon(icons.NEW, xx, yy, "New song", 0, 0)) {new_song()} if (!isplayer) xx += 25
	if (draw_icon(icons.OPEN, xx, yy, "Open song", 0, 0)) {playing = 0 load_song("")} xx += 25 + isplayer * 4
	if (!isplayer) if (draw_icon(icons.SAVE, xx, yy, "Save song", 0, 0)) {save_song(filename)} if (!isplayer) xx += 25 + 4
	draw_separator(xx, yy + 3) xx += 4
	if (draw_icon(icons.PLAY + playing, xx, yy, "Play / Pause song", 0, 0)) toggle_playing(totalcols) timestoloop = real(loopmax)
	if (isplayer) if (draw_icon(icons.PLAY + playing, rw / 2 - 12, rh / 2 + 50, "Play / Pause song", 0, 0)) toggle_playing(totalcols) timestoloop = real(loopmax)
	xx += 25
	if (draw_icon(icons.STOP, xx, yy, "Stop song", 0, 0)) {playing = 0 marker_pos = 0 marker_prevpos = 0 timestoloop = real(loopmax)} xx += 25
	if (isplayer) if (draw_icon(icons.STOP, rw / 2 - 12 - 100, rh / 2 + 50, "Stop song", 0, 0)) {playing = 0 marker_pos = 0 marker_prevpos = 0 timestoloop = real(loopmax)}
	forward = 0
	if (draw_icon(icons.BACK, xx, yy, "Rewind song", 0, 0)) {forward = -1} xx += 25
	if (isplayer) if (draw_icon(icons.BACK, rw / 2 - 12 - 50, rh / 2 + 50, "Rewind song", 0, 0)) {forward = -1}
	if (draw_icon(icons.FORWARD, xx, yy, "Fast-forward song", 0, 0)) {forward = 1} xx += 25
	if (isplayer) if (draw_icon(icons.FORWARD, rw / 2 - 12 + 50, rh / 2 + 50, "Fast-forward song", 0, 0)) {forward = 1}
	if (!isplayer) if (draw_icon(icons.RECORD, xx, yy, "Record key presses", 0, playing > 0 && record)) {playing = 0.25 record=!record} if (!isplayer) xx += 25 
	if (draw_icon(icons.LOOP_INACTIVE + loop_session, xx, yy, "Toggle looping", 0, 0)) loop_session = !loop_session if (!isplayer) xx += 25
	if (isplayer) if (draw_icon(icons.LOOP_INACTIVE + loop_session, rw / 2 - 12 + 100, rh / 2 + 50, "Toggle looping", 0, 0)) loop_session = !loop_session if (!isplayer)
	if metronome {
		if (metronome_played == -1 || (metronome_played - 1) mod 8 == 0) metricon = icons.METRONOME_1
		else metricon = icons.METRONOME_2
	} else {
		metricon = icons.METRONOME_INACTIVE
	}
	if (!isplayer) if(draw_icon(metricon, xx, yy, "Toggle metronome", 0, 0)) metronome = !metronome
	xx += 25 + 4
	if (playing = 0) record = 0
	draw_separator(xx, yy + 3) xx += 4
	if (!isplayer) if (draw_icon(icons.EDITMODE_KEY, xx, yy, "Edit note key", 0, editmode = 0)) {editmode = 0} if (!isplayer) xx += 25
	if (!isplayer) if (draw_icon(icons.EDITMODE_VEL, xx, yy, "Edit note velocity", 0, editmode = 1)) {editmode = 1}  if (!isplayer) xx += 25
	if (!isplayer) if (draw_icon(icons.EDITMODE_PAN, xx, yy, "Edit note panning", 0, editmode = 2)) {editmode = 2} if (!isplayer) xx += 25
	if (!isplayer) if (draw_icon(icons.EDITMODE_PIT, xx, yy, "Edit note pitch", 0, editmode = 3)) {editmode = 3} if (!isplayer) xx += 25 + 4
	if (!isplayer) draw_separator(xx, yy + 3) if (!isplayer) xx += 4

	// Expandable instrument box
	var ins_count = ds_list_size(instrument_list)
	var ins_icons = median(5, ceil((rw - 920) / 25), ins_count)
	if (ins_icons = ins_count - 1) ins_icons += 1
	var ins_rows = ceil(ins_count / ins_icons)
	if (!isplayer) if (showinsbox) {
		window = w_insbox
		draw_theme_color()
		draw_window(xx - 2, yy - 2, xx + (ins_icons * 25) + 2, yy + (ins_rows * 25) + 2)
		for (a = 0; a < ins_rows; a += 1) {
			for (b = 0; b < ins_icons; b += 1) {
				var insindex = (a * ins_icons + b)
				if (insindex >= ds_list_size(instrument_list)) break
				var ins = instrument_list[| insindex];
				if (draw_icon_insbox(insindex, xx + b * 25, yy + a * 25, "Change instrument to " + ins.name, true, false, instrument = ins)) {
					play_sound(ins, selected_key, 100, 100, 0)
					instrument = ins
					// Set the first instrument of the collapsed row
					insbox_start = min(floor(insindex / ins_icons) * ins_icons, ds_list_size(instrument_list) - ins_icons)
				}
			}
		}
		// Click away
		if (mouse_check_button_released(mb_left)) && !(mouse_rectangle(xx, yy, ins_icons * 25, ins_rows * 25)) {
			showinsbox = 0
			window = 0
		}
		xx += ins_icons * 25
		// 'Collapse' button
		draw_icon_insbox(icons.INSBOX_COLLAPSE, xx, yy, "Less instruments", true) // it's a fake button since clicking anywhere works :D
		xx += 25
	} else {
		// Ensure current instrument appears
		a = ds_list_find_index(instrument_list, instrument)
		if (a < insbox_start) {
			insbox_start -= ins_icons
			insbox_start = floor(insbox_start / ins_icons) * ins_icons
		} else if (a > insbox_start + ins_icons - 1) {
			insbox_start += ins_icons
			insbox_start = floor(insbox_start / ins_icons) * ins_icons
		}
		// Prevent overflow
		insbox_start = median(0, insbox_start, ds_list_size(instrument_list) - ins_icons)
		for (a = insbox_start; a < insbox_start + ins_icons; a += 1) {
		    var ins = instrument_list[| a];
		    if (draw_icon_insbox(a, xx, yy, "Change instrument to " + ins.name, false, false, instrument = ins)) {
				play_sound(ins, selected_key, 100, 100, 0)
				instrument = ins
			}
			xx += 25
		}
		if (ins_icons < ds_list_size(instrument_list)) {
			if (draw_icon_insbox(icons.INSBOX_EXPAND, xx, yy, "More instruments...", false, true, 0)) {showinsbox = 1}
			xx += 25
		}
	}
	if (!isplayer) {xx += 4 draw_separator(xx, yy + 3) xx += 4}
	while (1) {
	if (!isplayer) {if (draw_icon(icons.UNDO, xx, yy, "Undo the last change", historypos = historylen, 0)) {playing = 0 action_undo()} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.REDO, xx, yy, "Redo the last undo", historypos = 0, 0)) {playing = 0 action_redo()} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.COPY, xx, yy, "Copy the selected note blocks", selected = 0, 0)) {playing = 0 action_copy()} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.CUT, xx, yy, "Cut the selected note blocks", selected = 0, 0)) {playing = 0 action_cut()} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.PASTE, xx, yy, "Paste the copied note blocks", selection_copied = "", 0)) {playing = 0 action_paste(starta, startb)} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.DELETE, xx, yy, "Delete the selected note blocks", selected = 0, 0)) {playing = 0 action_delete()} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {xx += 4 draw_separator(xx, yy + 3) xx += 4 if (xx > rw - 190) break}
	if (draw_icon(icons.INFORMATION, xx, yy, "View song info")) {if (!isplayer) playing = 0 window = w_songinfoedit * !isplayer + w_songinfo * isplayer} xx += 25 if (xx > rw - 190) break
	if (!isplayer) {if (draw_icon(icons.PROPERTIES, xx, yy, "Edit song properties")) {playing = 0 window = w_properties} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.INSTRUMENTS, xx, yy, "Edit instruments")) {playing = 0 window = w_instruments} xx += 25 if (xx > rw - 190) break}
	if (!isplayer) {if (draw_icon(icons.MIDI_INPUT, xx, yy, "MIDI device manager")) {playing = 0 window = w_mididevices} xx += 25 if (xx > rw - 190) break}
	xx += 4 draw_separator(xx, yy + 3) xx += 4 if (xx > rw - 190) break
	if (draw_icon(icons.HELP, xx, yy, "Watch tutorial videos")) {
	    open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
	} xx += 25 if (xx > rw - 190) break
	if (draw_icon(icons.INTERNET, xx, yy, "Visit the Minecraft Forums topic")) {open_url(link_topic)} xx += 25 if (xx > rw - 190) break
	break
	}

	// Compatible
	if (!isplayer) {
	draw_separator(rw - 34, 26)
	draw_theme_font(font_main_bold)
	draw_set_halign(fa_right)
	if (compatible = 1) {
		if (theme != 3) {
		draw_sprite(spr_minecraft, 0, rw - 30, 25)
		draw_sprite(spr_minecraft, 0, rw - 59, 25)
		} else {
		draw_sprite(spr_minecraft_f, fdark * 3, rw - 30, 25)
		draw_sprite(spr_minecraft_f, fdark * 3, rw - 59, 25)
		}
		draw_set_color(c_green)
		if (theme == 2 || (theme == 3 && fdark)) draw_set_color(c_lime)
		draw_text(rw - 65, 28, "Fully compatible")
		draw_theme_color()
		draw_theme_font(font_main)
		popup_set(rw - compx, 24, compx, 25, "This song is compatible with both schematics and data packs.\n(Click for more info.)")
	} else if (compatible = 2) {
		if (theme != 3) {
		draw_sprite(spr_minecraft, 0, rw - 30, 25)
		draw_sprite(spr_minecraft, 1, rw - 59, 25)
		} else {
		draw_sprite(spr_minecraft_f, fdark * 3, rw - 30, 25)
		draw_sprite(spr_minecraft_f, 1 + fdark * 3, rw - 59, 25)
		}
		draw_set_color(c_orange)
		draw_text(rw - 65, 28, "Data pack only")
		draw_theme_color()
		draw_theme_font(font_main)
		popup_set(rw - compx, 24, compx, 25, "This song is only compatible with data packs.\n(Click for more info.)")
	} else {
		if (theme != 3) {
		draw_sprite(spr_minecraft, 2, rw - 30, 25)
		draw_sprite(spr_minecraft, 1, rw - 59, 25)
		} else {
		draw_sprite(spr_minecraft_f, 2 + fdark * 3, rw - 30, 25)
		draw_sprite(spr_minecraft_f, 1 + fdark * 3, rw - 59, 25)
		}
		draw_set_color(c_red)
		draw_text(rw - 65, 28, "Resource pack only")
		draw_theme_color()
		draw_theme_font(font_main)
		popup_set(rw - compx, 24, compx, 25, "This song is compatible with data packs using a resource pack.\n(Click for more info.)")
	}
	draw_set_halign(fa_left)

	a = mouse_rectangle(rw - compx, 24, compx, 25)
	if (a && window = 0) {
	    curs = cr_handpoint
	    if (mouse_check_button_pressed(mb_left)) {
	        playing = 0
	        record = 0
	        selection_place(0)
	        window = w_minecraft
	    }
	}

	// Status bar
	draw_set_color(make_color_rgb(128, 128, 128))
	draw_line(0, rh - 24, rw, rh - 24)
	draw_set_color(c_white)
	draw_line(0, rh - 23, rw, rh - 23)
	draw_theme_color()
	xx = 4

	draw_text(xx, rh - 18, "Instrument: " + instrument.name) xx += 180
	draw_separator(xx, rh - 20)
	draw_theme_color()

	xx += 4
	draw_text(xx, rh - 18, "Key: " + get_keyname(selected_key, 1)) xx += 75
	draw_separator(xx, rh - 20)
	draw_theme_color()

	xx += 4
	draw_text(xx, rh - 18, "Tick: " + test(selbx = -1, "None", string(selbx))) xx += 90
	draw_separator(xx, rh - 20)
	draw_theme_color()

	xx += 4
	draw_text(xx, rh - 18, "Layer: " + test(selby = -1, "None", string(selby + 1))) xx += 90
	draw_separator(xx, rh - 20)
	draw_theme_color()

	xx += 4
	draw_text(xx, rh - 18, "Selected: " + string(selected) + " / " + string(totalblocks + selected)) xx += 160
	draw_separator(xx, rh - 20)
	draw_theme_color()

	var hovernote = 0
	if (sela > -1 && selb > -1) {
		if (selbx < arraylength && selby < arrayheight) {
			if (song_exists[selbx, selby]) {
				hovernote = 1
				xx += 4
				draw_text(xx, rh - 18, "Key: " + get_keyname(song_key[selbx, selby], 1))
				xx += 90
				draw_separator(xx, rh - 20)
				draw_theme_color()
				xx += 4
				draw_text(xx, rh - 18, "Velocity: " + string_format(song_vel[selbx, selby], 1, 0))
				xx += 110
				draw_separator(xx, rh - 20)
				draw_theme_color()
				xx += 4
				if (song_pan[selbx, selby] != 100) {
					draw_text(xx, rh - 18, "Panning: " + condstr(song_pan[selbx, selby] < 100, "L ", "R ") + " " + string(abs(song_pan[selbx, selby] - 100)))
				} else {
					draw_text(xx, rh - 18, "Panning: Center")
				}
				xx += 120
				draw_separator(xx, rh - 20)
				draw_theme_color()
				xx += 4
				draw_text(xx, rh - 18, "Pitch: " + condstr(song_pit[selbx, selby] > 0, "+") + string_format(song_pit[selbx, selby], 1, 0) + " cents")
				draw_theme_color()
			}
		}
	}
	if (!hovernote) {
		// Auto-save remaining time
		if (autosave && filename_ext(filename) = ".nbs") {
			draw_theme_color()
			xx += 4
			draw_text(xx, rh - 18, "Next auto-save: " + string(ceil(tonextsave)) + " minute" + condstr(ceil(tonextsave)<>1, "s"))
			xx += 210
			draw_separator(xx, rh - 20)
			draw_theme_color()
		}
		// Active sounds count
		if (show_soundcount) {
			xx += 4
			if (sounds > channels) {
				draw_set_color(c_red)
			}
			draw_text(xx, rh - 18, "Sounds: " + string(sounds) + " / " + string(channels))
			draw_theme_color()
		}
	}

	draw_set_halign(fa_right)
	str = ""
	for (a = 0; a < midi_devices; a += 1) str += condstr(a > 0, ", ") + midi_input_device_name(a)
	if (midi_devices = 0) str = "No connected MIDI devices"
	else str = "MIDI devices: " + str
	draw_text(rw - 6, rh - 18, str)
	draw_set_halign(fa_left)
	}
	
	}

	if (!fullscreen && show_layers) {
		// Marker position
		if (theme != 3) draw_set_halign(fa_right)
		draw_theme_color()
		if (!isplayer) {
		draw_theme_font(font_info_med_bold)
		if (theme != 3) draw_text(93, 52, time_str(marker_pos / tempo))
		else draw_text(93 - 84, 52, time_str(marker_pos / tempo))
		} else {
		draw_theme_font(font_info_big)
		if (theme != 3) draw_text(rw / 2 + 70, rh / 2 - 50, time_str(marker_pos / tempo))
		else draw_text(rw / 2 - 134 + 70, rh / 2 - 50, time_str(marker_pos / tempo))
		}

		// Song length
		if (!isplayer) {
		draw_theme_font(font_small)
		if (theme != 3) draw_text(93, 69, "/ " + time_str(enda / tempo))
		else draw_text(93 - 67, 69, "/ " + time_str(enda / tempo))
		} else {
		draw_theme_font(font_info_med)
		if (theme != 3) draw_text(rw / 2 + 70, rh / 2 - 20, "/ " + time_str(enda / tempo))
		else draw_text(rw / 2 - 91 + 70, rh / 2 - 20, "/ " + time_str(enda / tempo))
		}
		draw_theme_font(font_main)
		
		if (isplayer) {
			draw_theme_color()
			if (theme = 3) {
				draw_set_color(make_color_rgb(154, 154, 154))
				if (fdark) draw_set_color(make_color_rgb(134, 134, 134))
			}
			draw_rectangle(rw / 2 - 200, rh / 2 + 25, rw / 2 + 200, rh / 2 + 25 + 2 + (theme = 3), 0)
			draw_set_alpha(0.5)
			if (theme = 3) {
				draw_rectangle(rw / 2 - 200 - 1, rh / 2 + 25 + 1, rw / 2 + 200 + 1, rh / 2 + 25 + 2, 0)
				draw_set_alpha(1)
				draw_set_color(accent[5])
				draw_rectangle(rw / 2 - 200, rh / 2 + 25, floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 2 + (theme = 3), 0)
				draw_set_alpha(0.5)
				draw_rectangle(rw / 2 - 200 - 1, rh / 2 + 25 + 1, floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 2, 0)
			}
			draw_set_alpha(1)
			a = (mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) || mouse_rectangle(rw / 2 - 200 - 3, rh / 2 + 25 + 1 - 3, 400 + 6, 6 + (theme = 3)) && window = 0)
			if (theme != 3) {
				draw_sprite(spr_icons, 9, rw / 2 - 200 + (marker_pos / enda) * 400 - 12, rh / 2 + 25 + 1 - 11)
			} else {
				// draw_sprite_ext(spr_icons_d, 9, rw / 2 - 200 + (marker_pos / enda) * 400 - 12, rh / 2 + 25 + 1 - 11, 1, 1, 0, accent[5], 1)
				draw_set_color(c_white)
				if (fdark) draw_set_color(make_color_rgb(69, 69, 69))
				draw_set_alpha(0.5)
				draw_circle(floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 1, 11, 0)
				draw_set_alpha(1)
				draw_circle(floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 1, 10, 0)
				draw_set_color(accent[5 + mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) * (!mouse_check_button(mb_left)) - ((mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) || aa) && mouse_check_button(mb_left))])
				draw_set_alpha(0.5)
				draw_circle(floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 1, 6 + mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) * (!mouse_check_button(mb_left)) - ((mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) || aa) && mouse_check_button(mb_left)), 0)
				draw_set_alpha(1)
				draw_circle(floor(rw / 2 - 200 + (marker_pos / enda) * 400 + 0.5), rh / 2 + 25 + 1, 5 + mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) * (!mouse_check_button(mb_left)) - ((mouse_rectangle(rw / 2 - 200 + (marker_pos / enda) * 400 - 6, rh / 2 + 25 + 1 - 6, 13, 13) || aa) && mouse_check_button(mb_left)), 0)
			}
			draw_theme_color()
			if (a || aa) {
				curs = cr_handpoint
				if (mouse_check_button(mb_left)) {
					curs = cr_drag
					aa = 1
					if (mouse_x >= rw / 2 - 200 && mouse_x <= rw / 2 + 200) {
						marker_pos = ((mouse_x - (rw / 2 - 200)) / 400) * enda
					} else if (mouse_x <= rw / 2 - 200) {
						marker_pos = 0
					} else if (mouse_x >= rw / 2 + 200) {
						marker_pos = enda
					}
				}
				if (mouse_check_button_released(mb_left)) aa = 0
			}
			draw_set_halign(fa_left)
			draw_theme_font(font_info_med)
			draw_text(rw / 2 - 200, rh / 2 - 80, condstr(filename != "-player", filename_name(filename)) + condstr((filename = "" || filename = "-player") && midiname != "", midiname))
			draw_theme_font(font_main)
		}

		if (!isplayer) {
		// Bars-beats-sixteenths
		draw_sprite(spr_tempobox, 2 * (theme = 3) + 2 * (fdark && theme = 3), 184, 57)
		draw_set_halign(fa_right)
		draw_text(215, 60, ".")
		draw_text(230, 60, ".")
		draw_text(210, 60, floor(marker_pos / (timesignature * 4)) + 1)
		draw_text(225, 60, floor((marker_pos / 4) mod timesignature) + 1)
		draw_text(240, 60, floor(marker_pos mod 4) + 1)
		popup_set(184, 57, 64, 22, "Position of the marker in bars, beats and sixteenths.")

		// Tempo
		draw_set_halign(fa_center)
		if (use_bpm) {
			draw_sprite(spr_tempobox, 1 + 2 * (theme = 3) + 2 * (fdark && theme = 3), 101, 57)
		} else {
			draw_sprite(spr_tempobox, 2 * (theme = 3) + 2 * (fdark && theme = 3), 108, 57)
		}
		
		if (window != w_settempo) {
		if (use_bpm) {
			bpm = tempo * 15
			draw_text(136, 60, string_format(bpm, 4, 2) + " BPM")
			popup_set(108, 57, 64, 22, "Tempo of the song (measured in beats per minute).\nClick and drag to change. Click to enter value. Right-click for more options.")
		} else {
			draw_text(136, 60, string_format(tempo, 4, 2) + " t / s")
			popup_set(108, 57, 64, 22, "Tempo of the song (measured in ticks per second).\nClick and drag to change. Click to enter value. Right-click for more options.")
		}
		draw_set_halign(fa_left)
		a = mouse_rectangle(108, 57, 64, 22)
		var bpm_multiplier = use_bpm ? 15 : 1
		if (a && window = 0) {
			curs = cr_handpoint
			
			// Input
			if (mouse_check_button_released(mb_left)) {
		        window = w_settempo
				text_exists[100] = 0
				text_focus = 100
			}
			// Drag
		    if (mouse_check_button(mb_left) && (mouse_x != mouse_xprev || mouse_y != mouse_yprev)) { // this condition is met as soon as mouse down, window changes, and the block above never runs
		        curs = cr_size_ns
				tempodrag = tempo
		        window = w_dragtempo
			}

		    if (mouse_check_button_pressed(mb_right)) {
				menu = show_menu_ext("tempo", mouse_x, mouse_y, check(!use_bpm) + "Ticks per second (t/s)|" +
																check(use_bpm) + "Beats per minute (BPM)|-|" +
																check(tempo = 10) + string(10 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 12) + string(12 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 14) + string(14 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 16) + string(16 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 18) + string(18 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 20) + string(20 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 30) + string(30 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|" +
																check(tempo = 60) + string(60 * bpm_multiplier) + condstr(use_bpm, " BPM", " t/s") + "|-|" +
																"Tempo tapper...")
			}
		}
		if (window = w_dragtempo) {
		    curs = cr_size_ns
		    tempodrag += 0.25 * (mouse_yprev - mouse_y) / 3
		    tempodrag = median(0.25, tempodrag, 60)
		    a = tempo
		    tempo = floor(tempodrag * 4) / 4
		    if (a != tempo) changed = 1
		    if (!mouse_check_button(mb_left)) window = w_releasemouse
		}
		}
		}
		draw_set_halign(fa_left)
	}

	// Piano
	if (!fullscreen && show_piano && !isplayer) {
		draw_piano(floor(rw / 2 - (keysshow * 39) / 2), rh - 154, keysshow, totalcols)
		if (mouse_rectangle(floor(rw / 2 - (keysshow * 39) / 2), rh - 162, keysshow * 39, 136) && window = 0) curs = cr_handpoint
	}

	// End selecting
	if (select > 0) {
	    if (!mouse_check_button(mb_left) && select = 1) {
	        selection_add(select_pressa, select_pressb, selbx, selby, keyboard_check(vk_alt), 0)
	        window = w_releasemouse
	        select = 0
	        select_pressx = -1
	        select_pressy = -1
	        select_pressa = -1
	        select_pressb = -1
	    }
	    if (select = 2) curs = cr_handpoint
	    if (!mouse_check_button(mb_right) && select = 2) {
	        selection_remove(select_pressa, select_pressb, selbx, selby, 0, 0)
	        window = w_releasemouse
	        select = 0
	        select_pressx = -1
	        select_pressy = -1
	        select_pressa = -1
	        select_pressb = -1
	    }
	}

	if (mouse_check_button_released(mb_left)) {
	    w_isdragging = 0
	}
	if (window = w_releasemouse && !mouse_check_button(mb_left)) {window = 0 windowopen = 0}
	draw_windows()
	if (showmsg) draw_msg()
	if (rainbowtoggle) draw_accent_rainbow()
	if (lastfile != dndfile && dndfile != "") {load_song(dndfile) lastfile = dndfile}

	// Draw update progress bar
	if (update == 4) {
		window = -1
		draw_downloadprogress("Update", "Downloading update...", downloaded_size, total_size)
	}
	
	window_set_cursor(curs)
	mouse_xprev = mouse_x
	mouse_yprev = mouse_y

	

}
