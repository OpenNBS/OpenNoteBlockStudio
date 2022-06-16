function block_circuit_track(x, y, z){
	TAG_List("pos", 3, 3)
		buffer_write_int_be(y)
		buffer_write_int_be(z)
		buffer_write_int_be(x)
	TAG_Int("state", 1)
}