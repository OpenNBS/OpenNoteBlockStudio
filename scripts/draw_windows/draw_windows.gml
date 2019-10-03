// draw_windows()

if (window = 0) return 0
key_edit = -1
switch (window mod w_menu) {
    case w_greeting: draw_window_greeting() break
    case w_songinfo: draw_window_songinfo() break
    case w_songinfoedit: draw_window_songinfo() break
    case w_preferences: draw_window_preferences() break
    case w_midi: draw_window_midi_import() break
    case w_schematic_export: draw_window_schematic_export() break
	case w_datapack_export: draw_window_datapack_export() break
	case w_mp3_export: draw_window_mp3_export() break
    case w_instruments: draw_window_instruments() break
    case w_stats: draw_window_stats() break
    case w_properties: draw_window_properties() break
    case w_about: draw_window_about() break
    case w_minecraft: draw_window_minecraft() break
    case w_update: draw_window_update() break
    case w_changelist: draw_window_update() break
    case w_mididevices: draw_window_mididevices() break
    case w_clip_editor: draw_window_clip_editor() break
}
