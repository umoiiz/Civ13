
/////////////////////////////TELEPHONE/////////////////////////////////////
/obj/item/weapon/telephone
	name = "电话"
	desc = "用于与其他电话通信. 无号码."
	icon = 'icons/obj/device.dmi'
	icon_state = "telephone"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = WEAPON_FORCE_WEAK+3
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_LARGE
	var/phonenumber = 0
	var/ringing = FALSE
	var/ringingnum = FALSE
	var/obj/item/weapon/telephone/origincall = null
	var/connected = FALSE

	var/wireless = FALSE
	var/maxrange = 0
	var/list/contacts = list()

/obj/item/weapon/telephone/public
	name = "电话亭"
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "phonebooth_interior"
	anchored = TRUE
	wireless = TRUE
	var/image/dooroverlay
	var/open = TRUE
	var/opening = FALSE
	var/closing = FALSE
	New()
		..()
		dooroverlay = image(icon=src.icon, icon_state="boothdoor_open", layer=8)
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		if (opening)
			dooroverlay.icon_state = "phonebooth_opening"
			opening = FALSE
		else if (closing)
			dooroverlay.icon_state = "phonebooth_closing"
			closing = FALSE
		else if (open)
			dooroverlay.icon_state = "boothdoor_open"
		else
			dooroverlay.icon_state = "boothdoor_closed"
		overlays += dooroverlay
/obj/item/weapon/telephone/public/verb/open()
	set category = null
	set name = "Toggle Open"
	set desc = "Open/Close the Booth."

	set src in view(1)
	if (!ishuman(usr))
		return
	open = !open
	if (open)
		closing = TRUE
		opening = FALSE
		playsound(loc, 'sound/machines/door_open.ogg', 100, TRUE)
		dooroverlay.icon_state = "phonebooth_opening"
	else
		closing = FALSE
		opening = TRUE
		playsound(loc, 'sound/machines/door_close.ogg', 100, TRUE)
		dooroverlay.icon_state = "phonebooth_closing"
	spawn(10)
		closing = FALSE
		opening = FALSE
		update_icon()
/obj/item/weapon/telephone/verb/name_telephone()
	set category = null
	set name = "Name"
	set desc = "Name this telephone."

	set src in view(1)
	if (!ishuman(usr))
		return
	if (istype(src, /obj/item/weapon/telephone/public))
		return
	var/yn = input(usr, "Name this telephone?") in list("Yes", "No")
	if (yn == "Yes")
		var/_name = input(usr, "What name?") as text
		name = sanitize(_name, 20)
	return

var/list/global/phone_numbers = list()
/obj/item/weapon/telephone/New()
	..()
	if (phonenumber == 0)
		new_phonenumber()

/obj/item/weapon/telephone/proc/new_phonenumber()
	var/tempnum = 0
	tempnum = rand(1000,9999)
	if (tempnum in phone_numbers)
		new_phonenumber()
		return
	else
		phonenumber = tempnum
		phone_numbers += tempnum
		desc = "Used to communicate with other telephones. Number: [phonenumber]."
		return

/obj/item/weapon/telephone/proc/ringproc(var/origin,var/obj/item/weapon/telephone/ocall)
	ringing = TRUE
	ringingnum = origin
	origincall = ocall
	spawn(0)
		if (ringing)
			ring(origin)
	spawn(40)
		if (ringing)
			ring(origin)
	spawn(80)
		if (ringing)
			ring(origin)
	spawn(120)
		if (ringing)
			ring(origin)
	spawn(160)
		if (ringing)
			ring(origin)
	spawn(200)
		ringing = FALSE
		ringingnum = FALSE
		if (!connected)
			origincall = null
	return
/obj/item/weapon/telephone/proc/ring(var/origin = null)
	var/orname = "Unknown"
	if (origin)
		for(var/list/L in contacts)
			if (L[2] == origin)
				orname = L[1]
	if (ringing)
		playsound(loc, 'sound/machines/telephone.ogg', 65)
		if (!origin)
			visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>正在响铃!")
		else
			visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>来电: <b>[orname]</b> ([origin])")
	else
		return

/obj/item/weapon/telephone/proc/broadcast(var/msg, var/mob/living/human/speaker, var/verbage = "says")

	// ignore emotes.
	if (dd_hasprefix(msg, "*"))
		return

	var/list/tried_mobs = list()

	for (var/mob/living/human/hearer in human_mob_list)
		if (tried_mobs.Find(hearer))
			continue
		tried_mobs += hearer
		if (hearer.stat == CONSCIOUS)
			for (var/obj/item/weapon/telephone/phone in view(7, hearer))
				if (src == phone.origincall || src == phone)
					hearer.hear_phone(msg, verbage, speaker.default_language, speaker, src, phone)

/obj/item/weapon/telephone/attack_self(var/mob/user as mob)
	if (!connected && !ringing)
		var/input = input(user, "Choose the number to call: (4 digits, no decimals)") as num
		if (!input)
			return
		var/tgtnum = 0
		if (input != 911)
			tgtnum = sanitize_integer(input, min=1000, max=9999, default=0) //0 as a first digit doesnt really work
		else
			tgtnum = 911
		if (tgtnum == 0)
			return
		if (!wireless)
			for (var/obj/structure/phoneline/PL in range(2,loc))
				PL.ring_phone(tgtnum,phonenumber, src)
				ringing = TRUE
				visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>正在响铃 [tgtnum]...")
				spawn(200)
					if (!connected)
						ringing = FALSE
						visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>在 [tgtnum] 无人接听电话.")
						return
		else
			var/found_tower = TRUE
//			for (var/obj/structure/cell_tower/CT in range(maxrange,loc))
//				found_tower = TRUE
			if (found_tower)
				ring_phone(tgtnum,phonenumber, src, user)
				spawn(200)
					if (!connected)
						to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>在 [tgtnum] 无人接听电话.")
						connected = FALSE
						origincall = null
						return
			else
				to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>无信号。")
				return
	else if (connected)
		connected = FALSE
		if (origincall)
			to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>你挂断了电话。")
			if (ishuman(origincall.loc))
				to_chat(origincall.loc, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人挂断了电话。")
			else
				origincall.visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人挂断了电话。")
			origincall.connected = FALSE
			origincall.origincall = null
			origincall = null
	else if (ringing && !ringingnum)
		to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>你挂断了电话。")
		ringing = FALSE
		if (origincall)
			if (ishuman(origincall.loc))
				to_chat(origincall.loc, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人挂断了电话。")
			else
				origincall.visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人挂断了电话。")
			origincall.origincall = null
			origincall.connected = FALSE
			origincall = null
	else if (ringing && ringingnum)
		ringing = FALSE
		connected = ringingnum
		if (origincall)
			origincall.connected = phonenumber
			origincall.ringing = FALSE
			origincall.origincall = src
			to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>你接起了电话。")
			if (ishuman(origincall.loc))
				to_chat(origincall.loc, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人接起了电话。")
			else
				origincall.visible_message("<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>有人接起了电话。")

/obj/item/weapon/telephone/attack_hand(var/mob/living/human/H)
	if (anchored && ishuman(H))
		attack_self(H)
		return
	else
		..()
/////////////////////////////MOBILE PHONE/////////////////////////////////////
/obj/item/weapon/telephone/mobile
	name = "手机"
	desc = "用于与其他电话通讯。无号码。"
	icon = 'icons/obj/device.dmi'
	icon_state = "cellphone"
	force = WEAPON_FORCE_WEAK+3
	throwforce = WEAPON_FORCE_WEAK
	wireless = TRUE
	maxrange = 40
	w_class = ITEM_SIZE_SMALL
	New()
		..()
		spawn(10)
		if (map && map.ID == MAP_THE_ART_OF_THE_DEAL)
			update_icon()
	update_icon()
		if (map && map.ID == MAP_THE_ART_OF_THE_DEAL)
			icon_state = "celly"
/obj/item/weapon/telephone/mobile/attack_self(var/mob/user as mob)
	if (!connected && !ringing)
		var/choice1 = WWinput(user, "What do you want to do?", "Mobile Phone", "Cancel", list("Call Number", "Call Contact", "Add Contact"))
		if (choice1 == "Cancel")
			return
		else if (choice1 == "Call Number")
			..()
		else if (choice1 == "Add Contact")
			var/input1 = input(user, "Choose the number to add: (4 digits, no decimals)") as num
			if (!input1)
				return
			if (input1 == phonenumber)
				to_chat(user, "<span class='notice'>你不能添加自己的号码!</span>")
				return
			var/addnum = 0
			addnum = sanitize_integer(input1, min=1000, max=9999, default=0) //0 as a first digit doesnt really work
			if (addnum == 0)
				return
			var/input2 = input(user, "Choose the name to assign to this number: (up to 15 characters)") as text
			if (!input2 || input2 == "")
				return
			input2 = sanitize(input2, 15)
			contacts += list(list(input2,input1))
		else if (choice1 == "Call Contact")
			var/list/clist = list("Cancel")
			for (var/list/i in contacts)
				clist += list(i[1])
			var/choice2 = WWinput(user, "Which contact do you want to call?", "Mobile Phone", "Cancel", clist)
			if (choice2 == "Cancel")
				return
			else
				var/callnum = 0
				for(var/list/j in contacts)
					if (j[1] == choice2)
						callnum = j[2]
				if (!callnum)
					return
				var/tgtnum = callnum
				var/found_tower = TRUE
//				for (var/obj/structure/cell_tower/CT in range(maxrange,loc))
//					found_tower = TRUE
				if (found_tower)
					ring_phone(tgtnum,phonenumber, src, user)
					spawn(200)
						if (!connected)
							to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>在[tgtnum]无人接听电话。")
							ringing = FALSE
							return
				else
					to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(src)] [src]:</b> </font>无信号。")
					return
	else
		..()
/////////////////////////////CELLPHONE TOWER/////////////////////////////////////
/obj/structure/cell_tower
	name = "信号塔"
	desc = "用于中继移动通讯的钢塔。"
	icon = 'icons/obj/obj32x64.dmi'
	icon_state = "radio_powered"
	flammable = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	var/maxrange = 40
	var/lastproc = 0
	anchored = TRUE

/proc/ring_phone(var/target, var/origin, var/obj/item/weapon/telephone/originphone, var/mob/living/human/user = null)
	var/targetc = ""
	if (originphone.contacts.len)
		for (var/list/L in originphone.contacts)
			if (L[2] == target)
				targetc = L[1]
				break
	if (!origin || !target)
		return
	else
		var/found = FALSE
		for (var/obj/item/weapon/telephone/TLG in world)
			found = TRUE
			if (TLG.phonenumber == target && TLG.phonenumber != origin)
				if (!TLG.ringing && !TLG.connected)
					TLG.ringing = TRUE
					originphone.ringing = TRUE
					TLG.ringproc(origin, originphone)
					if (user)
						if (targetc != "")
							to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(originphone)] [originphone]:</b> </font>正在响铃 <b>[targetc]</b> ([target])...")
						else
							to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(originphone)] [originphone]:</b> </font>正在响铃 [target]...")
				else
					to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(originphone)] [originphone]:</b> </font>号码占线。")
					return
		if (!found)
			to_chat(user, "<b><font size=2 color=#FFAE19>\icon[getFlatIcon(originphone)] [originphone]:</b> </font>未找到号码。")
/obj/item/weapon/telephone/wireless
	name = "电话"
	desc = "用于与其他电话通讯。无号码。"
	icon_state = "telephone"
	connected = TRUE
	wireless = TRUE
	maxrange = 40

/obj/item/weapon/telephone/mobile/police
	name = "911终端"
	desc = "紧急呼叫将在此处接收。"
	icon = 'icons/obj/device.dmi'
	icon_state = "police_intercom"
	phonenumber = 911
	anchored = TRUE
	New()
		..()
		phone_numbers += phonenumber
	update_icon()
		if (map && map.ID == MAP_THE_ART_OF_THE_DEAL)
			icon_state = "police_intercom"
/obj/item/weapon/telephone/mobile/faction
	name = "电话"
	icon_state = "telephone"
	anchored = TRUE
	New()
		..()
		phone_numbers += phonenumber
		update_icon()
		spawn(100)
			for (var/obj/item/weapon/telephone/mobile/faction/F in world)
				if (F != src)
					contacts += list(list(F.name,F.phonenumber))
			for (var/obj/item/weapon/telephone/mobile/mobilefaction/F in world)
				if (F != src)
					contacts += list(list(F.name,F.phonenumber))
	update_icon()
		icon_state = "telephone"
/obj/item/weapon/telephone/mobile/faction/red
	name = "红色电话"
	phonenumber = 1111
	desc = "用于与其他电话通讯。号码为1111。"
/obj/item/weapon/telephone/mobile/faction/blue
	name = "蓝色电话"
	phonenumber = 2222
	desc = "用于与其他电话通讯。号码为2222。"
	update_icon()
		icon_state = "telephone_blue"
/obj/item/weapon/telephone/mobile/faction/green
	name = "绿色电话"
	phonenumber = 3333
	desc = "用于与其他电话通讯。号码为3333。"
	update_icon()
		icon_state = "telephone_green"
/obj/item/weapon/telephone/mobile/faction/yellow
	name = "黄色电话"
	phonenumber = 4444
	desc = "用于与其他电话通讯。号码为4444。"
	update_icon()
		icon_state = "telephone_yellow"
/obj/item/weapon/telephone/mobile/faction/mckellen
	name = "麦克莱伦企业电话"
	phonenumber = 5555
	desc = "用于与其他电话通讯。号码为5555。"

/obj/item/weapon/telephone/mobile/faction/red/New()
	..()
	contacts += list(list("Emergency",911))

/obj/item/weapon/telephone/mobile/faction/blue/New()
	..()
	contacts += list(list("Emergency",911))

/obj/item/weapon/telephone/mobile/faction/green/New()
	..()
	contacts += list(list("Emergency",911))

/obj/item/weapon/telephone/mobile/faction/yellow/New()
	..()
	contacts += list(list("Emergency",911))

/obj/item/weapon/telephone/mobile/faction/mckellen/New()
	..()
	contacts += list(list("Emergency",911))


//ROBERTS CELLPHONES//
/obj/item/weapon/telephone/mobile/mobilefaction
	name = "企业手机"
	desc = "用于与其他电话通讯。"

/obj/item/weapon/telephone/mobile/mobilefaction/New()
	..()
	contacts += list(list("Emergency",911))
	spawn(100)
		for (var/obj/item/weapon/telephone/mobile/faction/F in world)
			if (F != src)
				contacts += list(list(F.name,F.phonenumber))
		for (var/obj/item/weapon/telephone/mobile/mobilefaction/F in world)
			if (F != src)
				contacts += list(list(F.name,F.phonenumber))
/obj/item/weapon/telephone/mobile/mobilefaction/blue
	name = "企业手机"
	desc = "用于与其他电话通讯,专供首席执行官使用。号码:2229。"
	phonenumber = 2229
	color = "#0000FF"

/obj/item/weapon/telephone/mobile/mobilefaction/green
	desc = "用于与其他电话通讯,专供首席执行官使用。号码:3339。"
	phonenumber = 3339
	color = "#00FF00"

/obj/item/weapon/telephone/mobile/mobilefaction/red
	desc = "用于与其他电话通讯,专供首席执行官使用。号码:1119。"
	phonenumber = 1119
	color = "#FF0000"

/obj/item/weapon/telephone/mobile/mobilefaction/yellow
	desc = "用于与其他电话通讯,专供首席执行官使用。号码:4449。"
	phonenumber = 4449
	color = "#FFFF00"

/obj/item/weapon/telephone/mobile/mobilefaction/mckellen
	desc = "用于与其他电话通讯,专供首席执行官使用。号码:5559。"
	phonenumber = 5559
	color = "#FF7A00"