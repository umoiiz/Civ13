//////////////////////////////////////////////////////////////////
//  Research books  //////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//TO DO: Split research book items to diiferent items
/obj/item/weapon/book/research
	name = "空白卷轴"
	icon_state = "scroll0"
	title = "Blank Scroll"
	desc = "一张空白的羊皮纸卷轴."
	var/list/completed = list()
	var/k_class = "none"
	var/k_level = 0
	var/styleb = "scroll"
	unique = TRUE

/obj/item/weapon/book/research/examine(mob/user)
	return

/obj/item/weapon/book/research/New()
	..()
	if (map.ordinal_age >= 3)
		name = "blank research book"
		icon_state = "research0"
		title = "Blank Book"
		desc = "A blank scientific book."
		styleb = "book"
	else if (map.ordinal_age == 0)
		name = "blank slate"
		icon_state = "research_rock0"
		title = "Blank Slate"
		desc = "A blank slate, where you can carve scientific information."
		styleb = "research_rock"

/obj/item/weapon/book/research/attack_self(var/mob/living/human/user as mob)
	if (!completed.len)
		var/list/display = list("Cancel")
		if (map.ordinal_age < 3)
			display = list("Cancel", "Industry", "Anatomy", "Fencing", "Archery", "Medicine", "Philosophy")
		else
			display = list("Cancel", "Industry", "Anatomy", "Fencing", "Archery", "Gunpowder", "Medicine", "Philosophy")
		var/choice = WWinput(user, "Which subject do you wish to write about?", "Scientific [name] production", "Cancel", display)
		var/modif = 1
		if (user.religion_check() == "Knowledge")
			modif += 0.15
		if (user.religious_clergy == "Monks")
			modif += 0.3
		to_chat(user, "<span class='notice'>你开始将你的知识誊写到[name]上.</span>")
		var/success = FALSE
		switch (choice)
			if ("Industry")
				if (do_after(user, (300*(user.getStatCoeff("crafting")))/modif, src))
					success = TRUE
					k_level = (user.getStatCoeff("crafting"))
					name = pick("Woodcutting Basics, by [user]", "Mining and Industrialization, by [user]", "Furniture: How to Complete a Home, by [user]", "Building and Construction Basics, by [user]")
			if ("Anatomy")
				if (do_after(user, (300*((user.getStatCoeff("dexterity")+user.getStatCoeff("strength"))))/modif, src))
					success = TRUE
					k_level = ((user.getStatCoeff("dexterity")+user.getStatCoeff("strength")))
					name = pick("Human Body Limits, by [user]", "Increasing Muscular Mass, by [user]", "Complete Guide to Human Anatomy, by [user]", "Athletics Guide, by [user]")
			if ("Fencing")
				if (do_after(user, (300*(user.getStatCoeff("swords")))/modif, src))
					success = TRUE
					k_level = (user.getStatCoeff("swords"))
					name = pick("Swords & Swordfighting, by [user]", "Fencing: The Human Art, by [user]", "Introduction to Swordfighting, by [user]", "From Spears to Pikes, by [user]")
			if ("Archery")
				if (do_after(user, (300*(user.getStatCoeff("bows")))/modif, src))
					success = TRUE
					k_level = (user.getStatCoeff("bows"))
					name = pick("Bows & Longbows, by [user]", "On Archery Physics, by [user]", "Archery and Accuracy, by [user]", "The Archer's Guide, by [user]")
			if ("Gunpowder")
				if (do_after(user, (300*((user.getStatCoeff("pistol")+user.getStatCoeff("rifle"))))/modif, src))
					success = TRUE
					k_level = ((user.getStatCoeff("pistol")+user.getStatCoeff("rifle")))
					name = pick("Muskets and Pistols: The Complete Guide, by [user]", "Gun Rifling, by [user]", "Cannons, Muskets & Blunderbusses, by [user]", "The Soldiers Companion, by [user]")
			if ("Medicine")
				if (do_after(user, (300*(user.getStatCoeff("medical")))/modif, src))
					success = TRUE
					k_level = (user.getStatCoeff("medical"))
					name = pick("Diseases of the Blood, by [user]", "Religion & Cures, by [user]", "Surgery Guide, by [user]", "Amputation: A Beginners Guide, by [user]")
			if ("Philosophy")
				if (do_after(user, (300*(user.getStatCoeff("philosophy")))/modif, src))
					success = TRUE
					k_level = (user.getStatCoeff("philosophy"))
					name = pick("Discourse Rethoric, by [user]", "Metaphysics of Religion, by [user]", "Politics, by [user]", "Human Ethics, by [user]")
			else 
				return
		if (success)
			k_class = lowertext(choice)
			switch (choice)
				if ("Industry") 
					choice = "crafting"
				if ("Anatomy")
					choice = "strength and dexterity"
				if ("Fencing")
					choice = "swords"
				if ("Gunpowder")
					choice = "gunpowder weapons"
				else
					choice = k_class
			user.adaptStat("philosophy", 1)
			if (user.religious_clergy == "Monks")
				map.custom_religions[user.religion][3] += 6
			author = "[user]"
			completed += user
			icon_state = "[styleb]1"
			desc = "A scientific [replacetext(styleb,"research_rock","slate")], with knowledge in [choice]."
			to_chat(user, "<span class='notice'>你完成了[name].</span>")
			update_icon()
	else
		if (completed[1] == user)
			to_chat(user, "<span class='warning'>这本书是你写的! 你无法从阅读它中学到任何东西.</span>")
			return
		if (user in completed)
			to_chat(user, "<span class='warning'>你已经读过这本书了,它不太可能给你带来新的知识.</span>")
			return
		var/choice = input("This is a book by [author] on [k_class]. Do you want to study it?") in list("Yes", "No")
		if (choice == "No")
			return
		var/modif = 1
		if (user.religion_check() == "Knowledge")
			modif += 0.25
		if (user.religious_clergy == "Monks")
			modif += 0.3
		to_chat(user, "<span class='notice'>你开始专注地阅读[name]...</span>")
		if (do_after(user, (600*k_level)/modif, src))
			to_chat(user, "<span class='notice'>你完成了对[name]的研究. 你感觉自己已经变聪明了.</span>")
			if (k_class == "industry")
				user.adaptStat("crafting", (16*k_level)/modif)
			if (k_class == "medicine")
				user.adaptStat("medical", (16*k_level)/modif)
			if (k_class == "archery")
				user.adaptStat("bows", (16*k_level)/modif)
			if (k_class == "fencing")
				user.adaptStat("swords", (16*k_level)/modif)
			if (k_class == "anatomy")
				user.adaptStat("strength", (8*k_level)/modif)
				user.adaptStat("dexterity", (8*k_level)/modif)
			if (k_class == "gunpowder")
				user.adaptStat("pistol", (8*k_level)/modif)
				user.adaptStat("rifle", (8*k_level)/modif)
			if (k_class == "philosophy")
				user.adaptStat("philosophy", (16*k_level)/modif)
			completed += user

//////////////////////////////////////////////////////////////////
//  Research kit  ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
/obj/item/weapon/researchkit
	name = "研究套件"
	icon_state = "scrolls1"
	icon = 'icons/obj/library.dmi'
	desc = "一套用于研究古代知识的仪器."
	weight = 1.0
	flammable = TRUE

/obj/item/weapon/researchkit/New()
	..()
	icon_state = "scrolls[map.ordinal_age]"

/obj/item/weapon/researchkit/update_icon()
	..()
	icon_state = "scrolls[map.ordinal_age]"

/obj/item/weapon/book/research/attackby(obj/O as obj, mob/living/human/user as mob)
	if (istype(O, /obj/item/weapon/researchkit))
		if (!map.civilizations || (map.ID == MAP_TRIBES || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_THREE_TRIBES))
			return
		if (!completed.len)
			to_chat(user, "这本书是空白的.")
			return
		if (user.original_job_title == "Nomad")
			if (map.age1_done == FALSE)
				if (world.time < 36000 && ( (map.custom_civs[user.civilization][1] >= 19) || (map.custom_civs[user.civilization][2] >= 19) || (map.custom_civs[user.civilization][3] >= 19)) )
					to_chat(user, "你在其中一种研究类型上过于先进,或者速度太快了. 你可以在[(36000-world.time)/600]分钟后再次研究.")
					return
			else if (map.age1_done == TRUE && map.age2_done == FALSE)
				if (world.time < map.age2_timer && ( (map.custom_civs[user.civilization][1] >= map.age1_top) || (map.custom_civs[user.civilization][2] >= map.age1_top) || (map.custom_civs[user.civilization][3] >= map.age1_top)) )
					to_chat(user, "你在其中一种研究类型上过于先进,或者速度太快了. 你可以在[(map.age2_timer-world.time)/600]分钟后再次研究.")
					return
			if (map.age2_done == TRUE && map.age3_done == FALSE)
				if (world.time < map.age3_timer && ( (map.custom_civs[user.civilization][1] >= map.age2_top) || (map.custom_civs[user.civilization][2] >= map.age2_top) || (map.custom_civs[user.civilization][3] >= map.age2_top)) )
					to_chat(user, "你在其中一种研究类型上过于先进,或者速度太快了. 你可以在[(map.age3_timer-world.time)/600]分钟后再次研究.")
					return
			if (map.age3_done == TRUE && map.age4_done == FALSE)
				if (world.time < map.age4_timer && ( (map.custom_civs[user.civilization][1] >= map.age3_top) || (map.custom_civs[user.civilization][2] >= map.age3_top) || (map.custom_civs[user.civilization][3] >= map.age3_top)) )
					to_chat(user, "你在其中一种研究类型上过于先进,或者速度太快了. 你可以在[(map.age4_timer-world.time)/600]分钟后再次研究.")
					return
			if (map.age4_done == TRUE && map.age5_done == FALSE)
				if (world.time < map.age5_timer && ( (map.custom_civs[user.civilization][1] >= map.age4_top) || (map.custom_civs[user.civilization][2] >= map.age4_top) || (map.custom_civs[user.civilization][3] >= map.age4_top)) )
					to_chat(user, "你在其中一种研究类型上过于先进,或者速度太快了. 你可以在[(map.age5_timer-world.time)/600]分钟后再次研究.")
					return

		var/current_tribesmen = 0
		var/studytime = 150*k_level
		var/modif = 1
		if (user.religion_check() == "Knowledge")
			modif += 0.25
		if (user.religious_clergy == "Monks")
			modif += 0.3

		var/displaytime = convert_to_textminute(studytime)
		to_chat(user, "正在研究这份文件... 这将需要[displaytime]才能完成.")
		if (do_after(user,(studytime/user.getStatCoeff("philosophy"))/modif,src))

			if (user.civilization != null && user.civilization != "none")
				if (alive_civilians.len <= 12)
					current_tribesmen = alive_civilians.len
				else if (alive_civilians.len > 12 && alive_civilians.len <= 30)
					current_tribesmen = alive_civilians.len/2
				else
					current_tribesmen = alive_civilians.len/min(2+((alive_civilians.len-30)*0.1),5)
				if (k_class == "medicine" || k_class == "anatomy")
					map.custom_civs[user.civilization][3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.custom_civs[user.civilization][2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.custom_civs[user.civilization][1] += k_level/current_tribesmen
			else
				to_chat(user, "你不属于任何阵营.")
				return

			if (user.civilization == civname_a)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.civa_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.civa_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.civa_research[1] += k_level/current_tribesmen
			else if (user.civilization == civname_b)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.civb_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.civb_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.civb_research[1] += k_level/current_tribesmen
			else if (user.civilization == civname_c)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.civc_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.civc_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.civc_research[1] += k_level/current_tribesmen
			else if (user.civilization == civname_d)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.civd_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.civd_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.civd_research[1] += k_level/current_tribesmen
			else if (user.civilization == civname_e)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.cive_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.cive_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.cive_research[1] += k_level/current_tribesmen
			else if (user.civilization == civname_f)
				current_tribesmen = (alive_civilians.len/map.availablefactions.len)
				if (k_class == "medicine" || k_class == "anatomy")
					map.civf_research[3] += k_level/current_tribesmen
				if (k_class == "gunpowder" || k_class == "fencing" || k_class == "archery")
					map.civf_research[2] += k_level/current_tribesmen
				if (k_class == "industry" || k_class == "philosophy")
					map.civf_research[1] += k_level/current_tribesmen

			to_chat(user, "你完成了这份文件的研究. 获得的知识将有助于我们社会的发展.")
			user.adaptStat("philosophy", 1*k_level*modif)
	else
		..()
