// selection_change(property, dif)
// Change a property in the selection, which can be the key, velocity, panning or pitch (1-4).
var a, b, str, property, dif, val;
property = argument0
dif = argument1
str = selection_code
if (selected = 0) return 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) {
        for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
            if (selection_exists[a, b]) {
				switch property {
					case m_key: {
		                var val = selection_key[a, b]
		                val += dif
						if (val >= 0 && val <= 87) selection_key[a, b] = val
						break
					}
					case m_vel: {
						val = selection_vel[a, b]
						val += dif
						if (val >= 0 && val <= 200) selection_vel[a, b] = val
						break
					}
					case m_pan: {
						val = selection_pan[a, b]
						val += dif
						if (val >= 0 && val <= 200) selection_pan[a, b] = val
						break
					}
					case m_pit: {
						val = selection_pit[a, b]
						val += dif
						selection_pit[a, b] = val
						break
					}
				}
            }
        }
    }
}
selection_code_update()
history_set(h_selectchange, selection_x, selection_y, selection_code, selection_x, selection_y, str)
