// shift_layers(layer1, layer2, undo)
// Shifts the contents and names of two layers

var l1, l2, tempx, templayer, templayername, templayerlock, templayervol, templayerstereo
l1 = argument0
l2 = argument1

// Add new layer at the end if necessary
if (l1 >= endb2 || l2 >= endb2) {
	endb2 += 1
	layername[endb2] = ""
	layerlock[endb2] = 0
	layervol[endb2] = 100
	layerstereo[endb2] = 100
}

// Update solo
if (layerlock[l1] = 2 ^^ layerlock[l2] = 2) {
	if (layerlock[l1] = 2) solostr = string_replace_all(solostr, "|" + string(l1) + "|", "|" + string(l2) + "|")
	else if (layerlock[l2] = 2) solostr = string_replace_all(solostr, "|" + string(l2) + "|", "|" + string(l1) + "|")
}

// Store first layer
selection_place(false)
selection_add(0, l1, enda, l1, 0, true, true)
tempx = selection_x
templayer = selection_code
templayername = layername[l1]
templayerlock = layerlock[l1]
templayervol = layervol[l1]
templayerstereo = layerstereo[l1]
selection_delete(true)

// Move second layer to first
selection_add(0, l2, enda, l2, 0, true, true)
selection_y = l1
selection_place(true)
layername[l1] = layername[l2]
layerlock[l1] = layerlock[l2]
layervol[l1] = layervol[l2]
layerstereo[l1] = layerstereo[l2]

// Place stored layer into second layer
selection_load(tempx, l2, templayer, true)
selection_place(true)
layername[l2] = templayername
layerlock[l2] = templayerlock
layervol[l2] = templayervol
layerstereo[l2] = templayerstereo

// Swap name boxes
swap_text_edit(100 + l1, 100 + l2)

changed = 1
if (!argument2) history_set(h_swaplayer, l1, l2)