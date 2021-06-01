function control_step() {
	update_window()
	if (presence = 1 && obj_presence.ready = true) {
		if (presencewindow = 1) {
			np_setpresence(condstr(filename = "", "Unsaved song") + condstr(filename != "", "Editing ") + filename_name(filename), 
			condstr(window = 0 || window = w_menu || window = w_dragtempo || window = w_dragsection_start || window = w_dragsection_end || window = w_dragstereo || window = w_dragvol || window = w_dragmarker, "Editor") + 
			condstr(window = w_greeting, "Welcome Menu") + 
			condstr(window = w_songinfo, "Song Info") + 
			condstr(window = w_songinfoedit, "Song Info") + 
			condstr(window = w_preferences, "Preferences") + 
			condstr(window = w_midi, "MIDI Import") + 
			condstr(window = w_schematic_export, "Schematic Export") + 
			condstr(window = w_datapack_export, "Datapack Export") + 
			condstr(window = w_instruments, "Instrument Settings") + 
			condstr(window = w_stats, "Song Stats") + 
			condstr(window = w_properties, "Song Properties") + 
			condstr(window = w_about, "About") + 
			condstr(window = w_minecraft, "Minecraft Compatibility") + 
			condstr(window = w_update, "Changelist") + 
			condstr(window = w_changelist, "Changelist") + 
			condstr(window = w_mididevices, "MIDI Device Manager") + 
			condstr(window = w_clip_editor, "Secret Clipboard Editor") + 
			condstr(window = w_stereo, "Sterio") + 
			condstr(window = w_arpeggio, "Arpeggio") + 
			condstr(window = w_tremolo, "Tremolo") + 
			condstr(window = w_stagger, "Stagger") + 
			condstr(window = w_portamento, "Portamento") + 
			condstr(window = w_saveoptions, "Save Options") + 
			condstr(window = w_setvelocity, "Set Velocity") + 
			condstr(window = w_setpanning, "Set Panning") + 
			condstr(window = w_setpitch, "Set Pitch") + 
			condstr(window = w_branch_export, "Branch Schematic Export") + 
			condstr(window = w_settempo, "Set Tempo"), "note", "");
		} else {
			np_setpresence(condstr(filename = "", "Unsaved song") + condstr(filename != "", "Editing ") + filename_name(filename), "", "note", "");
		}
	} else {
		np_clearpresence()
	}
}
