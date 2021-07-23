var theme;
theme = obj_controller.theme
if (!mouse_rectangle(x1, y1, w, h)) {global.popup = 0 instance_destroy()}
if (alarm[0] > -1) exit
if (alpha < 1) alpha += 0.5
if (singleline) {
    draw_sprite_ext(spr_tooltip_sl_left, theme, x, y, 1, 1, 0, -1, alpha)
    draw_sprite_ext(spr_tooltip_sl_middle, theme, x + 4 - 2 * theme, y, (maxw + 8 - 4 * theme), 1, 0, -1, alpha)
    draw_sprite_ext(spr_tooltip_sl_right, theme, x + 4 - 2 * theme + (maxw + 8 - 4 * theme), y, 1, 1, 0, -1, alpha)
} else {
    draw_sprite_ext(spr_tooltip_ml_left, theme, x, y, 1, 1, 0, -1, alpha)
    draw_sprite_ext(spr_tooltip_ml_middle, theme, x + 4 - 2 * theme, y, (maxw + 8 - 4 * theme), 1, 0, -1, alpha)
    draw_sprite_ext(spr_tooltip_ml_right, theme, x + 4 - 2 * theme + (maxw + 8 - 4 * theme), y, 1, 1, 0, -1, alpha)
}
draw_set_alpha(alpha)
draw_set_color(make_color_rgb(75, 75, 75)*!obj_controller.theme)
draw_text(x + 7 - 2 * theme, y + 3, str)
draw_set_alpha(1)
draw_set_color(c_black)

