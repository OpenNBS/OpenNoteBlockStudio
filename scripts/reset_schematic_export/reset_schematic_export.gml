// reset_schematic_export()
if (!argument0) {
    selected_tab_sch = 0
    sch_exp_remember = 1
}
for (a = 0; a < ds_list_size(instrument_list) + 9; a += 1) {
    sch_exp_ins_block[a] = 0
    sch_exp_ins_data[a] = 0
}
sch_exp_ins_block[0] = 3
sch_exp_ins_block[1] = 5
sch_exp_ins_block[2] = 4
sch_exp_ins_block[3] = 88
sch_exp_ins_block[4] = 20
sch_exp_ins_block[5] = 35
sch_exp_ins_block[6] = 82
sch_exp_ins_block[7] = 41
sch_exp_ins_block[8] = 174
sch_exp_ins_block[9] = 216

sch_exp_walkway_block = 1
sch_exp_walkway_data = 0
sch_exp_circuit_block = 1
sch_exp_circuit_data = 0
sch_exp_ground_block = 1
sch_exp_ground_data = 0

sch_exp_minecraft_old = false
sch_exp_layout = 1 // 0 = Circular walkway, 1 = Simple walkway, 2 = Classic
sch_exp_notesperrow = 20
sch_exp_includelocked = 0
sch_exp_compress = 1
sch_exp_loop = 1
sch_exp_glass = 1
sch_exp_minecart = 0
sch_exp_chest = 1
sch_exp_minecraft_old = false // For pre 1.11

