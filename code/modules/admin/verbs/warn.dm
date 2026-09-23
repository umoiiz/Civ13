/client/proc/warn(warned_ckey)
	if (!check_rights(R_ADMIN))	return

	if (!warned_ckey || !istext(warned_ckey))	return
	if (warned_ckey in admin_datums)
		to_chat(usr, "<font color='red'>错误: warn(): 你不能警告管理员.</font>")
		return

	for (var/client/C in clients)
		if (C.ckey == warned_ckey)
			to_chat(C, "<font color='red'><big><b>你已被管理员正式警告.</b></big></font>")
			message_admins("[key_name_admin(src)] has warned [key_name_admin(C)].", key_name_admin(src))
			return
	message_admins("[key_name_admin(src)] has warned [warned_ckey] (DC).", key_name_admin(src))