/obj/structure/noticeboard
	name = "公告板"
	desc = "一块用于钉重要通知的板子."
	icon = 'icons/obj/structures.dmi'
	icon_state = "nboard00"
	density = FALSE
	anchored = TRUE
	var/notices = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	map_storage_saved_vars = "density;icon_state;dir;name;pixel_x;pixel_y;notices"
	
/obj/structure/noticeboard/initialize()
	for (var/obj/item/I in loc)
		if (notices > 4) break
		if (istype(I, /obj/item/weapon/paper))
			I.loc = src
			notices++
	icon_state = "nboard0[notices]"

//attaching papers!!
/obj/structure/noticeboard/attackby(var/obj/item/weapon/O as obj, var/mob/user as mob)
	if (istype(O, /obj/item/weapon/paper))
		if (notices < 5)
			O.add_fingerprint(user)
			add_fingerprint(user)
			user.drop_from_inventory(O)
			O.loc = src
			notices++
			icon_state = "nboard0[notices]"	//update sprite
			to_chat(user, "<span class='notice'>你把纸钉在了公告板上.</span>")
		else
			to_chat(user, "<span class='notice'>你伸手想把纸钉在板上,却犹豫了. 你确信你的纸不会在已经钉在上面的众多纸张中被看到.</span>")
	else
		..()
/obj/structure/noticeboard/attack_hand(var/mob/user)
	examine(user)

// Since Topic() never seems to interact with usr on more than a superficial
// level, it should be fine to let anyone mess with the board other than ghosts.
/obj/structure/noticeboard/examine(var/mob/user)
	if (!user)
		user = usr
	if (user.Adjacent(src))
		var/dat = "<b>Noticeboard</b><BR>"
		for (var/obj/item/weapon/paper/P in src)
			dat += "<A href='?src=\ref[src];read=\ref[P]'>[P.name]</A> <A href='?src=\ref[src];write=\ref[P]'>Write</A> <A href='?src=\ref[src];remove=\ref[P]'>Remove</A><BR>"
		user << browse("<HEAD><TITLE>Notices</TITLE></HEAD>[dat]","window=noticeboard")
		onclose(user, "noticeboard")
	else
		..()

/obj/structure/noticeboard/Topic(href, href_list)
	..()
	usr.set_using_object(src)
	if (href_list["remove"])
		if ((usr.stat || usr.restrained()))	//For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["remove"])
		if (P && P.loc == src)
			P.loc = get_turf(src)	//dump paper on the floor because you're a clumsy fuck
			P.add_fingerprint(usr)
			add_fingerprint(usr)
			notices--
			icon_state = "nboard0[notices]"
	if (href_list["write"])
		if ((usr.stat || usr.restrained())) //For when a player is handcuffed while they have the notice window open
			return
		var/obj/item/P = locate(href_list["write"])
		if ((P && P.loc == src)) //ifthe paper's on the board
			if (istype(usr.r_hand, /obj/item/weapon/pen)) //and you're holding a pen
				add_fingerprint(usr)
				P.attackby(usr.r_hand, usr) //then do ittttt
			else
				if (istype(usr.l_hand, /obj/item/weapon/pen)) //check other hand for pen
					add_fingerprint(usr)
					P.attackby(usr.l_hand, usr)
				else
					to_chat(usr, "<span class='notice'>你需要有能写字的东西!</span>")
	if (href_list["read"])
		var/obj/item/weapon/paper/P = locate(href_list["read"])
		if ((P && P.loc == src))
			usr << browse("<HTML><HEAD><TITLE>[P.name]</TITLE></HEAD><BODY><TT>[P.info]</TT></BODY></HTML>", "window=[P.name]")
			onclose(usr, "[P.name]")
	return
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////MAIL//SYSTEM/////////////////////////////////
/obj/structure/mailbox
	name = "邮袋"
	desc = "一袋邮件,将分发到其他殖民地行政机构."
	icon = 'icons/obj/storage.dmi'
	icon_state = "mailbag"
	density = FALSE
	anchored = TRUE
	var/faction = FALSE
	var/receive_only = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
/obj/structure/mailbox/processor
	invisibility = 101

/obj/structure/mailbox/received
	name = "收件邮袋"
	desc = "一袋邮件,装有来自其他殖民地的收件."
	icon = 'icons/obj/storage.dmi'
	icon_state = "mailbag"
	density = FALSE
	anchored = TRUE
	receive_only = TRUE

/obj/structure/mailbox/spanish
	name = "西班牙邮袋"
	desc = "一袋邮件,将投递到西班牙殖民地行政机构."
	faction = "spanish"

/obj/structure/mailbox/dutch
	name = "荷兰邮袋"
	desc = "一袋邮件,将投递到荷兰殖民地行政机构."
	faction = "dutch"

/obj/structure/mailbox/portuguese
	name = "葡萄牙邮袋"
	desc = "一袋邮件,将投递到荷兰殖民地行政机构."
	faction = "portuguese"

/obj/structure/mailbox/french
	name = "法国邮袋"
	desc = "一袋邮件,将投递到法国殖民地行政机构."
	faction = "french"

/obj/structure/mailbox/british
	name = "英国邮袋"
	desc = "一袋邮件,将投递到英国殖民地行政机构."
	faction = "british"

/obj/structure/mailbox/attackby(var/obj/item/weapon/paper/W as obj, var/mob/living/human/H as mob)
	if (receive_only == TRUE)
		to_chat(H, "这里只用于收到的信件! 如果你把它放在这里,它不会被投递!")
		return
	else
		if (istype(W, /obj/item/weapon/paper))
			for (var/obj/structure/mailbox/received/B)
				if (B.faction == faction)
					var/obj/item/weapon/paper/NP = new/obj/item/weapon/paper(B.loc)

					if(W.info)
						NP.info = W.info
					if(W.name)
						NP.name = W.name
					if(W.stamps)
						NP.stamps = W.stamps
					if(W.fields)
						NP.fields = W.fields
					if(W.stamped)
						NP.stamped = W.stamped
					if(W.ico)
						NP.ico = W.ico
					qdel(W)
					to_chat(H, "你的信息已发送,很快就会投递.")
			return
		else
			to_chat(H, "你不能通过邮件发送这个. 只接受纸张.")
			return