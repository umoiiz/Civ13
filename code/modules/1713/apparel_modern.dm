/*Index*/
/* * - 1 Armor Plates
   * - 1a Armored Plate Suits
   * - 1b Carrier & Plate Carrier Vests
   /////////////////////////////////////
   * - 2 Us Army
   * - 2a Us Army Armor
   * - 2a1 PASGT Armor
   * - 2a2 US Lightweight Helmets
   * - 2b US Army Clothing
   * - 2c Russian Army Clothing
   /////////////////////////////////////
   * - 3 USSR helmets
   * - 4 Hezbollah
   /////////////////////////////////////
   * - 5 Insurgents
   * - 5a Insurgent Clothing
   * - 5b Insurgent Objects
   * - 6 IDF Armor & Clothing
   /////////////////////////////////////
   * - 7 Kevlar Suits & Helmets
   * - 8 Motorist
   * - 9 Punk
   /////////////////////////////////////
   * - 10 Emergency Services
   * - 10a Emergency Services Armor
   * - 10b Emergency Services Clothing
   * - 10c Emergency Services Objects
   /////////////////////////////////////
   * - 11 Miscallenous
   * - 11a Tactical
   * - 11b IOG armor
   * - 11c Scrap Armor*/
   /////////////////////////////////////

// Foreword - Objects of this Category are typically late Cold War to present, in a range of 1960 - 2013
// as such, more thing need to be properly distributed to apparel_coldwar.dm when time allows.

/obj/item/clothing/accessory/armor/coldwar/plates
	var/slots = 2
	var/obj/item/weapon/storage/internal/hold

/obj/item/clothing/accessory/armor/coldwar/plates/New()
	..()
	hold = new/obj/item/weapon/storage/internal(src)
	hold.storage_slots = slots
	hold.can_hold = list(/obj/item/weapon/armorplates, /obj/item/ammo_magazine,)

/obj/item/clothing/accessory/armor/coldwar/plates/attack_hand(mob/user as mob)
	if (has_suit)	//if we are part of a suit
		hold.open(user)
		return

	if (hold.handle_attack_hand(user))	//otherwise interact as a regular storage item
		..(user)

/obj/item/clothing/accessory/armor/coldwar/plates/MouseDrop(obj/over_object as obj)
	if (has_suit)
		return

	if (hold.handle_mousedrop(usr, over_object))
		..(over_object)

/obj/item/clothing/accessory/armor/coldwar/plates/attackby(obj/item/W as obj, mob/user as mob)
	return hold.attackby(W, user)

/obj/item/clothing/accessory/armor/coldwar/plates/emp_act(severity)
	hold.emp_act(severity)
	..()

/obj/item/clothing/accessory/armor/coldwar/plates/attack_self(mob/user as mob)
	to_chat(user, "<span class='notice'>你清空了[src].</span>")
	var/turf/T = get_turf(src)
	hold.hide_from(usr)
	for (var/obj/item/I in hold.contents)
		hold.remove_from_storage(I, T)
	add_fingerprint(user)

/* Armor Plates*/

/obj/item/weapon/armorplates
	name = "防弹插板"
	desc = "用于提高某些防弹衣的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "plates"
	item_state = "plates"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 8.0
	throwforce = 6.0

	attack_verb = list("bashed", "bludgeoned", "whacked")
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL
	var/protection = 10

/obj/item/weapon/armorplatesswimmer
	name = "游泳者插板"
	desc = "用于提高某些防弹衣的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "swimmerplate"
	item_state = "swimmerplate"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 8.0
	throwforce = 6.0

	attack_verb = list("bashed", "bludgeoned", "whacked")
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/armorplatessharpshooter
	name = "神射手插板"
	desc = "用于提高某些防弹衣的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "sharpshooter"
	item_state = "sharpshooter"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 8.0
	throwforce = 6.0

	attack_verb = list("bashed", "bludgeoned", "whacked")
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/armorplate
	name = "护甲插板"
	desc = "用于提高某些防弹衣的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "plate1"
	item_state = "plate1"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 8.0
	throwforce = 6.0

	attack_verb = list("bashed", "bludgeoned", "whacked")
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/accessory/armor/knee_protections
	name = "护膝"
	desc = "用于提高腿部的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "knee_protections"
	item_state = "knee_protections"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 6.0
	throwforce = 3.0
	slot = "leg_armor"

	attack_verb = list("bashed", "bludgeoned", "whacked")
	body_parts_covered = LEGS
	armor = list(melee = 75, arrow = 50, gun = 15, energy = 25, bomb = 55, bio = 20, rad = FALSE)
	slowdown = 0.1
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/accessory/armor/legguards
	name = "护腿"
	desc = "用于提高腿部的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "legguards"
	item_state = "legguards"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 6.0
	throwforce = 3.0
	slot = "leg_armor"

	attack_verb = list("bashed", "bludgeoned", "whacked")
	body_parts_covered = LEGS
	armor = list(melee = 75, arrow = 50, gun = 30, energy = 32, bomb = 55, bio = 20, rad = FALSE)
	slowdown = 0.3
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/accessory/armor/elbow_protections
	name = "护肘"
	desc = "用于提高手臂的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "elbow_protections"
	item_state = "elbow_protections"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 6.0
	throwforce = 3.0
	slot = "arm_armor"

	attack_verb = list("bashed", "bludgeoned", "whacked")
	body_parts_covered = ARMS
	armor = list(melee = 65, arrow = 45, gun = 15, energy = 25, bomb = 55, bio = 20, rad = FALSE)
	slowdown = 0.1
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/accessory/armor/armguards
	name = "护臂"
	desc = "用于提高手臂的防护能力."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "armguards"
	item_state = "armguards"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 6.0
	throwforce = 3.0
	slot = "arm_armor"

	attack_verb = list("bashed", "bludgeoned", "whacked")
	body_parts_covered = ARMS
	armor = list(melee = 75, arrow = 50, gun = 30, energy = 32, bomb = 55, bio = 20, rad = FALSE)
	slowdown = 0.1
	sharp = FALSE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL

	/* Armored Plate Suits*/

/obj/item/clothing/accessory/armor/coldwar/plates/interceptor
	name = "黑色拦截者防弹衣"
	desc = "可穿戴的护甲,甚至能挡住部分步枪子弹.可装配插板以提高防护能力."
	icon_state = "iba_black"
	item_state = "iba_black"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 75, arrow = 100, gun = 65, energy = 25, bomb = 65, bio = 20, rad = FALSE)
	value = 120
	slowdown = 0.4
	w_class = ITEM_SIZE_LARGE
	weight = 6

/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ucp
	name = "UCP拦截者防弹衣"
	desc = "可穿戴的护甲,甚至能挡住部分步枪子弹.可装配插板以提高防护能力.这件采用通用迷彩图案."
	icon_state = "iba_ucp"
	item_state = "iba_ucp"

/obj/item/clothing/accessory/armor/coldwar/plates/interceptor/ocp
	name = "OCP拦截者防弹衣"
	desc = "可穿戴的护甲,甚至能挡住部分步枪子弹.可装配插板以提高防护能力.这件采用作战迷彩图案."
	icon_state = "iba_ocp"
	item_state = "iba_ocp"

	/* Carrier & Plate Carrier Vests */

/obj/item/clothing/accessory/armor/coldwar/plates/platecarrier
	name = "沙色防弹背心"
	desc = "一种可存放弹匣和袋子的防弹背心.这件是沙色的."
	icon_state = "platecarrier_tan"
	item_state = "platecarrier_tan"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, arrow = 20, gun = 40, energy = 20, bomb = 30, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.1
	w_class = ITEM_SIZE_LARGE
	weight = 1.0

/obj/item/clothing/accessory/armor/coldwar/plates/platecarriergreen
	name = "橄榄色防弹背心"
	desc = "一种可存放弹匣和袋子的防弹背心.这件是橄榄色的."
	icon_state = "platecarrier_green"
	item_state = "platecarrier_green"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, arrow = 20, gun = 40, energy = 20, bomb = 30, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.1
	w_class = ITEM_SIZE_LARGE
	weight = 1.0

/obj/item/clothing/accessory/armor/coldwar/plates/platecarrierblack
	name = "黑色防弹背心"
	desc = "一种可存放弹匣和袋子的防弹背心.这件是黑色的."
	icon_state = "platecarrier_black"
	item_state = "platecarrier_black"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, arrow = 20, gun = 40, energy = 20, bomb = 30, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.1
	w_class = ITEM_SIZE_LARGE
	weight = 1.0

/obj/item/clothing/accessory/armor/nomads/pcarriertan
	name = "沙色携板背心"
	desc = "一件带袋子的凯夫拉背心,它是沙色的."
	icon_state = "pcarrier_tan"
	item_state = "pcarrier_tan"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 65, arrow = 95, gun = 76, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.35
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/clothing/accessory/armor/nomads/pcarrierblack
	name = "黑色携板背心"
	desc = "一件带袋子的凯夫拉背心,它是黑色的."
	icon_state = "pcarrier_black"
	item_state = "pcarrier_black"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 65, arrow = 95, gun = 76, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.35
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/clothing/accessory/armor/nomads/thickcarrier
	name = "重型携板背心"
	desc = "一件用于携带各种物品的沙色携板背心."
	icon_state = "thickcarrier"
	item_state = "thickcarrier"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, arrow = 30, gun = 78, energy = 16, bomb = 30, bio = 15, rad = FALSE)
	value = 90
	slowdown = 0.10
	w_class = ITEM_SIZE_NORMAL
	weight = 3.0

/obj/item/clothing/accessory/armor/coldwar/plates/platecarrier_ukraine
	name = "UARM防弹背心"
	desc = "一种可存放弹匣和袋子的防弹背心.这件由UARM制造."
	icon_state = "ukraine_armor"
	item_state = "ukraine_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 40, arrow = 20, gun = 40, energy = 20, bomb = 30, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.1
	w_class = ITEM_SIZE_LARGE
	weight = 1.0
	slots = 3

/obj/item/clothing/accessory/armor/coldwar/plates/b45
	name = "6B45防弹衣"
	desc = "一款俄制现代防弹衣."
	icon_state = "6b45"
	item_state = "6b45"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 67, arrow = 95, gun = 52, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.2
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/clothing/accessory/armor/coldwar/plates/b45/ext
	name = "6B45扩展防弹衣"
	desc = "一款俄制现代防弹衣."
	icon_state = "6b45_ext"
	item_state = "6b45_ext"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 70, arrow = 95, gun = 60, energy = 22, bomb = 65, bio = 20, rad = FALSE)
	value = 130
	slowdown = 0.4
	w_class = ITEM_SIZE_LARGE
	weight = 4.2

/obj/item/clothing/accessory/armor/coldwar/plates/b46
	name = "6B46防弹衣"
	desc = "一款俄制现代防弹背心.这件被伞兵和车组人员使用,因为它是6B45的轻量版本."
	icon_state = "6b46"
	item_state = "6b46"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, arrow = 95, gun = 50, energy = 22, bomb = 55, bio = 20, rad = FALSE)
	value = 150
	slowdown = 0.1
	w_class = ITEM_SIZE_LARGE
	weight = 3.2

/* Us Army*/

	/* Us Army Armor*/

		/* PASGT Armor*/

/obj/item/clothing/head/helmet/modern/pasgt
	name = "PASGT头盔"
	desc = "一顶典型的美军PASGT头盔.这件采用美军林地迷彩图案."
	icon_state = "pasgt_woodland"
	item_state = "pasgt_woodland"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 75, gun = 55, energy = 15, bomb = 55, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/pasgt/com
	icon_state = "pasgt_woodland_com"
	item_state = "pasgt_woodland_com"
/obj/item/clothing/head/helmet/modern/pasgt/sl
	icon_state = "pasgt_woodland_sl"
	item_state = "pasgt_woodland_sl"
/obj/item/clothing/head/helmet/modern/pasgt/desert
	name = "PASGT头盔"
	desc = "典型的美国陆军PASGT头盔.这顶是美军沙漠迷彩."
	icon_state = "pasgt_desert"
	item_state = "pasgt_desert"

/obj/item/clothing/head/helmet/modern/pasgt/reddish
	name = "红色PASGT头盔"
	desc = "典型的美国陆军PASGT头盔.这顶染成了红色."
	icon_state = "pasgt_reddish"
	item_state = "pasgt_reddish"

/obj/item/clothing/head/helmet/modern/pasgt/white
	name = "白色PASGT头盔"
	desc = "典型的美国陆军PASGT头盔.这顶染成了白色."
	icon_state = "pasgt_white"
	item_state = "pasgt_white"

/obj/item/clothing/head/helmet/modern/pasgt/white/alt
	icon_state = "pasgt_white_alt"
	item_state = "pasgt_white_alt"
/obj/item/clothing/head/helmet/modern/pasgt/white/alt/two
	icon_state = "pasgt_white_alt_2"
	item_state = "pasgt_white_alt_2"

/obj/item/clothing/head/helmet/modern/pasgt/desert/New()
	..()
	if (prob(50))
		icon_state = "pasgt_desert_attachments"
		item_state = "pasgt_desert_attachments"
		update_icon()

/obj/item/clothing/accessory/armor/coldwar/pasgt
	name = "丛林迷彩PASGT防弹衣"
	desc = "可穿戴护甲,能挡住大多数手枪弹.这件是美军丛林迷彩."
	icon_state = "pasgt_woodland"
	item_state = "pasgt_woodland"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 67, arrow = 95, gun = 52, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.3
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/clothing/accessory/armor/coldwar/pasgt/khaki
	name = "卡其色PASGT防弹衣"
	desc = "可穿戴护甲,能挡住大多数手枪弹.这件是卡其色的."
	icon_state = "pasgt_khaki"
	item_state = "pasgt_khaki"

/obj/item/clothing/accessory/armor/coldwar/pasgt/green
	name = "绿色PASGT防弹衣"
	desc = "可穿戴护甲,能挡住大多数手枪弹.这件是绿色的."
	icon_state = "pasgt_green"
	item_state = "pasgt_green"

/obj/item/clothing/accessory/armor/coldwar/pasgt/blizzard
	name = "雪地迷彩PASGT防弹衣"
	desc = "可穿戴护甲,能挡住大多数手枪弹.这件是雪地迷彩."
	icon_state = "pasgt_blizzard"
	item_state = "pasgt_blizzard"

/obj/item/clothing/accessory/armor/coldwar/rb23
	name = "RB-23防弹衣"
	desc = "一件红人国出产的现代防弹背心."
	icon_state = "rb23"
	item_state = "rb23"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 70, arrow = 95, gun = 72, energy = 30, bomb = 70, bio = 20, rad = FALSE)
	slowdown = 0.1
	weight = 4.8

/obj/item/clothing/accessory/armor/coldwar/plates/b5/n34
	name = "N34-B防弹衣"
	desc = "一件2023年列装的蓝斯拉夫现代护甲,完全由凯夫拉制成,同时留有一些空间用于插板."
	icon_state = "n34bm"
	item_state = "n34bm"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 70, arrow = 95, gun = 72, energy = 30, bomb = 70, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	slots = 2
	slowdown = 0.1
	weight = 5.5

/obj/item/clothing/accessory/armor/coldwar/plates/b5/n34/medical
	name = "N34-BM防弹衣"
	desc = "一件蓝斯拉夫护甲,供医疗兵和医生使用,背面带有白色医疗十字."
	icon_state = "n34bmm"
	item_state = "n34bmm"

		/* US Lightweight Helmets*/

/obj/item/clothing/head/helmet/modern/lwh
	name = "LWH头盔"
	desc = "典型的美国陆军轻量化头盔.这顶是米色的."
	icon_state = "lwh_desert"
	item_state = "lwh_desert"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 68, arrow = 67, gun = 65, energy = 18, bomb = 65, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/lwh/black
	name = "黑色LWH头盔"
	desc = "典型的美国陆军轻量化头盔.这顶是黑色的."
	icon_state = "lwh_black"
	item_state = "lwh_black"

/obj/item/clothing/head/helmet/modern/ach
	name = "OCP ACH头盔"
	desc = "典型的美国陆军先进战斗头盔.这顶是OCP迷彩."
	icon_state = "ach_ocp"
	item_state = "ach_ocp"
	body_parts_covered = HEAD
	armor = list(melee = 75, arrow = 95, gun = 93, energy = 22, bomb = 60, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/ach/green
	name = "ACH头盔"
	desc = "典型的美国陆军先进战斗头盔.这顶是绿色的."
	icon_state = "ach_green"
	item_state = "ach_green"
/obj/item/clothing/head/helmet/modern/ach/white
	name = "ACH头盔"
	desc = "典型的美国陆军先进战斗头盔.这顶是白色的."
	icon_state = "ach_white"
	item_state = "ach_white"
/obj/item/clothing/head/helmet/modern/ach/green/com
	icon_state = "ach_green_com"
	item_state = "ach_green_com"

/obj/item/clothing/head/helmet/modern/ach/green/sl
	icon_state = "ach_green_sl"
	item_state = "ach_green_sl"
	/* US Army Clothing*/

/obj/item/clothing/under/us_uni/us_camo_dcu
	name = "沙漠迷彩制服"
	desc = "20世纪末美国陆军标准沙漠迷彩制服."
	icon_state = "us_camo_dcu"
	item_state = "us_camo_dcu"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/us_camo_woodland
	name = "丛林迷彩制服"
	desc = "20世纪末美国陆军标准迷彩制服."
	icon_state = "us_camo_woodland"
	item_state = "us_camo_woodland"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/us_camo_ucp
	name = "UCP迷彩制服"
	desc = "21世纪初美国陆军标准迷彩制服."
	icon_state = "us_camo_ucp"
	item_state = "us_camo_ucp"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/us_camo_ocp
	name = "OCP迷彩制服"
	desc = "2018年起美国陆军标准迷彩制服."
	icon_state = "us_camo_ocp"
	item_state = "us_camo_ocp"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/multicam
	name = "多地形迷彩制服"
	desc = "一种为在多种环境和条件下使用而设计的迷彩图案制服.通常配发给特种作战单位."
	icon_state = "multicam"
	item_state = "multicam"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/us_uni/multicam/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/us_uni/multicam)
		return
	else
		if (rolled)
			item_state = "multicam"
			item_state_slots["w_uniform"] = "multicam"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "multicam_rolled"
			item_state_slots["w_uniform"] = "multicam_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/us_uni/us_lightuni_modern
	name = "美国陆军训练制服"
	desc = "一套非正式着装,由OCP图案长裤和橄榄绿衬衫组成."
	icon_state = "us_lightuni_modern"
	item_state = "us_lightuni_modern"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/gloves/fingerless
	name = "黑色露指手套"
	icon_state = "fingerless"
	item_state = "fingerless"
	body_parts_covered = HANDS
	slot_flags = SLOT_GLOVES
	fingerprint_chance = 100

/obj/item/clothing/gloves/fingerless/army
	name = "露指战斗手套"
	icon_state = "fingerless"
	item_state = "fingerless"
	body_parts_covered = HANDS
	slot_flags = SLOT_GLOVES
	fingerprint_chance = 100
	armor = list(melee = 25, arrow = 25, gun = 5, energy = 22, bomb = 45, bio = 20, rad = 5)

/* US belts*/

/obj/item/weapon/storage/belt/smallpouches/us/modern/m14
/obj/item/weapon/storage/belt/smallpouches/us/modern/m14/New()
	..()
	new/obj/item/stack/medical/bruise_pack/bint(src)
	new/obj/item/ammo_magazine/m14(src)
	new/obj/item/ammo_magazine/m14(src)
	new/obj/item/ammo_magazine/m14(src)


/* Russian Army Clothing*/

/obj/item/clothing/under/rus_vsr93
	name = "俄军VSR 93制服" //Uniform used mostly in the 90's
	desc = "一套由VSR93迷彩裤和衬衫组成的制服,配有一条高腰带."
	icon_state = "rus_vsr93"
	item_state = "rus_vsr93"

/obj/item/clothing/under/omon
	name = "俄罗斯OMON制服" //Uniform used mostly in the 90's
	desc = "一套为俄罗斯联邦OMON部队设计和配发的制服."
	icon_state = "omon"
	item_state = "omon"

/* USSR Helmets*/

/obj/item/clothing/head/helmet/modern/sovietfacehelmet
	name = "MASKA 1头盔"
	desc = "一顶苏联重型装甲头盔,带有开缝面罩."
	icon_state = "sovietfacehelmet"
	item_state = "sovietfacehelmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 90, arrow = 110, gun = 96, energy = 27, bomb = 76, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/modern/sovietfacehelmet/welding
	name = "K6-3头盔"
	desc = "一顶苏联重型装甲头盔,带有焊接面罩式面罩."
	icon_state = "sovietfacehelmet" //wip
	item_state = "sovietfacehelmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 90, arrow = 110, gun = 96, energy = 27, bomb = 76, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/modern/sovietfacehelmet/nomads
	name = "MASKA 1头盔"
	desc = "一顶苏联重型装甲头盔,带有开缝面罩."
	icon_state = "sovietfacehelmet_o"
	item_state = "sovietfacehelmet_o"
	armor = list(melee = 85, arrow = 110, gun = 95, energy = 25, bomb = 75, bio = 30, rad = FALSE)
	health = 80
	slowdown = 0.45
	var/toggled = FALSE

/obj/item/clothing/head/helmet/modern/sovietfacehelmet/nomads/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/modern/sovietfacehelmet/nomads)
		return
	else
		if (toggled)
			item_state = "sovietfacehelmet_o"
			icon_state = "sovietfacehelmet_o"
			item_state_slots["slot_head"] = "sovietfacehelmet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "sovietfacehelmet"
			icon_state = "sovietfacehelmet"
			item_state_slots["slot_head"] = "sovietfacehelmet"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/modern/sovietfacehelmet/welding/nomads //also known as the
	name = "K6-3头盔"
	desc = "一顶俄罗斯重型装甲头盔,带有焊接面罩式面罩."
	icon_state = "sovietface_weldhelmet"
	item_state = "sovietface_weldhelmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 85, arrow = 110, gun = 95, energy = 25, bomb = 75, bio = 30, rad = FALSE)
	health = 80
	slowdown = 0.45
	var/toggled = FALSE

/obj/item/clothing/head/helmet/modern/sovietfacehelmet/welding/nomads/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/modern/sovietfacehelmet/welding/nomads)
		return
	else
		if (toggled)
			item_state = "sovietface_weldhelmet_o"
			icon_state = "sovietface_weldhelmet_o"
			item_state_slots["slot_head"] = "sovietface_weldhelmet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "sovietface_weldhelmet"
			icon_state = "sovietface_weldhelmet"
			item_state_slots["slot_head"] = "sovietface_weldhelmet"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE|EYES
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/modern/a6b47 //Post 2000 helmet more modern.
	name = "6B47头盔"
	desc = "一顶俄罗斯重型装甲头盔,21世纪俄军步兵部队常用."
	icon_state = "a6b47"
	item_state = "a6b47"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 75, gun = 55, energy = 15, bomb = 55, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/a6b47/emr
	icon_state = "6b47_emr"
	item_state = "6b47_emr"

/obj/item/clothing/head/helmet/modern/a6b47/emr/desert
	icon_state = "6b47_emr_desert"
	item_state = "6b47_emr_desert"

/obj/item/clothing/head/helmet/modern/a6b47/camo
	name = "迷彩6B47头盔"
	icon_state = "a6b47cam"
	item_state = "a6b47cam"

/obj/item/clothing/head/helmet/modern/a6b47/camo/blugo
	name = "蓝斯拉夫6B47头盔"
	icon_state = "a6b47b"
	item_state = "a6b47b"

/obj/item/clothing/head/helmet/modern/a6b47/camo/blugo/command
	name = "蓝斯拉夫指挥6B47头盔"
	icon_state = "a6b47bc"
	item_state = "a6b47bc"

/obj/item/clothing/head/helmet/modern/sfera //1990's helmet for reference, specific date unknown.
	name = "Sfera头盔"
	desc = "一顶俄罗斯战斗装甲头盔,苏联和俄罗斯内务部队常用."
	icon_state = "sfera_helmet"
	item_state = "sfera_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 80, arrow = 100, gun = 95, energy = 36, bomb = 76, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/modern/zsh1 //1990's helmet for reference, specific date unknown.
	name = "ZSh-1头盔"
	desc = "一顶俄罗斯重型装甲头盔,20世纪末苏联步兵部队常用."
	icon_state = "zsh1"
	item_state = "zsh1"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 80, arrow = 100, gun = 95, energy = 36, bomb = 76, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/modern/zsh2 //Post 2000 helmet like description suggests
	name = "ZSh-2头盔"
	desc = "一顶带有面罩的俄罗斯重型装甲头盔;21世纪俄军步兵部队常用."
	icon_state = "zsh2"
	item_state = "zsh2"
	body_parts_covered = HEAD|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 84, arrow = 104, gun = 98, energy = 38, bomb = 79, bio = 34, rad = FALSE)

/obj/item/clothing/head/ruscap_fed
	name = "俄罗斯联邦军大檐帽"
	desc = "俄罗斯联邦陆军佩戴的军帽."
	icon_state = "fieldcap_rus_fed"
	item_state = "fieldcap_rus_fed"

/* Hezbollah*/

/obj/item/clothing/under/us_uni/us_camo_woodland/hezbollah
	name = "林地迷彩制服"
	desc = "20世纪末美军标准迷彩制服,带有真主党徽章."
	icon_state = "us_camo_woodland_hez"
	item_state = "us_camo_woodland_hez"

/obj/item/clothing/under/us_uni/us_camo_woodland/hezbollah/officer
	name = "林地迷彩制服"
	desc = "20世纪末美军标准迷彩制服,带有军官真主党徽章."
	icon_state = "us_camo_woodland_hez_officer"
	item_state = "us_camo_woodland_hez_officer"

/* Insurgents*/
	/* Insurgent Clothing*/

/obj/item/clothing/under/insurgent_black
	name = "黑色束腰外衣"
	desc = "一套全黑的束腰外衣和长裤."
	icon_state = "insurgent_black"
	item_state = "insurgent_black"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/insurgent_sand
	name = "沙色束腰外衣"
	desc = "一套深黄色沙色束腰外衣和长裤."
	icon_state = "insurgent_sand"
	item_state = "insurgent_sand"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/insurgent_sand_woodland
	name = "沙色束腰外衣配林地迷彩长裤"
	desc = "一件深黄色沙色束腰外衣配林地迷彩长裤."
	icon_state = "insurgent_sand_woodland"
	item_state = "insurgent_sand_woodland"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/insurgent_sand_dcu
	name = "沙色制服配沙漠迷彩长裤"
	desc = "一件深黄色沙色制服配沙漠迷彩长裤."
	icon_state = "insurgent_sand_dcu"
	item_state = "insurgent_sand_dcu"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/insurgent_sand_green
	name = "浅棕色制服配绿色长裤"
	desc = "一件浅棕色制服配绿色长裤."
	icon_state = "insurgent_sand_green"
	item_state = "insurgent_sand_green"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/insurgent_leader
	name = "黑色束腰外衣配沙漠迷彩长裤"
	desc = "一件黑色束腰外衣配沙漠迷彩长裤,叛乱分子头目所穿."
	icon_state = "insurgent_leader"
	item_state = "insurgent_leader"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/head/black_bandana
	name = "黑色头巾"
	desc = "一块轻薄的黑色布料,缠绕在头部."
	icon_state = "black_bandana"
	item_state = "black_bandana"
	body_parts_covered = HEAD

/obj/item/clothing/head/black_shemagh
	name = "黑色阿拉伯头巾"
	desc = "一块轻薄的黑色布料,松散地缠绕在头部,中东国家常见."
	icon_state = "black_shemagh"
	item_state = "black_shemagh"
	body_parts_covered = HEAD
	heat_protection = HEAD|FACE|EYES

	/* Insurgent Objects*/

/obj/item/weapon/material/sword/arabsword
	name = "仪式用赛义夫剑"
	desc = "一把仪式复刻版赛义夫剑,剑身细直.军官和贵族常用."
	icon_state = "arabsword1"
	item_state = "longsword"
	throw_speed = 4
	throw_range = 5
	force_divisor = 0.75 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 14 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 26
	cooldownw = 9
	value = 60

/obj/item/weapon/material/sword/arabsword2
	name = "仪式用弯刀"
	desc = "一把仪式复刻版弯刀,剑身细弯.军官和贵族常用."
	icon_state = "arabsword2"
	item_state = "longsword"
	throw_speed = 4
	throw_range = 5
	force_divisor = 0.79 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 14 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 26
	cooldownw = 10
	value = 60

	/* IDF Armor & Clothing*/

/obj/item/clothing/under/idf
	name = "以色列国防军橄榄绿制服"
	desc = "以色列国防军的纯橄榄色制服."
	icon_state = "idf_olive"
	item_state = "idf_olive"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS

/obj/item/clothing/head/helmet/modern/idf
	name = "以色列国防军头盔"
	desc = "典型的以色列国防军头盔.这顶为以色列国防军橄榄绿色."
	icon_state = "idf"
	item_state = "idf1"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 55, gun = 51, energy = 15, bomb = 55, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/idf/New()
	..()
	item_state = pick("idf1","idf2","idf3")

/obj/item/clothing/accessory/armor/coldwar/idf
	name = "马萨达防弹衣"
	desc = "以色列可穿戴防弹衣,能挡住大多数手枪弹.这件为绿色."
	icon_state = "greenkevlarvest"
	item_state = "greenkevlarvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 67, arrow = 95, gun = 52, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.3
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/weapon/storage/belt/smallpouches/m24
/obj/item/weapon/storage/belt/smallpouches/m24/New()
	..()
	new/obj/item/stack/medical/bruise_pack/bint(src)
	new/obj/item/ammo_magazine/m24(src)
	new/obj/item/ammo_magazine/m24(src)
	new/obj/item/ammo_magazine/m24(src)

/* Kevlar Suits & Helmets*/

/obj/item/clothing/accessory/armor/nomads/kevlarblack
	name = "黑色凯夫拉防弹背心"
	desc = "标准凯夫拉,能挡住低口径子弹.这件为黑色."
	icon_state = "kevlarvest"
	item_state = "kevlarvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 80, arrow = 95, gun = 65, energy = 35, bomb = 64, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.4
	w_class = ITEM_SIZE_LARGE
	weight = 3.8

/obj/item/clothing/accessory/armor/nomads/civiliankevlar
	name = "民用凯夫拉防弹背心"
	desc = "一件商用黑色凯夫拉防弹背心."
	icon_state = "civilianvest"
	item_state = "civilianvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 90, gun = 52, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.30
	w_class = ITEM_SIZE_LARGE
	weight = 3.6

/obj/item/clothing/accessory/armor/nomads/civiliankevlar/press
	name = "记者凯夫拉防弹背心"
	desc = "一件蓝色凯夫拉防弹背心,胸前写有'PRESS'."
	icon_state = "press_kevlarvest"
	item_state = "press_kevlarvest"

/obj/item/clothing/head/helmet/kevlarhelmet/press
	name = "记者凯夫拉头盔"
	desc = "一顶标准凯夫拉防弹头盔,上面写有'PRESS'."
	icon_state = "kevlarhelmet_press"
	item_state = "kevlarhelmet_press"

/obj/item/clothing/accessory/armor/nomads/civiliankevlar/under //for TDM maps, showing under the clothing

/obj/item/clothing/head/helmet/kevlarhelmet
	name = "黑色凯夫拉头盔"
	desc = "一顶标准凯夫拉防弹头盔."
	icon_state = "kevlarhelmet"
	item_state = "kevlarhelmet"
	body_parts_covered = HEAD
	armor = list(melee = 65, arrow = 95, gun = 73, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	flags_inv = BLOCKHAIR
	health = 90

/* Motorist*/

/obj/item/clothing/head/helmet/motorcycle
	name = "摩托车头盔"
	desc = "骑车摔车时保护你的头部免受伤害."
	icon_state = "motorcycle"
	item_state = "motorcycle"
	body_parts_covered = FACE|EYES|HEAD
	flags_inv = HIDEMASK|BLOCKHAIR|BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 65, gun = 5, energy = 35, bomb = 35, bio = 30, rad = FALSE)

/obj/item/clothing/under/motorist
	name = "摩托车手服装"
	desc = "一套休闲牛仔裤和白衬衫搭配."
	icon_state = "motorist"
	item_state = "motorist"

/obj/item/clothing/under/reporter
	name = "战地记者服装"
	desc = "休闲棕色长裤和黑色衬衫,非常适合躲避枪火时奔跑."
	icon_state = "reporter"
	item_state = "reporter"

/obj/item/clothing/gloves/motorist
	name = "黑色摩托车手手套"
	icon_state = "motorist"
	item_state = "motorist"
	body_parts_covered = HANDS
	slot_flags = SLOT_GLOVES

/obj/item/clothing/shoes/sneakers/courier
	name = "快递员运动鞋"
	desc = "一双简单轻薄的灰色运动鞋."
	icon_state = "courier_sneakers"
	item_state = "courier_sneakers"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 10, gun = FALSE, energy = 8, bomb = 10, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/jacket/motorist
	name = "摩托车手夹克"
	desc = "车迷常穿的夹克,他们热爱车辆、速度以及橡胶烧焦的气味."
	icon_state = "motorist_jacket"
	item_state = "motorist_jacket"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)

/obj/item/clothing/suit/storage/jacket/rus_winter_vsr93
	name = "俄罗斯联邦军冬季夹克"
	desc = "俄罗斯联邦军使用的VSR93迷彩冬季夹克."
	icon_state = "rus_winter_vsr93"
	item_state = "rus_winter_vsr93"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)

/* Punk */

/obj/item/clothing/under/punk
	name = "朋克服装"
	desc = "一套喧闹的另类文化紫色无袖衬衫和紫色长裤,用来推翻体制."
	icon_state = "punk"
	item_state = "punk"

/obj/item/clothing/accessory/armband/punk
	name = "带钉护腕"
	desc = "一对朋克风格的带钉护腕."
	icon_state = "spiked_bracers"
	item_state = "spiked_bracers"

/obj/item/clothing/shoes/punk
	name = "朋克靴"
	desc = "一双风格化的高筒皮靴,用来把'当权者'揍得鼻青脸肿."
	icon_state = "punk"
	item_state = "punk"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 20, arrow = 10, gun = FALSE, energy = 8, bomb = 10, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/jacket/punk
	name = "朋克夹克"
	desc = "反文化人士常穿的一件宽松夹克,背面通常还能看到额外的字样."
	icon_state = "punk_vest"
	item_state = "punk_vest"
	body_parts_covered = UPPER_TORSO
	cold_protection = UPPER_TORSO
	armor = list(melee = 15, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)

/* Emergency Services*/

	/* Emergency Services Armor*/

/obj/item/clothing/head/helmet/swat
	name = "特警头盔"
	desc = "特警队员使用的标准凯夫拉头盔."
	icon_state = "swat"
	item_state = "swat"
	body_parts_covered = HEAD
	armor = list(melee = 65, arrow = 95, gun = 85, energy = 27, bomb = 64, bio = 20, rad = FALSE)
	flags_inv = BLOCKHAIR
	health = 90

/obj/item/clothing/head/helmet/swat_new
	name = "特警头盔"
	desc = "特警队员使用的标准凯夫拉头盔."
	icon_state = "swat_new"
	item_state = "swat_new"
	body_parts_covered = HEAD
	armor = list(melee = 85, arrow = 95, gun = 85, energy = 27, bomb = 70, bio = 20, rad = FALSE)
	flags_inv = BLOCKHAIR
	health = 100

	/* Emergency Services Clothing*/

/obj/item/clothing/suit/lifejacket
	name = "救生衣"
	desc = "一件红色救生衣,提高海上生存能力."
	icon_state = "sealvest"
	item_state = "sealvest"
	body_parts_covered = UPPER_TORSO
	armor = list(melee = 10, arrow = 5, gun = FALSE, energy = FALSE, bomb = FALSE, bio = 5, rad = 5)
	w_class = ITEM_SIZE_SMALL
	ripable = FALSE

/obj/item/clothing/suit/lifejacket/yellow
	name = "救生衣"
	desc = "一件黄色救生衣,提高海上生存能力."
	icon_state = "sealvest_yellow"
	item_state = "sealvest_yellow"

/obj/item/clothing/suit/lifejacket/blue
	name = "救生衣"
	desc = "一件蓝色救生衣,提高海上生存能力."
	icon_state = "sealvest_blue"
	item_state = "sealvest_blue"

/obj/item/clothing/suit/storage/jacket/highvis
	name = "高可视性夹克"
	desc = "一件黄色高可视性夹克."
	icon_state = "high_vis_jacket_yellow"
	item_state = "high_vis_jacket_yellow"

/obj/item/clothing/suit/storage/jacket/highvis/paramedic
	name = "急救员夹克"
	icon_state = "paramedic_jacket"
	item_state = "paramedic_jacket"

/obj/item/clothing/under/paramedic
	name = "急救员制服"
	desc = "急救人员制服."
	icon_state = "paramedic"
	item_state = "paramedic"

/obj/item/clothing/under/firefighter
	name = "消防员制服"
	desc = "消防员穿着的制服. 为腿部提供防热保护."
	icon_state = "firefighter"
	item_state = "firefighter"
	flammable = FALSE
	heat_protection = LOWER_TORSO|LEGS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/coat/firefighter
	name = "消防员外套"
	desc = "消防员穿着的外套. 为躯干和手臂提供防热保护."
	icon_state = "firefighter"
	item_state = "firefighter"
	flammable = FALSE
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/modern/firefighter
	name = "消防员头盔"
	desc = "消防员使用的防护防火头盔."
	icon_state = "hardhat_yellow"
	item_state = "hardhat_yellow"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/head/helmet/modern/firefighter/white
	icon_state = "hardhat_white"
	item_state = "hardhat_white"

/obj/item/clothing/under/detective1
	name = "衬衫套装"
	desc = "一件棕色衬衫搭配黑色裤子."
	icon_state = "detective1"
	item_state = "detective1"

/obj/item/clothing/under/detective2
	name = "衬衫套装"
	desc = "一件蓝色衬衫搭配黑色裤子."
	icon_state = "detective2"
	item_state = "detective2"

/obj/item/clothing/under/detective3
	name = "衬衫套装"
	desc = "一件黑色衬衫搭配灰色裤子."
	icon_state = "detective3"
	item_state = "detective3"

	/* Emergency Services Objects*/

/obj/item/weapon/storage/belt/police
	name = "警用腰带"
	desc = "可携带执法人员标准装备的腰带."
	icon_state = "gerbelt"
	item_state = "security"
	storage_slots = 10
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
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/melee/nightbaton,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/whistle,
		/obj/item/weapon/pen,
		/obj/item/stack/money,
		/obj/item/weapon/key,
		/obj/item/flashlight,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/armband/policebadge,
		/obj/item/weapon/clipboard,
		)
/obj/item/weapon/storage/belt/police/modern
/obj/item/weapon/storage/belt/police/modern/New()
	..()
	new /obj/item/weapon/material/classic_baton/nightstick(src)
	new /obj/item/flashlight/modern(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<=4, i++)
		new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/clipboard/full(src)
	new /obj/item/weapon/pen(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/police/old
/obj/item/weapon/storage/belt/police/old/New()
	..()
	new /obj/item/weapon/material/classic_baton(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<=4, i++)
		new /obj/item/weapon/handcuffs/old(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/police/bank
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
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/melee/nightbaton,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/whistle,
		/obj/item/weapon/pen,
		/obj/item/weapon/key,
		/obj/item/flashlight,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/armband/policebadge,
		/obj/item/weapon/clipboard,
		)
/obj/item/weapon/storage/belt/police/bank/New()
	..()
	new /obj/item/weapon/melee/nightbaton(src)
	new /obj/item/weapon/reagent_containers/spray/pepper(src)
	new /obj/item/flashlight/modern(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/belt/police/bank/glock/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/glock17(src)

/obj/item/weapon/storage/belt/police/bank/c38/New()
	..()
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/ammo_magazine/c38(src)
	new /obj/item/ammo_magazine/c38(src)

/obj/item/weapon/storage/belt/police/bank/p220/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/p220(src)

/obj/item/weapon/storage/belt/police/bank/m9/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/m9beretta(src)

/obj/item/weapon/storage/belt/police/m16
	icon_state = "swatbelt"
	item_state = "swatbelt"
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
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/melee/nightbaton,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/whistle,
		/obj/item/weapon/pen,
		/obj/item/weapon/key,
		/obj/item/flashlight,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/armband/policebadge,
		/obj/item/weapon/clipboard,
		)
/obj/item/weapon/storage/belt/police/m16/New()
	..()
	new /obj/item/flashlight/modern(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/handcuffs/zip(src)
	new /obj/item/weapon/handcuffs/zip(src)
	new /obj/item/ammo_magazine/glock17(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/coldwar/stinger(src)

/obj/item/weapon/storage/belt/police/mp5
	icon_state = "swatbelt"
	item_state = "swatbelt"
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
		/obj/item/weapon/melee/classic_baton,
		/obj/item/weapon/melee/nightbaton,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/whistle,
		/obj/item/weapon/pen,
		/obj/item/weapon/key,
		/obj/item/flashlight,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/clothing/accessory/armband/policebadge,
		/obj/item/weapon/clipboard,
		)
/obj/item/weapon/storage/belt/police/mp5/New()
	..()
	new /obj/item/flashlight/modern(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/handcuffs/zip(src)
	new /obj/item/weapon/handcuffs/zip(src)
	new /obj/item/ammo_magazine/glock17(src)
	new /obj/item/ammo_magazine/mp40/mp5(src)
	new /obj/item/ammo_magazine/mp40/mp5(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/grenade/coldwar/stinger(src)

/* Miscallenous*/

/obj/item/clothing/accessory/armor/nomads/baily //too broad, can't make out what detail this is actually meant to be associated with.
	name = "贝利防弹背心"
	desc = "贝利安保单位使用的背心."
	icon_state = "bailyvest"
	item_state = "bailyvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 40, arrow = 95, gun = 82, energy = 30, bomb = 35, bio = 20, rad = FALSE)
	value = 90
	slowdown = 0.2
	w_class = ITEM_SIZE_NORMAL
	weight = 2

//my nerd shit (skyfire)//

//armor//
/obj/item/clothing/suit/armor/zgz1
	name = "zgz1先进护甲"
	desc = "提供中等动能及其他弹射物防护的先进护甲. 该护甲主要由中国人使用."
	icon_state = "zgz1_armor"
	item_state = "zgz1_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 45, arrow = 90, gun = 78, energy = 50, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 0.5
	health = 60

/obj/item/clothing/suit/armor/zgz1/med
	name = "医疗zgz1先进护甲"
	desc = "提供中等动能及其他弹射物防护的先进护甲. 该护甲主要由中国医疗兵使用."
	icon_state = "zgz1med_armor"
	item_state = "zgz1med_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 45, arrow = 90, gun = 78, energy = 50, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 0.5
	health = 60
//helmets//
/obj/item/clothing/head/helmet/ft1
	name = "FT1先进头盔"
	desc = "中国人使用的极其先进的头盔."
	icon_state = "ft1_helmet"
	item_state = "ft1_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 60, gun = 80, energy = 40, bomb = 30, bio = 30, rad = FALSE)


/obj/item/clothing/head/helmet/ft1/med
	name = "医疗FT1先进头盔"
	desc = "中国医疗兵使用的极其先进的头盔."
	icon_state = "ft1med_helmet"
	item_state = "ft1med_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 60, gun = 80, energy = 40, bomb = 30, bio = 30, rad = FALSE)

	/* Tactical*/

/obj/item/clothing/head/helmet/tactical //unsure, but a white helmet is good for peacekeeper corps until a legit code entry is made.
	name = "战术头盔"
	desc = "标准防弹头盔, 由聚乙烯制成."
	icon_state = "tacticalhelmet"
	item_state = "tacticalhelmet"
	body_parts_covered = HEAD
	armor = list(melee = 75, arrow = 95, gun = 93, energy = 22, bomb = 60, bio = 20, rad = FALSE)
	flags_inv = BLOCKHAIR
	health = 90

/obj/item/clothing/under/trackpants
	name = "运动裤"
	desc = "一件衬衫搭配运动裤."
	item_state = "trackpants"
	icon_state = "trackpants"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/suit/storage/jacket/tracksuit
	name = "运动套装"
	desc = "一套运动套装."
	item_state = "tracksuit"
	icon_state = "tracksuit"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/under/tacti
	name = "战术套装"
	desc = "战术单位使用的套装."
	icon_state = "tacti"
	item_state = "tacti"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/tacticool_hawaiian
	name = "战术夏威夷套装"
	desc = "各式剩余迷彩裤搭配一件漂亮的夏威夷衬衫, 满足你所有的作战需求."
	icon_state = "tacticool_hawaiian_blue"
	item_state = "tacticool_hawaiian_blue"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/tacticool_hawaiian/green
	icon_state = "tacticool_hawaiian_green"
	item_state = "tacticool_hawaiian_green"
/obj/item/clothing/under/tacticool_hawaiian/orange
	icon_state = "tacticool_hawaiian_orange"
	item_state = "tacticool_hawaiian_orange"
/obj/item/clothing/under/tacticool_hawaiian/purple
	icon_state = "tacticool_hawaiian_purple"
	item_state = "tacticool_hawaiian_purple"

/obj/item/clothing/under/boomerwaffen1
	name = "迷彩衬衫搭配蓝色裤子"
	desc = "一件迷彩衬衫搭配蓝色裤子."
	icon_state = "boomerwaffen1"
	item_state = "boomerwaffen1"

/obj/item/clothing/under/boomerwaffen2
	name = "背心搭配迷彩裤"
	desc = "一件背心搭配迷彩裤."
	icon_state = "boomerwaffen2"
	item_state = "boomerwaffen2"

/obj/item/clothing/under/boomerwaffen3
	name = "黑色衬衫搭配迷彩裤"
	desc = "一件黑色衬衫搭配迷彩裤."
	icon_state = "boomerwaffen3"
	item_state = "boomerwaffen3"

/obj/item/clothing/under/modern_shaman
	name = "现代萨满套装"
	desc = "一套现代萨满套装."
	icon_state = "modern_shaman"
	item_state = "modern_shaman"

/obj/item/clothing/head/navyofficercap
	name = "海军军官帽"
	desc = "一顶白色军官帽."
	icon_state = "abashiri_guard_head"
	item_state = "abashiri_guard_head"

/obj/item/clothing/head/navycap
	name = "海军帽"
	desc = "水手佩戴的帽子."
	icon_state = "fieldcap_china2"
	item_state = "fieldcap_china2"

/obj/item/clothing/suit/storage/coat/frenchcoat/navy
	name = "海军风衣"
	desc = "海军军官使用的风衣."
	icon_state = "frenchtrench"
	item_state = "frenchtrench"

/obj/item/clothing/head/cap
	name = "帽子"
	desc = "一顶通用带帽檐的帽子."
	icon_state = "blackcap"
	item_state = "blackcap"
	var/base_state = "blackcap"
	var/flipped = FALSE

/obj/item/clothing/head/cap/verb/flip()
	set category = null
	set src in usr
	set name = "Flip cap"

	flipped = !flipped
	update_icon()
	update_clothing_icon()
	to_chat(usr, "你把帽子转了个方向.")

/obj/item/clothing/head/cap/update_icon()
	..()
	if (flipped)
		icon_state = "[base_state]_flipped"
		item_state = icon_state
	else
		icon_state = base_state
		item_state = icon_state

/obj/item/clothing/head/cap/tfc
	name = "TFC帽子"
	desc = "一顶红色的德州炸鸡帽子."
	icon_state = "tfc"
	item_state = "tfc"
	base_state = "tfc"

/obj/item/clothing/head/cap/red
	name = "红帽子"
	desc = "一顶红帽子."
	icon_state = "redcap"
	item_state = "redcap"
	base_state = "redcap"

/obj/item/clothing/head/cap/yellow
	name = "黄帽子"
	desc = "一顶黄帽子."
	icon_state = "yellowcap"
	item_state = "yellowcap"
	base_state = "yellowcap"

/obj/item/clothing/head/cap/blue
	name = "蓝帽子"
	desc = "一顶蓝帽子."
	icon_state = "bluecap"
	item_state = "bluecap"
	base_state = "bluecap"

/obj/item/clothing/head/cap/maga
	name = "MAGA帽子"
	desc = "一顶正面印有\"让美国再次伟大\"的红帽子."
	icon_state = "maga"
	item_state = "maga"
	base_state = "maga"

/obj/item/clothing/head/cap/fbi
	name = "FBI帽子"
	desc = "一顶正面印有白色FBI字样的黑帽子."
	icon_state = "fbi"
	item_state = "fbi"
	base_state = "fbi"

/obj/item/clothing/head/cap/atf
	name = "ATF帽子"
	desc = "一顶正面印有黄色ATF字样的深蓝色帽子."
	icon_state = "atf"
	item_state = "atf"
	base_state = "atf"

/obj/item/clothing/head/cap/dea
	name = "DEA帽子"
	desc = "一顶正面印有黄色DEA字样的深蓝色帽子."
	icon_state = "dea"
	item_state = "dea"
	base_state = "dea"

/obj/item/clothing/accessory/armor/nomads/iogsuit //too broad, this is meant to be some sort of extreme sports armorwear or something.
	name = "IOG重型背心B-7"
	desc = "由坚固材料制成的重型套装."
	icon_state = "iogsuit"
	item_state = "iogsuit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	armor = list(melee = 110, arrow = 100, gun = 130, energy = 50, bomb = 90, bio = 100, rad = FALSE)
	value = 160
	slowdown = 0.2
	w_class = ITEM_SIZE_LARGE
	weight = 3.4

/obj/item/clothing/head/helmet/ioghelmet //too broad, this is meant to be some sort of extreme sports armorwear or something.
	name = "IOG头盔"
	desc = "一顶坚固的头盔."
	icon_state = "ioghelmet"
	item_state = "ioghelmet"
	body_parts_covered = HEAD
	armor = list(melee = 95, arrow = 100, gun = 110, energy = 50, bomb = 90, bio = 45, rad = FALSE)
	flags_inv = BLOCKHAIR
	health = 200

/obj/item/clothing/head/helmet/iogmask1 //too broad, this is meant to be some sort of extreme sports armorwear or something.
	name = "IOG头盔"
	desc = "一顶坚固的头盔."
	icon_state = "iogmask1"
	item_state = "iogmask1"
	body_parts_covered = HEAD
	armor = list(melee = 95, arrow = 100, gun = 100, energy = 50, bomb = 90, bio = 45, rad = 100)
	flags_inv = BLOCKHAIR
	health = 200

	/* Scrap Armor*/

/obj/item/clothing/suit/armor/scrap
	name = "废料板甲"
	desc = "一套破旧不堪的盔甲,令人想起中世纪的时代."
	icon_state = "scraparmor"
	item_state = "scraparmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 70, arrow = 85, gun = 20, energy = 20, bomb = 50, bio = 10, rad = 40)
	value = 50
	slowdown = 1.5
	health = 65

/obj/item/clothing/head/helmet/scrap
	name = "废金属头盔"
	desc = "一顶用杂七杂八的金属拼凑而成的简易头盔."
	icon_state = "scraphelmet"
	item_state = "scraphelmet"
	body_parts_covered = HEAD|FACE
	armor = list(melee = 70, arrow = 85, gun = 20, energy = 20, bomb = 50, bio = 10, rad = 40)
	flags_inv = BLOCKHAIR
	health = 60


//////////////////////////////////////Russo-Ukraine war/////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/helmet/modern/mk6
	name = "Mk6头盔"
	desc = "一款英国研发的凯夫拉防弹头盔."
	icon_state = "mk6"
	item_state = "mk6"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 70, arrow = 67, gun = 73, energy = 18, bomb = 65, bio = 20, rad = FALSE)
	var/adjusted = FALSE

/obj/item/clothing/head/helmet/modern/mk6/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/modern/mk6)
		return
	else
		if (adjusted)
			item_state = "mk6"
			item_state_slots["slot_head"] = "mk6"
			to_chat(usr, "<span class = 'danger'>你调整了头盔的束带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "mk6_straps"
			item_state_slots["slot_head"] = "mk6_straps"
			to_chat(usr, "<span class = 'danger'>你调整了头盔的束带.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/under/ukraine
	name = "ACU迷彩制服"
	desc = "乌克兰地面部队的标准迷彩制服."
	icon_state = "ukraine_acu"
	item_state = "ukraine_acu"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/ukraine/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ukraine)
		return
	else
		if (rolled)
			item_state = "ukraine_acu"
			item_state_slots["w_uniform"] = "ukraine_acu"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "ukraine_acu_rolled"
			item_state_slots["w_uniform"] = "ukraine_acu_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/head/cap/ukraine
	name = "ACU迷彩野战帽"
	desc = "一顶ACU迷彩野战帽,乌克兰地面部队的标准配发品."
	icon_state = "ukraine_cap"
	item_state = "ukraine_cap"


/obj/item/clothing/under/russian
	name = "EMR迷彩制服"
	desc = "俄罗斯联邦陆军的标准迷彩制服."
	icon_state = "russian_emr"
	item_state = "russian_emr"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/russian/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/russian)
		return
	if (rolled)
		item_state = "russian_emr"
		item_state_slots["w_uniform"] = "russian_emr"
		to_chat(usr, SPAN_NOTICE("You roll down your uniform's sleeves."))
		rolled = FALSE
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	else
		item_state = "russian_emr_rolled"
		item_state_slots["w_uniform"] = "russian_emr_rolled"
		to_chat(usr, SPAN_NOTICE("You roll up your uniform's sleeves."))
		rolled = TRUE
		heat_protection = ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	update_clothing_icon()

/obj/item/clothing/under/russian/vdv/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/russian/vdv)
		return
	if (rolled)
		item_state = "russian_emr_vdv"
		item_state_slots["w_uniform"] = "russian_emr_vdv"
		to_chat(usr, SPAN_NOTICE("You roll down your uniform's sleeves."))
		rolled = FALSE
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	else
		item_state = "russian_emr_vdv_rolled"
		item_state_slots["w_uniform"] = "russian_emr_vdv_rolled"
		to_chat(usr, SPAN_NOTICE("You roll up your uniform's sleeves."))
		rolled = TRUE
		heat_protection = ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	update_clothing_icon()

/obj/item/clothing/under/russian/vdv
	name = "EMR迷彩制服"
	desc = "俄罗斯联邦陆军的标准迷彩制服."
	icon_state = "russian_emr_vdv"
	item_state = "russian_emr_vdv"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	rolled = FALSE

/obj/item/clothing/under/russiandesert
	name = "EMR沙漠迷彩制服"
	desc = "俄罗斯联邦陆军的标准迷彩制服."
	icon_state = "russian_emr_desert"
	item_state = "russian_emr_desert"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/russiandesert/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/russiandesert)
		return
	else
		if (rolled)
			item_state = "russian_emr_desert"
			item_state_slots["w_uniform"] = "russian_emr_desert"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "russian_emr_desert_rolled"
			item_state_slots["w_uniform"] = "russian_emr_desert_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

//Syria

/obj/item/clothing/under/syrian_gov
	name = "叙利亚军制服"
	desc = "叙利亚军队的标准制服."
	icon_state = "syr_army"
	item_state = "syr_army"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/syrian_gov/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/syrian_gov)
		return
	else
		if (rolled)
			item_state = "syr_army"
			item_state_slots["w_uniform"] = "syr_army"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "syr_army_rolled"
			item_state_slots["w_uniform"] = "syr_army_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/syria_fsa //cant find any source on what they use so im just gonna use this
	name = "自由叙利亚军制服"
	desc = "自由叙利亚军部队使用的标准制服."
	icon_state = "salv_army"
	item_state = "salv_army"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/rolled = FALSE

/obj/item/clothing/under/syria_fsa/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/syria_fsa)
		return
	else
		if (rolled)
			item_state = "salv_army"
			item_state_slots["w_uniform"] = "salv_army"
			to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "salv_army_rolled"
			item_state_slots["w_uniform"] = "salv_army_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/head/cap/usec
	name = "USEC野战帽"
	desc = "一顶USEC迷彩野战帽,USEC私人军事公司的标准配发品."
	icon_state = "usec_cap"
	item_state = "usec_cap"

/obj/item/clothing/head/cap/bear
	name = "BEAR野战帽"
	desc = "一顶BEAR迷彩野战帽,BEAR私人军事公司的标准配发品."
	icon_state = "bear_cap"
	item_state = "bear_cap"

//african militias
/obj/item/clothing/under/warband1
	name = "带背带的牛仔裤"
	desc = "一条用背带固定的牛仔裤."
	icon_state = "warband1"
	item_state = "warband1"
	body_parts_covered =LOWER_TORSO|LEGS

/obj/item/clothing/under/warband2
	name = "迷彩裤和白色无袖衬衫"
	desc = "一条丛林迷彩裤搭配一件白色无袖衬衫."
	icon_state = "warband2"
	item_state = "warband2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

//modern winter jackets
/obj/item/clothing/suit/storage/coat/fur/m05
	name = "M05雪地迷彩外套"
	desc = "一件芬兰M05雪地迷彩的外套."
	icon_state = "fur_jacket7"
	item_state = "fur_jacket7"
	specific = TRUE
	colorn = 7

/obj/item/clothing/suit/storage/coat/fur/ukrainian
	name = "乌克兰冬季迷彩外套"
	desc = "一件乌克兰冬季迷彩的外套."
	icon_state = "fur_jacket8"
	item_state = "fur_jacket8"
	specific = TRUE
	colorn = 8

/obj/item/clothing/suit/storage/coat/fur/klyaksa
	name = "Klyaksa迷彩外套"
	desc = "一件俄罗斯'Klyaksa'雪地迷彩的外套."
	icon_state = "fur_jacket10"
	item_state = "fur_jacket10"
	specific = TRUE
	colorn = 10


/obj/item/clothing/suit/storage/coat/fur/schneetarn
	name = "Schneetarn迷彩外套"
	desc = "一件德国Schneetarn迷彩的外套."
	icon_state = "fur_jacket9"
	item_state = "fur_jacket9"
	specific = TRUE
	colorn = 9
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////CAF/////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/caf
	name = "CADPAT迷彩制服"
	desc = "一款加拿大迷彩制服."
	icon_state = "cad_pat"
	item_state = "cad_pat"
	var/base_icon = "cad_pat"
	var/rolled = FALSE
	var/stripped = FALSE

/obj/item/clothing/under/caf/arid
	name = "CADPAT迷彩制服"
	desc = "一款加拿大迷彩制服."
	icon_state = "cad_pat_arid"
	item_state = "cad_pat_arid"
	rolled = FALSE
	stripped = FALSE
	base_icon = "cad_pat_arid"

/obj/item/clothing/under/caf/winter
	name = "CADPAT迷彩制服"
	desc = "一款加拿大迷彩制服."
	icon_state = "cad_pat_winter"
	item_state = "cad_pat_winter"
	rolled = FALSE
	stripped = FALSE
	base_icon = "cad_pat_winter"

/obj/item/clothing/under/caf/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/caf)
		return
	else
		if (!stripped)
			if (rolled)
				item_state = "[base_icon]"
				icon_state = "[base_icon]"
				item_state_slots["w_uniform"] = "[base_icon]"
				to_chat(usr, "<span class = 'danger'>你放下了制服的袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			if (!rolled)
				item_state = "[base_icon]_rolled"
				icon_state = "[base_icon]_rolled"
				item_state_slots["w_uniform"] = "[base_icon]_rolled"
				to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
				rolled = TRUE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
		else
			if (rolled)
				item_state = "[base_icon]_stripped"
				icon_state = "[base_icon]_stripped"
				item_state_slots["w_uniform"] = "[base_icon]_stripped"
				to_chat(usr, "<span class = 'danger'>你没有袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			else
				item_state = "[base_icon]_stripped"
				icon_state = "[base_icon]_stripped"
				item_state_slots["w_uniform"] = "[base_icon]_stripped"
				to_chat(usr, "<span class = 'danger'>你没有袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
/obj/item/clothing/under/caf/verb/strip()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/caf)
		return
	else
		if (stripped)
			if (!rolled)
				item_state = "[base_icon]"
				icon_state = "[base_icon]"
				item_state_slots["w_uniform"] = "[base_icon]"
				to_chat(usr, "<span class = 'danger'>你穿上了外衬衫.</span>")
				stripped = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			else
				item_state = "[base_icon]_rolled"
				icon_state = "[base_icon]_rolled"
				item_state_slots["cad_pat_rolled"] = "[base_icon]_rolled"
				to_chat(usr, "<span class = 'danger'>你穿上了外衬衫.</span>")
				stripped = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
		else
			if (!rolled)
				item_state = "[base_icon]_stripped"
				icon_state = "[base_icon]_stripped"
				item_state_slots["w_uniform"] = "[base_icon]_stripped"
				to_chat(usr, "<span class = 'danger'>你脱到只剩内衬衫.</span>")
				stripped = TRUE
				rolled = FALSE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return
			else
				item_state = "[base_icon]_stripped"
				icon_state = "[base_icon]_stripped"
				item_state_slots["w_uniform"] = "[base_icon]_stripped"
				to_chat(usr, "<span class = 'danger'>你脱到只剩内衬衫.</span>")
				stripped = TRUE
				rolled = FALSE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return

/obj/item/clothing/under/caf/New()
	..()
	update_clothing_icon()
//////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/helmet/modern/cg634
	name = "CG634头盔"
	desc = "一款典型的加拿大武装部队CADPAT作战头盔."
	icon_state = "cg634"
	item_state = "cg634"
	body_parts_covered = HEAD
	armor = list(melee = 75, arrow = 95, gun = 93, energy = 22, bomb = 60, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/modern/cg634/arid
	icon_state = "cg634_arid"
	item_state = "cg634_arid"

/obj/item/clothing/head/helmet/modern/cg634/winter
	icon_state = "cg634_winter"
	item_state = "cg634_winter"

/obj/item/clothing/accessory/storage/webbing/caf_tacvest
	name = "加拿大武装部队战术背心"
	desc = "一件带有若干小袋的大型织带背心."
	icon_state = "caf_tacvest"
	item_state = "caf_tacvest"
	slots = 8
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack,/obj/item/weapon/gun/projectile/pistol)

/obj/item/clothing/accessory/storage/webbing/caf_tacvest/arid
	icon_state = "caf_tacvest_arid"

/obj/item/clothing/accessory/storage/webbing/caf_tacvest/winter
	icon_state = "caf_tacvest_winter"

/obj/item/clothing/head/jungle_hat/caf
	name = "CADPAT蒂利帽"
	desc = "一顶宽檐软质遮阳帽."
	icon_state = "tilly_cadpat"
	item_state = "tilly_cadpat"
	body_parts_covered = HEAD

/obj/item/clothing/head/jungle_hat/caf/arid
	icon_state = "tilly_cadpat_arid"
	item_state = "tilly_cadpat_arid"

/obj/item/clothing/head/jungle_hat/caf/winter
	icon_state = "tilly_cadpat_winter"
	item_state = "tilly_cadpat_winter"

/obj/item/clothing/head/helmet/modern/mechanical
	name = "机械头盔"
	desc = "一顶机械钢盔."
	icon_state = "mechanicalhelmet"
	item_state = "mechanicalhelmet"
	body_parts_covered = HEAD
	armor = list(melee = 175, arrow = 99, gun = 120, energy = 42, bomb = 185, bio = 35, rad = FALSE)

/obj/item/clothing/suit/armor/mechanical
	name = "机械化盔甲"
	desc = "一套厚重、拼凑而成的铁甲,覆盖了身体的大部分."
	icon_state = "mechanicalarmor"
	item_state = "mechanicalarmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 150, gun = 150, energy = 55, bomb = 70, bio = 30, rad = FALSE)
	value = 150
	slowdown = 1.8
	health = 175

/obj/item/clothing/under/chinese_type07
	name = "07式中国军制服"
	desc = "中国军队的标准现代制服."
	icon_state = "type07"
	item_state = "type07"

/obj/item/clothing/head/helmet/modern/qgf03
	name = "QGF03头盔"
	desc = "一款现代中国作战头盔."
	icon_state = "qgf03"
	item_state = "qgf03"
	body_parts_covered = HEAD
	armor = list(melee = 65, arrow = 80, gun = 65, energy = 15, bomb = 55, bio = 20, rad = FALSE)

/obj/item/clothing/under/cartel
	name = "浅色长裤配碎花衬衫"
	desc = "一条浅色长裤搭配一件红色碎花衬衫."
	icon_state = "cartel1"
	item_state = "cartel1"

/obj/item/clothing/head/black_beanie
	name = "黑色毛线帽"
	desc = "一顶羊毛黑色无边帽."
	icon_state = "black_beanie"
	item_state = "black_beanie"
	cold_protection = HEAD

/obj/item/clothing/under/m93_dpm
	name = "M93 DPM迷彩制服"
	desc = "荷兰陆军使用的DPM变体迷彩制服."
	icon_state = "dutch_dpm"
	item_state = "dutch_dpm"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/head/helmet/modern/m95_dpm
	name = "M95头盔"
	desc = "荷兰武装部队使用的PASGT衍生头盔.这顶是DPM迷彩图案."
	icon_state = "m95_dpm"
	item_state = "m95_dpm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 75, gun = 55, energy = 15, bomb = 55, bio = 20, rad = FALSE)