// control_http()

if (async_load[? "id"] = update_http) {
    update_http = -1
    if (async_load[? "http_status"] = 200) {
        var res = async_load[? "result"];
        if (is_string(res)) {
            if (string_count(".", res) = 2) {
                if (res = version) {
                    update = 2
                } else {
                    if (question("Version " + res + " is available! Do you want to download it?", "Update available!")) open_url(link_download)
                    update = 1
                }
            }
        }
    } else
        update = -1
}
