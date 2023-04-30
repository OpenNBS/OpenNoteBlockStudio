function _DialogInitialize() {
	EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));
	EnvironmentSetVariable("IMGUI_DIALOG_WIDTH", string(800));
	if (os_type != os_linux) {
		_IfdLoadFonts();
		EnvironmentSetVariable("IMGUI_FONT_PATH", working_directory + string_lower("Fonts"));
		EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(window_handle())));
	} else {
		directory_create(game_save_id);
		file_copy(string_lower("Data/CLI/filedialogs.elf"), game_save_id + "filedialogs.elf");
		pid = ProcessExecute(@'chmod +x "' + game_save_id + @'filedialogs.elf"');
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
	}
}

function ShowMessage(lpMessage) {
	if (os_type != os_linux) {
		_ShowMessage(lpMessage);
		return 1;
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --show-message "' + string(lpMessage) + @'"');
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
	}
	return 1;
}

function ShowQuestion(lpMessage) {
	if (os_type != os_linux) {
		res = _ShowQuestion(lpMessage);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --show-question "' + string(lpMessage) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	return ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes"));
}

function ShowQuestionExt(lpMessage) {
	if (os_type != os_linux) {
		res = _ShowQuestionExt(lpMessage);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --show-question-ext "' + string(lpMessage) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	if ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes")) {
		return 1;
	} else if ((EnvironmentGetVariable("IMGUI_NO") != "") ? (res == EnvironmentGetVariable("IMGUI_NO")) : (res == "No")) {
		return 0;
	}
	return -1;
}

function GetOpenFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type != os_linux) {
		res = _GetOpenFileName(lpFilter, lpFileName, lpDir, lpTitle);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --get-open-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;
}

function GetOpenFileNames(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type != os_linux) {
		res = _GetOpenFileNames(lpFilter, lpFileName, lpDir, lpTitle);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --get-open-filenames-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace_all(res, "\r", ""), "\a", "");
		if (string_length(res)) res = string_copy(res, 0, string_length(res) - 1);
	}
	if (res == "(null)") res = "";
	return res;
}

function GetSaveFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type != os_linux) {
		res = _GetSaveFileName(lpFilter, lpFileName, lpDir, lpTitle);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --get-save-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;
}

function GetDirectory(lpCapt, lpRoot) {
	if (os_type != os_linux) {
		res = _GetDirectory(lpCapt, lpRoot);
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.elf" --get-directory-alt "' + string(lpCapt) + @'" "' + string(lpRoot) + @'"');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;
}

function DialogSetLocaleToLanguageTemplate() {
	EnvironmentSetVariable("IMGUI_QUICK_ACCESS",                       "");
	EnvironmentSetVariable("IMGUI_THIS_PC",                            "");
	EnvironmentSetVariable("IMGUI_ALL_FILES",                          "");
	EnvironmentSetVariable("IMGUI_NAME",                               "");
	EnvironmentSetVariable("IMGUI_DATE_MODIFIED",                      "");
	EnvironmentSetVariable("IMGUI_SIZE",                               "");
	EnvironmentSetVariable("IMGUI_NEW_FILE",                           "");
	EnvironmentSetVariable("IMGUI_NEW_DIRECTORY",                      "");
	EnvironmentSetVariable("IMGUI_DELETE",                             "");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE",                       "");
	EnvironmentSetVariable("IMGUI_OVERWRITE_FILE",                     "");
	EnvironmentSetVariable("IMGUI_ENTER_FILE_NAME",                    "");
	EnvironmentSetVariable("IMGUI_ENTER_DIRECTORY_NAME",               "");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "");
	EnvironmentSetVariable("IMGUI_YES",                                "");
	EnvironmentSetVariable("IMGUI_NO",                                 "");
	EnvironmentSetVariable("IMGUI_OK",                                 "");
	EnvironmentSetVariable("IMGUI_CANCEL",                             "");
	EnvironmentSetVariable("IMGUI_SEARCH",                             "");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITH_COLON",               "");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITHOUT_COLON",            "");
	EnvironmentSetVariable("IMGUI_SAVE",                               "");
	EnvironmentSetVariable("IMGUI_OPEN",                               "");
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

function DialogSetLocaleToBrazilianPortuguese() {
	/* Translation contributed by Bentroen */
	EnvironmentSetVariable("IMGUI_QUICK_ACCESS",                       "Acesso rápido");
	EnvironmentSetVariable("IMGUI_THIS_PC",                            "Este computador");
	EnvironmentSetVariable("IMGUI_ALL_FILES",                          "Todos os arquivos (*.*)");
	EnvironmentSetVariable("IMGUI_NAME",                               "Nome");
	EnvironmentSetVariable("IMGUI_DATE_MODIFIED",                      "Data de modificação");
	EnvironmentSetVariable("IMGUI_SIZE",                               "Tamanho");
	EnvironmentSetVariable("IMGUI_NEW_FILE",                           "Novo arquivo");
	EnvironmentSetVariable("IMGUI_NEW_DIRECTORY",                      "Nova pasta");
	EnvironmentSetVariable("IMGUI_DELETE",                             "Excluir");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE",                       "Tem certeza?");
	EnvironmentSetVariable("IMGUI_OVERWRITE_FILE",                     "Substituir o arquivo?");
	EnvironmentSetVariable("IMGUI_ENTER_FILE_NAME",                    "Insira o nome do arquivo");
	EnvironmentSetVariable("IMGUI_ENTER_DIRECTORY_NAME",               "Insira o nome da pasta");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_DELETE",    "Deseja mesmo excluir %s?");
	EnvironmentSetVariable("IMGUI_ARE_YOU_SURE_YOU_WANT_TO_OVERWRITE", "Deseja mesmo substituir %s?");
	EnvironmentSetVariable("IMGUI_YES",                                "Sim");
	EnvironmentSetVariable("IMGUI_NO",                                 "Não");
	EnvironmentSetVariable("IMGUI_OK",                                 "OK");
	EnvironmentSetVariable("IMGUI_CANCEL",                             "Cancelar");
	EnvironmentSetVariable("IMGUI_SEARCH",                             "Pesquisar");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITH_COLON",               "Nome do arquivo:");
	EnvironmentSetVariable("IMGUI_FILE_NAME_WITHOUT_COLON",            "Nome do arquivo");
	EnvironmentSetVariable("IMGUI_SAVE",                               "Salvar");
	EnvironmentSetVariable("IMGUI_OPEN",                               "Abrir");
}

_DialogInitialize();
