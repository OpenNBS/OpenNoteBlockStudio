function schematic_replace(argument0, argument1, argument2, argument3, argument4) {
	// schematic_replace(id, oldblock, olddata, newblock, newdata)
	//  id          Schematic to modify
	//  oldblock    Old block ID to replace, -1 for all non-air blocks
	//  olddata     Old data to replace, -1 for all data
	//  newblock    New block ID the old should be changed into, -1 to not replace block IDs
	//  newdata     New block data the old should be changed into, -1 to not replace block datas

	// Examples:
	//  schematic_replace(mySchematic, 35, 15, 5, 3) // Replace all black wool (35,15) with jungle planks (5,3)
	//  schematic_replace(mySchematic, -1, 15, 5, 3) // Replace all blocks with a data of 15 with jungle planks
	//  schematic_replace(mySchematic, 35, -1, 35, 0) // Replace all wools with white wool
	//  schematic_replace(mySchematic, 46, -1, 0, 0) // Remove all TNT blocks (46)
	//  schematic_replace(mySchematic, -1, -1, 11, -1) // Replace all non-air blocks with lava (11), but keep their data

	// Replaces all occurrences of the given block and/or data.
	// See this article for data values:
	//      https://minecraft.wiki/w/Java_Edition_data_values/Pre-flattening

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, oblock, odata, nblock, ndata;
	sch = argument0;
	oblock = argument1;
	odata = argument2;
	nblock = argument3;
	ndata = argument4;

	var a, b, c, t;

	for (a = 0; a < sch.xsize; a += 1) {
	    for (b = 0; b < sch.ysize; b += 1) {
	        for (c = 0; c < sch.zsize; c += 1) {
	            var cblock, cdata;
	            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
	            cblock = sch.block[t div sch.dsize, t mod sch.dsize];
	            cdata = sch.data[t div sch.dsize, t mod sch.dsize];
            
	            if (cblock != oblock && (oblock > -1 || cblock > 0)) continue;
	            if (cdata != odata && odata > -1) continue;
            
	            if (nblock > -1) sch.block[t div sch.dsize, t mod sch.dsize] = nblock;
	            if (ndata > -1) sch.data[t div sch.dsize, t mod sch.dsize] = ndata;
	        }
	    }
	}


}
