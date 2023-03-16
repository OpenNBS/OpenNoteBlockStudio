function DialogGetFontFolder() {
	return string(environment_get_variable("IMGUI_FONT_PATH"));
}

function DialogSetFontFolder(lpParentFolder) {
	var bResult = bool(environment_set_variable("IMGUI_FONT_PATH", lpParentFolder)); IfdLoadFonts(); return bResult;
}

function DialogGetFontFiles() {
	return string(environment_get_variable("IMGUI_FONT_FILES"));
}

function DialogSetFontFiles(lpFileNames) {
	var bResult = bool(environment_set_variable("IMGUI_FONT_FILES", lpFileNames)); IfdLoadFonts(); return bResult;
}

function DialogGetFontSize() {
	return int64(environment_get_variable("IMGUI_FONT_SIZE"));
}

function DialogSetFontSize(dwSize) {
	return bool(environment_set_variable("IMGUI_FONT_SIZE", string(dwSize)));
}

function DialogGetWindowWidth() {
	return int64(environment_get_variable("IMGUI_DIALOG_WIDTH"));
}

function DialogGetWindowHeight() {
	return int64(environment_get_variable("IMGUI_DIALOG_HEIGHT"));
}

function DialogSetWindowSize(dwWidth, dwHeight) {
	return (bool(environment_set_variable("IMGUI_DIALOG_WIDTH", string(dwWidth))) && bool(environment_set_variable("IMGUI_DIALOG_HEIGHT", string(dwHeight))));
}

function DialogGetOwnerWindow() {
	return ptr(int64(environment_get_variable("IMGUI_DIALOG_PARENT")));
}

function DialogSetOwnerWindow(lpOwner) {
	return bool(environment_set_variable("IMGUI_DIALOG_PARENT", string(int64(lpOwner))));
}

function DialogGetWindowCaption(lpCaption) {
	return string(environment_get_variable("IMGUI_DIALOG_CAPTION"));
}

function DialogSetWindowCaption(lpCaption) {
	return bool(environment_set_variable("IMGUI_DIALOG_CAPTION", string(lpCaption)));
}

function DialogGetResizeable() {
	return bool(environment_get_variable("IMGUI_DIALOG_RESIZE"));
}

function DialogSetResizeable(bResizeable) {
	return bool(environment_set_variable("IMGUI_DIALOG_RESIZE", string(bool(bResizeable))));
}

function DialogGetBorderless() {
	return bool(environment_get_variable("IMGUI_DIALOG_NOBORDER"));
}

function DialogSetBorderless(bBorderless) {
	return bool(environment_set_variable("IMGUI_DIALOG_NOBORDER", string(bool(bBorderless))));
}

function DialogGetFullScreen() {
	return bool(environment_get_variable("IMGUI_DIALOG_FULLSCREEN"));
}

function DialogSetFullScreen(bFullScreen) {
	return bool(environment_set_variable("IMGUI_DIALOG_FULLSCREEN", string(bool(bFullScreen))));
}

function DialogGetColorTheme() {
	return int64(environment_get_variable("IMGUI_DIALOG_THEME"));
}

function DialogGetDarkTheme() {
	return 0;
}

function DialogGetLightTheme() {
	return 1;
}

function DialogGetClassicTheme() {
	return -1;
}

function DialogSetColorTheme(nTheme) {
	return bool(environment_set_variable("IMGUI_DIALOG_THEME", string(nTheme)));
}

function DialogSetLocaleToAmericanEnglish() {
	/* Translation contributed by Samuel Venable */
	environment_set_variable("IMGUI_QUICK_ACCESS",                       "Quick Access");
	environment_set_variable("IMGUI_THIS_PC",                            "This PC");
	environment_set_variable("IMGUI_ALL_FILES",                          "All Files (*.*)");
	environment_set_variable("IMGUI_NAME",                               "Name");
	environment_set_variable("IMGUI_DATE_MODIFIED",                      "Date modified");
	environment_set_variable("IMGUI_SIZE",                               "Size");
	environment_set_variable("IMGUI_NEW_FILE",                           "New file");
	environment_set_variable("IMGUI_NEW_DIRECTORY",                      "New directory");
	environment_set_variable("IMGUI_DELETE",                             "Delete");
	environment_set_variable("IMGUI_ARE_YOU_SURE",                       "Are you sure?");
	environment_set_variable("IMGUI_OVERWRITE_FILE",                     "Overwrite file?");
	environment_set_variable("IMGUI_ENTER_FILE_NAME",                    "Enter file name");
	environment_set_variable("IMGUI_ENTER_DIRECTORY_NAME",               "Enter directory name");
	environment_set_variable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "Are you sure you want to delete %s?");
	environment_set_variable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "Are you sure you want to overwrite %s?");
	environment_set_variable("IMGUI_YES",                                "Yes");
	environment_set_variable("IMGUI_NO",                                 "No");
	environment_set_variable("IMGUI_OK",                                 "OK");
	environment_set_variable("IMGUI_CANCEL",                             "Cancel");
	environment_set_variable("IMGUI_SEARCH",                             "Search");
	environment_set_variable("IMGUI_FILE_NAME_WITH_COLON",               "File name:");
	environment_set_variable("IMGUI_FILE_NAME_WITHOUT_COLON",            "File name");
	environment_set_variable("IMGUI_SAVE",                               "Save");
	environment_set_variable("IMGUI_OPEN",                               "Open");
}

function DialogSetLocaleToSimplifiedChinese() {
	/* Translation contributed by chenxi050402 */
	environment_set_variable("IMGUI_QUICK_ACCESS",                       "主文件夹");
	environment_set_variable("IMGUI_THIS_PC",                            "此电脑");
	environment_set_variable("IMGUI_ALL_FILES",                          "所有文件 (*.*)");
	environment_set_variable("IMGUI_NAME",                               "名称");
	environment_set_variable("IMGUI_DATE_MODIFIED",                      "修改日期");
	environment_set_variable("IMGUI_SIZE",                               "大小");
	environment_set_variable("IMGUI_NEW_FILE",                           "新建文件");
	environment_set_variable("IMGUI_NEW_DIRECTORY",                      "新建文件夹");
	environment_set_variable("IMGUI_DELETE",                             "删除");
	environment_set_variable("IMGUI_ARE_YOU_SURE",                       "确定吗？");
	environment_set_variable("IMGUI_OVERWRITE_FILE",                     "覆盖文件吗？");
	environment_set_variable("IMGUI_ENTER_FILE_NAME",                    "输入文件名");
	environment_set_variable("IMGUI_ENTER_DIRECTORY_NAME",               "输入目录名");
	environment_set_variable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "确定要删除 %s 吗？");
	environment_set_variable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "确定要覆盖 %s 吗？");
	environment_set_variable("IMGUI_YES",                                "是");
	environment_set_variable("IMGUI_NO",                                 "否");
	environment_set_variable("IMGUI_OK",                                 "确定");
	environment_set_variable("IMGUI_CANCEL",                             "取消");
	environment_set_variable("IMGUI_SEARCH",                             "搜索");
	environment_set_variable("IMGUI_FILE_NAME_WITH_COLON",               "文件名：");
	environment_set_variable("IMGUI_FILE_NAME_WITHOUT_COLON",            "文件名");
	environment_set_variable("IMGUI_SAVE",                               "保存");
	environment_set_variable("IMGUI_OPEN",                               "打开");
}

function DialogGetInitLocale() {
	if (environment_get_variable_exists("IMGUI_DIALOG_INITLOC"))
		return bool(environment_get_variable("IMGUI_DIALOG_INITLOC"))
	return false;
}

function DialogSetInitLocale(bInit) {
	return bool(environment_set_variable("IMGUI_DIALOG_INITLOC", string(bInit)))
}

function DialogInitialize() {
	DialogSetOwnerWindow(window_handle());
	DialogSetWindowCaption(window_get_caption());
	DialogSetColorTheme(DialogGetLightTheme());
	DialogSetResizeable(true)
	DialogSetFontSize(16);
	DialogSetFontFiles(working_directory + string_lower("Data/Fonts/NotoSans-Bold.ttf"));
	DialogSetWindowSize(640, 360);
}
