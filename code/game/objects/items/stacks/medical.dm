/obj/item/stack/medical
	name = "医疗包"
	singular_name = "medical pack"
	icon = 'icons/obj/items.dmi'
	amount = 30
	max_amount = 30
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 20
	var/heal_brute = 0
	var/heal_burn = 0
	value = 0
	
/obj/item/stack/medical/attack(mob/living/human/C as mob, mob/user as mob)
	if (!istype(C) )
		if (!istype(C, /mob/living/simple_animal))
			to_chat(user, SPAN_WARNING("\The [src] cannot be applied to [C]!"))
		return TRUE

	if (!istype(user, /mob/living/human))
		to_chat(user, SPAN_WARNING("You don't have the dexterity to do this!"))
		return TRUE

	if (istype(C, /mob/living/human))
		var/mob/living/human/H = C

		H.UpdateDamageIcon()

		H.updatehealth()

	else if (istype(C, /mob/living/human))
		C.heal_organ_damage((heal_brute/2), (heal_burn/2))
		user.visible_message( \
			SPAN_NOTICE("[C] has been applied with [src] by [user]."), \
			SPAN_NOTICE("You apply \the [src] to [C].") \
		)
		use(1)

		C.updatehealth()

/obj/item/stack/medical/bruise_pack
	name = "纱布卷"
	singular_name = "gauze length"
	desc = "一些用于包扎血淋淋残肢的无菌纱布."
	icon_state = "brutepack"
	flammable = TRUE

/obj/item/stack/medical/bruise_pack/attack(mob/living/M as mob, mob/user as mob)
	if (..())
		return TRUE

	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if(!affecting)
			return
		if (affecting.open)
			to_chat(user, SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than a bandage!"))
			return
		if (affecting.is_bandaged())
			to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been bandaged."))
			return TRUE
		else
			user.visible_message(SPAN_NOTICE("\The [user] starts treating [M]'s [affecting.name]."), \
									SPAN_NOTICE("You start treating [M]'s [affecting.name]."))
			var/used = FALSE
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if (W.bandaged)
					continue
				if (used == amount)
					break
				if (!do_mob(user, M, W.damage/5))
					to_chat(user, SPAN_NOTICE("You must stand still to bandage wounds."))
					break

				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message(SPAN_NOTICE("\The [user] bandages \a [W.desc] on [M]'s [affecting.name]."), \
													SPAN_NOTICE("You bandage \a [W.desc] on [M]'s [affecting.name].") )
					//H.add_side_effect("Itch")
				else if (W.damage_type == BRUISE)
					user.visible_message(SPAN_NOTICE("\The [user] places a bruise patch over \a [W.desc] on [M]'s [affecting.name]."), \
													SPAN_NOTICE("You place a bruise patch over \a [W.desc] on [M]'s [affecting.name].") )
				else
					user.visible_message(SPAN_NOTICE("\The [user] places a bandaid over \a [W.desc] on [M]'s [affecting.name]."), \
													SPAN_NOTICE("You place a bandaid over \a [W.desc] on [M]'s [affecting.name].") )
				W.bandage()
				used++
			affecting.update_damages()
			if (used == amount)
				if (affecting.is_bandaged())
					to_chat(user, SPAN_WARNING("\The [src] is used up."))
				else
					to_chat(user, SPAN_WARNING("\The [src] is used up, but there are more wounds to treat on \the [affecting.name]."))
			use(used)
			H.update_bandaging(1)
		/*else
			if (can_operate(H))		//Checks if mob is lying down on table for surgery
				if (do_surgery(H,user,src))
					return
			else
				if (affecting)
					to_chat(user,  SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than a bandage!"))*/

/obj/item/stack/medical/advanced/bruise_pack
	name = "创伤包"
	singular_name = "trauma kit"
	desc = "用于严重伤势的高级创伤包."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "trauma_kit"
	item_state = "trauma_kit"
	heal_brute = 15
	flammable = TRUE

/obj/item/stack/medical/advanced/bruise_pack/attack(mob/living/human/M as mob, mob/user as mob)
	if (..())
		return TRUE

	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if(!affecting)
			return
		if (affecting.open)
			to_chat(user, SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than a bandage!"))
			return
		if (affecting.is_bandaged() && affecting.is_disinfected())
			to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been treated."))
			return TRUE
		else
			user.visible_message(SPAN_NOTICE("\The [user] starts treating [M]'s [affecting.name]."), \
								SPAN_NOTICE("You start treating [M]'s [affecting.name]."))
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if (W.bandaged && W.disinfected)
					continue
				if (used == amount)
					break
				if (!do_mob(user, M, W.damage/5))
					to_chat(user,  SPAN_NOTICE("You must stand still to bandage wounds."))
					break
				if(affecting.is_bandaged() && affecting.is_disinfected()) // We do a second check after the delay, in case it was bandaged after the first check.
					to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been bandaged."))
					return TRUE
				if(used >= src.amount)
					to_chat(user, SPAN_WARNING("You run out of [src]!"))
					break
				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message(SPAN_NOTICE("\The [user] cleans \a [W.desc] on [M]'s [affecting.name] and covers it with a bandage."), \
										SPAN_NOTICE("You clean and cover \a [W.desc] on [M]'s [affecting.name]."))
				else if (W.damage_type == BRUISE)
					user.visible_message(SPAN_NOTICE("\The [user] places a medical patch over \a [W.desc] on [M]'s [affecting.name]."), \
												SPAN_NOTICE("You place a medical patch over \a [W.desc] on [M]'s [affecting.name]."))
				else
					user.visible_message(SPAN_NOTICE("\The [user] smears some ointment over \a [W.desc] on [M]'s [affecting.name]."), \
												SPAN_NOTICE("You smear some ointment over \a [W.desc] on [M]'s [affecting.name]."))
				W.bandage()
				W.disinfect()
				W.heal_damage(heal_brute)
				used++
			affecting.update_damages()
			if (used == amount)
				if (affecting.is_bandaged())
					to_chat(user, SPAN_WARNING("\The [src] is used up."))
				else
					to_chat(user, SPAN_WARNING("\The [src] is used up, but there are more wounds to treat on \the [affecting.name]."))
			use(used)
			H.update_bandaging(1)

		var/mob/living/human/H_user = user
		if (istype(H_user) && H_user.getStatCoeff("medical") >= GET_MIN_STAT_COEFF(STAT_VERY_HIGH))
			if (affecting && affecting.open == FALSE)
				if (affecting.is_bandaged() && affecting.is_disinfected())
					affecting.wounds.Cut()
					H_user.bad_external_organs -= affecting

/obj/item/stack/medical/advanced/herbs
	name = "治疗草药"
	singular_name = "healing herb"
	desc = "从灌木丛中采集的一把治疗草药.有助于清洁伤口."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "healing_herbs"
	item_state = null
	amount = 10
	heal_brute = 5
	heal_burn = 5

/obj/item/stack/medical/advanced/herbs/small
	amount = 1

/obj/item/stack/medical/advanced/herbs/attack(mob/living/human/M as mob, mob/user as mob)
	if (..())
		return TRUE

	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if(!affecting)
			return
			
		if (affecting.open)
			to_chat(user,  SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than some healing herbs!"))

		if (affecting.is_salved() && affecting.is_disinfected())
			to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been treated."))
			return TRUE

		if (!affecting.is_disinfected() || !affecting.is_salved())
			user.visible_message(SPAN_NOTICE("\The [user] starts treating [M]'s [affecting.name]."), \
								SPAN_NOTICE("You start treating [M]'s [affecting.name]."))
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if (W.salved && W.disinfected)
					continue
				if (used == amount)
					break
				if (!do_mob(user, M, W.damage/5))
					to_chat(user,  SPAN_NOTICE("You must stand still to bandage wounds."))
					break

				user.visible_message(SPAN_NOTICE("\The [user] rub some healing herbs over \a [W.desc] on [M]'s [affecting.name]."), \
												SPAN_NOTICE("You rub some healing herbs over \a [W.desc] on [M]'s [affecting.name]."))
				W.disinfect()
				W.salve()
				W.heal_damage(heal_brute)
				used++
			affecting.update_damages()
			if (used == amount)
				if (affecting.is_bandaged())
					to_chat(user, SPAN_WARNING("\The [src] is used up."))
				else
					to_chat(user, SPAN_WARNING("\The [src] is used up, but there are more wounds to treat on \the [affecting.name]."))
			use(used)

		var/mob/living/human/H_user = user
		if (istype(H_user) && H_user.getStatCoeff("medical") >= GET_MIN_STAT_COEFF(STAT_VERY_HIGH))
			if (affecting)
				if (affecting.is_salved() && affecting.is_disinfected())
					affecting.wounds.Cut()
					H_user.bad_external_organs -= affecting
	return

/obj/item/stack/medical/advanced/sulfa
	name = "磺胺粉包"
	singular_name = "powder pack"
	desc = "一包粉末状磺胺,一种磺胺类抗菌剂."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "sulfa"
	item_state = "trauma_kit"
	amount = 20
	flammable = TRUE

/obj/item/stack/medical/advanced/sulfa/small
	amount = 5

/obj/item/stack/medical/advanced/sulfa/attack(mob/living/human/M as mob, mob/user as mob)
	if (..())
		return TRUE

	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if (affecting.is_disinfected())
			to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been disinfected."))
			return TRUE
		else
			user.visible_message(SPAN_NOTICE("\The [user] starts disinfecting [M]'s [affecting.name]."), \
								 SPAN_NOTICE("You start disinfecting [M]'s [affecting.name]."))
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.internal)
					continue
				if (W.bandaged && W.disinfected)
					continue
				if (used == amount)
					break
				if (!do_mob(user, M, W.damage/5))
					to_chat(user,  SPAN_NOTICE("You must stand still to treat wounds."))
					break
				user.visible_message(SPAN_NOTICE("\The [user] spread some sulfanilamide over \a [W.desc] on [M]'s [affecting.name]."), \
												  SPAN_NOTICE("You spread some sulfanilamide over \a [W.desc] on [M]'s [affecting.name]."))
				W.disinfect()
				W.heal_damage(heal_brute)
				used++
			affecting.update_damages()
			if (used == amount)
				if (affecting.is_bandaged())
					to_chat(user, SPAN_WARNING("\The [src] is used up."))
				else
					to_chat(user, SPAN_WARNING("\The [src] is used up, but there are more wounds to treat on \the [affecting.name]."))
			use(used)

/obj/item/stack/medical/advanced/ointment
	name = "烧伤包"
	singular_name = "burn kit"
	desc = "用于严重烧伤的高级治疗包."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "burn_kit"
	item_state = "burn_kit"
	heal_burn = 15
	amount = 10


/obj/item/stack/medical/advanced/ointment/attack(mob/living/human/M as mob, mob/user as mob)
	if (..())
		return TRUE

	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if (affecting && affecting.open == FALSE)
			if (affecting.is_salved())
				to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been salved."))
				return TRUE
			else
				user.visible_message(SPAN_NOTICE("\The [user] starts salving wounds on [M]'s [affecting.name]."), \
									 SPAN_NOTICE("You start salving the wounds on [M]'s [affecting.name]."))
				if (!do_mob(user, M, 10))
					to_chat(user,  SPAN_NOTICE("You must stand still to salve wounds."))
					return TRUE
				user.visible_message(SPAN_NOTICE("[user] covers wounds on [M]'s [affecting.name] with a healing ointment."), \
										SPAN_NOTICE("You cover wounds on [M]'s [affecting.name] with a healing ointment."))
				affecting.heal_damage(0,heal_burn)
				use(1)
				affecting.salve()
		else
			if (can_operate(H))		//Checks if mob is lying down on table for surgery
				if (do_surgery(H,user,src))
					return
			else
				to_chat(user, SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than a bandage!"))

/obj/item/stack/medical/splint
	name = "医疗夹板"
	singular_name = "medical splint"
	icon_state = "splint"
	amount = 5
	max_amount = 5
	flags = CONDUCT

/obj/item/stack/medical/splint/attack(mob/living/human/M as mob, mob/user as mob)
	if (..())
		return TRUE
	if (istype(M, /mob/living/human) && user.targeted_organ != "random")
		var/mob/living/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)
		var/limb = "chest"
		if (affecting)
			limb = affecting.name
			if (!(affecting.limb_name in list("chest", "head", "groin", "l_arm","r_arm","l_leg","r_leg", "l_hand", "r_hand", "l_foot", "r_foot")))
				to_chat(user, SPAN_WARNING("You can't apply a splint there!"))
				return
			else if (affecting.status & ORGAN_SPLINTED)
				to_chat(user,  SPAN_WARNING("[M]'s [limb] is already splinted!"))
				return
			else if (affecting.status == 0)
				to_chat(user,  SPAN_WARNING("[M]'s [limb] does not need splinting."))
				return
		if (M != user)
			user.visible_message(SPAN_NOTICE("[user] starts to apply \the [src] to [M]'s [limb]."), SPAN_DANGER("You start to apply \the [src] to [M]'s [limb]."), SPAN_DANGER("You hear something being wrapped."))
		else
			if ((!user.hand && affecting.limb_name == "r_arm") || (user.hand && affecting.limb_name == "l_arm"))
				to_chat(user,  SPAN_WARNING("You can't apply a splint to the arm you're using!"))
				return
			user.visible_message(SPAN_NOTICE("[user] starts to apply \the [src] to their [limb]."), SPAN_DANGER("You start to apply \the [src] to your [limb]."), SPAN_DANGER("You hear something being wrapped."))
		if (do_mob(user, M, 50))
			if (M != user)
				user.visible_message(SPAN_NOTICE("[user] finishes applying \the [src] to [M]'s [limb]."), SPAN_DANGER("You finish applying \the [src] to [M]'s [limb]."), SPAN_DANGER("You hear something being wrapped."))
			else
				if (prob(40 * H.getStatCoeff("medical")))
					user.visible_message(SPAN_NOTICE("[user] successfully applies \the [src] to their [limb]."), SPAN_DANGER("You successfully apply \the [src] to your [limb]."), SPAN_DANGER("You hear something being wrapped."))
				else
					user.visible_message(SPAN_WARNING("[user] fumbles \the [src]."), SPAN_DANGER("You fumble \the [src]."), SPAN_DANGER("You hear something being wrapped."))
					return
			affecting.status |= ORGAN_SPLINTED
			use(1)
		return

/obj/item/stack/medical/splint/small
	amount = 1
/obj/item/stack/medical/bruise_pack/bint
	name = "布绷带"
	singular_name = "cloth bandage"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bint"
	heal_brute = 10 // for healing dogs and other animals
	amount = 10

/obj/item/stack/medical/bruise_pack/bint/small
	amount = 1

/obj/item/stack/medical/bruise_pack/bint/medic
	amount = 40

/obj/item/stack/medical/bruise_pack/bint/leather
	name = "皮革绷带"
	singular_name = "leather bandage"
	desc = "一种粗糙的绷带,由薄动物皮革制成."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "leatherbandage"
	heal_brute = 6 // for healing dogs and other animals
	amount = 6

/obj/item/stack/medical/bruise_pack/gauze
	name = "纱布卷"
	singular_name = "gauze length"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "gauze"
	heal_brute = 10 // for healing dogs and other animals
	amount = 10

/obj/item/bag_valve_mask
	name = "球囊面罩"
	desc = "一种手持设备,通常用于为没有呼吸或呼吸不足的患者提供正压通气."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "valvemask"
/obj/item/bag_valve_mask/attack(var/mob/living/human/M as mob, var/mob/user as mob)
	if (M.wear_mask)
		to_chat(user, SPAN_WARNING("Uncover their mouth first!"))
		return
	user.visible_message("[user]开始将\the [src]连接到[M].", "你开始将\the [src]连接到[M].")
	if (do_after(user, 80, src)) // TO-DO: Make it dependent on medical skill
		M.adjustOxyLoss(-7)
		user.visible_message(SPAN_NOTICE("[user] manually ventilates [M]."), SPAN_NOTICE("You manually ventilate [M]."))
		return

/obj/item/revival_kit
	name = "复活包"
	desc = "一座全尺寸医院加上多年的康复治疗,只需短短几秒钟,真是来自众神的真正恩赐!最好别太贪心..."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "revival"
/obj/item/revival_kit/attack(var/mob/living/human/M as mob, var/mob/user as mob)
	user.visible_message(SPAN_NOTICE("[user] starts trying to revive [M]."), SPAN_NOTICE("You determinately start trying to perfom the work of gods on [M]."))
	if (!do_after(user, 120, src))
		user.visible_message(SPAN_NOTICE("[user] stops trying to revive [M]."), SPAN_NOTICE("You stop trying to revive [M]."))
		return
	M.revive()
	if (!M.ckey && M.lastKnownCkey)
		M.ckey = M.lastKnownCkey
	user.visible_message("<font size=4>[user]通过将[M]的死者复活,传递了来自众神的讯息!</font>", "<font size=4>你完成了只有神才能做到的事,复活了[M]!</font>")
	playsound(get_turf(M), 'sound/hallelujah!.ogg', 120, FALSE)
	if (M.ckey == user.ckey)
		to_chat(user, SPAN_DANGER("You were greedy and now you don't feel so good..."))
		spawn(30)
			M.gib()
	qdel(src)