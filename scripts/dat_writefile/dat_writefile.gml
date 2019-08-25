// dat_writefile(str, path, zipfile)
// writes file to path, or adds it to the zip if it exists

var str, path, file, zipfile

str = argument0
path = argument1
zipfile = argument2

file = buffer_create(string_length(str), buffer_fixed, 1)
buffer_write(file, buffer_text, str)
if (zipfile != "") zip_add_buffer(zipfile, path, file)
else buffer_export(file, path)
buffer_delete(file)