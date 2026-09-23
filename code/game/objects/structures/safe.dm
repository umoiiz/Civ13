/*
CONTAINS:
SAFES
FLOOR SAFES
*/

//SAFES
/obj/structure/safe
	name = "保险箱"
	desc = "一块巨大的金属块,上面嵌有一个转盘.转盘上的小字写着\"斯卡伯勒军械 - 2簧片保险柜,保证防铝热剂,防爆炸,防助理.\""
	icon = 'icons/obj/structures.dmi'
	icon_state = "safe"
	anchored = TRUE
	density = TRUE
	var/open = FALSE		//is the safe open?
	var/tumbler_1_pos	//the tumbler position- from FALSE to 72
	var/tumbler_1_open	//the tumbler position to open at- 0 to 72
	var/tumbler_2_pos
	var/tumbler_2_open
	var/dial = FALSE		//where is the dial pointing?
	var/space = FALSE		//the combined w_class of everything in the safe
	var/maxspace = 24	//the maximum combined w_class of stuff in the safe
	not_movable = FALSE
	not_disassemblable = TRUE

/obj/structure/safe/New()
	tumbler_1_pos = rand(0, 72)
	tumbler_1_open = rand(0, 72)

	tumbler_2_pos = rand(0, 72)
	tumbler_2_open = rand(0, 72)


/obj/structure/safe/initialize()
	for (var/obj/item/I in loc)
		if (space >= maxspace)
			return
		if (I.w_class + space <= maxspace)
			space += I.w_class
			I.loc = src


/obj/structure/safe/proc/check_unlocked(mob/user as mob, canhear)
	if (user && canhear)
		if (tumbler_1_pos == tumbler_1_open)
			to_chat(user, "<span class='notice'>你听到来自[src]的[pick("tonk", "krunk", "plunk")].</span>")
		if (tumbler_2_pos == tumbler_2_open)
			to_chat(user, "<span class='notice'>你听到来自[src]的[pick("tink", "krink", "plink")].</span>")
	if (tumbler_1_pos == tumbler_1_open && tumbler_2_pos == tumbler_2_open)
		if (user) visible_message("<b>[pick("Spring", "Sprang", "Sproing", "Clunk", "Krunk")]!</b>")
		return TRUE
	return FALSE


/obj/structure/safe/proc/decrement(num)
	num -= 1
	if (num < 0)
		num = 71
	return num


/obj/structure/safe/proc/increment(num)
	num += 1
	if (num > 71)
		num = FALSE
	return num


/obj/structure/safe/update_icon()
	if (open)
		icon_state = "[initial(icon_state)]-open"
	else
		icon_state = initial(icon_state)


/obj/structure/safe/attack_hand(mob/user as mob)
	user.set_using_object(src)
	var/dat = "<center>"
	dat += "<a href='?src=\ref[src];open=1'>[open ? "Close" : "Open"] [src]</a> | <a href='?src=\ref[src];decrement=1'>-</a> [dial * 5] <a href='?src=\ref[src];increment=1'>+</a>"
	if (open)
		dat += "<table>"
		for (var/i = contents.len, i>=1, i--)
			var/obj/item/P = contents[i]
			dat += "<tr><td><a href='?src=\ref[src];retrieve=\ref[P]'>[P.name]</a></td></tr>"
		dat += "</table></center>"
	user << browse("<html><head><title>[name]</title></head><body>[dat]</body></html>", "window=safe;size=350x300")


/obj/structure/safe/Topic(href, href_list)
	if (!ishuman(usr))	return
	var/mob/living/human/user = usr

	var/canhear = FALSE

	/*if (istype(user.l_hand, /obj/item/clothing/accessory/stethoscope) || istype(user.r_hand, /obj/item/clothing/accessory/stethoscope))
		canhear = TRUE*/

	if (href_list["open"])
		if (check_unlocked())
			to_chat(user, "<span class='notice'>你[open ? "close" : "open"][src].</span>")
			open = !open
			update_icon()
			updateUsrDialog()
			return
		else
			to_chat(user, "<span class='notice'>你无法[open ? "close" : "open"][src],锁已锁上!</span>")
			return

	if (href_list["decrement"])
		dial = decrement(dial)
		if (dial == tumbler_1_pos + 1 || dial == tumbler_1_pos - 71)
			tumbler_1_pos = decrement(tumbler_1_pos)
			if (canhear)
				to_chat(user, "<span class='notice'>你听到来自[src]的[pick("clack", "scrape", "clank")].</span>")
			if (tumbler_1_pos == tumbler_2_pos + 37 || tumbler_1_pos == tumbler_2_pos - 35)
				tumbler_2_pos = decrement(tumbler_2_pos)
				if (canhear)
					to_chat(user, "<span class='notice'>你听到来自[src]的[pick("click", "chink", "clink")].</span>")
			check_unlocked(user, canhear)
		updateUsrDialog()
		return

	if (href_list["increment"])
		dial = increment(dial)
		if (dial == tumbler_1_pos - 1 || dial == tumbler_1_pos + 71)
			tumbler_1_pos = increment(tumbler_1_pos)
			if (canhear)
				to_chat(user, "<span class='notice'>你听到来自[src]的[pick("clack", "scrape", "clank")].</span>")
			if (tumbler_1_pos == tumbler_2_pos - 37 || tumbler_1_pos == tumbler_2_pos + 35)
				tumbler_2_pos = increment(tumbler_2_pos)
				if (canhear)
					to_chat(user, "<span class='notice'>你听到来自[src]的[pick("click", "chink", "clink")].</span>")
			check_unlocked(user, canhear)
		updateUsrDialog()
		return

	if (href_list["retrieve"])
		user << browse("", "window=safe") // Close the menu)

		var/obj/item/P = locate(href_list["retrieve"]) in src
		if (open)
			if (P && in_range(src, user))
				user.put_in_hands(P)
				updateUsrDialog()


/obj/structure/safe/attackby(obj/item/I as obj, mob/user as mob)
	if (open)
		if (I.w_class + space <= maxspace)
			space += I.w_class
			user.drop_item()
			I.loc = src
			to_chat(user, "<span class='notice'>你把[I]放进[src].</span>")
			updateUsrDialog()
			return
		else
			to_chat(user, "<span class='notice'>[I]放不进[src].</span>")
			return
/*	else
		if (istype(I, /obj/item/clothing/accessory/stethoscope))
			to_chat(user, "Hold [I] in one of your hands while you manipulate the dial.")
			return*/


obj/structure/safe/ex_act(severity)
	return

//FLOOR SAFES
/obj/structure/safe/floor
	name = "地板保险柜"
	icon_state = "floorsafe"
	density = FALSE
	level = TRUE	//underfloor
	layer = 2.5

/obj/structure/safe/floor/initialize()
	..()
	var/turf/T = loc
	if (istype(T) && !T.is_plating())
		hide(1)
	update_icon()

/obj/structure/safe/floor/hide()
	invisibility = 101

/obj/structure/safe/floor/hides_under_flooring()
	return TRUE
