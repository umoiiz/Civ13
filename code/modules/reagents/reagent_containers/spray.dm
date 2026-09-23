/obj/item/weapon/reagent_containers/spray
	name = "喷雾瓶"
	desc = "一个带可拧下顶盖的喷雾瓶."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "cleaner"
	item_state = "cleaner"
	flags = OPENCONTAINER|NOBLUDGEON
	slot_flags = SLOT_BELT
	throwforce = 3
	w_class = ITEM_SIZE_SMALL
	throw_speed = 2
	throw_range = 10
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10) //Set to null instead of list, if there is only one.
	var/spray_size = 3
	var/list/spray_sizes = list(1,3)
	volume = 250

/obj/item/weapon/reagent_containers/spray/New()
	..()
	verbs -= /obj/item/weapon/reagent_containers/verb/set_APTFT

/obj/item/weapon/reagent_containers/spray/afterattack(atom/A as mob|obj, mob/user as mob, proximity)
	if (istype(A, /obj/item/weapon/storage) || istype(A, /obj/structure/table) || istype(A, /obj/structure/closet) || istype(A, /obj/item/weapon/reagent_containers) || istype(A, /obj/structure/sink) /*|| istype(A, /obj/structure/janitorialcart)*/)
		return

	if (proximity)
		if (standard_dispenser_refill(user, A))
			return

	if (reagents.total_volume < amount_per_transfer_from_this)
		to_chat(user, "<span class='notice'>\The [src] 是空的!</span>")
		return

	Spray_at(A, user, proximity)

	playsound(loc, 'sound/effects/spray2.ogg', 50, TRUE, -6)

	user.setClickCooldown(4)

	if (reagents.has_reagent("sacid"))
		message_admins("[key_name_admin(user)] fired sulphuric acid from \a [src].", key_name_admin(user))
		log_game("[key_name(user)] fired sulphuric acid from \a [src].")
	if (reagents.has_reagent("pacid"))
		message_admins("[key_name_admin(user)] fired Polyacid from \a [src].", key_name_admin(user))
		log_game("[key_name(user)] fired Polyacid from \a [src].")
	if (reagents.has_reagent("lube"))
		message_admins("[key_name_admin(user)] fired Space lube from \a [src].", key_name_admin(user))
		log_game("[key_name(user)] fired Space lube from \a [src].")
	return

/obj/item/weapon/reagent_containers/spray/proc/Spray_at(atom/A as mob|obj, mob/user as mob, proximity)
	if (A.density && proximity)
		A.visible_message("[usr]用[src]喷洒[A].")
		reagents.splash(A, amount_per_transfer_from_this)
	else
		spawn(0)
			var/obj/effect/effect/water/chempuff/D = new/obj/effect/effect/water/chempuff(get_turf(src))
			var/turf/my_target = get_turf(A)
			D.create_reagents(amount_per_transfer_from_this)
			if (!src)
				return
			reagents.trans_to_obj(D, amount_per_transfer_from_this)
			D.set_color()
			D.set_up(my_target, spray_size, 10)
	return

/obj/item/weapon/reagent_containers/spray/attack_self(var/mob/user)
	if (!possible_transfer_amounts)
		return
	amount_per_transfer_from_this = next_in_list(amount_per_transfer_from_this, possible_transfer_amounts)
	spray_size = next_in_list(spray_size, spray_sizes)
	to_chat(user, "<span class='notice'>你调整了压力喷嘴. 现在每次喷洒将使用 [amount_per_transfer_from_this] 单位.</span>")

/obj/item/weapon/reagent_containers/spray/examine(mob/user)
	if (..(user, FALSE) && loc == user)
		to_chat(user, "剩余 [round(reagents.total_volume)] 单位.")
	return

/obj/item/weapon/reagent_containers/spray/verb/empty()

	set name = "Empty Spray Bottle"
	set category = null
	set src in usr

	if (WWinput(usr, "Are you sure you want to empty the spray bottle?", "Empty Bottle", "Yes", list("Yes", "No")) != "Yes")
		return
	if (isturf(usr.loc))
		to_chat(usr, "<span class='notice'>你把 \the [src] 倒在地板上.</span>")
		reagents.splash(usr.loc, reagents.total_volume)

//space cleaner
/obj/item/weapon/reagent_containers/spray/cleaner
	name = "清洁剂"
	desc = "BLAM!牌无泡清洁剂!"

/obj/item/weapon/reagent_containers/spray/cleaner/New()
	..()
	reagents.add_reagent("cleaner", volume)

/obj/item/weapon/reagent_containers/spray/sterilizine
	name = "消毒灵"
	desc = "非常适合掩盖罪证血迹和给手术刀消毒."
	volume = 75

/obj/item/weapon/reagent_containers/spray/sterilizine/New()
	..()
	reagents.add_reagent("sterilizine", volume * 0.66)
	reagents.add_reagent("cleaner", volume * 0.34)

/obj/item/weapon/reagent_containers/spray/pepper
	name = "胡椒喷雾"
	desc = "一罐胡椒喷雾,用于迅速致盲并击倒对手."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "pepperspray"
	item_state = "pepperspray"
	possible_transfer_amounts = null
	volume = 60
	var/safety = TRUE

/obj/item/weapon/reagent_containers/spray/pepper/New()
	..()
	reagents.add_reagent("condensedcapsaicin", 60)

/obj/item/weapon/reagent_containers/spray/pepper/examine(mob/user)
	if (..(user, TRUE))
		to_chat(user, "保险栓处于[safety ? "on" : "off"]状态.")

/obj/item/weapon/reagent_containers/spray/pepper/attack_self(var/mob/user)
	safety = !safety
	to_chat(usr, "<span class = 'notice'>你将保险栓切换到[safety ? "on" : "off"].</span>")

/obj/item/weapon/reagent_containers/spray/pepper/Spray_at(atom/A as mob|obj)
	if (safety)
		to_chat(usr, "<span class = 'warning'>保险栓处于开启状态!</span>")
		return
	..()

/obj/item/weapon/reagent_containers/spray/waterflower
	name = "喷水花"
	desc = "一朵看似无辜的向日葵...却另有玄机."
	icon = 'icons/obj/device.dmi'
	icon_state = "sunflower"
	item_state = "sunflower"
	amount_per_transfer_from_this = TRUE
	possible_transfer_amounts = null
	volume = 10

/obj/item/weapon/reagent_containers/spray/waterflower/New()
	..()
	reagents.add_reagent("water", 10)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////SPRAYER///////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/spray/chemsprayer
	name = "化学喷雾器"
	desc = "一种用于在指定区域喷洒大量试剂的工具."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "chemsprayer"
	item_state = "chemsprayer"
	var/base_icon = "chemsprayer"
	throwforce = 3
	w_class = ITEM_SIZE_NORMAL
	possible_transfer_amounts = null
	volume = 600
	var/active = FALSE
//    origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_ENGINEERING = 3)

/obj/item/weapon/reagent_containers/spray/chemsprayer/Spray_at(atom/A as mob|obj)
	var/direction = get_dir(src, A)
	var/turf/T = get_turf(A)
	var/turf/T1 = get_step(T,turn(direction, 90))
	var/turf/T2 = get_step(T,turn(direction, -90))
	var/list/the_targets = list(T, T1, T2)

	for (var/a = TRUE to 3)
		spawn(0)
			if (reagents.total_volume < 1) break
			var/obj/effect/effect/water/chempuff/D = new/obj/effect/effect/water/chempuff(get_turf(src))
			var/turf/my_target = the_targets[a]
			D.create_reagents(amount_per_transfer_from_this)
			if (!src)
				return
			reagents.trans_to_obj(D, amount_per_transfer_from_this)
			D.set_color()
			D.set_up(my_target, rand(6, 8), 2)
	return

/obj/item/weapon/reagent_containers/spray/chemsprayer/filled/New()
	..()
	reagents.add_reagent("cleaner",600)