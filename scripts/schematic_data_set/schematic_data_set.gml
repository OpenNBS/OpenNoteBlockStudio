function schematic_data_set(argument0, argument1, argument2, argument3, argument4) {
	// schematic_data_set(id, x, y, z, val)
	//  id      Schematic to modify
	//  x,y,z   Position of the cell to change
	//  val     New block data of the cell

	// Sets the additional block data at x,y,z in the given schematic.
	// See this article for data values:
	//      https://minecraft.wiki/w/Java_Edition_data_values/Pre-flattening

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

	sch.data[t div sch.dsize, t mod sch.dsize] = val;


}
