function question(argument0, argument1) {
	// question(str, caption)
	var a, b;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	a = ShowQuestion(argument0)
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a



}
