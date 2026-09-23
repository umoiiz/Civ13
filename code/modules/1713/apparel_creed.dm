/obj/item/clothing/shoes/creed
	name = "刺客靴"
	desc = "刺客穿着的皮靴."
	icon_state = "ac_boots"
	item_state = "ac_boots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 15, arrow = 10, gun = FALSE, energy = 8, bomb = 15, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/creed
	name = "刺客衬衫"
	desc = "刺客的白色衬衫."
	icon_state = "ac_shirt"
	item_state = "ac_shirt"


/obj/item/clothing/suit/armor/creed
	name = "刺客护甲"
	desc = "刺客穿着的皮甲."
	icon_state = "ac_armor"
	item_state = "ac_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 65, arrow = 80, gun = 10, energy = 15, bomb = 40, bio = 20, rad = 10)
	value = 45
	slowdown = 0.2
	health = 42
	var/adjusted = FALSE

/obj/item/clothing/suit/armor/creed/verb/toggle_hood()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/suit/armor/creed)
		return
	else
		if (adjusted)
			item_state = "ac_armor"
			item_state_slots["slot_w_uniform"] = "ac_armor"
			to_chat(usr, "<span class = 'danger'>你放下了护甲的兜帽.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "ac_armor_hood"
			item_state_slots["slot_w_uniform"] = "ac_armor_hood"
			to_chat(usr, "<span class = 'danger'>你拉起了护甲的兜帽.</span>")
			body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/suit/armor/creed/three
	name = "刺客护甲"
	desc = "刺客穿着的皮甲."
	icon_state = "ac_armor_1713"
	item_state = "ac_armor_1713"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	value = 45
	slowdown = 0.2
	health = 42
	adjusted = FALSE

/obj/item/clothing/suit/armor/creed/toggle_hood()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/suit/armor/creed/three)
		return
	else
		if (adjusted)
			item_state = "ac_armor_1713"
			item_state_slots["slot_w_uniform"] = "ac_armor_1713"
			to_chat(usr, "<span class = 'danger'>你放下了护甲的兜帽.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "ac_armor_1713_hood"
			item_state_slots["slot_w_uniform"] = "ac_armor_1713_hood"
			to_chat(usr, "<span class = 'danger'>你拉起了护甲的兜帽.</span>")
			body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/suit/armor/creed/unity
	name = "刺客护甲"
	desc = "刺客穿着的皮甲."
	icon_state = "ac_armor_napol"
	item_state = "ac_armor_napol"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	value = 45
	slowdown = 0.2
	health = 42
	adjusted = FALSE

/obj/item/clothing/suit/armor/creed/unity/toggle_hood()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/suit/armor/creed/unity)
		return
	else
		if (adjusted)
			item_state = "ac_armor_napol"
			item_state_slots["slot_w_uniform"] = "ac_armor_napol"
			to_chat(usr, "<span class = 'danger'>你放下了护甲的兜帽.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "ac_armor_napol_hood"
			item_state_slots["slot_w_uniform"] = "ac_armor_napol_hood"
			to_chat(usr, "<span class = 'danger'>你拉起了护甲的兜帽.</span>")
			body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/gloves/creed
	name = "刺客护手"
	desc = "一对带有隐藏刀刃的刺客护手."
	icon_state = "ac_gauntlets"
	item_state = "ac_gauntlets"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 20, arrow = 40, gun = 10, energy = 8, bomb = 15, bio = 10, rad = 5)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	health = 25

/obj/item/clothing/head/creed
	name = "刺客兜帽"
	desc = "用来遮盖头部的兜帽."
	icon_state = "ac_hood"
	item_state = "ac_hood"
	var/hood = FALSE

/obj/item/clothing/head/creed/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"
	if (hood)
		icon_state = "ac_hood"
		item_state = "ac_hood"
		flags_inv = initial(flags_inv)
		body_parts_covered = initial(body_parts_covered)
		item_state_slots["slot_wear_suit"] = "ac_hood"
		to_chat(usr, "<span class = 'danger'>你摘下了兜帽.</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		return
	else if (!hood)
		icon_state = "ac_hood_up"
		item_state = "ac_hood_up"
		flags_inv = BLOCKHAIR|HIDEFACE
		body_parts_covered = HEAD|FACE
		item_state_slots["slot_wear_suit"] = "ac_hood_up"
		to_chat(usr, "<span class = 'danger'>你用兜帽遮住了头部.</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		return