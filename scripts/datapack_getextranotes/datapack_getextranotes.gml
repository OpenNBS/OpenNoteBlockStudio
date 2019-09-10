//datapack_getextranotes()
//allows the user to save the resource pack containing extra notes to their location of choice

var fn, src
fn = string(get_save_filename_ext("Resource pack (*.zip)|*.zip", "Extra Note Blocks", "", "Save extra notes for data pack"))
if (fn = "") return 0

src = data_directory + "extranotes.zip"

if file_exists(src) {
	file_copy(src, fn)
	message("Resource pack saved successfully!", "Saved")
}
else {
	message("File not found!","Error")
}