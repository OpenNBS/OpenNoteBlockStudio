display_set_gui_size(window_get_width(), window_get_height());
draw_set_font(fnt_example);

if (file_dnd_allowmulti) {
    if (file_dnd_allowfiles && file_dnd_allowdirs) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "file and folder dropping enabled; press enter to disable.";
            else
                str = "file and folder dropping enabled; press enter to disable.##files and folders dropped:##" + file_dnd_filelist;
        } else {
            str = "file and folder dropping disabled; press enter to enable.";
        }
    } else if (file_dnd_allowfiles) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "file dropping enabled; press enter to disable.";
            else
                str = "file dropping enabled; press enter to disable.##files dropped:##" + file_dnd_filelist;
        } else {
            str = "file dropping disabled; press enter to enable.";
        }
    } else if (file_dnd_allowdirs) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "folder dropping enabled; press enter to disable.";
            else
                str = "folder dropping enabled; press enter to disable.##folders dropped:##" + file_dnd_filelist;
        } else {
            str = "folder dropping disabled; press enter to enable.";
        }
    }
} else {
    if (file_dnd_allowfiles && file_dnd_allowdirs) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "file and folder dropping enabled; press enter to disable.";
            else
                str = "file and folder dropping enabled; press enter to disable.##file or folder dropped:##" + file_dnd_filelist;
        } else {
            str = "file and folder dropping disabled; press enter to enable.";
        }
    } else if (file_dnd_allowfiles) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "file dropping enabled; press enter to disable.";
            else
                str = "file dropping enabled; press enter to disable.##file dropped:##" + file_dnd_filelist;
        } else {
            str = "file dropping disabled; press enter to enable.";
        }
    } else if (file_dnd_allowdirs) {
        if (file_dnd_get_enabled()) {
            if (file_dnd_filelist == "")
                str = "folder dropping enabled; press enter to disable.";
            else
                str = "folder dropping enabled; press enter to disable.##folder dropped:##" + file_dnd_filelist;
        } else {
            str = "folder dropping disabled; press enter to enable.";
        }
    }
}

draw_set_color(c_white);
draw_rectangle(32, 32, 32 + string_width(string_hash_to_newline(str)), 32 + string_height(string_hash_to_newline(str)), 0);

draw_set_color(c_black);
draw_text(32, 32, string_hash_to_newline(str));