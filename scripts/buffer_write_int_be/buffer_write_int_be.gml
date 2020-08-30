function buffer_write_int_be(argument0) {
	// buffer_write_int_be(val)
	// Writes a big endian integer to the buffer

	var tmpbuf, a, b, c, d;
	tmpbuf = buffer_create(4, buffer_fixed, 1)
	buffer_write(tmpbuf, buffer_s32, argument0)
	buffer_seek(tmpbuf, 0, 0)
	a = buffer_read(tmpbuf, buffer_s8)
	b = buffer_read(tmpbuf, buffer_s8)
	c = buffer_read(tmpbuf, buffer_s8)
	d = buffer_read(tmpbuf, buffer_s8)
	buffer_delete(tmpbuf)

	buffer_write_byte(d)
	buffer_write_byte(c)
	buffer_write_byte(b)
	buffer_write_byte(a)



}
