function draw_acrylic_texture(x, y, w, h){
	for (var i = 0; i < floor(w / 64) + 1; i++) {
		for (var j = 0; j < floor(h / 64) + 1; j++) {
			//draw_sprite_ext(spr_acrylic_texture, 0, x + i * 64, y + j * 64, ((w % 64) / 100) * (i = floor(w / 64)) + (i < floor(w / 64)), ((h % 64) / 100) * (j = floor(h / 64)) + (j < floor(h / 64)), 0, -1 + (!obj_controller.fdark), 0.7)
			draw_sprite_part_ext(spr_acrylic_texture, 0, 0, 0, (w % 64) * (i = floor(w / 64)) + (i < floor(w / 64)) * 64, (h % 64) * (j = floor(h / 64)) + (j < floor(h / 64)) * 64, x + i * 64, y + j * 64, 1, 1, -1 + (!obj_controller.fdark), 0.7)
		}
	}
}