function message_yesnocancel(argument0, argument1) {
	// message_yesnocancel(text, caption)
	var a;
	widget_set_caption(argument1)
	a = show_question_cancelable(argument0)
	return a


}
