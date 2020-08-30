function schematic_length() {
	// schematic_length()
	var len;
	if (sch_exp_layout < 2) {
	    len = 2 + ceil(sch_exp_repeaters[sch_exp_includelocked, sch_exp_tempo] / sch_exp_notesperrow) * 3
	    if (sch_exp_layout = 0) len += 3*!(ceil(sch_exp_repeaters[sch_exp_includelocked, sch_exp_tempo] / sch_exp_notesperrow) mod 2)
	} else { // Classic
	    len = max(6, ceil((sch_exp_repeaters[sch_exp_includelocked, sch_exp_tempo] + 2) / sch_exp_notesperrow) * 3 + 1)
	}
	return len



}
