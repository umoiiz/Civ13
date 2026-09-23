/obj/structure/closet/coffin
	name = "棺材"
	desc = "这是为逝去的亲人准备的安葬容器."
	icon_state = "coffin"
	icon_closed = "coffin"
	icon_opened = "coffin_open"
	throwpass = TRUE
	health = 300

/obj/structure/closet/coffin/anchored
	anchored = TRUE

/obj/structure/closet/coffin/update_icon()
	if (!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/coffin/generic
	icon_state = "coffin_blank"
	icon_closed = "coffin_blank"
/obj/structure/closet/coffin/generic/anchored
	anchored = TRUE

/obj/structure/closet/coffin/sarcophagus
	name = "青铜石棺"
	desc = "这是为埃及皇室准备的安葬容器."
	icon_state = "bronze_sarcophagus_closed"
	icon_closed = "bronze_sarcophagus_closed"
	icon_opened = "sarcophagus_open"
	throwpass = TRUE
	health = 1100

/obj/structure/closet/coffin/sarcophagus/anchored
	anchored = TRUE

/obj/structure/closet/coffin/sarcophagus/gold
	name = "黄金石棺"
	desc = "这是为埃及皇室准备的安葬容器."
	icon_state = "gold_sarcophagus_closed"
	icon_closed = "gold_sarcophagus_closed"
	icon_opened = "sarcophagus_open"
	throwpass = TRUE
	health = 700

/obj/structure/closet/old_coffin
	name = "旧棺材"
	desc = "这是为某些老骨头准备的安葬容器."
	icon_state = "sealed_coffin"
	icon_closed = "sealed_coffin"
	icon_opened = "sealed_coffin_open"
	throwpass = TRUE
	health = 300

/obj/structure/closet/old_coffin/attack_hand(mob/user as mob)
	add_fingerprint(user)
	if (!opened)
		to_chat(user, "<span class='notice'>\The [src]是一块又大又重的石头...你没法徒手搬动它</span>")
		return
	else
		toggle(user)

/obj/structure/closet/old_coffin/attackby(obj/item/weapon/W as obj, mob/user as mob)
	add_fingerprint(usr)
	if (opened)
		if (istype(W, /obj/item/weapon/grab))
			var/obj/item/weapon/grab/G = W
			MouseDrop_T(G.affecting, user)	  //act like they were dragged onto the closet
			return FALSE
		if (W.loc != user) // This should stop mounted modules ending up outside the module.
			return
		usr.drop_item()
		if (W)
			if (istype(src, /obj/structure/closet/crate/dumpster))
				var/content_size = FALSE
				for (var/obj/item/I in contents)
					content_size += ceil(I.w_class/2)
				if (content_size < storage_capacity)
					W.forceMove(src)
					to_chat(user, "你把\the [W]扔进了\the [src].")
					update_icon()
					return
				else
					to_chat(user, "<span class='warning'>\The [src]已经满了!</span>")
					return
			else
				W.forceMove(loc)
	else
		if (istype(W, /obj/item/weapon/material/tes13) || istype(W, /obj/item/weapon/material/hatchet/battleaxe/tes13) || istype(W, /obj/item/weapon/material/sword/tes13))
			toggle(user)
	return
/obj/structure/closet/old_coffin/update_icon()
	if (!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened