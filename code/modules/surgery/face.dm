//Procedures in this file: Facial reconstruction surgery
//////////////////////////////////////////////////////////////////
//						FACE SURGERY							//
//////////////////////////////////////////////////////////////////

/datum/surgery_step/face
	priority = 2
	req_open = FALSE
	can_infect = FALSE
	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return FALSE
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		if (!affected)
			return FALSE
		return target_zone == "mouth"

/datum/surgery_step/generic/cut_face
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/scalpel",100),
		2 = list("/obj/item/weapon/surgery/scalpel/bronze",85),
		3 = list("/obj/item/weapon/material/kitchen/utensil/knife",75),
		4 = list("/obj/item/weapon/material/shard",50),
	)

	min_duration = 90
	max_duration = 110

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		return ..() && target_zone == "mouth" && target.op_stage.face == FALSE

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("[user]开始用\the [tool]切开[target]的面部和颈部.", \
		"You start to cut open [target]'s face and neck with \the [tool].")
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("<span class = 'notice'>[user]用\the [tool]切开了[target]的面部和颈部.</span>" , \
		"<span class = 'notice'>You have cut open [target]'s face and neck with \the [tool].</span>",)
		target.op_stage.face = TRUE

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]切开了[target]的喉咙!</span>" , \
		"<span class = 'red'>Your hand slips, slicing [target]'s throat wth \the [tool]!</span>" )
		affected.createwound(CUT, 60)
		target.losebreath += 10

/datum/surgery_step/face/mend_vocal
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/hemostat",100),
		2 = list("/obj/item/weapon/surgery/hemostat/bronze",85),
	)

	min_duration = 70
	max_duration = 90

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		return ..() && target.op_stage.face == TRUE

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("[user]开始用\the [tool]修复[target]的声带.", \
		"You start mending [target]'s vocal cords with \the [tool].")
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("<span class = 'notice'>[user]用\the [tool]修复了[target]的声带.</span>", \
		"<span class = 'notice'>You mend [target]'s vocal cords with \the [tool].</span>")
		target.op_stage.face = 2

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]将[target]的气管夹闭了片刻!</span>", \
		"<span class = 'red'>Your hand slips, clamping [user]'s trachea shut for a moment with \the [tool]!</span>")
		target.losebreath += 10

/datum/surgery_step/face/fix_face
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/retractor",100),
		2 = list("/obj/item/weapon/surgery/retractor/bronze",85),
		3 = list("/obj/item/weapon/crowbar",55),
		4 = list("/obj/item/weapon/material/kitchen/utensil/fork",75),
	)

	min_duration = 80
	max_duration = 100

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		return ..() && target.op_stage.face == 2

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("[user]开始用\the [tool]将[target]面部的皮肤拉回原位.", \
		"You start pulling the skin on [target]'s face back in place with \the [tool].")
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("<span class = 'notice'>[user]用\the [tool]将[target]面部的皮肤拉回原位.</span>",	\
		"<span class = 'notice'>You pull the skin on [target]'s face back in place with \the [tool].</span>")
		target.op_stage.face = 3

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]撕裂了[target]面部的皮肤!</span>", \
		"<span class = 'red'>Your hand slips, tearing skin on [target]'s face with \the [tool]!</span>")
		target.apply_damage(10, BRUTE, affected, sharp=1, sharp=1)

/datum/surgery_step/face/cauterize
	allowed_tools = alist(
		1 = list("/obj/item/weapon/surgery/cautery",100),
		2 = list("/obj/item/weapon/surgery/cautery/bronze",85),
		3 = list("/obj/item/clothing/mask/smokable/cigarette/cigar",60),
		4 = list("/obj/item/flashlight/torch",75),
	)

	min_duration = 70
	max_duration = 100

	can_use(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		return ..() && target.op_stage.face > 0

	begin_step(mob/user, mob/living/human/target, target_zone, obj/item/tool)
		user.visible_message("[user] 正开始用\the [tool]烧灼[target]面部和颈部的切口." , \
		"You are beginning to cauterize the incision on [target]'s face and neck with \the [tool].")
		..()

	end_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'notice'>[user]用\the [tool]烧灼了[target]面部和颈部的切口.</span>", \
		"<span class = 'notice'>You cauterize the incision on [target]'s face and neck with \the [tool].</span>")
		affected.open = FALSE
		affected.status &= ~ORGAN_BLEEDING
		if (target.op_stage.face == 3)
			var/obj/item/organ/external/head/h = affected
			h.disfigured = FALSE
		target.op_stage.face = FALSE

	fail_step(mob/living/user, mob/living/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message("<span class = 'red'>[user]的手滑了,用\the [tool]在[target]的面部留下了一处小烧伤!</span>", \
		"<span class = 'red'>Your hand slips, leaving a small burn on [target]'s face with \the [tool]!</span>")
		target.apply_damage(4, BURN, affected)