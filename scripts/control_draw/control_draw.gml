// control_draw()
var a, b, c, d, e, p, l, s, exist, str, str2, m, xx, x1, y1, x2, y2, showmenu, rw, rh, totalcols, totalrows, compx
rw = window_width
rh = window_height
curs = cr_default
showmenu = 0
cursmarker = 0
compx = 120
window_set_caption(condstr(filename = "", "Unsaved song") + filename_name(filename) + condstr(changed && filename != "", "*") + " - Minecraft Note Block Studio")
draw_set_alpha(1)
draw_theme_color()
draw_set_font(fnt_main)
editline += 1
if refreshrate = 1 game_set_speed(60,gamespeed_fps)
if (editline > 60) editline = 0
if (delay > 0) delay -= 1 / (room_speed / 20)
if (delay < 0) delay = 0
work_mins += 1 / (room_speed * 60)

remove_emitters()

if (selected = 0) {
	if((tempo = 10 || tempo = 5 ||tempo = 2.5) && (block_outside = 0 && block_custom = 0))compatible = 1
	else if ((tempo <= 20) && (block_outside = 0 && block_custom = 0))compatible = 2
	else compatible = 0	
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
    } else if (keyboard_check_pressed(vk_anykey)) {
        piano_key[key_edit] = keyboard_lastkey
        key_edit = -1
    }
}

if (autosave && filename_ext(filename) = ".nbs") {
    tonextsave -= 1 / room_speed / 60
    if (tonextsave <= 0) save_song(filename)
}

if (theme = 0) window_background = 15790320
if (theme = 1) window_background = 13160660
if (theme = 2) window_background = c_dark
draw_clear(window_background)

// Calculate area
totalcols = floor((rw - 198) / 32)
if show_piano = 1 {
	rhval = 270
}
totalrows = floor((rh - rhval) / 32)
if (min(keysmax, floor((rw - 32) / 39)) != keysshow) {
    startkey = 27 - floor(min(keysmax, floor((rw - 32) / 39)) / 2)
    sharpkeys = 0
    for (a = 0; a < startkey; a += 1) {
        b = a mod 7
        if (b != 1 && b != 4) sharpkeys += 1
    }
}
keysshow = min(keysmax, floor((rw - 32) / 39))
x1 = 192
y1 = 52
if ((window = 0 || select > 0) && playing = 0) {
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
if ((sela > -1 && selb > -1) || select > 0) {
    if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) clickinarea = 1
    selbx = starta + sela
    selby = startb + selb
    if (select = 0 && selected = 0 && selbx < arraylength && selby < arrayheight) {
        exist = song_exists[selbx, selby]
        if (exist && cursmarker = 0) {
            if (changepitch && ((mouse_wheel_up() && song_key[selbx, selby] < 87) || (mouse_wheel_down() && song_key[selbx, selby] > 0))) {
                change_block_manual(selbx, selby, song_ins[selbx, selby], song_key[selbx, selby] + mouse_wheel_up() - mouse_wheel_down())
            }
        }
    }
}
if (mousewheel = 1 && window = 0 && (exist = 0 || changepitch = 0)) {
    var insindex = ds_list_find_index(instrument_list, instrument)
    if (mouse_wheel_down() && insindex > 0) {
        insindex--
        instrument = instrument_list[| insindex]
        play_sound(instrument, selected_key, 1,100)
    }
    if (mouse_wheel_up() && insindex < ds_list_size(instrument_list) - 1) {
        insindex++
        instrument = instrument_list[| insindex]
        play_sound(instrument, selected_key, 1,100)
    }
}
if (mousewheel = 2 && window = 0 && (exist = 0 || changepitch = 0)) {
    if (mouse_wheel_down() && selected_key > 0) {
        selected_key -= 1
        play_sound(instrument, selected_key, 1,100)
    }
    if (mouse_wheel_up() && selected_key < 87) {
        selected_key += 1
        play_sound(instrument, selected_key, 1,100)
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
for (a = 0; a < totalcols; a += 1) {
    draw_set_alpha(0.1)
    if (starta + a) / timesignature = floor((starta + a) / timesignature) draw_set_alpha(0.25)
    draw_line(x1 + 2 + 32 * a, y1 + 34, x1 + 2 + 32 * a, y1 + 34 + totalrows * 32)
    for (b = 0; b < totalrows; b += 1) {
        if (starta + a <= enda) {
            if (startb + b <= endb) {
                if (colamount[starta + a] > 0) {
                    if (startb + b >= colfirst[starta + a] && startb + b <= collast[starta + a]) {
                        if (song_exists[starta + a, startb + b]) {
                            s = 0 // Selected
                            if (fade=0) c = 0.5
							else c = 1
                            if (lockedlayer[startb + b] = 0) c += 0.5 * (1 - (min(1000, current_time - song_played[starta + a, startb + b]) / 1000))
                            if (playing = 0) {
                                if (select = 1 && lockedlayer[startb + b] = 0) {
                                    s = (starta + a >= min(select_pressa, selbx) && starta + a <= max(select_pressa, selbx) && startb + b >= min(select_pressb, selby) && startb + b <= max(select_pressb, selby))
                                }
                                if (fade=0) c += ((selbx = starta + a && selby = startb + b && select = 0 && window = 0  && cursmarker = 0) || s) * 0.5
                            }
                            draw_block(x1 + 2 + 32 * a, y1 + 34 + 32 * b, song_ins[starta + a, startb + b], song_key[starta + a, startb + b], c, s * 0.8)
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
    xx = floor(marker_pos)
    if (colamount[xx] > 0) {
        for (b = colfirst[xx]; b <= collast[xx]; b += 1) {
            if (song_exists[xx, b]) {
                a = 1
                c = 100
				d = 100
                if (b < endb2) {
					c = layervol[b]
					d = layerstereo[b]
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
                    if (song_ins[xx, b].loaded) play_sound(song_ins[xx, b], song_key[xx, b], c / 100,d)
                    if (song_ins[xx, b].press) key_played[song_key[xx, b]] = current_time
                    song_played[xx, b] = current_time
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
                    change_block_manual(selbx, selby, instrument, selected_key)
                } else {
                    add_block_manual(starta + sela, startb + selb, instrument, selected_key)
                    draw_set_halign(fa_center)
                    draw_block(x1 + 2 + 32 * sela, y1 + 34 + 32 * selb, instrument, selected_key, 0.5, 0)    
					draw_theme_color()
                    draw_set_halign(fa_left)
                    draw_set_alpha(1)
                }
            }
        } else {
            if (select = 0) selection_place(0)
        }
        dontplace = 0
    }
    if (mouse_check_button(mb_right)) {
        if ((starta + sela != select_pressa || startb + selb != select_pressb) && select_pressx != -1) {
            select = 2
        } else if (exist = 1) {
            remove_block_manual(selbx, selby)
            select_pressx = -1
        }
    }
    if (mouse_check_button_released(mb_right)) {
        if (starta + sela = select_pressa && startb + selb = select_pressb && select_pressx != -1) {
            str = ""
            customstr = ""
            for (a = 0; a < ds_list_size(instrument_list); a += 1) {
                var ins = instrument_list[| a];
                if (ins.user)
                    customstr += "...to " + clean(ins.name) + "|"
                else
                    str += "...to " + clean(ins.name) + "|"
            }
            menu = show_menu_ext("editext", mouse_x, mouse_y, inactive(selected = 0) + icon(icons.COPY - (selected = 0)) + "Ctrl+C$Copy|"+
                                      inactive(selected = 0) + icon(icons.CUT - (selected = 0)) + "~Ctrl+X$Cut|"+
                                      inactive(selection_copied = "") + icon(icons.PASTE - (selection_copied = "")) + "~Ctrl+V$Paste|"+
                                      inactive(selected = 0) + icon(icons.DELETE - (selected = 0)) + "~Delete$Delete|-|"+
                                      inactive(totalblocks = 0) + "Ctrl+A$Select all|"+
                                      inactive(selected = 0) + "Ctrl + Shift+A$Deselect all|"+
                                      inactive(selected = 0 && totalblocks = 0) + "Ctrl+I$Invert selection|-|"+
                                      inactive(totalblocks = 0 || selbx >= enda) + "Select all to the right ->|"+
                                      inactive(totalblocks = 0 || selbx <= 0) + "Select all to the left <-|-|"+
                                      inactive(instrument.num_blocks = 0) + "Select all " + clean(instrument.name) + "|"+
                                      inactive(instrument.num_blocks = totalblocks) + "Select all but " + clean(instrument.name) + "|-|"+
                                        inactive(selected = 0) + "Ctrl+E$Increase octave|"+
                                        inactive(selected = 0) + "Ctrl+D$Decrease octave|"+
                                        inactive(selected = 0) + "Ctrl+R$Increase key|"+
                                        inactive(selected = 0) + "Ctrl+F$Decrease key|"+
                                        inactive(selected = 0) + "Change instrument...|\\|" + str + condstr(customstr != "", "-|")  + customstr + "/|-|"+
                                        inactive(selected = 0 || selection_l = 0) + "Expand selection|"+
                                        inactive(selected = 0 || selection_l = 0) + "Compress selection|"+
                                        inactive(selected = 0) + "Transpose notes outside octave range")
            menu.menuc = selbx
            menu.pastex = selbx
            menu.pastey = selby
        }
    }
}
// Keyboard shortcuts
if (window = 0 && text_focus = -1) {
    if (playing = 0) {
        if (keyboard_check(vk_control)) {
            if (keyboard_check_pressed(ord("N"))) new_song()
            if (keyboard_check_pressed(ord("O"))) load_song("")
            if (keyboard_check_pressed(ord("S"))) save_song(filename)
            if (keyboard_check_pressed(ord("A"))) select_all(-1, 0)
            if (keyboard_check_pressed(ord("A")) && keyboard_check(vk_shift)) selection_place(0)
            if (keyboard_check_pressed(ord("I"))) selection_invert()
            if (keyboard_check_pressed(ord("C"))) action_copy()
            if (keyboard_check_pressed(ord("X"))) action_cut()
            if (keyboard_check_pressed(ord("V"))) {
                if (selbx > -1 && selby > -1) action_paste(selbx, selby)
                else action_paste(starta, startb)
            }
            if (keyboard_check_pressed(ord("Z"))) action_undo()
            if (keyboard_check_pressed(ord("Y"))) action_redo()
            if (keyboard_check_pressed(ord("E"))) selection_changekey(12)
            if (keyboard_check_pressed(ord("D"))) selection_changekey(-12)
            if (keyboard_check_pressed(ord("R"))) selection_changekey(1)
            if (keyboard_check_pressed(ord("F"))) selection_changekey(-1)
        }
        if (keyboard_check_pressed(vk_delete) && selected > 0) selection_delete(0)
        if (sb_sel = 0) {
            if (keyboard_check_pressed(vk_home)) starta = 0
            if (keyboard_check_pressed(vk_end)) starta = enda
            if (keyboard_check_pressed(vk_pageup)) starta += totalcols
            if (keyboard_check_pressed(vk_pagedown)) starta -= totalcols
            starta = median(0, starta, enda)
            sb_val[0] = starta
        }
        if (sb_sel = 1) {
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
    if (keyboard_check_pressed(vk_space)) toggle_playing(totalcols)
    if (keyboard_check_pressed(vk_f1)) {
        open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
    }
	// Instrument shortcuts
    if (keyboard_check(vk_control)) {
		
		//First 10 (only ctrl)
		if(!keyboard_check(vk_shift)){
		   for (a = 1; a <= 10; a++) {
             if (keyboard_check_pressed(ord(string(a % 10)))) {
                instrument = instrument_list[| a - 1]
                play_sound(instrument, selected_key, 1,100)
             }
           }
		}else{
		  //Last 6 (ctrl+shift)
		  for (a = 1; a <= 6; a++) {
			if (keyboard_check_pressed(ord(string(a % 10)))) {
				instrument = instrument_list[| a + 9]
				play_sound(instrument, selected_key, 1,100)
			}
		  }
	   }
	}
}
// Selecting note blocks
if (select > 0) {
    curs = cr_handpoint
    window = 0.1
    x2 = mouse_x
    y2 = mouse_y
    if (starta = 0) x2 = max(x1 + 2, mouse_x)
    if (startb = 0) y2 = max(y1 + 34, mouse_y)
    draw_set_color(c_blue)
    if (select = 2) draw_set_color(c_red)
    draw_set_alpha(0.25)
    draw_rectangle(select_pressx, select_pressy, x2, y2, 0)
    draw_set_alpha(1)
    draw_rectangle(select_pressx, select_pressy, x2, y2, 1)
    draw_theme_color()
}

// Timeline and markers
draw_sprite_ext(spr_timeline, 0 + theme = 2, x1 + 2, y1 + 2, totalcols * 32 + 20, 1, 0, -1, 1)
draw_set_font(fnt_small)
draw_set_halign(fa_left)
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
    b = (starta + a) / timesignature = floor((starta + a) / timesignature)
    draw_set_alpha(0.6)
    draw_line(x1 + 2 + 32 * a, y1 + 33, x1 + 2 + 32 * a, y1 + 30 - 3 * b)
    draw_set_alpha(1)
    if (b) {
        if (a > 0) draw_set_halign(fa_center)
        draw_text(x1 + 2 + 32 * a, y1 + 17, string(starta + a))
        draw_set_halign(fa_left)
    }
}
// Marker
if (playing = 1 || forward<>0) {
    if (playing = 1) marker_pos += (tempo / room_speed)
    if (forward != 0) {
        marker_pos += (tempo / room_speed) * (forward - (forward < 0 && playing = 1))
    }
	//loop song
	if (loop = 1 && marker_pos > enda + 1) {
        starta = 0
        marker_pos = starta
        sb_val[scrollbarh] = starta
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
        dragincxr += 0.1
        dragincxr = min(dragincxr, 4)
        starta += ceil(dragincxr)
    } else dragincxr = 0
    if (mouse_x < x1 + 32) {
        dragincxl += 0.1
        dragincxl = min(dragincxl, 4)
        starta -= ceil(dragincxl)
    } else dragincxl = 0
    if (mouse_y > y1 + 34 + totalrows * 32) {
        dragincyd += 0.1
        dragincyd = min(dragincyd, 4)
        startb += ceil(dragincyd)
    } else dragincyd = 0
    if (mouse_y < y1 + 34 + 32) {
        dragincyu += 0.1
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
    draw_rectangle(x1 + 2 + section_start * 32 - starta * 32, y1 + 2, x1 + 2 + section_end * 32 - starta * 32, y1 + 33, 0)
    draw_theme_color()
    draw_set_alpha(1)
    a = floor(section_start * 32 - starta * 32)
    draw_sprite(spr_marker, 2 + (section_end < section_start) * 2, x1 + 2 + a, y1 + 2)
    draw_sprite_ext(spr_marker, 3 + (section_end < section_start) * 2, x1 + 2 + a, y1 + 2, 1, totalrows * 2 + 5, 0, -1, 1)
    a = floor(section_end * 32 - starta * 32)
    draw_sprite(spr_marker, 4 - (section_end < section_start) * 2, x1 + 2 + a, y1 + 2)
    draw_sprite_ext(spr_marker, 5 - (section_end < section_start) * 2, x1 + 2 + a, y1 + 2, 1, totalrows * 2 + 5, 0, -1, 1)
}

marker_pos = median(0, marker_pos, enda + totalcols)
a = floor(marker_pos * 32 - starta * 32)
draw_sprite(spr_marker, 0 + 6 * (theme = 2), x1 + 2 + a, y1 + 2)
draw_sprite_ext(spr_marker, 1 + 6 * (theme = 2), x1 + 2 + a, y1 + 2, 1, totalrows * 2 + 6, 0, -1, 1)


draw_set_font(fnt_main)
draw_set_color(15790320)
if (theme = 1) draw_set_color(13160660)
if (theme = 2) draw_set_color(c_dark)
draw_rectangle(0, 0, x1, rh, 0)
draw_rectangle(0, 0, rw, y1, 0)
draw_rectangle(0, y1 + totalrows * 32 + 52, rw, rh, 0)
draw_rectangle(x1 + totalcols * 32 + 20, 0, rw, rh, 0)
draw_rectangle(x1 + totalcols * 32 + 2, y1 + totalrows * 32 + 32, x1 + totalcols * 32 + 2 + 17, y1 + totalrows * 32 + 32 + 18, 0)
draw_area(x1, y1, x1 + totalcols * 32 + 20, y1 + totalrows * 32 + 52)
draw_theme_color()
// Scrollbars
starta = draw_scrollbar(scrollbarh, 192, y1 + totalrows * 32 + 34, 32, totalcols - 1, enda + totalcols - 1, (exist && changepitch) || mousewheel > 0, 0)
startb = draw_scrollbar(scrollbarv, x1 + totalcols * 32 + 2, y1 + 34, 32, totalrows - 1, endb + totalrows - 1, (exist && changepitch) || mousewheel > 0, 0)

// Draw layers
for (b = 0; b < totalrows; b += 1) {
    x1 = 4
    y1 = 54 + 32 + b * 32 - 1
    draw_sprite(spr_layerbox, 0 + (theme = 2), x1, y1)
    // Name
    if (startb + b >= endb2) {
        layername[startb + b] = ""
        layerlock[startb + b] = 0
        layervol[startb + b] = 100
		layerstereo[startb + b] = 100
        rowamount[startb + b] = 0
        endb2 = startb + b + 1
    }
    m = mouse_rectangle(x1 + 10, y1 + 10, 75, 13)
    popup_set(x1 + 10, y1 + 10, 75, 13, "The name for this layer")
    
	draw_set_font(fnt_small)
    layername[startb + b] = draw_text_edit(100 + startb + b, layername[startb + b], x1 + 11, y1 + 10, 72, 14, 1, 0)
    if (layername[startb + b] = "") {
        draw_set_color(c_gray)
		if(theme = 2) draw_set_color(c_white)
        draw_text(x1 + 11, y1 + 10, "Layer " + string(startb + b + 1))
    }
    draw_theme_color()
    // Vol
    if (realvolume) {
        c = ((dragvolb = startb + b && window = w_dragvol) || (mouse_rectangle(x1 + 88, y1 + 5, 16, 25) && window = 0))
        if (startb + b >= endb2) {
            a = 100
        } else {
            a = layervol[startb + b]
        }
        draw_sprite(spr_volume, a / 30, x1 + 91, y1 + 11 - c * 5)
        popup_set(x1 + 90, y1 + 5, 12, 17, "Volume of this layer: " + string(a) + "%\n(Click and drag to change)")
        if (c) {
            draw_set_font(fnt_small)
            draw_set_halign(fa_center)
            draw_text(x1 + 98, y1 + 18, string(a) + "%")
            draw_set_halign(fa_left)
            draw_set_font(fnt_main)
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
        c = ((dragstereob = startb + b && window2 = w_dragstereo) || (mouse_rectangle(x1 + 108, y1 + 5, 16, 25) && window2 = 0))
        if (startb + b >= endb2) {
            a = 100
        } else {
            a = layerstereo[startb + b]
        }
        draw_sprite(spr_stereo, a / 50, x1 + 110, y1 + 11 - c * 5)
        popup_set(x1 + 110, y1 + 5, 12, 17, "Stereo Pan: " + string(a) + "%\n(Click and drag to change)")
        if (c) {
            draw_set_font(fnt_small)
            draw_set_halign(fa_center)
			if a > 100 {draw_text(x1 + 120, y1 + 18, "R " + string(a-100))}
			if a = 100 {draw_text(x1 + 120, y1 + 18, "MONO")}
			if a < 100 {draw_text(x1 + 120, y1 + 18, "L " + string((a-100)*-1))	}
            draw_set_halign(fa_left)
            draw_set_font(fnt_main)
            curs = cr_size_ns
            if (mouse_check_button_pressed(mb_left)) {
                window2 = w_dragstereo
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
    if (draw_layericon(2, x1 + 162 - !realvolume-realstereo * 10, y1 + 8, "Select all note blocks in this layer", 0, 0)) {
        playing = 0
        selection_place(0)
        selection_add(0, startb + b, enda, startb + b, 0, 0)
    }
}
if (window = w_dragvol) {
    dragvol += (mouse_yprev - mouse_y) * 2
    dragvol = median(0, dragvol, 100)
    layervol[dragvolb] = floor(dragvol / 10) * 10
    if (!mouse_check_button(mb_left)) {
        window = w_releasemouse
    }
}
if (window2 = w_dragstereo) {
    dragstereo += (mouse_yprev - mouse_y) * 2
    dragstereo = median(0, dragstereo, 200)
    layerstereo[dragstereob] = floor(dragstereo / 10) * 10
    if (!mouse_check_button(mb_left)) {
        window2 = w_releasemouse
		window2 = 0
    }
}
// Tabs
if (theme = 0) draw_sprite_ext(spr_tabbar, 0, 0, 0, rw, 1, 0, -1, 1)
tab_x = 1
if (draw_tab("File")) {
    str = ""
    for (b = 0; b < 11; b += 1) {
        if (recent_song[b] = "") break
        c = floor(date_second_span(recent_song_time[b], date_current_datetime()))
        str += seconds_to_str(c) + "$" + clean(filename_name(recent_song[b])) + "|"
    }
    show_menu_ext("file", 0, 19, icon(icons.NEW)+"Ctrl + N$New song|"+
                             icon(icons.OPEN)+"Ctrl+O$Open song...|Recent songs...|\\|" + str + condstr(recent_song[0] != "", "-|Clear recent songs") + condstr(recent_song[0] = "", "^!No recent songs") + "|/|-|"+
                             icon(icons.SAVE)+"Ctrl+S$Save song|"+
                             icon(icons.SAVE_AS)+"Save song as a new file...|-|"+
                             "Import from MIDI...|Import from Schematic...|-|"+
                             inactive(totalblocks = 0) + "Export as MP3...|"+
                             inactive(totalblocks = 0) + "Export as Schematic...|"+
							 inactive(totalblocks = 0) + "Export as Datapack...|-|" + 
                             "Alt + F4$Exit")
							
}
if (draw_tab("Edit")) {
    str = ""
    customstr = ""
    for (a = 0; a < ds_list_size(instrument_list); a += 1) {
        var ins = instrument_list[| a];
        if (ins.user)
            customstr += "...to " + clean(ins.name) + "|"
        else
            str += "...to " + clean(ins.name) + "|"
    }
    show_menu_ext("edit", 29, 19, inactive(historypos = historylen) + icon(icons.UNDO - (historypos = historylen)) + "Ctrl+Z$Undo|"+
                              inactive(historypos = 0) + icon(icons.REDO - (historypos = 0)) + "Ctrl+Y$Redo|-|"+
                              inactive(selected = 0) + icon(icons.COPY - (selected = 0)) + "Ctrl+C$Copy|"+
                              inactive(selected = 0) + icon(icons.CUT - (selected = 0)) + "Ctrl+X$Cut|"+
                              inactive(selection_copied = "") + icon(icons.PASTE - (selection_copied = "")) + "Ctrl+V$Paste|"+
                              inactive(selected = 0) + icon(icons.DELETE - (selected = 0)) + "Delete$Delete|-|"+
                              inactive(totalblocks = 0) + "Ctrl+A$Select all|"+
                              inactive(selected = 0) + "Ctrl+Shift + A$Deselect all|"+
                              inactive(selected = 0 && totalblocks = 0) + "Ctrl+I$Invert selection|-|"+
                              inactive(instrument.num_blocks = 0) + "Select all " + clean(instrument.name) + "|"+
                              inactive(instrument.num_blocks = totalblocks) + "Select all but " + clean(instrument.name) + "|-|"+
                                inactive(selected = 0) + "Ctrl+E$Increase octave|"+
                                inactive(selected = 0) + "Ctrl+D$Decrease octave|"+
                                inactive(selected = 0) + "Ctrl+R$Increase key|"+
                                inactive(selected = 0) + "Ctrl+F$Decrease key|"+
                                inactive(selected = 0) + "Change instrument...|\\|" + str + condstr(customstr != "", "-|") + customstr + "/|-|"+
                                inactive(selected = 0 || selection_l = 0) + "Expand selection|"+
                                inactive(selected = 0 || selection_l = 0) + "Compress selection|"+
                                inactive(selected = 0) + "Transpose notes outside octave range")
}
if (draw_tab("Settings")) {
    str = ""
    customstr = ""
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
    }
    show_menu_ext("settings", 59, 19, "Instrument|\\|" + str + "-|" + customstr + condstr(customstr != "", "-|") +
                        icon(icons.INSTRUMENTS)+"Instrument settings...|/|-|" + icon(icons.INFORMATION) + "Song info...|" + icon(icons.PROPERTIES) + "Song properties...|Song stats...|-|" + icon(icons.MIDI_INPUT) + "MIDI device manager|Preferences...")
}
if (draw_tab("Help")) {
    show_menu_ext("help", 109, 19, icon(icons.HELP) + "Tutorial videos|\\|Part 1: Composing note block music|Part 2: Opening MIDI files|Part 3: Importing songs into Minecraft|Part 4: Editing songs made in Minecraft     |-|F1$View all|/|-|" + icon(icons.INTERNET) + "Minecraft Forums topic...|Minecraft Wiki page...|-|Changelist...|About...|Github")
}

// Icons
draw_sprite(spr_iconbar, 0, 0, 20)
draw_sprite_ext(spr_iconbar, 1, 2, 20, (rw - 4), 1, 0, -1, 1)
draw_sprite(spr_iconbar, 2, rw - 2, 20)
xx = 6
if (draw_icon(icons.NEW, xx, "New song", 0, 0)) {new_song()} xx += 25
if (draw_icon(icons.OPEN, xx, "Open song", 0, 0)) {playing = 0 load_song("")} xx += 25
if (draw_icon(icons.SAVE, xx, "Save song", 0, 0)) {save_song(filename)} xx += 25 + 4
draw_separator(xx, 26) xx += 4
if (draw_icon(icons.PLAY + playing, xx, "Play / Pause song", 0, 0)) toggle_playing(totalcols)
xx += 25
if (draw_icon(icons.STOP, xx, "Stop song", 0, 0)) {playing = 0 marker_pos = 0 marker_prevpos = 0} xx += 25
forward = 0
if (draw_icon(icons.BACK, xx, "Rewind song", 0, 0)) {forward = -1} xx += 25
if (draw_icon(icons.FORWARD, xx, "Fast-forward song", 0, 0)) {forward = 1} xx += 25
if (draw_icon(icons.RECORD, xx, "Record key presses", 0, playing > 0 && record)) {playing = 0.25 record=!record} xx += 25 
if (draw_icon(icons.LOOP_INACTIVE + loop, xx, "Toggle looping", 0, 0)) loop = !loop
xx += 25 + 4
if (playing = 0) record = 0
draw_separator(xx, 26) xx += 4
for (a = 0; a < ds_list_size(instrument_list); a += 1) {
    var ins = instrument_list[| a];
    if (draw_icon(icons.INS_1 + a, xx, "Change instrument to " + ins.name, 0, instrument = ins)) {play_sound(ins, selected_key, 1,100) instrument = ins} xx += 25
}
xx += 4 draw_separator(xx, 26) xx += 4
while (1) {
if (draw_icon(icons.UNDO, xx, "Undo the last change", historypos = historylen, 0)) {playing = 0 action_undo()} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.REDO, xx, "Redo the last undo", historypos = 0, 0)) {playing = 0 action_redo()} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.COPY, xx, "Copy the selected note blocks", selected = 0, 0)) {playing = 0 action_copy()} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.CUT, xx, "Cut the selected note blocks", selected = 0, 0)) {playing = 0 action_cut()} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.PASTE, xx, "Paste the copied note blocks", selection_copied = "", 0)) {playing = 0 action_paste(starta, startb)} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.DELETE, xx, "Delete the selected note blocks", selected = 0, 0)) {playing = 0 action_delete()} xx += 25 if (xx > rw - 140) break
xx += 4 draw_separator(xx, 26) xx += 4 if (xx > rw - 140) break
if (draw_icon(icons.INFORMATION, xx, "View song info")) {playing = 0 window = w_songinfoedit} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.PROPERTIES, xx, "Edit song properties")) {playing = 0 window = w_properties} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.INSTRUMENTS, xx, "Edit instruments")) {playing = 0 window = w_instruments} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.MIDI_INPUT, xx, "MIDI device manager")) {playing = 0 window = w_mididevices} xx += 25 if (xx > rw - 140) break
xx += 4 draw_separator(xx, 26) xx += 4 if (xx > rw - 140) break
if (draw_icon(icons.HELP, xx, "Watch tutorial videos")) {
    open_url("http://www.youtube.com/playlist?list=PL7EA4F0D271DA6E86")
} xx += 25 if (xx > rw - 140) break
if (draw_icon(icons.INTERNET, xx, "Visit the Minecraft Forums topic")) {open_url(link_topic)} xx += 25 if (xx > rw - 140) break
break
}

// Compatible
draw_set_font(fnt_mainbold)
if(compatible = 0){
	draw_sprite(spr_minecraft, 1, rw - 130, 24)
	draw_set_color(c_red)
	draw_text(rw - 105, 28, "Not compatible")
	draw_theme_color()
	draw_set_font(fnt_main)
	popup_set(rw - compx, 24, compx, 25, "This song is not compatible with Minecraft.\n(Click for more info.)")

}else if (compatible = 2){
	compx = 155
	draw_sprite(spr_minecraft, 2, rw - 165, 24)
	draw_set_color(c_orange)
	draw_text(rw - 140, 28, "Datapack compatible")
	draw_theme_color()
	draw_set_font(fnt_main)
	popup_set(rw - compx, 24, compx, 25, "This song is compatible with Minecraft Datapacks.\n(Click for more info.)")

}else if(compatible = 1){
	draw_sprite(spr_minecraft, 0, rw - 120, 24)
	draw_set_color(c_green)
	draw_text(rw - 95, 28, "Compatible")
	draw_theme_color()
	draw_set_font(fnt_main)
	popup_set(rw - compx, 24, compx, 25, "This song is compatible with Minecraft.\n(Click for more info.)")
}


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
draw_text(xx, rh - 18, "Selected: " + string(selected) + " / " + string(totalblocks + selected)) xx += 120
draw_theme_color()

if (autosave && filename_ext(filename) = ".nbs") {
    draw_separator(xx, rh - 20)
    draw_theme_color()
    xx += 4
    draw_text(xx, rh - 18, "Next auto-save: " + string(ceil(tonextsave)) + " minute" + condstr(ceil(tonextsave)<>1, "s")) xx += 180
   // draw_separator(xx, rh - 20)
    draw_theme_color()
}


draw_set_halign(fa_right)
str = ""
for (a = 0; a < midi_devices; a += 1) str += condstr(a > 0, ", ") + midi_input_device_name(a)
if (midi_devices = 0) str = "No connected MIDI devices"
else str = "MIDI devices: " + str
draw_text(rw - 6, rh - 18, str)
draw_set_halign(fa_left)

// Marker position
draw_set_halign(fa_right)
draw_theme_color()
draw_set_font(fnt_info_med_bold)
draw_text(93, 52, time_str(marker_pos / tempo))

// Song length
draw_set_font(fnt_small)
draw_text(93, 69, "/ " + time_str(enda / tempo))
draw_set_font(fnt_main)

// Tempo
draw_sprite(spr_tempobox, 0, 108, 57)
draw_set_halign(fa_center)
draw_text(136, 60, string_format(tempo, 4, 2) + " t / s")
draw_set_halign(fa_left)
a = mouse_rectangle(108, 57, 64, 22)
popup_set(108, 57, 64, 22, "Tempo of the song (measured in ticks per second.)\nClick and drag to change. Right click to reset.")

if (a && window = 0) {
    curs = cr_size_ns
    if (mouse_check_button(mb_left)) {
        tempodrag = tempo
        window = w_dragtempo
    }
    if (mouse_check_button_pressed(mb_right)) tempo = 10
}
if (window = w_dragtempo) {
    curs = cr_size_ns
    tempodrag += 0.25 * (mouse_yprev - mouse_y) / 3
    tempodrag = median(0.25, tempodrag, 30)
    a = tempo
    tempo = floor(tempodrag * 4) / 4
    if (a != tempo) changed = 1
    if (!mouse_check_button(mb_left)) window = w_releasemouse
}

// Piano
draw_piano(floor(rw / 2 - (keysshow * 39) / 2), rh - 154, keysshow, totalcols)
if (mouse_rectangle(floor(rw / 2 - (keysshow * 39) / 2), rh - 162, keysshow * 39, 136) && window = 0) curs = cr_handpoint

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
if (window = w_releasemouse && !mouse_check_button(mb_left)) window = 0
draw_windows()
window_set_cursor(curs)
mouse_xprev = mouse_x
mouse_yprev = mouse_y
