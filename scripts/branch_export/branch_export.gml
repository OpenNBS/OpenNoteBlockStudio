// branch_export()
var fn, a, b, o, sch_len, nblocks, nblockins, nblockvel, zvel
fn = string(get_save_filename_ext("Minecraft Schematics (*.schematic)|*.schematic", filename_new_ext(filename, ""), "", "Export Schematic"))
if (fn = "") return 0
//fn = string_replace_all(fn, ".schematic", "")
//fn += ".schematic"
o = obj_controller
window = -1
// Calculate maximum height and note block count
var sellayer = real(sch_br_layer) - 1
schematic_start();
var mySchematic = schematic_create();
sch_len = enda * 2 + 4
if sch_exp_velocity = 1 schematic_size(mySchematic, 33, sch_len, 2 )
else schematic_size(mySchematic, 1, sch_len, 2 )

if sch_exp_velocity = 1 var lineloc = 16 else lineloc = 0

if sch_exp_circuitry = 1 {
		schematic_cell_set(mySchematic, lineloc, 1, 1, 93, 3) // First repeater
		schematic_fill(mySchematic, lineloc, 1, 0, lineloc, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Line

	// Repeater Pattern on top

	for (a = 0; a <= enda * 2; a++) {
		if a % 2 == 1 {
			schematic_cell_set(mySchematic, lineloc, a + 2, 1, 93, 3)
		} else {
			schematic_cell_set(mySchematic, lineloc, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
		}
	}
}

// Add Note Blocks to Array
nblocks = 0

for (a = 0; a <= enda; a ++) {
	if (o.song_exists[a, sellayer]) {
			if (o.song_key[a, sellayer] > 32 && o.song_key[a, sellayer] < 58) {
				if sch_exp_stereo = 4 { // Add all note blocks
					nblockkey[nblocks] = o.song_key[a, sellayer]
					nblockins[nblocks] = o.song_ins[a, sellayer] - 100002
					nblockvel[nblocks] = o.song_vel[a, sellayer]
					nblocks ++
				} else if sch_exp_stereo = 3 && o.song_pan[a, sellayer] = 100 { // Add centered note blocks
					nblockkey[nblocks] = o.song_key[a, sellayer]
					nblockins[nblocks] = o.song_ins[a, sellayer] - 100002
					nblockvel[nblocks] = o.song_vel[a, sellayer]
					nblocks ++
				} else if  sch_exp_stereo = 2 && o.song_pan[a, sellayer] < 100 { // Add left note blocks
					nblockkey[nblocks] = o.song_key[a, sellayer]
					nblockins[nblocks] = o.song_ins[a, sellayer] - 100002
					nblockvel[nblocks] = o.song_vel[a, sellayer]
					show_debug_message(nblockkey[nblocks])
					nblocks ++
				} else if sch_exp_stereo = 1 && o.song_pan[a, sellayer] > 100 { //Add right note blocks
					nblockkey[nblocks] = o.song_key[a, sellayer]
					nblockins[nblocks] = o.song_ins[a, sellayer] - 100002
					nblockvel[nblocks] = o.song_vel[a, sellayer]
					nblocks ++
				} else {
					nblockkey[nblocks] = 0
					nblocks ++
				}
			}
	} else {
			nblockkey[nblocks] = 0
			nblocks ++
	}
}

// Add Note Blocks to Structure
b = nblocks
nblocks = 0

for (a = 0; a <= b; a++) {
	if a % 2 == 0 {
		if nblockkey[nblocks] != 0 { 
			if sch_exp_velocity = 0 {
				schematic_cell_set(mySchematic, 0, a + 2, 1, 25, 0)
				schematic_cell_set(mySchematic, 0, a + 2, 0, sch_exp_ins_block[nblockins[nblocks]], 0)
				noteblockz[nblocks] = 0
			} else {
				zvel = round(32 - nblockvel[nblocks]/100 * 32)
				if zvel >= 15 && zvel <= 17 zvel = 14
				if sch_exp_circuitry = 1 {
						schematic_fill(mySchematic, 16, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Connects a redstone line to the block
					if zvel > 16 {
						schematic_fill(mySchematic, 17, a + 2, 1, zvel, a + 2, 1, 55, 0)
					} 
					if zvel < 16 {
						schematic_fill(mySchematic, 15, a + 2, 1, zvel, a + 2, 1, 55, 0)
					}
				}
					schematic_cell_set(mySchematic, zvel, a + 2, 1, 25, 0)
					schematic_cell_set(mySchematic, zvel, a + 2, 0, sch_exp_ins_block[nblockins[nblocks]], 0)
					noteblockz[nblocks] = zvel
			}
        noteblocky[nblocks] = 1
        noteblockx[nblocks] = a + 2
		noteblocknote[nblocks] = nblockkey[nblocks] - 33
		}
	nblocks ++
	}
}

schematic_save(mySchematic, fn, nblocks);
schematic_destroy(mySchematic);
schematic_end();
message("Schematic saved!", "Schematic Export")
window = w_branch_export
