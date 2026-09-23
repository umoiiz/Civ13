/*Index*/
/* 1 - Roman Uniform & Sandals
 * 2 - Greek Uniforms
 * 3 - Celtic Uniforms
 * 4 - Mayan & Aztec Uniforms + Sandals
 * 5 - Egyptian Uniforms
 * 6 - Ancient Armor
 * 7 - Ancient Capes
 * 8 - Ancient Headpieces
 * 9 - Ancient Helmets
 * 9a - Nomads (Craftable) Helmets
 * 10 - Royal & Imperial Headwear
 * 11 - Religious Headwear
 * 12 - Pelts
 * 13 - Fur Coats
 * 14 - Fur Shoes
 * 15 - Ancient Facemasks & Covers
 * 16 - Miscallaneous
 * 16a - Asian Uniforms*/

/*Roman Uniforms & Sandals*/

/obj/item/clothing/shoes/roman
	name = "凉鞋"
	desc = "基本款皮革凉鞋,高至膝盖。"
	icon_state = "roman"
	item_state = "roman"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 60, arrow = 5, gun = FALSE, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	siemens_coefficient = 0.6

/obj/item/clothing/under/roman
	name = "罗马军团士兵制服"
	desc = "覆有铁甲的红色束腰外衣。罗马军队使用。"
	icon_state = "roman"
	item_state = "roman"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/toga
	name = "白色托加长袍"
	desc = "一件简单的布制托加长袍。"
	icon_state = "toga"
	item_state = "toga"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/toga2
	name = "半肩白色托加长袍"
	desc = "一件简单的布制托加长袍,仅覆盖一侧肩膀。"
	icon_state = "toga2"
	item_state = "toga2"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/roman_centurion
	name = "罗马百夫长制服"
	desc = "覆有铁甲的红色束腰外衣,附加金色甲片。罗马军队的百夫长使用。"
	icon_state = "roman_centurion"
	item_state = "roman_centurion"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/*Greek Uniforms*/

/obj/item/clothing/under/greek1
	name = "希腊制服"
	desc = "覆有青铜和皮革甲的轻型束腰外衣。希腊军队使用。"
	icon_state = "athens"
	item_state = "athens"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/greek2
	name = "希腊制服"
	desc = "覆有青铜和皮革甲的轻型束腰外衣。希腊军队使用。"
	icon_state = "thebes"
	item_state = "thebes"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/greek3
	name = "希腊制服"
	desc = "覆有青铜和皮革甲的轻型束腰外衣。希腊军队使用。"
	icon_state = "corinthia"
	item_state = "corinthia"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/greek_commander
	name = "希腊指挥官制服"
	desc = "覆有青铜板甲的浅蓝色束腰外衣。希腊指挥官使用。"
	icon_state = "greek_commander"
	item_state = "greek_commander"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/toxotai
	name = "白色束腰外衣"
	desc = "一件轻便的白色束腰外衣。"
	icon_state = "toxotai"
	item_state = "toxotai"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/*Celtic Uniforms*/

/obj/item/clothing/under/celtic_green
	name = "绿色凯尔特长裤"
	desc = "凯尔特风格长裤,绿色。"
	icon_state = "celtic_green"
	item_state = "celtic_green"
	heat_protection = LOWER_TORSO|LEGS

/obj/item/clothing/under/celtic_blue
	name = "蓝色凯尔特长裤"
	desc = "凯尔特风格长裤,蓝色。"
	icon_state = "celtic_blue"
	item_state = "celtic_blue"
	heat_protection = LOWER_TORSO|LEGS

/obj/item/clothing/under/celtic_red
	name = "红色凯尔特长裤"
	desc = "凯尔特风格长裤,红色。"
	icon_state = "celtic_red"
	item_state = "celtic_red"
	heat_protection = LOWER_TORSO|LEGS

/obj/item/clothing/under/celtic_short_braccae
	name = "凯尔特短裤"
	desc = "凯尔特风格的短羊毛长裤。"
	icon_state = "celtic_short_braccae"
	item_state = "celtic_short_braccae"
	heat_protection = LOWER_TORSO

/obj/item/clothing/under/celtic_long_braccae
	name = "凯尔特长裤"
	desc = "凯尔特风格的长羊毛长裤。"
	icon_state = "celtic_long_braccae"
	item_state = "celtic_long_braccae"
	heat_protection = LOWER_TORSO|LEGS

/*Mayan & Aztec Uniforms + Sandals*/

/obj/item/clothing/under/mayan_loincloth
	name = "玛雅缠腰布"
	desc = "玛雅风格缠腰布."
	icon_state = "mayan_loincloth"
	item_state = "mayan_loincloth"
	heat_protection = LOWER_TORSO

/obj/item/clothing/under/aztec_loincloth
	name = "阿兹特克缠腰布"
	desc = "适合凶猛阿兹特克战士的缠腰布."
	icon_state = "aztec_loincloth"
	item_state = "aztec_loincloth"
	heat_protection = LOWER_TORSO

/obj/item/clothing/shoes/aztec_sandals
	name = "阿兹特克凉鞋"
	desc = "来自丛林的基本皮革凉鞋."
	icon_state = "aztec_sandals"
	item_state = "aztec_sandals"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 5, gun = FALSE, energy = FALSE, bomb = 1, bio = FALSE, rad = FALSE)
	siemens_coefficient = 0.6

/*Egyptian Uniforms*/

/obj/item/clothing/under/pharaoh
	name = "法老式申迪特"
	desc = "华丽装饰的申迪特."
	icon_state = "pharaoh"
	item_state = "pharaoh"
	heat_protection = LOWER_TORSO|UPPER_TORSO

/obj/item/clothing/under/pharaoh2
	name = "尼美斯申迪特"
	desc = "华丽装饰的申迪特."
	icon_state = "greatshendyt"
	item_state = "greatshendyt"
	heat_protection = LOWER_TORSO|UPPER_TORSO

/*Ainu Things*/
/obj/item/clothing/under/ainu
	name = "阿伊努长袍"
	desc = "阿伊努人穿的一套长袍."
	icon_state = "ainu_robe"
	item_state = "ainu_robe"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/ainu2
	name = "阿伊努长袍"
	desc = "阿伊努人穿的一套长袍."
	icon_state = "ainu_robe2"
	item_state = "ainu_robe2"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/head/ainu_bandana
	name = "阿伊努头巾"
	desc = "带有复杂图案的头巾."
	icon_state = "ainu"
	item_state = "ainu"
	var/folded = FALSE

/obj/item/clothing/head/ainu_bandana/verb/fold_bandana()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ainu_bandana)
		return
	else
		if (folded)
			item_state = "ainu"
			item_state_slots["slot_w_head"] = "ainu"
			to_chat(usr, "<span class = 'danger'>你展开你的头巾.</span>")
			folded = FALSE
		else if (!folded)
			item_state = "ainu_smol"
			item_state_slots["slot_w_head"] = "ainu_smol"
			to_chat(usr, "<span class = 'danger'>你叠起你的头巾.</span>")
			folded = TRUE
	update_clothing_icon()

/*Ancient Armor*/

/obj/item/clothing/suit/armor
	health = 40
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/armor/ancient/scale
	name = "分段甲"
	desc = "一件厚重且昂贵的分段铁甲,其鳞片保护躯干."
	icon_state = "scale_armor"
	item_state = "scale_armor"
	body_parts_covered = UPPER_TORSO
	armor = list(melee = 65, arrow = 45, gun = 10, energy = 15, bomb = 45, bio = 20, rad = 45)
	value = 40
	slowdown = 0.8
	health = 47

/obj/item/clothing/suit/armor/ancient/chainmail
	name = "早期锁子甲"
	desc = "由多个小环互扣制成的可穿戴护甲."
	icon_state = "early_chainmail"
	item_state = "early_chainmail"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 30, bio = 20, rad = FALSE)
	value = 30
	slowdown = 0.6
	health = 50

/obj/item/clothing/suit/armor/ancient/linen
	name = "亚麻胸甲"
	desc = "一件厚重的亚麻护甲,覆盖躯干和下半身."
	icon_state = "heavycloth_armor"
	item_state = "heavycloth_armor"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO
	armor = list(melee = 55, arrow = 35, gun = FALSE, energy = 15, bomb = 35, bio = 20, rad = 10)
	value = 40
	slowdown = 0.2
	health = 28
	flags = FALSE

/obj/item/clothing/suit/armor/ancient/bronze_lamellar
	name = "青铜埃及札甲"
	desc = "一件青铜札甲,为法老王朝的士兵所使用."
	icon_state = "egyptian_lamellar"
	item_state = "egyptian_lamellar"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE) //identical to bronze armor
	value = 25
	slowdown = 0.7
	health = 48

/obj/item/clothing/suit/armor/ancient/bronze_lamellar/chinese
	name = "青铜中国札甲"
	desc = "一件青铜札甲,为中国早期王朝的战士所使用."
	icon_state = "chinese_lamellar"
	item_state = "chinese_lamellar"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	value = 25
	slowdown = 0.7
	health = 48


/obj/item/clothing/suit/armor/ancient/scaled
	name = "鳞甲"
	desc = "一件由若干青铜鳞片制成的护甲."
	icon_state = "scaled_armor"
	item_state = "scaled_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 35, gun = 7, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	value = 25
	slowdown = 0.7
	health = 48


/obj/item/clothing/suit/armor/ancient/aztec_harness
	name = "阿兹特克挽具"
	desc = "几块金属板固定在皮革条上,覆盖躯干."
	icon_state = "aztec_harness"
	item_state = "aztec_harness"
	body_parts_covered = UPPER_TORSO
	armor = list(melee = 35, arrow = 15, gun = 2, energy = 2, bomb = 2, bio = FALSE, rad = FALSE)
	value = 40
	slowdown = 0.2
	health = 18

/obj/item/clothing/suit/armor/ancient/gator_scale_armor
	name = "鳄鱼鳞甲"
	desc = "一件经过精心腌制和硬化的鳄鱼鳞甲,覆盖躯干."
	icon_state = "gator_scale_armor"
	item_state = "gator_scale_armor"
	body_parts_covered = UPPER_TORSO
	armor = list(melee = 45, arrow = 25, gun = 5, energy = 10, bomb = 20, bio = 20, rad = 10)
	value = 40
	slowdown = 0.2
	health = 18

/*Ancient Capes*/

/obj/item/clothing/suit/cape
	name = "红色披风"
	desc = "一件长红色披风."
	icon_state = "redcape"
	item_state = "redcape"

/obj/item/clothing/suit/cape/blue
	name = "蓝色披风"
	desc = "一件长蓝色披风."
	icon_state = "bluecape"
	item_state = "bluecape"

/*Ancient Headpieces*/

/obj/item/clothing/head/toxotai
	name = "托克索泰帽"
	desc = "一顶宽檐帽,为托克索泰所使用."
	icon_state = "toxotai"
	item_state = "toxotai"

/obj/item/clothing/head/egyptian_headdress_black
	name = "黑色埃及头饰"
	desc = "一件朴素的防晒亚麻头饰,尽管带有黑色条纹."
	icon_state = "egyptian_headdress_black"
	item_state = "egyptian_headdress_black"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/egyptian_headdress_blue
	name = "蓝色埃及头饰"
	desc = "一件朴素的防晒蓝色亚麻头饰."
	icon_state = "egyptian_headdress_blue"
	item_state = "egyptian_headdress_blue"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/egyptian_headdress_red
	name = "红色埃及头饰"
	desc = "一件朴素的防晒红色亚麻头饰."
	icon_state = "egyptian_headdress_red"
	item_state = "egyptian_headdress_red"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/*Ancient Helmets*/

/obj/item/clothing/head/helmet/roman
	name = "罗马军团士兵头盔"
	desc = "罗马军队的典型头盔."
	icon_override = 'icons/obj/clothing/head.dmi'
	icon_state = "roman"
	item_state = "roman"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35

/obj/item/clothing/head/helmet/roman_decurion
	name = "罗马十夫长头盔"
	desc = "一件铁头盔,为十夫长所使用.罗马军队骑兵中的军官."
	icon_override = 'icons/obj/clothing/head.dmi'
	icon_state = "roman_d"
	item_state = "roman_d"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35

/obj/item/clothing/head/helmet/roman_centurion
	name = "罗马百夫长头盔"
	desc = "一件铁头盔,为百夫长所使用.罗马军队步兵中的军官."
	icon_override = 'icons/obj/clothing/head.dmi'
	icon_state = "roman_c"
	item_state = "roman_c"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35

/obj/item/clothing/head/helmet/gladiator
	name = "角斗士头盔"
	desc = "一顶角斗士头盔."
	icon_state = "gladiator"
	item_state = "gladiator"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 45, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/solinvictus
	name = "无敌太阳神头盔"
	desc = "一顶饰有黄金、带有面具面容和金色太阳纹的头盔.为罗马皇帝所佩戴."
	icon_state = "sol_invictus"
	item_state = "sol_invictus"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHAIR
	armor = list(melee = 65, arrow = 50, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 55
	slowdown = 0.25

/obj/item/clothing/head/helmet/anax
	name = "希腊阿纳克斯头盔"
	desc = "一顶加固的青铜希腊头盔,覆盖大部分面部,顶部有黑色羽饰.为希腊国王所佩戴."
	icon_state = "leonidas"
	item_state = "leonidas"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHAIR
	armor = list(melee = 60, arrow = 45, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	restricts_view = 1
	health = 50
	slowdown = 0.10

/obj/item/clothing/head/helmet/greek
	name = "希腊头盔"
	desc = "一顶青铜希腊头盔,覆盖大部分面部."
	icon_state = "new_greek"
	item_state = "new_greek"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 44, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/greek_commander
	name = "洛克哈戈斯头盔"
	desc = "一顶青铜希腊头盔,覆盖大部分面部,顶部有红色羽饰.为希腊洛克哈戈斯所佩戴."
	icon_state = "spartan"
	item_state = "spartan"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 44, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/greek_sl
	name = "迪莫伊里泰斯头盔"
	desc = "一顶青铜希腊头盔,覆盖大部分面部,顶部有蓝色羽饰.为希腊迪莫伊里泰斯所佩戴."
	icon_state = "athenian"
	item_state = "athenian"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 62, arrow = 44, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/egyptian
	name = "埃及战争头饰"
	desc = "一件青铜埃及头饰,面部外露以减轻佩戴者的炎热."
	icon_state = "egyptian_bronze_headdress"
	item_state = "egyptian_bronze_headdress"
	body_parts_covered = HEAD|EYES
	item_flags = FLEXIBLEMATERIAL // The egyptian helmet does not block the face. body_parts_covered is used in armor calculation, masks with this flag will not prevent eating even if they are covering your "face".
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 10, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 35
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/helmet/phrigian
	name = "青铜弗里吉亚头盔"
	desc = "一顶带球状顶端的青铜弗里吉亚头盔.更注重风格而非整体防护."
	icon_state = "phrigian_helmet"
	item_state = "phrigian_helmet"
	body_parts_covered = HEAD
	armor = list(melee = 38, arrow = 25, gun = FALSE, energy = 15, bomb = 30, bio = 20, rad = FALSE)
	health = 30


/obj/item/clothing/head/helmet/leather
	name = "皮革头盔"
	desc = "一顶简单的皮革头盔."
	icon_state = "leatherhelmet"
	item_state = "leatherhelmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 27, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 20

/obj/item/clothing/head/helmet/hatchigane
	name = "钵金头带"
	desc = "一条日式设计的装甲皮革头带,能抵御轻微攻击但无法承受重击."
	icon_state = "hatchigane"
	item_state = "hatchigane"
	body_parts_covered = HEAD
	armor = list(melee = 15, arrow = 15, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 15

/obj/item/clothing/head/helmet/khepresh
	name = "海普雷什战冠"
	desc = "一顶由皮革和黄金制成的华丽埃及战冠.它不如青铜或铁那样具有防护性,但用于保护陛下颇为实用."
	icon_state = "khepresh"
	item_state = "khepresh"
	body_parts_covered = HEAD
	armor = list(melee = 30, arrow = 20, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE) //lightly stronger than leather
	health = 30

	/* Nomads (Craftable) Helmets*/

/obj/item/clothing/head/helmet/gladiator/nomads //nerfing it down for mass consumption
	name = "角斗士头盔"
	desc = "一顶角斗士头盔."
	icon_state = "gladiator"
	item_state = "gladiator"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/horned
	name = "角盔"
	desc = "一顶角盔, 野蛮人使用."
	icon_state = "barbarian" //"viking" can be used elsewise for wagner
	item_state = "barbarian"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/asterix
	name = "翼盔"
	desc = "一顶翼盔, 供那些不介意面部遭受野蛮刺击的迅捷战士使用."
	icon_state = "asterix"
	item_state = "asterix"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/egyptian/nomads
	name = "埃及战冠"
	desc = "一顶青铜埃及头冠, 面部外露以缓解佩戴者的炎热."
	icon_state = "egyptian_bronze_headdress"
	item_state = "egyptian_bronze_headdress"
	body_parts_covered = HEAD|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/helmet/greek/nomads
	name = "希腊头盔"
	desc = "一顶青铜希腊头盔, 覆盖了大部分面部."
	icon_state = "new_greek"
	item_state = "new_greek"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/greek_commander/nomads
	name = "洛克哈戈斯头盔"
	desc = "一顶青铜希腊头盔, 覆盖了大部分面部, 顶部有红色羽饰. 由希腊洛克哈戈斯佩戴."
	icon_state = "spartan"
	item_state = "spartan"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/greek_sl/nomads
	name = "迪莫伊里特斯头盔"
	desc = "一顶青铜希腊头盔, 覆盖了大部分面部, 顶部有蓝色羽饰. 由希腊迪莫伊里特斯佩戴."
	icon_state = "athenian"
	item_state = "athenian"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/roman/nomads
	name = "罗马军团头盔"
	desc = "罗马军队的典型头盔."
	icon_override = 'icons/obj/clothing/head.dmi'
	icon_state = "roman"
	item_state = "roman"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE) //nerfed
	health = 30

/obj/item/clothing/head/helmet/chinese_warrior
	name = "中国武士头盔"
	desc = "一顶青铜头盔, 早期中国王朝使用."
	icon_state = "bronze_chinese"
	item_state = "bronze_chinese"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 30, gun = FALSE, energy = 15, bomb = 40, bio = 20, rad = FALSE)
	health = 30

/*Royal & Laurel Headwear*/

/obj/item/clothing/head/pharoah
	name = "法老头冠"
	desc = "一顶华丽的金色头冠."
	icon_state = "pharoah_headdress"
	item_state = "pharoah_headdress"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/nemes
	name = "尼美斯头巾"
	desc = "一顶华丽的金色头巾."
	icon_state = "nemes_headdress"
	item_state = "nemes_headdress"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/doublecrown //replaced by hedjet/deshret/pschent following
	name = "双冠"
	desc = "一顶双色布冠."
	icon_state = "doublecrown"
	item_state = "doublecrown"

/obj/item/clothing/head/hedjet
	name = "海杰特王冠"
	desc = "一顶由布料制成的埃及王冠. 通常由统治洪泛平原的法老佩戴." //historically the northern pharoahs nearer to the nile delta
	icon_state = "hedjet"
	item_state = "hedjet"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/deshret
	name = "德什雷特王冠"
	desc = "一顶由布料制成的红色埃及王冠. 通常由统治沙漠沙丘的法老佩戴." //historically the southern pharoahs nearer to the nubian desert
	icon_state = "deshret"
	item_state = "deshret"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/pschent
	name = "普斯肯特王冠"
	desc = "一顶由布料制成的红白相间的埃及王冠. 由德什雷特与海杰特组合而成; 它代表着对其领地的神圣权威." //worn by herod, of a united egyptian kingdom.
	icon_state = "pschent"
	item_state = "pschent"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/head/laurelcrown
	name = "月桂冠"
	desc = "一顶由月桂制成的王冠."
	icon_state = "laurelcrown"
	item_state = "laurelcrown"
	body_parts_covered = FALSE

/obj/item/clothing/head/laurelcrown/gold
	name = "金月桂冠"
	desc = "一顶由黄金制成的王冠, 模仿月桂冠."
	icon_state = "laurelcrown_gold"
	item_state = "laurelcrown_gold"
	body_parts_covered = FALSE

/* Religious Headwear*/

/obj/item/clothing/head/fiendish
	name = "恶魔头饰"
	desc = "一顶险恶的头饰, 受邪教与女巫团青睐."
	icon_state = "fiendish"
	item_state = "fiendish"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/fiendish/blugi
	color = "#2a28b6"


/obj/item/clothing/head/semitic_cap
	name = "闪米特帽"
	desc = "一顶黄色圆头帽, 用于在犹太人之间以及统治他们的人之间标示犹太人."
	icon_state = "semitic_cap"
	item_state = "semitic_cap"
	flags_inv = BLOCKHEADHAIR

/*Pelts*/

/obj/item/clothing/head/bearpelt
	name = "熊皮头罩"
	desc = "一张熊皮制成的头罩."
	icon_state = "bearpelt"
	item_state = "bearpelt"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/wolfpelt
	name = "狼皮头罩"
	desc = "一张狼皮制成的头罩."
	icon_state = "wolfpelt"
	item_state = "wolfpelt"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/wolfpelt/white
	name = "白狼皮头罩"
	desc = "一张狼皮制成的头罩."
	icon_state = "whitewolfpelt"
	item_state = "whitewolfpelt"

/obj/item/clothing/head/pantherpelt
	name = "豹皮头罩"
	desc = "一张豹皮制成的头罩."
	icon_state = "pantherpelt"
	item_state = "pantherpelt"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/lionpelt
	name = "狮皮头罩"
	desc = "一张狮皮制成的头罩."
	icon_state = "lionpelt"
	item_state = "lionpelt"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/gatorpelt
	name = "鳄鱼皮头罩"
	desc = "一张鳄鱼皮制成的头罩."
	icon_state = "gatorpelt"
	item_state = "gatorpelt"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD

/obj/item/clothing/head/foxpelt
	name = "狐皮头罩"
	desc = "一张狐皮制成的头罩."
	icon_state = "foxpelt"
	item_state = "foxpelt"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/foxpelt/white
	name = "白狐皮头罩"
	desc = "一张狐皮制成的头罩."
	icon_state = "whitefoxpelt"
	item_state = "whitefoxpelt"

/obj/item/clothing/head/sheeppelt
	name = "羊皮头罩"
	desc = "一张羊皮制成的头罩. 厚实的羊毛有助于为你的身体御寒."
	icon_state = "sheeppelt"
	item_state = "sheeppelt"
	cold_protection = HEAD|ARMS

/obj/item/clothing/head/goatpelt
	name = "山羊皮头罩"
	desc = "一张山羊皮制成的头罩. 轻盈松散的毛皮有助于为你的身体遮挡阳光."
	icon_state = "goatpelt"
	item_state = "goatpelt"
	heat_protection = HEAD|ARMS

/obj/item/clothing/head/bisonpelt
	name = "野牛皮头罩"
	desc = "一张野牛皮制成的头罩. 厚实缠结的毛皮为你的身体御寒; 牛角只是装饰."
	icon_state = "bisonpelt"
	item_state = "bisonpelt"
	cold_protection = HEAD|ARMS

/*Fur Coats*/

/obj/item/clothing/suit/storage/coat
	var/hood = FALSE
	min_cold_protection_temperature = COAT_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/coat/fur
	name = "毛皮大衣"
	desc = "一件厚实的毛皮大衣, 非常适合冬天."
	icon_state = "fur_jacket1"
	item_state = "fur_jacket1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 15, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65
	var/colorn = 1
	var/specific = FALSE
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/suit/storage/coat/fur/brown
	name = "棕色毛皮大衣"
	desc = "一件厚实的棕色毛皮大衣, 非常适合冬天."
	icon_state = "fur_jacket1"
	item_state = "fur_jacket1"
	specific = TRUE
	colorn = 1

/obj/item/clothing/suit/storage/coat/fur/white
	name = "白色毛皮大衣"
	desc = "一件厚实的白色毛皮大衣, 非常适合冬天."
	icon_state = "fur_jacket4"
	item_state = "fur_jacket4"
	specific = TRUE
	colorn = 4

/obj/item/clothing/suit/storage/coat/fur/black
	name = "黑色毛皮大衣"
	desc = "一件厚实的黑色毛皮大衣, 非常适合冬天."
	icon_state = "fur_jacket3"
	item_state = "fur_jacket3"
	specific = TRUE
	colorn = 3

/obj/item/clothing/suit/storage/coat/fur/grey
	name = "灰色毛皮大衣"
	desc = "一件厚实的灰色毛皮大衣, 非常适合冬天."
	icon_state = "fur_jacket2"
	item_state = "fur_jacket2"
	specific = TRUE
	colorn = 2

/obj/item/clothing/suit/storage/coat/fur/pink
	name = "人皮大衣"
	desc = "一件由人皮制成的大衣. 真吓人..."
	icon_state = "fur_jacket5"
	item_state = "fur_jacket5"
	specific = TRUE
	colorn = 5

//orc fur coat & boots relocated to apparel_tribes.dm

/obj/item/clothing/suit/storage/coat/fur/New()
	..()
	if (!specific)
		colorn = pick(1,2,3,4)
		icon_state = "fur_jacket[colorn]"
		item_state = "fur_jacket[colorn]"

/obj/item/clothing/suit/storage/coat/fur/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"

	if (ishuman(usr))
		var/mob/living/human/H = usr
		if (H.head)
			to_chat(usr, "<span class = 'warning'>你无法戴上兜帽, [H.head]挡住了!</span>")
			return
	if (hood)
		icon_state = "fur_jacket[colorn]"
		item_state = "fur_jacket[colorn]"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
		item_state_slots["slot_wear_suit"] = "fur_jacket[colorn]"
		to_chat(usr, "<span class = 'danger'>你脱下大衣的兜帽.</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return
	else if (!hood)
		icon_state = "fur_jacket[colorn]h"
		item_state = "fur_jacket[colorn]h"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT|HEAD
		item_state_slots["slot_wear_suit"] = "fur_jacket[colorn]h"
		to_chat(usr, "<span class = 'danger'>你用大衣的兜帽罩住头部.</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return

/*Fur Shoes*/

/obj/item/clothing/shoes/fur
	name = "毛皮靴"
	desc = "厚实的毛皮靴."
	icon_state = "fur"
	item_state = "fur"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 20, arrow = 10, gun = FALSE, energy = 25, bomb = 50, bio = 20, rad = 35)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	var/colorn = 1
	var/specific = FALSE

/obj/item/clothing/shoes/fur/black
	name = "黑色毛皮靴"
	desc = "厚实的毛皮靴。"
	icon_state = "fur3"
	item_state = "fur3"
	specific = TRUE

/obj/item/clothing/shoes/fur/brown
	name = "棕色毛皮靴"
	desc = "厚实的毛皮靴。"
	icon_state = "fur1"
	item_state = "fur1"
	specific = TRUE

/obj/item/clothing/shoes/fur/white
	name = "白色毛皮靴"
	desc = "厚实的毛皮靴。"
	icon_state = "fur4"
	item_state = "fur4"
	specific = TRUE

/obj/item/clothing/shoes/fur/grey
	name = "灰色毛皮靴"
	desc = "厚实的毛皮靴。"
	icon_state = "fur2"
	item_state = "fur2"
	specific = TRUE

/obj/item/clothing/shoes/fur/pink
	name = "人皮靴"
	desc = "人皮靴。"
	icon_state = "fur5"
	item_state = "fur5"
	specific = TRUE

/obj/item/clothing/shoes/fur/New()
	..()
	if (!specific)
		colorn = pick(1,2,3,4)
		icon_state = "fur[colorn]"
		item_state = "fur[colorn]"

/*Ancient Facemasks & Covers*/

/obj/item/clothing/mask/redkerchief
	name = "红色头巾"
	desc = "一块轻质布料,围在脖子上。"
	icon_state = "redkerchief"
	item_state = "redkerchief"
	flags_inv = 0
	w_class = ITEM_SIZE_TINY
	var/toggled = FALSE

/obj/item/clothing/mask/shemagh
	name = "阿拉伯头巾"
	desc = "一块轻质布料,用于保护头部和面部。"
	icon_state = "shemagh0"
	item_state = "shemagh0"
	var/usedstate = "shemagh1"
	var/unusedstate = "shemagh0"
	var/partscovered = FACE|HEAD
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL
	var/toggled = FALSE
	restricts_view = 1
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/mask/shemagh/redkerchief
	name = "红色头巾"
	desc = "一块轻质布料,围在脖子上。"
	icon_state = "redkerchief0"
	item_state = "redkerchief0"
	usedstate = "redkerchief1"
	unusedstate = "redkerchief0"
	partscovered = FACE
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/shemagh/bluekerchief
	name = "蓝色头巾"
	desc = "一块轻质布料,围在脖子上。"
	icon_state = "bluekerchief0"
	item_state = "bluekerchief0"
	usedstate = "bluekerchief1"
	unusedstate = "bluekerchief0"
	partscovered = FACE
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL
/obj/item/clothing/mask/shemagh/yellowkerchief
	name = "黄色头巾"
	desc = "一块轻质布料,围在脖子上。"
	icon_state = "yellowkerchief0"
	item_state = "yellowkerchief0"
	usedstate = "yellowkerchief1"
	unusedstate = "yellowkerchief0"
	partscovered = FACE
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/shemagh/greykerchief
	name = "灰色头巾"
	desc = "一块轻质布料,围在脖子上。"
	icon_state = "greykerchief0"
	item_state = "greykerchief0"
	usedstate = "greykerchief1"
	unusedstate = "greykerchief0"
	partscovered = FACE
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/shemagh/update_icon()
	if (toggled == FALSE)
		body_parts_covered = 0
		flags_inv = 0
		icon_state = unusedstate
		item_state = unusedstate
		heat_protection = 0
	else
		body_parts_covered = partscovered
		flags_inv = HIDEFACE
		icon_state = usedstate
		item_state = usedstate
		heat_protection = HEAD|FACE|EYES
	..()

/obj/item/clothing/mask/shemagh/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle"
	if (toggled == TRUE)
		icon_state = unusedstate
		item_state = unusedstate
		body_parts_covered = 0
		flags_inv = 0
		to_chat(usr, "<span class = 'danger'>你调整了[name]。</span>")
		update_icon()
		toggled = FALSE
		usr.update_inv_wear_mask(1)
		return
	else if (toggled == FALSE)
		icon_state = usedstate
		item_state = usedstate
		body_parts_covered = partscovered
		flags_inv = HIDEFACE
		to_chat(usr, "<span class = 'danger'>你调整了[name]。</span>")
		update_icon()
		toggled = TRUE
		usr.update_inv_wear_mask(1)
		return

/*Miscallaneous*/

	/* Asian Uniforms*/

/obj/item/clothing/under/kimono
	name = "白色和服"
	desc = "一件流行的亚洲风格素色和服,内衬简约内衣。" //skipping the notion that its skintight.
	icon_state = "kimono"
	item_state = "kimono"

	/* Asian Uniforms - End*/

/obj/item/clothing/under/towel  //this was incorrectly reported as a exterior suit, it is actually a interior uniform
	name = "白色毛巾"
	desc = "一条简单的毛巾,可以裹在身上。"
	icon_state = "towel"
	item_state = "towel"
	heat_protection = LOWER_TORSO

/obj/item/clothing/head/helmet/anax/aries //op fantasy helm
	name = "白羊座头盔"
	desc = "一顶加固的青铜希腊头盔,覆盖大部分面部,顶部有红色羽饰。由战神阿瑞斯等毁灭之神与化身佩戴。"
	icon_state = "aries"
	item_state = "aries"
	armor = list(melee = 70, arrow = 60, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/head/helmet/anax/athena
	name = "雅典娜头盔"
	desc = "一顶加固的青铜希腊头盔,覆盖大部分面部,顶部有蓝色羽饰和金色桂冠。战术战争与智慧女神雅典娜本人的选定头盔。"
	icon_state = "athena"
	item_state = "athena"
	armor = list(melee = 70, arrow = 60, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/head/helmet/asterix/apollo
	name = "显眼的盖尔头盔"
	desc = "太阳与光明之神的金色带翼头盔,同时也是奥林匹斯的信使。佩戴者感到精力充沛,行动迅速"
	icon_state = "apollo"
	item_state = "apollo"
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40
	slowdown = -0.25 //actually reduces your slowdown

/obj/item/clothing/head/helmet/asterix/conspicious //R.I.P Albert Uzdero / René Goscinny respectively.
	name = "显眼的盖尔头盔"
	desc = "一顶难以忽视的带翼头盔,带有黑白饰边和适度的红色领带,常由酋长佩戴。"
	icon_state = "vitalstatistix"
	item_state = "vitalstatistix"
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40

/obj/item/clothing/head/helmet/egyptian/anubis
	name = "青铜阿努比斯头饰"
	desc = "一件青铜埃及头饰,带有死神阿努比斯的面容。"
	icon_state = "anubis"
	item_state = "anubis"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 60, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/head/helmet/egyptian/osiris
	name = "青铜奥西里斯头饰"
	desc = "一件青铜埃及头饰,带有冥界之神奥西里斯的面容。"
	icon_state = "osiris"
	item_state = "osiris"
	flags_inv = BLOCKHAIR
	armor = list(melee = 70, arrow = 60, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60

/obj/item/clothing/head/atef
	name = "阿特夫王冠"
	desc = "一顶由布料制成的白色埃及王冠,饰有羽毛。埃及神明偏爱的王冠。"
	icon_state = "deshret"
	item_state = "deshret"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD|FACE|EYES

/obj/item/clothing/mask/anubis
	name = "阿努比斯面具"
	desc = "一个青铜面具,形似埃及死神阿努比斯。"
	icon_state = "anubis"
	item_state = "anubis"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 15, arrow = 15, gun = FALSE, energy = 15, bomb = 45, bio = FALSE, rad = FALSE) //modest, weaker than japanese facemask
	blocks_scope = TRUE
	restricts_view = 1
	heat_protection = FACE|EYES
	flags = CONDUCT

/obj/item/clothing/under/mummywappings
	name = "亚麻裹布"
	icon = 'icons/mob/uniform.dmi'
	icon_state = "mummy"
	item_state = "mummy"
	canremove = FALSE
	desc = "当你检查这些发霉的裹布时,它们似乎正在瓦解。"

/obj/item/clothing/mask/necklace/christian/gold
	name = "基督教金项链"
	desc = "一条带有基督教十字架的金项链。由黄金制成。看起来很昂贵。"
	icon_state = "necklace_christian_gold"
	item_state = "necklace_christian_gold"

/obj/item/clothing/mask/osiris
	name = "奥西里斯面具"
	desc = "一个面具,形似埃及冥界之神奥西里斯。"
	icon_state = "osiris"
	item_state = "osiris"
	flags_inv = HIDEFACE
	flags = CONDUCT
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 15, arrow = 15, gun = FALSE, energy = 15, bomb = 45, bio = FALSE, rad = FALSE)
	blocks_scope = TRUE
	restricts_view = 1
	heat_protection = FACE|EYES

/obj/item/clothing/mask/stone
	name = "石面具"
	desc = "一个具有男性外观和獠牙的石面具。"
	icon_state = "stone_mask"
	item_state = "stone_mask"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 5, arrow = 10, gun = FALSE, energy = 12, bomb = 45, bio = FALSE, rad = FALSE) //modest, weaker than japanese facemask
	blocks_scope = TRUE
	restricts_view = 1
	heat_protection = FACE|EYES

/obj/item/clothing/mask/stone_jewelled
	name = "镶宝石石面具"
	desc = "一个镶有宝石的石面具,可能是某种荣誉服饰?"
	icon_state = "stone_mask_jeweled"
	item_state = "stone_mask_jeweled"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 20, arrow = 20, gun = FALSE, energy = 8, bomb = 67, bio = FALSE, rad = FALSE) //modest, weaker than japanese facemask
	blocks_scope = TRUE
	restricts_view = 1
	heat_protection = FACE|EYES

/obj/item/clothing/suit/armor/god_pharoah //copied broadly from /obj/item/clothing/suit/armor/sauronarmor
	name = "神明法老盔甲"
	desc = "沙漠神圣诸神的盔甲"
	icon_state = "settra"
	item_state = "settra"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 95, arrow = 90, gun = 30, energy = 20, bomb = 70, bio = 20, rad = 45)
	value = 70
	slowdown = 1
	health = 90
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS

/obj/item/clothing/head/helmet/yellow_ninja
	name = "黄色忍者头带"
	desc = "一条日式设计的装甲皮革头带,佩戴它让你感觉更快,并有一种奔跑时把手臂甩在身后的冲动。"
	icon_state = "yellow_ninja"
	item_state = "yellow_ninja"
	body_parts_covered = HEAD
	armor = list(melee = 30, arrow = 40, gun = FALSE, energy = 15, bomb = 25, bio = 20, rad = FALSE)
	health = 30
	slowdown = -0.40