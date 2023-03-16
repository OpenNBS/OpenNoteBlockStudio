function message(argument0, argument1 = "(null)") {
	// message(text, caption)
	var a, b, c, d;
	if (argument1 != "(null)") log(argument1, argument0)
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(((argument1 == "(null)") ? "" : argument1))
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	a = ShowMessage(argument0)
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a

}
