// selection_trim()
// Removes unneccesary space from selection.
var x1, y1, x2, y2, a, b, temp_colfirst, temp_collast, temp_exists, temp_ins, temp_vel, temp_pan, temp_key, temp_played;
for (x1 = 0; x1 < selection_l; x1 += 1) {
    if (selection_colfirst[x1] > -1) break
}
for (x2 = selection_l - 1; x2 >= 0; x2 -= 1) {
    if (selection_colfirst[x2] > -1) break
}
y1 = selection_h
for (a = 0; a < selection_l; a += 1) {
    if (selection_colfirst[a] > -1) y1 = min(selection_colfirst[a], y1)
}
y2 = 0
for (a = 0; a < selection_l; a += 1) {
    if (selection_collast[a] > -1) y2 = max(selection_collast[a], y2)
}
x2 += 1
y2 += 1
if (x1 > 0 || y1 > 0) {
    for (a = x1; a < x2; a += 1) {
        if (selection_colfirst[a] > -1) {
            for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
                if (selection_exists[a, b]) {
                    temp_exists[a - x1, b - y1] = 1
                    temp_ins[a - x1, b - y1] = selection_ins[a, b]
                    temp_key[a - x1, b - y1] = selection_key[a, b]
                    temp_vel[a - x1, b - y1] = selection_vel[a, b]
                    temp_pan[a - x1, b - y1] = selection_pan[a, b]
                    temp_played[a - x1, b - y1] = selection_played[a, b]
                    selection_exists[a, b] = 0
                    selection_ins[a, b] = 0
                    selection_key[a, b] = 0
                    selection_vel[a, b] = 0
                    selection_pan[a, b] = 0
                    selection_played[a, b] = 0
                } else {
                    temp_exists[a - x1, b - y1] = 0
                }
            }
        }
        temp_colfirst[a - x1] = max(-1, selection_colfirst[a] - y1)
        temp_collast[a - x1] = max(-1, selection_collast[a] - y1)
        selection_colfirst[a] = -1
        selection_collast[a] = -1
    }
    for (a = 0; a < x2 - x1; a += 1) {
        if (temp_colfirst[a] > -1) {
            for (b = temp_colfirst[a]; b <= temp_collast[a]; b += 1) {
                if (temp_exists[a, b]) {
                    selection_exists[a, b] = 1
                    selection_ins[a, b] = temp_ins[a, b]
                    selection_key[a, b] = temp_key[a, b]
                    selection_vel[a, b] = temp_vel[a, b]
                    selection_pan[a, b] = temp_pan[a, b]
                    selection_played[a, b] = temp_played[a, b]
                }
            }
        }
        selection_colfirst[a] = temp_colfirst[a]
        selection_collast[a] = temp_collast[a]
    }
}
selection_x += x1
selection_y += y1
selection_l = x2 - x1
selection_h = y2 - y1
