function sch_block_read(argument0, argument1, argument2) {
	// sch_block_read(x, y, z)

	var xx, yy, zz, t, d;
	xx = argument0;
	yy = argument1;
	zz = argument2;


	t = xx * 2000 * 256 + zz * 2000 + yy;
	d = sqrt(2000 * 256 * 2000);
	return sch_block[t div d, t mod d];



}
