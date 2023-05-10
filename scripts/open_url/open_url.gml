function open_url(url) {
  if (os_type = os_windows) execute_shell("cmd", @'explorer "' + url + @'"');
  else url_open(url);
}
