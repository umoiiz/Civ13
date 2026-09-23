/*Index*/
/* * - 1 Medieval Shoes & Boots
   * - 2 Medieval Gloves & Gauntlets
   * - 3 Medieval Headpieces
   * - 4 Medieval Suits
   * - 5 Medieval Armor
   * - 6 Medieval Armor Accessories
   * - 7 Medieval Crowns
   * - 8 Medieval Helmets
   * - 8a Crusader Helmets
   * - 8b Baltic Helmets
   * - 8c Crusader Priests
   * - 9 Medieval Equipment Crates
   /////////////////////////////////////
   * - 10 Extra-Cultural Medieval Clothes
   * - 10a Medieval Mayan
   * - 10b Medieval Norse Armor
   * - 10c Medieval Chinese Armor
   * - 10d Medieval Mamluk Armor
   * - 10e Medieval Steppe Clothes & Armor
   /////////////////////////////////////
   * - 11 Medieval Japanese
   * - 11a Medieval Japanese Armor
   * - 11b Medieval Japanese Uniforms
   * - 11c Medieval Japanese Shoes & Boots
   * - 11d Medieval Japanese Headpieces & Helmets
   * - 11e Medieval Japanese Masks
   /////////////////////////////////////
   * - 12 Miscallenous Medieval Extra-Cultural Clothes
   * - 13 Fantasy Medieval Clothes
   * - 13a Fantasy Crusader Helmets
   * - 13b Dark Souls Armor
   * - 14 skryim*/

/* Medieval Shoes & Boots*/

/obj/item/clothing/shoes/medieval
	name = "皮鞋"
	desc = "一双简单轻薄的皮鞋.遮到脚踝."
	icon_state = "medieval"
	item_state = "medieval"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 15, arrow = 10, gun = FALSE, energy = 8, bomb = 15, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/medieval/arab
	name = "阿拉伯皮鞋"
	desc = "一双简单轻薄的皮鞋.鞋尖宽松."
	icon_state = "arab"
	item_state = "arab"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 8, gun = FALSE, energy = 6, bomb = 12, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/medieval/emirate
	name = "埃米尔皮鞋"
	desc = "一双简单的阿拉伯风格皮鞋.额外加垫且鞋尖宽松."
	icon_state = "emir"
	item_state = "emir"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 15, arrow = 10, gun = FALSE, energy = 8, bomb = 15, bio = 10, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/clothing/shoes/medieval/knight
	name = "铁靴"
	desc = "一双板甲靴."
	icon_state = "knight"
	item_state = "knight"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 35

/* Medieval Gloves & Gauntlets*/

/obj/item/clothing/gloves/gauntlets
	name = "装甲护手"
	desc = "一双铁制装甲护手."
	icon_state = "gauntlet"
	item_state = "gauntlet"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 30

/* Medieval Headpieces*/

/obj/item/clothing/head/artisan
	name = "工匠帽"
	desc = "一顶宽大的工匠帽."
	icon_state = "artisan"
	item_state = "artisan"

/obj/item/clothing/head/feathered_hat
	name = "羽毛帽"
	desc = "一顶羽毛帽."
	icon_state = "feathered_hat"
	item_state = "feathered_hat"

/obj/item/clothing/head/count_hat
	name = "伯爵帽"
	desc = "一顶华丽且带羽毛的帽子."
	icon_state = "medieval_count_hat"
	item_state = "medieval_count_hat"

/obj/item/clothing/head/cavalier
	name = "骑士帽"
	desc = "一顶自由奔放且花哨的皮革羽毛帽."
	icon_state = "cavalier"
	item_state = "cavalier"

/obj/item/clothing/head/noblehat1
	name = "棕色贵族帽"
	icon_state = "noblehat1"
	item_state = "noblehat1"

/obj/item/clothing/head/noblehat2
	name = "黑色贵族帽"
	icon_state = "noblehat2"
	item_state = "noblehat2"

/obj/item/clothing/head/phrigian_hat
	name = "弗里吉亚帽"
	desc = "一顶古代弗里吉亚风格的圆球顶帽. 常被犹太裔商人或农民佩戴."
	icon_state = "phrigian_hat"
	item_state = "phrigian_hat"

/obj/item/clothing/head/phrigian_hat/red
	name = "红色弗里吉亚帽"
	icon_state = "phrigian_hat_red"
	item_state = "phrigian_hat_red"

/obj/item/clothing/head/phrigian_hat/blue
	name = "蓝色弗里吉亚帽"
	icon_state = "phrigian_hat_blue"
	item_state = "phrigian_hat_blue"

/obj/item/clothing/head/phrigian_hat/doge
	name = "总督帽"
	desc = "一顶古代弗里吉亚风格的华丽圆球顶帽, 饰有金边. 常被共和国统治者佩戴, 凌驾于众多小商贾贵族之上."
	icon_state = "doge"
	item_state = "doge"

/obj/item/clothing/head/hooded_cape
	name = "黑色长兜帽斗篷"
	desc = "一件黑色长兜帽斗篷. 常被那些希望在阴影中隐藏自己的人佩戴."
	icon_state = "black_cape"
	item_state = "black_cape"
	body_parts_covered = HEAD
	flags_inv = BLOCKHAIR|HIDEFACE

/obj/item/clothing/head/plaguedoctor
	name = "瘟疫医生帽"
	desc = "一顶黑色短檐帽. 常被瘟疫医生佩戴, 以便在出诊途中于街上保持低调."
	icon_state = "plaguedoctor"
	item_state = "plaguedoctor"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/nun_hood //path can't be changed, has dependencies in civilian.dm & civ_factions.dm
	name = "修女头巾"
	desc = "典型的修女头巾. 其制作方式象征着奉献, 如同与信仰缔结婚约一般."
	icon_state = "nun_hood"
	item_state = "nun_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/turban
	name = "头巾"
	desc = "一条彩色的轻质布头巾."
	icon_state = "turban1"
	item_state = "turban1"
	heat_protection = HEAD
/obj/item/clothing/head/turban/New()
	..()
	var/pickcolor = pick("turban1", "turban2", "turban3", "turban4")
	icon_state = pickcolor
	item_state = pickcolor

/obj/item/clothing/head/turban/imam
	name = "白色头巾"
	desc = "一条简单的白色头巾."
	icon_state = "turban_w"
	item_state = "turban_w"
/obj/item/clothing/head/turban/imam/New()
	..()
	icon_state = "turban_w"
	item_state = "turban_w"

/obj/item/clothing/head/turban/sultan
	name = "大头巾"
	desc = "一条常被重要人物佩戴的大头巾.."
	icon_state = "sultan"
	item_state = "sultan"
	heat_protection = HEAD
/obj/item/clothing/head/turban/sultan/New()
	..()
	icon_state = "sultan"
	item_state = "sultan"

/obj/item/clothing/head/keffiyeh
	name = "阿拉伯头巾"
	desc = "一种由方格图案围巾制成的头饰."
	icon_state = "keffiyeh_black"
	item_state = "keffiyeh_black"
	heat_protection = HEAD

/obj/item/clothing/head/keffiyeh/red
	icon_state = "keffiyeh_red"
	item_state = "keffiyeh_red"

/obj/item/clothing/head/pakol
	name = "帕科尔帽"
	desc = "一顶柔软的圆顶羊毛男帽."
	icon_state = "pakol_rose"
	item_state = "pakol_rose"
	heat_protection = HEAD
/obj/item/clothing/head/pakol/New()
	..()
	var/pickcolor = pick("pakol_rose", "pakol_beige", "pakol_bgrey")
	icon_state = pickcolor
	item_state = pickcolor

/*Medieval Suits*/

/obj/item/clothing/suit/storage/jacket/arabic_robe
	name = "阿拉伯长袍"
	desc = "一件轻便宽松的阿拉伯长袍."
	icon = 'icons/obj/clothing/uniforms.dmi'
	icon_state = "arabw_robe"
	item_state = "arabw_robe"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/arabic_robe
	name = "白色轻便阿拉伯长袍"
	desc = "一件轻便的白色宽松衣物, 用于遮阳."
	icon = 'icons/obj/clothing/uniforms.dmi'
	icon_state = "arab2"
	item_state = "arab2"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/arabic_robe
	name = "白色轻便阿拉伯长袍"
	desc = "一件轻便的白色宽松衣物, 用于遮阳."
	icon = 'icons/obj/clothing/uniforms.dmi'
	icon_state = "arab2"
	item_state = "arab2"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/jacket/plaguedoctor //moved from jobs.dm
	name = "瘟疫医生套装"
	desc = "瘟疫医生所用. 只会让他们方法背后的谜团更加深重."
	icon_state = "plaguedoctor"
	icon_state = "plaguedoctor"
	icon_state = "plaguedoctor"

/obj/item/clothing/suit/storage/coat/fancy_fur_coat
	name = "华丽毛皮大衣"
	desc = "一件华丽而昂贵的毛皮大衣."
	icon_state = "fancy_fur_coat"
	item_state = "fancy_fur_coat"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/coat/overlord_coat
	name = "霸主长袍"
	desc = "一件极其优雅的长袍, 由强大的亡灵佩戴."
	icon_state = "overlord_coat"
	item_state = "overlord_coat"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/jacket/regal
	name = "皇家貂皮披风"
	desc = "一件饰有精美风格化毛皮图案的大披风, 常用于彰显贵族圈中最显赫的成员."
	icon_state = "regal_cape"
	item_state = "regal_cape"
	cold_protection = UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/coat/monk_robes
	name = "僧侣长袍"
	desc = "僧侣常穿的长袍, 冬季保暖."
	icon_state = "monk_robes"
	item_state = "monk_robes"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/suit/storage/coat/monk_robes/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"
	if (hood)
		icon_state = "monk_robes"
		item_state = "monk_robes"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
		item_state_slots["slot_wear_suit"] = "monk_robes"
		to_chat(usr, "<span class = 'danger'>你脱下长袍的兜帽.</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return
	else if (!hood)
		icon_state = "monk_robes_hood"
		item_state = "monk_robes_hood"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT|HEAD
		item_state_slots["slot_wear_suit"] = "monk_robes_hood"
		to_chat(usr, "<span class = 'danger'>你用长袍的兜帽遮住头部.</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return

/* Medieval Uniforms*/

/obj/item/clothing/under/medieval
	name = "白色束腰外衣"
	desc = "一件带金色镶边的白色长束腰外衣."
	icon_state = "white_tunic_long"
	item_state = "white_tunic_long"

/obj/item/clothing/under/count_outfit
	name = "伯爵套装"
	desc = "一套华丽的伯爵套装."
	icon_state = "count_outfit"
	item_state = "count_outfit"

/obj/item/clothing/under/renaissance
	name = "紫色文艺复兴服装"
	desc = "一套宽松的文艺复兴风格服装."
	icon_state = "renaissance"
	item_state = "renaissance"

/obj/item/clothing/under/renaissance/doge
	name = "总督套装"
	desc = "一套金绣宽松的文艺复兴风格服装. 常被共和国统治者佩戴, 凌驾于众多小商贾贵族之上."
	icon_state = "doge"
	item_state = "doge"

/obj/item/clothing/under/renaissance_pontifical
	name = "教宗文艺复兴服装"
	desc = "一套宽松的文艺复兴风格服装, 带有彩色条纹."
	icon_state = "pontifical"
	item_state = "pontifical"

/obj/item/clothing/under/medieval/crusader
	name = "十字军束腰外衣"
	desc = "一件中间带有红色十字的白色束腰外衣."
	icon_state = "crusader1"
	item_state = "crusader1"

/obj/item/clothing/under/medieval/crusader/New()
	..()
	var/randcloth = pick("crusader1","crusader2")
	icon_state = randcloth
	item_state = randcloth

/obj/item/clothing/under/medieval/yellow
	name = "黄色束腰外衣"
	desc = "一件浅黄色束腰外衣."
	icon_state = "yellow_tunic"
	item_state = "yellow_tunic"

/obj/item/clothing/under/medieval/leather
	name = "皮革束腰外衣"
	desc = "一件轻便的皮革束腰外衣."
	icon_state = "leather_tunic"
	item_state = "leather_tunic"

/obj/item/clothing/under/medieval/kilt
	name = "苏格兰短裙"
	desc = "一条绿色格纹羊毛苏格兰短裙."
	icon_state = "kilt"
	item_state = "kilt"

/obj/item/clothing/under/medieval/beggar_clothing
	name = "乞丐服装"
	desc = "由碎布粗略缝制而成, 带有用于装零钱的深口袋."
	icon_state = "beggar_clothing"
	item_state = "beggar_clothing"

/obj/item/clothing/under/medieval/blue
	name = "蓝色束腰外衣"
	desc = "一件浅蓝色束腰外衣."
	icon_state = "blue_tunic"
	item_state = "blue_tunic"

/obj/item/clothing/under/medieval/blue2
	name = "蓝白束腰外衣"
	desc = "一件浅蓝色和白色束腰外衣."
	icon_state = "blue_tunic2"
	item_state = "blue_tunic2"

/obj/item/clothing/under/medieval/green
	name = "绿色束腰外衣"
	desc = "一件浅绿色束腰外衣."
	icon_state = "green_tunic"
	item_state = "green_tunic"

/obj/item/clothing/under/medieval/red
	name = "红色束腰外衣"
	desc = "一件浅红色束腰外衣."
	icon_state = "red_tunic"
	item_state = "red_tunic"

/obj/item/clothing/under/medieval/red2
	name = "黄红束腰外衣"
	desc = "一件浅红色和黄色束腰外衣."
	icon_state = "red_tunic2"
	item_state = "red_tunic2"

/obj/item/clothing/under/medieval/arabic_tunic
	name = "华丽阿拉伯束腰外衣"
	desc = "一件带有阿拉伯图案的轻便束腰外衣."
	icon_state = "arabw_tunic"
	item_state = "arabw_tunic"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/medieval/lighttunic
	name = "浅棕色束腰外衣"
	desc = "一件轻便宽松的束腰外衣."
	icon_state = "arab1"
	item_state = "arab1"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/medieval/emirate
	name = "酋长束腰外衣"
	desc = "一件宽松的绿色束腰外衣,带有阿拉伯纹样和长袖.常被酋长统治者穿着"
	icon_state = "emir_tunic"
	item_state = "emir_tunic"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/medieval/arab1
	name = "浅棕色阿拉伯束腰外衣"
	desc = "一件轻便宽松的阿拉伯束腰外衣."
	icon_state = "arab1"
	item_state = "arab1"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/medieval/arab2
	name = "浅白色阿拉伯束腰外衣"
	desc = "一件轻便宽松的阿拉伯束腰外衣."
	icon_state = "arab2"
	item_state = "arab2"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/medieval/arab3
	name = "白色阿拉伯束腰外衣"
	desc = "一件宽松的阿拉伯束腰外衣."
	icon_state = "arab3"
	item_state = "arab3"
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/nun
	name = "修女服"
	desc = "一件非常端庄的修女服.脖子上挂着一个小十字架,以助抵御诱惑."
	icon_state = "nun"
	item_state = "nun"

/obj/item/clothing/under/medieval/wise_knight
	name = "睿智骑士长袍"
	desc = "一件略带暗色的长袍,由睿智骑士穿着."
	icon_state = "wise_knight"
	item_state = "wise_knight"

/obj/item/clothing/under/medieval/arrogant_warrior
	name = "傲慢战士长袍"
	desc = "一件暗色的长袍,由愤怒的战士穿着."
	icon_state = "arrogant_warrior"
	item_state = "arrogant_warrior"

/obj/item/clothing/under/christian_priest
	name = "黑色牧师装束"
	desc = "一件朴素的黑色装束,脖子上有神职人员的白色领子,常被有组织宗教的牧师穿着."
	icon_state = "christian_priest"
	item_state = "christian_priest"

/obj/item/clothing/under/landschneckt
	name = "绿色雇佣兵制服"
	desc = "一件华丽而鲜艳的制服,常被15世纪的精英雇佣兵和中欧军队穿着."
	icon_state = "landschneckt"
	item_state = "landschneckt"

/obj/item/clothing/under/landschneckt/blue
	name = "蓝色雇佣兵制服"
	desc = "一件华丽而鲜艳的制服,常被15世纪的精英雇佣兵和中欧军队穿着."
	icon_state = "b_landschneckt"
	item_state = "b_landschneckt"

/obj/item/clothing/under/landschneckt/red
	name = "红色雇佣兵制服"
	desc = "一件华丽而鲜艳的制服,常被15世纪的精英雇佣兵和中欧军队穿着."
	icon_state = "r_landschneckt"
	item_state = "r_landschneckt"

/obj/item/clothing/under/blackdress
	name = "朴素黑色连衣裙"
	desc = "一件朴素的黑色连衣裙,供女性恰当地维护她们的端庄"
	icon_state = "dress_black"
	item_state = "dress_black"

/obj/item/clothing/under/sari/blue
	name = "蓝色纱丽"
	desc = "一件缎面分层女装,以印度风格制作"
	icon_state = "blue_sari"
	item_state = "blue_sari"

/obj/item/clothing/under/sari/red
	name = "红色纱丽"
	desc = "一件缎面分层女装,以印度风格制作"
	icon_state = "red_sari"
	item_state = "red_sari"

/* Medieval Armor*/

/obj/item/clothing/suit/armor/medieval
	name = "板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "knight_simple"
	item_state = "knight_simple"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/royal
	name = "皇家板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "royalplate"
	item_state = "royalplate"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 85, arrow = 100, gun = 20, energy = 15, bomb = 65, bio = 20, rad = FALSE)
	value = 65
	slowdown = 1.2
	health = 90

/obj/item/clothing/suit/armor/medieval/blue
	name = "蓝色板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "knight_blue"
	item_state = "knight_blue"

/obj/item/clothing/suit/armor/medieval/red
	name = "红色板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "knight_red"
	item_state = "knight_red"

/obj/item/clothing/suit/armor/medieval/yellow
	name = "黄色板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/suit/armor/medieval/green
	name = "绿色板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分."
	icon_state = "knight_green"
	item_state = "knight_green"

/obj/item/clothing/suit/armor/medieval/templar
	name = "圣殿骑士板甲"
	desc = "一件厚重昂贵的铁甲,覆盖身体的大部分.这一件覆有带十字架的白色亚麻布."
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/suit/armor/medieval/bronze_chestplate
	name = "青铜胸甲"
	desc = "一件青铜胸甲."
	icon_state = "bronze_chestplate"
	item_state = "bronze_chestplate"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	value = 25
	slowdown = 0.7
	health = 48

/obj/item/clothing/suit/armor/medieval/iron_chestplate
	name = "铁胸甲"
	desc = "一件铁胸甲."
	icon_state = "iron_chestplate"
	item_state = "iron_chestplate"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 40, gun = 8, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	value = 32
	slowdown = 0.8
	health = 52

/obj/item/clothing/suit/armor/medieval/iron_chestplate/red
	icon_state = "iron_chestplater"
	item_state = "iron_chestplater"

/obj/item/clothing/suit/armor/medieval/iron_chestplate/crusader
	icon_state = "iron_chestplatec"
	item_state = "iron_chestplatec"

/obj/item/clothing/suit/armor/medieval/iron_chestplate/blue
	icon_state = "iron_chestplateb"
	item_state = "iron_chestplateb"

/obj/item/clothing/suit/armor/medieval/leather
	name = "皮甲"
	desc = "几层压制的皮革片,制成一件尚可的护甲板."
	icon_state = "leather_armor"
	item_state = "leather_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 30, arrow = 15, gun = FALSE, energy = 15, bomb = 20, bio = 20, rad = FALSE)
	value = 20
	flammable = TRUE
	slowdown = 0.2
	health = 33

/obj/item/clothing/suit/armor/medieval/hauberk
	name = "锁子甲长衫"
	desc = "锁子甲的长款版本,作为外套穿着.提供更强的防护."
	icon_state = "hauberk"
	item_state = "hauberk"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, arrow = 55, gun = 10, energy = 20, bomb = 40, bio = 30, rad = FALSE)
	value = 40
	slowdown = 0.75
	health = 60

/obj/item/clothing/suit/armor/medieval/emirate
	name = "酋长护甲"
	desc = "一件宽松但具防护性的护甲,可裹在身体和束腰外衣外,供酋长领主使用"
	icon_state = "emir_armor"
	item_state = "emir_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 55, arrow = 50, gun = 10, energy = 20, bomb = 40, bio = 30, rad = FALSE)
	value = 35
	slowdown = 0.60
	health = 50

/obj/item/clothing/suit/armor/medieval/chainmail
	name = "锁子甲"
	desc = "由若干相互连接的小链环制成的可穿戴护甲."
	icon_state = "chainmail"
	item_state = "chainmail"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 30, bio = 20, rad = FALSE)
	value = 30
	slowdown = 0.6
	health = 50

/*Medieval Armor Accessories*/

/obj/item/clothing/accessory/armor
	icon = 'icons/obj/clothing/suits.dmi'
	slot = "armor"
	flags = CONDUCT
/obj/item/clothing/accessory/armor/get_mob_overlay()
	if (!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if (icon_override)
			if ("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]")
		else
			mob_overlay = image("icon" = 'icons/mob/suit.dmi', "icon_state" = "[tmp_icon_state]")
	return mob_overlay

/obj/item/clothing/accessory/armor/chainmail
	name = "锁子甲"
	desc = "由若干相互连接的小链环制成的可穿戴护甲."
	icon_state = "chainmail"
	item_state = "chainmail"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 30, bio = 20, rad = FALSE)
	value = 30
	slowdown = 0.6
	health = 50

/* Medieval Crowns*/

/obj/item/clothing/head/helmet/gold_crown
	name = "金冠"
	desc = "一顶金冠.华丽."
	icon_state = "gold_crown"
	item_state = "gold_crown"
	armor = list(melee = 20, arrow = 15, gun = 10, energy = 15, bomb = 15, bio = 10, rad = FALSE)

/obj/item/clothing/head/helmet/silver_crown
	name = "银冠"
	desc = "一顶银冠.华丽."
	icon_state = "silver_crown"
	item_state = "silver_crown"
	armor = list(melee = 20, arrow = 15, gun = 10, energy = 15, bomb = 15, bio = 10, rad = FALSE)

//Insert more inlaid crowns here.

/obj/item/clothing/head/helmet/gold_crown_diamond
	name = "镶金冠"
	desc = "一顶金冠,其中镶有一颗钻石.格外华丽."
	icon_state = "gold_crown_diamond"
	item_state = "gold_crown_diamond"
	armor = list(melee = 25, arrow = 20, gun = 10, energy = 25, bomb = 20, bio = 15, rad = FALSE)

/obj/item/clothing/head/helmet/silver_crown_diamond
	name = "镶银冠"
	desc = "一顶银冠,其中镶有一颗钻石.格外华丽."
	icon_state = "silver_crown_diamond"
	item_state = "silver_crown_diamond"
	armor = list(melee = 25, arrow = 20, gun = 10, energy = 25, bomb = 20, bio = 15, rad = FALSE)

/obj/item/clothing/head/helmet/silver_crown/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/diamond))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你将钻石放入冠中.</span>")
		if(W.amount <= 1)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/silver_crown_diamond(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 1
			new/obj/item/clothing/head/helmet/silver_crown_diamond(user.loc)

/obj/item/clothing/head/helmet/gold_crown/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/diamond))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你将钻石放入冠中.</span>")
		if(W.amount <= 1)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/gold_crown_diamond(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 1
			new/obj/item/clothing/head/helmet/gold_crown_diamond(user.loc)
//continue

/* Medieval Helmets*/

/obj/item/clothing/head/helmet/brown_eisenbruck
	name = "棕色软垫头巾"
	desc = "一顶带衬垫的棕色头巾,提供实用但朴素的防护."
	icon_state = "brown_eisenbruck"
	item_state = "brown_eisenbruck"
	body_parts_covered = HEAD
	armor = list(melee = 24, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 20

/obj/item/clothing/head/helmet/grey_eisenbruck
	name = "灰色软垫头巾"
	desc = "一顶带衬垫的灰色头巾,提供实用但朴素的防护."
	icon_state = "grey_eisenbruck"
	item_state = "grey_eisenbruck"
	body_parts_covered = HEAD
	armor = list(melee = 24, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 20

/obj/item/clothing/head/helmet/aged_eisenbruck
	name = "破旧的老软垫头巾"
	desc = "一顶破旧的老式带衬垫头巾,颜色已褪去但仍具防护性."
	icon_state = "aged_eisenbruck"
	item_state = "aged_eisenbruck"
	body_parts_covered = HEAD
	armor = list(melee = 24, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 20

/*Sallets*/

/obj/item/clothing/head/helmet/sallet/italian
	name = "意大利轻盔"
	desc = "一顶防护性很强的头盔,15世纪全欧洲的弓箭手和弩手使用."
	icon_state = "italian_sallet_o"
	item_state = "italian_sallet_o"
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	slowdown = 0.15
	var/toggled = FALSE

/obj/item/clothing/head/helmet/sallet/italian/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/sallet/italian)
		return
	else
		if (toggled)
			item_state = "italian_sallet_o"
			icon_state = "italian_sallet_o"
			item_state_slots["slot_head"] = "italian_sallet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面甲.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "italian_sallet"
			icon_state = "italian_sallet"
			item_state_slots["slot_head"] = "italian_sallet"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面甲。</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/sallet/german
	name = "德国轻盔"
	desc = "15世纪欧洲弓箭手和弩手使用的防护性很强的头盔。"
	icon_state = "german_sallet_o"
	item_state = "german_sallet_o"
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	slowdown = 0.15
	var/toggled = FALSE

/obj/item/clothing/head/helmet/sallet/german/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/sallet/german)
		return
	else
		if (toggled)
			item_state = "german_sallet_o"
			icon_state = "german_sallet_o"
			item_state_slots["slot_head"] = "german_sallet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面甲。</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "german_sallet"
			icon_state = "german_sallet"
			item_state_slots["slot_head"] = "german_sallet"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面甲。</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/sallet/burg
	name = "勃艮第轻盔"
	desc = "15世纪欧洲弓箭手和弩手使用的防护性很强的头盔,提供中等防护。"
	icon_state = "burg_sallet_o"
	item_state = "burg_sallet_o"
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	slowdown = 0.15
	var/toggled = FALSE

/obj/item/clothing/head/helmet/sallet/burg/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/sallet/burg)
		return
	else
		if (toggled)
			item_state = "burg_sallet_o"
			icon_state = "burg_sallet_o"
			item_state_slots["slot_head"] = "burg_sallet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面甲。</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "burg_sallet"
			icon_state = "burg_sallet"
			item_state_slots["slot_head"] = "burg_sallet"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面甲。</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/* Sallets End*/

/obj/item/clothing/head/helmet/bascinet
	name = "猎犬面甲盔"
	desc = "一种带有大型外凸面甲的头盔;14世纪骑士和重步兵使用。"
	icon_state = "bascinet_o"
	item_state = "bascinet_o"
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 45
	slowdown = 0.15
	var/toggled = FALSE

/obj/item/clothing/head/helmet/bascinet/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/bascinet)
		return
	else
		if (toggled)
			item_state = "bascinet_o"
			icon_state = "bascinet_o"
			item_state_slots["slot_head"] = "bascinet_o"
			to_chat(usr, "<span class = 'danger'>你掀起了头盔的面甲。</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "bascinet_hounskull"
			icon_state = "bascinet_hounskull"
			item_state_slots["slot_head"] = "bascinet_hounskull"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面甲。</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/medieval
	name = "骑士头盔"
	desc = "一种厚重的骑士头盔。"
	icon_state = "knight_simple"
	item_state = "knight_simple"
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	flags_inv = BLOCKHAIR
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/medieval/helmet1
	name = "防护锥形盔"
	desc = "一种带有护鼻和护耳的锥形头盔。"
	icon_state = "medieval_helmet1"
	item_state = "medieval_helmet1"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35

/obj/item/clothing/head/helmet/medieval/helmet2
	name = "水壶盔"
	desc = "一种宽檐铁盔。"
	icon_state = "medieval_helmet2"
	item_state = "medieval_helmet2"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 35, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 28

/obj/item/clothing/head/helmet/medieval/helmet3
	name = "锥形盔"
	desc = "一种带有护鼻的锥形头盔。"
	icon_state = "medieval_helmet3"
	item_state = "medieval_helmet3"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/medieval/coif
	name = "铁锁子头巾"
	desc = "一种锁子甲头罩。"
	icon_state = "coif"
	item_state = "coif"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 37

/obj/item/clothing/head/helmet/medieval/coif_helmet
	name = "铁锁子头巾和头盔"
	desc = "一种锁子甲头罩,顶部带有锥形头盔。"
	icon_state = "coif_helmet"
	item_state = "coif_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45

/obj/item/clothing/head/helmet/leather_skullcap
	name = "皮革头骨帽"
	desc = "一种镶铁钉的皮革头盔。常被劫掠者或雇佣兵团使用。"
	icon_state = "leather_skullcap_helmet"
	item_state = "leather_skullcap_helmet"
	body_parts_covered = HEAD
	armor = list(melee = 30, arrow = 20, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE) //lightly stronger than leather
	health = 30

/obj/item/clothing/head/helmet/medieval/arab
	name = "阿拉伯锥形头盔和头巾"
	desc = "一种铁盔,覆盖着头巾。"
	icon_state = "turhelm1"
	item_state = "turhelm1"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/medieval/arab2
	name = "阿拉伯长头盔和头巾"
	desc = "一种铁盔,覆盖着头巾,带有面部侧面防护。"
	icon_state = "arabw_helmet1"
	item_state = "arabw_helmet1"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/medieval/arab3
	name = "阿拉伯长头盔"
	desc = "一种铁盔,覆盖着头巾,带有面部侧面防护。"
	icon_state = "arabw_helmet"
	item_state = "arabw_helmet"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/medieval/arab/New()
	..()
	var/pickcolor = pick("turhelm1", "turhelm2", "turhelm3", "turhelm4")
	icon_state = pickcolor
	item_state = pickcolor

/* Nomads Arabic Helmets*/

/obj/item/clothing/head/helmet/medieval/nomads/arab
	name = "紫色阿拉伯头巾盔"
	desc = "一种铁盔,覆盖着紫色头巾。"
	icon_state = "turhelm1"
	item_state = "turhelm1"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 25

/obj/item/clothing/head/helmet/medieval/nomads/arab2
	name = "红色阿拉伯头巾盔"
	desc = "一种铁盔,覆盖着红色头巾。"
	icon_state = "turhelm2"
	item_state = "turhelm2"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 25

/obj/item/clothing/head/helmet/medieval/nomads/arab3
	name = "绿色阿拉伯头巾盔"
	desc = "一种铁盔,覆盖着绿色头巾。"
	icon_state = "turhelm3"
	item_state = "turhelm3"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 25

/obj/item/clothing/head/helmet/medieval/nomads/arab4
	name = "蓝色阿拉伯头巾盔"
	desc = "一种铁盔,覆盖着蓝色头巾。"
	icon_state = "turhelm3"
	item_state = "turhelm3"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 25

/obj/item/clothing/head/helmet/medieval/nomads/longarab
	name = "阿拉伯长头盔"
	desc = "一种阿拉伯风格的长锥形铁盔,带有面部侧面防护。常被阿拉伯士兵佩戴。"
	icon_state = "arabw_helmet"
	item_state = "arabw_helmet"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/medieval/nomads/longarab/female
	name = "女性阿拉伯长头盔"
	desc = "一种阿拉伯风格的长锥形铁盔,带有面部侧面防护。常被阿拉伯公主佩戴。"
	icon_state = "arabw_helmet1"
	item_state = "arabw_helmet1"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 32

/* Nomads Arabic Helmet -End*/

/obj/item/clothing/head/helmet/medieval/emirate
	name = "埃米尔头盔"
	desc = "一种铁盔,覆盖着绿色头巾并缠绕布料。常被埃米尔王国的统治者佩戴。"
	icon_state = "emir_turban"
	item_state = "emir_turban"
	body_parts_covered = HEAD|FACE
	item_flags = FLEXIBLEMATERIAL // The emirate helmet does not block the face. body_parts_covered is used in armor calculation, masks with this flag will not prevent eating even if they are covering your "face".
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45

	/* Crusader Helmets*/
//the classic goofy helmet, leaving path in place to not disturb mapping, very chicken & egg issue.

/obj/item/clothing/head/helmet/medieval/templar
	name = "圣殿骑士头盔"
	desc = "一种厚重的骑士头盔,正面绘有黄色十字。"
	icon_state = "knight_templar"
	item_state = "knight_templar"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)

//where the nomads helmets begins

/obj/item/clothing/head/helmet/medieval/crusader
	name = "十字军头盔"
	desc = "一种厚重的骑士头盔,带有狭窄的细缝眼孔。"
	icon_state = "crusader"
	item_state = "crusader"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/medieval/crusader/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/gold ))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你在十字军头盔上镶嵌了金锭</span>")
		if(W.amount <= 5)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/nomads/templar(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 5
			new/obj/item/clothing/head/helmet/medieval/nomads/templar(user.loc)

//the craftable iteration.

/obj/item/clothing/head/helmet/medieval/nomads/templar
	desc = "一种厚重的骑士头盔,正面镶嵌着金十字。带有狭窄的细缝眼孔。"
	icon_state = "new_knight_templar"
	item_state = "new_knight_templar"
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/medieval/nomads/templar/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/gold ))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你在圣殿十字军头盔上镶嵌了一顶金冠</span>")
		if(W.amount <= 10)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/crusaderking(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 10
			new/obj/item/clothing/head/helmet/medieval/crusaderking(user.loc)
			return

/obj/item/clothing/head/helmet/medieval/crusaderking
	name = "十字军国王头盔"
	desc = "一种厚重的骑士头盔,正面镶嵌着金十字,顶部有王冠。带有狭窄的细缝眼孔。"
	icon_state = "crusader_king"
	item_state = "crusader_king"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

	/* Baltic Crusaders*/

/obj/item/clothing/head/helmet/medieval/crusader/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/bone ))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你将骨角固定在十字军头盔上。</span>")
		if(W.amount <= 3)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/baltic(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 3
			new/obj/item/clothing/head/helmet/medieval/baltic(user.loc)

/obj/item/clothing/head/helmet/medieval/baltic
	name = "波罗的十字军头盔"
	desc = "一种厚重的骑士头盔,侧面固定着令人生畏的角。带有狭窄的细缝眼孔。"
	icon_state = "baltic_crusader"
	item_state = "baltic_crusader"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/medieval/baltic/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/silver ))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始用大师团图案装饰波罗的十字军头盔。</span>")
		if(W.amount <= 5)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/grandmaster(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 5
			new/obj/item/clothing/head/helmet/medieval/grandmaster(user.loc)

/obj/item/clothing/head/helmet/medieval/grandmaster
	name = "波罗的大师团头盔"
	desc = "一种厚重的骑士头盔,侧面固定着令人生畏的角,并带有大师团图案装饰。带有狭窄的细缝眼孔。"
	icon_state = "baltic_crusader_grandmaster"
	item_state = "baltic_crusader_grandmaster"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/medieval/grandmaster/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/silver))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你在大师团头盔上镶嵌了一顶银冠!</span>")
		if(W.amount <= 10)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/baltic_crusaderking(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 10
			new/obj/item/clothing/head/helmet/medieval/baltic_crusaderking(user.loc)

/obj/item/clothing/head/helmet/medieval/baltic_crusaderking
	name = "波罗的十字军国王头盔"
	desc = "一种厚重的骑士头盔,侧面固定着令人生畏的角,带有大师团图案装饰和一顶银冠。带有狭窄的细缝眼孔。"
	icon_state = "baltic_crusader_king"
	item_state = "baltic_crusader_king"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

	/* Crusader Priests*/

/obj/item/clothing/head/helmet/medieval/nomads/templar/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/cloth)) //unsure if this will take wool at the moment, just ret some cloth.
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始为头盔涂抹圣油并缝上布质顶罩。</span>")
		if(W.amount <= 3)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/priest(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 3
			new/obj/item/clothing/head/helmet/medieval/priest(user.loc)

/obj/item/clothing/head/helmet/medieval/priest
	name = "圣殿祭司头盔"
	desc = "一种厚重的骑士头盔,带有圣殿骑士配色的布质顶罩,带有狭窄的细缝眼孔。"
	icon_state = "templar_priest"
	item_state = "templar_priest"
	flags_inv = BLOCKHAIR
	armor = list(melee = 60, arrow = 70, gun = 5, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 35
	slowdown = 0.20

/obj/item/clothing/head/helmet/medieval/baltic/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/cloth)) //unsure if this will take wool at the moment, just ret some cloth.
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始为头盔涂抹圣油并缝上布质顶罩。</span>")
		if(W.amount <= 3)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/baltic_priest(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 3
			new/obj/item/clothing/head/helmet/medieval/baltic_priest(user.loc)

/obj/item/clothing/head/helmet/medieval/baltic_priest
	name = "波罗的祭司头盔"
	desc = "一种厚重的骑士头盔,带有波罗的配色的布质顶罩,带有狭窄的细缝眼孔。"
	icon_state = "baltic_priest"
	item_state = "baltic_priest"
	flags_inv = BLOCKHAIR
	armor = list(melee = 60, arrow = 70, gun = 5, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 35
	slowdown = 0.20

/* Medieval Equipment Crates*/

/obj/structure/closet/crate/equipment
	name = "木箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"

/obj/structure/closet/crate/equipment/knight_armor
	name = "骑士装备箱"
	paths = list(/obj/item/clothing/head/helmet/medieval = 1,
				/obj/item/clothing/suit/armor/medieval = 1,
				/obj/item/clothing/under/medieval/red2 = 1,
				/obj/item/clothing/shoes/medieval/knight = 1,
				/obj/item/weapon/material/sword/longsword/iron = 1,
				/obj/item/weapon/shield/iron/semioval = 1,)

/obj/structure/closet/crate/equipment/mamluk_armor
	name = "马穆鲁克装备箱"
	paths = list(/obj/item/clothing/head/helmet/medieval = 1,
				/obj/item/clothing/suit/armor/medieval/hauberk = 1,
				/obj/item/clothing/under/medieval/arabic_tunic = 1,
				/obj/item/clothing/shoes/medieval/knight = 1,
				/obj/item/weapon/material/sword/saif = 1,
				/obj/item/weapon/material/spear/sarissa/pike = 1,
				/obj/item/weapon/shield/arab_buckler = 1,)

/obj/structure/closet/crate/equipment/sayaf
	name = "赛亚夫装备箱"
	paths = list(/obj/item/clothing/head/helmet/medieval/arab = 1,
				/obj/item/clothing/suit/armor/medieval/chainmail = 1,
				/obj/item/clothing/under/medieval/arab2 = 1,
				/obj/item/clothing/shoes/medieval/arab = 1,
				/obj/item/weapon/material/sword/scimitar = 1,
				/obj/item/weapon/shield/arab_buckler = 1,)

/* Extra-Cultural Medieval Clothes*/

	/* Medieval Mayan*/

/obj/item/clothing/head/mayan_headdress
	name = "玛雅头饰"
	desc = "玛雅风格的头饰."
	icon_state = "mayan_headdress"
	item_state = "mayan_headdress"

/obj/item/clothing/under/huipil
	name = "维皮尔"
	desc = "一块浅色布料, 带有蓝色镶边."
	icon_state = "huipil"
	item_state = "huipil"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS

/obj/item/clothing/under/halfhuipil
	name = "半身维皮尔"
	desc = "一块浅色布料, 覆盖身体下半部分. 带有红色镶边."
	icon_state = "halfhuipil"
	item_state = "halfhuipil"

/* Medieval Norse Armor*/

/obj/item/clothing/head/helmet/medieval/viking
	name = "维京头盔"
	desc = "一顶圆形的维京头盔, 带有护鼻和护耳"
	icon_state = "new_viking" //to keep seperate from the wagner-esque viking helmet
	item_state = "new_viking"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/medieval/viking/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/gold))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你小心地用黄金装饰这顶即将成为皇家头盔的头盔.</span>")
		if(W.amount <= 5)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/viking/king(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 5
			new/obj/item/clothing/head/helmet/medieval/viking/king(user.loc)

/obj/item/clothing/head/helmet/medieval/viking/king
	name = "皇家维京头盔"
	desc = "一顶饰有皇家黄金装饰的圆形维京头盔, 带有护鼻和护耳"
	icon_state = "viking_king"
	item_state = "viking_king"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/medieval/viking/valkyrie
	name = "皇家维京头盔"
	desc = "一顶圆形的女武神头盔, 具有防护性并饰有翅膀"
	icon_state = "valkyrie"
	item_state = "valkyrie"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/medieval/viking/valkyrie/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/gold))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你小心地用黄金装饰这顶即将成为皇家头盔的头盔.</span>")
		if(W.amount <= 5)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/viking/valkyrie_queen(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 5
			new/obj/item/clothing/head/helmet/medieval/viking/valkyrie_queen(user.loc)

/obj/item/clothing/head/helmet/medieval/viking/valkyrie_queen
	name = "皇家维京头盔"
	desc = "一顶饰有皇家黄金装饰的圆形女武神头盔, 具有防护性并饰有翅膀"
	icon_state = "valkyrie_queen"
	item_state = "valkyrie_queen"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/medieval/viking/varangian
	name = "瓦兰吉头盔"
	desc = "一顶坚固的瓦兰吉卫队风格头盔, 除眼孔外全部紧密缠绕锁子甲."
	icon_state = "varangian_guard"
	item_state = "varangian_guard"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/suit/armor/medieval/varangian
	name = "瓦兰吉札甲"
	desc = "一件贴身的小铁矩形片制成的鳞甲背心. 重量适中但灵活."
	icon_state = "varangian_lamellar"
	item_state = "varangian_lamellar"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, arrow = 55, gun = 10, energy = 20, bomb = 40, bio = 30, rad = FALSE)
	slowdown = 0.75
	health = 60

/* Medieval Chinese Armor*/

/obj/item/clothing/head/helmet/medieval/imperial_chinese
	name = "中华帝国头盔"
	desc = "一顶铁制头盔, 带有绗缝护颈和装饰性红色羽饰, 采用中华帝国风格制作."
	icon_state = "imperial_chinese"
	item_state = "imperial_chinese"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 5, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	slowdown = 0.25

/obj/item/clothing/suit/armor/medieval/imperial_chinese
	name = "中华帝国铠甲"
	desc = "一件制作精良并涂漆的铠甲, 内外隐藏铁片保护身体, 采用中华帝国风格制作"
	icon_state = "imperial_chinese"
	item_state = "imperial_chinese"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 55, arrow = 50, gun = 10, energy = 20, bomb = 40, bio = 30, rad = FALSE)
	value = 35
	slowdown = 0.50
	health = 50


/* Medieval Mamluk Armor*/

/obj/item/clothing/head/helmet/medieval/mamluk/helmet
	name = "马穆鲁克锥形头盔"
	desc = "一顶锥形头盔, 带有护鼻和护耳, 采用马穆鲁克风格."
	icon_state = "mamluk_helmet"
	item_state = "mamluk_helmet"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35

/obj/item/clothing/head/helmet/medieval/mamluk/helmet/lord //not as brute strength protective, but its users are unrestricted fast & nasty.
	name = "贵族马穆鲁克锥形头盔"
	desc = "一顶锥形头盔, 带有护鼻和护耳, 采用马穆鲁克风格. 它缠绕着锁子甲."
	icon_state = "mamluk_lord"
	item_state = "mamluk_lord"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 50, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 50
	slowdown = 0.15

/obj/item/clothing/head/helmet/medieval/mamluk/helmet/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return
	if (istype(W, /obj/item/stack/material/gold))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你小心地用黄金装饰这顶贵族头盔.</span>")
		if(W.amount <= 5)
			qdel(src)
			qdel(W)
			new/obj/item/clothing/head/helmet/medieval/mamluk/helmet/king(user.loc)
		else
			qdel(src)
			W.amount = W.amount - 1
			new/obj/item/clothing/head/helmet/medieval/mamluk/helmet/king(user.loc)

/obj/item/clothing/head/helmet/medieval/mamluk/helmet/king
	name = "皇家马穆鲁克锥形头盔"
	desc = "一顶饰有皇家黄金镀层的锥形头盔, 带有护鼻和护耳, 采用马穆鲁克风格. 它缠绕着锁子甲."
	icon_state = "mamluk_king"
	item_state = "mamluk_king"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 50, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 50
	slowdown = 0.15

/obj/item/clothing/head/helmet/medieval/mamluk/coif
	name = "锁子甲头巾包裹的马穆鲁克头盔"
	desc = "一个锁子甲头罩和尖顶头盔, 采用马穆鲁克风格"
	icon_state = "mamluk_coif_helmet"
	item_state = "mamluk_coif_helmet"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45

/* Medieval Steppe Clothes & Armor*/

/obj/item/clothing/head/steppe_shaman
	name = "草原萨满羊毛帽"
	desc = "一顶染成红色的羊毛帽, 采用草原游牧民族设计. 萨满在草原上举行仪式时经常佩戴以保护自己免受恶劣天气影响"
	icon_state = "steppe_shaman_wool_hat"
	item_state = "steppe_shaman_wool_hat"
	cold_protection = HEAD

/obj/item/clothing/suit/storage/jacket/steppe_shaman
	name = "草原萨满羊毛外套"
	desc = "一件色彩鲜艳的羊毛外套, 萨满在开阔的草原上举行仪式时用来保暖."
	icon_state = "steppe_shaman_wool_coat"
	item_state = "steppe_shaman_wool_coat"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/armor/medieval/steppe_leather
	name = "草原皮甲"
	desc = "由皮革片制成的皮甲, 以草原游牧民族风格绑制, 为有前途的战士提供足够的保护."
	icon_state = "steppe_leather_armor"
	item_state = "steppe_leather_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 45, arrow = 25, gun = 5, energy = 15, bomb = 40, bio = 20, rad = FALSE) //stronger than leather, weaker than bronze
	value = 20
	flammable = TRUE
	slowdown = 0.2
	health = 33

/obj/item/clothing/under/medieval/steppe_tunic
	name = "草原羊毛束腰外衣"
	desc = "一件由羊毛制成的棕色束腰外衣. 游牧民族在大草原上经常穿着."
	icon_state = "steppe_wool_tunic"
	item_state = "steppe_wool_tunic"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/shoes/steppe_shoes
	name = "草原羊毛鞋"
	desc = "一双保暖的粗糙羊毛鞋, 用于在开阔的草原上保持双脚温暖."
	icon_state = "steppe_wool_shoes"
	item_state = "steppe_wool_shoes"
	body_parts_covered = FEET
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 8, gun = FALSE, energy = 6, bomb = 12, bio = 10, rad = FALSE)
	cold_protection = FEET
	health = 35
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/* Medieval Japanese*/
	/* Medieval Japanese*/

/obj/item/clothing/suit/armor/samurai
	name = "皮革武士甲"
	desc = "一件具有防护性且轻便的铠甲, 绑缚并覆盖身体大部分区域, 但略有灵活性. 通常由领主的保镖穿着."
	icon_state = "samurai3"
	item_state = "samurai3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	value = 15
	slowdown = 0.45
	health = 35

/obj/item/clothing/suit/armor/samurai/red
	name = "红色皮革武士甲"
	icon_state = "samurai1"
	item_state = "samurai1"

/obj/item/clothing/suit/armor/samurai/blue
	name = "蓝色皮革武士甲"
	icon_state = "samurai2"
	item_state = "samurai2"

/obj/item/clothing/suit/armor/samurai/black
	name = "黑色皮革武士甲"
	icon_state = "samurai4"
	item_state = "samurai4"

/obj/item/clothing/suit/armor/samurai/warrior
	name = "武士甲"
	desc = "一件源自日本的密集金属铠甲, 覆盖身体大部分区域. 通常由效忠封建领主的忠诚武士穿着."
	icon_state = "samurai_warrior3"
	item_state = "samurai_warrior3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 65, arrow = 75, gun = 5, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	value = 45
	slowdown = 0.9

/obj/item/clothing/suit/armor/samurai/warrior/red
	name = "红色武士甲"
	icon_state = "samurai_warrior1"
	item_state = "samurai_warrior1"

/obj/item/clothing/suit/armor/samurai/warrior/blue
	name = "蓝色小札甲"
	icon_state = "samurai_warrior2"
	item_state = "samurai_warrior2"

/obj/item/clothing/suit/armor/samurai/warrior/black
	name = "黑色小札甲"
	icon_state = "samurai_warrior4"
	item_state = "samurai_warrior4"

/obj/item/clothing/suit/armor/samurai/lord
	name = "武士领主甲"
	desc = "一件源自日本的厚重昂贵铠甲. 通常由封建领主穿着."
	icon_state = "samurai_lord3"
	item_state = "samurai_lord3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/samurai/lord/red
	name = "红色武士领主甲"
	icon_state = "samurai_lord1"
	item_state = "samurai_lord1"

/obj/item/clothing/suit/armor/samurai/lord/blue
	name = "蓝色武士领主甲"
	icon_state = "samurai_lord2"
	item_state = "samurai_lord2"

/obj/item/clothing/suit/armor/samurai/lord/black
	name = "黑色武士领主甲"
	icon_state = "samurai_lord4"
	item_state = "samurai_lord4"

	/* Medieval Japanese Uniforms*/

/obj/item/clothing/under/hanfu
	name = "深色汉服"
	desc = "一件轻便宽松的汉服."
	icon_state = "dark_hanfu"
	item_state = "dark_hanfu"

/obj/item/clothing/under/hanfu/light
	name = "浅色汉服"
	desc = "一件轻便宽松的汉服."
	icon_state = "light_hanfu"
	item_state = "light_hanfu"

/obj/item/clothing/under/hanfu/green
	name = "绿色汉服"
	desc = "一件绿色轻便宽松的汉服."
	icon_state = "green_hanfu"
	item_state = "green_hanfu"

/obj/item/clothing/under/artisan
	name = "工匠服装"
	desc = "一件轻便宽松的衣物."
	icon_state = "artisan1"
	item_state = "artisan1"

/obj/item/clothing/under/artisan/dark
	name = "深色工匠服装"
	desc = "一件轻便宽松的衣物."
	icon_state = "artisan2"
	item_state = "artisan2"

/obj/item/clothing/under/artisan/light
	name = "浅色工匠服装"
	desc = "一件轻便宽松的衣物."
	icon_state = "artisan3"
	item_state = "artisan3"

/obj/item/clothing/under/haori
	name = "羽织"
	desc = "一件轻便宽松的衣物, 在日本穿着."
	icon_state = "haori"
	item_state = "haori"

/obj/item/clothing/under/haori/blue
	name = "羽织"
	desc = "一件轻便宽松的衣物, 在日本穿着."
	icon_state = "haori3"
	item_state = "haori3"

/obj/item/clothing/under/haori/red
	name = "羽织"
	desc = "一件轻便宽松的衣物,在日本穿着."
	icon_state = "haori2"
	item_state = "haori2"

/obj/item/clothing/under/haori/samurai
	name = "羽织"
	desc = "一件轻便宽松的衣物,在日本穿着."
	icon_state = "haori_samurai"
	item_state = "haori_samurai"

/obj/item/clothing/under/haori/samurai/blue
	name = "羽织"
	desc = "一件轻便宽松的衣物,在日本穿着."
	icon_state = "haori_samurai2"
	item_state = "haori_samurai2"

/obj/item/clothing/under/haori/samurai/red
	name = "羽织"
	desc = "一件轻便宽松的衣物,在日本穿着."
	icon_state = "haori_samurai3"
	item_state = "haori_samurai3"

	/* Medieval Japanese Shoes & Boots*/

/obj/item/clothing/shoes/geta
	name = "木屐"
	desc = "一双简单的木制凉鞋.能让你稍微离地."
	icon_state = "geta"
	item_state = "geta"
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 5, arrow = 3, gun = FALSE, energy = 5, bomb = 5, bio = 5, rad = FALSE)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	var/obj/item/weapon/handcuffs/chained = null

/obj/item/clothing/shoes/geta/proc/attach_cuffs(var/obj/item/weapon/handcuffs/cuffs, mob/user as mob)
	if (chained) return

	user.drop_item()
	cuffs.loc = src
	chained = cuffs
	slowdown = 15
	icon_state = "geta1"
	update_icon()

/obj/item/clothing/shoes/geta/proc/remove_cuffs(mob/user as mob)
	if (!chained) return

	user.put_in_hands(chained)
	chained.add_fingerprint(user)

	slowdown = initial(slowdown)
	icon_state = "geta"
	chained = null
	update_icon()

/obj/item/clothing/shoes/geta/attack_self(mob/user as mob)
	..()
	remove_cuffs(user)

/obj/item/clothing/shoes/geta/attackby(H as obj, mob/user as mob)
	..()
	if (istype(H, /obj/item/weapon/handcuffs))
		attach_cuffs(H, user)

/obj/item/clothing/shoes/tsuranuki
	name = "tsuranuki"
	desc = "一双日式来源的镀甲护胫和鞋."
	icon_state = "tsuranuki"
	item_state = "tsuranuki"
	body_parts_covered = FEET|LEG_RIGHT|LEG_LEFT
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 45, arrow = 30, gun = 7, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = FEET|LEG_RIGHT|LEG_LEFT
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	health = 35
	item_flags = NOSLIP

/obj/item/clothing/gloves/gauntlets/kote
	name = "笼手"
	desc = "一双日式来源的装甲铁护腕."
	icon_state = "kote"
	item_state = "kote"
	body_parts_covered = HANDS|ARM_RIGHT|ARM_LEFT
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 45, arrow = 30, gun = 7, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = HANDS|ARM_RIGHT|ARM_LEFT
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 23

	/* Medieval Japanese Headpieces & Helmets*/

/obj/item/clothing/head/helmet/samurai
	name = "武士头盔"
	desc = "一顶日式来源的厚重金属头盔.通常由封建武士佩戴."
	icon_state = "samurai_warrior3"
	item_state = "samurai_warrior3"
	body_parts_covered = HEAD
	armor = list(melee = 60, arrow = 50, gun = 10, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 45

/obj/item/clothing/head/helmet/samurai/lord/brown
	name = "武士领主头盔"
	desc = "一顶日式来源的令人印象深刻且厚重的金属头盔,内置下颌防护板.通常由封建武士佩戴."
	icon_state = "samurai_lord3"
	item_state = "samurai_lord3"
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 45
	slowdown = 0.15
	var/toggled = FALSE

/obj/item/clothing/head/helmet/samurai/lord/brown/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/samurai/lord/brown)
		return
	else
		if (toggled)
			item_state = "samurai_lord3_o"
			icon_state = "samurai_lord3_o"
			item_state_slots["slot_head"] = "samurai_lord3_o"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "samurai_lord3"
			icon_state = "samurai_lord3"
			item_state_slots["slot_head"] = "samurai_lord3"
			to_chat(usr, "<span class = 'danger'>你拉起了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/jingasa
	name = "阵笠"
	desc = "一顶日式来源的厚皮革和草编帽子.通常由远程战斗武士佩戴."
	icon_state = "jingasa"
	item_state = "jingasa"
	body_parts_covered = HEAD
	armor = list(melee = 30, arrow = 15, gun = 5, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 30
	var/adjusted = FALSE

/obj/item/clothing/head/helmet/jingasa/verb/adjust_flaps()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/jingasa)
		return
	else
		if (adjusted)
			item_state = "jingasa"
			item_state_slots["slot_head"] = "jingasa"
			to_chat(usr, "<span class = 'danger'>你调整了阵笠的帽檐.</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "jingasa_flaps"
			item_state_slots["slot_head"] = "jingasa_flaps"
			to_chat(usr, "<span class = 'danger'>你调整了阵笠的帽檐.</span>")
			adjusted = TRUE
	update_clothing_icon()

/obj/item/clothing/head/helmet/kasa
	name = "斗笠"
	desc = "一顶日式来源的厚草帽.通常由旅行者佩戴."
	icon_state = "kasa"
	item_state = "kasa"
	body_parts_covered = HEAD
	armor = list(melee = 20, arrow = 15, gun = 5, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/samurai/guard
	name = "皮革武士头盔"
	desc = "一顶日式来源的厚皮革头盔.通常由低级守卫和轻步兵佩戴."
	icon_state = "samurai_guard3"
	item_state = "samurai_guard3"
	body_parts_covered = HEAD
	armor = list(melee = 45, arrow = 40, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 32

/obj/item/clothing/head/helmet/samurai/guard/red
	name = "红色皮革武士头盔"
	desc = "一顶日式来源的厚皮革头盔.通常由低级守卫和轻步兵佩戴."
	icon_state = "samurai_guard1"
	item_state = "samurai_guard1"

/obj/item/clothing/head/helmet/samurai/guard/blue
	name = "蓝色皮革武士头盔"
	desc = "一顶日式来源的厚皮革头盔.通常由低级守卫和轻步兵佩戴."
	icon_state = "samurai_guard2"
	item_state = "samurai_guard2"

/obj/item/clothing/head/helmet/samurai/guard/black
	name = "黑色皮革武士头盔"
	desc = "一顶日式来源的厚皮革头盔.通常由低级守卫和轻步兵佩戴."
	icon_state = "samurai_guard4"
	item_state = "samurai_guard4"

/obj/item/clothing/head/helmet/samurai/red
	name = "红色武士头盔"
	desc = "一顶日式来源的厚重金属头盔.通常由封建武士佩戴."
	icon_state = "samurai_warrior1"
	item_state = "samurai_warrior1"

/obj/item/clothing/head/helmet/samurai/blue
	name = "蓝色武士头盔"
	desc = "一顶日式来源的厚重金属头盔.通常由封建武士佩戴."
	icon_state = "samurai_warrior2"
	item_state = "samurai_warrior2"

obj/item/clothing/head/helmet/samurai/black
	name = "black samurai helmet"
	desc = "A thick metal helmet of japanese origin. Typically worn by feudal warriors."
	icon_state = "samurai_warrior4"
	item_state = "samurai_warrior4"

/obj/item/clothing/head/helmet/samurai/lord/red
	name = "红色武士领主头盔"
	desc = "一顶日式来源的令人印象深刻且厚重的金属头盔,内置下颌防护板.通常由封建武士佩戴."
	icon_state = "samurai_lord1"
	item_state = "samurai_lord1"
	var/toggled = FALSE

/obj/item/clothing/head/helmet/samurai/lord/red/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/samurai/lord/red)
		return
	else
		if (toggled)
			item_state = "samurai_lord1_o"
			icon_state = "samurai_lord1_o"
			item_state_slots["slot_head"] = "samurai_lord1_o"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "samurai_lord1"
			icon_state = "samurai_lord1"
			item_state_slots["slot_head"] = "samurai_lord1"
			to_chat(usr, "<span class = 'danger'>你拉起了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/samurai/lord/blue
	name = "蓝色武士领主头盔"
	desc = "一顶日式来源的令人印象深刻且厚重的金属头盔,内置下颌防护板.通常由封建武士佩戴."
	icon_state = "samurai_lord2"
	item_state = "samurai_lord2"
	var/toggled = FALSE

/obj/item/clothing/head/helmet/samurai/lord/blue/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/samurai/lord/blue)
		return
	else
		if (toggled)
			item_state = "samurai_lord2_o"
			icon_state = "samurai_lord2_o"
			item_state_slots["slot_head"] = "samurai_lord2_o"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "samurai_lord2"
			icon_state = "samurai_lord2"
			item_state_slots["slot_head"] = "samurai_lord2"
			to_chat(usr, "<span class = 'danger'>你拉起了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/samurai/lord/black
	name = "黑色武士领主头盔"
	desc = "一顶日式来源的令人印象深刻且厚重的金属头盔,内置下颌防护板.通常由封建武士佩戴."
	icon_state = "samurai_lord4"
	item_state = "samurai_lord4"
	var/toggled = FALSE

/obj/item/clothing/head/helmet/samurai/lord/black/verb/toggle_visor()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/samurai/lord/black)
		return
	else
		if (toggled)
			item_state = "samurai_lord4_o"
			icon_state = "samurai_lord4_o"
			item_state_slots["slot_head"] = "samurai_lord4_o"
			to_chat(usr, "<span class = 'danger'>你放下了头盔的面罩.</span>")
			toggled = FALSE
			update_clothing_icon()
			body_parts_covered = HEAD
			flags_inv = BLOCKHEADHAIR
		else if (!toggled)
			item_state = "samurai_lord4"
			icon_state = "samurai_lord4"
			item_state_slots["slot_head"] = "samurai_lord4"
			to_chat(usr, "<span class = 'danger'>你拉起了头盔的面罩.</span>")
			toggled = TRUE
			update_clothing_icon()
			body_parts_covered = HEAD|FACE
			flags_inv = BLOCKHAIR

	/* Medieval Japanese Masks*/

/obj/item/clothing/mask/samurai
	name = "武士面具"
	desc = "一面金属面具,常由领主佩戴以保护面部."
	icon_state = "samurai1"
	item_state = "samurai1"
	body_parts_covered = FACE|EYES
	flags = CONDUCT
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 20, arrow = 15, gun = 5, energy = 15, bomb = 55, bio = 20, rad = FALSE) //nerfed, armor stacking bad.
	restricts_view = 1

/obj/item/clothing/mask/samurai/red
	name = "红色武士面具"
	icon_state = "samurai2"
	item_state = "samurai2"

/obj/item/clothing/mask/samurai/blue
	name = "蓝色武士面具"
	icon_state = "samurai3"
	item_state = "samurai3"

/* Miscallenous Medieval Extra-Cultural Clothes*/

/obj/item/clothing/head/gat
	name = "gat帽"
	desc = "一顶传统的韩国帽子."
	icon_state = "gat"
	item_state = "gat"

/* Fantasy Medieval Clothes*/ //tell admins to iconswap preferencially to spawning in the piece itself if engaging in a event duel, since these are more op than they appear.

/obj/item/clothing/head/turban/toadstool
	name = "毒蘑菇帽"
	desc = "公主在另一座城堡里."
	icon_state = "toadstool"
	item_state = "toadstool"
	heat_protection = HEAD
/obj/item/clothing/head/turban/toadstool/New()
	..()
	icon_state = "toadstool"
	item_state = "toadstool"

	/* Fantasy Crusader Helmets */

/obj/item/clothing/head/helmet/medieval/whitestrake
	name = "penlianal_whitestrake头盔"
	desc = "一顶传奇的圣骑士厚重头盔,属于一位武艺高超的种族灭绝狂人.或者从某个角度看,是一位伟大的英雄."
	icon_state = "penlianal_whitestrake"
	item_state = "penlianal_whitestrake"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 60
	slowdown = 0.10

/obj/item/clothing/head/helmet/medieval/hellknight
	name = "地狱骑士头盔"
	desc = "一顶精英恶魔勇士的厚重带角头盔.一股愤怒与仇恨的绿色狂怒从它狭窄的裂眼孔中溢出."
	icon_state = "hell_champion"
	item_state = "hell_champion"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 60
	slowdown = 0.10

/obj/item/clothing/head/helmet/medieval/saint
	name = "圣徒头盔"
	desc = "一顶神性选民所戴的厚重头盔,头顶悬挂着天使光环."
	icon_state = "crusader_saint"
	item_state = "crusader_saint"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 60
	slowdown = 0.10

	/* Dark Souls Armor*/

/obj/item/clothing/head/helmet/medieval/giantdad
	name = "罗德兰头盔"
	desc = "一顶传奇的父之头盔,据说其前任主人的洪亮嗓音能回应任何挑战."
	icon_state = "giantdad"
	item_state = "giantdad"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 65
	slowdown = 0.10

/* wip
/obj/item/clothing/suit/armor/giantdad
	name = "lordran armor"
	desc = "The legendary armor of the father, its pierce mark from a equally legendary sword is indistinguishable. It is written he got back up again and smited the attacker."
	icon_state = "giantdad"
	item_state = "giantdad"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 85, arrow = 100, gun = 20, energy = 15, bomb = 65, bio = 20, rad = FALSE)
	health = 90
	slowdown = 1.2

/obj/item/clothing/gloves/gauntlets/giantdad
	name = "lordran gauntlets"
	desc = "The legendary gauntlets of the father, protective and flexible for gripping his weapon and pointing downwards at his opponents."
	icon_state = "giantdad"
	item_state = "giantdad"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 40

/obj/item/clothing/shoes/medieval/giantdad
	name = "lordran shoes"
	desc = "A legendary pair of plated armored shoes, they are suprisingly light. Ideal for outmaneuvering duelists."
	icon_state = "giantdad"
	item_state = "giantdad"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	health = 40
*/
///////////////////////////////////////////////SKYRIM////////////////////////////////////////////////////////
/obj/item/clothing/head/helmet/medieval/tes13/dwemmer
	name = "矮人头盔"
	desc = "一顶精英矮人战士的厚重头盔."
	icon_state = "dwelmet"
	item_state = "dwelmet"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 80
	slowdown = 0.10

/obj/item/clothing/gloves/gauntlets/tes13/dwemmer
	name = "矮人护手"
	desc = "一双矮人来源的装甲护腕."
	icon_state = "dwoves"
	item_state = "dwoves"
	body_parts_covered = HANDS|ARM_RIGHT|ARM_LEFT
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 70, arrow = 40, gun = 7, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = HANDS|ARM_RIGHT|ARM_LEFT
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 50

/obj/item/clothing/shoes/dwemmer
	name = "矮人靴子"
	desc = "一双由矮人金属制成的镀甲靴子."
	icon_state = "dwoots"
	item_state = "dwoots"
	body_parts_covered = FEET|LEG_RIGHT|LEG_LEFT
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 70, arrow = 50, gun = 7, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = FEET|LEG_RIGHT|LEG_LEFT
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	health = 50
	item_flags = NOSLIP

/obj/item/clothing/suit/armor/tes13/dwemmer
	name = "矮人护甲"
	desc = "一件由矮人金属制成的厚重昂贵护甲."
	icon_state = "dwarmor"
	item_state = "dwarmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 80
////////whiterun/stormcloaks/////////
/obj/item/clothing/under/tes13/stormcloak
	name = "风暴斗篷胸甲"
	desc = "一件蓝色罩袍覆盖在皮革护甲上,下面还有锁子甲."
	icon_state = "stormcloak"
	item_state = "stormcloak"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	armor = list(melee = 45, arrow = 30, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/under/tes13/stormcloak/female
	desc = "一件蓝色战袍罩在皮甲外,内衬锁子甲.这件为女性量身定做."
	icon_state = "stormcloak_f"
	item_state = "stormcloak_f"

/obj/item/clothing/under/tes13/whiterun
	name = "白漫城卫兵胸甲"
	desc = "一件橙色战袍罩在皮甲外,内衬锁子甲."
	icon_state = "whiterun"
	item_state = "whiterun"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	armor = list(melee = 45, arrow = 30, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/under/tes13/whiterun/female
	desc = "一件橙色战袍罩在皮甲外,内衬锁子甲.这件为女性量身定做."
	icon_state = "whiterun_f"
	item_state = "whiterun_f"

/obj/item/clothing/head/helmet/medieval/tes13/guard
	name = "卫兵头盔"
	desc = "一顶厚重的钢制头盔,常由士兵或卫兵佩戴."
	icon_state = "tes13"
	item_state = "tes13"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHAIR
	armor = list(melee = 50, arrow = 30, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 60
	slowdown = 0.05

/obj/item/clothing/head/helmet/medieval/tes13/hide
	name = "皮制头盔"
	desc = "一顶厚重的皮制头盔,常由士兵或卫兵佩戴."
	icon_state = "tes13_hide"
	item_state = "tes13_hide"
	body_parts_covered = HEAD
	flags_inv = BLOCKHAIR
	armor = list(melee = 35, arrow = 20, gun = 10, energy = 15, bomb = 20, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 60
	slowdown = 0.01

/obj/item/clothing/head/helmet/medieval/tes13/iron
	name = "铁制头盔"
	desc = "一顶厚重的带角铁制头盔,常由强盗、雇佣兵和旅行者佩戴."
	icon_state = "tes13_iron"
	item_state = "tes13_iron"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHAIR
	armor = list(melee = 45, arrow = 30, gun = 15, energy = 25, bomb = 30, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 100
	slowdown = 0.02

/obj/item/clothing/suit/armor/tes13/stormcloak
	name = "风暴斗篷军官护甲"
	desc = "一件厚重的皮制护甲,上面披着一张熊皮."
	icon_state = "stormcloak"
	item_state = "stormcloak"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 65, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 0.4
	health = 80

/obj/item/clothing/suit/armor/tes13/imperial
	name = "帝国军官护甲"
	desc = "一件厚重的钢制护甲,由帝国军官佩戴."
	icon_state = "imperial_officer"
	item_state = "imperial_officer"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 65, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 0.5
	health = 80

/obj/item/clothing/head/helmet/medieval/tes13/stormcloak
	name = "风暴斗篷军官头盔"
	desc = "一顶带装甲内衬的熊皮头盔."
	icon_state = "stormcloak"
	item_state = "stormcloak"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHAIR
	armor = list(melee = 60, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 80
	slowdown = 0.05


/obj/item/clothing/under/tes13/imperial
	name = "帝国护甲"
	desc = "一件红色束腰外衣,外罩皮甲."
	icon_state = "tes13_imperial"
	item_state = "tes13_imperial"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	armor = list(melee = 45, arrow = 30, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/head/helmet/medieval/tes13/imperial
	name = "帝国头盔"
	desc = "一顶皮制帝国头盔"
	icon_state = "tes13_imperial"
	item_state = "tes13_imperial"
	body_parts_covered = HEAD
	flags_inv = BLOCKHAIR
	armor = list(melee = 45, arrow = 40, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 80
	slowdown = 0.01

/obj/item/clothing/head/helmet/medieval/tes13/imperial/officer
	name = "帝国军官头盔"
	desc = "一顶钢制帝国头盔"
	icon_state = "tes13_imperial_officer"
	item_state = "tes13_imperial_officer"
	body_parts_covered = HEAD
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 50, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 80
	slowdown = 0.03


/obj/item/clothing/under/tes13/stormcloak/ulfirc
	name = "乌弗瑞克·风暴斗篷的衣服"
	desc = "一套蓝色精美服装搭配长裤"
	icon_state = "ulfric"
	item_state = "ulfric"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	body_parts_covered = HEAD|EYES|LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	armor = list(melee = 80, arrow = 80, gun = 10, energy = 15, bomb = 80, bio = 20, rad = FALSE)
	health = 200

/obj/item/clothing/under/tes13/imperial/bolgruf
	name = "领主巴尔古夫的衣服"
	desc = "一套精美服装搭配长裤"
	icon_state = "bolgruf"
	item_state = "bolgruf"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
	body_parts_covered = HEAD|EYES|LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	armor = list(melee = 80, arrow = 80, gun = 10, energy = 15, bomb = 80, bio = 20, rad = FALSE)
	health = 200
/////////////tes13 civilian/////////////////////////
/obj/item/clothing/suit/storage/coat/tes13/fine_clothing
	name = "精美服装"
	desc = "一件精美的毛皮夹克和衬衫,供较为富裕的人穿着."
	icon_state = "fine_clothes"
	item_state = "fine_clothes"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	health = 60

/obj/item/clothing/suit/storage/coat/tes13/fine_clothing/blue
	name = "精美服装"
	desc = "一件精美的毛皮夹克和衬衫,供较为富裕的人穿着.这件是蓝色的"
	icon_state = "fine_clothes2"
	item_state = "fine_clothes2"
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	health = 60