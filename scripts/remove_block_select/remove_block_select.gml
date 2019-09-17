// remove_block_select(x, y)
var xx, yy;
xx = argument0
yy = argument1

if (song_exists[xx, yy] = 0) return 0
song_exists[xx, yy] = 0
song_ins[xx, yy].num_blocks--
if (song_key[xx, yy] < 33 || song_key[xx, yy] > 57) block_outside -= 1
if (song_ins[xx, yy].user) block_custom -= 1

song_ins[xx, yy] = 0
song_key[xx, yy] = 0
song_vel[xx, yy] = 0
song_pan[xx, yy] = 0
song_played[xx, yy] = 0
song_added[xx, yy] = 0
colamount[xx] -= 1
rowamount[yy] -= 1
totalblocks -= 1
