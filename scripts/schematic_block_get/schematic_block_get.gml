function schematic_block_get(argument0, argument1, argument2, argument3) {
	// schematic_block_get(id, x, y, z)
	//  id      Schematic to check
	//  x,y,z   Position of the cell to check

	// Returns the block ID at x,y,z in the given schematic.
	// See this article for data values:
	//      https://minecraft.wiki/w/Java_Edition_data_values/Pre-flattening

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, xx, yy, zz;
	sch = argument0;
	xx = argument1;
	yy = argument2;
	zz = argument3;

	if (xx < 0 || yy < 0 || zz < 0 || xx >= sch.xsize || yy >= sch.ysize || zz >= sch.zsize) return 0;

	var t;
	t = xx * sch.xysize * sch.zsize + yy + zz * sch.xysize;

	return sch.block[t div sch.dsize, t mod sch.dsize];


}
