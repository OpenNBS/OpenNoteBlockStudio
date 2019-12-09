// schematic_fill_hollow(id, x1, y1, z1, x2, y2, z2, thickness, block, data)
//  id          Schematic to modify
//  x1,y1,z1    Start position of the cube to fill
//  x2,y2,z2    End position of the cube to fill
//  thickness   Amount of blocks the outer walls should be
//  block       New block ID of the affected cells
//  data        New block data of the affected cells

// Creates a hollow cube with the given thickness, using the given block and data.
// See this article for data values:
//      http://minecraft.gamepedia.com/Data_Values

// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

var sch, x1, y1, z1, x2, y2, z2, thick, block, data;
sch = argument0;
x1 = argument1;
y1 = argument2;
z1 = argument3;
x2 = argument4;
y2 = argument5;
z2 = argument6;
thick = argument7;
block = argument8;
data = argument9;

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
            if (a >= x1 + thick && a <= x2 - thick &&
                b >= y1 + thick && b <= y2 - thick &&
                c >= z1 + thick && c <= z2 - thick) continue;
            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
            sch.block[t div sch.dsize, t mod sch.dsize] = block;
            sch.data[t div sch.dsize, t mod sch.dsize] = data;
        }
    }
}