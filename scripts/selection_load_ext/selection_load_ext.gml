// selection_load_ext(x, y, code)
// Loads the selection from the string, and also removes any blocks underneath them.
var xx, yy, str, ca, cb, val, h;
xx = argument0
yy = argument1
str = argument2
if (str = "") return 0
ca = 0
h = 0
while (str != "") {
    val = real(string_copy(str, 1, string_pos("|", str) - 1))
    str = string_delete(str, 1, string_pos("|", str))
    ca += val
    cb = 0
    while (1) {
        val = real(string_copy(str, 1, string_pos("|", str) - 1))
        str = string_delete(str, 1, string_pos("|", str))
        if (val = -1) break
        cb += val
        remove_block_select(xx + ca, yy + cb)
        selection_exists[ca, cb] = 1
        val = real(string_copy(str, 1, string_pos("|", str) - 1))
        str = string_delete(str, 1, string_pos("|", str))
        selection_ins[ca, cb] = instrument_list[| val]
        val = real(string_copy(str, 1, string_pos("|", str) - 1))
        str = string_delete(str, 1, string_pos("|", str))
        selection_key[ca, cb] = val
        selected += 1
        if (selection_colfirst[ca] = -1) selection_colfirst[ca] = cb
        selection_collast[ca] = cb
        h = max(h, cb)
    }
}
selection_x = xx
selection_y = yy
selection_l = ca + 1
selection_h = h + 1
selection_code_update()
