/obj/item/clothing/shoes/
	force = 1
/obj/item/clothing/shoes/black
	name = "黑色鞋子"
	icon_state = "black"
	desc = "一双黑色鞋子."
	body_parts_covered = FEET
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/heavyboots
	name = "\improper 军用靴"
	desc = "当你想火力全开的时候."
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 30, gun = 10, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/swat
	name = "特警靴"
	desc = "当你想要火力全开的时候。"
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 30, gun = 10, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/combat
	name = "作战靴"
	desc = "当你真的想要火力全开的时候"
	icon_state = "swat"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 30, gun = 10, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/iogboots
	name = "IOG靴"
	desc = "当你真的想要火力全开的时候。"
	icon_state = "iogboot"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 70, gun = 50, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	body_parts_covered = FEET
	flags = CONDUCT
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = FEET
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/iogboots/black
	name = "作战靴"
	desc = "结实的军用鞋具。"

/obj/item/clothing/shoes/sandal
	desc = "一双相当朴素的木制凉鞋。"
	name = "凉鞋"
	icon_state = "sandals"
	item_state = "wizard"
	species_restricted = null
	body_parts_covered = FALSE

/obj/item/clothing/shoes/sandal/leather
	name = "凉鞋"
	desc = "一双简单的细皮带凉鞋。只覆盖脚的下部。"

/obj/item/clothing/shoes/sandal/marisa
	desc = "一双魔法黑鞋。"
	name = "魔法鞋"
	icon_state = "black"

/obj/item/clothing/shoes/slippers
	name = "兔子拖鞋"
	desc = "毛茸茸的!"
	icon_state = "slippers"
	item_state = "slippers"
	force = FALSE
	species_restricted = null
	w_class = ITEM_SIZE_SMALL
	body_parts_covered = FEET
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/slippers_worn
	name = "穿旧的兔子拖鞋"
	desc = "毛茸茸的..."
	icon_state = "slippers_worn"
	item_state = "slippers_worn"
	force = FALSE
	w_class = ITEM_SIZE_SMALL
	body_parts_covered = FEET
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/laceup
	name = "系带鞋"
	desc = "时尚的巅峰,而且已经预先擦亮了!"
	icon_state = "laceups"
	item_state = "laceups"
	body_parts_covered = FEET
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/laceup/brown
	name = "棕色系带鞋"
	desc = "时尚的巅峰,而且已经预先擦亮了!"
	icon_state = "brown_laceups"
	item_state = "brown_laceups"

/obj/item/clothing/shoes/laceup/grey
	name = "灰色系带鞋"
	desc = "时尚的巅峰,而且已经预先擦亮了!"
	icon_state = "grey_laceups"
	item_state = "grey_laceups"

/obj/item/clothing/shoes/laceup/white
	name = "白色系带鞋"
	desc = "时尚的巅峰,而且已经预先擦亮了!"
	icon_state = "white_laceups"
	item_state = "white_laceups"

/obj/item/clothing/shoes/gator_laceup
	name = "鳄鱼鳞系带鞋"
	desc = "奢华鞋具的巅峰,而且已经预先擦亮了!"
	icon_state = "gator_laceups"
	item_state = "gator_laceups"
	body_parts_covered = FEET

/obj/item/clothing/shoes/leather
	name = "皮鞋"
	desc = "一双结实的皮鞋。"
	icon_state = "leather"
	item_state = "leather"
	body_parts_covered = FEET
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE