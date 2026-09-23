//////////////////////////////////////////////////////////////////
//					INTERNAL WOUND PATCHING						//
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//	 IB fixing step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/fix_vein
	priority = 2
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/hemostat",100),
		2 = list("/obj/item/weapon/surgery/hemostat/bronze",85),
		3 = list("/obj/item/stack/cable_coil",75),
		4 = list("/obj/item/stack/material/rope",50),
	)
	can_infect = TRUE
	blood_level = TRUE

	min_duration = 70
	max_duration = 90

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return FALSE

		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		if (!affected) return
		var/internal_bleeding = FALSE
		for (var/datum/wound/W in affected.wounds) if (W.internal)
			internal_bleeding = TRUE
			break

		return affected.open == (affected.encased ? 3 : 2) && internal_bleeding

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("[user]开始用\the [tool]夹住[target]的[affected.name]中受损的[affected.artery_name]." , \
		"You start pinching the damaged [affected.artery_name] in [target]'s [affected.name] with \the [tool].")
		target.custom_pain("The pain in [affected.name] is unbearable!",100)
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'notice'>[user]已用\the [tool]夹住[target]的[affected.name]中受损的[affected.artery_name].</span>", \
			"<span class = 'notice'>You have pinched the damaged [affected.artery_name] in [target]'s [affected.name] with \the [tool].</span>")

		for (var/datum/wound/W in affected.wounds) if (W.internal)
			affected.wounds -= W
			affected.update_damages()
		if (ishuman(user) && prob(40)) user:bloody_hands(target, FALSE)

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,将[tool]涂抹在[target]的[affected.name]的切口上!</span>" , \
		"<span class = 'red'>Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!</span>")
		affected.take_damage(5, FALSE)

//////////////////////////////////////////////////////////////////
//	 Necrosis treatment
//////////////////////////////////////////////////////////////////
/datum/surgery_step/fix_dead_tissue		//Debridement
	priority = 2
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/scalpel",100),
		2 = list("/obj/item/weapon/surgery/scalpel/bronze",85),
		3 = list("/obj/item/weapon/material/kitchen/utensil/knife",75),
		4 = list("/obj/item/weapon/material/shard",50),
	)

	can_infect = TRUE
	blood_level = 1

	min_duration = 110
	max_duration = 160

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return FALSE

		if (target_zone == "mouth" || target_zone == "eyes")
			return FALSE

		var/obj/item/organ/external/affected = target.get_organ(target_zone)

		return affected && affected.open >= 2 && (affected.status & ORGAN_DEAD)

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("[user]开始用\the [tool]切除[target]的[affected.name]中的坏死组织." , \
		"You start cutting away necrotic tissue in [target]'s [affected.name] with \the [tool].")
		target.custom_pain("The pain in [affected.name] is unbearable!",100)
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'notice'>[user]已用\the [tool]切除[target]的[affected.name]中的坏死组织.</span>", \
			"<span class = 'notice'>You have cut away necrotic tissue in [target]'s [affected.name] with \the [tool].</span>")
		affected.status &= ~ORGAN_DEAD
		affected.open = 3
		playsound(target.loc, 'sound/effects/squelch1.ogg', 50, TRUE)

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]切开了[target]的[affected.name]内部的一条动脉!</span>", \
		"<span class = 'red'>Your hand slips, slicing an artery inside [target]'s [affected.name] with \the [tool]!</span>")
		affected.createwound(CUT, 20, TRUE)

/datum/surgery_step/treat_necrosis
	priority = 2
	allowed_tools = alist(
		1 = list("/obj/item/weapon/reagent_containers/dropper",100),
		2 = list("/obj/item/weapon/reagent_containers/glass/bottle",75),
		3 = list("/obj/item/weapon/reagent_containers/glass/bucket",50),
	)

	can_infect = FALSE
	blood_level = FALSE

	min_duration = 50
	max_duration = 60

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!istype(tool, /obj/item/weapon/reagent_containers))
			return FALSE

		var/obj/item/weapon/reagent_containers/container = tool
		if (!container.reagents.has_reagent("peridaxon"))
			return FALSE

		if (!hasorgans(target))
			return FALSE

		if (target_zone == "mouth" || target_zone == "eyes")
			return FALSE

		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		return affected && affected.open == 3 && (affected.status & ORGAN_DEAD)

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("[user]开始用\the [tool]将药物涂抹到[target]的[affected.name]中受影响的组织上." , \
		"You start applying medication to the affected tissue in [target]'s [affected.name] with \the [tool].")
		target.custom_pain("Something in your [affected.name] is causing you a lot of pain!",250)
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)

		if (!istype(tool, /obj/item/weapon/reagent_containers))
			return

		var/obj/item/weapon/reagent_containers/container = tool

		var/trans = container.reagents.trans_to_mob(target, container.amount_per_transfer_from_this, CHEM_BLOOD) //technically it's contact, but the reagents are being applied to internal tissue
		if (trans > 0)

			if (container.reagents.has_reagent("peridaxon"))
				affected.status &= ~ORGAN_DEAD

			user.visible_message("<span class = 'notice'>[user]将[trans]单位的溶液涂抹到[target]的[affected.name]中受影响的组织上</span>", \
				"<span class = 'notice'>You apply [trans] units of the solution to affected tissue in [target]'s [affected.name] with \the [tool].</span>")

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)

		if (!istype(tool, /obj/item/weapon/reagent_containers))
			return

		var/obj/item/weapon/reagent_containers/container = tool

		var/trans = container.reagents.trans_to_mob(target, container.amount_per_transfer_from_this, CHEM_BLOOD)

		user.visible_message("<span class = 'red'>[user]的手滑了,用[tool]将[trans]单位的溶液涂抹到了[target]的[affected.name]中的错误位置!</span>" , \
		"<span class = 'red'>Your hand slips, applying [trans] units of the solution to the wrong place in [target]'s [affected.name] with the [tool]!</span>")

		//no damage or anything, just wastes medicine
//////////////////////////////////////////////////////////////////
//	 Disinfection step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/sterilize
	priority = 2
	allowed_tools = alist(
		1 = list("/obj/item/stack/medical/advanced/sulfa",100),
		2 = list("/obj/item/weapon/reagent_containers/spray", 100),
		3 = list("/obj/item/stack/medical/advanced/bruise_pack",50),
		4 = list("/obj/item/stack/medical/advanced/ointment",60),
		5 = list("/obj/item/weapon/reagent_containers/glass/bucket",30),
		6 = list("/obj/item/weapon/reagent_containers/food/drinks/bottle",75),
		7 = list("/obj/item/weapon/reagent_containers/food/drinks/flask/", 80),
		8 = list("/obj/item/weapon/reagent_containers/glass/beaker",75),
		9 = list("/obj/item/weapon/reagent_containers/glass/bottle", 90),
	)

	can_infect = FALSE
	blood_level = 0

	min_duration = 50
	max_duration = 60

/datum/surgery_step/sterilize/can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
	if(!hasorgans(target))
		return FALSE
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(!istype(affected))
		return FALSE
	if(affected.is_disinfected())
		return FALSE
	var/obj/item/weapon/reagent_containers/container = tool
	if(!istype(container))
		return FALSE
	if(!container.is_open_container())
		return FALSE
	var/datum/reagent/ethanol/booze = locate() in container.reagents.reagent_list
	if(istype(booze) && booze.strength >= 40)
		to_chat(user, "<span class='warning'>[booze]太弱了,你需要度数更高的东西来做这个...</span>")
		return FALSE
	if(!istype(booze) && !container.reagents.has_reagent("sterilizine"))
		return FALSE
	return TRUE

/datum/surgery_step/sterilize/begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("[user]开始将[tool]的内容物倒在\the [target]的[affected.name]上." , \
	"You start pouring [tool]'s contents on \the [target]'s [affected.name].")
	target.custom_pain("Your [affected.name] is on fire!",50,affecting = affected)
	..()

/datum/surgery_step/sterilize/end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	if (!istype(tool, /obj/item/weapon/reagent_containers))
		return

	var/obj/item/weapon/reagent_containers/container = tool

	var/amount = container.amount_per_transfer_from_this
	var/datum/reagents/temp = new(amount)
	container.reagents.trans_to_holder(temp, amount)

	var/trans = temp.trans_to_mob(target, temp.total_volume, CHEM_BLOOD) //technically it's contact, but the reagents are being applied to internal tissue
	if (trans > 0)
		user.visible_message("<span class='notice'>[user]用\the [tool]的内容物擦拭[target]的[affected.name]</span>.", \
			"<span class='notice'>You rub [target]'s [affected.name] down with \the [tool]'s contents.</span>")

/datum/surgery_step/sterilize/fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	if (!istype(tool, /obj/item/weapon/reagent_containers))
		return

	var/obj/item/weapon/reagent_containers/container = tool

	container.reagents.trans_to_mob(target, container.amount_per_transfer_from_this, CHEM_BLOOD)

	user.visible_message("<span class='warning'>[user]的手滑了,将\the [tool]的内容物洒在了[target]的[affected.name]上!</span>" , \
	"<span class='warning'>Your hand slips, splilling \the [tool]'s contents over the [target]'s [affected.name]!</span>")
	affected.disinfect()

