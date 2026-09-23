/mob/living/human/make_nomad()
	..()
	if (map.nomads)
		verbs += /mob/living/human/proc/create_religion
		verbs += /mob/living/human/proc/abandon_religion
		verbs += /mob/living/human/proc/clergy

///////////////////////RELIGION/////////////////////////
/mob/living/human/proc/create_religion()
	set name = "Create Religion"
	set category = "Faction"
	var/mob/living/human/U

	if (istype(src, /mob/living/human))
		U = src
	else
		return
	if (map.nomads == TRUE || map.ID == MAP_TRIBES || map.ID == MAP_THREE_TRIBES || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CMP)
		if (U.religion != "none")
			to_chat(usr, SPAN_WARNING("You are already member of a religion. Abandon it first."))
			return
		else
			if (U.getStatCoeff("philosophy") < 2.49)
				to_chat(usr, SPAN_WARNING("Your philosophy skill is too low. You need 2.5 or more to create a religion."))
				return
			var/choosename = input(src, "Choose a name for the new religion:") as text|null
			create_religion_pr(choosename)
			return
	else
		to_chat(usr, SPAN_WARNING("You cannot create a religion in this map."))
		return

/mob/living/human/proc/create_religion_pr(var/newname = "none")
	if (!ishuman(src))
		return
	var/mob/living/human/H = src
	for(var/i = 1, i <= map.custom_religion_nr.len, i++)
		if (map.custom_religion_nr[i] == newname)
			to_chat(usr, SPAN_WARNING("That religion already exists. Choose another name."))
			return
	if (newname != null && newname != "none")
		var/choosetype = "Knowledge"
		var/chooseclergy = "Shamans"
		var/choosesymbol = "star"
		var/choosecolor1 = "#000000"
		var/choosecolor2 = "#FFFFFF"
		choosetype = WWinput(src, "Choose a focus for the new religion:", "Religion Creation", "Cancel", list("Cancel","Combat","Knowledge","Production"))
		if (choosetype == "Cancel")
			return
		var/list/clergychoices = list("Cancel","Shamans","Priests")
		if (map.ordinal_age == 1)
			clergychoices = list("Cancel","Shamans","Cultists","Priests")
		else if (map.ordinal_age >= 2)
			clergychoices = list("Cancel","Shamans","Cultists","Priests","Monks","Clerics")

		chooseclergy = WWinput(src, "Choose a clergy organization for your new religion:", "Religion Creation", "Cancel", clergychoices)
		if (chooseclergy == "Cancel")
			return
		choosesymbol = WWinput(src, "Choose a symbol for the new religion:", "Religion Creation", "Cancel", list("Cancel","Star","Sun","Moon","Skull","Hammer","Scales","Cross","Tree"))
		if (choosesymbol == "Cancel")
			return
		choosecolor1 = WWinput(H, "Choose main/symbol color:", "Color" , "#000000", "color")
		if (choosecolor1 == null || choosecolor1 == "")
			return

		choosecolor2 = WWinput(H, "Choose the secondary/background color:", "Color" , "#FFFFFF", "color")
		if (choosecolor2 == null || choosecolor2 == "")
			return

		H.religion = newname
		H.religious_leader = TRUE
		H.religious_clergy = chooseclergy
		H.religion_type = choosetype
		H.religion_style = chooseclergy
		map.custom_religion_nr += newname
		//////////////////////////////////////creator, type, points, symbol, color1, color2, clergy style
		var/newnamev = list("[newname]" = list(H,choosetype,0, choosesymbol,choosecolor1,choosecolor2,chooseclergy))
		map.custom_religions += newnamev
		to_chat(usr, "<big>你现在是<b>[newname]</b>宗教的领袖.</big>")
		switch(chooseclergy)
			if ("Shamans")
				if (H.gender == "male")
					H.religious_title = "Elder Shaman"
					H.religious_title = "Elder Shamaness"
			if ("Priests")
				if (H.gender == "male")
					H.religious_title = "High Priest"
				else
					H.religious_title = "High Priestess"
			if ("Monks")
				if (H.gender == "male")
					H.religious_title = "Father"
				else
					H.religious_title = "Mother"
			if ("Clerics")
				H.religious_title = "Prophet"
		return
	else
		return

/mob/living/human/proc/abandon_religion()
	set name = "Abandon Religion"
	set category = "Faction"
	var/mob/living/human/U

	if (istype(src, /mob/living/human))
		U = src
	else
		return
	if (map.nomads == TRUE || map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CMP)
		if (U.religion == "none")
			to_chat(usr, SPAN_WARNING("You are not part of any religion."))
			return
		else if (U.religious_leader || U.religious_clergy != FALSE)
			to_chat(usr, SPAN_WARNING("You cannot leave a religion while part of its clergy!"))
			return
		else
			var/list/rel_data = map.custom_religions[U.religion]
			if (rel_data[1] != null)
				var/mob/living/human/L = rel_data[1]
				if (L.real_name == U.real_name)
					rel_data[1] = null
			U.religion = "none"
			U.religion_type = "none"
			U.religion_style = "none"
			U.religious_leader = FALSE
			to_chat(usr, "你离开了你的宗教. 你现在是一名无神论者.")
	else
		to_chat(usr, SPAN_WARNING("You cannot leave your religion in this map."))
		return

/mob/living/human/proc/clergy()
	set name = "Join the Clergy"
	set category = "Faction"
	var/mob/living/human/U

	if (istype(src, /mob/living/human))
		U = src
	else
		return
	if (map.nomads == TRUE || map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CMP)
		if (U.religion == "none")
			to_chat(usr, SPAN_WARNING("You are not part of any religion."))
			return
		else if (U.religious_leader || U.religious_clergy != FALSE)
			to_chat(usr, SPAN_WARNING("You are already part of the clergy!"))
			return
		else if (WWinput(src, "Are you sure you want to join the clergy? The membership is for life.", "", "Cancel", list("Join the clergy", "Cancel")) == "Join the clergy")
			switch(map.custom_religions[U.religion][7])

				if ("Shamans")
					U.religious_clergy = "Shamans"
					to_chat(U, "<big>你成为了[U.religion]的萨满!</big>")
					if (U.gender == "male")
						U.fully_replace_character_name(U.real_name,"Shaman [U.name]")
					else
						U.fully_replace_character_name(U.real_name,"Shamaness [U.name]")
					return

				if ("Priests")
					if (U.getStatCoeff("philosophy") < 1.75)
						to_chat(U, "<span class='danger'>你的哲学技能太低了. 你需要1.75或更高才能成为牧师.</span>")
						return
					else
						U.religious_clergy = "Priests"
						to_chat(U, "<big>你成为了[U.religion]的牧师!</big>")
						if (U.gender == "male")
							U.fully_replace_character_name(U.real_name,"Priest [U.name]")
						else
							U.fully_replace_character_name(U.real_name,"Priestess [U.name]")
						return

				if ("Monks")
					if (U.getStatCoeff("philosophy") < 1.5)
						to_chat(U, "<span class='danger'>你的哲学技能太低了. 你需要1.5或更高才能成为修士.</span>")
						return
					else
						U.religious_clergy = "Monks"
						to_chat(U, "<big>你成为了[U.religion]的修士!</big>")
						if (U.gender == "male")
							U.fully_replace_character_name(U.real_name,"Brother [U.name]")
						else
							U.fully_replace_character_name(U.real_name,"Sister [U.name]")
						return

				if ("Clerics")
					if (U.getStatCoeff("philosophy") < 2.2)
						to_chat(U, "<span class='danger'>你的哲学技能太低了. 你需要2.2或更高才能成为教士.</span>")
						return
					else
						U.religious_clergy = "Clerics"
						to_chat(U, "<big>你成为了[U.religion]的教士!</big>")
						if (U.gender == "male")
							U.fully_replace_character_name(U.real_name,"Venerable [U.name]")
						else
							U.fully_replace_character_name(U.real_name,"Venerable [U.name]")
						return

				if ("Cultists")
					U.religious_clergy = "Cultists"
					to_chat(U, "<big>你成为了[U.religion]的信徒!</big>")
	else
		to_chat(usr, SPAN_WARNING("You cannot join the clergy on this map."))
		return
/mob/living/human/proc/religion_check()
	for (var/obj/item/clothing/CT in contents)
		for (var/obj/item/clothing/accessory/armband/talisman/T in CT.contents)
			if (T.religion == "none" || religion == "none")
				return FALSE
			else
				return religion_type



/obj/item/weapon/book/holybook
	name = "圣书"
	icon_state = "holybook"
	title = "Holy Book"
	desc = "一本空白的书."
	var/religion = "none"
	var/religion_type = "none"
	flammable = TRUE
	unique = TRUE

/obj/item/weapon/book/holybook/examine(mob/user)
	return

/obj/item/weapon/book/holybook/New()
	..()
	spawn(10)
		if (religion != "none")
			name = "[title]"
			desc = "This is the [title], the holy book of the [religion] religion. Written by [author]."
			var/image/overc = image("icon" = icon, "icon_state" = "holybook_o1")
			overc.color = map.custom_religions[religion][6]
			overlays += overc
			var/image/overs = image("icon" = icon, "icon_state" = "holybook_[map.custom_religions[religion][4]]")
			overs.color = map.custom_religions[religion][5]
			overlays += overs
			update_icon()

/obj/item/weapon/book/holybook/attack_self(var/mob/living/human/user as mob)
	if (user.religion == religion && religion != "none")
		to_chat(user, "你凝视着你宗教的荣耀圣书.")
	else if (user.religion != religion && religion != "none" && !user.religious_leader && user.religious_clergy == FALSE)
		if (user.religion != "none")
			if (map.custom_religions[user.religion][7] == "Clerics")
				to_chat(user, ("You can't abandon a Clerical religion!"))
				return
		to_chat(user, "你开始阅读[title]...")
		if (do_after(user, 900, src))
			var/choice = WWinput(user, "After reading the [title], you feel attracted to the [religion] religion. Do you want to convert?", "[title]", "Yes", list("Yes","No"))
			if (choice == "No")
				return
			else if (choice == "Yes")
				user.religion = religion
				user.religious_leader = FALSE
				user.religion_type = religion_type
				user.religion_style = map.custom_religions[religion][7]
				to_chat(user, ("<big>You convert to the [religion] religion!</big>"))
				if (map.custom_religions[religion][7] == "Clerics")
					map.custom_religions[religion][3] += 15
				return



/obj/item/weapon/poster/religious
	name = "卷起的宗教海报"
	icon = 'icons/obj/library.dmi'
	icon_state = "poster_rolled"
	desc = "一张卷起的海报."
	var/religion = "none"
	var/symbol = "Cross"
	var/color1 = "#000000"
	var/color2 = "#FFFFFF"
	flammable = TRUE
	force = 0

/obj/item/weapon/poster/religious/New()
	..()
	spawn(10)
		if (religion != "none")
			name = "rolled [religion]'s poster"
			desc = "This is a rolled [religion] religion propaganda poster. Ready to deploy."

/obj/structure/poster/religious
	name = "宗教海报"
	icon = 'icons/obj/library.dmi'
	icon_state = "poster_base"
	desc = "一张空白海报."
	var/religion = "none"
	var/symbol = "Cross"
	var/color1 = "#000000"
	var/color2 = "#FFFFFF"
	flammable = TRUE
	layer = 3.2

/obj/structure/poster/religious/New()
	..()
	invisibility = 101
	spawn(10)
		if (religion != "none")
			name = "[religion]'s poster"
			desc = "This is a [religion] religion propaganda poster."
			var/image/overc = image("icon" = icon, "icon_state" = "poster_base_o1")
			overc.color = map.custom_religions[religion][6]
			overlays += overc
			var/image/overc1 = image("icon" = icon, "icon_state" = "poster_base_o2")
			overc1.color = map.custom_religions[religion][5]
			overlays += overc1
			var/image/overs = image("icon" = icon, "icon_state" = "holybook_[map.custom_religions[religion][4]]")
			overs.color = map.custom_religions[religion][5]
			overlays += overs
		transform = matrixangle(rand(-9,9))
		update_icon()
		invisibility = 0

/obj/structure/poster/religious/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (W.sharp)
		user.visible_message("<span class ='danger'>[user]开始撕下\the [src]!</span>", "<span class ='danger'>你开始撕下\the [src]!</span>")
		if (do_after(user, 70, src))
			user.visible_message("<span class ='warning'>[user]撕下了\the [src]!</span>", "<span class = 'warning'>你撕下了\the [src]!</span>")
			overlays.Cut()
			icon_state = "poster_ripped"
			color = color2
			update_icon()
	else
		..()

obj/structure/altar
	name = "religious altar"
	icon = 'icons/obj/cross.dmi'
	icon_state = "wood_altar"
	desc = "A religious altar."
	var/religion = "none"
	var/symbol = "Cross"
	var/color1 = "#000000"
	var/color2 = "#FFFFFF"
	flammable = TRUE
	var/health = 70
	var/session = FALSE
/obj/structure/altar/New()
	..()
	invisibility = 101
	spawn(10)
		if (religion != "none")
			name = "[religion]'s altar"
			desc = "This is a altar dedicated to the [religion] religion."
			var/image/overc = image("icon" = icon, "icon_state" = "thin_banner_1")
			overc.color = map.custom_religions[religion][6]
			overlays += overc
			var/image/overc1 = image("icon" = icon, "icon_state" = "thin_banner_2")
			overc1.color = map.custom_religions[religion][5]
			overlays += overc1
			var/image/overs = image("icon" = icon, "icon_state" = "holybook_[map.custom_religions[religion][4]]")
			overs.color = map.custom_religions[religion][5]
			overlays += overs
		update_icon()
		invisibility = 0

/obj/structure/altar/attackby(obj/item/W as obj, mob/living/human/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if (user.a_intent == I_HELP && user.religion == religion && user.religious_clergy == "Cultists")
		if (istype(W, /obj/item/clothing/accessory/armband/talisman))
			var/obj/item/clothing/accessory/armband/talisman/T = W
			if (T.religion != religion)
				to_chat(user, "你开始以你宗教[religion]的名义摧毁\the [W]...")
				if (do_after(user, 100, src))
					to_chat(user, "你摧毁了\the [W]!")
					map.custom_religions[religion][3] += 3
					qdel(W)
					return
		else if (istype(W, /obj/item/weapon/book/holybook))
			var/obj/item/weapon/book/holybook/T = W
			if (T.religion != religion)
				to_chat(user, "你开始以你宗教[religion]的名义摧毁\the [W]...")
				if (do_after(user, 100, src))
					to_chat(user, "你摧毁了\the [W]!")
					map.custom_religions[religion][3] += 10
					qdel(W)
					return
		return
	switch(W.damtype)
		if ("fire")
			if (flammable)
				health -= W.force * TRUE
			else
				health -= W.force * 0.20
		else
			health -= W.force * 0.20
	playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
	user.do_attack_animation(src)
	try_destroy()
	..()

/obj/structure/altar/proc/try_destroy()
	if (health <= 0)
		visible_message(SPAN_WARNING("[src] is broken into pieces!"))
		qdel(src)
		return


obj/structure/altar/attack_hand(mob/living/human/H as mob)
	if (H.religion == religion && (H.religious_clergy == "Priests" || H.religious_leader) && H.religion_style == "Priests")
		var/choice = WWinput(H, "What action do you want to perform?", "[religion]'s Altar", "Cancel", list("Cancel", "Worshipping Session", "Conversion"))
		switch(choice)
			if ("Cancel")
				return
			if ("Worshipping Session")
				if (!session)
					session = TRUE
					visible_message("[H]开始举行[religion]宗教的礼拜仪式...")
					var/list/currlist = list()
					for (var/mob/living/human/A in range(3, loc))
						if (A.stat == 0 && A != H && A.religion == religion)
							currlist += A
					if (do_after(H, 600, src))
						var/list/currlist2 = list()
						for (var/mob/living/human/AA in range(3, loc))
							if (AA.stat == 0 && (AA in currlist))
								currlist2 += AA
						map.custom_religions[religion][3] += currlist2.len*0.8
						visible_message("[H]结束了[religion]宗教的礼拜仪式.")
						session = FALSE
						return
					else
						session = FALSE
						return

			if ("Conversion")
				var/list/closemobs = list("Cancel")
				for (var/mob/living/human/M in range(2,loc))
					if (M.religion != religion && M.religious_clergy == FALSE && M.religion_style != "Clerics")
						closemobs += M
				var/choice3 = WWinput(H, "Who do you want to convert?", "[religion]'s Altar", "Cancel", closemobs)
				if (choice3 == "Cancel")
					return
				else
					var/mob/living/human/choice2 = choice3
					var/answer = WWinput(choice2, "[H] asks you to convert to his religion, [H.religion]. Will you accept?", null, "Yes", list("Yes","No"))
					if (answer == "Yes")
						to_chat(usr, ("[choice2] accepts your offer. They are worshipping [H.religion]."))
						to_chat(src, ("You accept [H]'s offer. You are now worshipping [H.religion]."))
						choice2.religion = H.religion
						choice2.religious_leader = FALSE
						choice2.religion_type = H.religion_type
						choice2.religion_style = H.religion_style
						return
					else if (answer == "No")
						to_chat(usr, ("[closemobs] has rejected your offer."))
						return
					else
						return
	else
		..()

/* Religious Structures*/ //(not counting monuments)
/* Wood Altars*/ //and wood-like

obj/structure/altar/wood
	name = "wood altar"
	icon_state = "wood_altar"
	flammable = TRUE
	health = 70

obj/structure/altar/bamboo
	name = "bamboo altar"
	icon_state = "bamboo_altar"
	flammable = TRUE
	health = 70

/* Stone Altars*/

obj/structure/altar/stone
	name = "stone altar"
	icon_state = "stone_altar"
	flammable = FALSE
	health = 160

obj/structure/altar/stone/material/obsidian
	name = "obsidian altar"
	icon_state = "obsidian_altar"
	flammable = FALSE
	health = 160

obj/structure/altar/darkstone
	name = "darkstone altar"
	icon_state = "blood_altar"
	flammable = FALSE
	health = 160

obj/structure/altar/sandstone
	name = "sandstone altar"
	icon_state = "sandstone_altar"
	flammable = FALSE
	health = 160

obj/structure/altar/marble
	name = "marble altar"
	icon_state = "marble_altar"
	flammable = FALSE
	health = 110

/* Metal Altars*/

obj/structure/altar/iron
	name = "iron altar"
	icon_state = "iron_altar"
	flammable = FALSE
	health = 120

/* Religious Banners*/

/obj/structure/banner/religious
	name = "宗教旗帜"
	icon = 'icons/obj/cross.dmi'
	icon_state = "wall_banner"
	desc = "一面白色旗帜."
	var/religion = "none"
	var/symbol = "Cross"
	var/color1 = "#000000"
	var/color2 = "#FFFFFF"
	flammable = TRUE
	layer = 3.21

/obj/structure/banner/religious/New()
	..()
	invisibility = 101
	spawn(10)
		if (religion != "none")
			name = "[religion]'s banner"
			desc = "This is a [religion] religion banner."
			var/image/overc = image("icon" = icon, "icon_state" = "wall_banner_1")
			overc.color = map.custom_religions[religion][6]
			overlays += overc
			var/image/overc1 = image("icon" = icon, "icon_state" = "wall_banner_2")
			overc1.color = map.custom_religions[religion][5]
			overlays += overc1
			var/image/overs = image("icon" = icon, "icon_state" = "banner_[map.custom_religions[religion][4]]")
			overs.color = map.custom_religions[religion][5]
			overlays += overs
		update_icon()
		invisibility = 0

/obj/structure/banner/religious/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (W.sharp)
		user.visible_message("<span class ='danger'>[user]开始撕下\the [src]!</span>", "<span class ='danger'>你开始撕下\the [src]!</span>")
		if (do_after(user, 130, src))
			user.visible_message("<span class ='warning'>[user]撕下了\the [src]!</span>", "<span class = 'warning'>你撕下了\the [src]!</span>")
			qdel(src)
	else
		..()

/mob/proc/religion_list()
	set name = "Check Religion List"
	set category = "Faction"
	if (map && map.civilizations)

		var/body = "<html><head><title>Religion List</title></head>[common_browser_style]<b>RELIGION LIST</b><br><br>"
		for (var/rel in map.custom_religions)
			body += "<b>[rel]</b>: [map.custom_religions[rel][3]] points.</br>"
		body += {"<br>
			</body></html>
		"}

		usr << browse(body,"window=artillery_window;border=1;can_close=1;can_resize=1;can_minimize=0;titlebar=1;size=250x450")
	else
		return
