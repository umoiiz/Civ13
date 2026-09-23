////////////////////////
////Pill Pack Define////
////////////////////////
/obj/item/weapon/pill_pack
	name = "药片包"
	desc = "装在无菌便携包中的药片."
	icon = 'icons/obj/surgery.dmi'
	w_class = ITEM_SIZE_TINY//Packed very effective
	icon_state = "pill_pack"
	var/pill_type = null
	var/pop_sound = 'sound/effects/pop_pill.ogg'

/obj/item/weapon/pill_pack/New()
	..()

	if (ispath(pill_type))
		for (var/i = TRUE to 6)
			new pill_type(src)

	update_icon()

/obj/item/weapon/pill_pack/attack_hand(mob/user as mob)
	if (user.get_inactive_hand() == src)
		if (contents.len > 0)
			if (pop_sound)
				playsound(loc, pop_sound, 50, TRUE)
			var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
			to_chat(user, "<span class='notice'>你从 [name] 中取出一片 [pill.name].</span>")
			user.put_in_active_hand(pill)
			update_icon()
		else
			to_chat(user, "<span class='warning'>它是空的!</span>")
	else
		..()

/obj/item/weapon/pill_pack/attack_self(mob/user as mob)
	if (contents.len > 0)
		var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
		if (pop_sound)
			playsound(loc, pop_sound, 50, TRUE)
		to_chat(user, "<span class='notice'>你从 [name] 中取出一片 [pill.name].</span>")
		pill.loc = user.loc
		update_icon()
	else
		to_chat(user, "<span class='warning'>[name] 是空的!</span>")

/obj/item/weapon/pill_pack/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"

//////////////////
////Pill Packs////
//////////////////
/obj/item/weapon/pill_pack/antitox
	name = "抗毒素药片包"
	desc = "清除血液中的毒素和毒物."
	pill_type = /obj/item/weapon/reagent_containers/pill/antitox

/obj/item/weapon/pill_pack/tramadol
	name = "曲马多药片包"
	desc = "有效的止痛药."
	pill_type = /obj/item/weapon/reagent_containers/pill/tramadol

/obj/item/weapon/pill_pack/antimalaria
	name = "抗疟疾药片包"
	desc = "有效治疗疟疾."
	pill_type = /obj/item/weapon/reagent_containers/pill/antimalaria


/obj/item/weapon/pill_pack/adrenaline
	name = "肾上腺素药片包"
	desc = "防止因疼痛休克而死亡."
	pill_type = /obj/item/weapon/reagent_containers/pill/adrenaline
/*
/obj/item/weapon/pill_pack/adminordrazine
	name = "adminordrazine pill pack"
	desc = "Where did you even get that?"
	pill_type = /obj/item/weapon/reagent_containers/pill/adminordrazine
*/
/obj/item/weapon/pill_pack/pervitin
	name = "苯丙胺药片包"
	desc = "强效兴奋剂. 不要服用超过一片."
	pill_type = /obj/item/weapon/reagent_containers/pill/pervitin

/obj/item/weapon/pill_pack/potassium_iodide
	name = "碘化钾药片包"
	desc = "用于辐射紧急情况."
	pill_type = /obj/item/weapon/reagent_containers/pill/potassium_iodide

/obj/item/weapon/pill_pack/aspirin
	name = "阿司匹林药片包"
	desc = "又称乙酰水杨酸. 轻度止痛药."
	pill_type = /obj/item/weapon/reagent_containers/pill/aspirin

/obj/item/weapon/pill_pack/paracetamol
	name = "对乙酰氨基酚药片包"
	desc = "又称醋氨酚. 中度止痛药."
	pill_type = /obj/item/weapon/reagent_containers/pill/paracetamol

/obj/item/weapon/pill_pack/sal_acid
	name = "水杨酸药片包"
	desc = "促进瘀伤愈合, 过量服用会加重现有瘀伤."
	pill_type = /obj/item/weapon/reagent_containers/pill/sal_acid // TO-DO: Merge aspirin and salicyclic acid together. Salicyclic acid is more of a dermatological treatment in real life.

/obj/item/weapon/pill_pack/diclofenac
	name = "双氯芬酸药片包"
	desc = "双氯芬酸是一种减轻肿胀、疼痛并有助于恢复的药物. 过量服用会造成严重的钝击伤害."
	pill_type = /obj/item/weapon/reagent_containers/pill/diclofenac

/obj/item/weapon/pill_pack/procrit
	name = "普罗克里特药片"
	desc = "普罗克里特是一种人造药物,能帮助你的身体产生红细胞,从而恢复你的血液,过量服用会使人虚弱并产生幻觉."
	pill_type = /obj/item/weapon/reagent_containers/pill/procrit
