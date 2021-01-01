function block_repeater(argument0, argument1, argument2, argument3, argument4, argument5) {
	// block_repeater(x, y, z, delay, direction, powered)
	sch_block_write(argument0, argument1, argument2, 93 + argument5)
	sch_data_write(argument0, argument1, argument2, argument3 * 4 + argument4)



}
