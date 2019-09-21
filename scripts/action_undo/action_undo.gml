// action_undo()
var t, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, a, b;
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
historypos += 1
changed = 1
if (t = h_addblock) {
    remove_block(arg0, arg1)
} else if (t = h_removeblock) {
    add_block(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
} else if (t = h_changeblock) {
    change_block(arg0, arg1, arg4, arg5)
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
}
