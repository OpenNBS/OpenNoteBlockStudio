function get_hotkey(action){
	switch (action) {
		case "undo": {
			if (os_type != os_macosx) return "Ctrl+Z"
			else return "cmd+Z"
			break
		}
		case "redo": {
			if (os_type != os_macosx) return "Ctrl+Y"
			else return "cmd+Y"
			break
		}
		case "copy": {
			if (os_type != os_macosx) return "Ctrl+C"
			else return "cmd+C"
			break
		}
		case "cut": {
			if (os_type != os_macosx) return "Ctrl+X"
			else return "cmd+X"
			break
		}
		case "paste": {
			if (os_type != os_macosx) return "Ctrl+V"
			else return "cmd+V"
			break
		}
		case "delete": {
			if (os_type != os_macosx) return "Delete"
			else return "backspace"
			break
		}
		case "select_all": {
			if (os_type != os_macosx) return "Ctrl+A"
			else return "cmd+A"
			break
		}
		case "invert_selection": {
			if (os_type != os_macosx) return "Ctrl+I"
			else return "cmd+I"
			break
		}
		case "action_1": {
			if (os_type != os_macosx) return "Ctrl+E"
			else return "cmd+E"
			break
		}
		case "action_2": {
			if (os_type != os_macosx) return "Ctrl+D"
			else return "cmd+D"
			break
		}
		case "action_3": {
			if (os_type != os_macosx) return "Ctrl+R"
			else return "cmd+R"
			break
		}
		case "action_4": {
			if (os_type != os_macosx) return "Ctrl+F"
			else return "cmd+F"
			break
		}
		case "action_5": {
			if (os_type != os_macosx) return "Ctrl+T"
			else return "cmd+T"
			break
		}
		case "action_6": {
			if (os_type != os_macosx) return "Ctrl+G"
			else return "cmd+G"
			break
		}
		case "tremolo": {
			if (os_type != os_macosx) return "Ctrl+Shift+A"
			else return "control+shift+A"
			break
		}
		case "stereo": {
			if (os_type != os_macosx) return "Ctrl+Shift+S"
			else return "control+shift+S"
			break
		}
		case "arpeggio": {
			if (os_type != os_macosx) return "Ctrl+Shift+D"
			else return "control+shift+D"
			break
		}
		case "portamento": {
			if (os_type != os_macosx) return "Ctrl+Shift+F"
			else return "control+shift+F"
			break
		}
		case "vibrato": {
			if (os_type != os_macosx) return "Ctrl+Shift+G"
			else return "control+shift+G"
			break
		}
		case "stagger": {
			if (os_type != os_macosx) return "Ctrl+Shift+H"
			else return "control+shift+H"
			break
		}
		case "chorus": {
			if (os_type != os_macosx) return "Ctrl+Shift+J"
			else return "control+shift+J"
			break
		}
		case "volume_lfo": {
			if (os_type != os_macosx) return "Ctrl+Shift+K"
			else return "control+shift+K"
			break
		}
		case "fade_in": {
			if (os_type != os_macosx) return "Ctrl+Shift+Q"
			else return "control+shift+Q"
			break
		}
		case "fade_out": {
			if (os_type != os_macosx) return "Ctrl+Shift+W"
			else return "control+shift+W"
			break
		}
		case "replace_key": {
			if (os_type != os_macosx) return "Ctrl+Shift+E"
			else return "control+shift+E"
			break
		}
		case "set_velocity": {
			if (os_type != os_macosx) return "Ctrl+Shift+R"
			else return "control+shift+R"
			break
		}
		case "set_panning": {
			if (os_type != os_macosx) return "Ctrl+Shift+T"
			else return "control+shift+T"
			break
		}
		case "set_pitch": {
			if (os_type != os_macosx) return "Ctrl+Shift+Y"
			else return "control+shift+Y"
			break
		}
		case "reset_properties": {
			if (os_type != os_macosx) return "Ctrl+Shift+U"
			else return "control+shift+U"
			break
		}
		case "new_song": {
			if (os_type != os_macosx) return "Ctrl+N"
			else return "cmd+N"
			break
		}
		case "open_song": {
			if (os_type != os_macosx) return "Ctrl+O"
			else return "cmd+O"
			break
		}
		case "save_song": {
			if (os_type != os_macosx) return "Ctrl+S"
			else return "cmd+S"
			break
		}
		case "exit": {
			if (os_type != os_macosx) return "Alt+F4"
			else return "cmd+Q"
			break
		}
		case "ins_ctrl": {
			if (os_type != os_macosx) return "Ctrl+"
			else return "control+"
			break
		}
		case "ins_ctrl_shift": {
			if (os_type != os_macosx) return "Ctrl+Shift+"
			else return "control+shift+"
			break
		}
		case "preferences": {
			if (os_type != os_macosx) return "Ctrl+P"
			else return "cmd+P"
			break
		}
		case "": {
			if (os_type != os_macosx) return ""
			else return ""
			break
		}
		default: {
			return "not_found"
			break
		}
	}
}