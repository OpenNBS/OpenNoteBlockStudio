// selection_changepit(dif)
var a, b, str, dif, pit;
dif = argument0
str = selection_code
if (selected = 0) return 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) {
        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
            if (selection_exists[a, b]) {
                pit = selection_pit[a, b]
                pit += dif
                selection_pit[a, b] = pit
            }
        }
    }
}
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
