function seconds_to_str(argument0) {
	// seconds_to_str(s)
	c = argument0
	if (language != 1) {
		if (c < 60) {
			str = string(c) + " second" + condstr(c != 1, "s") + " ago"
		} else if (c < 60 * 60) {
			c = floor(c / 60)
			str = string(c) + " minute" + condstr(c != 1, "s") + " ago"
		} else if (c < 60 * 60 * 24) {
			c = floor(c / (60 * 60))
			str = string(c) + " hour" + condstr(c != 1, "s") + " ago"
		} else if (c < 60 * 60 * 24 * 7) {
			c = floor(c / (60 * 60 * 24))
			str = string(c) + " day" + condstr(c != 1, "s") + " ago"
		} else if (c < 60 * 60 * 24 * 31) {
			c = floor(c / (60 * 60 * 24 * 7))
			str = string(c) + " week" + condstr(c != 1, "s") + " ago"
		} else if (c < 60 * 60 * 24 * 31 * 12) {
			c = floor(c / (60 * 60 * 24 * 31))
			str = string(c) + " month" + condstr(c != 1, "s") + " ago"
		} else {
			c = floor(c / (60 * 60 * 24 * 31 * 12))
			str = string(c) + " year" + condstr(c != 1, "s") + " ago"
		}
	} else {
		if (c < 60) {
			str = string(c) + "秒前"
		} else if (c < 60 * 60) {
			c = floor(c / 60)
			str = string(c) + "分钟前"
		} else if (c < 60 * 60 * 24) {
			c = floor(c / (60 * 60))
			str = string(c) + "小时前"
		} else if (c < 60 * 60 * 24 * 7) {
			c = floor(c / (60 * 60 * 24))
			str = string(c) + "天前"
		} else if (c < 60 * 60 * 24 * 31) {
			c = floor(c / (60 * 60 * 24 * 7))
			str = string(c) + "星期前"
		} else if (c < 60 * 60 * 24 * 31 * 12) {
			c = floor(c / (60 * 60 * 24 * 31))
			str = string(c) + "月前"
		} else {
			c = floor(c / (60 * 60 * 24 * 31 * 12))
			str = string(c) + "年前"
		}
	}

	return str



}
