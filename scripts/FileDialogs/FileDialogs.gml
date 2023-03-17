function ShowMessage(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-message "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function ShowQuestion(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-question "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function ShowQuestionExt(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-question-ext "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function GetOpenFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-open-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function GetOpenFileNames(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-open-filenames-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	res = string_replace_all(string_replace_all(res, "\r", ""), "\a", "");
	if (string_length(res)) res = string_copy(res, 0, string_length(res) - 1);
	return res;
}

function GetSaveFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-save-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function GetDirectory(lpCapt, lpRoot) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-directory-alt "' + string(lpCapt) + @'" "' + string(lpRoot) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function DialogGetFontFolder() {
	return string(EnvironmentGetVariable("IMGUI_FONT_PATH"));
}

function DialogSetFontFolder(lpParentFolder) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_PATH", lpParentFolder));
}

function DialogGetFontFiles() {
	return string(EnvironmentGetVariable("IMGUI_FONT_FILES"));
}

function DialogSetFontFiles(lpFileNames) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_FILES", lpFileNames));
}

function DialogGetFontSize() {
	return int64(EnvironmentGetVariable("IMGUI_FONT_SIZE"));
}

function DialogSetFontSize(dwSize) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_SIZE", string(dwSize)));
}

function DialogGetWindowWidth() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_WIDTH"));
}

function DialogGetWindowHeight() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_HEIGHT"));
}

function DialogSetWindowSize(dwWidth, dwHeight) {
	return (bool(EnvironmentSetVariable("IMGUI_DIALOG_WIDTH", string(dwWidth))) && bool(EnvironmentSetVariable("IMGUI_DIALOG_HEIGHT", string(dwHeight))));
}

function DialogGetOwnerWindow() {
	return ptr(int64(EnvironmentGetVariable("IMGUI_DIALOG_PARENT")));
}

function DialogSetOwnerWindow(lpOwner) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(lpOwner))));
}

function DialogGetWindowCaption() {
	return string(EnvironmentGetVariable("IMGUI_DIALOG_CAPTION"));
}

function DialogSetWindowCaption(lpCaption) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_CAPTION", string(lpCaption)));
}

function DialogGetResizeable() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_RESIZE"));
}

function DialogSetResizeable(bResizeable) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_RESIZE", string(bool(bResizeable))));
}

function DialogGetBorderless() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_NOBORDER"));
}

function DialogSetBorderless(bBorderless) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_NOBORDER", string(bool(bBorderless))));
}

function DialogGetFullScreen() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_FULLSCREEN"));
}

function DialogSetFullScreen(bFullScreen) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_FULLSCREEN", string(bool(bFullScreen))));
}

function DialogGetColorTheme() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_THEME"));
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
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(nTheme)));
}

function DialogSetLocaleToAmericanEnglish() {
	/* Translation contributed by Samuel Venable */
	EnvironmentSetVariable("IMGUI_QUICK_ACCESS",                       "Quick Access");
	EnvironmentSetVariable("IMGUI_THIS_PC",                            "This PC");
	EnvironmentSetVariable("IMGUI_ALL_FILES",                          "All Files (*.*)");
	EnvironmentSetVariable("IMGUI_NAME",                               "Name");
	EnvironmentSetVariable("IMGUI_DATE_MODIFIED",                      "Date modified");
	EnvironmentSetVariable("IMGUI_SIZE",                               "Size");
	EnvironmentSetVariable("IMGUI_NEW_FILE",                           "New file");
	EnvironmentSetVariable("IMGUI_NEW_DIRECTORY",                      "New directory");
	EnvironmentSetVariable("IMGUI_DELETE",                             "Delete");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE",                       "Are you sure?");
	EnvironmentSetVariable("IMGUI_OVERWRITE_FILE",                     "Overwrite file?");
	EnvironmentSetVariable("IMGUI_ENTER_FILE_NAME",                    "Enter file name");
	EnvironmentSetVariable("IMGUI_ENTER_DIRECTORY_NAME",               "Enter directory name");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "Are you sure you want to delete %s?");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "Are you sure you want to overwrite %s?");
	EnvironmentSetVariable("IMGUI_YES",                                "Yes");
	EnvironmentSetVariable("IMGUI_NO",                                 "No");
	EnvironmentSetVariable("IMGUI_OK",                                 "OK");
	EnvironmentSetVariable("IMGUI_CANCEL",                             "Cancel");
	EnvironmentSetVariable("IMGUI_SEARCH",                             "Search");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITH_COLON",               "File name:");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITHOUT_COLON",            "File name");
	EnvironmentSetVariable("IMGUI_SAVE",                               "Save");
	EnvironmentSetVariable("IMGUI_OPEN",                               "Open");
}

function DialogSetLocaleToSimplifiedChinese() {
	/* Translation contributed by chenxi050402 */
	EnvironmentSetVariable("IMGUI_QUICK_ACCESS",                       "主文件夹");
	EnvironmentSetVariable("IMGUI_THIS_PC",                            "此电脑");
	EnvironmentSetVariable("IMGUI_ALL_FILES",                          "所有文件 (*.*)");
	EnvironmentSetVariable("IMGUI_NAME",                               "名称");
	EnvironmentSetVariable("IMGUI_DATE_MODIFIED",                      "修改日期");
	EnvironmentSetVariable("IMGUI_SIZE",                               "大小");
	EnvironmentSetVariable("IMGUI_NEW_FILE",                           "新建文件");
	EnvironmentSetVariable("IMGUI_NEW_DIRECTORY",                      "新建文件夹");
	EnvironmentSetVariable("IMGUI_DELETE",                             "删除");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE",                       "确定吗？");
	EnvironmentSetVariable("IMGUI_OVERWRITE_FILE",                     "覆盖文件吗？");
	EnvironmentSetVariable("IMGUI_ENTER_FILE_NAME",                    "输入文件名");
	EnvironmentSetVariable("IMGUI_ENTER_DIRECTORY_NAME",               "输入目录名");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "确定要删除 %s 吗？");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "确定要覆盖 %s 吗？");
	EnvironmentSetVariable("IMGUI_YES",                                "是");
	EnvironmentSetVariable("IMGUI_NO",                                 "否");
	EnvironmentSetVariable("IMGUI_OK",                                 "确定");
	EnvironmentSetVariable("IMGUI_CANCEL",                             "取消");
	EnvironmentSetVariable("IMGUI_SEARCH",                             "搜索");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITH_COLON",               "文件名：");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITHOUT_COLON",            "文件名");
	EnvironmentSetVariable("IMGUI_SAVE",                               "保存");
	EnvironmentSetVariable("IMGUI_OPEN",                               "打开");
}

function DialogInitialize() {
	directory_create(game_save_id);
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	if (os_type != os_macosx) EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(window_handle())));
	file_copy(string_lower("Data/CLI/filedialogs." + ext), game_save_id + "filedialogs." + ext);
	ProcessExecute(@'chmod +x "' + game_save_id + "filedialogs." + ext + @'"')
	DialogSetWindowCaption(window_get_caption());
	DialogSetColorTheme(DialogGetLightTheme());
	DialogSetResizeable(true);
	DialogSetFontSize(16);
	DialogSetFontFiles(working_directory + string_lower("Data/Fonts/NotoSans-Regular.ttf"));
	DialogSetWindowSize(640, 360);
}

DialogInitialize();
