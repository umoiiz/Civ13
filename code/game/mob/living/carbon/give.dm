/mob/living/human/verb/give(var/mob/living/target in view(1)-usr)
	set category = "IC"
	set name = "Give"

	if (incapacitated())
		return
	if (!istype(target) || target.incapacitated() || target.client == null)
		return

	var/obj/item/I = usr.get_active_hand()
	if (!I)
		I = usr.get_inactive_hand()
	if (!I)
		to_chat(usr, SPAN_WARNING("You don't have anything in your hands to give to \the [target]."))
		return

	if (WWinput(target, "[usr] wants to give you \a [I]. Will you accept it?", null, "Yes", list("Yes","No")) == "No")
		target.visible_message("<span class='notice'>\The [usr]试图将\the [I]递给\the [target],\
		但\the [target]不想要它。</span>")
		return

	if (!I) return

	if (!Adjacent(target))
		to_chat(usr, SPAN_WARNING("You need to stay in reaching distance whilst giving an object."))
		to_chat(target, SPAN_WARNING("\The [usr] moved too far away."))
		return

	if (I.loc != usr || (usr.l_hand != I && usr.r_hand != I))
		to_chat(usr, SPAN_WARNING("You need to keep the item in your hands."))
		to_chat(target, SPAN_WARNING("\The [usr] seems to have given up on passing \the [I] to you."))
		return

	if (target.r_hand != null && target.l_hand != null)
		to_chat(target, SPAN_WARNING("Your hands are full."))
		to_chat(usr, SPAN_WARNING("Their hands are full."))
		return

	if (usr.unEquip(I))
		target.put_in_hands(I) // If this fails it will just end up on the floor, but that's fitting for things like dionaea.
		target.visible_message("<span class='notice'>\The [usr]将\the [I]递给了\the [target]。</span>")

/mob/living/human/verb/recruit()
	set category = null
	set name = "Recruit"
	set desc = "Invite into your faction."

	set src in view(1)

	var/mob/living/human/user

	if (!ishuman(src))
		return

	if (!ishuman(usr))
		return
	else
		user = usr

	if (user.stat || user.restrained() || !isliving(user))
		return

	if (user == src)
		to_chat(user, "你不能招募你自己。")
		return

	if (user.original_job_title != "Nomad" && !findtext(user.original_job_title,"Civilization"))
		to_chat(user, "你无法在这张地图上招募。")
		return

	if (user.civilization == "none" || user.civilization == null)
		to_chat(user, "你不属于任何阵营。")
		return

	if (!user.leader || user.faction_perms[4] == 0)
		to_chat(user, "你没有招募的权限。")
		return

	if (!istype(src) || src.incapacitated() || src.client == null)
		to_chat(user, "目标似乎没有回应...")
		return

	if (left_factions.len)
		for (var/i in left_factions)
			if (i[1]==user.civilization && i[2]>world.realtime)
				to_chat(user, "你无法招募[usr],因为他最近离开了你的阵营!")
				return
	var/answer = WWinput(src, "[usr] wants to recruit you into his faction, [user.civilization]. Will you accept?", null, "Yes", list("Yes","No"))
	if (answer == "Yes")
		to_chat(usr, ("[src] accepts your offer. They are now part of [user.civilization]."))
		to_chat(src, ("You accept [usr]'s offer. You are now part of [user.civilization]."))
		src.faction_leaving_proc()
		spawn(1)
			src.civilization = user.civilization
		return
	else if (answer == "No")
		to_chat(usr, "[src]拒绝了你的邀请。")
		return
	else
		return

/mob/living/human/verb/faction_perms()
	set category = null
	set name = "Faction Perms"
	set desc = "Change the faction permissions of this person."

	set src in view(1)

	var/mob/living/human/user

	if (!ishuman(src))
		return

	if (!ishuman(usr))
		return
	else
		user = usr

	if (user.stat || user.restrained() || !isliving(user))
		return

	if (!map.civilizations || user.civilization == "none" || user.civilization == null)
		to_chat(user, "你不属于任何阵营。")
		return

	if (!user.leader || user.faction_perms[1] == 0)
		to_chat(user, "你没有更改阵营权限的权限。")
		return

	if (!istype(src) || src.incapacitated() || src.client == null)
		to_chat(user, "目标似乎没有回应...")
		return

	var/answer = WWinput(user, "Add or Remove a permission?", null, "Add", list("Add","Remove","Cancel"))
	if (answer == "Add")
		var/list/a2list = list("Cancel")
		if (faction_perms[1] == 0)
			a2list += "Permission Management"
		if (faction_perms[2] == 0)
			a2list += "Announcements"
		if (faction_perms[3] == 0)
			a2list += "Giving Titles"
		if (faction_perms[4] == 0 && map.nomads)
			a2list += "Recruitment"
		var/answer2 = WWinput(user, "Which permission to add?", null, "Cancel", a2list)
		switch(answer2)
			if ("Permission Management")
				faction_perms[1] = 1
			if ("Announcements")
				faction_perms[2] = 1
				make_commander()
			if ("Giving Titles")
				faction_perms[3] = 1
				make_title_changer()
			if ("Recruitment")
				faction_perms[4] = 1
				leader = 1
			else
				return
	else if (answer == "Remove")
		var/list/a3list = list("Cancel")
		if (faction_perms[1] == 1)
			a3list += "Permission Management"
			to_chat(src, "<big>你获得了权限管理权限。</big>")
		if (faction_perms[2] == 1)
			a3list += "Announcements"
			to_chat(src, "<big>你获得了公告权限。</big>")
		if (faction_perms[3] == 1)
			a3list += "Giving Titles"
			to_chat(src, "<big>你获得了授予头衔权限。</big>")
		if (faction_perms[4] == 1)
			a3list += "Recruitment"
			to_chat(src, "<big>你获得了招募权限。</big>")

		var/answer3 = WWinput(user, "Which permission to remove?", null, "Cancel", a3list)
		switch(answer3)
			if ("Permission Management")
				faction_perms[1] = 0
				to_chat(src, "<big>你失去了权限管理权限。</big>")
			if ("Announcements")
				faction_perms[2] = 0
				to_chat(src, "<big>你失去了公告权限。</big>")
				remove_commander()
			if ("Giving Titles")
				faction_perms[3] = 0
				to_chat(src, "<big>你失去了授予头衔权限。</big>")
				remove_title_changer()
			if ("Recruitment")
				faction_perms[4] = 0
				to_chat(src, "<big>你失去了招募权限。</big>")
			else
				return
	else
		return