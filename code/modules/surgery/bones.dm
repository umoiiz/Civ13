//Procedures in this file: Fracture repair surgery
//////////////////////////////////////////////////////////////////
//						BONE SURGERY							//
//////////////////////////////////////////////////////////////////
/datum/surgery_step/set_bone
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/bonesetter",100),
		2 = list("/obj/item/weapon/surgery/bonesetter/bronze",85),
		3 = list("/obj/item/weapon/wrench",60),
		4 = list("/obj/item/weapon/hammer",50),
	)

	min_duration = 60
	max_duration = 70

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return FALSE
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		return affected && affected.name != "head" && affected.open >= 2

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("[user] 正开始用\the [tool]将[target]的[affected.name]中的骨头复位." , \
			"You are beginning to set the bone in [target]'s [affected.name] in place with \the [tool].")
		target.custom_pain("The pain in your [affected.name] is going to make you pass out!",110)
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		if (affected.status & ORGAN_BROKEN)
			user.visible_message("<span class = 'notice'>[user]用\the [tool]将[target]的[affected.name]中的骨头复位.</span>", \
				"<span class = 'notice'>You set the bone in [target]'s [affected.name] in place with \the [tool].</span>")
			for (var/datum/wound/W in affected.wounds)
				if (!W.internal && W.damage_type != BURN)
					affected.fracturetimer += W.damage
			affected.fracturetimer = min(affected.fracturetimer, 90)
			affected.status &= ~ORGAN_BROKEN
			affected.status &= ~ORGAN_SPLINTED
			affected.perma_injury = 0
			affected.damage = 0
			affected.stage = FALSE
			affected.createwound(BRUISE, -25)
			target.shock_stage *= 0.5
		else
			user.visible_message("<span class = 'notice'>[user]用\the [tool]将[target]的[affected.name]中的骨头<span class = 'red'>复位到了错误的位置.</span></span>", \
				"<span class = 'notice'>You set the bone in [target]'s [affected.name] <span class = 'red'>in the WRONG place with \the [tool].</span></span>")
			affected.fracture()

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]损伤了[target]的[affected.name]中的骨头!</span>" , \
			"<span class = 'red'>Your hand slips, damaging the bone in [target]'s [affected.name] with \the [tool]!</span>")
		affected.createwound(BRUISE, 5)

/datum/surgery_step/mend_skull
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/bonesetter",100),
		2 = list("/obj/item/weapon/surgery/bonesetter/bronze",85),
		3 = list("/obj/item/weapon/wrench",60),
		4 = list("/obj/item/weapon/hammer",50),
	)

	min_duration = 60
	max_duration = 70

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return FALSE
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		return affected && affected.name == "head" && affected.open >= 2

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("[user] 正开始用\the [tool]拼合[target]的头骨."  , \
			"You are beginning to piece together [target]'s skull with \the [tool].")
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'notice'>[user]用\the [tool]将[target]的头骨复位.</span>" , \
			"<span class = 'notice'>You set [target]'s skull with \the [tool].</span>")
		affected.status &= ~ORGAN_BROKEN
		affected.status &= ~ORGAN_SPLINTED
		affected.perma_injury = 0
		affected.damage = 0
		affected.stage = FALSE
		affected.createwound(BRUISE, -25)

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]损伤了[target]的面部!</span>"  , \
			"<span class = 'red'>Your hand slips, damaging [target]'s face with \the [tool]!</span>")
		var/obj/item/organ/external/head/h = affected
		h.createwound(BRUISE, 10)
		h.disfigured = TRUE