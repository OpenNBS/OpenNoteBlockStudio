//dat_makefolders(path, namespace)
//create folder structure prior to creating the datapack files
//returns: functiondir

var path = argument0
var namespace = argument1

var folders = []
var foldercount = 0
var str = ""
if path != "" {
	for (i = 1; i <= string_length(path); i++) {			
		var char = string_char_at(path, i)
		if (char = "/") {
			folders[foldercount] = str
			foldercount++
			str = ""
		} else {
			str += char
			folders[foldercount] = str
		}
	}
}

var tempdir = data_directory + "TempDatapack\\"
if (directory_exists(tempdir)) directory_delete_lib(tempdir)

directory_create(tempdir)
directory_create(tempdir + "data\\")
directory_create(tempdir + "data\\minecraft\\")
directory_create(tempdir + "data\\minecraft\\tags\\")
directory_create(tempdir + "data\\minecraft\\tags\\functions\\")
directory_create(tempdir + "data\\" + namespace +"\\")

var functiondir = tempdir + "data\\" + namespace + "\\functions\\"
directory_create(functiondir)

// Dinamically create function folder
if (array_length_1d(folders) > 0) {
	for (i = 0; i <= foldercount; i++) {
		functiondir += folders[i] + "\\"
		directory_create(functiondir)
	}
}
directory_create(functiondir + "notes")
directory_create(functiondir + "tree")

return functiondir