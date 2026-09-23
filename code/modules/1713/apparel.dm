/obj/item/clothing/under
	var/swapped = FALSE

/obj/item/clothing/under/chad
	name = "猛男服装"
	desc = "哇!"
	icon_state = "chad"
	item_state = "chad"

/obj/item/clothing/shoes/chad
	name = "猛男鞋"
	desc = "哎哟!"
	icon_state = "chad"
	item_state = "chad"
	force = WEAPON_FORCE_WEAK

/obj/item/clothing/shoes/flipflops
	name = "人字拖"
	desc = "巴西风格人字拖."
	icon_state = "flipflops"
	item_state = "flipflops"
	force = WEAPON_FORCE_WEAK

/obj/item/clothing/under/squid_contestant
	name = "参赛者服装"
	desc = "参赛者的普通连体服."
	icon_state = "squid_player"
	item_state = "squid_player"

/obj/item/clothing/suit/storage/jacket/squid_coat
	name = "参赛者夹克"
	desc = "一件简单的绿色连体服夹克."
	icon_state = "squid_player"
	item_state = "squid_player"

///////////////////////////////////////////////////////////////////
/// Majority of the Sprites under this is made by Mane from TGMC///
///////////////////////////////////////////////////////////////////

// Star Wars Outfits//

/obj/item/clothing/under/bodyglove
	name = "复制人黑色紧身衣"
	desc = "士兵穿的紧身衣."
	icon_state = "replicant_bodyglove"
	item_state = "replicant_bodyglove"

/obj/item/clothing/under/redbodyglove
	name = "红色紧身衣"
	desc = "红色卫兵穿的紧身红色衣."
	icon_state = "redbodyglove"
	item_state = "redbodyglove"

/obj/item/clothing/under/bluebodyglove
	name = "蓝色紧身衣"
	desc = "议会卫兵穿的紧身蓝色衣."
	icon_state = "bluebodyglove"
	item_state = "bluebodyglove"

//////////////////Imperial Tunics and Caps///////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/under/impstormofficer
	name = "帝国冲锋队军官制服"
	desc = "一件双排扣黑色束腰上衣和长裤,配有金属胸牌标示冲锋队军团士官的军衔."
	icon_state = "imp_stormofficer"
	item_state = "imp_stormofficer"

/obj/item/clothing/under/impnavyofficer
	name = "帝国冲锋队军官制服"
	desc = "一件双排扣橄榄绿色束腰上衣和长裤,配有金属胸牌标示帝国海军军官的军衔."
	icon_state = "impofficer_captain"
	item_state = "impofficer_captain"

/obj/item/clothing/under/imptechnician
	name = "帝国技术员灰色制服"
	desc = "工程兵团技术员穿的灰色连体服."
	icon_state = "imp_technician_grey"
	item_state = "imp_technician_grey"

/obj/item/clothing/under/imptechnician2
	name = "帝国技术员蓝色制服"
	desc = "工程兵团技术员穿的蓝色连体服."
	icon_state = "imp_technician_blue"
	item_state = "imp_technician_blue"

/obj/item/clothing/under/imptechnician3
	name = "帝国技术员黑色制服"
	desc = "工程兵团技术员穿的黑色连体服."
	icon_state = "imp_technician_black"
	item_state = "imp_technician_black"

/obj/item/clothing/head/impcaptaincap
	name = "帝国海军军官帽"
	desc = "一顶紧身的绿色帽子."
	icon_state = "repofficer_navcaptain"
	item_state = "repofficer_navcaptain"

/obj/item/clothing/head/impstormcap
	name = "帝国黑色野战帽"
	desc = "一顶紧身的黑色帽子,由冲锋队军团军官、海军中尉和技术员佩戴."
	icon_state = "impofficer_stormofficer"
	item_state = "impofficer_stormofficer"

/////////////////Republic Tunics and Caps////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/under/repensignofficer
	name = "共和国海军少尉制服"
	desc = "一件双排扣蓝灰色束腰上衣和长裤,供共和国海军士官穿着."
	icon_state = "repofficer_ensign"
	item_state = "repofficer_ensign"

/obj/item/clothing/under/repmedicalofficer
	name = "共和国医疗军官制服"
	desc = "一件双排扣白灰色束腰上衣和长裤,供共和国医疗兵团士官穿着."
	icon_state = "repofficer_medical"
	item_state = "repofficer_medical"

/obj/item/clothing/under/repnavyofficer
	name = "共和国海军军官制服"
	desc = "一件双排扣橄榄绿色束腰上衣和长裤,配有金属胸牌标示共和国海军军官的军衔."
	icon_state = "repofficer_navcaptain"
	item_state = "repofficer_navcaptain"

/obj/item/clothing/head/repcaptaincap
	name = "共和国海军军官帽"
	desc = "一顶紧身的绿色帽子."
	icon_state = "repnavalcaptain_cap"
	item_state = "repnavalcaptain_cap"

/obj/item/clothing/head/repensigncap
	name = "共和国海军少尉帽"
	desc = "一顶紧身的蓝灰色帽子."
	icon_state = "repensign_cap"
	item_state = "repensign_cap"

/obj/item/clothing/head/repmedicalcap
	name = "共和国医疗军官帽"
	desc = "一顶紧身的灰色帽子."
	icon_state = "repmedicalofficer_cap"
	item_state = "repmedicalofficer_cap"

/obj/item/clothing/head/impofficercap
	name = "帝国军官帽"
	desc = "一顶紧身的灰色帽子."
	icon_state = "impofficer_stormofficer"
	item_state = "impofficer_stormofficer"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/shoes/replicantshoes
	name = "塑钢靴"
	desc = "一双塑钢靴."
	icon_state = "white"
	item_state = "white"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 45, arrow = 70, gun = 50, energy = 45, bomb = 35, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 35

/obj/item/clothing/shoes/redguardshoes
	name = "红色塑钢靴"
	desc = "一双红色塑钢靴."
	icon_state = "redboots"
	item_state = "redboots"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 55, arrow = 70, gun = 60, energy = 65, bomb = 35, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 40

/obj/item/clothing/shoes/senateguardshoes
	name = "蓝色塑钢靴"
	desc = "一双蓝色塑钢靴."
	icon_state = "senateboots"
	item_state = "senateboots"
	body_parts_covered = FEET
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 55, arrow = 70, gun = 60, energy = 65, bomb = 35, bio = 15, rad = FALSE)
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 40

/obj/item/clothing/gloves/replicantgloves
	name = "塑钢手套"
	desc = "一双塑钢手套."
	icon_state = "replicant_gloves"
	item_state = "replicant_gloves"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 45, arrow = 50, gun = 50, energy = 45, bomb = 35, bio = 15, rad = FALSE)
	cold_protection = HANDS
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	slowdown = 0.1
	health = 40

/obj/item/clothing/gloves/veryblack
	name = "深黑色手套"
	desc = "一双虚空黑色手套."
	icon_state = "veryblack"
	item_state = "veryblack"
	body_parts_covered = HANDS
	force = WEAPON_FORCE_PAINFUL
	armor = list(melee = 10, arrow = 5, gun = 5, energy = 2, bomb = 5, bio = 5, rad = FALSE)
	cold_protection = HANDS
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
	health = 40

// PLASTOID ARMOR

/obj/item/clothing/suit/armor/replicant
	name = "复制人士兵护甲"
	desc = "一件厚重且昂贵的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "replicant_armor"
	item_state = "replicant_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 90, gun = 75, energy = 55, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/redguard
	name = "红袍卫队护甲"
	desc = "一件厚重且极其昂贵的塑钢护甲,附有一件深红色的长袍。"
	icon_state = "redguard"
	item_state = "redguard"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 75, arrow = 90, gun = 95, energy = 75, bomb = 100, bio = 20, rad = FALSE)
	value = 70
	slowdown = 0.9
	health = 60

/obj/item/clothing/suit/armor/senateguard
	name = "议长卫队护甲"
	desc = "一件厚重且极其昂贵的塑钢护甲,附有一件宝蓝色的长袍。"
	icon_state = "senateguard"
	item_state = "senateguard"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 75, arrow = 90, gun = 95, energy = 75, bomb = 100, bio = 20, rad = FALSE)
	value = 70
	slowdown = 0.9
	health = 60

/obj/item/clothing/suit/armor/replicant/pilot
	name = "复制人飞行员护甲"
	desc = "一件轻薄且昂贵的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "reppilot_armor"
	item_state = "reppilot_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 25, arrow = 50, gun = 55, energy = 40, bomb = 50, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/mp
	name = "复制人宪兵护甲"
	desc = "一件极其厚重且昂贵的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "repmp_armor"
	item_state = "repmp_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 25, arrow = 50, gun = 55, energy = 40, bomb = 50, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/sgt
	name = "复制人中士护甲"
	desc = "一件厚重且昂贵的带有绿色标记的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "repsgt_armor"
	item_state = "repsgt_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 90, gun = 75, energy = 45, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/reinforced
	name = "复制人强化护甲"
	desc = "一件厚重且昂贵的带有防爆板的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "repreinforced"
	item_state = "repreinforced"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 90, gun = 80, energy = 47, bomb = 80, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/lieutenant
	name = "复制人中尉护甲"
	desc = "一件厚重且昂贵的带有蓝色标记的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "replieutenant_armor"
	item_state = "replieutenant_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 90, gun = 75, energy = 45, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/commando
	name = "复制人突击队护甲"
	desc = "一件厚重且极其昂贵的塑钢护甲,覆盖了胸部的大部分。"
	icon_state = "repcommando"
	item_state = "repcommando"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 55, arrow = 95, gun = 85, energy = 55, bomb = 60, bio = 10, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/captain
	name = "复制人上尉护甲"
	desc = "一件厚重且昂贵的带有红色标记的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "repcaptain_armor"
	item_state = "repcaptain_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 90, gun = 75, energy = 45, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/replicant/commander
	name = "复制人指挥官护甲"
	desc = "一件厚重且昂贵的带有金色标记的塑钢护甲,覆盖了身体的大部分。"
	icon_state = "repcommander_armor"
	item_state = "repcommander_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 55, arrow = 95, gun = 85, energy = 45, bomb = 60, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 60

/obj/item/clothing/suit/armor/stormtrooper
	name = "标准风暴兵护甲"
	desc = "一件厚重且昂贵的帝国塑钢护甲,覆盖了身体的大部分。"
	icon_state = "stormtrooper_armor"
	item_state = "stormtrooper_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 96, gun = 88, energy = 50, bomb = 50, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.5
	health = 75

/obj/item/clothing/suit/armor/stormsurgeon
	name = "风暴军医护甲"
	desc = "一件厚重且昂贵的带有薄荷绿点缀的帝国风暴军医塑钢护甲,覆盖了身体的大部分。"
	icon_state = "stormsurgeon_armor"
	item_state = "stormsurgeon_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 45, arrow = 86, gun = 68, energy = 40, bomb = 40, bio = 20, rad = FALSE)
	value = 50
	slowdown = 1.2
	health = 75

/obj/item/clothing/suit/armor/stormradio
	name = "轻型风暴兵护甲"
	desc = "一件轻薄且不合标准的帝国风暴兵塑钢护甲,移除了部分甲片以增加机动性,覆盖了身体的一部分。"
	icon_state = "stormradio_armor"
	item_state = "stormradio_armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 35, arrow = 66, gun = 58, energy = 35, bomb = 25, bio = 20, rad = FALSE)
	value = 50
	slowdown = 0.85
	health = 57

// HELMETS

/obj/item/clothing/head/helmet/redguard
	name = "帝国红袍卫队头盔"
	desc = "一顶额外银河帝国红袍卫队的强化塑钢头盔。"
	icon_state = "redguard"
	item_state = "redguard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 80, gun = 85, energy = 65, bomb = 40, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/senateguard
	name = "帝国议长卫队头盔"
	desc = "一顶额外银河帝国议长卫队的强化塑钢头盔。"
	icon_state = "senateguard"
	item_state = "senateguard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 80, gun = 85, energy = 65, bomb = 40, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/ARF
	name = "第一阶段复制人ARF头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "repARF_helmet"
	item_state = "repARF_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 45, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/airborne
	name = "第一阶段复制人空降兵头盔"
	desc = "一顶共和国军的强化空降头盔。"
	icon_state = "repairborne_helmet"
	item_state = "repairborne_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 50, gun = 35, energy = 55, bomb = 40, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/stormtrooper
	name = "风暴兵头盔"
	desc = "一顶帝国风暴军团的强化头盔。"
	icon_state = "repstormtrooper_helmet"
	item_state = "repstormtrooper_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 60, gun = 65, energy = 50, bomb = 30, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/stormsurgeon
	name = "风暴军医头盔"
	desc = "一顶帝国医疗军团的强化头盔。"
	icon_state = "stormsurgeon_helmet"
	item_state = "stormsurgeon_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 60, gun = 65, energy = 50, bomb = 30, bio = 30, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/stormradio
	name = "风暴兵无线电技术员头盔"
	desc = "一顶帝国风暴军团的强化头盔。"
	icon_state = "stormradio_helmet"
	item_state = "stormradio_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 55, energy = 50, bomb = 20, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant
	name = "第一阶段复制人士兵头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "replicant_helmet"
	item_state = "replicant_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 50, bomb = 30, bio = 20, rad = FALSE)
	flash_protection = FLASH_PROTECTION_MODERATE
	var/ear_safety = 2
/obj/item/clothing/head/helmet/replicant/atrt
	name = "AT-RT复制人驾驶员头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "replicant_atrt"
	item_state = "replicant_atrt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 45, gun = 45, energy = 45, bomb = 50, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/radio
	name = "第一阶段复制人无线电技术员头盔"
	desc = "一顶共和国军的强化塑钢无线电技术员头盔。"
	icon_state = "replicant_radiotech"
	item_state = "replicant_radiotech"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 50, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/engi
	name = "复制人工兵头盔"
	desc = "一顶共和国军的强化塑钢工兵头盔。"
	icon_state = "replicant_engi"
	item_state = "replicant_engi"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 50, bomb = 40, bio = 40, rad = 35)


/obj/item/clothing/head/helmet/replicant2
	name = "第二阶段复制人士兵头盔"
	desc = "一顶共和国军克隆人士兵使用的第二阶段头盔。"
	icon_state = "replicant_helmet2"
	item_state = "replicant_helmet2"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 60, gun = 40, energy = 58, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/commando
	name = "复制人突击队头盔"
	desc = "一顶共和国军克隆人突击队使用的塑钢头盔。"
	icon_state = "replicant_commando"
	item_state = "replicant_commando"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 65, gun = 45, energy = 60, bomb = 30, bio = 25, rad = FALSE)

/obj/item/clothing/head/helmet/replicant2/blizzard
	name = "第二阶段复制人士兵头盔"
	desc = "一顶共和国军克隆人士兵使用的带有暴风雪防护甲片的第二阶段头盔。"
	icon_state = "replicant_blizzard"
	item_state = "replicant_blizzard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 60, gun = 40, energy = 58, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant2501st
	name = "第二阶段501st复制人士兵头盔"
	desc = "一顶共和国军克隆人士兵使用的第二阶段501st头盔。"
	icon_state = "replicant_helmet2"
	item_state = "replicant_helmet2"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 60, gun = 40, energy = 58, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/pilot
	name = "第一阶段复制人飞行员头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "reppilot_helmet"
	item_state = "reppilot_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 55, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/MP
	name = "第一阶段复制人宪兵头盔"
	desc = "一顶共和国军的高度强化塑钢头盔。"
	icon_state = "repmp_helmet"
	item_state = "repmp_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 45, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/sgt
	name = "第一阶段复制人中士头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "repsgt_helmet"
	item_state = "repsgt_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 55, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/lt
	name = "第一阶段复制人中尉头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "replt_helmet"
	item_state = "replt_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 55, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/captain
	name = "第一阶段复制人上尉头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "repcaptain_helmet"
	item_state = "repcaptain_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 55, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/replicant/commander
	name = "第一阶段复制人指挥官头盔"
	desc = "一顶共和国军的强化塑钢头盔。"
	icon_state = "repcommander_helmet"
	item_state = "repcommander_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 55, bomb = 30, bio = 20, rad = FALSE)

// OFFICER UNIFORMS //

/obj/item/clothing/under/navalcaptain
	name = "共和国海军上尉制服"
	desc = "一件合身的上尉夹克。"
	icon_state = "repcaptain_uniform"
	item_state = "repcaptain_uniform"

/obj/item/clothing/under/navalensign
	name = "共和国海军少尉制服"
	desc = "一件合身的少尉夹克。"
	icon_state = "repensign_uniform"
	item_state = "repensign_uniform"

/obj/item/clothing/under/navalsurgeon
	name = "共和国医疗官制服"
	desc = "一件合身的医疗夹克。"
	icon_state = "repmedical_uniform"
	item_state = "repmedical_uniform"

/obj/item/clothing/under/dartharmor
	name = "黑色赛博格装甲"
	desc = "为无魂者打造的深色机械装甲。"
	icon_state = "darth_armor"
	item_state = "darth_armor"

/obj/item/clothing/under/navallieutenant
	name = "帝国海军中尉制服"
	desc = "一件合身的中尉夹克。"
	icon_state = "imp_stormofficer"
	item_state = "imp_stormofficer"

////////////IRISH BERET/////////////////////////////////////////////////////////////

/obj/item/clothing/head/caubeen
	name = "爱尔兰软帽"
	desc = "一顶爱尔兰贝雷帽,通常为深绿色。"
	icon_state = "caubeen"
	item_state = "caubeen"


////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/under/wise_tutor
	name = "智者导师套装"
	desc = "由睿智且经验丰富者穿着的宽松套装。"
	icon_state = "wise_tutor"
	item_state = "wise_tutor"

/obj/item/clothing/under/wise_tutor2
	name = "智者导师备用套装"
	desc = "由睿智且经验丰富者穿着的宽松套装。"
	icon_state = "wise_tutor2"
	item_state = "wise_tutor2"

/obj/item/clothing/under/wise_disciple
	name = "智者弟子套装"
	desc = "由不智且缺乏经验者穿着的宽松套装。"
	icon_state = "wise_tutor3"
	item_state = "wise_tutor3"

/obj/item/clothing/under/arrogant_student
	name = "傲慢学生套装"
	desc = "由傲慢学生穿着的宽松套装。"
	icon_state = "arrogant_student"
	item_state = "arrogant_student"

/obj/item/clothing/suit/storage/coat/wise_tutor_robes
	name = "智者导师长袍"
	desc = "智者导师常穿的长袍。"
	icon_state = "wise_tutor_robe"
	item_state = "wise_tutor_robe"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/suit/storage/coat/wise_tutor_robes/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"
	if (hood)
		icon_state = "wise_tutor_robe"
		item_state = "wise_tutor_robe"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
		item_state_slots["slot_wear_suit"] = "wise_tutor_robe"
		to_chat(usr, "<span class = 'danger'>你脱下长袍的兜帽。</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return
	else if (!hood)
		icon_state = "wise_tutor_hooded"
		item_state = "wise_tutor_hooded"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT|HEAD
		item_state_slots["slot_wear_suit"] = "wise_tutor_hooded"
		to_chat(usr, "<span class = 'danger'>你用长袍的兜帽遮住头部。</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return

/obj/item/clothing/suit/storage/coat/arrogant_student_robes
	name = "傲慢学生长袍"
	desc = "怨愤学生常穿的长袍。"
	icon_state = "arrogant_student_robe"
	item_state = "arrogant_student_robe"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/suit/storage/coat/arrogant_student_robes/verb/toggle_hood()
	set category = null
	set src in usr
	set name = "Toggle Hood"
	if (hood)
		icon_state = "arrogant_student_robe"
		item_state = "arrogant_student_robe"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
		item_state_slots["slot_wear_suit"] = "arrogant_student_robe"
		to_chat(usr, "<span class = 'danger'>你脱下长袍的兜帽。</span>")
		update_icon()
		hood = FALSE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return
	else if (!hood)
		icon_state = "arrogant_student_robe_hooded"
		item_state = "arrogant_student_robe_hooded"
		body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT|HEAD
		item_state_slots["slot_wear_suit"] = "arrogant_student_robe_hooded"
		to_chat(usr, "<span class = 'danger'>你用长袍的兜帽遮住头部。</span>")
		update_icon()
		hood = TRUE
		usr.update_inv_head(1)
		usr.update_inv_wear_suit(1)
		return

/obj/item/clothing/shoes/heavyboots/wrappedboots
	name = "\improper 裹腿靴"
	icon_state = "wrappedboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 10, gun = FALSE, energy = 25, bomb = 50, bio = 10, rad = 40)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/storage/hazard
	name = "高能见度背心"
	desc = "用于高能见度和反光性的背心。"
	icon_state = "hazard"
	item_state = "hazard"

/obj/item/clothing/suit/storage/hazard/blue
	name = "蓝色高能见度背心"
	desc = "用于高能见度和反光性的背心。"
	icon_state = "hazard_b"
	item_state = "hazard_b"

/obj/item/clothing/suit/storage/hazard/yellow
	name = "黄色高能见度背心"
	desc = "用于高能见度和反光性的背心。"
	icon_state = "hazard_y"
	item_state = "hazard_y"
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/suit/storage/hazard/green
	name = "绿色高能见度背心"
	desc = "用于高能见度和反光性的背心。"
	icon_state = "hazard_g"
	item_state = "hazard_g"

/obj/item/clothing/suit/storage/sealvest
	name = "海豹救生衣"
	desc = "用于在训练等活动中让海豹突击队员保持漂浮的背心。"
	icon_state = "sealvest"
	item_state = "sealvest"


/////////////////REBELS///////////////////////////////////////////
/obj/item/clothing/head/helmet/rebel
	name = "叛军舰队士兵头盔"
	desc = "反抗军联盟的强化塑料头盔。"
	icon_state = "rebel_helmet1"
	item_state = "rebel_helmet1"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 50, gun = 40, energy = 45, bomb = 30, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/rebel/New()
	..()
	icon_state = "rebel_helmet[rand(1,2)]"
	update_icon()

/obj/item/clothing/under/rebel
	name = "叛军士兵制服"
	desc = "反抗军联盟士兵穿着的朴素制服。"
	icon_state = "rebel1"
	item_state = "rebel1"

/obj/item/clothing/under/rebel/New()
	..()
	icon_state = "rebel[rand(1,2)]"
	update_icon()

/obj/item/clothing/under/rebel/officer
	name = "叛军军官制服"
	desc = "反抗军联盟军官穿着的朴素制服。"
	icon_state = "rebel_officer"
	item_state = "rebel_officer"

/obj/item/clothing/under/rebel/officer/New()
	icon_state = "rebel_officer"
	item_state = "rebel_officer"

/obj/item/clothing/suit/storage/jacket/rebel_vest
	name = "黑色背心"
	desc = "一件简单的黑色背心。"
	icon_state = "rebel_vest"
	item_state = "rebel_vest"

/obj/item/clothing/suit/storage/jacket/rebel_vest/officer
	name = "叛军军官背心"
	desc = "反抗军联盟军官穿着的卡其色和橙色背心。"
	icon_state = "rebel_officer_vest"
	item_state = "rebel_officer_vest"
