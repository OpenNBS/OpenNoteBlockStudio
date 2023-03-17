function message_yesnocancel(argument0, argument1) {
	// message_yesnocancel(text, caption)
	var a, b, c, d, e;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(480, 200);
	e = ShowQuestionExt(argument0)
	if (e == "Yes") a = 1;
	if (e == "No")  a = 0;
	else a = -1;
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a


}
