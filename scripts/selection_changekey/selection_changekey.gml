// selection_changekey(dif)
var a, b, str, dif, key;
dif = argument0
str = selection_code
if (selected = 0) return 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) {
        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
            if (selection_exists[a, b]) {
                key = selection_key[a, b]
                if (key + dif > -1 && key + dif < 88) key += dif
                selection_key[a, b] = key
            }
        }
    }
}
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
