function confirm() {
	// confirm(gameend)

	var a, gameend;
	playing = 0
	if (argument_count > 0)
	    gameend = argument[0]
	else
	    gameend = 0
	a = 0

	if (language != 1) {
	if (songs[song].changed && !isplayer) {
	    if (songs[song].filename = "") {
	        if (!gameend)
	            a = message_yesnocancel("Do you want to save the song?", "Confirm")
	        else
	            a = question("Do you want to save the song (tab " + string(song + 1) +") before quitting?", "Confirm")
	        if (a = 1)
	            if (!save_song(""))
	                return -1
	    } else {
	        if (!gameend)
	            a = message_yesnocancel("Do you want to save the changes made in " + filename_name(songs[song].filename) + "?", "Confirm")
	        else
	            a = question("Do you want to save the changes made in " + filename_name(songs[song].filename) + " (tab " + string(song + 1) +") before quitting?", "Confirm")
	        if (a = 1)
	            if (!save_song(songs[song].filename))
	                return -1
	    }
	}
	} else {
	if (songs[song].changed && !isplayer) {
	    if (songs[song].filename = "") {
	        if (!gameend)
	            a = message_yesnocancel("你想保存未保存的歌曲吗？", "确定")
	        else
	            a = question("你想在退出前保存未保存的歌曲（第 " + string(song + 1) +" 个）吗？", "确定")
	        if (a = 1)
	            if (!save_song(""))
	                return -1
	    } else {
	        if (!gameend)
	            a = message_yesnocancel("你想保存未保存的歌曲" + filename_name(songs[song].filename) + "吗？", "确定")
	        else
	            a = question("你想在退出前保存未保存的歌曲" + filename_name(songs[song].filename) + "（第 " + string(song + 1) +" 个）吗？", "确定")
	        if (a = 1)
	            if (!save_song(songs[song].filename))
	                return -1
	    }
	}
	}

	return a



}
