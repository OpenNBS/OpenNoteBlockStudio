function backup_clear() {
	// backup_clear()
	// Deletes the backup file stored temporarily for auto-recovery

	if (file_exists(backup_file)) {
		files_delete(backup_file)
	}


}
