/obj/item/clothing/under/fallout/ncr
	name = "NCR制服"
	desc = "NCR士兵作战服"
	icon_state = "ncr_fatigues"
	item_state = "ncr_fatigues"
	var/rolled = FALSE
	var/maskup = FALSE

/obj/item/clothing/under/fallout/ncr/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/fallout/ncr)
		return
	else
		if (!maskup)
			if (rolled)
				flags_inv = null
				item_state = "ncr_fatigues"
				icon_state = "ncr_fatigues"
				item_state_slots["w_uniform"] = "ncr_fatigues"
				to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			if (!rolled)
				flags_inv = null
				item_state = "ncr_fatigues_rolled"
				icon_state = "ncr_fatigues_rolled"
				item_state_slots["w_uniform"] = "ncr_fatigues_rolled"
				to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
				rolled = TRUE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
		else
			if (rolled)
				flags_inv = HIDEFACE
				item_state = "ncr_fatigues_maskup"
				icon_state = "ncr_fatigues_maskup"
				item_state_slots["w_uniform"] = "ncr_fatigues_maskup"
				to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			else
				flags_inv = HIDEFACE
				item_state = "ncr_fatigues_rolled_maskup"
				icon_state = "ncr_fatigues_rolled_maskup"
				item_state_slots["w_uniform"] = "ncr_fatigues_rolled_maskup"
				to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
				rolled = TRUE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
/obj/item/clothing/under/fallout/ncr/verb/adjust_mask()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/fallout/ncr)
		return
	else
		if (maskup)
			if (!rolled)
				item_state = "ncr_fatigues"
				icon_state = "ncr_fatigues"
				item_state_slots["w_uniform"] = "ncr_fatigues"
				to_chat(usr, "<span class = 'danger'>你放下你的面罩.</span>")
				maskup = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			else
				item_state = "ncr_fatigues_rolled"
				icon_state = "ncr_fatigues_rolled"
				item_state_slots["w_uniform"] = "ncr_fatigues_rolled"
				to_chat(usr, "<span class = 'danger'>你放下你的面罩.</span>")
				maskup = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
		else
			if (!rolled)
				item_state = "ncr_fatigues_maskup"
				icon_state = "ncr_fatigues_maskup"
				item_state_slots["w_uniform"] = "ncr_fatigues_maskup"
				to_chat(usr, "<span class = 'danger'>你抬起你的面罩.</span>")
				maskup = TRUE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return
			else
				item_state = "ncr_fatigues_maskup_rolled"
				icon_state = "ncr_fatigues_maskup_rolled"
				item_state_slots["w_uniform"] = "ncr_fatigues_maskup_rolled"
				to_chat(usr, "<span class = 'danger'>你抬起你的面罩.</span>")
				maskup = TRUE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return

/obj/item/clothing/under/fallout/ncr/New()
	..()
	update_clothing_icon()

/obj/item/clothing/shoes/heavyboots/wrappedboots/ncr
	name = "NCR缠裹靴"
	icon_state = "ncr_boots"
	armor = list(melee = 20, arrow = 10, gun = FALSE, energy = 25, bomb = 10, bio = 10, rad = 40)

/obj/item/clothing/gloves/fingerless/ncr
	name = "手部缠带"
	icon_state = "ncr_handwraps"
	item_state = "ncr_handwraps"

/obj/item/clothing/suit/armor/fallout/ncr
	name = "NCR士兵护甲"
	desc = "一件NCR装甲背心"
	icon_state = "ncr_armor"
	item_state = "ncr_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 40, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	flammable = TRUE
	slowdown = 0.1

/obj/item/clothing/head/helmet/fallout/ncr
	name = "士兵头盔"
	desc = "一顶典型的圆形钢盔."
	icon_state = "ncr_helmet"
	item_state = "ncr_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 43, arrow = 33, gun = 10, energy = 15, bomb = 44, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/fallout/ncr/goggles
	name = "护目镜头盔"
	desc = "一顶典型的圆形钢盔. 这顶附有一副摩托车护目镜."
	icon_state = "ncr_helmet_goggles"
	item_state = "ncr_helmet_goggles"
	var/goggles = FALSE

/obj/item/clothing/head/helmet/fallout/ncr/goggles/verb/adjust_goggles()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/fallout/ncr/goggles)
		return
	else
		if (goggles)
			item_state = "ncr_helmet_goggles"
			item_state_slots["slot_head"] = "ncr_helmet_goggles"
			to_chat(usr, "<span class = 'danger'>你调整你的护目镜.</span>")
			goggles = FALSE
		else if (!goggles)
			item_state = "ncr_helmet_goggles_down"
			item_state_slots["slot_head"] = "ncr_helmet_goggles_down"
			to_chat(usr, "<span class = 'danger'>你调整你的护目镜.</span>")
			goggles = TRUE
	update_clothing_icon()

/obj/item/clothing/head/helmet/fallout/ncr/goggles/down
	goggles = TRUE

/obj/item/clothing/head/helmet/fallout/ncr/goggles/down/New()
	..()
	update_clothing_icon()
	update_icon()

/obj/item/weapon/storage/belt/fallout/ncr
	name = "NCR士兵腰带"
	desc = "一条可以携带手枪, 弹药和其他物品的腰带."
	icon_state = "ncr_belt"
	item_state = "ncr_belt"
	storage_slots = 12
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material/kitchen/utensil/knife,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/material,
		/obj/item/flashlight,
		/obj/item/weapon/whistle
		)
/obj/item/weapon/storage/belt/fallout/ncr
/obj/item/weapon/storage/belt/fallout/ncr/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/service_rifle(src)
	new /obj/item/weapon/attachment/bayonet(src)
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/us(src)

/obj/item/clothing/head/fallout/ncr
	name = "NCR军官贝雷帽"
	desc = "一顶绿色迷彩贝雷帽,帽徽是新加州共和国的双头熊."
	icon_state = "ncr_beret"
	item_state = "ncr_beret"

/obj/item/clothing/head/fallout/ncr/recon
	name = "NCR第一侦察营贝雷帽"
	desc = "一顶红色贝雷帽,帽徽是新加州共和国第一侦察营."
	icon_state = "ncr_beret_recon"
	item_state = "ncr_beret_recon"



////////////////////////////////////////LEGION/////////////////////////////////////////////////
/obj/item/clothing/under/fallout/legionaire
	name = "军团士兵护甲"
	desc = "一件红色T恤和深色短裙,外罩皮革护甲.常为凯撒军团所穿."
	icon_state = "legionaire"
	item_state = "legionaire"
	armor = list(melee = 35, arrow = 33, gun = 8, energy = 15, bomb = 35, bio = 20, rad = FALSE)

/obj/item/clothing/shoes/heavyboots/wrappedboots/legion
	name = "军团士兵装甲靴"
	desc = "带有装甲板的黑色靴子."
	icon_state = "legion_boots"
	armor = list(melee = 20, arrow = 10, gun = FALSE, energy = 25, bomb = 10, bio = 10, rad = 40)

/obj/item/clothing/gloves/fingerless/legionaire
	name = "军团士兵裹手布"
	icon_state = "legion_handwraps"
	item_state = "legion_handwraps"

/obj/item/clothing/head/helmet/fallout/legionaire
	name = "军团士兵帽"
	desc = "一顶相当薄的皮革帽,带有护耳."
	icon_state = "legionaire"
	item_state = "legionaire"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 10, arrow = 2, gun = 0, energy = 15, bomb = 10, bio = 20, rad = FALSE)