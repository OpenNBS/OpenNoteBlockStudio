function backup_clear() {
	// backup_clear()
	// Deletes the backup file stored temporarily for auto-recovery
	var file = ""

	//if (file_exists_lib(backup_file)) {
	//	files_delete_lib(backup_file)
	//}
	while(1) {
		file = file_find_first(backup_file + "*_backup.nbs", 0)
		if (file = "") break
		files_delete_lib(backup_file + file)
	}


}
