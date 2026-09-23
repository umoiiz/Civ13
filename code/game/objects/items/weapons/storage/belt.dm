/obj/item/weapon/storage/belt
	name = "腰带"
	desc = "可以容纳各种东西."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	storage_slots = 7
	max_w_class = 3
	max_storage_space = 28
	slot_flags = SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")

	var/show_above_suit = FALSE
	var/obj/item/weapon/storage/belt/keychain/keychain = null

/obj/item/weapon/storage/belt/verb/toggle_layer()
	set name = "Switch Belt Layer"
	set category = null

	if (show_above_suit == -1)
		to_chat(usr, "<span class='notice'>\The [src]不能穿戴在你的制服外面!</span>")
		return
	show_above_suit = !show_above_suit
	update_icon()

/obj/item/weapon/storage/update_icon()
	if (ismob(loc))
		var/mob/M = loc
		M.update_inv_belt()

/obj/item/weapon/storage/belt/press
	name = "压带"

/obj/item/weapon/storage/belt/press/New()
	..()
	new /obj/item/weapon/pen(src)
	new /obj/item/camera_film(src)
	new /obj/item/camera_film(src)
	new /obj/item/weapon/clipboard/full(src)
	new /obj/item/weapon/reagent_containers/spray/pepper(src)
	new /obj/item/camera/coldwar(src)
	new /obj/item/weapon/storage/box/firstaid(src)
	new /obj/item/weapon/telephone/mobile(src)

/obj/item/weapon/storage/belt/tactical
	name = "战斗腰带"
	storage_slots = 8
	max_w_class = 3
	max_storage_space = 28

/obj/item/weapon/storage/belt/security
	name = "安保腰带"
	icon_state = "security"
	item_state = "security"
	storage_slots = 9
	max_w_class = 3
	max_storage_space = 34

/obj/item/weapon/storage/belt/medical
	name = "医疗腰带"
	can_hold = list(
		/obj/item/stack/medical,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/weapon/doctor_handbook,
		/obj/item/weapon/surgery,
		)

/obj/item/weapon/storage/belt/medical/full_vc/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint/medic(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/advanced/sulfa(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/weapon/doctor_handbook(src)
	new /obj/item/weapon/storage/pill_bottle/pervitin(src)

/obj/item/weapon/storage/belt/medical/full_us/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint/medic(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)
	new /obj/item/stack/medical/advanced/ointment(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/weapon/doctor_handbook(src)
	new /obj/item/weapon/storage/pill_bottle/tramadol(src)


/obj/item/weapon/storage/belt/utility
	name = "工具腰带" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "可以容纳各种工具."
	icon_state = "utilitybelt"
	item_state = "utility"
	can_hold = list(
		///obj/item/weapon/combitool,
		/obj/item/weapon/crowbar/prybar,
		/obj/item/weapon/hammer,
		/obj/item/weapon/wirecutters/boltcutters,
		/obj/item/weapon/wrench,
		/obj/item/flashlight,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/material/thrown/kunai_normal,
		/obj/item/weapon/material/thrown/throwing_knife,
		/obj/item/weapon/material/thrown/tomahawk,
		/obj/item/weapon/material/thrown/throwing_axe,
		/obj/item/weapon/reagent_containers/glass/fire_extinguisher,
		/obj/item/flashlight/flashlight,
		/obj/item/weapon/weldingtool,
		/obj/item/weapon/material/shovel/trench)

/obj/item/weapon/storage/belt/utility/sapper/New()
	..()
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/crowbar/prybar(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/wirecutters/boltcutters(src)
	new /obj/item/weapon/hammer(src)
	new /obj/item/weapon/material/hatchet/steel()
	new /obj/item/weapon/material/shovel/trench(src)

/obj/item/weapon/storage/belt/utility/full/New()
	..()
	new /obj/item/weapon/hammer(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/crowbar/prybar(src)
	new /obj/item/weapon/wirecutters/boltcutters(src)


/obj/item/weapon/storage/belt/security/tactical
	name = "战斗腰带"
	desc = "可以容纳手铐和闪光弹等安保装备, 带有更多小包以提供更多存储空间."
	icon_state = "swatbelt"
	item_state = "swatbelt"
	storage_slots = 9

/obj/item/weapon/storage/belt/leather
	name = "皮革挎包"
	desc = "可以容纳一些小东西, 比如餐具, 种子和食物."
	icon_state = "belt_satchel"
	item_state = "belt_holster"
	storage_slots = 9
	max_w_class = 2

/obj/item/weapon/storage/belt/leather/shaman
	storage_slots = 6
	max_w_class = 3
	max_storage_space = 12
	show_above_suit = TRUE

/obj/item/weapon/storage/belt/leather/shaman/New()
	..()
	new /obj/item/weapon/reagent_containers/food/snacks/grown/peyote(src)
	new /obj/item/flashlight/torch(src)
	new /obj/item/stack/medical/bruise_pack/bint/leather(src)
	new /obj/item/stack/material/rope(src)
	new /obj/item/weapon/material/handle(src)
	new /obj/item/weapon/material/kitchen/utensil/knife/bone(src)

/obj/item/weapon/storage/belt/leather/occinn

/obj/item/weapon/storage/belt/leather/occinn/New()
	..()
	new /obj/item/weapon/key/civ/inn(src)
	new /obj/item/weapon/key/civ/room1(src)
	new /obj/item/weapon/key/civ/room2(src)
	new /obj/item/weapon/key/civ/room3(src)
	new /obj/item/weapon/key/civ/room4(src)
	new /obj/item/weapon/storage/belt/keychain(src)


/obj/item/weapon/storage/belt/leather/farmer/New()
	..()
	new /obj/item/stack/farming/seeds/tomato(src)
	new /obj/item/stack/farming/seeds/potato(src)
	new /obj/item/stack/farming/seeds/hemp(src)
	new /obj/item/stack/farming/seeds/flax(src)

/obj/item/weapon/storage/belt/gator_belt //doesn't hold anything
	name = "鳄鱼皮腰带"
	desc = "一条纯装饰性的鳄鱼皮细腰带. 它没有口袋或用于挂载物品的附件"
	icon_state = "gator_belt"
	item_state = "gator_belt"
	storage_slots = 0
	max_w_class = 1
	max_storage_space = 0

/obj/item/weapon/storage/belt/throwing
	name = "投掷腰带"
	desc = "一条专为携带投掷武器而制作的腰带.."
	icon_state = "belt_satchel"
	item_state = "belt_holster"
	storage_slots = 12
	max_w_class = 1
	can_hold = list(
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/material/thrown/kunai_normal,
		/obj/item/weapon/material/thrown/throwing_knife,
		/obj/item/weapon/material/thrown/tomahawk,
		/obj/item/weapon/material/thrown/throwing_axe,
		)

/obj/item/weapon/storage/belt/throwing/ninja/New()
	..()
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/star(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)
	new /obj/item/weapon/material/thrown/kunai_normal(src)

/obj/item/weapon/storage/belt/tacpouches
	name = "战术小包"
	desc = "一条带有6个小包的腰带, 可以装入弹匣, 刀具和其他小东西."
	icon_state = "pouches"
	item_state = "pouches"
	storage_slots = 6
	max_w_class = 2

/obj/item/weapon/storage/belt/tacpouches/olive
	icon_state = "pouches_olive"
	item_state = "pouches_olive"
/obj/item/weapon/storage/belt/tacpouches/white
	icon_state = "pouches_white"
	item_state = "pouches_white"
/obj/item/weapon/storage/belt/tacpouches/green
	icon_state = "pouches_green"
	item_state = "pouches_green"

//full

/obj/item/weapon/storage/belt/tacpouches/command/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/weapon/foldable_shovel/trench/etool(src)
	new /obj/item/weapon/compass(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/tacpouches/srm/New()
	..()
	new /obj/item/ammo_magazine/srm(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/gun_cleaning_kit(src)
	new /obj/item/ammo_magazine/srm(src)
	new /obj/item/weapon/compass(src)
	new /obj/item/ammo_magazine/srm(src)

/obj/item/weapon/storage/belt/tacpouches/svd/New()
	..()
	new /obj/item/ammo_magazine/svd(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/gun_cleaning_kit(src)
	new /obj/item/ammo_magazine/svd(src)
	new /obj/item/weapon/compass(src)
	new /obj/item/ammo_magazine/svd(src)

/obj/item/weapon/storage/belt/tacpouches/utes/New()
	..()
	new /obj/item/ammo_magazine/ammo127(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/gun_cleaning_kit(src)
	new /obj/item/ammo_magazine/ammo127(src)
	new /obj/item/ammo_magazine/ammo127(src)
	new /obj/item/ammo_magazine/ammo127(src)

/obj/item/weapon/storage/belt/tacpouches/m249/New()
	..()
	new /obj/item/ammo_magazine/m249(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/ammo_magazine/m249(src)
	new /obj/item/ammo_magazine/m249(src)
	new /obj/item/ammo_magazine/m249(src)

/obj/item/weapon/storage/belt/tacpouches/hk/New()
	..()
	new /obj/item/ammo_magazine/scarh(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/grenade/coldwar/m67(src)
	new /obj/item/ammo_magazine/scarh(src)
	new /obj/item/ammo_magazine/scarh(src)
	new /obj/item/ammo_magazine/scarh(src)

/obj/item/weapon/storage/belt/tacpouches/m24/New()
	..()
	new /obj/item/ammo_magazine/m24(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/ammo_magazine/m24(src)
	new /obj/item/ammo_magazine/m24(src)
	new /obj/item/ammo_magazine/box_762x51(src)