function schematic_line(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	// schematic_line(id, x1, y1, z1, x2, y2, z2, block, data)
	//  id          Schematic to modify
	//  x1,y1,z1    Start position of the line
	//  x2,y2,z2    End position of the line
	//  block       New block ID of the affected cells
	//  data        New block data of the affected cells

	// Creates a 3D line of the given block between two points.
	// See this article for data values:
	//      http://minecraft.wiki/w/Data_Values

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

	var tmp, len, a, b, c, l, t;

	len = max(1, power(power(abs(x2 - x1) ,3) + power(abs(y2 - y1), 3) + power(abs(z2 - z1), 3), 1 / 3));

	for (l = 0; l <= 1; l += 1 / len) {
	    a = floor(x1 + (x2 - x1) * l);
	    b = floor(y1 + (y2 - y1) * l);
	    c = floor(z1 + (z2 - z1) * l);
	    if (a < 0 || b < 0 || c < 0 || a >= sch.xsize || b >= sch.ysize || c >= sch.zsize) continue;
	    t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
	    sch.block[t div sch.dsize, t mod sch.dsize] = block;
	    sch.data[t div sch.dsize, t mod sch.dsize] = data;
	}


}
