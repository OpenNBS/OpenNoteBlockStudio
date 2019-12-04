// action_undo()
var t, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, a, b;
if (historypos = historylen) return 0
t = history[historypos, 0]
arg0 = history[historypos, 1]
arg1 = history[historypos, 2]
arg2 = history[historypos, 3]
arg3 = history[historypos, 4]
arg4 = history[historypos, 5]
arg5 = history[historypos, 6]
arg6 = history[historypos, 7]
arg7 = history[historypos, 8]
arg8 = history[historypos, 9]
arg9 = history[historypos, 10]
arg10 = history[historypos, 11]
arg11 = history[historypos, 12]
arg12 = history[historypos, 13]
arg13 = history[historypos, 14]
arg14 = history[historypos, 15]
historypos += 1
changed = 1
if (t = h_addblock) {
    remove_block(arg0, arg1)
} else if (t = h_removeblock) {
    add_block(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
} else if (t = h_changeblock) {
    change_block(arg0, arg1, arg7, arg8, arg9, arg10, arg11)
} else if (t = h_selectadd) {
    selection_remove(arg0, arg1, arg2, arg3, 0, 1)
} else if (t = h_selectremove) {
    selection_add(arg0, arg1, arg2 - 1, arg3 - 1, 0, 1)
    selection_delete(1)
    selection_load(arg4, arg5, arg6, true)
    region_code_load(arg0, arg1, arg7)
} else if (t = h_selectchange) {
    selection_delete(1)
    selection_load(arg3, arg4, arg5, 1)
} else if (t = h_selectmove) {
    selection_x = arg2
    selection_y = arg3
} else if (t = h_selectpaste) {
    selection_delete(1)
} else if (t = h_select) {
    selection_place(1)
    selection_load_ext(arg3, arg4, arg5)
} else if (t = h_addlayer) {
	remove_layer(arg0, true)
} else if (t = h_removelayer) {
	add_layer(arg0, true, arg1, arg2, arg3, arg4, arg5, arg6)
} else if (t = h_swaplayer) {
	shift_layers(arg1, arg0, true)
} else if (t = h_stereoize) {
	selection_load(arg0, arg1, arg2, true)
}
