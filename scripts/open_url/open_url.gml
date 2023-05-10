function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else if (os_type = os_macosx) execute_shell("open", @'"' + url + @'"');
  else if (os_type = os_linux) execute_shell("/usr/bin/xdg-open", @'"' + url + @'"');
}
