
/obj/item/clothing/shoes/jackboots
	name = "长筒军靴"
	desc = "为战斗或恶劣环境设计的军用风格靴子."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = 0
	armor = list(melee = 30, arrow = 20, gun = 5, energy = 15, bomb = 20, bio = FALSE, rad = FALSE)
	siemens_coefficient = 0.7
	can_hold_knife = TRUE
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/jackboots/modern
	icon_state = "jackboots2"
	item_state = "jackboots2"

/obj/item/clothing/shoes/jackboots/brown
	icon_state = "brownboots"
	item_state = "brownboots"

/obj/item/clothing/shoes/workboots
	name = "工作靴"
	desc = "一双为工业环境使用而设计的钢头工作靴.安全第一."
	icon_state = "workboots"
	item_state = "workboots"
	armor = list(melee = 40, arrow = FALSE, gun = FALSE, energy = 15, bomb = 20, bio = FALSE, rad = 20)
	siemens_coefficient = 0.7
	can_hold_knife = TRUE
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE