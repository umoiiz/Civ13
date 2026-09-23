/* Created by @FantasticFwoosh for extra-racial tribes mode content or surreal fantasy content.
All eras are accepted, preferably store them in relevant sections with appropriate typepaths, index is sorted as of time of writing.*/

/*Index*/
/*	* - 1. Stone Age Tribes & Content (Others)
	* - 2. Classical Era Tribes & Content (Crabs)
	* - 3. Medieval Era Tribes & Content (Orcs)
	* - 3a. Sauron & Orc Cultural Clothes
	* - 3b. Other Orc Clothes & Accessories
	* - 3c. Orc Weapons
	* - 4. Imperial Era Tribes & Content (Humans)
	* - 5. Other Fantasy Objects
	* - 5a. Other Fantasy Clothing
	* - 5b. Fantasy Materials*/


/* - 1. Stone Age Tribes & Content (Wolfmen, Gorillas, Ants, Lizards)*/

/obj/item/clothing/mask/chitinmask
	name = "甲壳面具"
	desc = "一个由昆虫甲壳制成的面具."
	icon_state = "chitin_mask"
	item_state = "chitin_mask"
	body_parts_covered = FACE|EYES
	armor = list(melee = 19, arrow = 9, gun = 0, energy = 0, bomb = 12, bio = 0, rad = FALSE)

/obj/item/clothing/head/helmet/chitin // name and description fixed & tidied up.
	name = "甲壳头盔"
	desc = "一个由昆虫甲壳制成的头盔."
	icon_state = "chitin_helmet"
	item_state = "chitin_helmet"
	armor = list(melee = 30, arrow = 19, gun = 12, energy = 18, bomb = 18, bio = 19, rad = FALSE)

/obj/item/clothing/suit/armor/chitin
	name = "甲壳胸甲"
	desc = "一个甲壳胸甲,由昆虫特别制作而成."
	icon_state = "chitin_armor"
	item_state = "chitin_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 15, gun = 5, energy = 15, bomb = 25, bio = 0, rad = FALSE) //weaker than bronze, stronger than bone.
	slowdown = 0.90
	health = 30

/* - 2. Classical Era Tribes & Content (Crabs)*/

/* - 3. Medieval Era Tribes & Content (Orcs)*/
	/* - 3a. Sauron & Orc Cultural Clothes*/

/obj/item/clothing/head/helmet/sauronhelm
	name = "索伦的头盔"
	desc = "索伦盔甲的头盔"
	icon_state = "sauronhelmet"
	item_state = "sauronhelmet"
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 80, arrow = 90, gun = 30, energy = 20, bomb = 70, bio = 20, rad = 45)
	value = 70
	slowdown = 1
	health = 90

/obj/item/clothing/suit/armor/sauronarmor
	name = "索伦的盔甲"
	desc = "索伦的盔甲"
	icon_state = "sauronarmor"
	item_state = "sauronarmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 95, arrow = 90, gun = 30, energy = 20, bomb = 70, bio = 20, rad = 45)
	value = 70
	slowdown = 1
	health = 90

/obj/item/clothing/suit/armor/darkplate
	name = "板甲"
	desc = "一件廉价的暗铁盔甲."
	icon_state = "ork_plate_elite"
	item_state = "ork_plate_elite"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 70, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = 45)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/darkplateelite
	name = "板甲"
	desc = "一件廉价的暗铁盔甲."
	icon_state = "ork_plate_commander"
	item_state = "ork_plate_commander"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 80, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = 45)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/head/helmet/orc_beserker
	name = "兽人狂战士头盔"
	desc = "兽人做好头盔!"
	icon_state = "beserkerhelmet"
	item_state = "beserkerhelmet"
	body_parts_covered = HEAD|FACE|EYES
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 70, arrow = 80, gun = FALSE, energy = FALSE, bomb = 50, bio = 20, rad = 10)

/obj/item/clothing/head/helmet/eliteorc
	name = "铁头盔"
	desc = "一顶带有前板的头盔,由暗铁制成."
	icon_state = "ork_elite_helmet_2"
	item_state = "ork_elite_helmet_2"
	body_parts_covered = HEAD|FACE|EYES
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 80, arrow = 90, gun = FALSE, energy = FALSE, bomb = 50, bio = 20, rad = 10)

/obj/item/clothing/head/helmet/eliteorc2
	name = "铁头盔"
	desc = "一顶由暗铁制成的头盔."
	icon_state = "ork_elite_helmet"
	item_state = "ork_elite_helmet"
	body_parts_covered = HEAD
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 70, arrow = 70, gun = FALSE, energy = FALSE, bomb = 50, bio = 20, rad = 10)

/obj/item/clothing/head/helmet/orc_spearman
	name = "兽人矛兵头盔"
	desc = "兽人做好头盔!"
	icon_state = "spearmanhelmet"
	item_state = "spearmanhelmet"
	body_parts_covered = HEAD|FACE|EYES
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/orc_captain
	name = "兽人队长头盔"
	desc = "兽人做好头盔!"
	icon_state = "captainhelmet"
	item_state = "captainhelmet"
	body_parts_covered = HEAD|FACE|EYES
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/orc_grunt
	name = "兽人步兵头盔"
	desc = "兽人做好头盔!"
	icon_state = "grunthelmet"
	item_state = "grunthelmet"
	body_parts_covered = HEAD|FACE
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)

/obj/item/clothing/suit/armor/ork_urukhai
	name = "兽人强兽人盔甲"
	desc = "兽人做好盔甲!"
	icon_state = "urukhai_armor"
	item_state = "urukhai_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, arrow = 40, gun = 8, energy = 15, bomb = 40, bio = 20, rad = 25)
	value = 50
	slowdown = 1.7
	health = 50

/obj/item/clothing/suit/armor/ork_whitehand
	name = "兽人白手盔甲"
	desc = "兽人做好盔甲!"
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "whitehand_armor"
	item_state = "whitehand_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 60, arrow = 40, gun = 8, energy = 15, bomb = 40, bio = 20, rad = 25)
	value = 50
	slowdown = 1.7
	health = 50

/obj/item/clothing/suit/armor/ork_grunt
	name = "兽人步兵盔甲"
	desc = "兽人做好盔甲!"
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "grunt_armor"
	item_state = "grunt_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 50, arrow = 35, gun = 6, energy = 10, bomb = 35, bio = 20, rad = 20)
	value = 50
	slowdown = 1.7
	health = 50

/obj/item/clothing/shoes/orc
	name = "兽人铁靴"
	desc = "一双兽人板甲靴."
	icon_state = "ork_warrior"
	item_state = "ork_warrior"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 35

/obj/item/clothing/gloves/gauntlets/orc
	name = "兽人护手"
	desc = "一双兽人盔甲护手."
	icon_state = "ork_gauntlet"
	item_state = "ork_gauntlet"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 75, arrow = 60, gun = 10, energy = 8, bomb = 25, bio = 15, rad = FALSE)
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 30

	/* - 3b. Other Orc Clothes & Accessories*/

/obj/item/clothing/mask/bossjaw
	name = "兽人凶恶老大颚饰"
	desc = "一块粗制金属,被塑造成兽人下颚的形状,在蛮兵中巩固地位,使他们显得更大."
	icon_state = "bossjaw"
	item_state = "bossjaw"
	body_parts_covered = FACE
	flags = CONDUCT
	flags_inv = 0
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 15, arrow = 5, gun = FALSE, energy = 15, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/shoes/fur/orc
	name = "兽人毛皮靴"
	desc = "由兽人皮制成的厚实毛皮靴."
	icon_state = "fur6"
	item_state = "fur6"
	specific = TRUE //uses new() from within apparel_ancient.dm

/obj/item/clothing/suit/storage/coat/fur/orc
	name = "兽人毛皮外套"
	desc = "一件厚实的深绿色毛皮外套,由恶心的兽人毛皮制成."
	icon_state = "fur_jacket6"
	item_state = "fur_jacket6"
	specific = TRUE
	colorn = 6

/obj/item/clothing/gloves/thick/leather/orc //inherits from gloves/miscellanous.dm
	desc = "这些毛皮手套寒冷且防火,由兽人皮制成."
	name = "兽人毛皮手套"
	icon_state = "orcfur"
	item_state = "orcfur"

	/* - 3c. Orc Weapons*/

/obj/item/weapon/material/sword/urukhaiscimitar
	name = "强兽人弯刀"
	desc = "一把带有弯曲刀尖的阔剑."
	icon_state = "urukhaiscimitar"
	item_state = "urukhaiscimitar"
	throw_speed = 2
	throw_range = 2
	force_divisor = 1 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 40
	cooldownw = 15
	value = 55

/* Other Fantasy Objects*/

/* Other Fantasy Clothing & Armor*/

	/* Lizardperson & lizard-reptile hide objects (not snakes)*/

/obj/item/clothing/head/lizardpelt 	//inherits from (/modules/1713/apparel_ancient.dm)
	name = "lizard pelt headcover"
	desc = "A lizard pelt turned into a headcover."
	icon_state = "lizardpelt"
	item_state = "lizardpelt"
	flags_inv = BLOCKHEADHAIR
	heat_protection = HEAD

/obj/item/clothing/under/lizardpants
	name = "无上衣蜥蜴裤"
	desc = "一条紧身的蜥蜴鳞片裤.当你如此出众时;穿衬衫只会束缚你的风格."
	icon_state = "lizard_pants"
	item_state = "lizard_pants"
	body_parts_covered = LOWER_TORSO|LEGS

/obj/item/weapon/storage/backpack/satchel/lizard_satchel 	//inherits from (weapons/storage/backpack.dm)
	name = "lizard scale satchel"
	desc = "A fashionable satchel lined with exotic lizard scales"
	icon_state = "lizard_satchel"
	base_icon = "lizard_satchel"

/obj/item/clothing/shoes/riding1/lizard_cowboy 	//inherits from (/modules/1713/apparel_industrial.dm)
	name = "lizard scale riding boots"
	desc = "lizard scale patterned boots with spurs, perfect for riding in style."
	icon_state = "lizard_cowboy"
	item_state = "lizard_cowboy"

/obj/item/clothing/shoes/lizard_ankleboots 	//same as lizard cowboy
	name = "蜥蜴鳞片短靴"
	desc = "优雅的蜥蜴鳞片及踝靴,一种时尚宣言."
	icon_state = "lizard_ankleboots"
	item_state = "lizard_ankleboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 50, arrow = 30, gun = FALSE, energy = 20, bomb = 40, bio = 10, rad = 20)
	item_flags = NOSLIP
	siemens_coefficient = 0.6

/obj/item/weapon/storage/belt/lizard_belt 	//inherits from (/items/weapons/storage/belt.dm)
	name = "lizard scale belt"
	desc = "A purely decorative lizard scale thin belt. It has no pockets or attachments for items"
	icon_state = "lizard_belt"
	item_state = "lizard_belt"
	storage_slots = 0
	max_w_class = 1
	max_storage_space = 0

/obj/item/clothing/shoes/lizard_laceup 	//inherits from (/clothing/shoes/miscellaneous.dm)
	name = "lizard scale laceup shoes"
	desc = "The height of luxurious footwear, and they're pre-polished!"
	icon_state = "lizard_laceups"

/obj/item/clothing/suit/storage/coat/ww2/biker/lizard_jacket 	//inherits from (/modules/1713/apparel_worldwars.dm)
	name = "lizard scale jacket"
	desc = "A sleek lizard scale jacket, bold and impression-setting like the people who wear it. `Too cool for S-s-s-school'."
	icon_state = "lizard_jacket"
	item_state = "lizard_jacket"
	value = 150

/obj/item/clothing/accessory/storage/coinpouch/lizard_wallet 	//inherits from (/modules/1713/apparel_imperial.dm)
	name = "lizard scale wallet"
	desc = "A exotic personal wallet decorated in lizard scale, where you can carry your coins and small objects."
	icon = 'icons/obj/storage.dmi'
	icon_state = "lizard_wallet"

/*Lizard objects -END*/

/obj/item/clothing/head/mystic
	name = "神秘兜帽"
	desc = "一件不祥的奶油色兜帽,几乎完全遮住了面部."
	icon_state = "mystic"
	item_state = "mystic"

/* Wyvern & Dragon Armor & Clothes*/

/* wip - art assets ready, incomplete polished code.

/obj/item/clothing/gloves/wyvern
	name = "wyvern gauntlets"
	desc = "A pair of gauntlets made from the scaly hide of a wyvern. The scales seem to protect the user from the heat."
	icon_state = "wyvern"
	item_state = "wyvern"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 50, arrow = 45, gun = 10, energy = 40, bomb = 50, bio = 15, rad = FALSE)
	heat_protection = HANDS
	slowdown = 0.25
	health = 30

/obj/item/clothing/gloves/wyvern/ice
	name = "ice wyvern gauntlets"
	desc = "A pair of gauntlets made from the scaly hide of a ice wyvern. The scales seem to protect the user from the cold."
	icon_state = "ice_wyvern"
	item_state = "ice_wyvern"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 50, arrow = 45, gun = 10, energy = 40, bomb = 50, bio = 15, rad = FALSE)
	cold_protection = HANDS
	slowdown = 0.25
	health = 30

/obj/item/clothing/head/helmet/wyvern
	name = "wyvern helmet"
	desc = "A scaly helmet in the form of a wailing wyvern. The scales seem to protect the user from the heat."
	icon_state = "wyvern"
	item_state = "wyvern"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 15, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	heat_protection = HEAD|FACE|EYES
	slowdown = 0.25

/obj/item/clothing/head/helmet/wyvern/ice
	name = "ice wyvern helmet"
	desc = "A scaly helmet in the form of a wailing ice wyvern. The scales seem to protect the user from the cold."
	icon_state = "ice_wyvern"
	item_state = "ice_wyvern"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 10, energy = 40, bomb = 60, bio = 30, rad = FALSE)
	health = 45
	cold_protection = HEAD|FACE|EYES
	slowdown = 0.25

/obj/item/clothing/head/helmet/dragon/green
	name = "wyvern helmet"
	desc = "A scaly helmet in the form of a roaring green dragon. The scales seem to protect the user from the heat."
	icon_state = "green_dragon"
	item_state = "green_dragon"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 70, gun = 5, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	health = 60
	heat_protection =  HEAD|FACE|EYES
	slowdown = 0.25

/obj/item/clothing/gloves/dragon/green
	name = "green dragon gauntlets"
	desc = "A pair of gauntlets made from the scaly hide of a green dragon."
	icon_state = "green_dragon"
	item_state = "green_dragon"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 65, arrow = 60, gun = 15, energy = 70, bomb = 70, bio = 30, rad = FALSE)
	heat_protection = HANDS
	slowdown = 0.50
	health = 50

wip pending sprites

/obj/item/clothing/suit/armor/wyvern
	name = "wyvern armor"
	desc = "A set of armor made out of the scaly hide of a wyvern."
	icon_state = "wyvern"
	item_state = "wyvern"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 40, gun = 10, energy = 40, bomb = 50, bio = 20, rad = FALSE) //compared agianst a iron chestplate
	slowdown = 0.8
	health = 50
	heat_protection = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/suit/armor/wyvern/ice
	name = "wyvern armor"
	desc = "A set of armor made out of the scaly hide of a wyvern."
	icon_state = "wyvern"
	item_state = "wyvern"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 40, gun = 10, energy = 40, bomb = 50, bio = 20, rad = FALSE) //compared agianst a iron chestplate
	slowdown = 0.8
	health = 50
	cold_protection = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/suit/armor/dragon/green
	name = "green dragon armor"
	desc = "A set of armor made out of the scaly hide of a green dragon. Its thick plates cover the entire body suprisingly without being rigid and cumbersome."
	icon_state = "green_dragon"
	item_state = "green_dragon"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 90, gun = 10, energy = 15, bomb = 60, bio = 20, rad = FALSE) // plated armor for comparison
	value = 500
	slowdown = 1.0
	health = 60
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS*/

/* Grimdark Future Fantasy Clothes */

/obj/item/clothing/suit/storage/jacket/imperial/commissar
	name = "政委夹克"
	desc = "一件红色夹克,属于狂热的大型步兵中队领袖.这赋予的权威意味着拒绝命令是绝对不可接受的..."
	icon_state = "commissar"
	icon_state = "commissar"
	icon_state = "commissar"

/obj/item/clothing/suit/armor/imperial/arbites
	name = "仲裁庭护甲"
	desc = "一件厚重、威严的红色护甲,配有加固的钢制护腿和肩甲,覆盖了身体的大部分.试图袭击仲裁庭执法者的徒劳尝试会发现反抗是毫无结果的."
	icon_state = "arbit"
	item_state = "arbit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 85, arrow = 90, gun = 35, energy = 65, bomb = 70, bio = 20, rad = FALSE) //better more futuristic stats than platemail.
	value = 100
	slowdown = 1.2 //less slowdown than platemail
	health = 60

/obj/item/clothing/suit/storage/jacket/inquisition
	name = "审判官夹克"
	desc = "一件带有红色臂章的黑色夹克,属于专精于调查阴谋与异端的专家调查员.不惜一切代价..."
	icon_state = "commissar"
	icon_state = "commissar"
	icon_state = "commissar"

/obj/item/clothing/suit/storage/jacket/inquisition/alt
	name = "审判官轻便夹克"
	desc = "一件黑色轻便夹克,属于专精于调查阴谋与异端的专家调查员.不惜一切代价..."
	icon_state = "inquistor_alt"
	icon_state = "inquistor_alt"
	icon_state = "inquistor_alt"

/obj/item/clothing/suit/storage/jacket/inquisition/alt/hood
	name = "审判官夹克"
	icon_state = "inqcape_alt"
	icon_state = "inqcape_alt"
	icon_state = "inqcape_alt"
	flags_inv = BLOCKHAIR|HIDEFACE

/obj/item/clothing/suit/storage/jacket/elf/warlock
	name = "精灵术士长袍"
	desc = "一件由精灵种族的神秘领袖穿着的长袍."
	icon_state = "elf_warlock"
	icon_state = "elf_warlock"
	icon_state = "elf_warlock"

/obj/item/clothing/suit/storage/jacket/elf/harlequin
	name = "精灵丑角夹克"
	desc = "一件华丽花哨的夹克,由带有戏剧主题的致命精灵刺客巡回剧团穿着."
	icon_state = "elf_harlequin"
	icon_state = "elf_harlequin"
	icon_state = "elf_harlequin"

/obj/item/clothing/mask/elf/solitaire
	name = "独行者面具"
	desc = "一副令人难忘的轮廓分明、雌雄莫辨的面具.常由只单独行动的精英精灵刺客佩戴."
	icon_state = "solitaire"
	item_state = "solitaire"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 20, arrow = 15, gun = 5, energy = 15, bomb = 55, bio = 20, rad = FALSE) //equal to japanese face mask.

	/* - 5b. Fantasy Materials*/

// etc magic crystals, special monster parts