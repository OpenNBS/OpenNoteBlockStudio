function question(argument0, argument1) {
	// question(str, caption)
	var a, b, c, d, e;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(480, 200);
	e = ShowQuestion(argument0)
	if (e == "Yes") a = true;
	else a = false;
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a
}
