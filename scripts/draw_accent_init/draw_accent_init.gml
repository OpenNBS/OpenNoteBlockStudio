function draw_accent_init(){
	if (accent1 > accent2 && accent1 > accent3) hiacc = accent1
	else if (accent2 > accent1 && accent2 > accent3) hiacc = accent2
	else hiacc = accent3
	accent[0] = make_color_rgb(accent1 * 0.7, accent2 * 0.7, accent3 * 0.7)
	accent[1] = make_color_rgb(accent1 * 0.8, accent2 * 0.8, accent3 * 0.8)
	accent[2] = make_color_rgb(accent1 * 0.9, accent2 * 0.9, accent3 * 0.9)
	accent[3] = make_color_rgb(accent1, accent2, accent3)
	accent[4] = make_color_rgb(accent1 + (hiacc - accent1) * 0.1, accent2 + (hiacc - accent2) * 0.1, accent3 + (hiacc - accent3) * 0.1)
	accent[5] = make_color_rgb(accent1 + (hiacc - accent1) * 0.1 * 2, accent2 + (hiacc - accent2) * 0.1 * 2, accent3 + (hiacc - accent3) * 0.1 * 2)
	accent[6] = make_color_rgb(accent1 + (hiacc - accent1) * 0.1 * 3, accent2 + (hiacc - accent2) * 0.1 * 2, accent3 + (hiacc - accent3) * 0.1 * 3)
	accent[7] = make_color_rgb(accent1 + (hiacc - accent1) * 0.1 * 5, accent2 + (hiacc - accent2) * 0.1 * 5, accent3 + (hiacc - accent3) * 0.1 * 5)
	accent[8] = make_color_rgb(accent1 * 0.5, accent2 * 0.5, accent3 * 0.5)
}