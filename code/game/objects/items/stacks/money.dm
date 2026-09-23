// Spanish money was the world currency in the early 18th century. 1 doubloon = 2 escudos = 4 spanish dollars = 32 reales
/obj/item/stack/money/update_icon()
	if (novariants)
		return // TO-DO: Check if the parent proc is actually needed here as a "return ..()"
	if (map.ordinal_age >= 4 && icon_state != "silvercoin_pile")
		var/icon_suffix = ""
		switch(amount)
			if (0 to 49)
				icon_suffix = ""
			if (50 to 99)
				icon_suffix = "_2"
			if (100 to 249)
				icon_suffix = "_3"
			if (250 to 499)
				icon_suffix = "_4"
			if (500 to INFINITY)
				icon_suffix = "_5"
		icon_state = "[initial(icon_state)][icon_suffix]"
	else
		icon_state = initial(icon_state)
	..()
	//TO-DO: Check what the parent proc actually does

/obj/item/stack/money
	name = "金币"
	desc = "闪亮的金币."
	singular_name = "coin"
	icon_state = "goldcoin_pile"
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 8
	throw_range = 10
	amount = 10
	max_amount = 500
	attack_verb = list("hit")
	w_class = ITEM_SIZE_SMALL // fits in pockets
	value = 1
	var/novariants = TRUE

/obj/item/stack/money/cents
	name = "美元分币"
	desc = "代表美元零头的小额硬币"
	singular_name = "cent"
	icon_state = "silvercoin_pile"
	amount = 1
	value = 0.04

/obj/item/stack/money/real
	name = "西班牙里亚尔"
	desc = "一种小银币."
	singular_name = "coin"
	icon_state = "real"
	amount = 1
	value = 1

/obj/item/stack/money/real/New()
	update_icon()
	return ..()

/obj/item/stack/money/real/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "real[icon_suffix]"

/obj/item/stack/money/rubles
	name = "苏联卢布"
	desc = "一张苏联1卢布纸币."
	singular_name = "ruble"
	icon_state = "ruble"
	amount = 1
	value = 1

/obj/item/stack/money/rubles/New()
	update_icon()
	return ..()

/obj/item/stack/money/rubles/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "50"
		if (100 to 299)
			icon_suffix = "100"
		if (300 to 499)
			icon_suffix = "300"
		if (500 to INFINITY)
			icon_suffix = "500"
	icon_state = "ruble[icon_suffix]"
	// TO-DO: Check if the parent update_icon proc has to be called

/obj/item/stack/money/rubles/fivehundred
	amount = 500

/obj/item/stack/money/francs
	name = "法国法郎"
	desc = "一张法国1法郎纸币."
	singular_name = "franc"
	icon_state = "franc_1"
	amount = 1
	value = 1
	max_amount = 25

/obj/item/stack/money/francs/New()
	update_icon()
	return ..()

/obj/item/stack/money/francs/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 3)
			icon_suffix = "1"
		if (4 to 6)
			icon_suffix = "2"
		if (7 to 10)
			icon_suffix = "3"
		if (11 to 15)
			icon_suffix = "4"
		if (16 to INFINITY)
			icon_suffix = "5"
	icon_state = "franc_[icon_suffix]"

/obj/item/stack/money/francs/ten
	amount = 10


/obj/item/stack/money/european
	name = ""
	desc = ""
	singular_name = ""
	icon_state = ""
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 8
	throw_range = 10
	amount = 1
	max_amount = 500
	attack_verb = list("hit")
	w_class = ITEM_SIZE_SMALL // fits in pockets
	value = 1
	novariants = TRUE

/obj/item/stack/money/asian
	name = ""
	desc = ""
	singular_name = ""
	icon_state = ""
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 8
	throw_range = 10
	amount = 1
	max_amount = 500
	attack_verb = list("hit")
	w_class = ITEM_SIZE_SMALL // fits in pockets
	value = 1
	novariants = TRUE

/obj/item/stack/money/fictional
	name = ""
	desc = ""
	singular_name = ""
	icon_state = ""
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 8
	throw_range = 10
	amount = 1
	max_amount = 500
	attack_verb = list("hit")
	w_class = ITEM_SIZE_SMALL // fits in pockets
	value = 1
	novariants = TRUE

// -------------------------------------------------
// FICTIONAL:
// Art and code - goldenfreddycl
// -------------------------------------------------

/obj/item/stack/money/fictional/arstotzkacredit
	name = "阿尔斯托兹卡信用币"
	desc = "官方阿尔斯托兹卡信用币的单张纸币,由贸易部铸造并印刷,被视为阿尔斯托兹卡境内唯一的法定货币.阿尔斯托兹卡万岁."
	singular_name = "Arstotzka Credit"
	icon_state = "arstotzkacredit"
	amount = 1
	value = 1

// -------------------------------------------------
// CHINESE FENG SHUI
// Art and code - goldenfreddycl
// -------------------------------------------------

/obj/item/stack/money/asian/fengshui
	name = "风水币"
	desc = "一种中国古代货币,采用独特设计,比常规货币大得多,中央有一个方形孔洞,其设计中还嵌有汉字.通常由铜合金制成."
	singular_name = "coin"
	icon_state = "fengshui"
	amount = 1
	value = 1

// -------------------------------------------------
// BRITISH POUND
// Art and code - goldenfreddycl
// -------------------------------------------------

/obj/item/stack/money/european/britpound
	name = "1英镑"
	desc = "代表1英镑硬币,其外环由金色的镍黄铜制成,内环为银色的镀镍合金.其上刻有英国君主的侧面像."
	singular_name = "coin"
	icon_state = "britpound"
	amount = 1
	value = 1

/obj/item/stack/money/european/britpound5
	name = "5英镑"
	desc = "一张5英镑纸币,上面印有英国君主的面容,由英格兰银行发行."
	singular_name = "5 Pound note"
	icon_state = "5britpound"
	amount = 1
	value = 5

/obj/item/stack/money/european/britpound10
	name = "10英镑"
	desc = "一张10英镑纸币,上面印有英国君主的面容,由英格兰银行发行."
	singular_name = "10 Pound note"
	icon_state = "10britpound"
	amount = 1
	value = 10

/obj/item/stack/money/european/britpound20
	name = "20英镑"
	desc = "一张20英镑纸币,上面印有英国君主的面容,由英格兰银行发行."
	singular_name = "20 Pound note"
	icon_state = "20britpound"
	amount = 1
	value = 20

/obj/item/stack/money/european/britpound50
	name = "50英镑"
	desc = "一张50英镑纸币,上面印有英国君主的面容,由英格兰银行发行."
	singular_name = "50 Pound note"
	icon_state = "50britpound"
	amount = 1
	value = 50

// -------------------------------------------------
// EURO
// Art and code - goldenfreddycl
// -------------------------------------------------

/obj/item/stack/money/european/euro
	name = "1欧元硬币"
	desc = "一枚1欧元硬币,上面刻有某个成员国的象征,其银色内环由铜镍合金制成,金色外环由铜锌镍合金制成"
	singular_name = "coin"
	icon_state = "euro"
	amount = 1
	value = 1

/obj/item/stack/money/european/euro2
	name = "2欧元硬币"
	desc = "一枚2欧元硬币,上面刻有某个成员国的象征,其金色内环由铜锌镍合金制成,银色外环由铜镍合金制成"
	singular_name = "coin"
	icon_state = "2euro"
	amount = 1
	value = 2

/obj/item/stack/money/european/euro5
	name = "5欧元纸币"
	desc = "一张5欧元纸币,描绘了古典建筑风格的桥梁和拱门/门廊,混合了绿色,蓝色和一抹黄色.上面印有欧洲联盟的旗帜"
	singular_name = "5 Euro note"
	icon_state = "5euro"
	amount = 1
	value = 5

/obj/item/stack/money/european/euro10
	name = "10欧元纸币"
	desc = "一张10欧元纸币,描绘了罗曼式建筑风格的桥梁和拱门/门廊,混合了各种深浅的红色.上面印有欧洲联盟的旗帜"
	singular_name = "10 Euro note"
	icon_state = "10euro"
	amount = 1
	value = 10

/obj/item/stack/money/european/euro20
	name = "20欧元纸币"
	desc = "一张20欧元纸币,描绘了哥特式建筑风格的桥梁和拱门/门廊,混合了深浅不一的蓝色,一些红色和一抹绿色.上面印有欧洲联盟的旗帜"
	singular_name = "20 Euro note"
	icon_state = "20euro"
	amount = 1
	value = 20

/obj/item/stack/money/european/euro50
	name = "50欧元纸币"
	desc = "一张50欧元纸币,描绘了文艺复兴时期的桥梁和拱门/门廊,混合了黄色,橙色和一抹棕色.上面印有欧洲联盟的旗帜"
	singular_name = "50 Euro note"
	icon_state = "50euro"
	amount = 1
	value = 50

/obj/item/stack/money/european/euro100
	name = "100欧元纸币"
	desc = "一张100欧元纸币,描绘了巴洛克和洛可可风格的桥梁和拱门/门廊,混合了绿色和黄色.上面印有欧洲联盟的旗帜"
	singular_name = "100 Euro note"
	icon_state = "100euro"
	amount = 1
	value = 100

/obj/item/stack/money/european/euro200
	name = "200欧元纸币"
	desc = "一张200欧元纸币,描绘了新艺术风格的桥梁和拱门/门廊,混合了黄色,一些蓝色和一些棕色.上面印有欧洲联盟的旗帜"
	singular_name = "200 Euro note"
	icon_state = "200euro"
	amount = 1
	value = 200

/obj/item/stack/money/european/euro500
	name = "500欧元纸币"
	desc = "一张500欧元纸币,描绘了现代建筑风格的桥梁和拱门/门廊,混合了紫色和一抹金色.上面印有欧洲联盟的旗帜"
	singular_name = "500 Euro note"
	icon_state = "500euro"
	amount = 1
	value = 500

/obj/item/stack/money/european/New()
	update_icon()
	return ..()

/obj/item/stack/money/european/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "[initial(icon_state)][icon_suffix]"

/obj/item/stack/money/asian/New()
	update_icon()
	return ..()

/obj/item/stack/money/asian/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "[initial(icon_state)][icon_suffix]"

/obj/item/stack/money/fictional/New()
	update_icon()
	return ..()

/obj/item/stack/money/fictional/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "[initial(icon_state)][icon_suffix]"

/obj/item/stack/money/yen
	name = "日元"
	desc = "一枚日本1日元硬币."
	singular_name = "yen"
	icon_state = "yen"
	amount = 1
	value = 0.01
	max_amount = 2500
	flags = CONDUCT

/obj/item/stack/money/yen/New()
	update_icon()
	return ..()

/obj/item/stack/money/yen/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (2)
			icon_suffix = "_2"
		if (3)
			icon_suffix = "_3"
		if (4)
			icon_suffix = "_4"
		if (5)
			desc = "A japanese 5 yen coin"
			icon_suffix = "_5"
		if (6)
			icon_suffix = "_6"
		if (7 to 9)
			icon_suffix = "_7"
		if (10 to 49)
			desc = "A japanese 10 yen coin"
			icon_suffix = "_10"
		if (50 to 99)
			desc = "A japanese 50 yen coin"
			icon_suffix = "_50"
		if (100 to 499)
			desc = "A japanese 100 yen coin"
			icon_suffix = "_100"
		if (500)
			desc = "A japanese 500 yen coin"
			icon_suffix = "_500"
		if (501 to INFINITY)
			desc = "A japanese 500 yen coin with some other Yen coins."
			icon_suffix = "_500+"
	icon_state = "yen[icon_suffix]"

/obj/item/stack/money/dollar
	name = "西班牙元"
	desc = "一种银币,也称为八里亚尔币,价值8里亚尔."
	singular_name = "dollar"
	icon_state = "5dollar"
	amount = 1
	value = 8
	flags = CONDUCT

/obj/item/stack/money/dollar/New()
	if (map && map.ordinal_age >= 4)
		if (map.ID == MAP_KANDAHAR)
			name = "1 Dollar Bill"
			desc = "Paper bank note valued at 1 dollar."
			singular_name = "1 Dollar Bill"
			icon_state = "dollar"
			value = 1
			novariants = FALSE
			flags = FALSE
			update_icon()
			return ..()
		else
			name = "5 Dollar Bills"
			desc = "Paper bank note valued at five dollars."
			singular_name = "5 Dollar Bill"
			icon_state = "5dollar"
			value = 20
			novariants = FALSE
			flags = FALSE
			update_icon()
			return ..()
	else if (map.ordinal_age == 3)
		name = "spanish dollars"
		desc = "A silver coin, also called piece of eight, worth 8 reales."
		singular_name = "dollar"
		icon_state = "silvercoin_pile"
		value = 8
		return ..()
	else
		name = "kreuzers"
		desc = "A silver coin, worth 4 pfennig."
		singular_name = "kreuzer"
		icon_state = "silvercoin_pile"
		value = 4
		return ..()

/obj/item/stack/money/dollar100
	name = "100美元钞票"
	desc = "面值为一百美元的纸币"
	singular_name = "100 Dollar note"
	icon_state = "100dollar"
	value = 100
	amount = 1

/obj/item/stack/money/dollar100/New()
	update_icon()
	return ..()

/obj/item/stack/money/dollar100/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "50"
		if (100 to 299)
			icon_suffix = "100"
		if (300 to 499)
			icon_suffix = "300"
		if (500 to INFINITY)
			icon_suffix = "500"
	icon_state = "100dollar[icon_suffix]"
	//TO-DO: Check if the parent update_icon proc has to be called

/obj/item/stack/money/escudo
	name = "西班牙埃斯库多"
	desc = "一种金币.价值16里亚尔."
	singular_name = "coin"
	icon_state = "escudo"
	amount = 1
	value = 16

	flags = CONDUCT
/obj/item/stack/money/escudo/New()
	update_icon()
	return ..()

/obj/item/stack/money/escudo/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "escudo[icon_suffix]"

/obj/item/stack/money/doubloon
	name = "西班牙多布隆"
	desc = "一种大金币,是流通中最大的金币.价值32里亚尔."
	singular_name = "coin"
	icon_state = "dobloon"
	amount = 1
	value = 32
	flags = CONDUCT

/obj/item/stack/money/doubloon/New()
	update_icon()
	return ..()

/obj/item/stack/money/doubloon/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "dobloon[icon_suffix]"

/obj/item/stack/money/goldnugget
	name = "金块"
	desc = "一块闪亮的金块."
	singular_name = "nugget"
	icon_state = "goldnugget"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 5
	throw_range = 7
	amount = 1
	max_amount = 3
	value = 96
	flags = CONDUCT

/obj/item/cursedtreasure
	name = "被诅咒的宝藏"
	desc = "一件土著珠宝,散发着奇异的光芒..."
	icon_state = "goldstuff1"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 5
	throw_range = 7
	value = 0
	flags = CONDUCT
/obj/item/cursedtreasure/New()
	..()
	icon_state = "goldstuff[rand(1,3)]"

/obj/structure/oil_deposits
	name = "石油矿藏"
	desc = "此矿藏目前还没有主人."
	icon = 'icons/obj/structures.dmi'
	icon_state = "nboard_oil"
	anchored = TRUE
	opacity = FALSE
	density = TRUE
	flammable = FALSE
	var/storedvalue = 0
	var/faction = null
	var/health = 200
	not_movable = FALSE
	not_disassemblable = TRUE
/obj/structure/oil_deposits/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	switch(W.damtype)
		if ("fire")
			health -= W.force * TRUE
		if ("brute")
			health -= W.force * 0.5
	playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
	user.do_attack_animation(src)
	try_destroy()
	..()

/obj/structure/oil_deposits/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>[src]碎成了碎片!</span>")
		qdel(src)
		return

/obj/structure/oil_deposits/New()
	..()
	check_value()

/obj/structure/oil_deposits/proc/check_value()
	storedvalue = 0
	for (var/obj/item/weapon/reagent_containers/glass/barrel/BB in range(1, src))
		storedvalue += BB.reagents.get_reagent_amount("petroleum")
	if (faction)
		desc = "Belongs to the [faction]. Stored oil: [storedvalue]."
	spawn(600) // 1 minute
		check_value()

/obj/structure/oil_deposits/attack_hand(mob/living/human/user as mob)
	if (user.civilization == "none")
		to_chat(user, "你不属于任何阵营!")
		return
	else if (faction == null)
		faction = user.civilization
		desc = "Belongs to the [faction]. Stored oil: [storedvalue]."
		to_chat(user, "你将石油矿藏的阵营设为[faction].")
		return
	else
		..()

/obj/item/stack/money/goldvaluables
	name = "黄金贵重品"
	desc = "一堆贵重物品."
	singular_name = "gold valuable"
	icon_state = "goldstuff1"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 5
	throw_range = 7
	amount = 1
	max_amount = 5
	value = 48
	flags = CONDUCT

/obj/item/stack/money/goldvaluables/New()
	..()
	icon_state = "goldstuff[rand(1,3)]"

/obj/item/stack/money/gems
	name = "宝石"
	desc = "各式各样的珍贵宝石."
	singular_name = "gem"
	icon_state = "gem1"
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 5
	throw_range = 7
	amount = 1
	max_amount = 8
	value = 35

/obj/item/stack/money/gems/New()
	..()
	icon_state = "gem[rand(1,2)]"

/obj/item/stack/money/pearls
	name = "珍珠"
	desc = "一堆珍珠.看起来很值钱!"
	singular_name = "nugget"
	icon_state = "pearls1"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 4
	throw_range = 8
	amount = 1
	max_amount = 8
	value = 45

/obj/item/stack/money/pearls/New()
	..()
	icon_state = "pearls[rand(1,2)]"

/obj/item/stack/money/coppercoin
	name = "铜币"
	desc = "一枚小铜币.价值1/10枚银币或1/40枚金币."
	singular_name = "copper coin"
	icon_state = "coppercoin_pile"
	amount = 1
	value = 0.1
	flags = CONDUCT

/obj/item/stack/money/coppercoin/New()
	update_icon()
	return ..()

/obj/item/stack/money/coppercoin/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "coppercoin_pile[icon_suffix]"

/obj/item/stack/money/coppercoin/twohundred
	amount = 20

/obj/item/stack/money/silvercoin
	name = "银币"
	desc = "一枚小银币.价值1/4枚金币或10枚铜币."
	singular_name = "silver coin"
	icon_state = "silvercoin_pile"
	amount = 1
	value = 1
	flags = CONDUCT

/obj/item/stack/money/silvercoin/New()
	update_icon()
	return ..()

/obj/item/stack/money/silvercoin/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 49)
			icon_suffix = ""
		if (50 to 99)
			icon_suffix = "_2"
		if (100 to 299)
			icon_suffix = "_3"
		if (300 to 499)
			icon_suffix = "_4"
		if (500 to INFINITY)
			icon_suffix = "_5"
	icon_state = "silvercoin_pile[icon_suffix]"

/obj/item/stack/money/silvercoin/twenty
	amount = 20

/obj/item/stack/money/silvercoin/twohundred
	amount = 200

/obj/item/stack/money/goldcoin
	name = "金币"
	desc = "一枚小金币.价值4枚银币或40枚铜币."
	singular_name = "gold coin"
	icon_state = "goldcoin_pile"
	amount = 1
	value = 4
	flags = CONDUCT

/obj/item/stack/money/goldcoin/New()
	update_icon()
	return ..()

/obj/item/stack/money/goldcoin/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 124)
			icon_suffix = ""
		if (125 to 249)
			icon_suffix = "_2"
		if (250 to 374)
			icon_suffix = "_3"
		if (375 to INFINITY)
			icon_suffix = "_4"
	icon_state = "goldcoin_pile[icon_suffix]"

/obj/item/stack/money/bitcoin
	name = "比特币"
	desc = "一枚实体比特币."
	singular_name = "bitcoin"
	icon_state = "bitcoin"
	amount = 1
	value = 5000

/obj/item/stack/money/real/five
	amount = 5
/obj/item/stack/money/real/ten
	amount = 10
/obj/item/stack/money/real/fifteen
	amount = 15
/obj/item/stack/money/real/twenty
	amount = 20
/obj/item/stack/money/real/fifty
	amount = 50

/obj/item/stack/money/dollar/twenty
	amount = 20
/obj/item/stack/money/dollar/ten
	amount = 10
/obj/item/stack/money/escudo/ten
	amount = 10
/obj/item/stack/money/doubloon/ten
	amount = 10
/obj/item/stack/money/dollar/onehundy
	amount = 100
/obj/item/stack/money/dollar/five
	amount = 5

/////////////////////////SKYRIM/////////////////////////////

/obj/item/stack/money/septim
	name = "塞普蒂姆"
	desc = "一枚 septim 硬币."
	singular_name = "septim"
	icon_state = "septim"
	amount = 1
	value = 1
	max_amount = 500
	flags = CONDUCT

/obj/item/stack/money/septim/New()
	if(amount == 2)
		icon_state = "septim_2"
	if(amount == 3)
		icon_state = "septim_3"
	if(amount == 4)
		icon_state = "septim_4"
	if(amount == 5)
		icon_state = "septim_5"
	if(amount == 6)
		icon_state = "septim_6"
	if(amount >= 7)
		icon_state = "septim_7"
	if(amount >= 10)
		icon_state = "septim_10"
	if(amount >= 50)
		icon_state = "septim_50"
	if(amount >= 100)
		icon_state = "septim_100"
	if(amount == 500)
		icon_state = "septim_500"
	if(amount > 500)
		icon_state = "septim_500+"
	update_icon()
	return ..()

/obj/item/stack/money/septim/update_icon()
	if(amount == 2)
		icon_state = "septim_2"
	if(amount == 3)
		icon_state = "septim_3"
	if(amount == 4)
		icon_state = "septim_4"
	if(amount == 5)
		icon_state = "septim_5"
	if(amount == 6)
		icon_state = "septim_6"
	if(amount >= 7)
		icon_state = "septim_7"
	if(amount >= 10)
		icon_state = "septim_10"
	if(amount >= 50)
		icon_state = "septim_50"
	if(amount >= 100)
		icon_state = "septim_100"
	if(amount == 500)
		icon_state = "septim_500"
	if(amount > 500)
		icon_state = "septim_500+"
	..()
