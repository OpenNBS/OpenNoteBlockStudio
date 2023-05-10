function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else if (os_type = os_macosx) execute_shell("open", @'"' + url + @'"');
  else if (os_type = os_linux) {
    var path = EnvironmentGetVariable("PATH");
	  EnvironmentSetVariable("PATH", "/usr/bin:" + path);
    execute_shell("xdg-open", @'"' + url + @'"');
	  EnvironmentSetVariable("PATH", path);
  }
}
