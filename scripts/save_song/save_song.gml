function save_song() {
	// save_song(fn[, backup])
	var fn, backup, nbsver, f, a, ca, cb, fsave;
	fn = argument[0]
	backup = false
	if (argument_count > 1) {
		backup = argument[1]
	}
	if ((!backup) && (fn = "" || filename_ext(filename) != ".nbs")) {
	    playing = 0
	    fsave = filename_name(filename)
	    if (!directory_exists_lib(songfolder)) songfolder = songs_directory
	    fn = string(get_save_filename_ext("Note Block Songs (*.nbs)|*.nbs", fsave + condstr(filename_ext(filename) != ".nbs", ".nbs"), songfolder, condstr(language !=1, "Save song", "保存歌曲")))
		fn = fn + condstr(filename_ext(fn) != ".nbs", ".nbs")
		show_debug_message(string_char_at(fn, string_length(fn) - 3))
	    if (fn = "") return 0
	}
	if ((!backup) && (selected > 0)) selection_place(0)

	if (backup) {
		nbsver = nbs_version
	} else {
		nbsver = save_version
	}

	buffer = buffer_create(8, buffer_grow, 1)

	if nbsver >= 1 {
	//First 2 bytes 0 to indicate new nbs format
	buffer_write_short(0)

	buffer_write_byte(nbsver)
	buffer_write_byte(first_custom_index)
	}

	if nbsver = 0 || nbsver >= 3 {
	//song length (ticks)
	buffer_write_short(enda)
	}

	//layer count
	buffer_write_short(endb2)

	buffer_write_string_int(song_name)
	buffer_write_string_int(song_author)
	buffer_write_string_int(song_orauthor)
	buffer_write_string_int(song_desc)

	buffer_write_short(tempo * 100)
	// Per-song auto-save is deprecated. It is only written to
	// the file to preserve auto-save behavior on older versions
	buffer_write_byte(autosave)
	buffer_write_byte(autosavemins)
	buffer_write_byte(timesignature)

	buffer_write_int(floor(work_mins))
	buffer_write_int(work_left)
	buffer_write_int(work_right)
	buffer_write_int(work_add)
	buffer_write_int(work_remove)

	buffer_write_string_int(song_midi)

	if nbsver >= 4 {
	buffer_write_byte(loop)
	buffer_write_byte(loopmax)
	buffer_write_short(loopstart)
	}

	ca = 0
	for (a = 0; a <= enda; a += 1) {
	    ca += 1
	    if (colamount[a] > 0) {
	        buffer_write_short(ca)
	        ca = 0
	        cb = 0
	        for (b = 0; b <= collast[a]; b += 1) {
	            cb += 1
	            if (song_exists[a, b]) {
	                buffer_write_short(cb)
	                cb = 0
	                buffer_write_byte(ds_list_find_index(instrument_list, song_ins[a, b]))
	                buffer_write_byte(song_key[a, b])
					if nbsver >= 4 {
					buffer_write_byte(song_vel[a, b])
					buffer_write_byte(song_pan[a, b])
					buffer_write_short(song_pit[a, b])
					}
	            }
	        }
	        buffer_write_short(0)
	    }
	}
	buffer_write_short(0)
	// Layer names
	for (b = 0; b < endb2; b += 1) {
	    buffer_write_string_int(layername[b])
		if nbsver >= 4 {
		buffer_write_byte(layerlock[b])
		}
	    buffer_write_byte(layervol[b])
		if nbsver >= 2 {
		buffer_write_byte(layerstereo[b])
		}
	}

	// Custom instruments
	buffer_write_byte(user_instruments)
	for (b = 0; b < ds_list_size(instrument_list); b++) {
	    var ins = instrument_list[| b];
	    if (ins.user) {
	        buffer_write_string_int(ins.name)
	        buffer_write_string_int(ins.filename)
	        buffer_write_byte(ins.key)
	        buffer_write_byte(ins.press)
	    }
	}
	buffer_export(buffer, fn)
	buffer_delete(buffer)

	if (!backup) {
		filename = fn
		changed = false
		if (autosave) tonextsave = autosavemins
		add_to_recent(fn)
		if (language != 1) set_msg("Song saved")
		else set_msg("歌曲已保存")
	} else {
		tonextbackup = backupmins
	}

	return true



}
