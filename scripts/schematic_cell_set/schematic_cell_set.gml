function schematic_cell_set(argument0, argument1, argument2, argument3, argument4, argument5) {
	// schematic_cell_set(id, x, y, z, block, data)
	//  id      Schematic to modify
	//  x,y,z   Position of the cell to change
	//  block   New block ID of the cell
	//  data    New block data of the cell

	// Sets the block ID and data at x,y,z in the given schematic.
	// See this article for data values:
	//      http://minecraft.gamepedia.com/Data_Values

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, xx, yy, zz, block, data;
	sch = argument0;
	xx = argument1;
	yy = argument2;
	zz = argument3;
	block = argument4;
	data = argument5;

	if (xx < 0 || yy < 0 || zz < 0 || xx >= sch.xsize || yy >= sch.ysize || zz >= sch.zsize) return 0;

	var t;
	t = xx * sch.xysize * sch.zsize + yy + zz * sch.xysize;

	sch.block[t div sch.dsize, t mod sch.dsize] = block;
	sch.data[t div sch.dsize, t mod sch.dsize] = data;


}
