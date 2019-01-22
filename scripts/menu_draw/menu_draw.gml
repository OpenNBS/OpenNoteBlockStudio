// menu_draw()
if (ani < 1) ani += 0.2
var m, menux, menuy, noclick;
menux[0] = sx
menuy[0] = sy
sel = -1
noclick = 0
for (m = 0; m < menus; m += 1) {
    if (!menu_show[m]) continue
    var dx, dy, i, iy, hei;
    dx = menux[m]
    dy = menuy[m]
    hei = menu_hei[m] * (1 - power(1 - ani, 2))
    if (dy + hei > window_height) dy = window_height - hei
    iy = 8
    draw_set_color(window_background)
    draw_rectangle(dx, dy, dx + menu_wid[m], dy + hei, 0)
    draw_set_alpha(0.25)
    draw_set_color(0)
    draw_line(dx + 29, dy + 3, dx + 29, dy + hei - 3)
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_line(dx + 30, dy + 3, dx + 30, dy + hei - 3)
    draw_set_color(0)
    draw_set_alpha(0.25)
    draw_rectangle(dx, dy, dx + menu_wid[m], dy + hei, 1)
    draw_set_alpha(1)
    for (i = 0; i < items[m]; i += 1) {
        if (iy >= hei - 3) break
        if (item_str[m, i] = "-") { // Separator
            draw_set_alpha(0.25)
            draw_set_color(0)
            draw_line(dx + 32, dy + iy - 2, dx + menu_wid[m] - 3, dy + iy - 2)
            draw_set_alpha(1)
            draw_set_color(c_white)
            draw_line(dx + 32, dy + iy - 1, dx + menu_wid[m] - 3, dy + iy - 1)
            iy += 6
        } else {
            var issel;
            issel = (mouse_rectangle(dx + 3, dy + iy - 5, menu_wid[m] - 5, 22))
            if (issel) { // Close higher menus
                var om;
                for (om = m + 1; om < menus; om += 1) menu_show[om] = 0
                if (ani = 1) {
                    sel = item_n[m, i]
                    if (item_hasmenu[m, i] > 0 || item_inactive[m, i]) noclick = 1
                }
                selmenu = m
                selitem = i
            }
            if (item_inactive[m, i]) issel = 0
            if (item_hasmenu[m, i] > 0) {
                if (menu_show[item_hasmenu[m, i]]) issel = 1
                if (issel) {
                    menu_show[item_hasmenu[m, i]] = 1
                    menux[item_hasmenu[m, i]] = dx + menu_wid[m] - 3
                    menuy[item_hasmenu[m, i]] = dy + iy - 8
                }
            }
            draw_set_color(0)
            if (issel) {
                draw_set_color(16684072)
                draw_rectangle(dx + 3, dy + iy - 5, dx + menu_wid[m] - 2, dy + iy - 5 + 22, 0)
                draw_set_color(c_white)
            }
            draw_set_alpha(1 - 0.5 * item_inactive[m, i])
            draw_text(dx + 36, dy + iy, item_str[m, i])
            if (item_shortcut[m, i] != "") {
                draw_set_halign(fa_right)
                draw_text(dx + menu_wid[m] - 20, dy + iy, item_shortcut[m, i])
                draw_set_halign(fa_left)
            }
            if (item_image[m, i] > -1) draw_sprite(spr_icons, item_image[m, i], dx + 2, dy + iy - 6)
            if (item_hasmenu[m, i] > 0) draw_sprite_ext(spr_icons, icons.SUB_MENU, dx + menu_wid[m] - 24, dy + iy - 6, 1, 1, 0, c_white * issel, draw_get_alpha())
            draw_set_alpha(1)
            iy += 22
        }
    }
}
if (mouse_check_button_released(mb_left) && ani = 1 && !noclick) {
    var a;
    a = sel
    with (obj_controller) menu_click(a)
    instance_destroy()
}
draw_set_color(0)
