// selection_code_update()
// Updates the selection code
var str, a, b, ca, cb;
str = ""
if (selected = 0) return 0
ca = 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) {
        str += string(ca) + "|"
        ca = 0
        cb = 0
        for (b = 0; b < selection_h; b += 1) {
            if (selection_exists[a, b]) {
                str += string(cb) + "|"
                cb = 0
                str += string(ds_list_find_index(instrument_list, selection_ins[a, b])) + "|"
                str += string(selection_key[a, b]) + "|"
                str += string(selection_vel[a, b]) + "|"
                str += string(selection_pan[a, b]) + "|"
            }
            cb += 1
            if (b = selection_h - 1) {
                str += "-1|"
            }
        }
    }
    ca += 1
}
selection_code = str
