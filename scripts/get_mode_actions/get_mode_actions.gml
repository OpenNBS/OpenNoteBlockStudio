// get_mode_actions(num)
// Returns the correct action name according to the currently selected edit mode

var num = argument0

switch editmode {
	case m_key: {
		switch num {
			case 1: return "Increase octave" break
			case 2: return "Decrease octave" break
			case 3: return "Increase key" break
			case 4: return "Decrease key" break
			default: return ""
		}
		break
	}
	case m_vel: {
		switch num {
			case 1: return "Increase velocity by 10" break
			case 2: return "Decrease velocity by 10" break
			case 3: return "Increase velocity" break
			case 4: return "Decrease velocity" break
			case 5: return "Set velocity..." break
			case 6: return "Reset velocity" break
			default: return ""
		}
		break
	}
	case m_pan: {
		switch num {
			case 1: return "Pan right by 10" break
			case 2: return "Pan left by 10" break
			case 3: return "Pan right" break
			case 4: return "Pan left" break
			case 5: return "Set panning..." break
			case 6: return "Reset panning" break
			default: return ""
		}
		break
	}
	case m_pit: {
		switch num {
			case 1: return "Detune +10 cents" break
			case 2: return "Detune -10 cents" break
			case 3: return "Detune +1 cent" break
			case 4: return "Detune -1 cent" break
			case 5: return "Set pitch..." break
			case 6: return "Reset pitch" break
			default: return ""
		}
		break
	}
}