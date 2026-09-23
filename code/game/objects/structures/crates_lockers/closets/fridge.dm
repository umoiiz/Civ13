
/obj/structure/closet/fridge
	name = "冰箱"
	icon_state = "fridge1"
	icon_closed = "fridge"
	icon_opened = "fridgeopen"
	storage_capacity = MOB_MEDIUM
	powerneeded = 5
	not_movable = FALSE
	anchored = TRUE
	health = 3000

/obj/structure/closet/fridge/update_icon()
	if (!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/fridge/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/wrench))
		if (powersource)
			to_chat(user, "<span class='notice'>先拆下电缆.</span>")
			return
		visible_message("<span class='warning'>[user]开始[anchored ? "unsecure" : "secure"] \the [src] [anchored ? "from" : "to"]地面.</span>")
		playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
		if (do_after(user,50,src))
			visible_message("<span class='warning'>[user] [anchored ? "unsecures" : "secures"] \the [src] [anchored ? "from" : "to"]地面.</span>")
			anchored = !anchored
			return
	if (istype(W, /obj/item/stack/cable_coil))
		if (powersource)
			to_chat(user, "这里已经连接了一根电缆!把它从[src]上再分开一些.")
			return
		var/obj/item/stack/cable_coil/CC = W
		powersource = CC.place_turf(get_turf(src), user, turn(get_dir(user,src),180))
		if (!powersource)
			return
		powersource.connections += src
		var/opdir1 = 0
		var/opdir2 = 0
		if (powersource.tiledir == "horizontal")
			opdir1 = 4
			opdir2 = 8
		else if  (powersource.tiledir == "vertical")
			opdir1 = 1
			opdir2 = 2
		powersource.update_icon()

		if (opdir1 != 0 && opdir2 != 0)
			for(var/obj/structure/cable/NCOO in get_turf(get_step(powersource,opdir1)))
				if ((NCOO.tiledir == powersource.tiledir) && NCOO != powersource)
					if (!(powersource in NCOO.connections) && !list_cmp(powersource.connections, NCOO.connections))
						NCOO.connections += powersource
					if (!(NCOO in powersource.connections) && !list_cmp(powersource.connections, NCOO.connections))
						powersource.connections += NCOO
					to_chat(user, "你连接了两根电缆.")

			for(var/obj/structure/cable/NCOC in get_turf(get_step(powersource,opdir2)))
				if ((NCOC.tiledir == powersource.tiledir) && NCOC != powersource)
					if (!(powersource in NCOC.connections) && !list_cmp(powersource.connections, NCOC.connections))
						NCOC.connections += powersource
					if (!(NCOC in powersource.connections) && !list_cmp(powersource.connections, NCOC.connections))
						powersource.connections += NCOC
		to_chat(user, "你把电缆连接到了[src]上.")
	else
		..()

/obj/structure/closet/fridge/icebox
	name = "冰柜"
	powerneeded = 0

/obj/structure/closet/fridge/icecreamcooler
	name = "冰淇淋冷藏箱"
	icon_state = "icecream_cooler1"
	icon_closed = "icecream_cooler"
	icon_opened = "icecream_cooler_open"
	powerneeded = 0

/obj/structure/closet/fridge/icecreamcooler/open()
	if (opened)
		return FALSE

	if (!can_open())
		return FALSE

	dump_contents()

	icon_state = icon_opened
	opened = TRUE
	playsound(loc, open_sound, 100, TRUE, -3)
	return TRUE