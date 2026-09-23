/obj/item/weapon/prosthesis
	name = "假肢"
	desc = "用于替换缺失的肢体."
	icon = 'icons/mob/human_races/masks/prosthesis.dmi'
	icon_state = "pegleg"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	item_state = "crowbar"
	w_class = ITEM_SIZE_NORMAL

	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")
	var/limb_type = "none"
	flags = FALSE

/obj/item/weapon/prosthesis/pegleg
	name = "木制假腿"
	desc = "一个简单的木制假腿,用于替换缺失的腿."
	icon_state = "pegleg"
	limb_type = "leg"
	flammable = TRUE

/obj/item/weapon/prosthesis/woodfoot
	name = "木制假脚"
	desc = "一个简单的木制鞋,用于替换缺失的脚."
	icon_state = "woodfoot"
	limb_type = "foot"
	flammable = TRUE

/obj/item/weapon/prosthesis/attack(mob/living/human/C as mob, mob/living/human/user as mob)
	if (user.a_intent != I_HELP)
		return ..()

	if (user.getStatCoeff("medical") < 1.5)
		to_chat(user, "你的医疗技能太低,无法进行如此复杂的手术!")
		return
	
	var/mod = 1
	if (user.religious_clergy == "Shamans")
		mod = 2
	switch (limb_type)
		if ("leg")
			var/obj/item/organ/external/GR = C.get_organ("groin")
			if (GR.is_stump())
				to_chat(user, "整个下半身都缺失了!你没有地方可以连接\the [src]!")
				return
			var/obj/item/organ/external/LL = C.get_organ("l_leg")
			var/obj/item/organ/external/RL = C.get_organ("r_leg")
			if ((LL && LL.is_stump() && LL.prosthesis == FALSE || !LL))
				visible_message("[user]开始将\the [src]连接到[C]的左腿残端...","你开始将\the [src]连接到[C]的左腿残端...")
				if (do_after(user, 150*user.getStatCoeff("medical"), C))
					if (!LL)
						return
					visible_message("[user]完成了将\the [src]连接到[C]的左腿残端.","你完成了将\the [src]连接到[C]的左腿残端.")
					LL.prosthesis = TRUE
					LL.prosthesis_type = icon_state
					C.update_mutations(1)
					user.adaptStat("medical", 4*mod)
					qdel(src)
				return
			else if ((RL && RL.is_stump() && RL.prosthesis == FALSE || !RL))
				visible_message("[user]开始将\the [src]连接到[C]的右腿残端...","你开始将\the [src]连接到[C]的右腿残端...")
				if (do_after(user, 150*user.getStatCoeff("medical"), C))
					visible_message("[user]完成了将\the [src]连接到[C]的右腿残端.","你完成了将\the [src]连接到[C]的右腿残端.")
					RL.prosthesis = TRUE
					RL.prosthesis_type = icon_state
					C.update_mutations(1)
					user.adaptStat("medical", 4*mod)
					qdel(src)
				return
		if ("foot")
			var/obj/item/organ/external/LL = C.get_organ("l_leg")
			var/obj/item/organ/external/RL = C.get_organ("r_leg")
			if ((RL && RL.is_stump() && RL.prosthesis == FALSE) || !RL)
				if ((LL && LL.is_stump() && LL.prosthesis == FALSE) || !LL)
					to_chat(user, "双腿都缺失了!没有地方可以连接[src]!")
					return

			var/obj/item/organ/external/LF = C.get_organ("l_foot")
			var/obj/item/organ/external/RF = C.get_organ("r_foot")
			if (LF && LF.is_stump() && LF.prosthesis == FALSE && !LL.is_stump())
				visible_message("[user]开始将\the [src]连接到[C]的左脚残端...","你开始将\the [src]连接到[C]的左脚残端...")
				if (do_after(user, 130*user.getStatCoeff("medical"), C))
					visible_message("[user]完成了将\the [src]连接到[C]的左脚残端.","你完成了将\the [src]连接到[C]的左脚残端.")
					LF.prosthesis = TRUE
					LF.prosthesis_type = icon_state
					C.update_mutations(1)
					user.adaptStat("medical", 3*mod)
					qdel(src)
				return
			else if (RF && RF.is_stump() && RF.prosthesis == FALSE && !RL.is_stump())
				visible_message("[user]开始将\the [src]连接到[C]的右脚残端...","你开始将\the [src]连接到[C]的右脚残端...")
				if (do_after(user, 130*user.getStatCoeff("medical"), C))
					visible_message("[user]完成了将\the [src]连接到[C]的右脚残端.","你完成了将\the [src]连接到[C]的右脚残端.")
					RF.prosthesis = TRUE
					RF.prosthesis_type = icon_state
					C.update_mutations(1)
					user.adaptStat("medical", 3*mod)
					qdel(src)
				return