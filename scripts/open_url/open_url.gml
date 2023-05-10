function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else if (os_type = os_macosx) execute_shell("open", @'"' + url + @'"');
  else if (os_type = os_linux) {
	// The xdg-open command doesn't work in an AppImage bundle apparently...
    if (string_length(url)) {
      if (string_copy(url, 0, 1) == "/" || url == sounds_directory) {
        if (file_exists("/usr/bin/nautilus")) {
          execute_shell("nautilus", @'"' + url + @'"');
        } else if (file_exists("/usr/bin/dolphin")) {
          execute_shell("dolphin", @'"' + url + @'"');
        } else if (file_exists("/usr/bin/thunar")) {
          execute_shell("thunar", @'"' + url + @'"');
        } else if (file_exists("/usr/bin/caja")) {
          execute_shell("caja", @'"' + url + @'"');
        } else if (file_exists("/usr/bin/pcmanfm")) {
          execute_shell("pcmanfm", @'"' + url + @'"');
        }
      } else {
        execute_shell("firefox", @'"' + url + @'"');
      }
    }
  }
}
