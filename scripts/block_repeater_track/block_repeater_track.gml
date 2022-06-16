function block_repeater_track(x, y, z, delay, direction, powered){
	var insnum = insnum = ds_list_size(instrument_list)
	var dir
	if (direction = 1) dir = 11
	else if (direction = 1 + 4) dir = 12
	else if (direction = 1 + 4 * 2) dir = 13
	else if (direction = 1 + 4 * 3) dir = 14
	else if (direction = 2) dir = 7
	else if (direction = 2 + 4) dir = 8
	else if (direction = 2 + 4 * 2) dir = 9
	else if (direction = 2 + 4 * 3) dir = 10
	else if (direction = 3) dir = 15
	TAG_List("pos", 3, 3)
		buffer_write_int_be(y)
		buffer_write_int_be(z)
		buffer_write_int_be(x)
	TAG_Int("state", insnum * 26 + dir)
	TAG_End()
}