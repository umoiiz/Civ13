/obj/item/clothing/mask/muzzle
	name = "口套"
	desc = "为了阻止那可怕的噪音."
	icon_state = "muzzle"
	item_state = "muzzle"
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	voicechange = TRUE
	heat_protection = 0

/obj/item/clothing/mask/muzzle/tape
	name = "一段胶带"
	desc = "这是一个结实的自制口套!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/mask/muzzle/New()
	..()
	say_messages = list("Mmfph!", "Mmmf mrrfff!", "Mmmf mnnf!")
	say_verbs = list("mumbles", "says")

// Clumsy folks can't take the mask off themselves.
/obj/item/clothing/mask/muzzle/attack_hand(mob/user as mob)
	if (user.wear_mask == src && !user.IsAdvancedToolUser())
		return FALSE
	..()

/obj/item/clothing/mask/plaguedoctor //ye olde gasmask for quacks.
	name = "瘟疫医生面具"
	desc = "一个新冠形状的面具,里面塞满了草药,以更好地抵御瘴气和瘟疫."
	icon_state = "plaguedoctor"
	item_state = "plaguedoctor"
	flags_inv = HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_SMALL
	blocks_scope = TRUE
	armor = list(melee = 15, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 45, rad = FALSE)
	restricts_view = 1

/obj/item/clothing/mask/sterile
	name = "无菌口罩"
	desc = "一种薄薄的外科口罩,由医疗专业人员佩戴,以阻止疾病的传播或传染."
	icon_state = "sterile"
	item_state = "sterile"
	body_parts_covered = FACE
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = FALSE, bomb = FALSE, bio = 75, rad = 5)
	w_class = ITEM_SIZE_TINY
	var/toggled = FALSE
/obj/item/clothing/mask/sterile/verb/toggle()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/mask/sterile)
		return
	else
		if (toggled)
			item_state = "sterile"
			icon_state = "sterile"
			item_state_slots["slot_mask"] = "sterile"
			to_chat(usr, "<span class = 'danger'>你戴上了你的面具.</span>")
			toggled = FALSE
			update_clothing_icon()
		else if (!toggled)
			body_parts_covered = null
			item_state = "sterile_down"
			icon_state = "sterile_down"
			item_state_slots["slot_mask"] = "sterile_down"
			to_chat(usr, "<span class = 'danger'>你放下了你的面具护片.</span>")
			toggled = TRUE
			update_clothing_icon()