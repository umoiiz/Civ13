//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/obj/structure/closet/crate
	name = "板条箱"
	desc = "一个长方形的板条箱。"
	icon = 'icons/obj/storage.dmi'
	icon_state = "crate"
	icon_opened = "crateopen"
	icon_closed = "crate"
	climbable = TRUE
	mouse_drop_zone = TRUE
	var/rigged = FALSE
	var/storagecap = 10

// climbing crates - Kachnov
/obj/structure/closet/crate/MouseDrop_T(mob/target, mob/user)
	//if (!opened)
	var/mob/living/H = user
	if (istype(H) && target == user)
		do_climb(target)
	else
		return ..(target, user)
/*
	else
		return ..(target, user)
*/
/obj/structure/closet/crate/can_open()
	return TRUE

/obj/structure/closet/crate/can_close()
	return TRUE

/obj/structure/closet/crate/open()
	if (opened)
		return FALSE
	if (!can_open())
		return FALSE

	playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
	for (var/obj/O in src)
		O.forceMove(get_turf(src))
	icon_state = icon_opened
	opened = TRUE

	if (climbable)
		structure_shaken()
	return TRUE

/obj/structure/closet/crate/close()
	if (!opened)
		return FALSE
	if (!can_close())
		return FALSE

	playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
	var/itemcount = FALSE
	for (var/obj/O in get_turf(src))
		if (itemcount >= storagecap)
			break
		if (O.density || O.anchored)
			continue
		if (istype(O, /obj/structure))
			continue
		O.forceMove(src)
		itemcount++

	icon_state = icon_closed
	opened = FALSE
	return TRUE

/obj/structure/closet/crate/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		return TRUE
	return !density

/obj/structure/closet/crate/ex_act(severity)
	switch(severity)
		if (1.0)
			for (var/obj/O in contents)
				qdel(O)
			qdel(src)
			return
		if (2.0)
			for (var/obj/O in contents)
				if (prob(50))
					qdel(O)
			qdel(src)
			return
		if (3.0)
			if (prob(50))
				qdel(src)
			return
		else
	return

/obj/structure/closet/crate/footlocker
	name = "储物箱"
	desc = "一个小型金属储物箱。"
	icon_state = "footlocker"
	icon_opened = "footlockeropen"
	icon_closed = "footlocker"
	storagecap = 5
	density = FALSE
	health = 3000

/obj/structure/closet/crate/bin
	name = "大垃圾箱"
	desc = "一个大垃圾箱。"
	icon_state = "largebin"
	icon = 'icons/obj/crate.dmi'
	icon_opened = "largebinopen"
	icon_closed = "largebin"

/obj/structure/closet/crate/large
	name = "大板条箱"
	desc = "一个沉重的金属板条箱。"
	icon = 'icons/obj/storage.dmi'
	icon_state = "largemetal"
	icon_opened = "largemetalopen"
	icon_closed = "largemetal"
	health = 8000
/obj/structure/closet/crate/large/close()
	. = ..()
	if (.)//we can hold up to one large item
		for (var/obj/structure/S in loc)
			if (S == src)
				continue
			if (!S.anchored)
				S.forceMove(src)
				break
	return

/obj/structure/closet/crate/lead
	name = "铅制保险箱"
	desc = "一个大型铅制保险箱,适合存放放射性物品。"
	icon_state = "largermetal"
	icon_opened = "largermetal_open"
	icon_closed = "largermetal"
	health = 999999
	anchored = TRUE

/obj/structure/closet/crate/freezer
	name = "冰柜"
	desc = "一个冰柜。"
	icon_state = "freezer"
	icon_opened = "freezeropen"
	icon_closed = "freezer"

	//ROBERT'S CARTS//
/obj/structure/closet/crate/cart
	name = "推车"
	desc = " 一个大板条箱,适合运输大量物品"
	icon = 'icons/obj/carts.dmi'
	icon_state= "w_cart_o"
	icon_opened ="w_cart_o"
	icon_closed = "w_cart_c"
	//COPPER AGE WOODEN CART//
/obj/structure/closet/crate/cart/wooden
	name ="木制推车"
	desc = " 一辆木制推车,它又小又脆弱"
	icon_state= "w_cart_o"
	icon_opened ="w_cart_o"
	icon_closed = "w_cart_c"
	storagecap = 20
	//COPPER AGE WOODEN CART//
	//DARK AGE STONE CART//
/obj/structure/closet/crate/cart/stone
	name ="石制推车"
	desc = " 一辆石制推车,它很小,一些石制部件使它比木制推车更坚固"
	icon_state= "s_cart_o"
	icon_opened ="s_cart_o"
	icon_closed = "s_cart_c"
	storagecap = 30
	//DARK AGE STONE CART//
	//RENAISSANCE AGE COPPER CART//
/obj/structure/closet/crate/cart/copper
	name ="铜制推车"
	desc = " 一辆铜制推车,它很小,一些铜制部件使它比石制推车更坚固"
	icon_state= "c_cart_o"
	icon_opened ="c_cart_o"
	icon_closed = "c_cart_c"
	storagecap = 40
	//RENAISSANCE AGE COPPER CART//
	//NAPOLEONIC AGE BRONZE CART//
/obj/structure/closet/crate/cart/bronze
	name ="青铜推车"
	desc = " 一辆青铜推车,它是中等大小,一些青铜部件使它比石制推车更坚固"
	icon_state= "b_cart_o"
	icon_opened ="b_cart_o"
	icon_closed = "b_cart_c"
	storagecap = 50
	//NAPOLEONIC AGE BRONZE CART//
	//EARLY MODERN AGE STEEL CART//
/obj/structure/closet/crate/cart/steel
	name ="钢制推车"
	desc = " 一辆钢制推车,它是中等大小,钢制框架使它坚固且轻便"
	icon_state= "st_cart_o"
	icon_opened ="st_cart_o"
	icon_closed = "st_cart_c"
	storagecap = 60
	//EARLY MODERN AGE STEEL CART//
	//ROBERT'S CARTS//

/obj/structure/closet/crate/dumpster
	name ="垃圾箱"
	desc = " 一个用于装你所有垃圾和尸体的垃圾箱。"
	icon_state= "dumpster"
	icon_opened ="dumpsteropen"
	icon_closed = "dumpster"
	storagecap = 50
	storage_capacity = 100
	anchored = TRUE

/obj/structure/closet/crate/dumpster/New()
	..()
	garbage_collection()

/obj/structure/closet/crate/dumpster/proc/garbage_collection()
	for(var/obj/item/I in src)
		contents -= I
		qdel(I)
	update_icon()
	spawn(36000)
		if (!src || !src.loc)
			return
		else
			garbage_collection()
			return

/obj/structure/closet/crate/dumpster/update_icon()
	..()
	if (!opened)
		icon_state = "dumpster"
	else
		var/content_size = FALSE
		for (var/obj/item/I in contents)
			content_size += ceil(I.w_class/2)
		if (content_size <= storage_capacity*0.25)
			icon_state = "dumpsteropen"
		else if (content_size > storage_capacity*0.25 && content_size <= storage_capacity*0.75)
			icon_state = "dumpsteropen_halffull"
		else
			icon_state = "dumpsteropen_full"

/obj/structure/closet/crate/dumpster/attack_hand(mob/living/human/user as mob)
	if (!ishuman(user))
		return
	add_fingerprint(user)
	if (locked && !opened)
		to_chat(user, "<span class='notice'>\The [src] 已上锁。</span>")
		return
	else
		if (user.a_intent == I_GRAB && opened)
			if (!contents.len)
				to_chat(user, "<span class='notice'>\The [src] 是空的。</span>")
				return
			to_chat(user, "你开始在 \the [src] 中翻找...")
			if (do_after(user,40,src) && contents.len)
				var/obj/item/picked = pick(contents)
				picked.forceMove(user.loc)
				to_chat(user, "你取出了 \the [picked]。")
				update_icon()
				return
			else
				return
		else
			toggle(user)

/obj/structure/closet/crate/dumpster/open()
	if (opened)
		return FALSE
	if (!can_open())
		return FALSE

	playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
	opened = TRUE
	update_icon()

	if (climbable)
		structure_shaken()
	return TRUE