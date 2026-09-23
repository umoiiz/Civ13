
/obj/structure/branch
	name = "树枝"
	desc = "一根还带着叶子的树枝。"
	icon = 'icons/obj/old_weapons.dmi'
	icon_state = "leaved_stick"
	density = FALSE
	anchored = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	flammable = TRUE
	var/leaves = TRUE
	var/branched = TRUE

/obj/structure/branch/cleared
	name = "清理过的树枝"
	desc = "一根摘光了所有叶子的树枝。"
	icon_state = "cleared_stick"
	leaves = FALSE

/obj/structure/branch/attack_hand(mob/living/human/H)
	if (H.a_intent == I_GRAB && leaves)
		to_chat(H, "你开始从树枝上摘叶子...")
		if (do_after(H, 60, src))
			if (src && leaves)
				var /obj/item/stack/material/leaf/dropleaves = new /obj/item/stack/material/leaf(get_turf(src))
				dropleaves.amount = 3
				dropleaves.update_strings()
				to_chat(H, "你从树枝上摘了一些叶子。")
				name = "cleared branch"
				desc = "A tree branch with all the leaves picked out."
				icon_state = "cleared_stick"
				leaves = FALSE
				return
		return
	else if (H.a_intent == I_HARM && !leaves && branched)
		to_chat(H, "你开始去除小细枝...")
		if (do_after(H, 60, src))
			if (src && branched)
				if (map.ID == MAP_WIZARD_BOY)
					new /obj/item/wand_part/pine_wood(get_turf(src))
				else
					new /obj/item/weapon/branch(get_turf(src))
				to_chat(H, "你清理完了木棍。")
				branched = FALSE
				qdel(src)
				return
		return
	else
		..()

/obj/item/weapon/branch
	name = "木棍"
	desc = "一根摘光了所有叶子和细小枝条的树枝。"
	icon_state = "debranched_stick"
	item_state = "debranched_stick"
	icon = 'icons/obj/old_weapons.dmi'
	force = 7
	attack_verb = list("hit","bashed","poked")
	sharp = FALSE
	edge = FALSE
	slot_flags = SLOT_BELT
	throw_speed = 7
	throw_range = 7
	allow_spin = FALSE
	value = 1
	cooldownw = 6
	flammable = TRUE
	var/sharpened = FALSE

	var/ants = FALSE

/obj/item/weapon/branch/attack_self(mob/living/human/user as mob)
	if (ants)
		to_chat(user, SPAN_NOTICE("You start licking some ants off the stick..."))
		if (do_after(user, 50, src))
			if (src && ants)
				to_chat(user, SPAN_NOTICE("You finish eating some ants."))
				icon_state = "sharpened_stick"
				ants = FALSE
				if (user.gorillaman)
					user.mood += 10
				else if (user.ant)
					user.mood -= 20
				else if (!user.orc && !user.crab)
					user.mood -= 10
				user.nutrition += 80
				return
	else
		..()

/obj/item/weapon/branch/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (W.edge && !sharpened)
		to_chat(user, "你开始削尖木棍...")
		if (do_after(user, 80, src))
			if (src && !sharpened)
				to_chat(user, "你削好了木棍.")
				name = "sharpened stick"
				desc = "A sharpened stick, to be used against bad apes."
				icon_state = "sharpened_stick"
				sharp = TRUE
				force = 14
				sharpened = TRUE
				return
		return
	else if (sharpened && istype(W, /obj/item/weapon/flint))
		var/obj/item/weapon/flint/F = W
		if (F.sharpened)
			to_chat(user, "你开始把燧石绑到木棍上...")
			if (do_after(user, 100, src))
				if (src && F && F.sharpened)
					to_chat(user, "你做好了燧石斧.")
					new/obj/item/weapon/material/hatchet/tribal/flint(user.loc)
					qdel(F)
					qdel(src)
					return
	else
		..()

/obj/item/weapon/branch/sharpened
	name = "削尖的木棍"
	desc = "一根削尖的木棍,用来对付坏猿猴."
	icon_state = "sharpened_stick"
	item_state = "sharpened_stick"
	sharp = TRUE
	force = 14
	sharpened = TRUE