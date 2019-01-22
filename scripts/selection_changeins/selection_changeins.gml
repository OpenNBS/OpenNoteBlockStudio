// selection_changeins(ins)
var a, b, str, inst;
inst = argument0
str = selection_code
if (selected = 0) return 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) {
        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
            if (selection_exists[a, b]) {
                selection_ins[a, b] = inst
            }
        }
    }
}
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
