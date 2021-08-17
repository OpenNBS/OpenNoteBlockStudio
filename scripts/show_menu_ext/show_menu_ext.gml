function show_menu_ext(argument0, argument1, argument2, argument3) {
	// show_menu_ext(name, x, y, str)
	// name  name of menu
	// x, y   position
	// str   obj contents
	//          |   new item
	//          -   separator
	//          \   start submenu
	//          /   end submenu
	//          ^!  prefix, inactive item
	//          x~  prefix, displays image x in the sprite
	//          x$  prefix, shortcut x
	// Returns the number of the item clicked, -1 for cancelled.

	if (menu_shown != "") {
	    return 0
	}

	menu_shown = argument0
	if (!isplayer) playing = 0
	window += w_menu

	var obj, str, submenu, n;
	obj = create(obj_menu)
	obj.name = argument0
	obj.sx = argument1
	obj.sy = argument2
	obj.menus = 1
	obj.items[0] = 0
	obj.ani = 0
	obj.sel = -1
	submenu = 0
	n = 0
	wmenu = 2
	if (windowsound && theme = 3) play_sound(soundshow, 45, 100, 100, 0)

	str = string_replace_all(argument3 + "|", "||", "|")
	while (str != "") {
	    var p, itemstr;
	    p = string_pos("|", str)
	    itemstr = string_copy(str, 1, p - 1)
	    str = string_delete(str, 1, p)
	    if (itemstr = "\\") { // New menu
	        obj.item_hasmenu[submenu, obj.items[submenu] - 1] = obj.menus
	        obj.menu_parent[obj.menus] = submenu
	        obj.items[obj.menus] = 0
	        submenu = obj.menus
	        obj.menus += 1
	    } else if (itemstr = "/") { // Return to current menus parent
	        submenu = obj.menu_parent[submenu]
	    } else {
	        // Check inactive
	        p = string_pos("^!", itemstr)
	        obj.item_inactive[submenu, obj.items[submenu]] = (p > 0)
	        itemstr = string_replace(itemstr, "^!", "")
	        // Check sprite
	        p = string_pos("~", itemstr)
	        if (p > 0) obj.item_image[submenu, obj.items[submenu]] = real(string_copy(itemstr, 1, p - 1))
	        else obj.item_image[submenu, obj.items[submenu]] = -1
	        itemstr = string_delete(itemstr, 1, p)
	        // Check shortcut
	        p = string_pos("$", itemstr)
	        obj.item_shortcut[submenu, obj.items[submenu]] = string_copy(itemstr, 1, p - 1)
	        itemstr = string_delete(itemstr, 1, p)
        
	        obj.item_n[submenu, obj.items[submenu]] = n
	        obj.item_str[submenu, obj.items[submenu]] = itemstr
	        obj.item_hasmenu[submenu, obj.items[submenu]] = 0
	        obj.items[submenu] += 1
        
	        if (itemstr != "-") n += 1
	    }
	}
	// menu_print(obj, 0, 0)

	var a, b;
	for (a = 0; a < obj.menus; a += 1) {
	    obj.menu_wid[a] = 0
	    obj.menu_hei[a] = 0
	    obj.menu_show[a] = 0
	    obj.menu_sel[a] = -1
	    for (b = 0; b < obj.items[a]; b += 1) {
	        obj.menu_wid[a] = max(obj.menu_wid[a], string_width_dynamic(obj.item_str[a, b] + " " + obj.item_shortcut[a, b]) + 5 * (obj.name = "edit" && theme != 3))
	        if (obj.item_str[a, b] = "-") obj.menu_hei[a] += 6
	        else obj.menu_hei[a] += 22
	    }
	    obj.menu_wid[a] += 56
	    obj.menu_hei[a] += 6
	}

	obj.menu_show[0] = 1
	return obj



}
