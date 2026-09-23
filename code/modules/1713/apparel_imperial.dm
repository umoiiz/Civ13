/*Index*/
/*   * 1 - Colonial Suits
     * 1a - Colonial Armor
     * 2 - Colonial Uniforms
     * 3 - Colonial Hats
     * 3a - Colonial Helmets
     * 4 - Colonial Boots
     * 5 - Colonial Accessories & Items
     * 6 - Colonial Pirate Clothing
     ///////////////////////////////////
     * 7 - Colonial Infantry & Sailor Clothes
     * 7a - Colonial Infantry & Sailor Boots
     * 7b - Colonial British Army & Navy Clothes
     * 7c - Colonial Portuguese Army & Navy Clothes
     * 7d - Colonial Spanish Army & Navy Clothes
     * 7e - Colonial French Army & Navy Clothes
     * 7f - Colonial Dutch Army & Navy Clothes
     ///////////////////////////////////
     * 8 - Colonial Army Clothes
     * 8a - Colonial Army Uniforms
     * 8b - Colonial Army Jackets
     ///////////////////////////////////
     * 9 - Napoleonic Clothing
     * 9a - Napoleonic Army Clothing
     * 9b - Napoleonic Armor
     ////////////////////////////////
     * 10 - Miscallaneous*/

/* Colonial Suits*/

//pending, due to recently rebased content.

	/* Colonial Armor*/

/obj/item/clothing/suit/armor/imperial/imperial_chestplate
	name = "帝国胸甲"
	desc = "一件帝国风格的铁制胸甲,它不能完全抵挡子弹,但能提供更多机动性来躲避子弹."
	icon_state = "imperial_breastplate"
	item_state = "imperial_breastplate"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 50, gun = 12, energy = 15, bomb = 40, bio = 20, rad = 0)
	value = 20
	slowdown = 0.4
	health = 50


/* Colonial Uniforms*/

/obj/item/clothing/under/civ4
	name = "华丽殖民时期服装"
	desc = "一套由优质白色亚麻衬衫和黑色长裤组成的服装."
	icon_state = "civuni4"
	item_state = "civuni4"

/obj/item/clothing/under/civ1
	name = "蓝色殖民时期服装"
	desc = "一套由浅蓝色亚麻衬衫和短裤组成的服装."
	icon_state = "civuni1"
	item_state = "civuni1"

/obj/item/clothing/under/civ2
	name = "白色殖民时期服装"
	desc = "一套由白色亚麻衬衫和黑色长裤组成的服装."
	icon_state = "civuni2"
	item_state = "civuni2"

/obj/item/clothing/under/civ3
	name = "短袖殖民时期服装"
	desc = "一套由浅白色短袖亚麻衬衫和黑色长裤组成的服装."
	icon_state = "civuni3"
	item_state = "civuni3"

/obj/item/clothing/under/civ5
	name = "绿色殖民时期服装"
	desc = "一套由绿色亚麻衬衫和黑色长裤组成的服装."
	icon_state = "civuni5"
	item_state = "civuni5"

/obj/item/clothing/under/civ6
	name = "粉色殖民时期服装"
	desc = "一套由粉色亚麻衬衫和黑色长裤组成的服装."
	icon_state = "civuni6"
	item_state = "civuni6"

/obj/item/clothing/under/doctor
	name = "医生制服"
	desc = "一套无菌、熨烫整齐的医生套装."
	icon_state = "ba_suit"
	item_state = "ba_suit"

/obj/item/clothing/under/civf1
	name = "深色连衣裙"
	desc = "一条深色连衣裙,为农妇所穿."
	icon_state = "dress1"
	item_state = "dress1"

/obj/item/clothing/under/civf2
	name = "蓝色连衣裙"
	desc = "一条蓝色连衣裙."
	icon_state = "dress2"
	item_state = "dress2"

/obj/item/clothing/under/civf3
	name = "棕色连衣裙"
	desc = "一条棕色连衣裙."
	icon_state = "dress3"
	item_state = "dress3"

/obj/item/clothing/under/civfg
	name = "绿色连衣裙"
	desc = "一条绿色连衣裙."
	icon_state = "dressg"
	item_state = "dressg"

/obj/item/clothing/under/civfr
	name = "红色连衣裙"
	desc = "一条红色连衣裙."
	icon_state = "dressr"
	item_state = "dressr"

/obj/item/clothing/under/debutante/blue
	name = "蓝色初入社交界长裙"
	desc = "一条长而优雅的初入社交界长裙,常为上层社会女性在社交场合穿着."
	icon_state = "gown_blue"
	item_state = "gown_blue"

/obj/item/clothing/under/debutante/orange
	name = "橙色初入社交界长裙"
	desc = "一条长而优雅的初入社交界长裙,常为上层社会女性在社交场合穿着."
	icon_state = "gown_orange"
	item_state = "gown_orange"

/obj/item/clothing/under/debutante/purple
	name = "紫色初入社交界长裙"
	desc = "一条长而优雅的初入社交界长裙,常为上层社会女性在社交场合穿着."
	icon_state = "gown_purple"
	item_state = "gown_purple"

/obj/item/clothing/under/debutante/red
	name = "红色初入社交界长裙"
	desc = "一条长而优雅的初入社交界长裙,常为上层社会女性在社交场合穿着."
	icon_state = "gown_red"
	item_state = "gown_red"

/obj/item/clothing/under/debutante/yellow
	name = "红色初入社交界长裙"
	desc = "一条长而优雅的初入社交界长裙,常为上层社会女性在社交场合穿着."
	icon_state = "gown_yellow"
	item_state = "gown_yellow"

/obj/item/clothing/under/conquistador
	name = "征服者制服"
	desc = "一套华丽的制服,常为被称为征服者的探险者阶层在寻找财富时所穿."
	icon_state = "conquistador"
	item_state = "conquistador"

/obj/item/clothing/under/pilgrim
	name = "朝圣者服装"
	desc = "一套朴素的黑色和灰色衣服,为四处漂泊的信仰追随者所穿."
	icon_state = "pilgrim"
	item_state = "pilgrim"

/* Colonial Hats*/

/obj/item/clothing/head/furhat
	name = "毛皮帽"
	desc = "一顶毛皮制成的帽子."
	icon_state = "furhat_hat"
	item_state = "furhat_hat"
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/furcap
	name = "毛皮便帽"
	desc = "一顶毛皮制成的便帽."
	icon_state = "furcap_hat"
	item_state = "furcap_hat"
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/roundcap
	name = "圆帽"
	desc = "一顶皮革制成的帽子."
	icon_state = "roundcap_hat"
	item_state = "roundcap_hat"

/obj/item/clothing/head/kerchief
	name = "头巾"
	icon_state = "kerchief"
	item_state = "kerchief"
	desc = "一条头巾,为女性戴在头发上."
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/red_sailorberet
	name = "红色水手贝雷帽"
	desc = "一顶红色贝雷帽."
	icon_state = "redberet"
	item_state = "redberet"

/obj/item/clothing/head/blue_sailorberet
	name = "蓝色水手贝雷帽"
	desc = "一顶蓝色贝雷帽."
	icon_state = "blueberet"
	item_state = "blueberet"

/obj/item/clothing/head/tarred_hat
	name = "涂焦油帽"
	desc = "一顶涂焦油的帽子,常为水手所用."
	icon_state = "tarred_hat"
	item_state = "tarred_hat"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/strawhat
	name = "草帽"
	icon_state = "boater_hat"
	desc = "一顶草帽,常为水手所用."
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/tricorne_black
	name = "黑色三角帽"
	desc = "一顶黑色三角帽.很时尚."
	icon_state = "tricorne_black"
	item_state = "tricorne_black"

/obj/item/clothing/head/capotain
	name = "高顶帽"
	desc = "一顶黑色高顶帽,在贵族宫廷中极为时尚."
	icon_state = "capotain"
	item_state = "capotain"

/obj/item/clothing/head/capotain/pilgrim
	name = "高顶帽"
	desc = "一顶风格化的高顶帽,常为四处漂泊的朝圣者所戴."
	icon_state = "pilgrim"
	item_state = "pilgrim"

	/* Colonial Helmets*/

/obj/item/clothing/head/helmet/imperial/morion
	name = "莫里恩头盔"
	desc = "一顶具有防护性且坚固的莫里恩头盔,覆盖头顶和耳朵."
	icon_state = "morion_helmet"
	item_state = "morion_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 5, energy = 15, bomb = 40, bio = 20, rad = 0)
	health = 32

/obj/item/clothing/head/helmet/imperial/cabasset
	name = "轻便盔"
	desc = "一顶坚固耐用的莫里恩头盔,没有狭窄的脊状凹痕覆盖."
	icon_state = "morion_helmet"
	item_state = "morion_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 35, arrow = 32, gun = 8, energy = 15, bomb = 41, bio = 21, rad = 0)
	health = 34


/* Colonial Boots*/

/obj/item/clothing/shoes/blackboots
	name = "黑色靴子"
	desc = "经典的黑色靴子."
	icon_state = "sailorboots1"
	item_state = "sailorboots1"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/leatherboots
	name = "皮靴"
	desc = "经典的皮靴."
	icon_state = "sailorboots2"
	item_state = "sailorboots2"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/winterboots
	name = "冬靴"
	desc = "经典的冬靴."
	icon_state = "winterboots"
	item_state = "winterboots"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 15, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 5)
	item_flags = NOSLIP
	siemens_coefficient = 0.9
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/whiteputtee
	name = "黑色绑腿靴"
	desc = "经典的黑色靴子,配有白色绑腿."
	icon_state = "whiteput"
	item_state = "whiteput"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/* Colonial Accessories & Items*/

/obj/item/clothing/accessory/ruffle/neck
	name = "颈部褶饰"
	desc = "由柔软材料制成的褶饰领."
	icon_state = "ruffle_neck"
	item_state = "ruffle_neck"

// WEBBING - can hold everything but clothing
/obj/item/clothing/accessory/storage/webbing
	name = "弹药带"
	desc = "两条带有小袋的皮带,用于装弹药."
	icon_state = "bandolier"
	item_state = "bandolier"
	slots = 8
	slot = "utility"
	New()
		..()
		hold.can_hold = list(
			/obj/item/ammo_casing,
			/obj/item/stack/ammopart/stoneball
			)

/obj/item/clothing/accessory/storage/coinpouch
	name = "钱袋"
	desc = "一个小袋子,你可以用来携带硬币和小物件."
	icon = 'icons/obj/storage.dmi'
	icon_state = "coinpouch1"
	slot_flags = SLOT_ID | SLOT_BELT | SLOT_POCKET
	slots = 8

/obj/item/clothing/accessory/storage/coinpouch/tes13
	name = "钱袋"
	desc = "一个小袋子,你可以用来携带赛普汀和小物件."
	icon = 'icons/obj/storage.dmi'
	icon_state = "coinpouch_tes13"
	slot_flags = SLOT_ID | SLOT_BELT | SLOT_POCKET
	slots = 8

/obj/item/clothing/accessory/storage/coinpouch/wallet
	name = "钱包"
	desc = "一个个人钱包,你可以用来携带硬币和小物件."
	icon = 'icons/obj/storage.dmi'
	icon_state = "wallet"


/obj/item/clothing/accessory/storage/coinpouch/wallet/occinn
	name = "旅店钥匙串"
	desc = "旅店的全套钥匙."
	slot_flags = SLOT_ID | SLOT_BELT | SLOT_POCKET
	New()
		..()
		hold.can_hold = list(
		/obj/item/weapon/key
		)
/obj/item/clothing/accessory/storage/coinpouch/wallet/occinn/New()
	..()
	new /obj/item/weapon/key/civ/inn(src)
	new /obj/item/weapon/key/civ/room1(src)
	new /obj/item/weapon/key/civ/room2(src)
	new /obj/item/weapon/key/civ/room3(src)
	new /obj/item/weapon/key/civ/room4(src)




/obj/item/clothing/accessory/storage/coinpouch/gator_wallet
	name = "鳄鱼皮钱包"
	desc = "一个用鳄鱼皮装饰的异国情调个人钱包,你可以用来携带硬币和小物件."
	icon = 'icons/obj/storage.dmi'
	icon_state = "gator_wallet"

/obj/item/clothing/accessory/storage/coinpouch/New()
	..()
	hold.max_storage_space = 25
	hold.can_hold = list(/obj/item/stack/money,\
	/obj/item/weapon/key,\
	/obj/item/weapon/storage/belt/keychain,\
	/obj/item/clothing/accessory/storage/passport,\
	/obj/item/weapon/visa)


/obj/item/clothing/accessory/storage/passport
	name = "护照"
	desc = "一本个人护照.可以容纳多张签证."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "passport"
	item_state = "paper"
	slot_flags = SLOT_ID | SLOT_POCKET
	slots = 15
	w_class = ITEM_SIZE_SMALL
	var/mob/living/human/owner = null
	var/faction = ""
	flammable = TRUE

/obj/item/clothing/accessory/storage/passport/New()
	..()
	hold.max_storage_space = 50
	hold.can_hold = list(/obj/item/weapon/visa)

/obj/item/clothing/accessory/storage/passport/proc/own()
	spawn(5)
		if (owner)
			faction = owner.civilization
			name = "[faction]'s passport"
			desc = "[faction] passport, issued to [owner]. Can hold several visas."

/obj/item/weapon/visa
	name = "签证"
	desc = "一张旅行签证."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "visa0"
	item_state = "paper"
	throwforce = FALSE
	w_class = ITEM_SIZE_TINY
	flags = FALSE
	throw_range = TRUE
	throw_speed = TRUE
	attack_verb = list("bapped")
	flammable = TRUE
	var/mob/living/human/owner = null
	var/duration = 0

/obj/item/weapon/visa/attackby(obj/item/W as obj, mob/living/human/user as mob)
	if (istype(W, /obj/item/weapon/pen) && !owner && duration == 0)
		if (user.civilization == "none")
			to_chat(user, "你不在任何阵营中!")
			return
		else
			if (user.faction_perms[4] == 0)
				to_chat(user, "你没有签发签证的招募权限!")
				return
			else
				var/mob/living/human/U = null
				var/closemobs = list("Cancel")
				for (var/mob/living/human/M in range(4,loc))
					if (M.civilization != user.civilization)
						closemobs += M
				var/choice2 = WWinput(usr, "Who to give the visa to?", "Visa", "Cancel", closemobs)
				if (choice2 == "Cancel" || !choice2)
					return
				else
					U = choice2
					var/inp = input(user, "How long should the visa last? In minutes. (Up to 3 days - 4320 minutes)") as num|null
					if (!isnum(inp))
						return
					if (inp <= 0)
						return
					if (inp > 4320)
						inp = 4320
						return
					else
						duration = inp
						owner = U
						icon_state = "visa1"
						name = "[user.civilization] visa"
						var/cdur = ""
						if (duration > 60)
							cdur = "[duration/60] hours"
						else
							cdur = "[duration] minutes"
						desc = "A visa issued by <b>[user.civilization]</b> to <b>[owner]</b>.<br>Issued on <b>[roundduration2text_days()]</b> and valid for <b>[cdur]</b> starting then.<br>Signed by: <b><i>[user]</i></b>."
						to_chat(user, "你签发了签证.")
						update_icon()
						do_duration()
						return
	else
		..()
/obj/item/weapon/visa/proc/do_duration()
	spawn(duration*600)
		qdel(src)
		return

//* Colonial Pirate Clothing*/

/obj/item/clothing/suit/storage/jacket/piratejacket1
	name = "黑色夹克"
	desc = "一件长款黑色夹克."
	icon_state = "piratejacket1"
	item_state = "piratejacket1"

/obj/item/clothing/suit/storage/jacket/piratejacket2
	name = "华丽棕色夹克"
	desc = "一件华丽的夹克.这件是棕色的."
	icon_state = "piratejacket2"
	item_state = "piratejacket2"

/obj/item/clothing/suit/storage/jacket/piratejacket3
	name = "蓝色马甲"
	desc = "一件无袖马甲.这件是蓝色的."
	icon_state = "piratejacket3"
	item_state = "piratejacket3"

/obj/item/clothing/suit/storage/jacket/piratejacket4
	name = "黑色马甲"
	desc = "一件无袖马甲.这件是黑色的."
	icon_state = "piratejacket4"
	item_state = "piratejacket4"

/obj/item/clothing/suit/storage/jacket/piratejacket5
	name = "华丽红色夹克"
	desc = "一件华丽的夹克.这件是红色的."
	icon_state = "piratejacket5"
	item_state = "piratejacket5"

/obj/item/clothing/under/pirate1
	name = "黑色条纹服装"
	desc = "一套带有黑色条纹衬衫的服装."
	icon_state = "pirate1"
	item_state = "pirate1"

/obj/item/clothing/under/pirate2
	name = "红色条纹服装"
	desc = "一套带有红色条纹衬衫的服装."
	icon_state = "pirate2"
	item_state = "pirate2"

/obj/item/clothing/under/pirate3
	name = "蓝色条纹服装"
	desc = "一套带有蓝色条纹衬衫的服装."
	icon_state = "pirate3"
	item_state = "pirate3"

/obj/item/clothing/under/pirate4
	name = "宽松服装"
	desc = "一套带有白色衬衫和宽松长裤的服装."
	icon_state = "pirate4"
	item_state = "pirate4"

/obj/item/clothing/under/pirate5
	name = "无袖服装"
	desc = "一套带有无袖衬衫的服装."
	icon_state = "pirate5"
	item_state = "pirate5"

/obj/item/clothing/head/piratehat
	name = "海盗帽"
	icon_state = "piratehat"
	item_state = "piratehat"

/obj/item/clothing/head/piratebandana1
	name = "头巾"
	icon_state = "piratebandana1"
	item_state = "piratebandana1"
	flags_inv = BLOCKHAIR

/* Colonial Infantry Clothes*/
	/* Colonial Infantry & Sailor Boots*/

/obj/item/clothing/shoes/soldiershoes
	name = "步兵鞋"
	desc = "低帮黑色步兵鞋."
	icon_state = "soldier_shoes"
	item_state = "soldier_shoes"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 30, arrow = 25, gun = 10, energy = 15, bomb = 30, bio = 10, rad = 5)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/sailorboots1
	name = "黑色水手靴"
	desc = "经典的黑色水手靴."
	icon_state = "sailorboots1"
	item_state = "sailorboots1"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 30, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/sailorboots2
	name = "皮水手靴"
	desc = "经典的皮水手靴."
	icon_state = "sailorboots2"
	item_state = "sailorboots2"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 80, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 30)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/usmc
	name = "军靴"
	desc = "经典的棕褐色军靴."
	icon_state = "usmc"
	item_state = "usmc"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 30, arrow = 20, gun = 10, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.7
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

	/* Colonial British Army & Navy Clothes*/

/obj/item/clothing/under/british_sailor1
	name = "英国水手服装"
	desc = "一套皇家海军水手服装,配有白色衬衫和长裤."
	icon_state = "british_sailor1"
	item_state = "british_sailor1"

/obj/item/clothing/under/british_sailor2
	name = "敞开式英国水手服装"
	desc = "一套皇家海军水手服装,配有解开纽扣的白色衬衫和长裤."
	icon_state = "british_sailor2"
	item_state = "british_sailor2"

/obj/item/clothing/under/british_sailor3
	name = "英国水手长裤"
	desc = "白色英国水手长裤.适合太热而无法穿衬衫时穿着."
	icon_state = "british_sailor3"
	item_state = "british_sailor3"

/obj/item/clothing/under/british_sailor4
	name = "灰色英国水手服装"
	desc = "一套皇家海军水手服装,配有灰色衬衫和长裤."
	icon_state = "british_sailor4"
	item_state = "british_sailor4"

/obj/item/clothing/head/tricorne_british
	name = "皇家海军三角帽"
	desc = "一顶蓝色三角帽,英国皇家海军使用."
	icon_state = "tricorne_british"
	item_state = "tricorne_british"

/obj/item/clothing/head/tricorne_british_army
	name = "英国陆军三角帽"
	desc = "一顶红色三角帽,英国陆军使用."
	icon_state = "tricorne_british2"
	item_state = "tricorne_british2"

/obj/item/clothing/head/bicorne_british_soldier
	name = "黑色双角帽"
	desc = "一顶黑色双角帽,通常由武装部队使用."
	icon_state = "tricorne_british_soldier"
	item_state = "tricorne_british_soldier"

/obj/item/clothing/accessory/armband/british_scarf
	name = "蓝色围巾"
	desc = "一条蓝色围巾,皇家海军水手使用."
	icon_state = "british_scarf"
	item_state = "british_scarf"

/obj/item/clothing/suit/storage/jacket/british_captain
	name = "皇家海军上校夹克"
	desc = "皇家海军的标准上校夹克.蓝色配金色纽扣,白色饰带和金色袖口."
	icon_state = "british_captain"
	item_state = "british_captain"

/obj/item/clothing/suit/storage/jacket/british_officer
	name = "皇家海军军官夹克"
	desc = "皇家海军的标准军官夹克.蓝色配金色纽扣."
	icon_state = "british_officer"
	item_state = "british_officer"

/obj/item/clothing/suit/storage/jacket/british_soldier
	name = "英国红色夹克"
	desc = "英国红衣军夹克,英国陆军和海军陆战队使用."
	icon_state = "british_soldier_jacket"
	item_state = "british_soldier_jacket"

/obj/item/clothing/head/chasseur_british
	name = "英国羽毛帽"
	desc = "一顶带羽毛的黑色双角帽,英国轻步兵使用."
	icon_state = "chasseur_br"
	item_state = "chasseur_br"

/* Colonial Portuguese Army & Navy Clothes*/

/obj/item/clothing/head/tricorne_portuguese
	name = "葡萄牙海军三角帽"
	desc = "一顶绿色三角帽,葡萄牙海军使用."
	icon_state = "tricorne_portuguese"
	item_state = "tricorne_portuguese"

/obj/item/clothing/head/chasseur_portuguese
	name = "葡萄牙羽毛帽"
	desc = "一顶带羽毛的黑色双角帽,葡萄牙轻步兵使用."
	icon_state = "chasseur_pt"
	item_state = "chasseur_pt"

/obj/item/clothing/head/portuguese_army
	name = "葡萄牙陆军三角帽"
	desc = "一顶绿色三角帽,葡萄牙陆军使用"
	icon_state = "tricorne_portuguese"
	item_state = "tricorne_portuguese"

/obj/item/clothing/suit/storage/jacket/portuguese_captain
	name = "葡萄牙上校夹克"
	desc = "葡萄牙海军的标准上校夹克.蓝色配金色纽扣,白色饰带和金色袖口."
	icon_state = "portuguese_captain"
	item_state = "portuguese_captain"

/obj/item/clothing/suit/storage/jacket/portuguese_officer
	name = "葡萄牙军官夹克"
	desc = "葡萄牙海军的标准军官夹克.蓝色配金色纽扣."
	icon_state = "portuguese_officer"
	item_state = "portuguese_officer"

/obj/item/clothing/under/portuguese_sailor1
	name = "葡萄牙水手服"
	desc = "一套葡萄牙海军水手服,白色衬衫和绿色长裤."
	icon_state = "portuguese_sailor1"
	item_state = "portuguese_sailor1"

/obj/item/clothing/under/portuguese_sailor2
	name = "敞开的葡萄牙水手服"
	desc = "一套葡萄牙海军水手服,解开的白色衬衫和绿色长裤."
	icon_state = "portuguese_sailor2"
	item_state = "portuguese_sailor2"

/obj/item/clothing/under/portuguese_sailor3
	name = "葡萄牙水手长裤"
	desc = "绿色葡萄牙水手长裤.天太热不想穿衬衫时穿."
	icon_state = "portuguese_sailor3"
	item_state = "portuguese_sailor3"

/obj/item/clothing/under/portuguese_sailor4
	name = "带围巾的葡萄牙水手服"
	desc = "一套葡萄牙海军水手服,白色衬衫和绿色长裤.附带一条绿色围巾."
	icon_state = "portuguese_sailor4"
	item_state = "portuguese_sailor4"


/* Colonial Spanish Army & Navy Clothes*/

/obj/item/clothing/head/tricorne_spanish
	name = "西班牙海军三角帽"
	desc = "一顶黄色三角帽,西班牙海军使用."
	icon_state = "tricorne_spanish"
	item_state = "tricorne_spanish"

/obj/item/clothing/head/spanish_army
	name = "西班牙陆军三角帽"
	desc = "一顶黄色三角帽,西班牙陆军使用."
	icon_state = "tricorne_spanish"
	item_state = "tricorne_spanish"

/obj/item/clothing/suit/storage/jacket/spanish_captain
	name = "西班牙上校夹克"
	desc = "西班牙海军的标准上校夹克.黄色配金色纽扣,白色饰带和金色袖口."
	icon_state = "spanish_captain"
	item_state = "spanish_captain"

/obj/item/clothing/suit/storage/jacket/spanish_officer
	name = "西班牙军官夹克"
	desc = "西班牙海军的标准军官夹克.黄色配金色纽扣."
	icon_state = "spanish_officer"
	item_state = "spanish_officer"

/obj/item/clothing/suit/storage/jacket/spanish_soldier
	name = "西班牙士兵夹克"
	desc = "西班牙陆军的标准夹克.黄色配红色镶边."
	icon_state = "spanish_army"
	item_state = "spanish_army"

/obj/item/clothing/under/spanish_sailor1
	name = "西班牙水手服"
	desc = "一套西班牙海军水手服,棕色衬衫和长裤."
	icon_state = "spanish_sailor1"
	item_state = "spanish_sailor1"

/obj/item/clothing/under/spanish_sailor2
	name = "敞开的西班牙水手服"
	desc = "一套西班牙海军水手服,解开的棕色衬衫和长裤."
	icon_state = "spanish_sailor2"
	item_state = "spanish_sailor2"

/obj/item/clothing/under/spanish_sailor3
	name = "西班牙水手长裤"
	desc = "棕色西班牙水手长裤.天太热不想穿衬衫时穿."
	icon_state = "spanish_sailor3"
	item_state = "spanish_sailor3"

/obj/item/clothing/under/spanish_soldier
	name = "西班牙士兵制服"
	desc = "蓝色西班牙士兵长裤和一件精致的白色衬衫."
	icon_state = "spanish_soldier"
	item_state = "spanish_soldier"

/* Colonial French Army & Navy Clothes*/

/obj/item/clothing/head/tricorne_french
	name = "法国海军三角帽"
	desc = "一顶白蓝相间的三角帽,法国海军使用."
	icon_state = "tricorne_french"
	item_state = "tricorne_french"

/obj/item/clothing/head/french_army
	name = "法国陆军三角帽"
	desc = "一顶蓝色三角帽,法国陆军使用."
	icon_state = "tricorne_british"
	item_state = "tricorne_british"

/obj/item/clothing/suit/storage/jacket/french_captain
	name = "法国上校夹克"
	desc = "法国海军的标准上校夹克.白色配金色纽扣,蓝色饰带和金色袖口."
	icon_state = "french_captain"
	item_state = "french_captain"

/obj/item/clothing/suit/storage/jacket/french_officer
	name = "法国军官夹克"
	desc = "法国海军的标准军官夹克.白色配金色纽扣."
	icon_state = "french_officer"
	item_state = "french_officer"

/obj/item/clothing/under/french_officer
	name = "法国军官服装"
	desc = "一套法国军官服装,浅蓝色衬衫和黑色长裤,均配金色纽扣."
	icon_state = "french_officer"
	item_state = "french_officer"

/obj/item/clothing/under/baycona
	name = "巴约纳服装"
	desc = "一套巴约纳军官服装,这看起来非常古老."
	icon_state = "baycona"
	item_state = "baycona"

/obj/item/clothing/under/french_sailor1
	name = "法国水手服"
	desc = "一套法国海军水手服,浅蓝色衬衫和长裤."
	icon_state = "french_sailor1"
	item_state = "french_sailor1"

/obj/item/clothing/under/french_sailor2
	name = "敞开的法国水手服"
	desc = "一套法国海军水手服,解开的浅蓝色衬衫和长裤."
	icon_state = "french_sailor2"
	item_state = "french_sailor2"

/obj/item/clothing/under/french_sailor3
	name = "法国水手长裤"
	desc = "浅蓝色法国水手长裤.天太热不想穿衬衫时穿."
	icon_state = "french_sailor3"
	item_state = "french_sailor3"

/obj/item/clothing/head/french_army
	name = "法国陆军三角帽"
	desc = "一顶白蓝相间的三角帽,法国陆军使用."
	icon_state = "tricorne_french"
	item_state = "tricorne_french"

/obj/item/clothing/head/chasseur_french
	name = "法国羽毛帽"
	desc = "一顶带羽毛的黑色双角帽,法国轻步兵使用."
	icon_state = "chasseur_fr"
	item_state = "chasseur_fr"

/* Colonial Dutch Army & Navy Clothes*/

/obj/item/clothing/head/tricorne_dutch
	name = "联省海军三角帽"
	desc = "一顶橙色三角帽,联省海军使用."
	icon_state = "tricorne_dutch"
	item_state = "tricorne_dutch"

/obj/item/clothing/head/chasseur_dutch
	name = "联省羽毛帽"
	desc = "一顶带羽毛的黑色双角帽,联省轻步兵使用."
	icon_state = "chasseur_nl"
	item_state = "chasseur_nl"

/obj/item/clothing/head/dutch_army
	name = "联省陆军三角帽"
	desc = "一顶橙色三角帽,荷兰联省陆军使用."
	icon_state = "tricorne_dutch"
	item_state = "tricorne_dutch"

/obj/item/clothing/suit/storage/jacket/dutch_captain
	name = "联省上校夹克"
	desc = "联合省海军标准上尉夹克.橙色配金色纽扣,白色系带和金色袖口."
	icon_state = "dutch_captain"
	item_state = "dutch_captain"

/obj/item/clothing/suit/storage/jacket/dutch_officer
	name = "联合省军官夹克"
	desc = "联合省海军标准军官夹克.橙色配金色纽扣."
	icon_state = "dutch_officer"
	item_state = "dutch_officer"

/obj/item/clothing/under/dutch_sailor1
	name = "荷兰水手服"
	desc = "一套荷兰海军水手服,白色衬衫和橙色长裤."
	icon_state = "dutch_sailor1"
	item_state = "dutch_sailor1"

/obj/item/clothing/under/dutch_sailor2
	name = "敞开的荷兰水手服"
	desc = "一套荷兰海军水手服,白色衬衫敞开,橙色长裤."
	icon_state = "dutch_sailor2"
	item_state = "dutch_sailor2"

/obj/item/clothing/under/dutch_sailor3
	name = "荷兰水手长裤"
	desc = "橙色荷兰水手长裤.天太热不想穿衬衫时穿."
	icon_state = "dutch_sailor3"
	item_state = "dutch_sailor3"

//* Colonial Army Clothes*/
	/* Colonial Army Uniforms*/

/obj/item/clothing/under/generic_officer
	name = "军官服"
	desc = "一套军官服,白色衬衫和黑色长裤,均配金色纽扣."
	icon_state = "officer"
	item_state = "officer"

/obj/item/clothing/under/dutch_soldier
	name = "荷兰陆军制服"
	desc = "一套联合省陆军制服.黄色衬衫和长裤."
	icon_state = "dutch_army"
	item_state = "dutch_army"

/obj/item/clothing/under/portuguese_soldier
	name = "葡萄牙陆军制服"
	desc = "一套葡萄牙陆军制服.红色衬衫配黑白长裤."
	icon_state = "portuguese_army"
	item_state = "portuguese_army"

/obj/item/clothing/under/french_soldier
	name = "法国陆军制服"
	desc = "一套法国陆军制服.白色衬衫配蓝白长裤."
	icon_state = "french_army"
	item_state = "french_army"

	/* Colonial Army Jackets*/ //officer army jackets seem to be... unfinished.

/obj/item/clothing/suit/storage/jacket/dutch_officer_army
	name = "联合省陆军夹克"
	desc = "联合省陆军标准陆军夹克.橙色配金色纽扣."
	icon_state = "dutch_army"
	item_state = "dutch_army"

/obj/item/clothing/suit/storage/jacket/spanish_officer_army
	name = "西班牙陆军夹克"
	desc = "西班牙陆军标准陆军夹克.黄色配金色纽扣."
	icon_state = "spanish_officer"
	item_state = "spanish_officer"

/obj/item/clothing/suit/storage/jacket/portuguese_officer_army
	name = "葡萄牙陆军夹克"
	desc = "葡萄牙陆军标准陆军夹克.绿色配金色纽扣."
	icon_state = "portuguese_army"
	item_state = "portuguese_army"

/obj/item/clothing/suit/storage/jacket/french_officer_army
	name = "法国陆军夹克"
	desc = "法国陆军标准陆军夹克.白色配蓝色镶边."
	icon_state = "french_army"
	item_state = "french_army"

/obj/item/clothing/suit/storage/jacket/british_officer_army
	name = "英国陆军夹克"
	desc = "英国陆军标准陆军夹克.红白配色."
	icon_state = "british_officer"
	item_state = "british_officer"

/* Napoleonic Clothes*/

/obj/item/clothing/under/nightingale
	name = "南丁格尔护士裙"
	desc = "一件朴素的护士裙,缝有围裙.常见于战时野战医院中照料伤员的护士穿着."
	icon_state = "nightingale"
	item_state = "nightingale"

/obj/item/clothing/head/nurse
	name = "护士帽"
	desc = "一顶白色护士帽,象征关怀与同情."
	icon_state = "nursehat"
	item_state = "nursehat"
	body_parts_covered = HEAD

/* Napoleonic Army Clothing*/

/obj/item/clothing/under/napoleonic
	name = "拿破仑时期法国士兵制服"
	desc = "一套法国陆军制服,配金色肩章,黑色衬衫和金色纽扣白色马甲." //gilet is a light jacket which would be worn under a coat
	icon_state = "nap_french_army"
	item_state = "nap_french_army"

/obj/item/clothing/under/napoleonic/british
	name = "拿破仑时期英国士兵制服"
	desc = "一套英国陆军制服,配红色衬衫,蓝色肩章和白色盘扣." //criss cross on the sprite is called frogging.
	icon_state = "nap_british_army"
	item_state = "nap_british_army"

/obj/item/clothing/under/napoleonic/blackwatch
	name = "拿破仑时期黑卫士兵制服"
	desc = "一套英国陆军苏格兰步兵制服.常见于令人畏惧的高地冲锋中,配红色衬衫,扎人的苏格兰短裙和白色圣安德鲁十字." //saltire is a cross often found in flags
	icon_state = "blackwatch"
	item_state = "blackwatch"

/obj/item/clothing/under/napoleonic/walloon
	name = "拿破仑时期瓦隆士兵制服"
	desc = "一套西班牙陆军制服.常见于效忠西班牙的瑞士征召兵穿着,配深蓝色衬衫和金色纽扣红色马甲."
	icon_state = "walloon_guard"
	item_state = "walloon_guard"

/obj/item/clothing/under/napoleonic/russian
	name = "拿破仑时期俄国士兵制服"
	desc = "一套俄国陆军制服.配棕色长裤和绿色衬衫,单排金色纽扣."
	icon_state = "nap_russian_army"
	item_state = "nap_russian_army"

/obj/item/clothing/under/napoleonic/patriot
	name = "爱国美国士兵制服"
	desc = "一套美国陆军制服.常见于自豪的自由与解放捍卫者穿着,蓝色配白色圣安德鲁十字和红色内衬."
	icon_state = "patriot"
	item_state = "patriot"

/obj/item/clothing/under/napoleonic/prussian
	name = "拿破仑时期普鲁士士兵制服"
	desc = "一套普鲁士陆军制服.常见于职业军队穿着,配深蓝色衬衫和红白皮革肩章,附有各式纽扣."
	icon_state = "nap_prussian_army"
	item_state = "nap_prussian_army"

/obj/item/clothing/under/napoleonic/jaeger
	name = "拿破仑时期猎兵士兵制服"
	desc = "一套奥地利与德国联合陆军制服.配深绿色衬衫,黑色圣安德鲁十字,以及青柠绿色衣领和肩章."
	icon_state = "nap_jaegers"
	item_state = "nap_jaegers"

/obj/item/clothing/under/napoleonic/portuguese
	name = "拿破仑时期葡萄牙士兵制服"
	desc = "一套葡萄牙陆军制服.常见于半岛战争士兵穿着,配深蓝色衬衫和白色圣安德鲁十字."
	icon_state = "nap_portuguese_army"
	item_state = "nap_portuguese_army"

/obj/item/clothing/under/napoleonic/italian
	name = "拿破仑时期意大利士兵制服"
	desc = "一套意大利陆军制服.配深绿色衬衫,手臂和脚部有亮橙色镶边,以及白色圣安德鲁十字."
	icon_state = "nap_portuguese_army"
	item_state = "nap_portuguese_army"

/obj/item/clothing/under/napoleonic/satsuma
	name = "日本士兵制服"
	desc = "一套大日本帝国陆军制服.配黑色纽扣衬衫和蓝色长裤,附白色武装带."
	icon_state = "nap_satsuma"
	item_state = "nap_satsuma"

/obj/item/clothing/under/merchant_suit
	name = "商人西装"
	desc = "一套华丽的帝国商人西装."
	icon_state = "merchant_suit"
	item_state = "merchant_suit"

/* Napoleonic Armor*/
// Can't add these helmets to blacksmithing.dm until code seperation of the napoleonic era or new functions make them inaccessible to early colonial settlers. @FantasticFwoosh

/obj/item/clothing/head/helmet/leather_infantry
	name = "皮革步兵帽"
	desc = "一顶防护皮革帽,常见于早期现代战争时期的士兵佩戴."
	icon_state = "nap_lea_infantry_cap"
	item_state = "nap_lea_infantry_cap"
	body_parts_covered = HEAD
	armor = list(melee = 20, arrow = 25, gun = 8, energy = 25, bomb = 50, bio = 10, rad = 0)
	health = 25

/obj/item/clothing/head/helmet/leather_infantry/brown
	name = "棕色皮革步兵头盔"
	icon_state = "brown_nap_lea_infantry_cap"
	item_state = "brown_nap_lea_infantry_cap"

/obj/item/clothing/head/helmet/prussian
	name = "普鲁士皮革步兵头盔"
	desc = "一顶防护皮革帽,常见于拿破仑时期的普鲁士士兵佩戴."
	icon_state = "prussian_lea_infantry_cap"
	item_state = "prussian_lea_infantry_cap"
	armor = list(melee = 35, arrow = 25, gun = 10, energy = 15, bomb = 40, bio = 20, rad = 0)
	health = 35

/obj/item/clothing/head/helmet/leather_infantry/blue //for nomads
	name = "蓝色皮革步兵头盔"
	icon_state = "prussian_lea_infantry_cap"
	item_state = "prussian_lea_infantry_cap"

/obj/item/clothing/head/helmet/leather_infantry/red //for nomads
	name = "红色皮革步兵头盔"
	icon_state = "commissar"
	item_state = "commissar"

/obj/item/clothing/head/helmet/satsuma
	name = "萨摩步兵帽"
	desc = "一顶尖顶黑帽,常见于大日本帝国萨摩时期的士兵佩戴."
	icon_state = "nap_satsuma"
	item_state = "nap_satsuma"
	body_parts_covered = HEAD
	armor = list(melee = 20, arrow = 25, gun = 8, energy = 25, bomb = 50, bio = 10, rad = 0) //equal to infantry cap
	health = 25

/obj/item/clothing/head/helmet/napoleonic/dragoon
	name = "龙骑兵头盔"
	desc = "一顶带有华丽羽饰的青铜头盔.常见于拿破仑时期骑兵中队佩戴;虽然更多是装饰用途,但仍能抵挡伤害."
	icon_state = "dragoon"
	item_state = "dragoon"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 8, energy = 15, bomb = 45, bio = 20, rad = 0) //slightly stronger than a kettle helmet being its equal, protective conical outclasses it
	health = 32

/obj/item/clothing/head/helmet/napoleonic/bearskin
	name = "黑色拿破仑熊皮帽"
	desc = "一顶由熊皮和青铜制成的装饰性阅兵帽.常见于拿破仑时期掷弹兵佩戴."
	icon_state = "nap_bearskin_hat"
	item_state = "nap_bearskin_hat"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 40, gun = 8, energy = 15, bomb = 45, bio = 20, rad = 0)
	health = 30

/obj/item/clothing/head/helmet/napoleonic/bearskin/brown
	name = "棕色拿破仑熊皮帽"
	icon_state = "b_nap_bearskin_hat"
	item_state = "b_nap_bearskin_hat"

/obj/item/clothing/head/helmet/napoleonic/bearskin/white
	name = "白色拿破仑熊皮帽"
	icon_state = "w_nap_bearskin_hat"
	item_state = "w_nap_bearskin_hat"

/* Miscallaneous*/

//These two seem misplaced, refer to be moved to modern or their own apparel, quiver is wierdly placed too.
/obj/item/clothing/under/scavfit
	name = "破烂服装"
	desc = "一套蓝色牛仔裤和棕色连帽衫."
	icon_state = "scavfit"
	item_state = "scavfit"

/obj/item/clothing/under/wastelander
	name = "服装"
	desc = "一套棕褐色长裤和棕色外套."
	icon_state = "wastelander"
	item_state = "wastelander"

/obj/item/clothing/head/helmet/leather_infantry/commissar //rdming your men at random to 'inspire' them is against the rules
	name = "政委帽"
	desc = "一顶保护性皮帽,常由残酷黑暗未来的中队指挥官佩戴."
	icon_state = "commissar"
	item_state = "commissar"
	armor = list(melee = 35, arrow = 50, gun = 15, energy = 15, bomb = 40, bio = 20, rad = 0)
	health = 35
