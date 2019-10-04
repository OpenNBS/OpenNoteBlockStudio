// selection_draw(x, y, w, h)
// Draws the selection.
var xs, ys, x1, y1, x2, y2, w, h, sa, sb, salpha, a, b, c, d, e, xx;
x1 = selection_x
y1 = selection_y
x2 = x1 + selection_l
y2 = y1 + selection_h
xs = argument0
ys = argument1
w = argument2
h = argument3
draw_set_halign(fa_center)
// Play
if (floor(marker_pos) != floor(marker_prevpos) && marker_pos >= selection_x && marker_pos < selection_x + selection_l) {
    xx = floor(marker_pos) - selection_x
    if (selection_colfirst[xx] > -1) {
        for (b = selection_colfirst[xx]; b <= selection_collast[xx]; b += 1) {
            if (selection_exists[xx, b]) {
                a = 1
                c = 100
				d = 100
				e = 0
                if (selection_y + b < endb2) c = layervol[selection_y + b]
				if (selection_y + b < endb2) d = layerstereo[selection_y + b]
                if (solostr != "") {
                    if (string_count("|" + string(selection_y + b) + "|", solostr) = 0) {
                        a = 0
                    } else if (layerlock[selection_y + b] = 1) {
                        a = 0
                    }
                } else if (selection_y + b < endb2) {
                    if (layerlock[selection_y + b] = 1) {
                        a = 0
                    }
                }
                if (a) {
                    if (selection_ins[xx, b].loaded) play_sound(selection_ins[xx, b], selection_key[xx, b], c , d, e)
                    if (selection_ins[xx, b].press) key_played[selection_key[xx, b]] = current_time
                    selection_played[xx, b] = current_time
                }
            }
        }
    }
}

if (x1 > starta + w || y1 > startb + h || x2 <= starta || y2 <= startb) return 0 // Outside
for (a = max(starta, x1); a < min(starta + w, x2); a += 1) {
    sa = a - selection_x
    if (selection_colfirst[sa] > -1) {
        for (b = max(startb, y1); b < min(startb + h, y2); b += 1) {
            sb = b - selection_y
            if (sb >= selection_colfirst[sa] && sb <= selection_collast[sa]) {
                if (selection_exists[sa, sb]) {
                    salpha = 0.8
                    if (window < 1) {
                        if (select = 2) {
                            if (is_inside(a, b, select_pressa, select_pressb, selbx, selby)) salpha = 0.5
                        } else if (select = 0 && !cursmarker && playing = 0) {
                            if (mouse_rectangle(xs + (a - starta) * 32, ys + (b - startb) * 32, 32, 32)) {
                                salpha = 0.7
                                curs = cr_size_all
                                if (mouse_check_button_pressed(mb_left)) {
                                    window = w_dragselection
                                    select_pressa = sa
                                    select_pressb = sb
                                    selection_sx = selection_x
                                    selection_sy = selection_y
                                }
                            }
                        }
                    } else if (window = w_dragselection) {
                        if (select_pressa = sa && select_pressb = sb) salpha = 0.7
                    }
//                    salpha += 0.1 * (1 - (min(1000, current_time - selection_played[sa, sb]) / 1000))
                    draw_block(xs + (a - starta) * 32, ys + (b - startb) * 32, selection_ins[sa, sb], selection_key[sa, sb], 1, salpha)
                }
            }
        }
    }
}
// draw_set_color(c_red)
// draw_rectangle(xs + (selection_x - starta) * 32, ys + (selection_y - startb) * 32, xs + (selection_x + selection_l - starta) * 32, ys + (selection_y + selection_h - startb) * 32, 1)
draw_set_halign(fa_left)
draw_set_alpha(1)
draw_theme_color()
