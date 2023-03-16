function message(argument0, argument1 = "(null)") {
	// message(text, caption)
	var a = 1, b, c, d;
	log(argument1, argument0)
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(((argument1 == "(null)") ? "" : argument1))
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	ShowMessage(argument0)
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a

}
