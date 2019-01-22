// buffer_import(fn)

file_delete_lib(temp_file)
file_copy_lib(argument0, temp_file)
return buffer_load(temp_file)
