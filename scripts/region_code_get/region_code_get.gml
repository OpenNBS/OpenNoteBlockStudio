// region_code_get(x1, y1, x2, y2)
// Fetches the code of the specified region.
var x1, y1, x2, y2, str, a, b, ca, cb, am;
x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3
str = ""
ca = 0
am = 0
for (a = x1; a < x2; a += 1) {
    if (a <= enda) {
        if (colamount[a] > 0) {
            str += string(ca) + "|"
            ca = 0
            cb = 0
            for (b = y1; b < y2; b += 1) {
                if (b >= colfirst[a] && b <= collast[a]) {
                    if (song_exists[a, b]) {
                        str += string(cb) + "|"
                        cb = 0
                        str += string(ds_list_find_index(instrument_list, song_ins[a, b])) + "|"
                        str += string(song_key[a, b]) + "|"
                        str += string(song_vel[a, b]) + "|"
                        str += string(song_pan[a, b]) + "|"
                        str += string(song_pit[a, b]) + "|"
                        am += 1
                    }
                }
                cb += 1
            }
            str += "-1|"
        }
    }
    ca += 1
}
if (am = 0) str = ""
return str
