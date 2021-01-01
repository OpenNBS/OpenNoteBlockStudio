function datapack_getinstextures() {
	//datapack_getinstextures()
	//allows the user to save the resource pack containing note block textures corresponding to the default instruments.

	var fn, src
	fn = string(get_save_filename_ext("Resource pack (*.zip)|*.zip", "Note Block Textures", "", "Replaces instrument blocks with note block textures."))
	if (fn = "") return 0

	src = data_directory + "instrumenttextures.zip"

	if file_exists(src) {
		file_copy(src, fn)
		message("Resource pack saved successfully!", "Saved")
	}
	else {
		message("File not found!","Error")
	}


}
