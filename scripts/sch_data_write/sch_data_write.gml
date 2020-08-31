function sch_data_write(argument0, argument1, argument2, argument3) {
	// sch_data_write(x, y, z, val)

	var xx, yy, zz, val, t;
	xx = argument0;
	yy = argument1;
	zz = argument2;
	val = argument3;

	t = xx * 2000 * 256 + zz * 2000 + yy;
	d = sqrt(2000 * 256 * 2000);
	sch_data[t div d, t mod d] = val



}
