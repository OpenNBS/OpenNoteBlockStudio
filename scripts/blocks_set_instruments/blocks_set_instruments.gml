/// @description  blocks_set_instruments()
/// @function  blocks_set_instruments
function blocks_set_instruments() {

	var a, b;

	for (a = 0; a <= enda; a += 1) {
	    if (colamount[a] > 0) {
	        for (b = 0; b <= collast[a]; b += 1) {
	            if (song_exists[a, b]) {
					show_debug_message(instrument_list[| song_ins[a, b]])
	                song_ins[a, b] = instrument_list[| song_ins[a, b]]
	                //song_ins[a, b].num_blocks++
	                //if (song_ins[a, b].user) block_custom++
	            }
	        }
	    }
	}



}
