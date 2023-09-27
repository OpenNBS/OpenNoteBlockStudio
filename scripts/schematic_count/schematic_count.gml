function schematic_count(argument0, argument1, argument2) {
	// schematic_count(id, block, data)
	//  id      Schematic to check
	//  block   The block to look for, -1 for any non-air block
	//  data    The data to look for, -1 for any value

	// Examples:
	//  count = schematic_count(mySchematic, 35, 15) // Stores the amount of black wool (35,15)
	//  count = schematic_count(mySchematic, -1, 3) // Stores the amount of blocks with data 3
	//  count = schematic_count(mySchematic, -1, -1) // Stores the amount of non-air blocks

	// Looks for specific blocks in the schematic and returns the amount of them.
	// See this article for data values:
	//      https://minecraft.wiki/w/Java_Edition_data_values/Pre-flattening

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, block, data;
	sch = argument0;
	block = argument1;
	data = argument2;

	var count, a, b, c, t;
	count = 0;

	for (a = 0; a < sch.xsize; a += 1) {
	    for (b = 0; b < sch.ysize; b += 1) {
	        for (c = 0; c < sch.zsize; c += 1) {
	            var cblock, cdata;
	            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
	            cblock = sch.block[t div sch.dsize, t mod sch.dsize];
	            cdata = sch.data[t div sch.dsize, t mod sch.dsize];
            
	            if (cblock != block && (block > -1 || cblock > 0)) continue;
	            if (cdata != data && data > -1) continue;
            
	            count += 1;
	        }
	    }
	}

	return count;


}
