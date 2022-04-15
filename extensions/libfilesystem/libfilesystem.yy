{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 202375362,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
  "author": "",
  "date": "2020-05-31T05:57:01",
  "license": "Free to use, also for commercial games.",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"filename":"libfilesystem.dll","origname":"extensions\\libfilesystem.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"file_copy","kind":12,"help":"file_copy(fname,newname)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"file_copy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_rename","kind":12,"help":"file_rename(oldname,newname)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"file_rename","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_exists","kind":12,"help":"file_exists(fname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_exists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_delete","kind":12,"help":"file_delete(fname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_delete","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_create","kind":12,"help":"directory_create(dname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_copy","kind":12,"help":"directory_copy(dname,newname)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"directory_copy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_rename","kind":12,"help":"directory_rename(oldname,newname)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"directory_rename","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_exists","kind":12,"help":"directory_exists(dname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_exists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_destroy","kind":12,"help":"directory_destroy(dname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_destroy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"filename_absolute","kind":12,"help":"filename_absolute(fname)","hidden":false,"returnType":1,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"filename_absolute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"environment_get_variable","kind":12,"help":"environment_get_variable(name)","hidden":false,"returnType":1,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"environment_get_variable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"environment_set_variable","kind":12,"help":"environment_set_variable(name,value)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"environment_set_variable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_get_current_working","kind":12,"help":"directory_get_current_working()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_get_current_working","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_set_current_working","kind":12,"help":"directory_set_current_working(dname)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_set_current_working","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"executable_get_directory","kind":12,"help":"executable_get_directory()","hidden":false,"returnType":1,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"executable_get_directory","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"executable_get_filename","kind":12,"help":"executable_get_filename()","hidden":false,"returnType":1,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"executable_get_filename","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"executable_get_pathname","kind":12,"help":"executable_get_pathname()","hidden":false,"returnType":1,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"executable_get_pathname","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_size","kind":1,"help":"file_size(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_size","kind":1,"help":"directory_size(dname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"filename_canonical","kind":1,"help":"filename_canonical(fname)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"filename_canonical","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"environment_expand_variables","kind":1,"help":"environment_expand_variables(str)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"environment_expand_variables","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_first","kind":1,"help":"directory_contents_first(dname,pattern,includedirs,recursive)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"directory_contents_first","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_next","kind":1,"help":"directory_contents_next()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_next","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_close","kind":1,"help":"directory_contents_close()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_close","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_open","kind":1,"help":"file_bin_open(fname,mode)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_bin_open","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_rewrite","kind":1,"help":"file_bin_rewrite(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_rewrite","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_close","kind":1,"help":"file_bin_close(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_close","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_size","kind":1,"help":"file_bin_size(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_position","kind":1,"help":"file_bin_position(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_position","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_seek","kind":1,"help":"file_bin_seek(fd,pos)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"file_bin_seek","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_read_byte","kind":1,"help":"file_bin_read_byte(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_read_byte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_write_byte","kind":1,"help":"file_bin_write_byte(fd,byte)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"file_bin_write_byte","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_read","kind":1,"help":"file_text_open_read(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_text_open_read","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_write","kind":1,"help":"file_text_open_write(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_text_open_write","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_append","kind":1,"help":"file_text_open_append(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_text_open_append","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_write_real","kind":1,"help":"file_text_write_real(fd,val)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"file_text_write_real","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_write_string","kind":1,"help":"file_text_write_string(fd,str)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"file_text_write_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_writeln","kind":1,"help":"file_text_writeln(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_writeln","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_eoln","kind":1,"help":"file_text_eoln(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_eoln","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_eof","kind":1,"help":"file_text_eof(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_eof","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_read_real","kind":1,"help":"file_text_read_real(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_read_real","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_read_string","kind":1,"help":"file_text_read_string(fd)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_read_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_readln","kind":1,"help":"file_text_readln(fd)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_readln","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_read_all","kind":1,"help":"file_text_read_all(fd)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_read_all","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_from_string","kind":1,"help":"file_text_open_from_string(str)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_text_open_from_string","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_close","kind":1,"help":"file_text_close(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_close","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"environment_unset_variable","kind":1,"help":"environment_unset_variable(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"environment_unset_variable","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_hardlinks","kind":1,"help":"file_bin_hardlinks(fd,dnames,recursive)","hidden":false,"returnType":1,"argCount":0,"args":[
            2,
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_bin_hardlinks","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_get_order","kind":1,"help":"directory_contents_get_order()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_get_order","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_set_order","kind":1,"help":"directory_contents_set_order(order)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"directory_contents_set_order","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_get_temporary_path","kind":1,"help":"directory_get_temporary_path()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_get_temporary_path","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_year","kind":1,"help":"file_datetime_accessed_year(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_month","kind":1,"help":"file_datetime_accessed_month(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_day","kind":1,"help":"file_datetime_accessed_day(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_hour","kind":1,"help":"file_datetime_accessed_hour(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_minute","kind":1,"help":"file_datetime_accessed_minute(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_accessed_second","kind":1,"help":"file_datetime_accessed_second(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_accessed_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_year","kind":1,"help":"file_datetime_modified_year(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_month","kind":1,"help":"file_datetime_modified_month(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_day","kind":1,"help":"file_datetime_modified_day(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_hour","kind":1,"help":"file_datetime_modified_hour(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_minute","kind":1,"help":"file_datetime_modified_minute(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_modified_second","kind":1,"help":"file_datetime_modified_second(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_modified_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_year","kind":1,"help":"file_datetime_created_year(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_month","kind":1,"help":"file_datetime_created_month(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_day","kind":1,"help":"file_datetime_created_day(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_hour","kind":1,"help":"file_datetime_created_hour(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_minute","kind":1,"help":"file_datetime_created_minute(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_datetime_created_second","kind":1,"help":"file_datetime_created_second(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_datetime_created_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_year","kind":1,"help":"file_bin_datetime_accessed_year(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_month","kind":1,"help":"file_bin_datetime_accessed_month(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_day","kind":1,"help":"file_bin_datetime_accessed_day(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_hour","kind":1,"help":"file_bin_datetime_accessed_hour(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_minute","kind":1,"help":"file_bin_datetime_accessed_minute(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_accessed_second","kind":1,"help":"file_bin_datetime_accessed_second(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_accessed_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_year","kind":1,"help":"file_bin_datetime_modified_year(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_month","kind":1,"help":"file_bin_datetime_modified_month(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_day","kind":1,"help":"file_bin_datetime_modified_day(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_hour","kind":1,"help":"file_bin_datetime_modified_hour(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_minute","kind":1,"help":"file_bin_datetime_modified_minute(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_modified_second","kind":1,"help":"file_bin_datetime_modified_second(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_modified_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_year","kind":1,"help":"file_bin_datetime_created_year(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_year","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_month","kind":1,"help":"file_bin_datetime_created_month(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_month","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_day","kind":1,"help":"file_bin_datetime_created_day(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_day","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_hour","kind":1,"help":"file_bin_datetime_created_hour(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_hour","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_minute","kind":1,"help":"file_bin_datetime_created_minute(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_minute","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_datetime_created_second","kind":1,"help":"file_bin_datetime_created_second(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_datetime_created_second","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_get_maxfiles","kind":1,"help":"directory_contents_get_maxfiles()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_get_maxfiles","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_set_maxfiles","kind":1,"help":"directory_contents_set_maxfiles(maxfiles)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"directory_contents_set_maxfiles","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_get_cntfiles","kind":1,"help":"directory_contents_get_cntfiles()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_get_cntfiles","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"symlink_create","kind":1,"help":"symlink_create(fname,newname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"symlink_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"symlink_copy","kind":1,"help":"symlink_copy(fname,newname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"symlink_copy","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"symlink_exists","kind":1,"help":"symlink_exists(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"symlink_exists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"hardlink_create","kind":1,"help":"hardlink_create(fname,newname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"hardlink_create","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_numblinks","kind":1,"help":"file_numblinks(fname)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_numblinks","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_bin_numblinks","kind":1,"help":"file_bin_numblinks(fd)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_bin_numblinks","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"filename_equivalent","kind":1,"help":"filename_equivalent(fname1,fname2)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"filename_equivalent","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"environment_get_variable_exists","kind":1,"help":"environment_get_variable_exists(name)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"environment_get_variable_exists","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_first_async","kind":1,"help":"directory_contents_first_async(dname,pattern,includedirs,recursive)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"directory_contents_first_async","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_get_completion_status","kind":1,"help":"directory_contents_get_completion_status()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_get_completion_status","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_set_completion_status","kind":1,"help":"directory_contents_set_completion_status(complete)","hidden":false,"returnType":2,"argCount":0,"args":[
            2,
          ],"resourceVersion":"1.0","name":"directory_contents_set_completion_status","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_contents_get_length","kind":1,"help":"directory_contents_get_length()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"directory_contents_get_length","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"directory_get_current_working()","hidden":false,"resourceVersion":"1.0","name":"working_directory","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"executable_get_directory()","hidden":false,"resourceVersion":"1.0","name":"program_directory","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"directory_get_temporary_path()","hidden":false,"resourceVersion":"1.0","name":"temp_directory","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"executable_get_filename()","hidden":false,"resourceVersion":"1.0","name":"program_filename","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"executable_get_pathname()","hidden":false,"resourceVersion":"1.0","name":"program_pathname","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"FD_RDONLY","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"FD_WRONLY","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"FD_RDWR","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"3","hidden":false,"resourceVersion":"1.0","name":"FD_APPEND","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"4","hidden":false,"resourceVersion":"1.0","name":"FD_RDAP","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"0","hidden":false,"resourceVersion":"1.0","name":"DC_ATOZ","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"1","hidden":false,"resourceVersion":"1.0","name":"DC_ZTOA","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"2","hidden":false,"resourceVersion":"1.0","name":"DC_AOTON","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"3","hidden":false,"resourceVersion":"1.0","name":"DC_ANTOO","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"4","hidden":false,"resourceVersion":"1.0","name":"DC_MOTON","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"5","hidden":false,"resourceVersion":"1.0","name":"DC_MNTOO","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"6","hidden":false,"resourceVersion":"1.0","name":"DC_COTON","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"7","hidden":false,"resourceVersion":"1.0","name":"DC_CNTOO","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"8","hidden":false,"resourceVersion":"1.0","name":"DC_RAND","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[
        {"TargetMask":1,"resourceVersion":"1.0","name":"libfilesystem.dylib","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":6,"resourceVersion":"1.0","name":"libfilesystem_x64.dll","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":7,"resourceVersion":"1.0","name":"libfilesystem_arm.so","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":7,"resourceVersion":"1.0","name":"libfilesystem_arm64.so","tags":[],"resourceType":"GMProxyFile",},
        {"TargetMask":7,"resourceVersion":"1.0","name":"libfilesystem.so","tags":[],"resourceType":"GMProxyFile",},
      ],"copyToTargets":202375362,"order":[
        {"name":"file_copy","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_rename","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_exists","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_delete","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_size","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_numblinks","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"hardlink_create","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_create","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_copy","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_rename","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_exists","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_destroy","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_size","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"symlink_create","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"symlink_copy","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"symlink_exists","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"filename_absolute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"filename_canonical","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"filename_equivalent","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"environment_get_variable","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"environment_get_variable_exists","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"environment_set_variable","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"environment_unset_variable","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"environment_expand_variables","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_get_current_working","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_set_current_working","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_get_temporary_path","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"executable_get_directory","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"executable_get_filename","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"executable_get_pathname","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_first","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_first_async","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_next","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_close","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_get_length","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_get_order","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_set_order","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_get_cntfiles","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_get_maxfiles","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_set_maxfiles","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_get_completion_status","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"directory_contents_set_completion_status","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_open","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_numblinks","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_hardlinks","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_rewrite","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_close","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_size","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_position","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_seek","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_read_byte","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_write_byte","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_open_read","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_open_write","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_open_append","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_write_real","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_write_string","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_writeln","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_eoln","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_eof","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_read_real","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_read_string","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_readln","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_read_all","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_open_from_string","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_text_close","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_accessed_second","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_modified_second","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_datetime_created_second","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_accessed_second","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_modified_second","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_year","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_month","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_day","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_hour","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_minute","path":"extensions/libfilesystem/libfilesystem.yy",},
        {"name":"file_bin_datetime_created_second","path":"extensions/libfilesystem/libfilesystem.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"libfilesystem.zip","origname":"extensions\\libfilesystem.zip","init":"","final":"","kind":4,"uncompress":false,"functions":[],"constants":[],"ProxyFiles":[],"copyToTargets":0,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"libfilesystem.gml","origname":"","init":"generate_working_directory","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"generate_working_directory","kind":2,"help":"","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"generate_working_directory","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":194,"order":[
        {"name":"generate_working_directory","path":"extensions/libfilesystem/libfilesystem.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 202375362,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "libfilesystem",
  "tags": [],
  "resourceType": "GMExtension",
}