
/obj/item/clothing/glasses
	var/toggleable = FALSE
	var/off_state = ""
	var/on_state = ""
	var/overtype = ""
	var/active = FALSE
	var/blocks_scope = FALSE

/obj/item/clothing/glasses/attack_self(mob/living/human/user)
	if(toggleable && !user.incapacitated())
		if(active)
			active = 0
			icon_state = off_state
			user.update_inv_eyes()
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			to_chat(usr, "你关闭了[src]上的光学瞄准镜.")
			if (overtype == "nvg")
				user.nvg = FALSE
				restricts_view = 0
				blocks_scope = FALSE
				user.handle_vision()
			else if (overtype == "thermal")
				user.thermal = FALSE
				restricts_view = 0
				blocks_scope = FALSE
				user.handle_vision()
		else if (src == user.eyes)
			active = 1
			icon_state = on_state
			user.update_inv_eyes()
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			to_chat(usr, "你开启了[src]上的光学瞄准镜.")
			if (overtype == "nvg")
				user.nvg = TRUE
				restricts_view = 1
				blocks_scope = TRUE
				user.handle_vision()
			else if (overtype == "thermal")
				user.thermal = TRUE
				restricts_view = 1
				blocks_scope = TRUE
				user.handle_vision()
		else
			active = 0
			icon_state = off_state
			user.update_inv_eyes()
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			if (overtype == "nvg")
				user.nvg = FALSE
				restricts_view = 0
				blocks_scope = FALSE
				user.handle_vision()
			else if (overtype == "thermal")
				user.thermal = FALSE
				restricts_view = 0
				blocks_scope = FALSE
				user.handle_vision()
		user.update_action_buttons()

/obj/item/clothing/glasses/verb/toggle()
	set name = "Toggle"
	set category = null
	set src in usr
	if (!toggleable)
		return
	else
		attack_self(usr)
		return

/obj/item/clothing/glasses/AltClick()
	..()
	toggle()

/obj/item/clothing/glasses/eyepatch
	name = "眼罩"
	desc = "呀哈."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = FALSE
	flags = FALSE

/obj/item/clothing/glasses/monocle
	name = "单片眼镜"
	desc = "多么时髦的镜片啊!"
	icon_state = "monocle"
	item_state = "headset" // lol
	body_parts_covered = FALSE

/obj/item/clothing/glasses/regular
	name = "处方眼镜"
	desc = "由书呆子公司制造."
	icon_state = "glasses"
	item_state = "glasses"
	body_parts_covered = FALSE

/obj/item/clothing/glasses/regular/hipster
	name = "处方眼镜"
	desc = "由不酷公司制造."
	icon_state = "hipster_glasses"
	item_state = "hipster_glasses"

/obj/item/clothing/glasses/regular/circle
	name = "圆框眼镜"
	desc = "由不酷公司制造."
	icon_state = "circle_glasses"
	item_state = "circle_glasses"

/obj/item/clothing/glasses/gglasses
	name = "绿色眼镜"
	desc = "森林绿色的眼镜,就像你在策划阴谋时戴的那种."
	icon_state = "gglasses"
	item_state = "gglasses"
	body_parts_covered = FALSE

/obj/item/clothing/glasses/sunglasses
	desc = "一种奇怪的古老技术,用于提供基本的眼部防护.强化镜片可以阻挡致命的太阳射线."
	name = "太阳镜"
	icon_state = "sun"
	item_state = "sunglasses"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE
	body_parts_covered = FALSE

/obj/item/clothing/glasses/redglasses
	desc = "一副看起来像是60年代的眼镜,太酷了宝贝."
	name = "红色复古眼镜"
	icon_state = "redlense"
	item_state = "redlense"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/blueglasses
	desc = "一副看起来像是60年代的眼镜,太酷了宝贝."
	name = "蓝色复古眼镜"
	icon_state = "bluelense"
	item_state = "bluelense"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/greenglasses
	desc = "一副看起来像是60年代的眼镜,太酷了宝贝."
	name = "绿色复古眼镜"
	icon_state = "greenlense"
	item_state = "greenlense"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/yellowglasses
	desc = "一副看起来像是60年代的眼镜,太酷了宝贝."
	name = "黄色复古眼镜"
	icon_state = "yellowlense"
	item_state = "yellowlense"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisorred
	desc = "一个看起来像是80年代的单镜片面罩,看起来有点未来感."
	name = "红色单镜面罩"
	icon_state = "univisor_r"
	item_state = "univisor_r"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisorcyan
	desc = "一个看起来像是80年代的单镜片面罩,看起来有点未来感."
	name = "青色单镜面罩"
	icon_state = "univisor_c"
	item_state = "univisor_c"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisorgreen
	desc = "一个看起来像是80年代的单镜片面罩,看起来有点未来感."
	name = "绿色单镜面罩"
	icon_state = "univisor_g"
	item_state = "univisor_g"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisoryellow
	desc = "一个看起来像是80年代的单镜片面罩,看起来有点未来感."
	name = "黄色单镜面罩"
	icon_state = "univisor_y"
	item_state = "univisor_y"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisorwhite
	desc = "一个看起来像是80年代的单镜片面罩,有点未来感."
	name = "白色单镜片面罩"
	icon_state = "univisor_w"
	item_state = "univisor_w"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/univisorflashy
	desc = "一个看起来像是80年代的单镜片面罩,有点未来感."
	name = "炫彩单镜片面罩"
	icon_state = "univisor_flashy"
	item_state = "univisor_flashy"
	darkness_view = -1
	body_parts_covered = FALSE

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "眼罩"
	desc = "遮住眼睛,阻挡视线."
	icon_state = "blindfold"
	item_state = "blindfold"
	tint = TINT_BLIND

/obj/item/clothing/glasses/sunglasses/large
	desc = "奇怪的古老科技,用于提供基本的眼部遮盖.强化护盾可以阻挡许多闪光."
	name = "大号太阳镜"
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MAJOR
	body_parts_covered = FALSE

/obj/item/clothing/glasses/tactical_goggles
	name = "护目镜"
	desc = "标准战斗护目镜."
	icon_state = "tactical_goggles"
	item_state = "tactical_goggles"
	body_parts_covered = FALSE

/obj/item/clothing/glasses/tactical_goggles/ballistic
	name = "防弹护目镜"
	desc = "标准防弹战斗护目镜,保护你的眼睛免受弹片伤害."
	icon_state = "tactical_goggles"
	item_state = "tactical_goggles"
	body_parts_covered = EYES
	armor = list(melee = 15, arrow = 90, gun = 25, energy = 15, bomb = 25, bio = 20, rad = 20)