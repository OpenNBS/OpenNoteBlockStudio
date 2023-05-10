function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else if (os_type = os_macosx) execute_shell("open", @'"' + url + @'"');
  else if (os_type = os_linux) {
    if (string_length(url)) {
      if (string_copy(url, 0, 1) == "/") {
        execute_shell("nautilus", @'"' + url + @'"');
      } else {
        url_open(url);  
      }
    }
  }
}
