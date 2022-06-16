function track_export() {
	// track_export()
	var fn, a, b, c, d, p, xx, yy, zz, len, wid, hei, o, chestx, chesty, chestz, signx, signy, signz, nblocks, layers, cyy, y1, x1, insnum, ins, repeats, remain, replen, blockamount, nbamount, cpan, cvol, blocktagpos;
	var REPEATER, TORCHON, TORCHOFF, WIRE, LADDER, RAIL, POWEREDRAIL, SLAB, noteblocks, noteblockx, noteblocky, noteblockz, noteblocknote, noteblockins, noteblockpit;
	fn = string(get_save_filename_ext("Minecraft Structures (*.nbt)|*.nbt", filename_new_ext(string_replace_all(string_lower(filename), " ", "_"), "") + ".nbt", "", "Export Track"))
	if (fn = "") return 0
	o = obj_controller
	window = -1
	with (create(obj_dummy2)) {
	    // Initialize variables
	    REPEATER = 93
	    TORCHON = 76
	    TORCHOFF = 75
	    WIRE = 55
	    LADDER = 65
	    RAIL = 66
	    POWEREDRAIL = 27
		SLAB = 44
	    chestx = -1
	    chesty = -1
	    chestz = -1
		insnum = 0
		ins[0] = "harp"
		ins[1] = "bass"
		ins[2] = "basedrum"
		ins[3] = "snare"
		ins[4] = "hat"
		ins[5] = "guitar"
		ins[6] = "flute"
		ins[7] = "bell"
		ins[8] = "chime"
		ins[9] = "xylophone"
		ins[10] = "iron_xylophone"
		ins[11] = "cow_bell"
		ins[12] = "didgeridoo"
		ins[13] = "bit"
		ins[14] = "banjo"
		ins[15] = "pling"
		for (var a = 0; a < 240; a++) {
			ins[16 + a] = "harp"
		}
		instrument_list = o.instrument_list
	    layers = 4
	    block_walkway_block = o.sch_exp_walkway_block
	    block_walkway_data = o.sch_exp_walkway_data
	    block_circuit_block = o.sch_exp_circuit_block
	    block_circuit_data = o.sch_exp_circuit_data
	    block_ground_block = o.sch_exp_ground_block
	    block_ground_data = o.sch_exp_ground_data
	    blockspr = o.sch_exp_notesperrow                          // Blocks per row
	    layout = o.sch_exp_layout                                 // Layout number
	    sch_loop = (o.sch_exp_loop && layout = 0)                       // Whether to loop
	    minecart = (o.sch_exp_minecart && layout < 2)               // Whether to add minecart tracks
	    chest = (o.sch_exp_chest && minecart)                     // Whether to add a minecart chest
	    blocksam = o.sch_exp_totalblocks[o.sch_exp_includelocked] // Amount of blocks
		totalblocksc = 0
	    with (o) {
	        len = 40 + enda * 2
	        wid = 99
	        hei = 20
	    }
	    noteblocks = 0
		repeats = (len div 100) + 1
		remain = len mod 100
	    yy = round(wid / 2) - 1
	    cyy = yy
		signx = 2
		signy = yy
		signz = hei - 1
		blockamount = 80 + (len - 2) * 3 + 549 + (216 - o.minus) * o.enda + 27 * 3 + 61
		nbamount = 0
		for (a = 0; a <= o.enda; a += 1) {
			for (b = 0; b <= o.collast[a]; b += 1) {
		        if (o.song_exists[a, b] && (o.lockedlayer[b] = 0 || o.sch_exp_includelocked)) {
		            if ((o.song_key[a, b] > 32 && o.song_key[a, b] < 58) || (o.structure && o.command_block && o.song_key[a, b] >= 9 && o.song_key[a, b] <= 81)) {
						if (o.layerstereo[b] = 100) cpan = o.song_pan[a, b]
						else cpan = (layerstereo[b] + song_pan[a, b]) / 2
						cvol = (o.layervol[b] / 100) * o.song_vel[a, b]
						if ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.0 && cvol <= 0.2) || (cpan >= 180 && cpan < 200)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.2 && cvol <= 0.4) || (cpan >= 160 && cpan < 180)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.4 && cvol <= 0.6) || (cpan >= 140 && cpan < 160)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 0 && cpan <= 80)) && cvol > 0.6) || (cpan >= 120 && cpan < 140)) {
							nbamount += 3
						}
						if (cpan > 80 && cpan < 120 && cvol > 0.8) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 120 && cpan <= 200)) && cvol > 0.6) || (cpan > 60 && cpan <= 80)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.4 && cvol <= 0.6) || (cpan > 40 && cpan <= 60)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.2 && cvol <= 0.4) || (cpan > 20 && cpan <= 40)) {
							nbamount += 3
						}
						if ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.0 && cvol <= 0.2) || (cpan > 00 && cpan <= 20)) {
							nbamount += 3
						}
					}
				}
			}
		}
		show_debug_message("nbamount: " + string(nbamount))
		
	    // Write to file
	    buffer = buffer_create(8, buffer_grow, 1)
		
		TAG_Compound("")
		TAG_Int("DataVersion", 1519)
		TAG_List("size", 3, 3)
			buffer_write_int_be(32)
			buffer_write_int_be(hei)
			buffer_write_int_be(32)
		insnum = ds_list_size(instrument_list)
		TAG_List("palette", 30 + insnum * 26, 10)
			TAG_String("Name", "minecraft:" + block_get_namespaced_id(block_walkway_block, block_walkway_data))
			TAG_End()
			TAG_String("Name", "minecraft:" + block_get_namespaced_id(block_circuit_block, block_circuit_data))
			TAG_End()
			TAG_String("Name", "minecraft:" + block_get_namespaced_id(block_ground_block, block_ground_data))
			TAG_End()
			for (a = 0; a < insnum; a += 1) {
				TAG_String("Name", "minecraft:" + block_get_namespaced_id(o.sch_exp_ins_block[a], o.sch_exp_ins_data[a]))
				if (a = 9) {
					TAG_Compound("Properties")
						TAG_String("axis", "y")
						TAG_End()
				}
				TAG_End()
			}
			for (a = 0; a < insnum; a += 1) {
				for (b = 0; b < 25; b += 1) {
					if (!o.command_block) {
						TAG_String("Name", "minecraft:note_block")
						TAG_Compound("Properties")
							TAG_String("instrument", ins[a])
							TAG_String("note", string(b))
							TAG_String("powered", "false")
							TAG_End()
						TAG_End()
					} else {
						TAG_String("Name", "minecraft:command_block")
						TAG_Compound("Properties")
							TAG_String("facing", "up")
							TAG_End()
						TAG_End()
					}
				}
			}
			TAG_String("Name", "minecraft:blue_wool")
			TAG_End()
			TAG_String("Name", "minecraft:air")
			TAG_End()
			TAG_String("Name", "minecraft:ladder")
			TAG_Compound("Properties")
				TAG_String("facing", "north")
				TAG_String("waterlogged", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wire")
			TAG_Compound("Properties")
				TAG_String("east", "side")
				TAG_String("north", "side")
				TAG_String("power", "0")
				TAG_String("south", "side")
				TAG_String("west", "side")
				TAG_End()
			TAG_End()
			for (a = 1; a < 5; a += 1) {
				TAG_String("Name", "minecraft:repeater")
				TAG_Compound("Properties")
					TAG_String("delay", string(a))
					TAG_String("facing", "north")
					TAG_String("locked", "false")
					TAG_String("powered", "false")
					TAG_End()
				TAG_End()
			}
			for (a = 1; a < 5; a += 1) {
				TAG_String("Name", "minecraft:repeater")
				TAG_Compound("Properties")
					TAG_String("delay", string(a))
					TAG_String("facing", "west")
					TAG_String("locked", "false")
					TAG_String("powered", "false")
					TAG_End()
				TAG_End()
			}
			TAG_String("Name", "minecraft:repeater")
			TAG_Compound("Properties")
				TAG_String("delay", "0")
				TAG_String("facing", "east")
				TAG_String("locked", "false")
				TAG_String("powered", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "true")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:stone_button")
			TAG_Compound("Properties")
				TAG_String("face", "wall")
				TAG_String("facing", "south")
				TAG_String("powered", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:oak_wall_sign")
			TAG_Compound("Properties")
				TAG_String("facing", "south")
				TAG_String("waterlogged", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:powered_rail")
			TAG_Compound("Properties")
				TAG_String("powered", "false")
				TAG_String("shape", "north_south")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:chest")
			TAG_Compound("Properties")
				TAG_String("facing", "west")
				TAG_String("type", "single")
				TAG_String("waterlogged", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:rail")
			TAG_Compound("Properties")
				TAG_String("shape", "north_south")
				TAG_String("waterlogged", "false")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wall_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "false")
				TAG_String("facing", "east")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wall_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "true")
				TAG_String("facing", "east")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wall_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "false")
				TAG_String("facing", "west")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wall_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "true")
				TAG_String("facing", "west")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:lever")
			TAG_Compound("Properties")
				TAG_String("powered", "true")
				TAG_String("facing", "south")
				TAG_String("face", "wall")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:redstone_wall_torch")
			TAG_Compound("Properties")
				TAG_String("lit", "true")
				TAG_String("facing", "north")
				TAG_End()
			TAG_End()
			TAG_String("Name", "minecraft:smooth_stone_slab")
			TAG_Compound("Properties")
				TAG_String("type", "top")
				TAG_End()
			TAG_End()
		TAG_List("entities", 0, 10)
		TAG_List("blocks", blockamount, 10)
		blocktagpos = buffer_tell(buffer)
		show_debug_message(blockamount)
			TAG_Compound("nbt")
				TAG_String("Color", "black")
				TAG_String("id", "minecraft:sign")
	            TAG_String("Text1", "{\"text\": \"Song generated\"}")
	            TAG_String("Text2", "{\"text\": \"by the\"}")
	            TAG_String("Text3", "{\"text\": \"Minecraft Note\"}")
	            TAG_String("Text4", "{\"text\": \"Block Studio\"}")
				TAG_End()
			TAG_List("pos", 3, 3)
				buffer_write_int_be(wid - 1 - signy)
				buffer_write_int_be(signz)
				buffer_write_int_be(signx)
			TAG_Int("state", insnum * 26 + 19)
			totalblocksc++
	        TAG_End()
    
		for (var r = 0; r < repeats; r++) {
			
		if (r != repeats - 1) replen = 100
		else replen = remain
			
	    // Reset
	    for (a = 0; a < replen; a += 1) {
	        for (b = 0; b < wid; b += 1) {
	            for (c = 0; c < hei; c += 1) {
	                sch_block_write(a, b, c, 0)
	                sch_data_write(a, b, c, 0)
	            }
	        }
	    }
    
	    // Create walkway
	    for (a = 0; a < 3; a += 1) {
	        for (b = 2 * (r = 0); b < replen; b += 1) {
	            block_walkway(b, yy + a, hei - 3)
	        }
	    }
		if (r = 0) {
		    // Controls
		    block_circuit(1, yy, hei - 2)
		    block_circuit(1, yy + 1, hei - 2)
		    block_other(1, yy, hei - 1, 35, 11) // wool
		    block_other(1, yy + 1, hei - 1, 35, 11)
		    block_other(2, yy, hei - 1, 68, 3) // Button
		    block_other(2, yy + 1, hei - 1, 77, 3)
		    // Back
		    block_circuit(0, yy + 1, hei - 2)
		    block_other(0, yy + 1, hei - 1, WIRE, 0)
		    block_other(0, yy, hei - 2, TORCHON, 1)
			
		    block_other(0, yy, hei - 3, WIRE, 0)
		    block_circuit(0, yy, hei - 4)
		    block_other(0, yy + 1, hei - 4, TORCHOFF, 2)
			
		    block_other(0, yy + 1, hei - 5, WIRE, 0)
		    block_circuit(0, yy + 1, hei - 6)
			
			for (a = 0; a < 13; a++) {
				block_repeater(1 + 2 * a, yy + 1, hei - 5 - a, 0, 2, 0)
				block_other(2 + 2 * a, yy + 1, hei - 5 - a, WIRE, 0)
				block_circuit(1 + 2 * a, yy + 1, hei - 6 - a)
				block_circuit(2 + 2 * a, yy + 1, hei - 6 - a)
			}
			
			for (a = 0; a < 4; a++) {
				block_repeater(27 + a * 2, yy + 1, hei - 18, 0, 2, 0)
				block_circuit(27 + a * 2, yy + 1, hei - 19)
				block_circuit(28 + a * 2, yy + 1, hei - 18)
			}
			
			for (a = 0; a < 11; a++) {
				block_circuit(34, yy - a, hei - 19)
				block_other(34, yy - a, hei - 18, WIRE, 0)
				block_circuit(34, yy + 2 + a, hei - 19)
				block_other(34, yy + 2 + a, hei - 18, WIRE, 0)
			}
			
			for (a = 0; a < 12; a++) {
				block_circuit(34, yy - 11 - a, hei - 18)
				if (a != 4) block_other(34, yy - 11 - a, hei - 17, WIRE, 0)
				else block_repeater(34, yy - 11 - a, hei - 17, 0, 3, 0)
				block_circuit(34, yy + 13 + a, hei - 18)
				if (a != 4) block_other(34, yy + 13 + a, hei - 17, WIRE, 0)
				else block_repeater(34, yy + 13 + a, hei - 17, 0, 3, 0)
			}
			
			for (a = 0; a < 12; a++) {
				block_circuit(34, yy - 23 - a, hei - 17)
				if (a != 8) block_other(34, yy - 23 - a, hei - 16, WIRE, 0)
				else block_repeater(34, yy - 23 - a, hei - 16, 0, 3, 0)
				block_circuit(34, yy + 25 + a, hei - 17)
				if (a != 8) block_other(34, yy + 25 + a, hei - 16, WIRE, 0)
				else block_repeater(34, yy + 25 + a, hei - 16, 0, 3, 0)
			}
			
			for (a = 0; a < 12; a++) {
				block_circuit(34, yy - 35 - a, hei - 16)
				block_other(34, yy - 35 - a, hei - 15, WIRE, 0)
				block_circuit(34, yy + 37 + a, hei - 16)
				block_other(34, yy + 37 + a, hei - 15, WIRE, 0)
			}
			
			block_circuit(35, yy - 11, hei - 18)
			block_circuit(36, yy - 11, hei - 18)
			block_circuit(37, yy - 11, hei - 18)
			block_circuit(35, yy - 11 - 12, hei - 17)
			block_circuit(36, yy - 11 - 12, hei - 17)
			block_circuit(37, yy - 11 - 12, hei - 17)
			block_circuit(35, yy - 11 - 12 - 12, hei - 16)
			block_circuit(36, yy - 11 - 12 - 12, hei - 16)
			block_circuit(37, yy - 11 - 12 - 12, hei - 16)
			block_circuit(35, yy - 11 - 12 - 12 - 12, hei - 16)
			block_circuit(36, yy - 11 - 12 - 12 - 12, hei - 15)
			block_circuit(37, yy - 11 - 12 - 12 - 12, hei - 15)
			block_circuit(34, yy - 11 - 12 - 12 - 12, hei - 15)
			block_circuit(35, yy + 11 + 2, hei - 18)
			block_circuit(36, yy + 11 + 2, hei - 18)
			block_circuit(37, yy + 11 + 2, hei - 18)
			block_circuit(35, yy + 11 + 12 + 2, hei - 17)
			block_circuit(36, yy + 11 + 12 + 2, hei - 17)
			block_circuit(37, yy + 11 + 12 + 2, hei - 17)
			block_circuit(35, yy + 11 + 12 + 12 + 2, hei - 16)
			block_circuit(36, yy + 11 + 12 + 12 + 2, hei - 16)
			block_circuit(37, yy + 11 + 12 + 12 + 2, hei - 16)
			block_circuit(35, yy + 11 + 12 + 12 + 12 + 2, hei - 16)
			block_circuit(36, yy + 11 + 12 + 12 + 12 + 2, hei - 15)
			block_circuit(37, yy + 11 + 12 + 12 + 12 + 2, hei - 15)
			block_circuit(34, yy + 11 + 12 + 12 + 12 + 2, hei - 15)
			block_circuit(35, yy + 1, hei - 19)
			block_circuit(36, yy + 1, hei - 18)
			block_circuit(37, yy + 1, hei - 19)
			
			block_other(36, yy - 11, hei - 17, WIRE, 0)
			block_other(37, yy - 11, hei - 17, WIRE, 0)
			block_other(36, yy - 11 - 12, hei - 16, WIRE, 0)
			block_other(37, yy - 11 - 12, hei - 16, WIRE, 0)
			block_other(36, yy - 11 - 12 - 12, hei - 15, WIRE, 0)
			block_other(37, yy - 11 - 12 - 12, hei - 15, WIRE, 0)
			block_other(36, yy - 11 - 12 - 12 - 12, hei - 14, WIRE, 0)
			block_other(37, yy - 11 - 12 - 12 - 12, hei - 14, WIRE, 0)
			block_other(36, yy + 11 + 2, hei - 17, WIRE, 0)
			block_other(37, yy + 11 + 2, hei - 17, WIRE, 0)
			block_other(36, yy + 11 + 12 + 2, hei - 16, WIRE, 0)
			block_other(37, yy + 11 + 12 + 2, hei - 16, WIRE, 0)
			block_other(36, yy + 11 + 12 + 12 + 2, hei - 15, WIRE, 0)
			block_other(37, yy + 11 + 12 + 12 + 2, hei - 15, WIRE, 0)
			block_other(36, yy + 11 + 12 + 12 + 12 + 2, hei - 14, WIRE, 0)
			block_other(37, yy + 11 + 12 + 12 + 12 + 2, hei - 14, WIRE, 0)
			block_other(37, yy + 1, hei - 18, WIRE, 0)
			
			block_repeater(35, yy - 11, hei - 17, 2, 2, 0)
			block_repeater(35, yy - 11 - 12, hei - 16, 1, 2, 0)
			block_repeater(35, yy - 11 - 12 - 12, hei - 15, 0, 2, 0)
			block_repeater(35, yy - 11 - 12 - 12 - 12, hei - 15, 0, 2, 0)
			block_repeater(35, yy + 11 + 2, hei - 17, 2, 2, 0)
			block_repeater(35, yy + 11 + 12 + 2, hei - 16, 1, 2, 0)
			block_repeater(35, yy + 11 + 12 + 12 + 2, hei - 15, 0, 2, 0)
			block_repeater(35, yy + 11 + 12 + 12 + 12 + 2, hei - 15, 0, 2, 0)
			block_repeater(35, yy + 1, hei - 18, 2, 2, 0)
			
			for (a = 0; a < 4; a++) {
				for (b = 0; b < 13; b++) {
					block_other(37 + (b mod 2 = 0), yy - 11 - 12 * a, hei - 17 + b + a, SLAB, 2)
					block_other(37 + (b mod 2 = 0), yy - 11 - 12 * a, hei - 16 + b + a, WIRE, 2)
					block_other(37 + (b mod 2 = 0), yy + 11 + 12 * a + 2, hei - 17 + b + a, SLAB, 2)
					block_other(37 + (b mod 2 = 0), yy + 11 + 12 * a + 2, hei - 16 + b + a, WIRE, 2)
				}
				for (b = 0; b < 4; b++) {
					block_circuit(39, yy - 11 - 12 * a, hei - 17 + 4 * b + a)
					block_repeater(39, yy - 11 - 12 * a, hei - 16 + 4 * b + a, 0, 2, 0)
					block_circuit(39, yy + 11 + 12 * a + 2, hei - 17 + 4 * b + a)
					block_repeater(39, yy + 11 + 12 * a + 2, hei - 16 + 4 * b + a, 0, 2, 0)
				}
			}
			
			for (b = 0; b < 13; b++) {
				block_other(37 + (b mod 2 = 0), yy + 1, hei - 18 + b, SLAB, 2)
				block_other(37 + (b mod 2 = 0), yy + 1, hei - 17 + b, WIRE, 2)
			}
			for (b = 0; b < 4; b++) {
				block_circuit(39, yy + 1, hei - 18 + 4 * b)
				block_repeater(39, yy + 1, hei - 17 + 4 * b, 0, 2, 0)
			}
		}
        
		//// Create vertical transmission
		//d = 0
		//for (a = layers - 1; a >= 0; a -= 1) {
		//    if (a > 0) {
		//        block_other(0, yy - 1 - d, a * 3 + 1, TORCHON, 2)
		//        block_circuit(0, yy - 1, a * 3 - 1 + d)
		//        block_other(0, yy - 1, a * 3 + d, WIRE, 15)
		//        block_other(0, yy - 2, a * 3 - 1 + d, TORCHOFF, 1)
		//    }
		//    p = 0
		//    c = a * 2
		//    for (b = yy - 2 - d; b >= 0; b -= 1) {
		//        block_circuit(0, b, a * 3 + 1)
		//        block_other(0, b, a * 3 + 2, WIRE, 0)
		//        p += 1
		//        if (c > 0 && b < yy - 3 - d) {
		//            block_repeater(0, b, a * 3 + 2, min(4, c) - 1, 1, 0)
		//            c -= 4
		//            p = 0
		//        }
		//        if (p = 16 || b = 1) {
		//            block_repeater(0, b, a * 3 + 2, 0, 1, 0)
		//            p = 0
		//        }
		//    }
		//    for (b = 0; b < 4; b += 1) {
		//        block_other(b, 0, a * 3 + 2, WIRE, 0)
		//        block_circuit(b, 0, a * 3 + 1)
		//    }
		//    // Add repeaters to even out delay
		//    d=!d
		//}
		// Add note blocks
		xx = -1 + 40 * (r = 0)
		var circ, rep, dir, turn, lturnx, lturny, lturndel, addamount, addprev, adds;
		var nblocks, nblocksl1, nblocksl2, nblocksl3, nblocksl4, nblocksr1, nblocksr2, nblocksr3, nblocksr4;
		var nblockins, nblockinsl1, nblockinsl2, nblockinsl3, nblockinsl4, nblockinsr1, nblockinsr2, nblockinsr3, nblockinsr4;
		var nblockkey, nblockkeyl1, nblockkeyl2, nblockkeyl3, nblockkeyl4, nblockkeyr1, nblockkeyr2, nblockkeyr3, nblockkeyr4;
		var nblockpit, nblockpitl1, nblockpitl2, nblockpitl3, nblockpitl4, nblockpitr1, nblockpitr2, nblockpitr3, nblockpitr4;
		rep = 0
		dir = 1 // 1 or -1
		circ = 1 // 1 = From, -1 = To
		// screen_redraw()
		lturnx = -1
		lturny = -1
		lturndel = 0
		if (r = 0) {addamount = 30; addprev = 0}
		else if (r = repeats - 1) {addamount = remain / 2 + r * 50 - 20; addprev = r * 50 - 20}
		else {addamount = r * 50 + 30; addprev = r * 50 - 20}
		show_debug_message(r)
		show_debug_message(repeats - 1)
		show_debug_message(addprev)
		show_debug_message(addamount)
		noteblocks = 0
		noteblockx = 0
		noteblocky = 0
		noteblockz = 0
		noteblocknote = 0
		noteblockins = 0
		noteblockpit = 0
		for (a = addprev; a <= addamount; a += 1) {
		    nblocks = 0
			nblockins = 0
			nblockkey = 0
			nblockpit = 0
			nblocksl1 = 0
			nblockinsl1 = 0
			nblockkeyl1 = 0
			nblockpitl1 = 0
			nblocksl2 = 0
			nblockinsl2 = 0
			nblockkeyl2 = 0
			nblockpitl2 = 0
			nblocksl3 = 0
			nblockinsl3 = 0
			nblockkeyl3 = 0
			nblockpitl3 = 0
			nblocksl4 = 0
			nblockinsl4 = 0
			nblockkeyl4 = 0
			nblockpitl4 = 0
			nblocksr1 = 0
			nblockinsr1 = 0
			nblockkeyr1 = 0
			nblockpitr1 = 0
			nblocksr2 = 0
			nblockinsr2 = 0
			nblockkeyr2 = 0
			nblockpitr2 = 0
			nblocksr3 = 0
			nblockinsr3 = 0
			nblockkeyr3 = 0
			nblockpitr3 = 0
			nblocksr4 = 0
			nblockinsr4 = 0
			nblockkeyr4 = 0
			nblockpitr4 = 0
		    rep += 1
		    if (o.colamount[a] > 0) { // Calculate note blocks for this tick
		        for (b = 0; b <= o.collast[a]; b += 1) {
		            if (o.song_exists[a, b] && (o.lockedlayer[b] = 0 || o.sch_exp_includelocked)) {
		                if ((o.song_key[a, b] > 32 && o.song_key[a, b] < 58) || (o.structure && o.command_block && o.song_key[a, b] >= 9 && o.song_key[a, b] <= 81)) {
							if (o.layerstereo[b] = 100) cpan = o.song_pan[a, b]
							else cpan = (layerstereo[b] + song_pan[a, b]) / 2
							cvol = (o.layervol[b] / 100) * o.song_vel[a, b]
							if (cpan <= 20) {
							}
		                    nblockinsl4[nblocksl4] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.0 && cvol <= 0.2) || (cpan >= 180 && cpan < 200)) - !((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.0 && cvol <= 0.2) || (cpan >= 180 && cpan < 200))
		                    nblockkeyl4[nblocksl4] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.0 && cvol <= 0.2) || (cpan >= 180 && cpan < 200))
		                    nblockpitl4[nblocksl4] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.0 && cvol <= 0.2) || (cpan >= 180 && cpan < 200))
		                    nblocksl4 += 1
		                    nblockinsl3[nblocksl3] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.2 && cvol <= 0.4) || (cpan >= 160 && cpan < 180)) - !((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.2 && cvol <= 0.4) || (cpan >= 160 && cpan < 180))
		                    nblockkeyl3[nblocksl3] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.2 && cvol <= 0.4) || (cpan >= 160 && cpan < 180))
		                    nblockpitl3[nblocksl3] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.2 && cvol <= 0.4) || (cpan >= 160 && cpan < 180))
		                    nblocksl3 += 1
		                    nblockinsl2[nblocksl2] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.4 && cvol <= 0.6) || (cpan >= 140 && cpan < 160)) - !((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.4 && cvol <= 0.6) || (cpan >= 140 && cpan < 160))
		                    nblockkeyl2[nblocksl2] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.4 && cvol <= 0.6) || (cpan >= 140 && cpan < 160))
		                    nblockpitl2[nblocksl2] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 0 && cpan <= 80)) && cvol > 0.4 && cvol <= 0.6) || (cpan >= 140 && cpan < 160))
		                    nblocksl2 += 1
		                    nblockinsl1[nblocksl1] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 0 && cpan <= 80)) && cvol > 0.6) || (cpan >= 120 && cpan < 140)) - !((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 0 && cpan <= 80)) && cvol > 0.6) || (cpan >= 120 && cpan < 140))
		                    nblockkeyl1[nblocksl1] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 0 && cpan <= 80)) && cvol > 0.6) || (cpan >= 120 && cpan < 140))
		                    nblockpitl1[nblocksl1] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 0 && cpan <= 80)) && cvol > 0.6) || (cpan >= 120 && cpan < 140))
		                    nblocksl1 += 1
			                nblockins[nblocks] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * (cpan > 80 && cpan < 120 && cvol > 0.8) - !(cpan > 80 && cpan < 120 && cvol > 0.8)
			                nblockkey[nblocks] = o.song_key[a, b] * (cpan > 80 && cpan < 120 && cvol > 0.8)
			                nblockpit[nblocks] = o.song_pit[a, b] * (cpan > 80 && cpan < 120 && cvol > 0.8)
			                nblocks += 1
		                    nblockinsr1[nblocksr1] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 120 && cpan <= 200)) && cvol > 0.6) || (cpan > 60 && cpan <= 80)) - !((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 120 && cpan <= 200)) && cvol > 0.6) || (cpan > 60 && cpan <= 80))
		                    nblockkeyr1[nblocksr1] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 120 && cpan <= 200)) && cvol > 0.6) || (cpan > 60 && cpan <= 80))
		                    nblockpitr1[nblocksr1] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120 && cvol <= 0.8) || (cpan > 120 && cpan <= 200)) && cvol > 0.6) || (cpan > 60 && cpan <= 80))
		                    nblocksr1 += 1
		                    nblockinsr2[nblocksr2] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.4 && cvol <= 0.6) || (cpan > 40 && cpan <= 60)) - !((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.4 && cvol <= 0.6) || (cpan > 40 && cpan <= 60))
		                    nblockkeyr2[nblocksr2] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.4 && cvol <= 0.6) || (cpan > 40 && cpan <= 60))
		                    nblockpitr2[nblocksr2] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.4 && cvol <= 0.6) || (cpan > 40 && cpan <= 60))
		                    nblocksr2 += 1
		                    nblockinsr3[nblocksr3] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.2 && cvol <= 0.4) || (cpan > 20 && cpan <= 40)) - !((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.2 && cvol <= 0.4) || (cpan > 20 && cpan <= 40))
		                    nblockkeyr3[nblocksr3] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.2 && cvol <= 0.4) || (cpan > 20 && cpan <= 40))
		                    nblockpitr3[nblocksr3] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.2 && cvol <= 0.4) || (cpan > 20 && cpan <= 40))
		                    nblocksr3 += 1
		                    nblockinsr4[nblocksr4] = ds_list_find_index(other.instrument_list, o.song_ins[a, b]) * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.0 && cvol <= 0.2) || (cpan > 00 && cpan <= 20)) - !((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.0 && cvol <= 0.2) || (cpan > 00 && cpan <= 20))
		                    nblockkeyr4[nblocksr4] = o.song_key[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.0 && cvol <= 0.2) || (cpan > 00 && cpan <= 20))
		                    nblockpitr4[nblocksr4] = o.song_pit[a, b] * ((((cpan > 80 && cpan < 120) || (cpan > 120 && cpan <= 200)) && cvol > 0.0 && cvol <= 0.2) || (cpan > 00 && cpan <= 20))
		                    nblocksr4 += 1
		                } else {
		                    nblockins[nblocks] = -1
		                    nblockkey[nblocks] = 0
		                    nblockpit[nblocks] = 0
		                    nblocks += 1
		                    nblockinsl1[nblocksl1] = -1
		                    nblockkeyl1[nblocksl1] = 0
		                    nblockpitl1[nblocksl1] = 0
		                    nblocksl1 += 1
		                    nblockinsl2[nblocksl2] = -1
		                    nblockkeyl2[nblocksl2] = 0
		                    nblockpitl2[nblocksl2] = 0
		                    nblocksl2 += 1
		                    nblockinsl3[nblocksl3] = -1
		                    nblockkeyl3[nblocksl3] = 0
		                    nblockpitl3[nblocksl3] = 0
		                    nblocksl3 += 1
		                    nblockinsl4[nblocksl4] = -1
		                    nblockkeyl4[nblocksl4] = 0
		                    nblockpitl4[nblocksl4] = 0
		                    nblocksl4 += 1
		                    nblockinsr1[nblocksr1] = -1
		                    nblockkeyr1[nblocksr1] = 0
		                    nblockpitr1[nblocksr1] = 0
		                    nblocksr1 += 1
		                    nblockinsr2[nblocksr2] = -1
		                    nblockkeyr2[nblocksr2] = 0
		                    nblockpitr2[nblocksr2] = 0
		                    nblocksr2 += 1
		                    nblockinsr3[nblocksr3] = -1
		                    nblockkeyr3[nblocksr3] = 0
		                    nblockpitr3[nblocksr3] = 0
		                    nblocksr3 += 1
		                    nblockinsr4[nblocksr4] = -1
		                    nblockkeyr4[nblocksr4] = 0
		                    nblockpitr4[nblocksr4] = 0
		                    nblocksr4 += 1
		                }
		            } else {
		                nblockins[nblocks] = -1
		                nblockkey[nblocks] = 0
		                nblockpit[nblocks] = 0
		                nblocks += 1
		                nblockinsl1[nblocksl1] = -1
		                nblockkeyl1[nblocksl1] = 0
		                nblockpitl1[nblocksl1] = 0
		                nblocksl1 += 1
		                nblockinsl2[nblocksl2] = -1
		                nblockkeyl2[nblocksl2] = 0
		                nblockpitl2[nblocksl2] = 0
		                nblocksl2 += 1
		                nblockinsl3[nblocksl3] = -1
		                nblockkeyl3[nblocksl3] = 0
		                nblockpitl3[nblocksl3] = 0
		                nblocksl3 += 1
		                nblockinsl4[nblocksl4] = -1
		                nblockkeyl4[nblocksl4] = 0
		                nblockpitl4[nblocksl4] = 0
		                nblocksl4 += 1
		                nblockinsr1[nblocksr1] = -1
		                nblockkeyr1[nblocksr1] = 0
		                nblockpitr1[nblocksr1] = 0
		                nblocksr1 += 1
		                nblockinsr2[nblocksr2] = -1
		                nblockkeyr2[nblocksr2] = 0
		                nblockpitr2[nblocksr2] = 0
		                nblocksr2 += 1
		                nblockinsr3[nblocksr3] = -1
		                nblockkeyr3[nblocksr3] = 0
		                nblockpitr3[nblocksr3] = 0
		                nblocksr3 += 1
		                nblockinsr4[nblocksr4] = -1
		                nblockkeyr4[nblocksr4] = 0
		                nblockpitr4[nblocksr4] = 0
		                nblocksr4 += 1
		            }
		        }
		    }
		    nblocks -= 1
		    nblocksl1 -= 1
		    nblocksl2 -= 1
		    nblocksl3 -= 1
		    nblocksl4 -= 1
		    nblocksr1 -= 1
		    nblocksr2 -= 1
		    nblocksr3 -= 1
		    nblocksr4 -= 1
			adds = 1
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocks > -1) { // Note block #1
		            if (nblockins[nblocks] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockins[nblocks]], o.sch_exp_ins_data[nblockins[nblocks]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkey[nblocks] - 33
						noteblockins[noteblocks] = nblockins[nblocks]
						noteblockpit[noteblocks] = nblockpit[nblocks]
		                noteblocks += 1
		            }
		            nblocks -= 1
		        }
		        if (nblocks > -1) { // Note block #2
		            if (nblockins[nblocks] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockins[nblocks]], o.sch_exp_ins_data[nblockins[nblocks]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkey[nblocks] - 33
						noteblockins[noteblocks] = nblockins[nblocks]
						noteblockpit[noteblocks] = nblockpit[nblocks]
		                noteblocks += 1
		            }
		            nblocks -= 1
		        }
		        if (nblocks > -1) { // Note block #3
		            if (nblockins[nblocks] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockins[nblocks]], o.sch_exp_ins_data[nblockins[nblocks]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkey[nblocks] - 33
						noteblockins[noteblocks] = nblockins[nblocks]
						noteblockpit[noteblocks] = nblockpit[nblocks]
		                noteblocks += 1
		            }
		            nblocks -= 1
		        }
		        if (nblocks > -1) { // Note block #4
		            if (nblockins[nblocks] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockins[nblocks]], o.sch_exp_ins_data[nblockins[nblocks]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkey[nblocks] - 33
						noteblockins[noteblocks] = nblockins[nblocks]
						noteblockpit[noteblocks] = nblockpit[nblocks]
		                noteblocks += 1
		            }
		            nblocks -= 1
		        }
		    }
			adds = 2
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir - 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksl1 > -1) { // Note block #1
		            if (nblockinsl1[nblocksl1] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl1[nblocksl1]], o.sch_exp_ins_data[nblockinsl1[nblocksl1]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl1[nblocksl1] - 33
						noteblockins[noteblocks] = nblockinsl1[nblocksl1]
						noteblockpit[noteblocks] = nblockpitl1[nblocksl1]
		                noteblocks += 1
		            }
		            nblocksl1 -= 1
		        }
		        if (nblocksl1 > -1) { // Note block #2
		            if (nblockinsl1[nblocksl1] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl1[nblocksl1]], o.sch_exp_ins_data[nblockinsl1[nblocksl1]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl1[nblocksl1] - 33
						noteblockins[noteblocks] = nblockinsl1[nblocksl1]
						noteblockpit[noteblocks] = nblockpitl1[nblocksl1]
		                noteblocks += 1
		            }
		            nblocksl1 -= 1
		        }
		        if (nblocksl1 > -1) { // Note block #3
		            if (nblockinsl1[nblocksl1] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl1[nblocksl1]], o.sch_exp_ins_data[nblockinsl1[nblocksl1]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl1[nblocksl1] - 33
						noteblockins[noteblocks] = nblockinsl1[nblocksl1]
						noteblockpit[noteblocks] = nblockpitl1[nblocksl1]
		                noteblocks += 1
		            }
		            nblocksl1 -= 1
		        }
		        if (nblocksl1 > -1) { // Note block #4
		            if (nblockinsl1[nblocksl1] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl1[nblocksl1]], o.sch_exp_ins_data[nblockinsl1[nblocksl1]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl1[nblocksl1] - 33
						noteblockins[noteblocks] = nblockinsl1[nblocksl1]
						noteblockpit[noteblocks] = nblockpitl1[nblocksl1]
		                noteblocks += 1
		            }
		            nblocksl1 -= 1
		        }
		    }
			adds = 3
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir - 12 - 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksl2 > -1) { // Note block #1
		            if (nblockinsl2[nblocksl2] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl2[nblocksl2]], o.sch_exp_ins_data[nblockinsl2[nblocksl2]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl2[nblocksl2] - 33
						noteblockins[noteblocks] = nblockinsl2[nblocksl2]
						noteblockpit[noteblocks] = nblockpitl2[nblocksl2]
		                noteblocks += 1
		            }
		            nblocksl2 -= 1
		        }
		        if (nblocksl2 > -1) { // Note block #2
		            if (nblockinsl2[nblocksl2] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl2[nblocksl2]], o.sch_exp_ins_data[nblockinsl2[nblocksl2]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl2[nblocksl2] - 33
						noteblockins[noteblocks] = nblockinsl2[nblocksl2]
						noteblockpit[noteblocks] = nblockpitl2[nblocksl2]
		                noteblocks += 1
		            }
		            nblocksl2 -= 1
		        }
		        if (nblocksl2 > -1) { // Note block #3
		            if (nblockinsl2[nblocksl2] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl2[nblocksl2]], o.sch_exp_ins_data[nblockinsl2[nblocksl2]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl2[nblocksl2] - 33
						noteblockins[noteblocks] = nblockinsl2[nblocksl2]
						noteblockpit[noteblocks] = nblockpitl2[nblocksl2]
		                noteblocks += 1
		            }
		            nblocksl2 -= 1
		        }
		        if (nblocksl2 > -1) { // Note block #4
		            if (nblockinsl2[nblocksl2] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl2[nblocksl2]], o.sch_exp_ins_data[nblockinsl2[nblocksl2]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl2[nblocksl2] - 33
						noteblockins[noteblocks] = nblockinsl2[nblocksl2]
						noteblockpit[noteblocks] = nblockpitl2[nblocksl2]
		                noteblocks += 1
		            }
		            nblocksl2 -= 1
		        }
		    }
			adds = 4
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir - 12 - 12 - 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksl3 > -1) { // Note block #1
		            if (nblockinsl3[nblocksl3] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl3[nblocksl3]], o.sch_exp_ins_data[nblockinsl3[nblocksl3]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl3[nblocksl3] - 33
						noteblockins[noteblocks] = nblockinsl3[nblocksl3]
						noteblockpit[noteblocks] = nblockpitl3[nblocksl3]
		                noteblocks += 1
		            }
		            nblocksl3 -= 1
		        }
		        if (nblocksl3 > -1) { // Note block #2
		            if (nblockinsl3[nblocksl3] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl3[nblocksl3]], o.sch_exp_ins_data[nblockinsl3[nblocksl3]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl3[nblocksl3] - 33
						noteblockins[noteblocks] = nblockinsl3[nblocksl3]
						noteblockpit[noteblocks] = nblockpitl3[nblocksl3]
		                noteblocks += 1
		            }
		            nblocksl3 -= 1
		        }
		        if (nblocksl3 > -1) { // Note block #3
		            if (nblockinsl3[nblocksl3] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl3[nblocksl3]], o.sch_exp_ins_data[nblockinsl3[nblocksl3]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl3[nblocksl3] - 33
						noteblockins[noteblocks] = nblockinsl3[nblocksl3]
						noteblockpit[noteblocks] = nblockpitl3[nblocksl3]
		                noteblocks += 1
		            }
		            nblocksl3 -= 1
		        }
		        if (nblocksl3 > -1) { // Note block #4
		            if (nblockinsl3[nblocksl3] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl3[nblocksl3]], o.sch_exp_ins_data[nblockinsl3[nblocksl3]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl3[nblocksl3] - 33
						noteblockins[noteblocks] = nblockinsl3[nblocksl3]
						noteblockpit[noteblocks] = nblockpitl3[nblocksl3]
		                noteblocks += 1
		            }
		            nblocksl3 -= 1
		        }
		    }
			adds = 5
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir - 12 - 12 - 12 - 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksl4 > -1) { // Note block #1
		            if (nblockinsl4[nblocksl4] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl4[nblocksl4]], o.sch_exp_ins_data[nblockinsl4[nblocksl4]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl4[nblocksl4] - 33
						noteblockins[noteblocks] = nblockinsl4[nblocksl4]
						noteblockpit[noteblocks] = nblockpitl4[nblocksl4]
		                noteblocks += 1
		            }
		            nblocksl4 -= 1
		        }
		        if (nblocksl4 > -1) { // Note block #2
		            if (nblockinsl4[nblocksl4] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsl4[nblocksl4]], o.sch_exp_ins_data[nblockinsl4[nblocksl4]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyl4[nblocksl4] - 33
						noteblockins[noteblocks] = nblockinsl4[nblocksl4]
						noteblockpit[noteblocks] = nblockpitl4[nblocksl4]
		                noteblocks += 1
		            }
		            nblocksl4 -= 1
		        }
		        if (nblocksl4 > -1) { // Note block #3
		            if (nblockinsl4[nblocksl4] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl4[nblocksl4]], o.sch_exp_ins_data[nblockinsl4[nblocksl4]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl4[nblocksl4] - 33
						noteblockins[noteblocks] = nblockinsl4[nblocksl4]
						noteblockpit[noteblocks] = nblockpitl4[nblocksl4]
		                noteblocks += 1
		            }
		            nblocksl4 -= 1
		        }
		        if (nblocksl4 > -1) { // Note block #4
		            if (nblockinsl4[nblocksl4] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsl4[nblocksl4]], o.sch_exp_ins_data[nblockinsl4[nblocksl4]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyl4[nblocksl4] - 33
						noteblockins[noteblocks] = nblockinsl4[nblocksl4]
						noteblockpit[noteblocks] = nblockpitl4[nblocksl4]
		                noteblocks += 1
		            }
		            nblocksl4 -= 1
		        }
		    }
			adds = 2
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir + 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksr1 > -1) { // Note block #1
		            if (nblockinsr1[nblocksr1] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr1[nblocksr1]], o.sch_exp_ins_data[nblockinsr1[nblocksr1]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr1[nblocksr1] - 33
						noteblockins[noteblocks] = nblockinsr1[nblocksr1]
						noteblockpit[noteblocks] = nblockpitr1[nblocksr1]
		                noteblocks += 1
		            }
		            nblocksr1 -= 1
		        }
		        if (nblocksr1 > -1) { // Note block #2
		            if (nblockinsr1[nblocksr1] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr1[nblocksr1]], o.sch_exp_ins_data[nblockinsr1[nblocksr1]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr1[nblocksr1] - 33
						noteblockins[noteblocks] = nblockinsr1[nblocksr1]
						noteblockpit[noteblocks] = nblockpitr1[nblocksr1]
		                noteblocks += 1
		            }
		            nblocksr1 -= 1
		        }
		        if (nblocksr1 > -1) { // Note block #3
		            if (nblockinsr1[nblocksr1] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr1[nblocksr1]], o.sch_exp_ins_data[nblockinsr1[nblocksr1]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr1[nblocksr1] - 33
						noteblockins[noteblocks] = nblockinsr1[nblocksr1]
						noteblockpit[noteblocks] = nblockpitr1[nblocksr1]
		                noteblocks += 1
		            }
		            nblocksr1 -= 1
		        }
		        if (nblocksr1 > -1) { // Note block #4
		            if (nblockinsr1[nblocksr1] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr1[nblocksr1]], o.sch_exp_ins_data[nblockinsr1[nblocksr1]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr1[nblocksr1] - 33
						noteblockins[noteblocks] = nblockinsr1[nblocksr1]
						noteblockpit[noteblocks] = nblockpitr1[nblocksr1]
		                noteblocks += 1
		            }
		            nblocksr1 -= 1
		        }
		    }
			adds = 3
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir + 12 + 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksr2 > -1) { // Note block #1x
		            if (nblockinsr2[nblocksr2] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr2[nblocksr2]], o.sch_exp_ins_data[nblockinsr2[nblocksr2]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr2[nblocksr2] - 33
						noteblockins[noteblocks] = nblockinsr2[nblocksr2]
						noteblockpit[noteblocks] = nblockpitr2[nblocksr2]
		                noteblocks += 1
		            }
		            nblocksr2 -= 1
		        }
		        if (nblocksr2 > -1) { // Note block #2
		            if (nblockinsr2[nblocksr2] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr2[nblocksr2]], o.sch_exp_ins_data[nblockinsr2[nblocksr2]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr2[nblocksr2] - 33
						noteblockins[noteblocks] = nblockinsr2[nblocksr2]
						noteblockpit[noteblocks] = nblockpitr2[nblocksr2]
		                noteblocks += 1
		            }
		            nblocksr2 -= 1
		        }
		        if (nblocksr2 > -1) { // Note block #3
		            if (nblockinsr2[nblocksr2] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr2[nblocksr2]], o.sch_exp_ins_data[nblockinsr2[nblocksr2]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr2[nblocksr2] - 33
						noteblockins[noteblocks] = nblockinsr2[nblocksr2]
						noteblockpit[noteblocks] = nblockpitr2[nblocksr2]
		                noteblocks += 1
		            }
		            nblocksr2 -= 1
		        }
		        if (nblocksr2 > -1) { // Note block #4
		            if (nblockinsr2[nblocksr2] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr2[nblocksr2]], o.sch_exp_ins_data[nblockinsr2[nblocksr2]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr2[nblocksr2] - 33
						noteblockins[noteblocks] = nblockinsr2[nblocksr2]
						noteblockpit[noteblocks] = nblockpitr2[nblocksr2]
		                noteblocks += 1
		            }
		            nblocksr2 -= 1
		        }
		    }
			adds = 4
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir + 12 + 12 + 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksr3 > -1) { // Note block #1
		            if (nblockinsr3[nblocksr3] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr3[nblocksr3]], o.sch_exp_ins_data[nblockinsr3[nblocksr3]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr3[nblocksr3] - 33
						noteblockins[noteblocks] = nblockinsr3[nblocksr3]
						noteblockpit[noteblocks] = nblockpitr3[nblocksr3]
		                noteblocks += 1
		            }
		            nblocksr3 -= 1
		        }
		        if (nblocksr3 > -1) { // Note block #2
		            if (nblockinsr3[nblocksr3] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr3[nblocksr3]], o.sch_exp_ins_data[nblockinsr3[nblocksr3]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr3[nblocksr3] - 33
						noteblockins[noteblocks] = nblockinsr3[nblocksr3]
						noteblockpit[noteblocks] = nblockpitr3[nblocksr3]
		                noteblocks += 1
		            }
		            nblocksr3 -= 1
		        }
		        if (nblocksr3 > -1) { // Note block #3
		            if (nblockinsr3[nblocksr3] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr3[nblocksr3]], o.sch_exp_ins_data[nblockinsr3[nblocksr3]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr3[nblocksr3] - 33
						noteblockins[noteblocks] = nblockinsr3[nblocksr3]
						noteblockpit[noteblocks] = nblockpitr3[nblocksr3]
		                noteblocks += 1
		            }
		            nblocksr3 -= 1
		        }
		        if (nblocksr3 > -1) { // Note block #4
		            if (nblockinsr3[nblocksr3] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr3[nblocksr3]], o.sch_exp_ins_data[nblockinsr3[nblocksr3]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr3[nblocksr3] - 33
						noteblockins[noteblocks] = nblockinsr3[nblocksr3]
						noteblockpit[noteblocks] = nblockpitr3[nblocksr3]
		                noteblocks += 1
		            }
		            nblocksr3 -= 1
		        }
		    }
			adds = 5
		    for (b = 0; b < layers + 0; b += 1) { // add blocks
		        y1 = yy + dir + 12 + 12 + 12 + 12
				x1 = xx
		        block_repeater(x1 + 2, y1, b * 4 + 2 + adds, 0, 2, 0)
		        block_circuit(x1 + dir, y1, b * 4 + 2 + adds)
		        block_circuit(x1 + 2, y1, b * 4 + adds)
		        block_circuit(x1 + dir, y1, b * 4 + adds)
		        block_circuit(x1 + dir * 2, y1, b * 4 + 1 + adds)
		        block_other(x1 + dir, y1, b * 4 + 1 + adds, WIRE, 0)
		        if (nblocksr4 > -1) { // Note block #1
		            if (nblockinsr4[nblocksr4] > -1) {
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 - 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr4[nblocksr4]], o.sch_exp_ins_data[nblockinsr4[nblocksr4]])
						block_circuit(x1 + dir * 2, y1 - 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr4[nblocksr4] - 33
						noteblockins[noteblocks] = nblockinsr4[nblocksr4]
						noteblockpit[noteblocks] = nblockpitr4[nblocksr4]
		                noteblocks += 1
		            }
		            nblocksr4 -= 1
		        }
		        if (nblocksr4 > -1) { // Note block #2
		            if (nblockinsr4[nblocksr4] > -1) {
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + 1 + adds, 25, 0)
		                block_other(x1 + dir * 2, y1 + 1, b * 4 + adds, o.sch_exp_ins_block[nblockinsr4[nblocksr4]], o.sch_exp_ins_data[nblockinsr4[nblocksr4]])
						block_circuit(x1 + dir * 2, y1 + 1, b * 4 - 1 + adds)
		                noteblockx[noteblocks] = x1 + dir * 2
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 1 + adds
		                noteblocknote[noteblocks] = nblockkeyr4[nblocksr4] - 33
						noteblockins[noteblocks] = nblockinsr4[nblocksr4]
						noteblockpit[noteblocks] = nblockpitr4[nblocksr4]
		                noteblocks += 1
		            }
		            nblocksr4 -= 1
		        }
		        if (nblocksr4 > -1) { // Note block #3
		            if (nblockinsr4[nblocksr4] > -1) {
		                block_other(x1 + dir, y1 - 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 - 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr4[nblocksr4]], o.sch_exp_ins_data[nblockinsr4[nblocksr4]])
						block_circuit(x1 + dir, y1 - 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 - 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr4[nblocksr4] - 33
						noteblockins[noteblocks] = nblockinsr4[nblocksr4]
						noteblockpit[noteblocks] = nblockpitr4[nblocksr4]
		                noteblocks += 1
		            }
		            nblocksr4 -= 1
		        }
		        if (nblocksr4 > -1) { // Note block #4
		            if (nblockinsr4[nblocksr4] > -1) {
		                block_other(x1 + dir, y1 + 1, b * 4 + 2 + adds, 25, 0)
		                block_other(x1 + dir, y1 + 1, b * 4 + 1 + adds, o.sch_exp_ins_block[nblockinsr4[nblocksr4]], o.sch_exp_ins_data[nblockinsr4[nblocksr4]])
						block_circuit(x1 + dir, y1 + 1, b * 4 + adds)
		                noteblockx[noteblocks] = x1 + dir
		                noteblocky[noteblocks] = y1 + 1
		                noteblockz[noteblocks] = b * 4 + 2 + adds
		                noteblocknote[noteblocks] = nblockkeyr4[nblocksr4] - 33
						noteblockins[noteblocks] = nblockinsr4[nblocksr4]
						noteblockpit[noteblocks] = nblockpitr4[nblocksr4]
		                noteblocks += 1
		            }
		            nblocksr4 -= 1
		        }
		    }
		    rep = 0
		    xx += 2 * dir
		    turn = 0
		    // Switch direction?
		    //if (layout = 0) {
		    //    if (circ = 1) {
		    //        if (dir = 1) {
		    //            if (xx = len - 2) {
		    //                if (yy >= cyy) {
		    //                    circ = -1
		    //                    turn = 0
		    //                    yy += 1
		    //                    for (b = 0; b < layers; b += 1) {
		    //                        for (c = 0; c < 2; c += 1) {
		    //                            block_circuit(xx, yy + c, b * 3 + 1)
		    //                            block_other(xx, yy + c, b * 3 + 2, WIRE, 0)
		    //                        }
		    //                    }
		    //                    yy += 1
		    //                }
		    //            } else {
		    //                turn = (yy >= cyy - 2)
		    //            }
		    //        }
		    //        if (dir = -1) turn = (yy <= 2)
		    //    } else {
		    //        if (dir = 1) turn = (yy >= wid - 3)
		    //        if (dir = -1) turn = (yy <= cyy + 5)
		    //    }
		    //} else {
		    //    if (dir = 1) turn = (yy >= wid - 3)
		    //    if (dir = -1) turn = (yy <= 2)
		    //}
		    //if (a = o.enda) turn = 0
		    //if (turn) {
		    //    for (b = 0; b < layers; b += 1) { // Connect to new row
		    //        block_other(xx, yy, b * 3 + 1, WIRE, 0)
		    //        if (b > 0 && b < layers - 1) block_circuit(xx, yy, b * 4)
		    //        block_other(xx, yy + dir, b * 3 + 2, WIRE, 0)
		    //        block_circuit(xx, yy + dir, b * 3 + 1)
		    //        for (c = 0; c < 4; c += 1) {
		    //            block_other(xx + c * circ, yy + dir * 2, b * 3 + 2, WIRE, 0)
		    //            block_circuit(xx + c * circ, yy + dir * 2, b * 3 + 1)
		    //        }
		    //    }
		    //    yy += dir * 2
		    //    dir = -dir
		    //    if (circ = -1 && dir = 1) {
		    //        lturnx = xx
		    //        lturny = yy - 1
		    //        lturndel = (o.enda - a) - 8
		    //    }
		    //    xx += 3 * circ
		    //    if (xx <= 0) break
		    //}
		}
    
			var soundname, soundpitch, soundnote;
			for (a = 0; a < noteblocks; a += 1) {
				if (o.command_block) {
					TAG_Compound("nbt")
						soundname = dat_instrument(noteblockins[a])
						soundpitch = dat_pitch(noteblocknote[a] + 33 + noteblockpit[a] / 100)
						if (noteblocknote[a] < 0) soundname += "_-1"
						else if (noteblocknote[a] > 24) soundname += "_1"
						TAG_String("Command", "playsound "+ soundname +" block @a ~ ~ ~ 3 " + string(soundpitch))
						TAG_Byte("TrackOutput", 0)
						TAG_Byte("powered", 0)
						TAG_Byte("auto", 0)
						TAG_Byte("conditionMet", 1)
						TAG_Byte("UpdateLastExecution", 1)
						TAG_End()
				}
				TAG_List("pos", 3, 3)
					buffer_write_int_be(wid - 1 - noteblocky[a])
					buffer_write_int_be(noteblockz[a])
					buffer_write_int_be(noteblockx[a] + 100 * r)
	            TAG_Int("state", 3 + insnum + (noteblockins[a] * 25 + noteblocknote[a]) * !o.command_block)
			totalblocksc++
	            TAG_End()
	        }
			for (c = 0; c < hei; c += 1) {
			    for (a = 0; a < replen; a += 1) {
			        for (b = wid - 1; b >= 0; b -= 1) {
						if (sch_block_read(a, b, c) != 25 && sch_block_read(a, b, c) != 54 && sch_block_read(a, b, c) != 0) {
						TAG_List("pos", 3, 3)
							buffer_write_int_be(wid - b - 1)
							buffer_write_int_be(c)
							buffer_write_int_be(a + r * 100)
						if (sch_block_read(a, b, c) = 0) TAG_Int("state", insnum * 26 + 4) //air
						else if (sch_block_read(a, b, c) = block_walkway_block && sch_data_read(a, b, c) = block_walkway_data) TAG_Int("state", 0) //walkway
						else if (sch_block_read(a, b, c) = block_circuit_block && sch_data_read(a, b, c) = block_circuit_data) TAG_Int("state", 1) //circuit
						else if (sch_block_read(a, b, c) = block_ground_block && sch_data_read(a, b, c) = block_ground_data) TAG_Int("state", 2) //ground
						else if (sch_block_read(a, b, c) = 35 && sch_data_read(a, b, c) = 11) TAG_Int("state", insnum * 26 + 3) //blue_wool
						else if (sch_block_read(a, b, c) = 65) TAG_Int("state", insnum * 26 + 5) //ladder
						else if (sch_block_read(a, b, c) = 55) TAG_Int("state", insnum * 26 + 6) //redstone_wire
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 2) TAG_Int("state", insnum * 26 + 7) //north repeater 1
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 2 + 4) TAG_Int("state", insnum * 26 + 8) //north repeater 2
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 2 + 4 * 2) TAG_Int("state", insnum * 26 + 9) //north repeater 3
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 2 + 4 * 3) TAG_Int("state", insnum * 26 + 10) //north repeater 4
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 1) TAG_Int("state", insnum * 26 + 11) //west repeater 1
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 1 + 4) TAG_Int("state", insnum * 26 + 12) //west repeater 2
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 1 + 4 * 2) TAG_Int("state", insnum * 26 + 13) //west repeater 3
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 1 + 4 * 3) TAG_Int("state", insnum * 26 + 14) //west repeater 4
						else if (sch_block_read(a, b, c) = 93 && sch_data_read(a, b, c) = 3) TAG_Int("state", insnum * 26 + 15) //east repeater 4
						else if (sch_block_read(a, b, c) = 75 && sch_data_read(a, b, c) = 5) TAG_Int("state", insnum * 26 + 16) //unlit torch
						else if (sch_block_read(a, b, c) = 76 && sch_data_read(a, b, c) = 5) TAG_Int("state", insnum * 26 + 17) //lit torch
						else if (sch_block_read(a, b, c) = 77) TAG_Int("state", insnum * 26 + 18) //south stone_button
						else if (sch_block_read(a, b, c) = 27) TAG_Int("state", insnum * 26 + 20) //ns powered_rail
						else if (sch_block_read(a, b, c) = 66) TAG_Int("state", insnum * 26 + 22) //ns rail
						else if (sch_block_read(a, b, c) = 75 && sch_data_read(a, b, c) = 1) TAG_Int("state", insnum * 26 + 23) //east unlit walltorch
						else if (sch_block_read(a, b, c) = 76 && sch_data_read(a, b, c) = 1) TAG_Int("state", insnum * 26 + 24) //east lit walltorch
						else if (sch_block_read(a, b, c) = 75 && sch_data_read(a, b, c) = 2) TAG_Int("state", insnum * 26 + 25) //west unlit walltorch
						else if (sch_block_read(a, b, c) = 76 && sch_data_read(a, b, c) = 2) TAG_Int("state", insnum * 26 + 26) //west lit walltorch
						else if (sch_block_read(a, b, c) = 69) TAG_Int("state", insnum * 26 + 27) //south lever
						else if (sch_block_read(a, b, c) = 75 && sch_data_read(a, b, c) = 4) TAG_Int("state", insnum * 26 + 28) //north lit walltorch
						else if (sch_block_read(a, b, c) = 44) TAG_Int("state", insnum * 26 + 29) //top slab
						else {
							for (var i = 0; i < insnum; i++) {
								if (sch_block_read(a, b, c) = o.sch_exp_ins_block[i] && sch_data_read(a, b, c) = o.sch_exp_ins_data[i]) {TAG_Int("state", 3 + i); break;}
								else if (i = insnum - 1) {TAG_Int("state", insnum * 26 + 4); break;}
							}
						}
			totalblocksc++
						TAG_End()
						}
			        }
			    }
			}
			
			}
			
		TAG_End()
		//buffer_seek(buffer, blocktagpos - 4, 0)
		//buffer_write_int_be(totalblocksc)
	    buffer_save(buffer, temp_file)
	    buffer_delete(buffer)
		show_debug_message(totalblocksc)
		totalblocksc = 0
	    gzzip(temp_file, fn)
	    instance_destroy()
	}
	if (o.language != 1) message("Schematic saved!", "Schematic Export")
	else message("Schematic 已保存！", "导出 Schematic")
	window = w_track_export



}
