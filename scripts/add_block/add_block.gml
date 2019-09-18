// add_block(x, y, ins, key, [insnum], vel, pan)
var a, b, c, xx, yy, ins, key, insnum, vel, pan;
xx = argument[0]
yy = argument[1]
ins = argument[2]
key = median(0, argument[3], 87)
if (argument_count > 4) {
    insnum = argument[4]
	vel = argument[5]
	pan = argument[6]
}
else 
	insnum = false

// Initialize cells
if (xx >= arraylength) {
    for (a = arraylength; a <= xx; a += 1) {
        colfirst[a] = -1
        collast[a] = -1
        colamount[a] = 0
        for (b = 0; b < max(yy + 1, arrayheight); b += 1) song_exists[a, b] = 0
    }
    arraylength = xx + 1
}
if (yy >= arrayheight) {
    for (a = 0; a < arraylength; a += 1) {
        for (b = arrayheight; b <= yy ;b += 1) {
            rowamount[b] = 0
            song_exists[a, b] = 0
        }
    }
    arrayheight = yy + 1
}

if (song_exists[xx, yy]) return 0

// Add block
song_exists[xx, yy] = 1
song_ins[xx, yy] = ins
song_key[xx, yy] = key
song_vel[xx, yy] = vel
song_pan[xx, yy] = pan
song_played[xx, yy] = 0
song_added[xx, yy] = 0
colamount[xx] += 1
rowamount[yy] += 1
if (!insnum) {
    ins.num_blocks++
    if (ins.user) block_custom += 1
}
if (key < 33 || key > 57) block_outside += 1
totalblocks += 1

if (colfirst[xx] = -1 || yy < colfirst[xx]) colfirst[xx] = yy
if (yy > collast[xx]) collast[xx] = yy

if (xx >= enda) enda = xx
if (yy >= endb) endb = yy
return 1
