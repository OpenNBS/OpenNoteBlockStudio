function selection_change(argument0, argument1, argument2) {
	// selection_change(property, amount)
	// Change a property in the selection, which can be the key, velocity, panning or pitch (1-4).
	// If 'add' is true, the value will be added to the property rather than changing it.
	var a, b, str, property, amount, val, add;
	property = argument0
	amount = argument1
	add = argument2
	str = selection_code
	if (selected = 0) return 0
	for (a = 0; a < selection_l; a += 1) {
	    if (selection_colfirst[a] > -1) {
	        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
	            if (selection_exists[a, b]) {
					switch property {
						case m_key: {
							if (add) {
								val = selection_key[a, b]
								val += amount
							} else {
								val = amount
							}
							if (val >= 0 && val <= 87) selection_key[a, b] = val
							break
						}
						case m_vel: {
							if (add) {
								val = selection_vel[a, b]
								val += amount
							} else {
								val = amount
							}
							if (val >= 0 && val <= 100) selection_vel[a, b] = val
							break
						}
						case m_pan: {
							if (add) {
								val = selection_pan[a, b]
								val += amount
							} else {
								val = amount
							}
							if (val >= 0 && val <= 200) selection_pan[a, b] = val
							break
						}
						case m_pit: {
							if (add) {
								val = selection_pit[a, b]
								val += amount
							} else {
								val = amount
							}
							if (val >= -1200 && val <= 1200) selection_pit[a, b] = val
							break
						}
					}
	            }
	        }
	    }
	}
	selection_code_update()
	history_set(h_selectchange, selection_x, selection_y, try_compress_selection(selection_code), selection_x, selection_y, try_compress_selection(str))



}
