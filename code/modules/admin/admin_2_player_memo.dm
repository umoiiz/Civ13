#define ENABLE_MEMOS 1				//using a define because screw making a config variable for it. This is more efficient and purty.
/proc/get_player_memo_file_dir()
	return "data/memo2.sav"
//write a message
/client/proc/player_memo_write()
	var/savefile/F = new(get_player_memo_file_dir())
	if (F)
		var/memo = input(src,"Type your memo\n(Leaving it blank will delete your current memo):","Write Memo",null) as null|message
		switch(memo)
			if (null)
				return
			if ("")
				F.dir.Remove(ckey)
				to_chat(src, "<b>备忘录已移除</b>")
				return
		if ( findtext(memo,"<script",1,0) )
			return
		to_chat(F[ckey],"来自<b>[capitalize(key)]</b>的服务器备忘录, 时间 [time2text(world.realtime,"(DDD) DD MMM hh:mm")]<br><i>[memo]</i>")
		message_admins("[key] has set a player memo:<br>[memo]", key)

//show all memos
/client/proc/player_memo_show()
	var/savefile/F = new(get_player_memo_file_dir())
	if (F)
		for (var/ckey in F.dir)
			to_chat(src, "<center><span class='motd'>[F[ckey]]</span></center>")

//delete your own or somebody else's memo
/client/proc/player_memo_delete()
	var/savefile/F = new(get_player_memo_file_dir())
	if (F)
		var/_ckey
		if (check_rights(R_SERVER,0))	//high ranking admins can delete other admin's memos
			_ckey = WWinput(src, "Whose memo shall we remove?", "Remove Server Memo", WWinput_first_choice(F.dir), WWinput_list_or_null(F.dir))
		else
			_ckey = ckey
		if (_ckey)
			F.dir.Remove(_ckey)
			to_chat(src, "<b>已移除由[_ckey]创建的备忘录.</b>")

#undef ENABLE_MEMOS