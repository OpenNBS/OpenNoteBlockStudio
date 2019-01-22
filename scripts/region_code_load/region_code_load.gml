// region_code_load(x, y, code)
// Loads the specified code into the x, y position.
var xx, yy, str, ca, cb, val, ins, key;
xx = argument0
yy = argument1
str = argument2
if (str = "") return 0
ca = 0
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
        ins = instrument_list[| real(string_copy(str, 1, string_pos("|", str) - 1))]
        str = string_delete(str, 1, string_pos("|", str))
        key = real(string_copy(str, 1, string_pos("|", str) - 1))
        str = string_delete(str, 1, string_pos("|", str))
        add_block(xx + ca, yy + cb, ins, key)
    }
}
