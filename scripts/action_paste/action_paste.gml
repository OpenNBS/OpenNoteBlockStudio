function action_paste(argument0, argument1) {
	// action_paste(x, y)
	var xx, yy;
	xx = argument0
	yy = argument1
	selection_load(xx, yy, selection_copied, false)
	history_set(h_selectpaste, xx, yy, selection_code)
	changed = 1


}
