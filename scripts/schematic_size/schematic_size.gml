// schematic_size(id, xsize, ysize, zsize)
//  id      Schematic to set size of
//  xsize   Number of blocks along X axis
//  ysize   Number of blocks along Y axis
//  zsize   Number of blocks along Z axis

// Sets the size of the given schematic and resets all cells.
// If new schematic, this must be done before saving.
// Max size is 2800x2800x128 or 2000x2000x256 due to GM's array limitations.

// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

var sch, xs, ys, zs;
sch = argument0;
xs = argument1;
ys = argument2;
zs = argument3;

sch.xsize = xs;
sch.ysize = ys;
sch.zsize = zs;

var a, b, c, t;
sch.dsize = sqrt(sch.xsize * sch.ysize * sch.zsize);
sch.xysize = max(sch.xsize, sch.ysize) + 1;
for (a = 0; a < sch.xsize; a += 1) {
    for (b = 0; b < sch.ysize; b += 1) {
        for (c = 0; c < sch.zsize; c += 1) {
            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
            sch.block[t div sch.dsize, t mod sch.dsize] = 0;
            sch.data[t div sch.dsize, t mod sch.dsize] = 0;
        }
    }
}