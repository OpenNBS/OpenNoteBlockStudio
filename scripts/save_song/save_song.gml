// save_song(fn)
var fn, f, a, ca, cb, fsave;
fn = argument0
if (fn = "" || filename_ext(filename) != ".nbs") {
    playing = 0
    fsave = filename_name(filename)
    if (!directory_exists(songfolder)) songfolder = songs_directory
    fn = string(get_save_filename_ext("Note Block Songs (*.nbs)|*.nbs", fsave, songfolder, "Save song"))
    if (fn = "") return 0
}
if (selected > 0) selection_place(0)
buffer = buffer_create(8, buffer_grow, 1)

if save_version >= 1 {
//First 2 bytes 0 to indicate new nbs format
buffer_write_short(0)

buffer_write_byte(save_version)
buffer_write_byte(first_custom_index)
}

if save_version = 0 || save_version >= 3 {
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
buffer_write_byte(autosave)
buffer_write_byte(autosavemins)
buffer_write_byte(timesignature)

buffer_write_int(floor(work_mins))
buffer_write_int(work_left)
buffer_write_int(work_right)
buffer_write_int(work_add)
buffer_write_int(work_remove)

buffer_write_string_int(song_midi)

if save_version >= 4 {
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
				if save_version >= 4 {
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
	if save_version >= 4 {
	buffer_write_byte(layerlock[b])
	}
    buffer_write_byte(layervol[b])
	if save_version >= 2 {
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
filename = fn
changed = false
if (autosave) tonextsave = autosavemins
add_to_recent(fn)

return true
