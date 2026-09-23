
/* backpack.dm*/

/obj/item/weapon/storage/backpack
	name = "背包"
	desc = "你把它背在背上, 然后把物品放进去."
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_backpacks.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_backpacks.dmi',
		)
	icon_state = "backpack"
	base_icon = "backpack"
	item_state = "backpack"
	//most backpacks use the default backpack state for inhand overlays
	item_state_slots = list(
		slot_l_hand_str = "backpack",
		slot_r_hand_str = "backpack",
		)
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_storage_space = 22 // can hold 2 w_class 4 items. 28 let it hold 3
	flammable = TRUE

/obj/item/weapon/storage/backpack/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (use_sound)
		playsound(loc, use_sound, 50, TRUE, -5)
	..()

/obj/item/weapon/storage/backpack/equipped(var/mob/user, var/slot)
	if (slot == slot_back && use_sound)
		playsound(loc, use_sound, 50, TRUE, -5)
	..(user, slot)

/*
/obj/item/weapon/storage/backpack/dropped(mob/user as mob)
	if (loc == user && use_sound)
		playsound(loc, use_sound, 50, TRUE, -5)
	..(user)
*/

/* Satchels*/

/obj/item/weapon/storage/backpack/satchel
	name = "皮革挎包"
	desc = "这是一个用上等皮革制成的非常精致的挎包."
	icon_state = "satchel"
	base_icon = "satchel"
	max_storage_space = 16

/obj/item/weapon/storage/backpack/satchel/gator_satchel
	name = "鳄鱼鳞挎包"
	desc = "一个内衬异国鳄鱼鳞片的时尚挎包"
	icon_state = "gator_satchel"
	base_icon = "gator_satchel"

/obj/item/weapon/storage/backpack/satchel/black
	name = "黑色皮革挎包"
	desc = "一个用黑色皮革制成的非常精致的挎包."
	icon_state = "satchel_black"
	base_icon = "satchel_black"

/obj/item/weapon/storage/backpack/satchel/black/germanat
	name = "德国反坦克挎包"
	desc = "这是德国军人的标准配发挎包"
	max_storage_space = 28
	slowdown = 0.1
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		/obj/item/ammo_casing/rocket,
		)

/obj/item/weapon/storage/backpack/satchel/black/germanat/pzb
	max_storage_space = 12
	New()
		..()
		new /obj/item/ammo_magazine/pzb_case_ap(src)
		for (var/i=1, i<= 3, i++)
			new /obj/item/ammo_magazine/pzb_case(src)

/obj/item/weapon/storage/backpack/satchel/black/germanat/rpb54
	New()
		..()
		for (var/i=1, i<= 5, i++)
			new /obj/item/ammo_casing/rocket/rpb54(src)

/obj/item/weapon/storage/backpack/satchel/replicant
	name = "合成背包"
	desc = "一个用合成皮革制成的非常通用的背包."
	icon_state = "replicant_backpack"
	base_icon = "replicant_backpack"

/obj/item/weapon/storage/backpack/satchel/police
	name = "警察战术包"
	desc = "为执法探员制作的战术包."
	icon_state = "policesatchel"
	base_icon = "policesatchel"
	max_storage_space = 12

/* Backpacks */

/obj/item/weapon/storage/backpack/ww2/jap
	name = "日本背包"
	desc = "这是日本军人的标准配发背包"
	icon_state = "jappack"
	item_state = "jappack"
	base_icon = "jappack"
	max_storage_space = 24
/obj/item/weapon/storage/backpack/ww2/jap/full
	New()
		..()
		new /obj/item/weapon/bedroll(src)
		new /obj/item/weapon/reagent_containers/glass/small_pot/hangou(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/clothing/suit/storage/coat/ww2/japcoat(src)
		new /obj/item/clothing/head/helmet/ww2/japhelm(src)
		new /obj/item/weapon/grenade/ww2/type97(src)
		new /obj/item/weapon/grenade/ww2/type97(src)
		new /obj/item/weapon/can/JPNMRE(src)
		new /obj/item/weapon/can/JPNMRE(src)
		new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/backpack/ww2/jap/ammo_crate
	name = "日本弹药箱"
	desc = "这是一个配有背带的箱子, 通常由弹药手使用."
	icon_state = "ammo_crate"
	item_state = "ammo_crate"
	base_icon = "ammo_crate"
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		)

/obj/item/weapon/storage/backpack/ww2/jap/ammo_crate/full
	New()
		..()
		for (var/i=1, i<= 10, i++)
			new /obj/item/ammo_magazine/type99(src)

/obj/item/weapon/storage/backpack/ww2/jap/ammo_crate/full96
	New()
		..()
		for (var/i=1, i<= 10, i++)
			new /obj/item/ammo_magazine/type96(src)

/obj/item/weapon/storage/backpack/ww2/german
	name = "背包"
	desc = "德国军人的标准配发背包"
	icon_state = "germanpack"
	item_state = "germanpack"
	base_icon = "germanpack"
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		)
/obj/item/weapon/storage/backpack/ww2/russian
	name = "背包"
	desc = "苏联军人的标准配发背包."
	icon_state = "germanpack" //To be replaced with proper, high quality sprites
	item_state = "germanpack" //To be replaced with proper, high quality sprites
	base_icon = "germanpack" //To be replaced with proper, high quality sprites
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		)

/obj/item/weapon/storage/backpack/ww2/russian/at
	New()
		..()
		new /obj/item/weapon/grenade/ww2/rgd33(src)
		new /obj/item/weapon/grenade/ww2/rgd33(src)
		new /obj/item/weapon/grenade/antitank/rpg40(src)
		new /obj/item/weapon/grenade/antitank/rpg40(src)
		new /obj/item/weapon/grenade/smokebomb/rdg2(src)
		new /obj/item/weapon/grenade/smokebomb/rdg2(src)
		new /obj/item/weapon/plastique/russian(src)
		new /obj/item/weapon/plastique/russian(src)

/obj/item/weapon/storage/backpack/ww2/sapper
	name = "工兵背包"
	New()
		..()
		new /obj/item/stack/material/iron/twentyfive(src)
		new /obj/item/stack/material/steel/twentyfive(src)
		new /obj/item/stack/material/wood/twentyfive(src)
		new /obj/item/weapon/material/shovel/spade/small(src)
		new /obj/item/weapon/plastique/russian(src)

/obj/item/weapon/storage/backpack/ww2/sapper/german
	New()
		..()
		new /obj/item/weapon/grenade/ww2/stg1924(src)
		new /obj/item/weapon/grenade/ww2/stg1924(src)
		new /obj/item/weapon/grenade/smokebomb(src)
		new /obj/item/weapon/grenade/smokebomb(src)
		new /obj/item/weapon/grenade/antitank/stg24_bundle(src)

/obj/item/weapon/storage/backpack/ww2/sapper/russian
	New()
		..()
		new /obj/item/weapon/grenade/antitank/rpg40
		new /obj/item/weapon/grenade/ww2/rgd33(src)
		new /obj/item/weapon/grenade/ww2/rgd33(src)
		new /obj/item/weapon/grenade/smokebomb/rdg2(src)
		new /obj/item/weapon/grenade/smokebomb/rdg2(src)

/obj/item/weapon/storage/backpack/ww2/american
	name = "美国背包"
	desc = "这是美国军人的标准配发背包"
	icon_state = "uspack"
	item_state = "uspack"
	base_icon = "uspack"
	max_storage_space = 24

/obj/item/weapon/storage/backpack/paratrooper
	name = "降落伞包"
	desc = "一个内置降落伞的背包."
	icon_state = "parachute"
	item_state = "parachute"
	base_icon = "parachute"
	w_class = ITEM_SIZE_HUGE
	max_storage_space = 0

/obj/item/weapon/storage/backpack/scavpack
	name = "拾荒者背包"
	desc = "一个由多种材料混合制成的临时背包."
	icon_state = "scavpack"
	item_state = "scavpack"
	max_storage_space = 24

/obj/item/weapon/storage/backpack/rucksack
	name = "帆布背包"
	desc = "一个为长途跋涉制作的大帆布背包."
	icon_state = "rucksack"
	item_state = "backpack"
	base_icon = "rucksack"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_storage_space = 28

/obj/item/weapon/storage/backpack/rucksack/small
	name = "小型军用帆布背包"
	desc = "一个小型黑色军用帆布背包, 让你在携带所有必需品的同时保持机动."
	icon_state = "smallruck"
	item_state = "smallruck"
	base_icon = "smallruck"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_storage_space = 14

/obj/item/weapon/storage/backpack/rucksack/small/extracap
	name = "军用帆布背包"
	desc = "一个稍小的黑色军用帆布背包, 让你在携带所有必需品的同时保持机动."
	max_storage_space = 22

/obj/item/weapon/storage/backpack/rucksack/small/extracap/medicalh
	New()
		..()
		new/obj/item/stack/medical/advanced/bruise_pack(src)
		new/obj/item/stack/medical/advanced/ointment(src)
		new/obj/item/stack/medical/advanced/sulfa(src)
		new/obj/item/stack/medical/splint(src)
		new/obj/item/weapon/storage/pill_bottle/tramadol(src)
		new/obj/item/roller(src)
		new/obj/item/weapon/pill_pack/adrenaline(src)
		new/obj/item/weapon/storage/firstaid/surgery(src)

/obj/item/weapon/storage/backpack/rucksack/small/milpack
	New()
		..()
		new/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/full(src)
		new/obj/item/weapon/can/filled(src)
		new/obj/item/weapon/reagent_containers/syringe/adrenaline(src)
		new/obj/item/weapon/material/kitchen/utensil/knife/military(src)
		new/obj/item/weapon/reagent_containers/pill/paracetamol(src)

/obj/item/weapon/storage/backpack/rucksack/small/medical
	New()
		..()
		new/obj/item/stack/medical/advanced/bruise_pack(src)
		new/obj/item/stack/medical/advanced/ointment(src)
		new/obj/item/stack/medical/advanced/sulfa(src)
		new/obj/item/stack/medical/splint(src)
		new/obj/item/weapon/storage/pill_bottle/tramadol(src)
		new/obj/item/weapon/pill_pack/adrenaline(src)

/obj/item/weapon/storage/backpack/rucksack/small/command
	New()
		..()
		new/obj/item/weapon/compass(src)
		new/obj/item/weapon/material/shovel/trench/foldable/etool(src)
		new/obj/item/weapon/material/kitchen/utensil/knife/military(src)
		new/obj/item/weapon/storage/box/flare(src)
		new/obj/item/weapon/storage/box/sandbags(src)

/obj/item/weapon/storage/backpack/rucksack/small/command/soviet
	New()
		..()
		new/obj/item/weapon/grenade/coldwar/rgd5(src)
		new/obj/item/weapon/grenade/smokebomb/rdg2(src)

/obj/item/weapon/storage/backpack/rucksack/small/command/nato
	New()
		..()
		new/obj/item/weapon/grenade/coldwar/m67(src)
		new/obj/item/weapon/grenade/smokebomb/m18smoke(src)

/obj/item/weapon/storage/backpack/rucksack/rpg
	New()
		..()
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)

/obj/item/weapon/storage/backpack/rpg_pack
	name = "RPG-7火箭背包"
	desc = "一个用帆布制成的弹药携行具. 这个能够携带最多3枚火箭弹."
	icon_state = "backpack_rpg_tan"
	item_state = "backpack_rpg_tan"
	base_icon = "backpack_rpg_tan"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	can_hold = list(
		/obj/item/ammo_casing/rocket/og7v,
		/obj/item/ammo_casing/rocket/pg7v,
		/obj/item/ammo_casing/rocket/atgm)
	max_w_class = 4
	max_storage_space = 24

/obj/item/weapon/storage/backpack/rpg_pack/olive
	icon_state = "backpack_rpg_olive"
	item_state = "backpack_rpg_olive"
	base_icon = "backpack_rpg_olive"

/obj/item/weapon/storage/backpack/rpg_pack/filled
	New()
		..()
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)

/obj/item/weapon/storage/backpack/rpg_pack/filled_at
	New()
		..()
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)

/obj/item/weapon/storage/backpack/rpg_pack/olive/filled
	New()
		..()
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/og7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)

/obj/item/weapon/storage/backpack/rpg_pack/olive/filled_at
	New()
		..()
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)
		new/obj/item/ammo_casing/rocket/pg7v(src)

/obj/item/weapon/storage/backpack/heavyrucksack
	name = "重型帆布背包"
	desc = "一个为大型, 沉重物品制作的大号重型帆布背包."
	icon_state = "heavyrucksack"
	item_state = "backpack"
	base_icon = "heavyrucksack"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	max_w_class = 5
	max_storage_space = 28

/obj/item/weapon/storage/backpack/heavyrucksack/atgm
	New()
		..()
		new/obj/item/ammo_casing/rocket/atgm(src)
		new/obj/item/ammo_casing/rocket/atgm(src)
		new/obj/item/ammo_casing/rocket/atgm(src)
		new/obj/item/ammo_casing/rocket/atgm(src)
		new/obj/item/ammo_casing/rocket/atgm/he(src)
		new/obj/item/ammo_casing/rocket/atgm/he(src)

/obj/item/weapon/storage/backpack/heavyrucksack/mortar
	New()
		..()
		new/obj/item/cannon_ball/mortar_shell(src)
		new/obj/item/cannon_ball/mortar_shell(src)
		new/obj/item/cannon_ball/mortar_shell(src)
		new/obj/item/cannon_ball/mortar_shell(src)
		new/obj/item/cannon_ball/mortar_shell(src)
		new/obj/item/cannon_ball/mortar_shell(src)

/obj/item/weapon/storage/backpack/heavyrucksack/black
	icon_state = "heavyrucksack_black"
	base_icon = "heavyrucksack_black"

/obj/item/weapon/storage/backpack/civbag
	name = "背包"
	desc = "一个为长途跋涉制作的大背包."
	icon_state = "civback"
	item_state = "backpack"
	base_icon = "civback"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_w_class = 5
	max_storage_space = 28

/obj/item/weapon/storage/backpack/duffel
	name = "行李袋"
	desc = "一个普通的行李袋."
	icon_state = "duffel"
	item_state = "duffel"
	base_icon = "duffel"
	item_state_slots = list(
		slot_l_hand_str = "duffel",
		slot_r_hand_str = "duffel",
		)
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_w_class = 3
	max_storage_space = 22

/obj/item/weapon/storage/backpack/duffel/black
	name = "黑色行李袋"
	desc = "一个普通的黑色行李袋."
	icon_state = "bduffel"
	item_state = "bduffel"
	base_icon = "bduffel"

/obj/item/weapon/storage/backpack/buttpack
	name = "美军臀包"
	desc = "美国军人的标准配发臀包."
	icon_state = "us_buttpack"
	item_state = "us_buttpack"
	item_state_slots = list(
		slot_l_hand_str = "us_buttpack",
		slot_r_hand_str = "us_buttpack",
		)
	base_icon = "us_buttpack"
	slot_flags = SLOT_BACK
	max_storage_space = 8

/obj/item/weapon/storage/backpack/sovpack
	name = "西多尔帆布背包"
	desc = "苏联标准配发帆布背包."
	icon_state = "sovpack"
	item_state = "sovpack"
	item_state_slots = list(
		slot_l_hand_str = "sovpack",
		slot_r_hand_str = "sovpack",
		)
	base_icon = "sovpack"
	slot_flags = SLOT_BACK
	max_storage_space = 12

/obj/item/weapon/storage/backpack/duffel/shaman
	name = "萨满的行李袋"
	desc = "一个装满\"医疗用品\"的行李袋."
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/bint/leather(src)
		new /obj/item/stack/medical/advanced/herbs(src)
		new /obj/item/stack/medical/splint(src)
		new /obj/item/weapon/material/kitchen/utensil/knife/bone(src)
		new /obj/item/stack/material/rope(src)
		new /obj/item/flashlight/torch(src)
		new /obj/item/clothing/mask/smokable/cigarette/joint(src)
		new /obj/item/clothing/mask/smokable/cigarette/joint(src)
		new /obj/item/clothing/mask/smokable/cigarette/joint(src)
		new /obj/item/weapon/reagent_containers/pill/cocaine(src)
		new /obj/item/weapon/reagent_containers/pill/cocaine(src)
		new /obj/item/weapon/reagent_containers/pill/cocaine(src)
		new /obj/item/weapon/reagent_containers/pill/opium(src)
		new /obj/item/weapon/reagent_containers/pill/opium(src)
		new /obj/item/weapon/reagent_containers/food/snacks/grown/peyote(src)
		new /obj/item/weapon/pill_pack/pervitin(src)


/obj/item/weapon/storage/backpack/duffel/ungineer
	name = "联合国工程师的行李袋"
	desc = "一个装满工程用品的行李袋."
	New()
		..()
		new /obj/item/weapon/storage/box/sandbags(src)
		new /obj/item/weapon/storage/box/sandbags(src)
		new /obj/item/stack/material/barbwire/twnt(src)
		new /obj/item/stack/material/wood/twentyfive(src)
		new /obj/item/weapon/material/shovel/spade/small(src)
		new /obj/item/weapon/grenade/smokebomb(src)
		new /obj/item/weapon/grenade/smokebomb(src)

/obj/item/weapon/storage/backpack/duffel/unsniper
	name = "联合国神射手的行李袋"
	desc = "一个装满精确射手补给品的行李袋."
	New()
		..()
		new /obj/item/weapon/gun_cleaning_kit(src)
		new /obj/item/ammo_magazine/box_762x51(src)
		new /obj/item/ammo_magazine/box_762x51(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/m14(src)
		new /obj/item/ammo_magazine/m14(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/weapon/grenade/smokebomb/m18smoke(src)

/obj/item/weapon/storage/backpack/duffel/unmg
	name = "联合国机枪手行李袋"
	desc = "一个装满机枪手补给品的行李袋."
	New()
		..()
		new /obj/item/weapon/gun_cleaning_kit(src)
		new /obj/item/ammo_magazine/madsen/box(src)
		new /obj/item/ammo_magazine/madsen/box(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/madsen(src)
		new /obj/item/ammo_magazine/madsen(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/weapon/grenade/coldwar/m67(src)

/obj/item/weapon/storage/backpack/duffel/unbasic
	name = "联合国维和人员行李袋"
	desc = "一个装满基础补给品的行李袋."
	New()
		..()
		new /obj/item/weapon/gun_cleaning_kit(src)
		new /obj/item/ammo_magazine/box_762x51(src)
		new /obj/item/ammo_magazine/box_762x51(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/fal(src)
		new /obj/item/ammo_magazine/fal(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/weapon/grenade/coldwar/m67(src)

/obj/item/weapon/storage/backpack/duffel/unsgt
	name = "联合国中士行李袋"
	desc = "一个装满中士补给品的行李袋."
	New()
		..()
		new /obj/item/weapon/storage/box/firstaid(src)
		new /obj/item/ammo_magazine/greasegun/box(src)
		new /obj/item/ammo_magazine/greasegun/box(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/greasegun(src)
		new /obj/item/ammo_magazine/greasegun(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/weapon/grenade/coldwar/m67(src)
		new /obj/item/weapon/grenade/incendiary/anm14(src)

/obj/item/weapon/storage/backpack/duffel/un
	name = "联合国突击背包"
	desc = "一个装满基础补给品的行李袋."

/obj/item/weapon/storage/backpack/duffel/un/mk
	New()
		..()
		new /obj/item/weapon/gun_cleaning_kit(src)
		new /obj/item/ammo_magazine/mk18(src)
		new /obj/item/ammo_magazine/mk18(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/mk18(src)
		new /obj/item/ammo_magazine/mk18(src)
		new /obj/item/ammo_magazine/m1911(src)
		new /obj/item/weapon/grenade/coldwar/m67(src)

/obj/item/weapon/storage/backpack/duffel/un/p90
	New()
		..()
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/weapon/material/shovel/trench(src)
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/ammo_magazine/p90(src)
		new /obj/item/weapon/grenade/coldwar/nonfrag/m26(src)

/obj/item/weapon/storage/backpack/piatpack
	name = "管式火箭挎包"
	desc = "一个由纸板和帆布制成的弹药携行具. 这个能携带最多3枚火箭."
	icon_state = "piatbackpack"
	item_state = "piatbackpack"
	base_icon = "piatbackpack"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	can_hold = list(
		/obj/item/ammo_casing/rocket,
		/obj/item/cannon_ball/mortar_shell,
		/obj/item/ammo_casing/rocket/atgm)
	max_w_class = 4
	max_storage_space = 24

/obj/item/weapon/storage/backpack/piatpack/filledearly
	New()
		..()
		new/obj/item/ammo_casing/rocket/piat(src)
		new/obj/item/ammo_casing/rocket/piat(src)
		new/obj/item/ammo_casing/rocket/piat(src)

/obj/item/weapon/storage/backpack/piatpack/filledlate
	New()
		..()
		new/obj/item/ammo_casing/rocket/piat/mk3(src)
		new/obj/item/ammo_casing/rocket/piat/mk3(src)
		new/obj/item/ammo_casing/rocket/piat/mk3(src)