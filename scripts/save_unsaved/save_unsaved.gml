function save_unsaved() {
	// save_unsaved()

	var a, gameend, songid;
	playing = 0
	songid = song

	if (songs[songid].changed && !isplayer) {
	    save_song(backup_file + condstr(songs[songid].filename != "", filename_name(songs[songid].filename), songs[songid].song_backupid) + "_unsaved.nbs", true)
	}



}
