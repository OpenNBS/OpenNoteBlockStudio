function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else if (os_type = os_macosx) execute_shell("open", @'"' + url + @'"');
  else if (os_type = os_linux) {
    if (string_length(url)) {
      if (string_copy(url, 0, 1) == "/") {
        // xdg-open doesn't work in an appimage bundle apparently...
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
        url_open(url);  
      }
    }
  }
}
