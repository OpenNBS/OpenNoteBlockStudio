// branch_export()
var fn, a, b, o, sch_len, nblocks, nblockins, nblockvel, nblockpan, zvel
fn = string(get_save_filename_ext("Minecraft Schematics (*.schematic)|*.schematic", filename_new_ext(filename, ""), "", "Export Schematic"))
if (fn = "") return 0
//fn = string_replace_all(fn, ".schematic", "")
//fn += ".schematic"
o = obj_controller
window = -1
schematic_start();
var mySchematic = schematic_create();
sch_len = enda * 2 + 4
var sellayer = real(sch_br_layer) - 1
if sch_exp_velocity = 1 schematic_size(mySchematic, 33, sch_len, 2 )
else schematic_size(mySchematic, 1, sch_len, 2 )

schematic_cell_set(mySchematic, 0, 0, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Setup activation blocks
schematic_cell_set(mySchematic, 0, 0, 1, 77, 5) // Start button
schematic_cell_set(mySchematic, 0, 1, 1, 93, 7) // MaxVel line's 2-tick repeater
schematic_fill(mySchematic, 0, 1, 0, 0, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // MaxVel line

if sch_exp_velocity = 1 {
	schematic_cell_set(mySchematic, 1, 0, 1, 93, 2) // HalfVel line's 1-tick repeater
	schematic_cell_set(mySchematic, 16, 1, 1, 93, 3) // HalfVel line's 1-tick repeater
	schematic_fill(mySchematic, 1, 0, 0, 16, 0, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Setup Line
	schematic_fill(mySchematic, 2, 0, 1, 16, 0, 1, 55, 0) // Setup Wire
	schematic_fill(mySchematic, 16, 1, 0, 16, sch_len, 0, sch_exp_circuit_block, sch_exp_circuit_data) // HalfVel line
}

// Repeater Pattern on top

for (a = 0; a <= enda * 2; a++) {
	if a % 2 == 1 {
		schematic_cell_set(mySchematic, 0, a + 2, 1, 93, 3)
		if sch_exp_velocity = 1 schematic_cell_set(mySchematic, 16, a + 2, 1, 93, 3)
	} else {
		schematic_cell_set(mySchematic, 0, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
		if sch_exp_velocity = 1 schematic_cell_set(mySchematic, 16, a + 2, 1, sch_exp_circuit_block, sch_exp_circuit_data)
	}
}

// Add Note Blocks to Array
nblocks = 0

for (a = 0; a <= enda; a ++) {
	if (o.colamount[a] > 0) {
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
					show_debug_message(nblockkey[nblocks])
					nblocks ++
				}
			}
	} else {
			nblockkey[nblocks] = 0
			show_debug_message(nblockkey[nblocks])
			nblocks ++
	}
}

// Add Note Blocks to Structure

nblocks = 0

for (a = 0; a <= enda * 2; a++) {
	if a % 2 == 0 {
		if nblockkey[nblocks] != 0 { 
			if nblockvel[nblocks] = 100 || sch_exp_velocity = 0 {
				schematic_cell_set(mySchematic, 0, a + 2, 1, 25, 0)
				schematic_cell_set(mySchematic, 0, a + 2, 0, sch_exp_ins_block[nblockins[nblocks]], 0)
				noteblockz[nblocks] = 0
			} else { // Velocity is less than 100
				zvel = round(32 - nblockvel[nblocks]/100 * 32)
				show_debug_message(zvel)
				if zvel > 16 {
					schematic_fill(mySchematic, 16, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data) // Connect a redstone line to the block
					schematic_fill(mySchematic, 17, a + 2, 1, zvel, a + 2, 1, 55, 0)
				}
				if zvel < 16 {
					schematic_fill(mySchematic, 16, a + 2, 0, zvel, a + 2, 0, sch_exp_circuit_block, sch_exp_circuit_data)
					schematic_fill(mySchematic, 15, a + 2, 1, zvel, a + 2, 1, 55, 0)
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
