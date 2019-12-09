/// @description  load_instruments(filename)
/// @function  load_instruments
/// @param filename

var fn, a, b, hei2;
fn = argument0
if (fn = "") {
    if (!directory_exists(songfolder)) songfolder = songs_directory
    fn = string(get_open_filename_ext("Note Block Songs (*.nbs)|*.nbs", "", songfolder, "Load instruments from song"))
}
if (fn = "" || !file_exists(fn)) return 0

buffer = buffer_import(fn)
buffer_read_short()
hei2 = buffer_read_short()

buffer_read_string_int()
buffer_read_string_int()
buffer_read_string_int()
buffer_read_string_int()
buffer_read_short()
buffer_read_byte()
buffer_read_byte()
buffer_read_byte()
a = buffer_read_int()
a = buffer_read_int()
a = buffer_read_int()
a = buffer_read_int()
a = buffer_read_int()
a = buffer_read_string_int()
// Note blocks
while (1) {
    a = buffer_read_short()
    if (a = 0) break
    while (1) {    
        a = buffer_read_short()
        if (a = 0) break
        repeat (2) buffer_read_byte()
    }
}
if (buffer_is_eof()) {
    message("This file does not contain any custom instruments.", "Error")
    return 0
}
//buffer_read_short()
for (b = 0; b < hei2; b += 1) {
    buffer_read_string_int()
     buffer_read_byte()
}
if (buffer_is_eof()) {
    message("This file does not contain any custom instruments.", "Error")
    return 0
}
a = buffer_read_byte()
if (a = 0) {
    message("This file does not contain any custom instruments.", "Error")
    return 0
}
for (b = 0; b < a; b += 1) {
    var name = buffer_read_string_int();
    var filename = buffer_read_string_int();
    var key = buffer_read_byte();
    var press = buffer_read_byte();
    var ins = new_instrument(name, filename, true, press, key);
    with (ins)
        instrument_load()
    ds_list_add(instrument_list, ins)
}
changed = true
