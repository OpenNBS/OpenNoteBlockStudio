// save_settings()
var a, b;
buffer = buffer_create(8, buffer_grow, 1)

buffer_write_byte(69) // Couldn't choose zero as the old format had the same bytes when the recent file list was empty. Decided to use le epik funny number 69 instead.
buffer_write_byte(69)
buffer_write_byte(settings_version)

// Recent songs
for (a = 0; a < 11; a += 1) {
	buffer_write_string(recent_song[a]);
    buffer_write_double(recent_song_time[a])
}
// Preferences
buffer_write_byte(check_update)
buffer_write_byte(show_welcome)
buffer_write_byte(theme)
buffer_write_string(songfolder);
buffer_write_byte(show_numbers)
buffer_write_byte(show_octaves)
buffer_write_byte(draw_type)
buffer_write_byte(show_keynames)
buffer_write_byte(show_keyboard)
buffer_write_byte(show_notechart)
buffer_write_byte(keysmax)
buffer_write_byte(mousewheel)
buffer_write_byte(changepitch)
buffer_write_byte(select_lastpressed)
buffer_write_byte(marker_follow)
buffer_write_byte(marker_pagebypage)
buffer_write_byte(marker_start)
buffer_write_byte(marker_end)
buffer_write_byte(0)
buffer_write_byte(0)
buffer_write_byte(realvolume)

// Midi import settings
buffer_write_byte(w_midi_remember)
buffer_write_byte(w_midi_removesilent)
buffer_write_byte(w_midi_name)
buffer_write_byte(w_midi_name_patch)
buffer_write_byte(w_midi_maxheight)
buffer_write_byte(w_midi_tempo)
buffer_write_byte(w_midi_octave)
// instruments
for (a = 0; a < 128; a += 1) {
    buffer_write_byte(midi_ins[a, 1]) // Instrument
    buffer_write_byte(midi_ins[a, 2]) // Octave
}
// drums
for (a = 24; a < 88; a += 1) {
    buffer_write_byte(midi_drum[a, 1]) // Instrument
    buffer_write_byte(midi_drum[a, 2]) // Key
}
// Midi export settings
buffer_write_byte(0) // w_midiexp_remember
buffer_write_byte(0) // w_midiexp_layers
buffer_write_byte(0) // w_midiexp_open
for (a = 0; a < 14; a += 1) {
    buffer_write_byte(0) // w_midiexp_patch[a]
    buffer_write_byte(0) // w_midiexp_kind[a]
    buffer_write_byte(0) // w_midiexp_oct[a]
}
buffer_write_byte(0) // w_midiexp_ignored

// Schematic export settings
buffer_write_byte(sch_exp_walkway_block)
buffer_write_byte(sch_exp_walkway_data)
buffer_write_byte(sch_exp_circuit_block)
buffer_write_byte(sch_exp_circuit_data)
buffer_write_byte(sch_exp_ground_block)
buffer_write_byte(sch_exp_ground_data)
buffer_write_byte(sch_exp_layout)
buffer_write_byte(sch_exp_notesperrow)
buffer_write_byte(sch_exp_includelocked)
buffer_write_byte(sch_exp_compress)
buffer_write_byte(sch_exp_loop)
buffer_write_byte(sch_exp_glass)
buffer_write_byte(sch_exp_minecart)
buffer_write_byte(sch_exp_chest)
for (a = 0; a < 34; a += 1) {
    buffer_write_byte(sch_exp_ins_block[a])
    buffer_write_byte(sch_exp_ins_data[a])
}

// Keyboard keys
for (a = 0; a < 88; a += 1) buffer_write_short(piano_key[a])
// Warnings
buffer_write_byte(warning_octaves)
buffer_write_byte(warning_instrument)
buffer_write_byte(warning_schematic)
// 3.1.1+
buffer_write_string_int(version)
buffer_write_byte(sch_exp_minecraft_old)
buffer_write_byte(soundsystem)
// OpenNBS Features
buffer_write_byte(refreshrate)
buffer_write_byte(fade)
buffer_write_byte(realstereo)
buffer_write_byte(show_piano)
buffer_write_byte(rhval)
buffer_write_byte(w_midi_vel)
buffer_write_string(patternfolder)
buffer_write_byte(looptobarend)
buffer_write_byte(sch_exp_stereo)
buffer_write_byte(sch_exp_velocity)
buffer_write_byte(sch_exp_circuitry)
buffer_write_byte(sch_exp_vertical)
buffer_write_byte(sch_exp_chords)
buffer_write_byte(sch_br_layer1)
buffer_write_byte(sch_br_layer2)
buffer_write_byte(sch_br_layer3)
buffer_write_short(sch_exp_range_start)
buffer_write_short(sch_exp_range_end)

buffer_export(buffer, data_directory + "settings.onbs")
buffer_delete(buffer)
return 1
