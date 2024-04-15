function string_buffer_create(argument0){
	var buff = buffer_create(string_length(argument0), buffer_fixed, 1);
	buffer_write(buff, buffer_text, argument0)
	buffer_seek(buff, buffer_seek_start, 0)
	return buff
}