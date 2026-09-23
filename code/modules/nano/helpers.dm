/proc/fix_nanoUI(var/mob/user, var/mob/H)
	if (!istype(H) || !H.client)
		if (user) to_chat(user, "这只能对有客户端的生物进行")
		return

	GLOB.nanomanager.close_uis(H)
	H.client.cache.Cut()
	var/datum/asset/assets = get_asset_datum(/datum/asset/nanoui)
	assets.send(H)

	if (user) to_chat(user, "资源文件已发送")
	to_chat(H, "你的NanoUI资源文件已刷新")

	if (user) log_admin("[key_name(user)] resent the NanoUI resource files to [key_name(H)] ")
