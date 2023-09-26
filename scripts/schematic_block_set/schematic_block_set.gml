function schematic_block_set(argument0, argument1, argument2, argument3, argument4) {
	// schematic_block_set(id, x, y, z, val)
	//  id      Schematic to modify
	//  x,y,z   Position of the cell to change
	//  val     New block ID of the cell

	// Sets the block ID at x,y,z in the given schematic.
	// See this article for data values:
	//      http://minecraft.wiki/w/Data_Values

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, xx, yy, zz, val;
	sch = argument0;
	xx = argument1;
	yy = argument2;
	zz = argument3;
	val = argument4;

	if (xx < 0 || yy < 0 || zz < 0 || xx >= sch.xsize || yy >= sch.ysize || zz >= sch.zsize) return 0;

	var t;
	t = xx * sch.xysize * sch.zsize + yy + zz * sch.xysize;

	sch.block[t div sch.dsize, t mod sch.dsize] = val;


}
