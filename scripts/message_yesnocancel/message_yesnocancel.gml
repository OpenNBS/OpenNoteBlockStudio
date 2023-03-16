function message_yesnocancel(argument0, argument1) {
	// message_yesnocancel(text, caption)
	var a, b;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	a = ShowQuestionExt(argument0)
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a


}
