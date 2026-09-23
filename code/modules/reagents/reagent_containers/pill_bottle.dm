/*
 * Pill Bottles*
 * 
 * To-do: refactor the "for" statements into a proc
 */
/obj/item/weapon/storage/pill_bottle
	name = "药瓶"
	desc = "一个用于储存药物的密封容器."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical.dmi'
	item_state = "contsolid"
	w_class = ITEM_SIZE_SMALL
	can_hold = list(/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/dice,/obj/item/weapon/paper)
	allow_quick_gather = TRUE
	use_to_pickup = TRUE
	use_sound = null
	max_storage_space = 20
	var/pill_amount = 14

/obj/item/weapon/storage/pill_bottle/attackby(var/obj/item/I, var/mob/user)
	if (istype(I, /obj/item/weapon/pen))
		var/label = sanitize(input(user, "What do you want to label the pill bottle as?") as text, 50)
		name = label
		return TRUE
	return ..(I, user)

/obj/item/weapon/storage/pill_bottle/antitox
	name = "地洛文药丸瓶"
	desc = "含有用于对抗毒素的药丸."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/antitox(src)

/obj/item/weapon/storage/pill_bottle/paracetamol
	name = "扑热息痛药丸瓶"
	desc = "含有用于缓解轻度至中度疼痛的药丸."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/paracetamol(src)

/obj/item/weapon/storage/pill_bottle/penicillin
	name = "青霉素药丸瓶"
	desc = "一种抗生素. 对许多微生物疾病有效."

/obj/item/weapon/storage/pill_bottle/penicillin/New()
	..()
	for (var/i=1, i <= pill_amount, i++)
		new /obj/item/weapon/reagent_containers/pill/penicillin(src)

/obj/item/weapon/storage/pill_bottle/tramadol
	name = "曲马多药丸瓶"
	desc = "含有用于缓解疼痛的药丸."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/tramadol(src)

/obj/item/weapon/storage/pill_bottle/pervitin
	name = "佩尔维汀药丸瓶"
	desc = "含有甲基苯丙胺药丸."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/pervitin(src)

/obj/item/weapon/storage/pill_bottle/potassium_iodide
	name = "碘化钾药丸瓶"
	desc = "含有碘化钾药丸,用于治疗辐射中毒."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/potassium_iodide(src)

/obj/item/weapon/storage/pill_bottle/citalopram
	name = "西酞普兰药丸瓶"
	desc = "含有用于稳定患者情绪的药丸."

	New()
		..()
		for (var/i=1, i <= pill_amount, i++)
			new /obj/item/weapon/reagent_containers/pill/citalopram(src)
