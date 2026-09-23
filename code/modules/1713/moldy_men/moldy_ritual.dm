/obj/item/weapon/moldy_ritual
	name = "盛大仪式卷轴"
	desc = "一卷古老的、布满霉菌的卷轴.大声朗读它将召唤出霉巫王."
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "scroll_summon"
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/moldy_ritual/attack_self(mob/living/user)
	if (!istype(user) || !user || user.stat)
		return

	var/obj/map_metadata/wizard_boy/W = map
	if (!istype(W) || !W.sabotage)
		to_chat(user, "<span class='warning'>卷轴化为灰烬.星辰尚未归位.</span>")
		qdel(src)
		return

	if (!W.sabotage.ritual_unlocked || W.sabotage.ritual_completed)
		to_chat(user, "<span class='warning'>卷轴化为灰烬.仪式已经完成过了.</span>")
		qdel(src)
		return

	if (!(user.client && (user.client.ckey in W.sabotage.member_ckeys)))
		to_chat(user, "<span class='warning'>卷轴化为灰烬.你不配.</span>")
		qdel(src)
		return

	to_chat(user, "<span class='notice'>你开始吟唱古老的咒语...</span>")

	if (do_after(user, 10 SECONDS))
		W.sabotage.complete_ritual(user)
		qdel(src)
	else
		to_chat(user, "<span class='warning'>你的吟唱被打断了!</span>")
