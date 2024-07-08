function load_song() {
	// load_song(fn [, backup])
	var fn, backup, file_ext
	fn = argument[0]
	backup = false
	if (argument_count > 1) {
		backup = argument[1]
	}
	if (confirm() < 0) return 0
	if (!backup && fn = "") {
	    if (!directory_exists_lib(songfolder)) songfolder = songs_directory
	    fn = string(get_open_filename_ext("Note Block Songs (*.nbs)|*.nbs|Zipped Files (*.zip)|*.zip|MIDI Sequences (*.mid)|*.mid;*.midi|Minecraft Schematics (*.schematic)|*.schematic", "", songfolder, condstr(language != 1, "Load song", "打开歌曲")))
	}
	if (fn = "" || !file_exists_lib(fn)) return 0

	// When not opening from auto-recovery, delete the backup file
	if (!backup) {
		backup_clear()
	}
	reset()
	file_ext = filename_ext(fn)
	if (file_ext = ".mid" || file_ext = ".midi") {
	    open_midi(fn)
	    return 1
	}
	else if (file_ext = ".schematic") {
	    open_schematic(fn)
	    return 1
	}
	else if (file_ext = ".zip") {
		try {
			open_song_zip(fn)
		} catch (e) {
			message(e, "Error")
			return 1;
		}
	}
	else if (file_ext = ".nbs") {
		open_song_nbs(fn)
	} else {
		message(condstr(language != 1, "Error: This file cannot be opened in this program.", "警告：本软件无法打开此类型文件。"), condstr(language != 1, "Error", "错误"))
		return 0;
	}
		
	if (!backup) {
		add_to_recent(fn)
		if (window != w_instruments && song_name != "") window = w_songinfo
		filename = fn
		changed = 0
	}
	else {
		changed = 1
	}
	backup_clear()
	blocks_set_instruments()
	io_clear()

}
