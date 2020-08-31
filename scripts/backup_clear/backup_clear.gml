function backup_clear() {
	// backup_clear()
	// Deletes the backup file stored temporarily for auto-recovery

	if (file_exists_lib(backup_file)) {
		files_delete_lib(backup_file)
	}


}
