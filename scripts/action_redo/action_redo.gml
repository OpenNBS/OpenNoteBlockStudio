// action_redo()
var t, arg0, arg1, arg2, arg3, arg4, arg5;
if (historypos = 0) return 0
historypos -= 1
t = history[historypos, 0]
arg0 = history[historypos, 1]
arg1 = history[historypos, 2]
arg2 = history[historypos, 3]
arg3 = history[historypos, 4]
arg4 = history[historypos, 5]
arg5 = history[historypos, 6]
changed = 1

if (t = h_addblock) {
    add_block(arg0, arg1, arg2, arg3)
} else if (t = h_removeblock) {
    remove_block(arg0, arg1)
} else if (t = h_changeblock) {
    change_block(arg0, arg1, arg2, arg3)
} else if (t = h_selectadd) {
    selection_add(arg0, arg1, arg2 - 1, arg3 - 1, arg4, 1)
} else if (t = h_selectremove) {
    selection_remove(arg0, arg1, arg2, arg3, 0, 1)
} else if (t = h_selectchange) {
    selection_delete(1)
    selection_load(arg0, arg1, arg2, 1)
} else if (t = h_selectmove) {
    selection_x = arg0
    selection_y = arg1
} else if (t = h_selectpaste) {
    selection_load(arg0, arg1, arg2, 1)
} else if (t = h_select) {
    selection_place(1)
    selection_load_ext(arg0, arg1, arg2)
}
