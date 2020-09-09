// add_layer(num, undo[, blocks, x, lock, vol, pan])

var num, solonum, solostrnew, i, char, blocks, xx, name, lock, vol, pan, l


//Checking for arguments
num = argument[0]
if (argument_count > 2) {
	blocks = argument[2]
	xx = argument[3]
	name = argument[4]
	lock = argument[5]
	vol = argument[6]
	pan = argument[7]
}
else {
	blocks = ""
	xx = 0
	name = ""
	lock = 0
	vol = 100
	pan = 100
}

// Update solo
solonum = ""
solostrnew = solostr
if (solostr != "") {
	for (i = 1; i <= string_length(solostr); i++) {
		char = string_char_at(solostr, i)
		if (char = string_digits(char)) {
			solonum += char
		} else if ((char = "|") && (solonum != "") && (real(solonum) > num)) {
			// if number is greater than the layer being added, add one to it
			solostrnew = string_replace_all(solostrnew, "|" + solonum + "|", "|" + string(real(solonum) + 1) + "|")
			solonum = ""
		}
	}
}
if (lock == 2) solostrnew += "|" + string(num) + "|"
solostr = solostrnew

// Shift blocks down
selection_place(false)
selection_add(0, num, enda, endb2, 0, true, true)
selection_y += 1
selection_place(true)

// Set properties on last layer (will be shifted up)
text_str[endb2 + 100] = ""
layername[endb2] = ""
layerlock[endb2] = 0
layervol[endb2] = 100
layerstereo[endb2] = 100
endb2 += 1

// Shift properties
for (l = endb2; l > num; l--) {
	layername[l] = layername[l - 1]
	layerlock[l] = layerlock[l - 1]
	layervol[l] = layervol[l - 1]
	layerstereo[l] = layerstereo[l - 1]
	swap_text_edit(100 + l, 100 + l - 1)
}

// Place layer back
if (blocks != "") {
	selection_load(xx, num, blocks, true)
	selection_place(true)
}
text_str[num + 100] = name
layername[num] = name
layerlock[num] = lock
layervol[num] = vol
layerstereo[num] = pan

changed = 1
if (!argument[1]) history_set(h_addlayer, num, blocks, xx, name, lock, vol, pan)
