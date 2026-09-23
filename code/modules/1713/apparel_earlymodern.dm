/obj/item/clothing/shoes/japboots
	name = "冬季裹腿靴"
	desc = "一双简单轻薄的皮靴. 可覆盖至小腿."
	icon_state = "japboots"
	item_state = "japboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 15, arrow = 10, gun = FALSE, energy = 8, bomb = 15, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	var/colorn = 1
////////////////////////////////////ABASHIRI//////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/abashiri
	name = "网走监狱看守制服"
	desc = "网走监狱看守的标准制服."
	icon_state = "abashiri_guard"
	item_state = "abashiri_guard"
	var/rolled = FALSE

/obj/item/clothing/under/abashiri/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/abashiri)
		return
	else
		if (rolled)
			item_state = "abashiri_guard"
			item_state_slots["w_uniform"] = "abashiri_guard"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "abashiri_guard_rolled"
			item_state_slots["w_uniform"] = "abashiri_guard_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/abashiri_prisoner
	name = "网走监狱囚服"
	desc = "网走监狱看守的标准浴衣."
	icon_state = "abashiri_prisoner"
	item_state = "abashiri_prisoner"
	var/rolled = FALSE

/obj/item/clothing/under/abashiri_prisoner/verb/roll_suit()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/abashiri_prisoner)
		return
	else
		if (rolled)
			item_state = "abashiri_prisoner"
			item_state_slots["w_uniform"] = "abashiri_prisoner"
			to_chat(usr, "<span class = 'danger'>你放下了衣服.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "abashiri_prisoner_down"
			item_state_slots["w_uniform"] = "abashiri_prisoner_down"
			to_chat(usr, "<span class = 'danger'>你卷起了衣服.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()
/obj/item/clothing/head/abashiri_guard
	name = "网走看守帽"
	desc = "网走看守戴的帽子."
	icon_state = "abashiri_guard"
	item_state = "abashiri_guard"
/obj/item/clothing/head/abashiri_guard/head_guard
	name = "网走看守长帽"
	desc = "网走看守长戴的帽子."
	icon_state = "abashiri_guard_head"
	item_state = "abashiri_guard_head"

/obj/item/clothing/head/abashiri_guard/french
	name = "典狱长帽"
	desc = "监狱典狱长戴的帽子."
	icon_state = "abashiri_guard_head"
	item_state = "abashiri_guard_head"

/obj/item/clothing/head/abashiri_guard/head_guard/warden
	name = "网走狱长帽"
	desc = "网走狱长戴的帽子."
/obj/item/clothing/head/abashiri_prisoner
	name = "斗笠"
	desc = "一顶遮挡囚犯视线以及面容的草帽."
	icon_state = "abashiri_kasa"
	item_state = "abashiri_kasa"
	flags_inv = BLOCKHAIR|HIDEFACE
	restricts_view = 2
/obj/item/clothing/suit/storage/jacket/haori_jacket/abashiri
	name = "网走羽织"
	desc = "通常穿在羽织装外面的简单羽织外套."
	icon_state = "haori_jacket"
	item_state = "haori_jacket"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 75
/obj/item/clothing/suit/storage/jacket/haori_jacket/abashiri/wing1
	name = "网走羽织"
	desc = "通常穿在羽织装外面的简单羽织外套. 这件背后标有第一监区."
	icon_state = "haori_jacket1"
	item_state = "haori_jacket1"
/obj/item/clothing/suit/storage/jacket/haori_jacket/abashiri/wing2
	name = "网走羽织"
	desc = "通常穿在羽织装外面的简单羽织外套. 这件背后标有第二监区."
	icon_state = "haori_jacket2"
	item_state = "haori_jacket2"
/obj/item/clothing/suit/storage/jacket/haori_jacket/abashiri/wing3
	name = "网走羽织"
	desc = "通常穿在羽织装外面的简单羽织外套. 这件背后标有第三监区."
	icon_state = "haori_jacket3"
	item_state = "haori_jacket3"

////////////////////////////////////////////RUSSO-JAP///////////////////////////////////////////////
/obj/item/clothing/under/japuni
	name = "日本陆军制服"
	desc = "一套标准的日本帝国陆军制服."
	icon_state = "japuni"
	item_state = "japuni"
	var/rolled = FALSE

/obj/item/clothing/under/japuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/japuni)
		return
	else
		if (rolled)
			item_state = "japuni"
			item_state_slots["w_uniform"] = "japuni"
			to_chat(usr, "<span class = 'danger'>你放下制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "japunirolled"
			item_state_slots["w_uniform"] = "japunirolled"
			to_chat(usr, "<span class = 'danger'>你卷起制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/japoffuni
	name = "日本军官制服"
	desc = "一套日本帝国陆军军官制服."
	icon_state = "japoffuni"
	item_state = "japoffuni"
	var/rolled = FALSE

/obj/item/clothing/under/japoffuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/japoffuni)
		return
	else
		if (rolled)
			item_state = "japoffuni"
			item_state_slots["w_uniform"] = "japoffuni"
			to_chat(usr, "<span class = 'danger'>你放下制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		else if (!rolled)
			item_state = "japoffunirolled"
			item_state_slots["w_uniform"] = "japoffunirolled"
			to_chat(usr, "<span class = 'danger'>你卷起制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()


/obj/item/clothing/accessory/white_sash
	name = "白色绶带"
	desc = "一条白色绶带,日本白绶带旅所使用."
	icon_state = "sash"
	item_state = "sash"

/obj/item/clothing/under/rusuni
	name = "俄罗斯陆军制服"
	desc = "一套标准的俄罗斯帝国陆军制服."
	icon_state = "rusuni"
	item_state = "rusuni"
	var/rolled = FALSE

/obj/item/clothing/under/rusuni_ww1
	name = "俄罗斯陆军制服"
	desc = "一套标准的俄罗斯帝国陆军制服."
	icon_state = "ww1_russian2"
	item_state = "ww1_russian2"

/obj/item/clothing/under/rusuni_ww1_officer
	name = "俄罗斯陆军军官制服"
	desc = "一套标准的俄罗斯帝国陆军制服,带有军官肩章."
	icon_state = "ww1_russian_o"
	item_state = "ww1_russian_o"


/obj/item/clothing/under/rusuni_rcw
	name = "红军制服"
	desc = "一套20世纪早期的标准俄罗斯制服,没有肩章或徽章."
	icon_state = "ww1_russian"
	item_state = "ww1_russian"

/obj/item/clothing/under/rusuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/rusuni)
		return
	else
		if (rolled)
			item_state = "rusuni"
			item_state_slots["w_uniform"] = "rusuni"
			to_chat(usr, "<span class = 'danger'>你放下制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "rusunirolled"
			item_state_slots["w_uniform"] = "rusunirolled"
			to_chat(usr, "<span class = 'danger'>你卷起制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/suit/storage/coat/cheka
	name = "契卡皮大衣"
	desc = "一件闪亮的黑色皮大衣,契卡特工所使用."
	icon_state = "leathercoat_c"
	item_state = "leathercoat_c"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65

/obj/item/clothing/under/kuban_cossak
	name = "库班哥萨克贝什梅特"
	desc = "一件红色贝什梅特配灰色长裤,库班哥萨克的传统服饰."
	icon_state = "kuban_cossak"
	item_state = "kuban_cossak"

/obj/item/clothing/suit/storage/coat/kuban_cossak
	name = "黑色切尔克斯卡大衣"
	desc = "一件传统的库班哥萨克大衣."
	icon_state = "kuban_cossak"
	item_state = "kuban_cossak"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65


/obj/item/clothing/suit/storage/coat/russian_rcw
	name = "苏联大衣"
	desc = "一件早期的红军大衣."
	icon_state = "japcoat2"
	item_state = "japcoat2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65

/obj/item/clothing/suit/storage/coat/japcoat
	name = "日本大衣"
	desc = "一件日本陆军大衣."
	icon_state = "japcoat"
	item_state = "japcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/japcoat/abashiri
	name = "网走监狱看守大衣"
	desc = "一件网走监狱看守的大衣."

/obj/item/clothing/suit/storage/coat/priest
	name = "牧师袖袍"
	desc = "一件牧师所穿的神圣长袍."
	icon_state = "priestwhite"
	item_state = "priestwhite"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/japcoat2
	name = "日本大衣"
	desc = "一件日本陆军大衣."
	icon_state = "japcoat2"
	item_state = "japcoat2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/ruscoat
	name = "俄罗斯大衣"
	desc = "一件俄罗斯陆军大衣."
	icon_state = "ruscoat"
	item_state = "ruscoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/ruscoat/grey
	name = "灰色冬季大衣"
	desc = "一件厚实的冬季大衣."

/obj/item/clothing/suit/storage/coat/japcoat2/brown
	name = "棕色冬季大衣"
	desc = "一件厚实的冬季大衣."

/obj/item/clothing/suit/storage/coat/japcoat2/trench
	name = "棕色风衣"
	desc = "一件让你保持干净干燥的长大衣."

/obj/item/clothing/suit/storage/coat/rusoffcoat
	name = "俄罗斯军官大衣."
	desc = "一件俄罗斯陆军军官大衣.由军官穿着,以表明其军衔."
	icon_state = "rusoffcoat"
	item_state = "rusoffcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/armor/japmisc
	min_cold_protection_temperature = COAT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/armor/japmisc/japvest
	name = "又鬼马甲"
	desc = "一件由皮革制成的保暖毛皮衬里马甲."
	icon_state = "japvest"
	item_state = "japvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 10, arrow = 10, gun = FALSE, energy = 10, bomb = 10, bio = 10, rad = 15)
	value = 10
	health = 12

/obj/item/clothing/head/japcap
	name = "日本军帽"
	desc = "一顶日本士兵所戴的军帽."
	icon_state = "japcap"
	item_state = "japcap"
	var/adjusted = FALSE

/obj/item/clothing/head/japcap/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/japcap)
		return
	else
		if (adjusted)
			item_state = "japcap"
			item_state_slots["slot_head"] = "japcap"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "japcapad"
			item_state_slots["slot_head"] = "japcapad"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/head/japcap2
	name = "日本军帽"
	desc = "一顶日本士兵所戴的军帽."
	icon_state = "japcap2"
	item_state = "japcap2"
	var/adjusted = FALSE

/obj/item/clothing/head/japcap2/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/japcap2)
		return
	else
		if (adjusted)
			item_state = "japcap2"
			item_state_slots["slot_head"] = "japcap2"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "japcap2ad"
			item_state_slots["slot_head"] = "japcap2ad"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/head/japoffcap
	name = "日本军官帽"
	desc = "一顶日本军官所戴的军帽."
	icon_state = "japoffcap"
	item_state = "japoffcap"
	var/adjusted = FALSE

/obj/item/clothing/head/japoffcap/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/japoffcap)
		return
	else
		if (adjusted)
			item_state = "japoffcap"
			item_state_slots["slot_head"] = "japoffcap"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "japoffcapad"
			item_state_slots["slot_head"] = "japoffcapad"
			to_chat(usr, "<span class = 'danger'>你调整了军帽的帽带.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/head/ruscap
	name = "俄罗斯军帽"
	desc = "一顶俄罗斯士兵所戴的军帽."
	icon_state = "ruscap"
	item_state = "ruscap"

/obj/item/clothing/head/rusoffcap
	name = "俄罗斯军官帽"
	desc = "一顶俄罗斯陆军军官所戴的军帽."
	icon_state = "rusoffcap"
	item_state = "rusoffcap"

////////////storage//////////////////////////
//russo-jap
/obj/item/weapon/storage/belt/russian
	name = "俄罗斯士兵腰带"
	desc = "一条可以携带手枪,弹药和其他物品等装备的腰带."
	icon_state = "rubelt"
	item_state = "rubelt"
	storage_slots = 7
	max_w_class = 3
	max_storage_space = 24
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		/obj/item/weapon/melee/classic_baton
		)
/obj/item/weapon/storage/belt/russian/soldier
/obj/item/weapon/storage/belt/russian/soldier/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/mosin(src)
	new /obj/item/weapon/attachment/bayonet(src)

/obj/item/clothing/accessory/storage/webbing/russband
	name = "俄罗斯帝国陆军弹药带"
	desc = "一条大型皮革弹药带,带有6个小袋用于装桥夹."
	icon_state = "ru_band"
	item_state = "ru_band"
	slots = 6
	New()
		..()
		hold.storage_slots = slots
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack)

//world war 1
/obj/item/weapon/storage/belt/russian/ww1
	name = "俄罗斯士兵腰带"
	desc = "一条带有2个袋子可装12个桥夹的腰带."
	icon_state = "rubelt_ww1"
	item_state = "rubelt_ww1"
	storage_slots = 7
	max_w_class = 3
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/weapon/material,
		/obj/item/weapon/grenade,
		/obj/item/weapon/attachment,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/handcuffs,
		/obj/item/ammo_casing,
		/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
		/obj/item/weapon/material/shovel,
		/obj/item/weapon/key,
		/obj/item/weapon/melee/classic_baton
		)
/obj/item/weapon/storage/belt/russian/ww1/soldier
/obj/item/weapon/storage/belt/russian/ww1/soldier/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/mosin(src)
	new /obj/item/weapon/attachment/bayonet(src)
/obj/item/weapon/storage/belt/jap
	name = "日本士兵腰带"
	desc = "一条可以携带手枪,弹药和其他物品等装备的腰带."
	icon_state = "japbelt"
	item_state = "japbelt"
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
/obj/item/weapon/storage/belt/jap/soldier
/obj/item/weapon/storage/belt/jap/soldier/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/arisaka(src)
	new /obj/item/weapon/attachment/bayonet(src)

/obj/item/weapon/storage/belt/jap/ww2soldier
/obj/item/weapon/storage/belt/jap/ww2soldier/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/arisaka99(src)
	new /obj/item/weapon/attachment/bayonet(src)

/obj/item/weapon/storage/belt/jap/ww2soldier100
/obj/item/weapon/storage/belt/jap/ww2soldier100/New()
	..()
	for (var/i=1, i<=5, i++)
		new /obj/item/ammo_magazine/type100(src)

/obj/item/weapon/storage/belt/jap/ww2soldier99
/obj/item/weapon/storage/belt/jap/ww2soldier99/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/type99(src)
	new /obj/item/weapon/attachment/bayonet(src)

/obj/item/weapon/storage/belt/jap/ww2soldier96
/obj/item/weapon/storage/belt/jap/ww2soldier96/New()
	..()
	for (var/i=1, i<=6, i++)
		new /obj/item/ammo_magazine/type96(src)
	new /obj/item/weapon/attachment/bayonet(src)

/obj/item/weapon/storage/belt/jap/camp_guard
/obj/item/weapon/storage/belt/jap/camp_guard/New()
	..()
	new /obj/item/weapon/melee/classic_baton(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/attachment/bayonet(src)
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/arisaka99(src)
/obj/item/weapon/storage/belt/jap/abashiri_guard
/obj/item/weapon/storage/belt/jap/abashiri_guard/New()
	..()
	new /obj/item/weapon/material/classic_baton/guard(src)
	for (var/i=1, i<=4, i++)
		new /obj/item/weapon/handcuffs(src)
	new /obj/item/flashlight/flashlight(src)

/obj/item/weapon/storage/belt/jap/camp_guard_SS
	name = "党卫军看守腰带"
/obj/item/weapon/storage/belt/jap/camp_guard_SS/New()
	..()
	new /obj/item/weapon/whistle(src)
	new /obj/item/weapon/material/classic_baton/guard(src)
	for (var/i=1, i<=3, i++)
		new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/jap/camp_officer
/obj/item/weapon/storage/belt/jap/camp_officer/New()
	..()
	new /obj/item/weapon/material/classic_baton/guard(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/attachment/bayonet(src)
	new /obj/item/ammo_magazine/c8mmnambu(src)
	new /obj/item/ammo_magazine/c8mmnambu(src)
/////////////////////////////////////////////////////////////////////////////////
//////////////CIVILIAN STUFF/////////////////////////////////////////////////////

/obj/item/clothing/head/top_hat
	name = "高顶礼帽"
	desc = "一顶高顶礼帽."
	icon_state = "tophat"
	item_state = "tophat"

/obj/item/clothing/head/flatcap1
	name = "棕色鸭舌帽"
	desc = "一顶常见的棕色鸭舌帽."
	icon_state = "flatcap1"
	item_state = "flatcap1"

/obj/item/clothing/head/flatcap2
	name = "蓝色鸭舌帽"
	desc = "一顶常见的蓝色鸭舌帽."
	icon_state = "flatcap2"
	item_state = "flatcap2"

/obj/item/clothing/head/flatcap3
	name = "灰色鸭舌帽"
	desc = "一顶常见的灰色鸭舌帽."
	icon_state = "flatcap3"
	item_state = "flatcap3"

/obj/item/clothing/head/fedora
	name = "软呢帽"
	desc = "一顶宽檐帽."
	icon_state = "fedora"
	item_state = "fedora"

/obj/item/clothing/head/helmet/constable
	name = "警员头盔"
	desc = "一顶执法人员佩戴的典型塑料头盔.保护头部免受轻微殴打和袭击."
	icon_state = "constable"
	item_state = "constable"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 60, gun = 5, energy = 15, bomb = 45, bio = 20, rad = FALSE)

/obj/item/clothing/under/modern1
	name = "浅棕色套装"
	desc = "一套由白衬衫和浅棕色长裤组成的服装."
	icon_state = "modern1"
	item_state = "modern1"

/obj/item/clothing/under/modern2
	name = "黑色套装"
	desc = "一套由白衬衫和黑色长裤组成的服装."
	icon_state = "modern2"
	item_state = "modern2"

/obj/item/clothing/under/expensive
	name = "衬衫套装"
	desc = "一套由昂贵白衬衫和黑色长裤组成的服装."
	icon_state = "bman"
	item_state = "bman"

/obj/item/clothing/under/expensive/green
	name = "绿领带衬衫套装"
	desc = "一套由昂贵白衬衫和黑色长裤组成的服装,配有绿色领带."
	icon_state = "bman_green"
	item_state = "bman_green"

/obj/item/clothing/under/expensive/blue
	name = "蓝领带衬衫套装"
	desc = "一套由昂贵白衬衫和黑色长裤组成的服装,配有蓝色领带."
	icon_state = "bman_blue"
	item_state = "bman_blue"

/obj/item/clothing/under/expensive/red
	name = "红领带衬衫套装"
	desc = "一套由昂贵白衬衫和黑色长裤组成的服装,配有红色领带."
	icon_state = "bman_red"
	item_state = "bman_red"

/obj/item/clothing/under/expensive/yellow
	name = "黄领带衬衫套装"
	desc = "一套由昂贵白衬衫和黑色长裤组成的服装,配有黄色领带."
	icon_state = "bman_yellow"
	item_state = "bman_yellow"

/obj/item/clothing/under/modern3
	name = "灰色套装"
	desc = "一套由白衬衫和灰色长裤组成的服装."
	icon_state = "modern3"
	item_state = "modern3"

/obj/item/clothing/under/modern4
	name = "棕色套装"
	desc = "一套由白衬衫和棕色长裤组成的服装."
	icon_state = "modern4"
	item_state = "modern4"

/obj/item/clothing/under/modern7
	name = "现代套装"
	desc = "一套由白衬衫和黑色工装裤组成的服装."
	icon_state = "modern7"
	item_state = "modern7"

/obj/item/clothing/under/swat
	name = "特警套装"
	desc = "一套警察特种部队使用的制服."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/under/cleansuit
	name = "防护服"
	desc = "一套防环境辐射的白色个人防护制服."
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = 15, bomb = 10, bio = 20, rad = 20)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	icon_state = "cleansuit"
	item_state = "cleansuit"

/obj/item/clothing/under/swat_new
	name = "特警套装"
	desc = "一套警察特种部队使用的制服."
	icon_state = "swat_new"
	item_state = "swat_new"

/obj/item/clothing/under/combat
	name = "战斗套装"
	desc = "一套覆有凯夫拉装甲的战斗制服."
	icon_state = "combat"
	item_state = "combat"

/obj/item/clothing/under/police
	name = "警察套装"
	desc = "一套警察部队使用的制服."
	icon_state = "police"
	item_state = "police"

/obj/item/clothing/under/prisoner
	name = "囚犯套装"
	desc = "通常由罪犯和渣滓穿着."
	icon_state = "prisoner"
	item_state = "prisoner"

/obj/item/clothing/under/milrus2
	name = "俄军套装"
	desc = "一套由迷彩长裤和衬衫组成的服装."
	icon_state = "milrus2"
	item_state = "milrus2"

/obj/item/clothing/under/baily
	name = "安保套装"
	desc = "一套由绿色夹克和黑色长裤组成的服装."
	icon_state = "baily"
	item_state = "baily"

/obj/item/clothing/under/tactical1
	name = "战术套装"
	desc = "一套由迷彩工装裤和棕褐色巴拉克拉瓦头套组成的服装."
	icon_state = "tactical1"
	item_state = "tactical1"

/obj/item/clothing/under/pmc
	name = "雇佣兵套装"
	desc = "一套私人军事承包商单位使用的服装."
	icon_state = "pmc"
	item_state = "pmc"

/obj/item/clothing/under/mafia
	name = "华丽套装"
	desc = "一套昂贵且有格调的服装."
	icon_state = "mafia"
	item_state = "mafia"

/obj/item/clothing/under/engi
	name = "工人套装"
	desc = "一套建筑工人使用的服装."
	icon_state = "engi"
	item_state = "engi"

/obj/item/clothing/under/gorka
	name = "山地套装"
	desc = "一套特种部队使用的山地作战服."
	icon_state = "gorka"
	item_state = "gorka"

/obj/item/clothing/under/gorka/frag //provides actual armor
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, arrow = 30, gun = FALSE, energy = 15, bomb = 25, bio = 30, rad = 30)
	value = 65

/obj/item/clothing/under/modern8
	name = "现代短裙"
	desc = "一套由黑色短裙和白衬衫组成的服装."
	icon_state = "modern8"
	item_state = "modern8"

/obj/item/clothing/under/oldmansuit
	name = "老派绅士西装"
	desc = "一套19世纪华丽男士穿着的服装."
	icon_state = "oldmansuit"
	item_state = "oldmansuit"

/obj/item/clothing/under/cozyoldy
	name = "华丽套装"
	desc = "一套19世纪华丽男士穿着的服装."
	icon_state = "cozyoldy"
	item_state = "cozyoldy"

/obj/item/clothing/under/peakyblinder
	name = "华丽西装"
	desc = "一套渣滓使用的服装."
	icon_state = "peakyblinder"
	item_state = "peakyblinder"

/obj/item/clothing/under/constable
	name = "警员套装"
	desc = "一套执法人员穿着的黑色服装."
	icon_state = "constable"
	item_state = "constable"

/obj/item/clothing/under/oldfirefighter
	name = "消防员制服"
	desc = "一套消防员使用的服装.真他妈热."
	icon_state = "oldfirefighter"
	item_state = "oldfirefighter"

/obj/item/clothing/under/blacktango
	name = "黑色连衣裙"
	desc = "一条华丽女士穿着的连衣裙."
	icon_state = "black_tango_alt_s"
	item_state = "black_tango_alt_s"

/obj/item/clothing/under/clown
	name = "小丑套装"
	desc = "一套小丑使用的服装."
	icon_state = "clown"
	item_state = "clown"

/obj/item/clothing/under/jester
	name = "弄臣套装"
	desc = "一套弄臣服装.我的乐子在哪哈哈哈."
	icon_state = "jester"
	item_state = "jester"

/obj/item/clothing/under/farmer_outfit
	name = "农夫套装"
	desc = "一套由格子衬衫和牛仔背带裤组成的服装."
	icon_state = "farmer_outfit"
	item_state = "farmer_outfit"

/obj/item/clothing/under/mechanic_outfit
	name = "机械师套装"
	desc = "由白衬衫和皮革围裙组成的套装."
	icon_state = "mechanic_outfit"
	item_state = "mechanic_outfit"

/*Feminine Clothing*/

/obj/item/clothing/under/tradwife
	name = "蓝色传统连衣裙"
	desc = "一种20世纪早期风格的连衣裙,剪裁合身,常为家庭主妇穿着"
	icon_state = "tradwife_blue"
	item_state = "tradwife_blue"

/obj/item/clothing/under/tradwife/yellow
	name = "黄色传统连衣裙"
	desc = "一种20世纪早期风格的连衣裙,剪裁合身,常为家庭主妇穿着"
	icon_state = "tradwife_yellow"
	item_state = "tradwife_yellow"

/obj/item/clothing/under/tradwife/orange
	name = "橙色传统连衣裙"
	desc = "一种20世纪早期风格的连衣裙,剪裁合身,常为家庭主妇穿着"
	icon_state = "tradwife_orange"
	item_state = "tradwife_orange"

/obj/item/clothing/under/tradwife/purple
	name = "紫色传统连衣裙"
	desc = "一种20世纪早期风格的连衣裙,剪裁合身,常为家庭主妇穿着"
	icon_state = "tradwife_purple"
	item_state = "tradwife_purple"

/obj/item/clothing/under/tradwife/red
	name = "红色传统连衣裙"
	desc = "一种20世纪早期风格的连衣裙,剪裁合身,常为家庭主妇穿着"
	icon_state = "tradwife_red"
	item_state = "tradwife_red"

/obj/item/clothing/suit/storage/jacket/black_suit
	name = "黑色西装"
	desc = "一套正式的黑色西装."
	icon_state = "black_suit"
	item_state = "black_suit"

/obj/item/clothing/suit/storage/jacket/really_black_suit
	name = "深黑色西装"
	desc = "一套非常黑的正式西装."
	icon_state = "really_black_suit"
	item_state = "really_black_suit"

/obj/item/clothing/suit/storage/jacket/charcoal_suit
	name = "炭灰色西装"
	desc = "一套正式的炭灰色西装."
	icon_state = "charcoal_suit"
	item_state = "charcoal_suit"

/obj/item/clothing/suit/storage/jacket/navy_suit
	name = "藏青色西装"
	desc = "一套正式的藏青色西装."
	icon_state = "navy_suit"
	item_state = "navy_suit"

/obj/item/clothing/suit/storage/jacket/checkered_suit
	name = "格纹西装"
	desc = "一套正式的灰色格纹西装."
	icon_state = "checkered_suit"
	item_state = "checkered_suit"

/obj/item/clothing/suit/storage/jacket/burgundy_suit
	name = "酒红色西装"
	desc = "一套正式的酒红色西装."
	icon_state = "burgundy_suit"
	item_state = "burgundy_suit"


/obj/item/clothing/suit/storage/jacket/white_suit
	name = "白色西装"
	desc = "一套正式的白色西装."
	icon_state = "white_suit"
	item_state = "white_suit"


/obj/item/clothing/accessory/tie
	name = "黑色领带"
	desc = "一条黑色领带."
	icon_state = "black_tie"
	item_state = "black_tie"
	slot = "tie"

/obj/item/clothing/accessory/tie/red
	name = "红色领带"
	desc = "一条红色领带."
	icon_state = "red_tie"
	item_state = "red_tie"

/obj/item/clothing/accessory/tie/blue
	name = "蓝色领带"
	desc = "一条蓝色领带."
	icon_state = "blue_tie"
	item_state = "blue_tie"

/obj/item/clothing/accessory/tie/bowtie
	name = "黑色领结"
	desc = "一个黑色领结."
	icon_state = "black_bowtie"
	item_state = "black_bowtie"

/obj/item/weapon/material/sword/shashka
	name = "恰西克马刀"
	desc = "一把高加索马刀,非常锋利,设计为单手使用."
	icon_state = "shashka"
	item_state = "longsword"
	throw_speed = 4
	throw_range = 5
	force_divisor = 0.7 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 14 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 22
	cooldownw = 7
	value = 60

/obj/item/clothing/head/ww/cheka
	name = "契卡帽"
	desc = "一顶契卡特工佩戴的黑色皮革帽."
	icon_state = "cheka"
	item_state = "cheka"

/obj/item/clothing/head/ww/papakha
	name = "帕帕哈帽"
	desc = "一顶传统的高加索帽."
	icon_state = "papakha"
	item_state = "papakha"

/obj/item/clothing/head/ww/papakha/white
	name = "白色帕帕哈帽"
	desc = "一顶传统的高加索帽."
	icon_state = "papakha_white"
	item_state = "papakha_white"

/obj/item/clothing/head/ww/papakha/kuban
	name = "库班帕帕哈帽"
	desc = "一顶传统的库班哥萨克帕帕哈帽,黑色帽身配红色帽顶."
	icon_state = "papakha_kuban"
	item_state = "papakha_kuban"

/obj/item/clothing/head/helmet/modern/pickelhaube
	name = "铁制尖顶盔"
	desc = "一顶典型的尖顶头盔."
	icon_state = "pickelhaube"
	item_state = "pickelhaube"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww/budenovka
	name = "布琼尼帽"
	desc = "一顶苏联布琼尼帽."
	icon_state = "budenovka"
	item_state = "budenovka"

/obj/item/clothing/head/helmet/modern/stahlhelm
	name = "M1935 德式钢盔"
	desc = "一顶典型的德国头盔."
	icon_state = "stahlhelm"
	item_state = "stahlhelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 15, energy = 15, bomb = 55, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/brodie
	name = "铁制布罗迪盔"
	desc = "一顶典型的圆顶头盔."
	icon_state = "brodie"
	item_state = "brodie"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 35, gun = 10, energy = 15, bomb = 45, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/pith
	name = "木髓盔"
	desc = "一顶典型的热带头盔."
	icon_state = "pith"
	item_state = "pith"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)

/obj/item/clothing/suit/storage/jacket/doctor
	name = "白色实验服"
	desc = "一件白色实验服."
	icon_state = "labcoat"
	item_state = "labcoat"
	var/closed = TRUE

/obj/item/clothing/suit/storage/jacket/doctor/verb/toggle()
	set category = null
	set src in usr
	set name = "Adjust lab coat"
	if (type != /obj/item/clothing/suit/storage/jacket/doctor)
		return
	else
		if(closed)
			item_state = "labcoat_open"
			icon_state = "labcoat_open"
			item_state_slots["w_uniform"] = "labcoat_open"
			to_chat(usr, "你<b>敞开</b>你的夹克.")
			closed = FALSE
			update_clothing_icon()
		else if (!closed)
			item_state = "labcoat"
			icon_state = "labcoat"
			item_state_slots["w_uniform"] = "labcoat"
			to_chat(usr, "你<b>合上</b>你的夹克.")
			closed = TRUE
			update_clothing_icon()

/obj/item/clothing/suit/storage/jacket/surgeon
	name = "手术围裙"
	desc = "一件蓝色塑料手术围裙."
	icon_state = "surgical"
	item_state = "surgical"

/obj/item/clothing/suit/storage/jacket/coveralls
	name = "连体工作服"
	desc = "一件蓝色连体工作服,可以隔热."
	icon_state = "coveralls"
	item_state = "coveralls"
	var/rolled = FALSE

/obj/item/clothing/suit/storage/jacket/coveralls/verb/roll_down_suit()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/suit/storage/jacket/coveralls)
		return
	else
		if (rolled)
			item_state = "coveralls"
			item_state_slots["w_suit"] = "coveralls"
			to_chat(usr, "<span class = 'danger'>你卷下你的连体工作服.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			heat_protection = ARMS|UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()
		else if (!rolled)
			item_state = "coveralls_down"
			item_state_slots["w_suit"] = "coveralls_down"
			to_chat(usr, "<span class = 'danger'>你卷起你的连体工作服.</span>")
			rolled = TRUE
			heat_protection = UPPER_TORSO|ARMS
			cold_protection = LOWER_TORSO|LEGS
			update_clothing_icon()
/obj/item/weapon/storage/belt/largepouches
	name = "大口袋"
	desc = "一条带有两个大口袋的腰带,可以装下机枪弹链等大件物品."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "largepouches"
	item_state = "largepouches"
	storage_slots = 2
	max_w_class = 3
	max_storage_space = 9
	show_above_suit = TRUE
/obj/item/weapon/storage/belt/largepouches/green
	icon_state = "largepouches_green"
	item_state = "largepouches_green"
/obj/item/weapon/storage/belt/largepouches/olive
	icon_state = "largepouches_olive"
	item_state = "largepouches_olive"
/obj/item/weapon/storage/belt/largepouches/white
	icon_state = "largepouches_white"
	item_state = "largepouches_white"
/obj/item/weapon/storage/belt/largepouches/white/pkm
/obj/item/weapon/storage/belt/largepouches/white/pkm/New()
	..()
	new /obj/item/ammo_magazine/pkm/c100(src)
	new /obj/item/ammo_magazine/pkm/c100(src)
/obj/item/weapon/storage/belt/largepouches/white/rpk
/obj/item/weapon/storage/belt/largepouches/white/rpk/New()
	..()
	new /obj/item/ammo_magazine/rpk74(src)
	new /obj/item/ammo_magazine/rpk74(src)
/obj/item/weapon/storage/belt/largepouches/white/rpd
/obj/item/weapon/storage/belt/largepouches/white/rpd/New()
	..()
	new /obj/item/ammo_magazine/rpd(src)
	new /obj/item/ammo_magazine/rpd(src)
/obj/item/weapon/storage/belt/smallpouches
	name = "小口袋"
	desc = "一条带有4个小口袋的腰带,可以装下弹匣、刀具和其他小物件."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "smallpouches"
	item_state = "smallpouches"
	storage_slots = 4
	max_w_class = 2
	max_storage_space = 8
	show_above_suit = TRUE

/obj/item/weapon/storage/belt/smallpouches/white
	icon_state = "smallpouches_white"
	item_state = "smallpouches_white"

/obj/item/weapon/storage/belt/smallpouches/white/stormtroomper
	storage_slots = 6
	max_storage_space = 12
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(src)
		new /obj/item/weapon/handcuffs/strips(src)
		new /obj/item/weapon/handcuffs/strips(src)
		new /obj/item/weapon/grenade/flashbang/galaxywars(src)

/obj/item/weapon/storage/belt/smallpouches/white/stormtroomper/basic
	New()
		..()
		new /obj/item/weapon/grenade/flashbang/galaxywars(src)
		new /obj/item/weapon/grenade/modern/thermaldetonator(src)

/obj/item/weapon/storage/belt/smallpouches/white/stormtroomper/sgt
	New()
		..()
		new /obj/item/weapon/grenade/incendiary/incendiarydetonator(src)
		new /obj/item/weapon/plastique(src)

/obj/item/weapon/storage/belt/smallpouches/white/stormtroomper/flash
	New()
		..()
		new /obj/item/weapon/grenade/flashbang/galaxywars(src)
		new /obj/item/weapon/grenade/flashbang/galaxywars(src)

/obj/item/weapon/storage/belt/smallpouches/rebel
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(src)
		new /obj/item/weapon/wrench(src)
		new /obj/item/weapon/grenade/modern/thermaldetonator(src)
		new /obj/item/weapon/grenade/modern/thermaldetonator(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2_sgt
	storage_slots = 6
/obj/item/weapon/storage/belt/smallpouches/us_ww2_sgt/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 3, i++)
		new /obj/item/ammo_magazine/thompson(src)
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2_sgtc
	storage_slots = 6
/obj/item/weapon/storage/belt/smallpouches/us_ww2_sgtc/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 3, i++)
		new /obj/item/ammo_magazine/m1carbine(src)
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2_sniper
	max_w_class = 3
/obj/item/weapon/storage/belt/smallpouches/us_ww2_sniper/New()
	..()
	new /obj/item/ammo_magazine/springfield(src)
	new /obj/item/ammo_magazine/springfield(src)
	new /obj/item/ammo_magazine/m3006box(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2_gunner
	storage_slots = 6
	max_storage_space = 12
/obj/item/weapon/storage/belt/smallpouches/us_ww2_gunner/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 5, i++)
		new /obj/item/ammo_magazine/bar(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2
/obj/item/weapon/storage/belt/smallpouches/us_ww2/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 3, i++)
		new /obj/item/ammo_magazine/garand(src)

/obj/item/weapon/storage/belt/smallpouches/us_ww2_grease
/obj/item/weapon/storage/belt/smallpouches/us_ww2_grease/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 3, i++)
		new /obj/item/ammo_magazine/greasegun(src)

/obj/item/weapon/storage/belt/smallpouches/green
	icon_state = "smallpouches_green"
	item_state = "smallpouches_green"


/obj/item/weapon/storage/belt/smallpouches/green/bint
/obj/item/weapon/storage/belt/smallpouches/green/bint/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)

/obj/item/weapon/storage/belt/smallpouches/green/chechoff
/obj/item/weapon/storage/belt/smallpouches/green/chechoff/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/horn(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka(src)

/obj/item/weapon/storage/belt/smallpouches/green/rusoff
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/green/rusoff/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)

/obj/item/weapon/storage/belt/smallpouches/green/officeruni
	storage_slots = 4
/obj/item/weapon/storage/belt/smallpouches/green/officeruni/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka(src)
	new /obj/item/weapon/compass(src)

/obj/item/weapon/storage/belt/smallpouches/green/insuroff
/obj/item/weapon/storage/belt/smallpouches/green/insuroff/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/horn(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/officer/tea(src)

/obj/item/weapon/storage/belt/smallpouches/green/mosin
/obj/item/weapon/storage/belt/smallpouches/green/mosin/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<= 3, i++)
		new /obj/item/ammo_magazine/mosin (src)

/obj/item/weapon/storage/belt/smallpouches/green/mosinsniper
	max_w_class = 3

/obj/item/weapon/storage/belt/smallpouches/green/mosinsniper/New()
	..()
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/ammo_magazine/mosin (src)
	new /obj/item/ammo_magazine/mosinbox (src)

/obj/item/weapon/storage/belt/smallpouches/rusoff
/obj/item/weapon/storage/belt/smallpouches/rusoff/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/whistle(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka(src)

/obj/item/weapon/storage/belt/smallpouches/olive
	icon_state = "smallpouches_olive"
	item_state = "smallpouches_olive"

/obj/item/weapon/storage/belt/smallpouches/olive/m16
/obj/item/weapon/storage/belt/smallpouches/olive/m16/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/m16(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/m16_smoke
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/olive/m16_smoke/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/m16(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/m16_grenade
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/olive/m16_grenade/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/m16(src)
	new /obj/item/weapon/grenade/coldwar/m67(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/m16_breacher
	storage_slots = 7
/obj/item/weapon/storage/belt/smallpouches/olive/m16_breacher/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/m16(src)
	new /obj/item/weapon/plastique/c4(src)
	new /obj/item/weapon/plastique/c4(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)
	new /obj/item/weapon/siegeladder/grapplinghook(src)

/obj/item/weapon/storage/belt/smallpouches/olive/us_sgt
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/olive/us_sgt/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/us_lt
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/olive/us_lt/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/ammo_magazine/greasegun(src)
	new /obj/item/ammo_magazine/greasegun(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/us_gren
	can_hold = list(
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/ammo_magazine,
		/obj/item/stack/medical/bruise_pack/gauze
	)
/obj/item/weapon/storage/belt/smallpouches/olive/us_gren/New()
	..()
	new /obj/item/ammo_magazine/m1911(src)
	new /obj/item/ammo_magazine/m1911(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/m14
/obj/item/weapon/storage/belt/smallpouches/olive/m14/New()
	..()
	new /obj/item/ammo_magazine/m14(src)
	new /obj/item/ammo_magazine/m14(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/olive/greasegun
/obj/item/weapon/storage/belt/smallpouches/olive/greasegun/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/greasegun(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/ak74m_smoke
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/green/ak74m_smoke/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/weapon/grenade/smokebomb/rdg2(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/ak74m_trench
	storage_slots = 5
/obj/item/weapon/storage/belt/smallpouches/green/ak74m_trench/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/weapon/foldable_shovel/trench/etool(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/ak74m_breacher
	storage_slots = 7
/obj/item/weapon/storage/belt/smallpouches/green/ak74m_breacher/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/weapon/plastique/c4(src)
	new /obj/item/weapon/plastique/c4(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)
	new /obj/item/weapon/siegeladder/grapplinghook(src)

/obj/item/clothing/under/blue_shorts
	name = "蓝色短裤"
	desc = "基本的蓝色短裤."
	icon_state = "shorts_blue"
	item_state = "shorts_blue"

/obj/item/clothing/under/red_shorts
	name = "红色短裤"
	desc = "基本的红色短裤"
	icon_state = "shorts_red"
	item_state = "shorts_red"

/obj/item/clothing/under/yellow_shorts
	name = "黄色短裤"
	desc = "基本的黄色短裤"
	icon_state = "shorts_yellow"
	item_state = "shorts_yellow"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////PHILIPPINE-AMERICAN WAR///////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/ph_us_war/filipino
/obj/item/clothing/head/ph_us_war/filipino/fil_off_cap
	name = "菲律宾军官帽"
	desc = "菲律宾共和国军军官佩戴的帽子."
	icon_state = "fil_off_cap"
	item_state = "fil_off_cap"

/obj/item/clothing/head/ph_us_war/filipino/baliwag
	name = "巴利瓦格"
	desc = "西班牙人和菲律宾人常戴的帽子, 这顶带有菲律宾共和国军的标记."
	icon_state = "baliwag"
	item_state = "baliwag"
	var/adjusted = FALSE
/obj/item/clothing/head/ph_us_war/filipino/baliwag/verb/adjust()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ph_us_war/filipino/baliwag)
		return
	else
		if (adjusted)
			item_state = "baliwag"
			item_state_slots["slot_head"] = "baliwag"
			to_chat(usr, "<span class = 'danger'>你拉下你的帽子.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "baliwag_down"
			item_state_slots["slot_head"] = "baliwag_down"
			to_chat(usr, "<span class = 'danger'>你推起你的帽子.</span>")
			adjusted = TRUE
	update_clothing_icon()
/obj/item/clothing/under/ph_us_war/filipino
/obj/item/clothing/under/ph_us_war/filipino/filuni
	name = "菲律宾共和国军制服"
	desc = "一件标准的菲律宾共和国军制服."
	icon_state = "filuni"
	item_state = "filuni"
	var/rolled = FALSE

/obj/item/clothing/under/ph_us_war/filipino/filuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ph_us_war/filipino/filuni)
		return
	else
		if (rolled)
			item_state = "filuni"
			item_state_slots["w_uniform"] = "filuni"
			to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "filuni_rolled"
			item_state_slots["w_uniform"] = "filuni_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ph_us_war/filipino/tiradores
	name = "死亡射手制服"
	desc = "一件标准的菲律宾共和国军制服."
	icon_state = "filuni_sniper"
	item_state = "filuni_sniper"
	var/rolled = FALSE

/obj/item/clothing/under/ph_us_war/filipino/tiradores/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ph_us_war/filipino/tiradores)
		return
	else
		if (rolled)
			item_state = "filuni_sniper"
			item_state_slots["w_uniform"] = "filuni_sniper"
			to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "filuni_sniper_rolled"
			item_state_slots["w_uniform"] = "filuni_sniper_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ph_us_war/american
/obj/item/clothing/under/ph_us_war/american/us_uni
	name = "美军制服"
	desc = "一件标准的热带美军制服."
	icon_state = "us_fp"
	item_state = "us_fp"
	var/rolled = FALSE

/obj/item/clothing/under/ph_us_war/american/us_uni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ph_us_war/american/us_uni)
		return
	else
		if (rolled)
			item_state = "us_fp"
			item_state_slots["w_uniform"] = "us_fp"
			to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "us_fp_rolled"
			item_state_slots["w_uniform"] = "us_fp_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ph_us_war/american/us_off_uni
	name = "美军军官制服"
	desc = "一件标准的热带美军军官制服."
	icon_state = "us_fp_off"
	item_state = "us_fp_off"
	var/rolled = FALSE

/obj/item/clothing/under/ph_us_war/american/us_off_uni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ph_us_war/american/us_off_uni)
		return
	else
		if (rolled)
			item_state = "us_fp_off"
			item_state_slots["w_uniform"] = "us_fp_off"
			to_chat(usr, "<span class = 'danger'>你放下你的制服袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "us_fp_off_rolled"
			item_state_slots["w_uniform"] = "us_fp_off_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起你的制服袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/head/ph_us_war/american
/obj/item/clothing/head/ph_us_war/american/infantry_hat
	name = "美军帽子"
	desc = "热带气候下美军士兵佩戴的帽子."
	icon_state = "us_fp_hat"
	item_state = "us_fp_hat"

/obj/item/clothing/head/ph_us_war/american/infantry_hat/civie
	name = "牛仔帽"
	desc = "时尚乡村人士佩戴的帽子."

/obj/item/clothing/accessory/storage/webbing/filipino
	name = "菲律宾挂具"
	desc = "8个黑色皮革弹药包."
	icon_state = "fp_webbing"
	item_state = "fp_webbing"
	slots = 8
	New()
		..()
		hold.can_hold = list(/obj/item/ammo_magazine, /obj/item/weapon/material/kitchen/utensil/knife, /obj/item/weapon/attachment/bayonet, /obj/item/weapon/grenade, /obj/item/weapon/attachment, /obj/item/weapon/handcuffs, /obj/item/ammo_casing, /obj/item/weapon/reagent_containers/food/drinks/bottle/canteen, /obj/item/weapon/material/shovel, /obj/item/weapon/key)

/obj/item/clothing/suit/storage/coat/winter_coat
	name = "棕色冬季大衣"
	desc = "一件厚实的冬季大衣."
	icon_state = "winter_coat"
	item_state = "winter_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

//////spanish civil war

/obj/item/clothing/under/spain/republican //recolored russian ww1 uniform cause they look very similiar
	name = "西班牙共和军制服"
	desc = "西班牙共和军使用的制服."
	icon_state = "spanishrepublican"
	item_state = "spanishrepublican"

/obj/item/clothing/under/spain/nationalist
	name = "西班牙国民军制服"
	desc = "西班牙国民军使用的制服."
	icon_state = "spanishnationalist"
	item_state = "spanishnationalist"

/obj/item/clothing/under/spain/brigadist
	name = "国际纵队制服"
	desc = "一件廉价的蓝色制服."
	icon_state = "intbrigadist"
	item_state = "intbrigadist"

// Blugoslavia
/obj/item/clothing/under/blugoslavia/standard
	name = "布卢戈斯拉维亚制服"
	desc = "布卢戈斯拉维亚使用的显眼制服."
	icon_state = "baf_standard"
	item_state = "baf_standard"

/obj/item/clothing/under/blugoslavia/standard/combat
	name = "布卢戈斯拉维亚迷彩制服"
	desc = "一件布卢戈斯拉维亚作战制服, 带有轻微迷彩."
	icon_state = "baf_standardc"
	item_state = "baf_standardc"

/obj/item/clothing/under/blugoslavia/standard/squadlead
	name = "布卢戈斯拉维亚迷彩制服"
	desc = "一件布卢戈斯拉维亚作战制服, 由班长使用."
	icon_state = "baf_standardc"
	item_state = "baf_standardc"

/obj/item/clothing/under/blugoslavia/standard/command
	name = "布卢戈斯拉维亚礼服"
	desc = "布卢戈斯拉维亚的礼服, 由军官和指挥官使用."
	icon_state = "baf_command"
	item_state = "baf_command"

// Redmenia
/obj/item/clothing/under/redmenia/standard
	name = "雷德梅尼亚军制服"
	desc = "布卢戈斯拉维亚使用的显眼制服."
	icon_state = "rdf_standard"
	item_state = "rdf_standard"

/obj/item/clothing/under/redmenia/standard/combat
	name = "雷德梅尼亚迷彩制服"
	desc = "一件雷德梅尼亚作战制服, 带有轻微迷彩."
	icon_state = "rdf_standardc"
	item_state = "rdf_standardc"

/obj/item/clothing/under/redmenia/standard/squadlead
	name = "雷德梅尼亚迷彩制服"
	desc = "一件雷德梅尼亚作战制服, 由班长使用."
	icon_state = "rdf_standardc"
	item_state = "rdf_standardc"

/obj/item/clothing/under/redmenia/standard/command
	name = "雷德梅尼亚礼服"
	desc = "雷德梅尼亚的礼服, 由军官和指挥官使用."
	icon_state = "rdf_command"
	item_state = "rdf_command"

/obj/item/clothing/under/redmenia/standard/modern
	name = "雷德梅尼亚迷彩制服"
	desc = "一件雷德梅尼亚作战制服, 带有轻微迷彩."
	icon_state = "rdf_modern"
	item_state = "rdf_modern"
