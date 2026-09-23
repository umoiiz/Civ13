/obj/item/weapon/material/thrown
	chopping_speed = 4

/obj/item/weapon/material/thrown/star
	name = "手里剑"
	desc = "一块锋利, 重量完美的金属片."
	icon_state = "star"
	throwforce = 28
	force_divisor = 0.1 // 6 with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 15 with weight 20 (steel)
	throw_speed = 10
	throw_range = 15
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/star/New()
	..()
	pixel_x = rand(-12, 12)
	pixel_y = rand(-12, 12)

/obj/item/weapon/material/thrown/kunai_normal
	name = "苦无"
	desc = "某些忍者的工具."
	icon_state = "kunai_white"
	throwforce = 30
	force_divisor = 0.18 // 10? when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8
	throw_speed = 9
	throw_range = 13
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/kunai_normal/New()
	..()
	pixel_x = rand(-8, 8)
	pixel_y = rand(-8, 8)

/obj/item/weapon/material/thrown/throwing_knife
	name = "飞刀"
	desc = "一把平衡的投掷用刀."
	icon_state = "throwing_knife"
	throwforce = 34
	force_divisor = 0.30 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8
	throw_speed = 8
	throw_range = 12
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/throwing_knife/New()
	..()
	pixel_x = rand(-8, 8)
	pixel_y = rand(-8, 8)

/obj/item/weapon/material/thrown/tomahawk
	name = "战斧"
	desc = "一把用来投掷的斧头!"
	icon_state = "tomahawk"
	throwforce = 36
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8
	throw_speed = 6
	throw_range = 8
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/tomahawk/New()
	..()
	pixel_x = rand(-4, 4)
	pixel_y = rand(-4, 4)

/obj/item/weapon/material/thrown/throwing_axe
	name = "投掷斧"
	desc = "战斧的现代版本."
	icon_state = "throwing_axe"
	throwforce = 40
	force_divisor = 0.30 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8
	throw_speed = 6
	throw_range = 9
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/throwing_knife1
	name = "钢制飞刀"
	desc = "一把钢制飞刀."
	icon_state = "throwingknife1"
	throwforce = 40
	force_divisor = 0.30 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8
	throw_speed = 6
	throw_range = 9
	sharp = TRUE
	edge =  TRUE
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/thrown/throwing_axe/New()
	..()
	pixel_x = rand(-4, 4)
	pixel_y = rand(-4, 4)
