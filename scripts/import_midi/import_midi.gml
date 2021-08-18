function import_midi() {
	// import_midi()
	var a, b, deltapertick, t, e, channel, note, pos, yy, channelheight, posamount, framesps, smpte, ins, stop, vel;
	var ins1notes, ins2notes, ins3notes, ins4notes, ins5notes, ins6notes, ins7notes, ins8notes, ins9notes, ins10notes;
	io_clear()
	reset()
	deltapertick = (midi_tempo & $7FFF) / 4 / (w_midi_precision + 1)
	// Calculate channel heights
	for (a = 0; a <= midi_channels; a += 1) {
	    channelheight[a] = 0
	    posamount[a, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	}
	// Store amount of one note in a tick
	for (b = 0; b < 88; b += 1) {
	    ins1notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins2notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins3notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins4notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins5notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins6notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins7notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins8notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins9notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	    ins10notes[b, floor((midi_maxpos - midi_minpos * w_midi_removesilent) / deltapertick)] = 0
	}
	// screen_redraw()
	for (t = 0; t < midi_tracks; t += 1) {
	    for (e = 0; e < midi_trackamount[t]; e += 1) {
	        channel = midi_eventchannel[t, e]
	        note = median(0, midi_eventnote[t, e] - 9, 87)
			if (w_midi_vel = 1) {
				vel = midi_eventvel[t, e]
			} else vel = 100
	        pos = floor((midi_eventx[t, e] - midi_minpos * w_midi_removesilent) / deltapertick)
	        stop = 0
	        if (channel = 9) {
	            for (a = 0; a < midi_percamount; a += 1) {
	                if (midi_percnote[a] = midi_eventnote[t, e]) {
	                    if (midi_percins[a] = -1) stop = 1
	                    break
	                }
	            }
	            note = median(0, midi_percpitch[a], 87)
	        } else {
	            stop = (midi_channelins[channel] = -1)
	            note += 12 * midi_channeloctave[channel]
	            note = median(0, note, 87)
	        }
	        if (w_midi_octave) {
	            while (note < 33) note += 12
	            while (note > 57) note -= 12
	        }
	        if (stop = 0) {
	            if (channelheight[channel] < w_midi_maxheight || w_midi_maxheight = 20) {
	                switch (midi_channelins[channel]) {
	                    case 0: {ins1notes[note, pos] = 1 break}
	                    case 1: {ins2notes[note, pos] = 1 break}
	                    case 2: {ins3notes[note, pos] = 1 break}
	                    case 3: {ins4notes[note, pos] = 1 break}
	                    case 4: {ins5notes[note, pos] = 1 break}
	                    case 5: {ins6notes[note, pos] = 1 break}
	                    case 6: {ins7notes[note, pos] = 1 break}
	                    case 7: {ins8notes[note, pos] = 1 break}
	                    case 8: {ins9notes[note, pos] = 1 break}
	                    case 9: {ins10notes[note, pos] = 1 break}
	                }
	                // pos = floor(midi_eventx[t, e] / deltapertick)
	                posamount[channel, pos] += 1
	                channelheight[channel] = max(channelheight[channel], posamount[channel, pos])
	            }
	        }
	    }
	}
	for (a = 0; a <= floor(midi_maxpos / deltapertick); a += 1) {
	    for (b = 0; b < 88; b += 1) {
	        ins1notes[b, a] = 0
	        ins2notes[b, a] = 0
	        ins3notes[b, a] = 0
	        ins4notes[b, a] = 0
	        ins5notes[b, a] = 0
	        ins6notes[b, a] = 0
	        ins7notes[b, a] = 0
	        ins8notes[b, a] = 0
	        ins9notes[b, a] = 0
	        ins10notes[b, a] = 0
	    }
	}
	// Place blocks
	for (t = 0; t < midi_tracks; t += 1) {
	    for (e = 0; e < midi_trackamount[t]; e += 1) {
	        channel = midi_eventchannel[t, e]
	        pos = floor((midi_eventx[t, e] - midi_minpos * w_midi_removesilent) / deltapertick)
	        note = midi_eventnote[t, e] - 9
			if (w_midi_vel = 1) {
				vel = midi_eventvel[t, e]
			} else vel = 100
			if vel >=100 vel = 100
			show_debug_message(string(vel))
	        yy = 0
	        stop = 0
	        if (channel = 9) { // Percussion
	            for (a = 0; a < midi_percamount; a += 1) { // Find instrument
	                if (midi_percnote[a] = midi_eventnote[t, e]) break
	            }
	            ins = midi_percins[a]
	            note = median(0, midi_percpitch[a], 87)
	        } else { // Other
	            ins = midi_channelins[channel]
	            note += 12 * midi_channeloctave[channel]
	            note = median(0, note, 87)
	        }
	        if (w_midi_octave) {
	            while (note < 33) note += 12
	            while (note > 57) note -= 12
	        }
	        if (ins > -1 && stop = 0) {
	            switch (midi_channelins[channel]) {
	                case 0: {ins1notes[note, pos] = 1 break}
	                case 1: {ins2notes[note, pos] = 1 break}
	                case 2: {ins3notes[note, pos] = 1 break}
	                case 3: {ins4notes[note, pos] = 1 break}
	                case 4: {ins5notes[note, pos] = 1 break}
	                case 5: {ins6notes[note, pos] = 1 break}
	                case 6: {ins7notes[note, pos] = 1 break}
	                case 7: {ins8notes[note, pos] = 1 break}
	                case 8: {ins9notes[note, pos] = 1 break}
	                case 9: {ins10notes[note, pos] = 1 break}
	            }
	            // Find y
	            for (a = 0; a < channel; a += 1) yy += channelheight[a]
	            // Add block, go lower if failed
	            a = 0
	            while (1) {
	                if (add_block(pos, yy, instrument_list[| ins], note, vel, 100, 0, true)) break
	                yy += 1
	                a += 1
	                if (a >= w_midi_maxheight && w_midi_maxheight < 20) break
	            }
	        }
	    }
	}
	// Set tempo
	if (w_midi_tempo && enda > 0 && midi_songlength > 0) {
	    tempo = median(0.25, 10 / ((midi_songlength) / (enda / 10)), 30)
	    //tempo = floor(tempo * 4) / 4
	}
	// Name
	if (w_midi_name = 1) {
	    yy = 0
	    for (a = 0; a <= midi_channels; a += 1) {
	        for (b = 0; b < channelheight[a]; b += 1) {
				layerstereo[yy] = 100
	            layername[yy] = "Channel " + string(a + 1)
	            if (w_midi_name_patch) {
	                layername[yy] = midi_ins[midi_channelpatch[a], 3]
	                if (layername[yy] = "") layername[yy] = midi_ins[midi_channelpatch[a], 0]
	                if (a = 9) layername[yy] = "Percussion"
	            }
	            layerlock[yy] = 0
	            layervol[yy] = 100
	            yy += 1
	        }
	    }
	    endb2 = yy
	}
	if (w_midi_remember = 1) {
	    for (a = 0; a < midi_channels; a += 1) {    
	        midi_ins[midi_channelpatch[a], 1] = midi_channelins[a]
	        midi_ins[midi_channelpatch[a], 2] = midi_channeloctave[a]
	    }
	    for (a = 0; a < midi_percamount; a += 1) {
	        midi_drum[midi_percnote[a], 1] = midi_percins[a]
	        midi_drum[midi_percnote[a], 2] = midi_percpitch[a] - 33
	    }
	} else {
	    w_midi_removesilent = 1
	    w_midi_name = 1
	    w_midi_name_patch = 1
	    w_midi_tab = 0
	    w_midi_maxheight = 2
	    w_midi_tempo = 1
	    w_midi_octave = 1
		w_midi_precision = 0
	}
	save_settings()
	global.popup = 0
	with (obj_popup) instance_destroy()
	window = 0
	changed = 0
	for (a = 0; a < 10000; a += 1) text_exists[a] = 0



}
