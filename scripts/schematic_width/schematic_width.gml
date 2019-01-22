// schematic_width()
var wid;
if (sch_exp_layout < 2) wid = sch_exp_notesperrow * 2 + 3 + 4 * (sch_exp_layout = 0)
else wid = sch_exp_notesperrow * 2 + 3
return wid
