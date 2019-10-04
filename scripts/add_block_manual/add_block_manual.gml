// add_block_manual(x, y, ins, key, vel, pan)
var a, b, c, xx, yy, ins, key, vel, pan, pit;
xx = argument0
yy = argument1
ins = argument2
key = argument3
vel = argument4
pan = argument5
pit = argument6
if (xx >= 32000) return 0

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
        for (b = arrayheight; b <= yy; b += 1) {
            rowamount[b] = 0
            song_exists[a, b] = 0
        }
    }
    arrayheight = yy + 1
}

if (song_exists[xx, yy]) return 0

if ((key < 33  || key > 57) && warning_octaves = 0) {
    message("NOTE: Since this block is outside the 2 octave limit, you won't be able to import it into Minecraft.\n\nThis warning will never be shown again.", "Warning")
    warning_octaves = 1
} else if (ins.user && warning_instrument = 0) {
    message("NOTE: Since this block has a custom instrument, you won't be able to import it into Minecraft.\n\nThis warning will never be shown again.", "Warning")
    warning_instrument = 1
}

// Add block
song_exists[xx, yy] = 1
song_ins[xx, yy] = ins
song_key[xx, yy] = key
song_vel[xx, yy] = vel
song_pan[xx, yy] = pan
song_pit[xx, yy] = pit
song_played[xx, yy] = 0
song_added[xx, yy] = current_time
colamount[xx] += 1
rowamount[yy] += 1
ins.num_blocks++
if (key < 33 || key > 57) block_outside += 1
if (ins.user) block_custom += 1
totalblocks += 1
changed = 1
work_add += 1
if (colfirst[xx] = -1 || yy < colfirst[xx]) colfirst[xx] = yy
if (yy > collast[xx]) collast[xx] = yy

if (xx >= enda) enda = xx
if (yy >= endb) endb = yy

if (ins.loaded) play_sound(ins, key, 100 ,100, 0)
history_set(h_addblock, xx, yy, ins, key, vel, pan, pit)
return 1
