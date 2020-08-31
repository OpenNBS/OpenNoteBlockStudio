function schematic_fill(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	// schematic_fill(id, x1, y1, z1, x2, y2, z2, block, data)
	//  id          Schematic to modify
	//  x1,y1,z1    Start position of the cube to fill
	//  x2,y2,z2    End position of the cube to fill
	//  block       New block ID of the affected cells
	//  data        New block data of the affected cells

	// Will fill the selected cube with the given block and data.
	// See this article for data values:
	//      http://minecraft.gamepedia.com/Data_Values

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, x1, y1, z1, x2, y2, z2, block, data;
	sch = argument0;
	x1 = argument1;
	y1 = argument2;
	z1 = argument3;
	x2 = argument4;
	y2 = argument5;
	z2 = argument6;
	block = argument7;
	data = argument8;

	var tmp, a, b, c, t;

	// Switch positions?
	if (x1 > x2) {
	    tmp = x1;
	    x1 = x2;
	    x2 = tmp;
	}
	if (y1 > y2) {
	    tmp = y1;
	    y1 = y2;
	    y2 = tmp;
	}
	if (z1 > z2) {
	    tmp = z1;
	    z1 = z2;
	    z2 = tmp;
	}

	for (a = x1; a <= x2; a += 1) {
	    for (b = y1; b <= y2; b += 1) {
	        for (c = z1; c <= z2; c += 1) {
	            if (a < 0 || b < 0 || c < 0 || a >= sch.xsize || b >= sch.ysize || c >= sch.zsize) continue;
	            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
	            sch.block[t div sch.dsize, t mod sch.dsize] = block;
	            sch.data[t div sch.dsize, t mod sch.dsize] = data;
	        }
	    }
	}


}
