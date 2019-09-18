// midi_input_set_key(key, totalcols)

var key, d, k, keys, releases, c, b, totalcols;
key = argument0
totalcols = argument1
for (d = 0; d < midi_devices; d += 1) {
    if (!key_midipress[key]) {
        for (k = 0; k < midi_keys[d]; k += 1) {
            if (midi_input_key_press_note(d, k) = key + 21) {
                var ins, vel;
                ins = mididevice_instrument[d]
				vel = midi_input_key_press_velocity(d, k)
                if (ins < 0) ins = instrument
                if (playing = 0) play_sound(ins, key, vel ,100)
                if (select_lastpressed) selected_key = key
                if (playing = 0.25) toggle_playing(totalcols)
                if (playing && record) {
                    b = 0
                    while (!add_block_manual(ceil(marker_pos), b, ins, key, vel, 100)) b += 1
                    song_played[round(marker_pos), b] = current_time
                }
                key_midipress[key] = 1
                key_press[key] = 1
                break
            }
        }                
    } else {
        for (k = 0; k < midi_releases[d]; k += 1) {
            if (midi_input_key_release_note(d, k) = key + 21) {
                key_midipress[key] = 0
                key_press[key] = 0
                break
            }
        }
    }
            
}
