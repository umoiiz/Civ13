/obj/structure/iv_drip
	name = "\improper 静脉滴注器"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "iv_drip_unhooked"
	anchored = FALSE
	density = FALSE // You can pass through IV drips.
	var/mob/living/human/attached = null
	var/mode = TRUE // TRUE is injecting, FALSE is taking blood.
	var/obj/item/weapon/reagent_containers/beaker = null

/obj/structure/iv_drip/New()
	..()
	processing_objects += src

/obj/structure/iv_drip/Del()
	processing_objects -= src
	..()

/obj/structure/iv_drip/update_icon()
	if (attached)
		icon_state = "iv_drip"
	else
		icon_state = "iv_drip_unhooked"

	overlays = null

	if (beaker)
		var/datum/reagents/reagents = beaker.reagents
		if (reagents.total_volume)
			var/image/filling = image('icons/obj/surgery.dmi', src, "reagent")

			var/percent = round((reagents.total_volume / beaker.volume) * 100)
			switch(percent)
				if (0 to 9)		filling.icon_state = "reagent0"
				if (10 to 24) 	filling.icon_state = "reagent10"
				if (25 to 49)	filling.icon_state = "reagent25"
				if (50 to 74)	filling.icon_state = "reagent50"
				if (75 to 79)	filling.icon_state = "reagent75"
				if (80 to 90)	filling.icon_state = "reagent80"
				if (91 to INFINITY)	filling.icon_state = "reagent100"

			filling.icon += reagents.get_color()
			overlays += filling

/obj/structure/iv_drip/MouseDrop(over_object, src_location, over_location)
	..()

	if (attached)
		visible_message("[attached]已从\the [src]上取下。")
		attached = null
		update_icon()
		return

	if (in_range(src, usr) && ishuman(over_object) && get_dist(over_object, src) <= 1)
		visible_message("[usr]将\the [src]连接到\the [over_object]上。")
		attached = over_object
		update_icon()


/obj/structure/iv_drip/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers))
		if (!isnull(beaker))
			to_chat(user, "已经装有一个试剂容器了!")
			return

		user.drop_item()
		W.loc = src
		beaker = W
		to_chat(user, "你将\the [W]连接到\the [src]上。")
		update_icon()
		return
	else
		return ..()

/obj/structure/iv_drip/process()

	if (attached)

		if (!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		/*	visible_message("The needle is ripped out of [attached], doesn't that hurt?")
			attached:apply_damage(3, BRUTE, pick("r_arm", "l_arm"))*/ // this is dumb - Kachnov
			attached = null
			update_icon()
			return

	if (attached && beaker)
		// Give blood
		if (mode)
			if (beaker.volume > 0)
				var/transfer_amount = REM
				if (istype(beaker, /obj/item/weapon/reagent_containers/blood))
					// speed up transfer on blood packs
					transfer_amount = 4
				beaker.reagents.trans_to_mob(attached, transfer_amount, CHEM_BLOOD)
				update_icon()

		// Take blood
		else
			var/amount = beaker.reagents.maximum_volume - beaker.reagents.total_volume
			amount = min(amount, 4)
			// If the beaker is full, ping
			if (amount == FALSE)
				if (prob(5)) visible_message("\The [src]发出提示音。")
				return

			var/mob/living/human/T = attached

			if (!istype(T)) return
			if (!T.dna)
				return

			if (T.species.flags & NO_BLOOD)
				return

			// If the human is losing too much blood, beep.
			if (((T.vessel.get_reagent_amount("blood")/T.species.blood_volume)*100) < BLOOD_VOLUME_SAFE)
				visible_message("\The [src]发出响亮的哔哔声。")

			var/datum/reagent/B = T.take_blood(beaker,amount)

			if (B)
				beaker.reagents.reagent_list |= B
				beaker.reagents.update_total()
				beaker.on_reagent_change()
				beaker.reagents.handle_reactions()
				update_icon()

/obj/structure/iv_drip/attack_hand(mob/user as mob)
	if (beaker)
		beaker.loc = get_turf(src)
		beaker = null
		update_icon()
	else
		return ..()


/obj/structure/iv_drip/verb/toggle_mode()
	set category = null
	set name = "Toggle Mode"
	set src in view(1)

	if (!istype(usr, /mob/living))
		to_chat(usr, "<span class='warning'>你无法这么做。</span>")
		return

	if (usr.stat)
		return

	mode = !mode
	to_chat(usr, "静脉滴注器现在是[mode ? "injecting" : "taking blood"]。")

/obj/structure/iv_drip/examine(mob/user)
	..(user)
	if (!(user in view(2)) && user!=loc) return

	to_chat(user, "静脉滴注器是[mode ? "injecting" : "taking blood"]。")

	if (beaker)
		if (beaker.reagents && beaker.reagents.reagent_list.len)
			to_chat(usr, "<span class='notice'>连接着\a [beaker],内有[beaker.reagents.total_volume]单位液体。</span>")
		else
			to_chat(usr, "<span class='notice'>连接着一个空的[beaker]。</span>")
	else
		to_chat(usr, "<span class='notice'>没有连接任何化学品。</span>")

	to_chat(usr, "<span class='notice'>[attached ? attached : "No one"]已连接。</span>")

/obj/structure/iv_drip/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (height && istype(mover) && mover.checkpass(PASSTABLE)) //allow bullets, beams, thrown objects, mice, drones, and the like through.
		return TRUE
	return ..()


///////////////////////////////////////////

/obj/item/weapon/storage/box/bloodpacks
	name = "血袋 袋子"
	desc = "这个盒子装有血袋。"
	icon_state = "box"
	New()
		..()
		for (var/i=1, i<=8, i++)
			new /obj/item/weapon/reagent_containers/blood/empty(src)

/obj/item/weapon/reagent_containers/blood
	name = "血袋"
	desc = "装有用于输血的血。"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bp_empty"
	volume = 200

	var/blood_type = null

	New()
		..()
		if (blood_type != null)
			name = "血袋 [blood_type]"
			reagents.add_reagent("blood", 200, list("donor"=null,"viruses"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))
			update_icon()

	on_reagent_change()
		update_icon()

	update_icon()
		if (reagents)
			var/percent = round((reagents.total_volume / volume) * 100)
			if (reagents.has_reagent("blood"))
				switch(percent)
					if (0 to 9)			icon_state = "bp_empty"
					if (10 to 50) 		icon_state = "bp_half"
					if (51 to INFINITY)	icon_state = "bp_full"
			else if (reagents.has_reagent("saline_glucose"))
				switch(percent)
					if (0 to 9)			icon_state = "bp_empty"
					if (10 to 50) 		icon_state = "bp_half_saline"
					if (51 to INFINITY)	icon_state = "bp_full_saline"
			
		else
			icon_state = "bp_empty"

/obj/item/weapon/reagent_containers/blood/APlus
	blood_type = "A+"

/obj/item/weapon/reagent_containers/blood/AMinus
	blood_type = "A-"

/obj/item/weapon/reagent_containers/blood/BPlus
	blood_type = "B+"

/obj/item/weapon/reagent_containers/blood/BMinus
	blood_type = "B-"

/obj/item/weapon/reagent_containers/blood/OPlus
	blood_type = "O+"

/obj/item/weapon/reagent_containers/blood/OMinus
	blood_type = "O-"

/obj/item/weapon/reagent_containers/blood/ABPlus
	blood_type = "AB+"

/obj/item/weapon/reagent_containers/blood/ABMinus
	blood_type = "AB-"

/obj/item/weapon/reagent_containers/blood/empty
	name = "空血袋"
	desc = "似乎没什么用... 也许有办法把它装满?"
	icon_state = "bp_empty"

/obj/item/weapon/reagent_containers/blood/saline
	name = "生理盐水葡萄糖袋"
	desc = "装有用于输血的生理盐水葡萄糖溶液。"
	blood_type = null
	New()
		..()
		name = "生理盐水葡萄糖袋"
		reagents.add_reagent("saline_glucose", 200)
