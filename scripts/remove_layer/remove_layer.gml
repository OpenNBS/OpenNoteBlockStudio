function remove_layer(argument0, argument1) {
	// remove_layer(num, undo)
	// Removes the contents of the layer and shifts up everything below

	var num, solonum, solostrnew, i, char, blocks, xx, name, lock, vol, pan, l
	num = argument0

	// Update solo
	solostr = string_replace_all(solostr, "|" + string(num) + "|", "")
	solonum = ""
	solostrnew = solostr
	if (solostr != "") {
		for (i = 1; i <= string_length(solostr); i++) {
			char = string_char_at(solostr, i)
			if (char = string_digits(char)) {
				solonum += char
			} else if ((char = "|") && (solonum != "") && (real(solonum) > num)) {
				// if number is greater than the layer being removed, subtract one from it
				solostrnew = string_replace_all(solostrnew, "|" + solonum + "|", "|" + string(real(solonum - 1)) + "|")
				solonum = ""
			}
		}
	}
	solostr = solostrnew

	// Remove blocks
	selection_place(false)
	selection_add(0, num, enda, num, 0, true, true)
	blocks = selection_code
	xx = selection_x
	name = layername[num]
	lock = layerlock[num]
	vol = layervol[num]
	pan = layerstereo[num]
	selection_delete(true)

	// Remove properties
	text_str[num + 100] = ""
	layername[num] = ""
	layerlock[num] = 0
	layervol[num] = 100
	layerstereo[num] = 100

	// Shift blocks up
	selection_add(0, num + 1, enda, endb2, 0, true, true)
	selection_y -= 1
	selection_place(true)

	// Shift properties
	for (l = num; l < endb2 - 1; l++) {
		layername[l] = layername[l + 1]
		layerlock[l] = layerlock[l + 1]
		layervol[l] = layervol[l + 1]
		layerstereo[l] = layerstereo[l + 1]
		swap_text_edit(400 + l, 400 + l + 1)
	}

	endb2 -= 1

	changed = 1
	if (!argument1) history_set(h_removelayer, num, blocks, xx, name, lock, vol, pan)


}
