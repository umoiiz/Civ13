/*Index*/ // For reference 'Industrial' represents the 1850's onwards
/* 1 - Industrial Headpieces
   2 - Industrial Accessories
   3 - Industrial Uniforms
   3a - Womens Fashion
   4 - Industrial Suits
   5 - Industrial Boots*/

/* Industrial Headpieces*/

/obj/item/clothing/head/bowler_hat
	name = "圆顶硬礼帽"
	desc = "一顶圆形圆顶硬礼帽."
	icon_state = "bowler_hat"
	item_state = "bowler_hat"

/obj/item/clothing/head/cowboyhat
	name = "牛仔帽"
	desc = "一顶弯曲的皮帽."
	icon_state = "cowboy"
	item_state = "cowboy"
	heat_protection = HEAD

/obj/item/clothing/head/cowboyhat2
	name = "深色牛仔帽"
	desc = "一顶灰色的弯曲皮帽."
	icon_state = "cowboy2"
	item_state = "cowboy2"
	heat_protection = HEAD

/obj/item/clothing/head/vaquerohat
	name = "牧人帽"
	desc = "一顶宽檐帽,顶部插着一根羽毛,深受墨西哥牛仔喜爱.宽帽檐有助于为佩戴者遮挡阳光."
	icon_state = "vaquerohat"
	item_state = "vaquerohat"
	heat_protection = HEAD|EYES

/obj/item/clothing/head/bandit
	name = "强盗帽"
	desc = "一顶深色长檐牛仔帽,带有阴森的气质.尽管颜色深暗,它仍有助于为佩戴者遮挡阳光."
	icon_state = "bandit"
	item_state = "bandit"
	heat_protection = HEAD|EYES

/obj/item/clothing/head/unionhat
	name = "深色联邦军帽"
	desc = "一顶深色、松垂的皮帽,常由联邦军士兵佩戴."
	icon_state = "union_hat"
	item_state = "union_hat"

/obj/item/clothing/head/unionhatlight
	name = "浅色联邦军帽"
	desc = "一顶浅色、松垂的皮帽,常由联邦军士兵佩戴."
	icon_state = "union_hat2"
	item_state = "union_hat2"

/obj/item/clothing/head/confederatehat
	name = "灰色邦联军帽"
	desc = "一顶灰色、松垂的皮帽,常由邦联军士兵佩戴."
	icon_state = "confederate_hat"
	item_state = "confederate_hat"

/obj/item/clothing/head/unioncap
	name = "联邦军便帽"
	desc = "一顶联邦军士兵佩戴的便帽."
	icon_state = "union_cap"
	item_state = "union_cap"
	var/adjusted = FALSE

/obj/item/clothing/head/unioncap/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/unioncap)
		return
	else
		if (adjusted)
			item_state = "union_cap"
			item_state_slots["slot_head"] = "union_cap"
			to_chat(usr, "<span class = 'danger'>你调整了便帽的帽带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "union_capad"
			item_state_slots["slot_head"] = "union_capad"
			to_chat(usr, "<span class = 'danger'>你调整了便帽的帽带.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/head/furhat/bison
	name = "野牛头皮毛帽"
	desc = "一顶由野牛皮毛制成的帽子,带有小小的装饰性犄角,内衬为毛皮."
	icon_state = "bison_fur_hat"
	item_state = "bison_fur_hat"

/obj/item/clothing/suit/storage/jacket/vict_tailcoat
	name = "维多利亚燕尾服"
	desc = "也被称为管家服."
	icon_state = "victorian_tailcoat"
	item_state = "victorian_tailcoat"

/obj/item/clothing/head/confederatecap
	name = "邦联军便帽"
	desc = "一顶邦联军士兵佩戴的便帽."
	icon_state = "confederate_cap"
	item_state = "confederate_cap"
	var/adjusted = FALSE

/obj/item/clothing/head/confederatecap/verb/adjust_band()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/confederatecap)
		return
	else
		if (adjusted)
			item_state = "confederate_cap"
			item_state_slots["slot_head"] = "confederate_cap"
			to_chat(usr, "<span class = 'danger'>你调整了便帽的帽带.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "confederate_capad"
			item_state_slots["slot_head"] = "confederate_capad"
			to_chat(usr, "<span class = 'danger'>你调整了便帽的帽带.</span>")
			adjusted = TRUE
	update_clothing_icon()


/obj/item/clothing/head/sombrero
	name = "墨西哥宽檐帽"
	desc = "哎呀妈呀!宽帽檐有助于为佩戴者遮挡阳光"
	icon_state = "sombrero"
	item_state = "sombrero"
	heat_protection = HEAD|EYES

/obj/item/clothing/head/ten_gallon
	name = "白色十加仑帽"
	desc = "黑帮分子和那些渴望财富与权势之人的首选帽子.其白色宽帽檐有助于为佩戴者遮挡阳光."
	icon_state = "ten_gallon_hat_white"
	item_state = "ten_gallon_hat_white"
	heat_protection = HEAD|EYES

/* Industrial Accessories & Items*/

/obj/item/clothing/accessory/armband/blue_scarf
	name = "蓝色围巾"
	desc = "一条浅色棉质围巾,蓝色."
	icon_state = "british_scarf"
	item_state = "british_scarf"
	slot = "decor"

/obj/item/clothing/accessory/armband/grey_scarf
	name = "灰色围巾"
	desc = "一条浅色棉质围巾,灰色."
	icon_state = "grey_scarf"
	item_state = "grey_scarf"
	slot = "decor"

/obj/item/clothing/accessory/armband/red_scarf
	name = "红色围巾"
	desc = "一条浅色棉质围巾,红色."
	icon_state = "red_scarf"
	item_state = "red_scarf"
	slot = "decor"

/obj/item/clothing/accessory/armband/yellow_scarf
	name = "黄色围巾"
	desc = "一条浅色棉质围巾,黄色."
	icon_state = "yellow_scarf"
	item_state = "yellow_scarf"
	slot = "decor"

/obj/item/clothing/accessory/suspenders
	name = "背带"
	desc = "皮质背带."
	icon_state = "suspenders1"
	item_state = "suspenders1"
	slot = "sash"

/obj/item/clothing/accessory/suspenders/dark
	name = "深色背带"
	desc = "深色皮质背带."
	icon_state = "suspenders2"
	item_state = "suspenders2"
	slot = "sash"

/obj/item/weapon/watch/pocket
	name = "怀表"
	desc = "用于查看时间."
	icon = 'icons/obj/device.dmi'
	icon_state = "pocketwatch"
	item_state = "pocketwatch"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	slot_flags = SLOT_ID | SLOT_POCKET
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_HARMLESS
	icon_override = TRUE

/obj/item/weapon/watch/pocket/examine(mob/user)
	..()
	to_chat(user, "<big>现在是[clock_time()].</big>")

/obj/item/weapon/watch/pocket/attack_self(var/mob/living/L)
	to_chat(L, "<big>现在是[clock_time()].</big>")
	return

/* Industrial Uniforms*/

/obj/item/clothing/under/industrial1
	name = "拓荒者装束"
	desc = "一件红色衬衫配皮质长裤,常为拓荒者所穿."
	icon_state = "pioneer_outfit"
	item_state = "pioneer_outfit"

/obj/item/clothing/under/industrial2
	name = "牧场主装束"
	desc = "一件蓝色衬衫配浅米色长裤."
	icon_state = "rancher_outfit"
	item_state = "rancher_outfit"

/obj/item/clothing/under/industrial3
	name = "牛仔装束"
	desc = "一件白色衬衫配皮质长裤,为牛仔和牧场主所穿."
	icon_state = "cowboy_outfit"
	item_state = "cowboy_outfit"

/obj/item/clothing/under/industrial4
	name = "格纹装束"
	desc = "一件红白格纹衬衫配浅米色长裤."
	icon_state = "checkered_outfit"
	item_state = "checkered_outfit"

/obj/item/clothing/under/industrial5
	name = "工人装束"
	desc = "一件藏青色衬衫配牛仔长裤."
	icon_state = "worker_outfit"
	item_state = "worker_outfit"

/obj/item/clothing/under/texan
	name = "德克萨斯衬衫装束"
	desc = "一件白色汗衫配米色短裤.它带有德克萨斯风格的领结."
	icon_state = "texas"
	item_state = "texas"

/obj/item/clothing/under/lederhosen
	name = "皮短裤"
	desc = "传统的南德意志服饰."
	icon_state = "lederhosen"
	item_state = "lederhosen"

/obj/item/clothing/under/gang_leader // Welcome to sauce or loss with the Van Derlinde Gang
	name = "时髦亡命徒装束"
	desc = "一套做工精良的黑红装束,白色袖子配金色纽扣.常由自封的领袖所穿,总是带着一个计划."
	icon_state = "gang_leader"
	item_state = "gang_leader"

/obj/item/clothing/under/outlaw //alright arthur, show us what you got
	name = "亡命徒装束"
	desc = "一件蓝色衬衫配蓝色牛仔长裤和白色背带.常由那些与法律若即若离之人所穿,不过衣着品味并不能评判一个人的品格."
	icon_state = "arthur_morgan"
	item_state = "arthur_morgan"

/obj/item/clothing/under/bartender
	name = "酒保装束"
	desc = "一套时髦的酒保装束."
	icon_state = "bartender"
	item_state = "bartender"

/obj/item/clothing/under/victorian_vest
	name = "黑色维多利亚衬衫与马甲"
	desc = "一件简洁利落的黑色衬衫与马甲,配金色纽扣,维多利亚风格."
	icon_state = "victorianvest"
	item_state = "victorianvest"

/obj/item/clothing/under/victorian_vest/redvest
	name = "黑色维多利亚衬衫与红色马甲"
	desc = "一件简洁利落的黑色衬衫与红色马甲,配金色纽扣,维多利亚风格."
	icon_state = "victorianredvest"
	item_state = "victorianredvest"

/obj/item/clothing/under/victorian_vest/redshirt
	name = "红色维多利亚衬衫与黑色马甲"
	desc = "一件简洁利落的红色衬衫与黑色马甲,配金色纽扣,维多利亚风格."
	icon_state = "victorianblred"
	item_state = "victorianblred"

/obj/item/clothing/under/waistcoat
	name = "白衬衫与黑马甲"
	desc = "一件简洁利落的黑马甲配白衬衫."
	icon_state = "waistcoat"
	item_state = "waistcoat"

/obj/item/clothing/suit/storage/coat/victorian_peacoat
	name = "黑色海军呢大衣"
	desc = "一件简洁利落的黑色海军呢大衣"
	icon_state = "victorian_peacoat"
	item_state = "victorian_peacoat"

/* Womens Fashion*/

/obj/item/clothing/under/saloondress
	name = "酒馆连衣裙套装"
	desc = "一件引人注目的连衣裙,常被边境女郎穿着以招揽生意."
	icon_state = "dress_saloon"
	item_state = "dress_saloon"

/obj/item/clothing/under/cheongsam
	name = "旗袍"
	desc = "一件紧身迷人的连衣裙,通常由来自东方的女性穿着."
	icon_state = "cheongsam"
	item_state = "cheongsam"

/obj/item/clothing/under/blackdress/short
	name = "黑色短连衣裙"
	desc = "一件朴素的黑色女式连衣裙,这件明显更短也更不端庄."
	icon_state = "dress_black_short"
	item_state = "dress_black_short"

/obj/item/clothing/under/wedding
	name = "白色婚纱"
	desc = "一件仪式用白色婚纱.有旧的,有新的,有借来的,有蓝色的."
	icon_state = "bride_white"
	item_state = "bride_white"

/obj/item/clothing/under/victorian_dress
	name = "维多利亚黑色连衣裙"
	desc = "一件女士黑色连衣裙,维多利亚风格."
	icon_state = "victorianblackdress"
	item_state = "victorianblackdress"

/obj/item/clothing/under/victorian_dress/red
	name = "维多利亚红色连衣裙"
	desc = "一件女士红色连衣裙,维多利亚风格."
	icon_state = "victorianreddress"
	item_state = "victorianreddress"

/obj/item/clothing/under/victorian_prim
	name = "及颈黑色连衣裙"
	desc = "一件端庄得体的黑色连衣裙,从脖子遮到脚踝."
	icon_state = "victorian_dress"
	item_state = "victorian_dress"

/obj/item/clothing/suit/storage/closechest_apron_f
	name = "及胸围裙"
	desc = "一件遮到胸口的白色围裙,其褶边在法国人中很受欢迎."
	icon_state = "closechest_apron_f"
	item_state = "closechest_apron_f"

/obj/item/clothing/suit/storage/openchest_apron_f
	name = "及腰围裙"
	desc = "一件遮到腰部的白色围裙,其褶边在法国人中很受欢迎."
	icon_state = "openchest_apron_f"
	item_state = "openchest_apron_f"
/* Womens Fashion - End*/

/obj/item/clothing/under/union_uniform
	name = "联邦军制服"
	desc = "一件联邦军士兵穿着的蓝色制服."
	icon_state = "union_uniform"
	item_state = "union_uniform"

obj/item/clothing/under/confederate_uniform/grey
	name = "confederate uniform"
	desc = "A grey uniform worn by confederate soldiers."
	icon_state = "confederate_uniform1"
	item_state = "confederate_uniform1"
	colorn = 1
	specific = TRUE

obj/item/clothing/under/confederate_uniform/grey_blue
	name = "confederate uniform"
	desc = "A grey uniform worn by confederate soldiers, however this one has union pants."
	icon_state = "confederate_uniform2"
	item_state = "confederate_uniform2"
	colorn = 2
	specific = TRUE

/obj/item/clothing/under/confederate_uniform
	name = "邦联军制服"
	desc = "一件邦联军士兵穿着的灰色制服."
	icon_state = "confederate_uniform1"
	item_state = "confederate_uniform1"
	value = 70
	var/colorn = 1
	var/specific = FALSE

obj/item/clothing/under/confederate_uniform/New()
	..()
	if (!specific)
		colorn = pick(1,2)
		icon_state = "confederate_uniform[colorn]"
		item_state = "confederate_uniform[colorn]"

/* Industrial Suits */

/obj/item/clothing/suit/storage/jacket/leatherovercoat1
	name = "皮大衣"
	desc = "一件长款皮大衣."
	icon_state = "leather_overcoat"
	item_state = "leather_overcoat"

/obj/item/clothing/suit/storage/jacket/leatherovercoat2
	name = "黑色皮大衣"
	desc = "一件长款黑色皮大衣."
	icon_state = "black_leather_overcoat"
	item_state = "black_leather_overcoat"

/obj/item/clothing/suit/storage/jacket/blackvest
	name = "黑色马甲"
	desc = "一件简单的黑色马甲."
	icon_state = "blackvest"
	item_state = "blackvest"

/obj/item/clothing/suit/storage/jacket/olivevest
	name = "橄榄色马甲"
	desc = "一件简单的橄榄色马甲."
	icon_state = "olivevest"
	item_state = "olivevest"

/obj/item/clothing/suit/storage/jacket/bluevest
	name = "蓝色马甲"
	desc = "一件简单的蓝色马甲."
	icon_state = "bluevest"
	item_state = "bluevest"

/obj/item/clothing/suit/storage/jacket/texan
	name = "米色短夹克"
	desc = "一件米色短夹克."
	icon_state = "texas"
	item_state = "texas"

/* Industrial Boots*/

/obj/item/clothing/shoes/riding1
	name = "黑色马靴"
	desc = "带马刺的黑色皮靴,非常适合骑马."
	icon_state = "cowboyboots1"
	item_state = "cowboyboots1"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 70, arrow = 40, gun = FALSE, energy = 25, bomb = 50, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	flags = CONDUCT

/obj/item/clothing/shoes/riding2
	name = "皮马靴"
	desc = "带马刺的皮靴,非常适合骑马."
	icon_state = "cowboyboots2"
	item_state = "cowboyboots2"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 70, arrow = 40, gun = FALSE, energy = 25, bomb = 50, bio = 10, rad = 25)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	flags = CONDUCT

/obj/item/clothing/shoes/riding1/gator_cowboy
	name = "鳄鱼鳞纹马靴"
	desc = "带马刺的鳄鱼鳞纹皮靴,非常适合时尚地骑马."
	icon_state = "gator_cowboy"
	item_state = "gator_cowboy"

/obj/item/clothing/shoes/gator_ankleboots
	name = "鳄鱼鳞纹短靴"
	desc = "优雅的鳄鱼鳞纹及踝皮靴,时尚的宣言."
	icon_state = "gator_ankleboots"
	item_state = "gator_ankleboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 50, arrow = 30, gun = FALSE, energy = 20, bomb = 40, bio = 10, rad = 20)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/* Industrial Coats*/

/obj/item/clothing/suit/storage/coat/kozhanka
	name = "毛皮大衣"
	desc = "一件厚实的毛皮大衣,非常适合冬天."
	icon_state = "kozhanka"
	item_state = "kozhanka"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1
	var/specific = FALSE
	flags_inv = BLOCKHEADHAIR
	specific = TRUE
/obj/item/clothing/suit/storage/coat/kozhanka/New()
	..()
	if (!specific)
		colorn = pick(1,2,)
		icon_state = "kozhanka"
		item_state = "kozhanka"

/obj/item/clothing/suit/storage/coat/kozhanka/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"
	if (hood)
		icon_state = "kozhanka"
		item_state = "kozhanka"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
		item_state_slots["slot_wear_suit"] = "kozhanka[colorn]"
		to_chat(usr, "<span class = 'danger'>你摘下大衣的兜帽.</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return
	else if (!hood)
		icon_state = "kozhankah"
		item_state = "kozhankah"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT|HEAD
		item_state_slots["slot_wear_suit"] = "kozhankah[colorn]"
		to_chat(usr, "<span class = 'danger'>你用大衣的兜帽罩住头部.</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return

/obj/item/clothing/suit/storage/coat/kozhanka/white
	name = "白色毛皮大衣"
	desc = "一件厚实的白色毛皮大衣,非常适合冬天."
	icon_state = "kozhanka_w"
	item_state = "kozhanka_w"
	specific = TRUE
	colorn = 2

/* Miscallaneous*/

/obj/item/clothing/under/dimmadome
	name = "古怪商人套装"
	desc = "一件米色夹克配白色内衬衫,夹克和衬衫似乎为了方便缝成了一体,还配有德克萨斯风格的领结.这人大概很有钱.."
	icon_state = "doug_dimmadome"
	item_state = "doug_dimmadome"

/obj/item/clothing/accessory/storage/webbing/civil_war
	name = "弹药挂具"
	desc = "一套用于装弹药和一把刺刀的挂具."
	icon_state = "civil_war"
	item_state = "civil_war"
	slots = 13

/obj/item/clothing/accessory/storage/webbing/civil_war/full
	slots = 13
/obj/item/clothing/accessory/storage/webbing/civil_war/full/New()
	..()
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/ammo_casing/musketball(src)
	new/obj/item/weapon/attachment/bayonet(src)

/obj/item/clothing/accessory/storage/webbing/civil_war/officer/full
	slots = 13
/obj/item/clothing/accessory/storage/webbing/civil_war/officer/full/New()
	..()
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/ammo_casing/musketball_pistol(src)
	new/obj/item/weapon/gun/projectile/capnball/dragoon(src)
