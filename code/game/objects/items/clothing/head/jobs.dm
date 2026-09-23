
//Bartender
/obj/item/clothing/head/chefhat
	name = "厨师帽"
	desc = "厨师用来防止头发掉进食物里的帽子. 从食堂的饭菜来看, 它们没什么用."
	icon_state = "chefhat"
	item_state = "chefhat"

//Captain
/obj/item/clothing/head/caphat
	name = "船长帽"
	icon_state = "captain"
	desc = "当国王的感觉真好."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = FALSE

/obj/item/clothing/head/caphat/cap
	name = "舰长帽"
	desc = "你害怕戴上它, 因为它会带来疏忽之罪."
	icon_state = "capcap"

/obj/item/clothing/head/caphat/formal
	name = "阅兵帽"
	desc = "任何身居指挥职位的人都不该没有一顶完美、洁白、象征至高权威的帽子."
	icon_state = "officercap"

//HOP
/obj/item/clothing/head/caphat/hop
	name = "船员资源帽"
	desc = "一顶时尚的帽子, 既能保护你免受愤怒的前船员伤害, 又能给你一种虚假的权威感."
	icon_state = "hopcap"

//Chaplain // Nuns & Plague Doctor -> relocated to apparel medieval
/obj/item/clothing/head/chaplain_hood
	name = "传教士头巾"
	desc = "用来遮住头部的头巾."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/under/chaplain
	name = "传教士服装"
	desc = "典型的牧师服装."
	icon_state = "chaplain"

/obj/item/clothing/suit/storage/jacket/chaplain
	name = "传教士长袍"
	desc = "典型的牧师长袍."
	icon_state = "chaplain_hoodie"


/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "焊接头盔"
	desc = "一种戴在头上的面罩, 旨在完全保护佩戴者免受电弧眼伤害."
	icon_state = "welding"
	flags = CONDUCT
	item_state_slots = list(
		slot_l_hand_str = "welding",
		slot_r_hand_str = "welding",
		)
	matter = list(DEFAULT_WALL_MATERIAL = 3000, "glass" = 1000)
	var/up = FALSE
	armor = list(melee = 10, bullet = FALSE, laser = FALSE,energy = FALSE, bomb = FALSE, bio = FALSE, rad = FALSE)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	action_button_name = "Flip Welding Mask"
	siemens_coefficient = 0.9
	w_class = ITEM_SIZE_NORMAL
	var/base_state
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY

/obj/item/clothing/head/welding/attack_self()
	if (!base_state)
		base_state = icon_state
	toggle()


/obj/item/clothing/head/welding/verb/toggle()
	set category = null
	set name = "Adjust welding mask"
	set src in usr

	if (usr.canmove && !usr.stat && !usr.restrained())
		if (up)
			up = !up
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			icon_state = base_state
			usr.visible_message("<span class = 'notice'>[usr]将[src]翻下.</span>", "<span class = 'notice'>你将[src]翻下来保护眼睛.") // Only the user would know why they flipped the welding mask down, niche for biche.
		else
			up = !up
			body_parts_covered &= ~(EYES|FACE)
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "[base_state]up"
			usr.visible_message("<span class = 'notice'>[usr]将[src]翻上.</span>", "<span class = 'notice'>你将[src]翻上去.") // Visual + Textual confirmation would make this no reason to be long, as conversation will move on.
		update_clothing_icon()	//so our mob-overlays
		usr.update_action_buttons()
