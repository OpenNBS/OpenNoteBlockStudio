// selection_remove(x1, y1, x2, y2, all, undo)
// Removes the blocks within the given area from the selection.
var x1, y1, x2, y2, key, ins, a, b, c, sa, sb, vel, pan, pit;
if (!argument4) {
    x1 = min(argument0, argument2)
    y1 = min(argument1, argument3)
    x2 = max(argument0, argument2)
    y2 = max(argument1, argument3)
    x1 = max(0, x1)
    y1 = max(0, y1)
    x2 = max(0, x2) + 1
    y2 = max(0, y2) + 1
    if (selected = 0) return 0
    ac = 0
    for (a = x1; a < x2; a += 1) {
        for (b = y1; b < y2; b += 1) {
            if (a >= selection_x && b >= selection_y && a < selection_x + selection_l && b < selection_y + selection_h) {
                if (selection_exists[a - selection_x, b - selection_y]) ac += 1
            }
        }
    }
    if (ac = 0) return 0 // None selected
} else {
    ac = selected
    x1 = selection_x
    y1 = selection_y
    x2 = selection_x + selection_l
    y2 = selection_y + selection_h
}
if (!argument5) history_set(h_selectremove, x1, y1, x2, y2, selection_x, selection_y, selection_code, region_code_get(x1, y1, x2, y2))
if (ac = selected) {
    for (a = 0; a < selection_l; a += 1) {
        if (selection_colfirst[a] > -1) {
            for (b = selection_colfirst[a]; b <= selection_collast[a]; b += 1) {
                if (selection_exists[a, b]) {
                    ins = selection_ins[a, b]
                    key = selection_key[a, b]
                    vel = selection_vel[a, b]
                    pan = selection_pan[a, b]
                    pit = selection_pit[a, b]
                    sa = selection_x + a
                    sb = selection_y + b
                    add_block_select(sa, sb, ins, key, vel, pan, pit)
                    selection_exists[a, b] = 0
                    selection_ins[a, b] = 0
                    selection_key[a, b] = 0
                    selection_vel[a, b] = 0
                    selection_pan[a, b] = 0
                    selection_pit[a, b] = 0
                    selection_played[a, b] = 0
                }
            }
            selection_colfirst[a] = -1
            selection_collast[a] = -1
        }
    }
    update_songsize()
    selected = 0
    selection_code = ""
    selection_x = 0
    selection_y = 0
    selection_l = 0
    selection_h = 0
} else {
    for (a = x1; a < x2; a += 1) {
        for (b = y1; b < y2; b += 1) {
            if (a >= selection_x && b >= selection_y && a < selection_x + selection_l && b < selection_y + selection_h) {
                sa = a - selection_x
                sb = b - selection_y
                if (sb >= selection_colfirst[sa] && sb <= selection_collast[sa]) {
                    if (selection_exists[sa, sb]) {
                        ins = selection_ins[sa, sb]
                        key = selection_key[sa, sb]
                        vel = selection_vel[sa, sb]
                        pan = selection_pan[sa, sb]
                        pit = selection_pit[sa, sb]
                        add_block_select(a, b, ins, key, vel, pan, pit)
                        selection_exists[sa, sb] = 0
                        selection_ins[sa, sb] = 0
                        selection_key[sa, sb] = 0
                        selection_vel[sa, sb] = 0
                        selection_pan[sa, sb] = 0
                        selection_pit[sa, sb] = 0
                        selection_played[sa, sb] = 0
                        selected -= 1
                        if (selection_colfirst[sa] = sb) {
                            selection_colfirst[sa] = -1
                            for (c = sb; c < selection_h; c += 1) {
                                if (selection_exists[sa, c]) {
                                    selection_colfirst[sa] = c
                                    break
                                }
                            }
                        }
                        if (selection_collast[sa] = sb) {
                            selection_collast[sa] = -1
                            for (c = sb; c >= 0; c -= 1) {
                                if (selection_exists[sa, c]) {
                                    selection_collast[sa] = c
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    selection_trim()
    selection_code_update()
}
