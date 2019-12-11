// branch_export()
var fn, a, b, o, z, sch_len, nblocks, nblockins, nblockvel, zvel, pass, tags, sch_layer1, sch_layer2, sch_layer3, entries
fn = string(get_save_filename_ext("Minecraft Schematics (*.schematic)|*.schematic", filename_new_ext(filename, ""), "", "Export Schematic"))
if (fn = "") return 0
//fn = string_replace_all(fn, ".schematic", "")
//fn += ".schematic"
o = obj_controller
window = -1
// Calculate maximum height and note block count
schematic_start();
var mySchematic = schematic_create();
var rangestart = sch_exp_range_start
var rangeend = sch_exp_range_end
show_debug_message("rangestart " + string(rangestart))
show_debug_message("rangeend " + string(rangeend))
show_debug_message("enda " + string(enda))
tags = 0
sch_len = rangeend * 2 + 4
schematic_size(mySchematic, 3, sch_len, 2 )
if sch_exp_velocity = 1 schematic_size(mySchematic, 33, sch_len, 2 )
if sch_exp_chords > 1 && sch_exp_velocity = 1 schematic_size(mySchematic, 33, sch_len, 3 )
pass = sch_exp_chords
if sch_exp_velocity = 1 var lineloc = 16 else lineloc = 1
sch_layer1 = 0
sch_layer2 = 0
sch_layer3 = 0

if pass >= 2 {
var sellayer = real(sch_br_layer2) - 1
	z = 1
//////////////////////////////////////////////////// for some reason I can't get this working in a for loop, so I'll just repeat it like the hack I am.
	if sch_exp_circuitry = 1 && z = 0 {
			schematic_cell_set(mySchematic, lineloc, 1, 1, 93, 3) // First repeater
			schematic_fill(mySchematic, lineloc, 1, 0, lineloc, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Line

		// Repeater Pattern on top

		for (a = 0; a <= rangeend * 2; a++) {
			if a % 2 == 1 {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, 93, 3)
			} else {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
			}
		}
	}

	// Add Note Blocks to Array
	nblocks = 0

	for (a = 0; a <= rangeend; a ++) {
		if (o.song_exists[a, sellayer]) {
				if (o.song_key[a, sellayer] > 32 && o.song_key[a, sellayer] < 58) {
					if sch_exp_stereo = 4 { // Add all note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if sch_exp_stereo = 3 && o.song_pan[a, sellayer] = 100 { // Add centered note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if  sch_exp_stereo = 2 && o.song_pan[a, sellayer] < 100 { // Add left note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if sch_exp_stereo = 1 && o.song_pan[a, sellayer] > 100 { //Add right note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else {
						nblockkey[z, nblocks] = 0
						nblocks ++
					}
				}
				//show_debug_message("note read.")
		} else {
				nblockkey[z, nblocks] = 0
				nblocks ++
		}
	}

	// Add Note Blocks to Structure
	b = nblocks
	nblocks = 0

	for (a = 0; a <= rangeend * 2; a++) {
		if a % 2 == 0 {
			if nblockkey[z, nblocks] != 0 { 
				if sch_exp_velocity = 0 {
					if z = 1 {
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc + 1
					} else if z = 2 {
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc - 1
					} else {
						schematic_cell_set(mySchematic, lineloc, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc
						//show_debug_message("note written.")
					}
				noteblockx[z, nblocks] = a + 2
				} else {
					zvel = round(32 - nblockvel[z, nblocks]/100 * 32)
					if zvel >= 15 && zvel <= 17 zvel = 14
					if sch_exp_circuitry = 1 {
							schematic_fill(mySchematic, lineloc, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Connects a redstone line to the block
							schematic_cell_set(mySchematic, zvel, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
							schematic_cell_set(mySchematic, zvel, a + 2, 2, 55, 0)
						if zvel > 16 {
							schematic_fill(mySchematic, lineloc + 1, a + 2, 1, zvel - 1, a + 2, 1, 55, 0)
						} 
						if zvel < 16 {
							schematic_fill(mySchematic, lineloc - 1, a + 2, 1, zvel + 1, a + 2, 1, 55, 0)
						}
					}
					if sch_br_layer2 != 0 && z = 1 {
						schematic_cell_set(mySchematic, zvel, a + 3, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
					    noteblockx[z, nblocks] = a + 3
					} else if sch_br_layer3 != 0 && z = 2 {
						schematic_cell_set(mySchematic, zvel, a + 1, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 1
					} else {
						schematic_cell_set(mySchematic, zvel, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 2
					}
					noteblockz[z, nblocks] = zvel
				}
		    noteblocky[z, nblocks] = 1
			noteblocknote[z, nblocks] = nblockkey[z, nblocks] - 33
			}
		nblocks ++
		}
	}
	sch_layer2 = nblocks
}
////////////////////////////////////////////////////
if pass >=3 {
sellayer = real(sch_br_layer3) - 1
	z = 2
//////////////////////////////////////////////////// for some reason I can't get this working in a for loop, so I'll just repeat it like the hack I am.
	if sch_exp_circuitry = 1 && z = 0 {
			schematic_cell_set(mySchematic, lineloc, 1, 1, 93, 3) // First repeater
			schematic_fill(mySchematic, lineloc, 1, 0, lineloc, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Line

		// Repeater Pattern on top

		for (a = 0; a <= rangeend * 2; a++) {
			if a % 2 == 1 {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, 93, 3)
			} else {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
			}
		}
	}

	// Add Note Blocks to Array
	nblocks = 0

	for (a = 0; a <= rangeend; a ++) {
		if (o.song_exists[a, sellayer]) {
				if (o.song_key[a, sellayer] > 32 && o.song_key[a, sellayer] < 58) {
					if sch_exp_stereo = 4 { // Add all note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if sch_exp_stereo = 3 && o.song_pan[a, sellayer] = 100 { // Add centered note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if  sch_exp_stereo = 2 && o.song_pan[a, sellayer] < 100 { // Add left note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if sch_exp_stereo = 1 && o.song_pan[a, sellayer] > 100 { //Add right note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else {
						nblockkey[z, nblocks] = 0
						nblocks ++
					}
				}
				//show_debug_message("note read.")
		} else {
				nblockkey[z, nblocks] = 0
				nblocks ++
		}
	}

	// Add Note Blocks to Structure
	b = nblocks
	nblocks = 0

	for (a = 0; a <= rangeend * 2; a++) {
		if a % 2 == 0 {
			if nblockkey[z, nblocks] != 0 { 
				if sch_exp_velocity = 0 {
					if z = 1 {
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc + 1
					} else if z = 2 {
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc - 1
					} else {
						schematic_cell_set(mySchematic, lineloc, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc
						//show_debug_message("note written.")
					}
				noteblockx[z, nblocks] = a + 2
				} else {
					zvel = round(32 - nblockvel[z, nblocks]/100 * 32)
					if zvel >= 15 && zvel <= 17 zvel = 14
					if sch_exp_circuitry = 1 {
							schematic_fill(mySchematic, lineloc, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Connects a redstone line to the block
							schematic_cell_set(mySchematic, zvel, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
							schematic_cell_set(mySchematic, zvel, a + 2, 2, 55, 0)
						if zvel > 16 {
							schematic_fill(mySchematic, lineloc + 1, a + 2, 1, zvel - 1, a + 2, 1, 55, 0)
						} 
						if zvel < 16 {
							schematic_fill(mySchematic, lineloc - 1, a + 2, 1, zvel + 1, a + 2, 1, 55, 0)
						}
					}
					if sch_br_layer2 != 0 && z = 1 {
						schematic_cell_set(mySchematic, zvel, a + 3, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
					    noteblockx[z, nblocks] = a + 3
					} else if sch_br_layer3 != 0 && z = 2 {
						schematic_cell_set(mySchematic, zvel, a + 1, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 1
					} else {
						schematic_cell_set(mySchematic, zvel, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 2
					}
					noteblockz[z, nblocks] = zvel
				}
		    noteblocky[z, nblocks] = 1
			noteblocknote[z, nblocks] = nblockkey[z, nblocks] - 33
			}
		nblocks ++
		}
	}
	sch_layer3 = nblocks
}
////////////////////////////////////////////////////
if pass >= 1 {
sellayer = real(sch_br_layer1) - 1
	z = 0
//////////////////////////////////////////////////// for some reason I can't get this working in a for loop, so I'll just repeat it like the hack I am.
	if sch_exp_circuitry = 1 && z = 0 {
			schematic_cell_set(mySchematic, lineloc, 1, 1, 93, 3) // First repeater
			schematic_fill(mySchematic, lineloc, 1, 0, lineloc, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Line

		// Repeater Pattern on top

		for (a = 0; a <= rangeend * 2; a++) {
			if a % 2 == 1 {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, 93, 3)
			} else {
				schematic_cell_set(mySchematic, lineloc, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
			}
		}
	}

	// Add Note Blocks to Array
	nblocks = 0

	for (a = 0; a <= rangeend; a ++) {
		if (o.song_exists[a, sellayer]) {
				if (o.song_key[a, sellayer] > 32 && o.song_key[a, sellayer] < 58) {
					if sch_exp_stereo = 4 { // Add all note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if sch_exp_stereo = 3 && o.song_pan[a, sellayer] = 100 { // Add centered note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else if  sch_exp_stereo = 2 && o.song_pan[a, sellayer] < 100 { // Add left note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						show_debug_message(nblockkey[z, nblocks])
						nblocks ++
					} else if sch_exp_stereo = 1 && o.song_pan[a, sellayer] > 100 { //Add right note blocks
						nblockkey[z, nblocks] = o.song_key[a, sellayer]
						nblockins[z, nblocks] = o.song_ins[a, sellayer] - 100002
						nblockvel[z, nblocks] = o.song_vel[a, sellayer]
						nblocks ++
					} else {
						nblockkey[z, nblocks] = 0
						nblocks ++
					}
				}
				//show_debug_message("note read.")
		} else {
				nblockkey[z, nblocks] = 0
				nblocks ++
		}
	}

	// Add Note Blocks to Structure
	b = nblocks
	nblocks = 0

	for (a = 0; a <= rangeend * 2; a++) {
		if a % 2 == 0 {
			if nblockkey[z, nblocks] != 0 { 
				if sch_exp_velocity = 0 {
					if z = 1 {
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc + 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc + 1
					} else if z = 2 {
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc - 1, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc - 1
					} else {
						schematic_cell_set(mySchematic, lineloc, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, lineloc, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
						noteblockz[z, nblocks] = lineloc
						//show_debug_message("note written.")
					}
				noteblockx[z, nblocks] = a + 2
				} else {
					zvel = round(32 - nblockvel[z, nblocks]/100 * 32)
					if zvel >= 15 && zvel <= 17 zvel = 14
					if sch_exp_circuitry = 1 {
							schematic_fill(mySchematic, lineloc, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Connects a redstone line to the block
						if zvel > 16 {
							var c
							for (c = lineloc + 1; c <= zvel; c++) {
								if (schematic_block_get(mySchematic, zvel + (c - zvel), a + 2, 1) = 0) {
									schematic_block_set(mySchematic, zvel + (c - zvel), a + 2, 1, 55)
								}
							}
						} 
						if zvel < 16 {
							var c
							for (c = lineloc - 1; c >= zvel; c--) {
								if (schematic_block_get(mySchematic, zvel + (c - zvel), a + 2, 1) = 0) {
									schematic_block_set(mySchematic, zvel + (c - zvel), a + 2, 1, 55)
								}
							}
						}
					}
					if sch_br_layer2 != 0 && z = 1 {
						schematic_cell_set(mySchematic, zvel, a + 3, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 3, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
					    noteblockx[z, nblocks] = a + 3
					} else if sch_br_layer3 != 0 && z = 2 {
						schematic_cell_set(mySchematic, zvel, a + 1, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 1, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 1
					} else {
						schematic_cell_set(mySchematic, zvel, a + 2, 1, 25, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 2, 0, 0)
						schematic_cell_set(mySchematic, zvel, a + 2, 0, sch_exp_ins_block[nblockins[z, nblocks]], 0)
							
					    noteblockx[z, nblocks] = a + 2
					}
					noteblockz[z, nblocks] = zvel
				}
		    noteblocky[z, nblocks] = 1
			noteblocknote[z, nblocks] = nblockkey[z, nblocks] - 33
			}
		nblocks ++
		}
	}
	sch_layer1 = nblocks
}
////////////////////////////////////////////////////
var noteblocks = 0

for (a = 0; a <= rangeend; a ++) {
	if sch_exp_chords = 1 {
		if o.song_exists[a, real(sch_br_layer1) - 1] { 
			noteblocks++
		}
	}
	if sch_exp_chords = 2 {
		if o.song_exists[a, real(sch_br_layer1) - 1] { 
			noteblocks++
		}
		if o.song_exists[a, real(sch_br_layer2) - 1] { 
			noteblocks++
		}
	}
	if sch_exp_chords = 3 {
		if o.song_exists[a, real(sch_br_layer1) - 1] { 
			noteblocks++
		}
		if o.song_exists[a, real(sch_br_layer2) - 1] { 
			noteblocks++
		}
		if o.song_exists[a, real(sch_br_layer3) - 1] { 
			noteblocks++
		}
	}
}
show_debug_message(sch_layer1)
show_debug_message(sch_layer2)
show_debug_message(sch_layer3)
show_debug_message(noteblocks)
entries = 0
schematic_save(mySchematic, fn, entries, noteblocks);
schematic_destroy(mySchematic);
schematic_end();
message("Schematic saved!", "Schematic Export")
window = w_branch_export
