/* Index*/

/* 1 - Coldwar Coats
   2 - Cold War Accessories
   3 - FBI & Law Enforcement Clothes
   4 - US Army Clothes
   5 - US Army Helmets
   6 - Ghillie Suits
   7 - Cold War Hats
   8 - Vietcong Clothes
   9 - Cold War Armor
   10 - Cold War Belts
   11 - Cold War Balaclavas
   12 - Cold War Webbing
   13 - NBC &  Hazmat Suits
   14 - Astronaut Suit and Helmet
   15 - Miscallaneous
   15a - John Toughguy - Jungle Commando
   15b - Swinging Sixties
   15c - Other Miscallaneous */

/* Coldwar Coats*/

/obj/item/clothing/suit/storage/coat/modern_winter
	name = "深绿色冬季大衣"
	desc = "一件军装风格的大衣,橄榄褐色。"
	icon_state = "modern_winter"
	item_state = "modern_winter"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 75

/obj/item/clothing/suit/storage/coat/oldyjacket
	name = "红色夹克"
	desc = "一件80年代的红色夹克。"
	icon_state = "jacket80s"
	item_state = "jacket80s"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/chinese
	name = "中式大衣"
	desc = "一件中式冬季大衣。"
	icon_state = "chi_korea_coat"
	item_state = "chi_korea_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 75

/obj/item/clothing/suit/storage/coat/chinese/officer
	name = "中国军官大衣"
	desc = "一件中式冬季大衣,为军官设计。"
	icon_state = "chi_korea_offcoat"
	item_state = "chi_korea_offcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)

/obj/item/clothing/suit/storage/coat/american
	name = "美国大衣"
	desc = "一件美式冬季外套."
	icon_state = "us_coat_korea"
	item_state = "us_coat_korea"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)

/obj/item/clothing/suit/storage/jacket/afghanka
	name = "阿富汗卡外套"
	desc = "一件于80年代初配发并研制的苏联冬季夹克."
	icon_state = "winter_afghanka"
	item_state = "winter_afghanka"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)


/* Cold War Accessories*/

/obj/item/clothing/mask/facecamo
	name = "丛林迷彩面绘"
	desc = "丛林迷彩图案的面部涂装."
	icon_state = "painting_woodland"
	item_state = "painting_woodland"
	blocks_scope = FALSE

/* FBI & Law Enforcement Clothes*/

/obj/item/clothing/suit/storage/fbi
	name = "FBI夹克"
	desc = "一件也许是FBI的机密夹克."
	icon_state = "fbi2"
	item_state = "fbi2"

/obj/item/clothing/suit/storage/atf
	name = "ATF夹克"
	desc = "一件ATF夹克,ATF探员的制式配发品."
	icon_state = "atf"
	item_state = "atf"

/obj/item/clothing/suit/storage/dea
	name = "DEA夹克"
	desc = "一件DEA夹克,DEA探员的制式配发品."
	icon_state = "dea"
	item_state = "dea"

/obj/item/clothing/suit/storage/jacket/forensics
	name = "法医夹克"
	desc = "一件法医部门的夹克."
	icon_state = "forensics"
	item_state = "forensics"

/obj/item/clothing/suit/storage/jacket/police
	name = "警察夹克"
	desc = "一件警察夹克."
	icon_state = "policejacket"
	item_state = "policejacket"
	var/closed = TRUE

/obj/item/clothing/suit/storage/jacket/police/New()
	..()
	if (map.ID == MAP_THE_ART_OF_THE_DEAL)
		name = "sheriff's office jacket"

/obj/item/clothing/suit/storage/jacket/police/verb/toggle()
	set category = null
	set src in usr
	set name = "Adjust jacket"
	if (type != /obj/item/clothing/suit/storage/jacket/police)
		return
	else
		if(closed)
			item_state = "policejacket_open"
			icon_state = "policejacket_open"
			item_state_slots["w_uniform"] = "policejacket_open"
			to_chat(usr, "你<b>敞开</b>你的夹克.")
			closed = FALSE
			update_clothing_icon()
		else if (!closed)
			item_state = "policejacket"
			icon_state = "policejacket"
			item_state_slots["w_uniform"] = "policejacket"
			to_chat(usr, "你<b>拉上</b>你的夹克.")
			closed = TRUE
			update_clothing_icon()

/obj/item/clothing/suit/storage/jacket/police/black
	name = "警察夹克"
	desc = "一件黑色警察夹克."
	icon_state = "policejacket_black"
	item_state = "policejacket_black"
	closed = TRUE

/obj/item/clothing/suit/storage/jacket/police/black/toggle()
	set category = null
	set src in usr
	set name = "Adjust jacket"
	if (type != /obj/item/clothing/suit/storage/jacket/police/black)
		return
	else
		if(closed)
			item_state = "policejacket_black_open"
			icon_state = "policejacket_black_open"
			item_state_slots["w_uniform"] = "policejacket_open"
			to_chat(usr, "你<b>敞开</b>你的夹克.")
			closed = FALSE
			update_clothing_icon()
		else if (!closed)
			item_state = "policejacket_black"
			icon_state = "policejacket_black"
			item_state_slots["w_uniform"] = "policejacket_black"
			to_chat(usr, "你<b>拉上</b>你的夹克.")
			closed = TRUE
			update_clothing_icon()

/obj/item/clothing/suit/swat //these likely need upgrading to armor
	name = "特警重型防弹衣"
	desc = "一件NIJ IV级重型防弹衣,供特警警官使用."
	icon_state = "swat"
	item_state = "swat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 70, arrow = 80, gun = 78, energy = 40, bomb = 20, bio = 44, rad = 40)
	var/slots = 6
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/swat_new
	name = "特警防弹衣"
	desc = "一件NIJ IV级重型防弹衣,供特警警官使用."
	icon_state = "policevest"
	item_state = "policevest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 70, arrow = 80, gun = 78, energy = 40, bomb = 20, bio = 44, rad = 40)
	var/slots = 6
	ripable = FALSE
	ripable = FALSE

/obj/item/clothing/suit/police
	name = "警察防弹衣"
	desc = "一件警察防弹衣(III级)."
	icon_state = "policevest"
	item_state = "policevest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 20, gun = 74, energy = 40, bomb = 20, bio = 32, rad = 20)
	var/slots = 3
	ripable = FALSE

/obj/item/clothing/under/traffic_police
	name = "警察制服"
	desc = "一套由蓝色应急服务衬衫和牛仔长裤组成的制服.上面附有一枚警徽"
	icon_state = "traffic_cop"
	item_state = "traffic_cop"

/obj/item/clothing/under/traffic_police/supervisor
	name = "警察主管制服"
	desc = "一套由蓝色应急服务衬衫和牛仔长裤组成的制服.上面附有一枚警司徽章"
	icon_state = "traffic_cop_sup"
	item_state = "traffic_cop_sup"

/obj/item/clothing/under/countysheriff
	name = "治安官部门治安官制服"
	desc = "一套由镇上治安官穿着的执法制服."
	icon_state = "sd_sheriff"
	item_state = "sd_sheriff"

/obj/item/clothing/under/countysheriff/deputy
	name = "治安官部门副手制服"
	desc = "一套由镇上副治安官穿着的执法制服."
	icon_state = "sd_deputy"
	item_state = "sd_deputy"

/obj/item/clothing/under/countysheriff/deputy/short
	name = "治安官部门副手制服"
	desc = "一套由镇上副治安官穿着的执法制服.短袖版本."
	icon_state = "sd_deputy_shortsleeves"
	item_state = "sd_deputy_shortsleeves"

/obj/item/clothing/head/countysheriff_hat
	name = "治安官斯特拉顿帽"
	desc = "一顶由镇上治安官部门执法人员佩戴的斯特拉顿帽."
	icon_state = "sd_sheriffhat"
	item_state = "sd_sheriffhat"

/obj/item/clothing/head/countysheriff_cap
	name = "治安官部门棒球帽"
	desc = "一顶由镇上治安官部门执法人员佩戴的棒球帽."
	icon_state = "sd_cap"
	item_state = "sd_cap"

/obj/item/clothing/head/countysheriff_cap/black
	name = "治安官部门棒球帽"
	desc = "一顶由镇上治安官部门执法人员佩戴的棒球帽.黑色版本."
	icon_state = "sd_cap_black"
	item_state = "sd_cap_black"

/obj/item/clothing/head/traffic_police
	name = "警察帽"
	desc = "一顶常由警察和保安人员佩戴的蓝色帽子."
	icon_state = "traffic_cop"
	item_state = "traffic_cop"

/obj/item/clothing/head/beret_red
	name = "红色贝雷帽"
	desc = "一顶红色贝雷帽."
	icon_state = "beret_red"
	item_state = "beret_red"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_black
	name = "黑色贝雷帽"
	desc = "一顶黑色军用贝雷帽."
	icon_state = "beret_black"
	item_state = "beret_black"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_black/insig
	name = "黑色贝雷帽"
	desc = "一顶带有金色徽章的黑色贝雷帽."
	icon_state = "beret_black_insig"
	item_state = "beret_black_insig"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_green
	name = "绿色贝雷帽"
	desc = "一顶绿色贝雷帽."
	icon_state = "beret_green"
	item_state = "beret_green"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_green/insig
	name = "绿色贝雷帽"
	desc = "一顶带有金色徽章的绿色贝雷帽."
	icon_state = "beret_green_insig"
	item_state = "beret_green_insig"
	body_parts_covered = HEAD

/* US Army Clothes*/

/obj/item/clothing/under/us_uni
	name = "OG-107制服"
	desc = "20世纪中期美军的标准制服."
	icon_state = "us_uni_og107"
	item_state = "us_uni_og107"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/us_camo
	name = "丛林迷彩制服"
	desc = "于80年代初采用的美军标准迷彩制服.至今仍被许多国家使用."
	icon_state = "us_camo"
	item_state = "us_camo"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/us_uni/us_greentrousers
	name = "OG-107长裤"
	desc = "美军标准OG-107制服长裤."
	icon_state = "us_greentrousers_og107"
	item_state = "us_greentrousers_og107"
	body_parts_covered = LOWER_TORSO|LEGS

/obj/item/clothing/under/us_uni/us_lightuni
	name = "卷袖OG-107制服"
	desc = "美军OG-107制服的卷袖版本."
	icon_state = "us_uni_og107_rolled"
	item_state = "us_uni_og107_rolled"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/us_uni/us_lightuni2
	name = "OG-107长裤和卡其色内衣"
	desc = "美军OG-107长裤和军装卡其色内衣的轻便版本."
	icon_state = "us_og107_lightuni"
	item_state = "us_og107_lightuni"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/us_uni/us_lightuni3
	name = "OG-107长裤和白色内衣"
	desc = "美军OG-107长裤和军装白色不束入内衣的轻便版本."
	icon_state = "us_og107_lightuni2"
	item_state = "us_og107_lightuni2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/us_uni/us_tigerstripes
	name = "虎纹迷彩制服"
	desc = "一件虎纹图案的迷彩制服."
	icon_state = "us_camo_tigerstripes"
	item_state = "us_camo_tigerstripes"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/storage/us_jacket
	name = "橄榄绿夹克"
	desc = "20世纪中期美军标准的橄榄绿夹克."
	icon_state = "us_jacket"
	item_state = "us_jacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
//korean war//
/obj/item/clothing/under/us_uni_korean
	name = "美军制服"
	desc = "朝鲜战争的美军标准制服,这一件为冬季配置."
	icon_state = "usuni_korea"
	item_state = "usuni_korea"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/chinese_winter
	name = "中国制服"
	desc = "标准的中国冬季制服."
	icon_state = "korea_china"
	item_state = "korea_china"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT


/* US Army Armor & Helmets*/

/obj/item/clothing/head/helmet/modern/ushelmet
	name = "M1头盔"
	desc = "典型的美国陆军头盔."
	icon_state = "m1_standard"
	item_state = "m1_standard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 15, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 24

/obj/item/clothing/head/helmet/modern/ushelmet/un
	name = "UN头盔"
	desc = "典型的蓝色联合国头盔."
	icon_state = "unitednations"
	item_state = "unitednations"
	flash_protection = FLASH_PROTECTION_MODERATE
/obj/item/clothing/head/helmet/modern/ushelmet/un/medic
	name = "UN医疗兵头盔"
	desc = "典型的蓝色联合国头盔, 带有医疗兵标记."
	icon_state = "unitednations_medic"
	item_state = "unitednations_medic"
/obj/item/clothing/head/un_beret
	name = "UN贝雷帽"
	desc = "一顶蓝色联合国贝雷帽."
	icon_state = "unitednations_beret"
	item_state = "unitednations_beret"

/obj/item/clothing/head/helmet/modern/ushelmet/sgt
	name = "M1头盔 少尉"
	desc = "典型的美国陆军头盔. 带有少尉标记."
	icon_state = "m1_2nd_lt"
	item_state = "m1_2nd_lt"

/obj/item/clothing/head/helmet/modern/ushelmet/lt
	name = "M1头盔 中尉"
	desc = "典型的美国陆军头盔. 带有中尉标记."
	icon_state = "m1_1st_lt"
	item_state = "m1_1st_lt"

/obj/item/clothing/head/helmet/modern/ushelmet/camo
	name = "M1迷彩头盔"
	desc = "典型的美国陆军头盔. 带有米切尔迷彩罩."
	icon_state = "m1_camo_mitchell"
	item_state = "ushelmet_camo"

/obj/item/clothing/head/helmet/modern/ushelmet/camo/accessory/New()
	..()
	var/numb = rand(0,1)
	var/list/optlist = list("card","bullets","cigpack","peace","text")
	if (numb > 0)
		for (var/i = 1, i <= numb, i++)
			var/chosen = pick(optlist)
			attachments += chosen
			optlist -= chosen

/obj/item/clothing/head/helmet/modern/ushelmet/late/New()
	..()
	var/numb = rand(0,2)
	var/list/optlist = list("card","bullets","cigpack","peace","text")
	if (numb > 0)
		for (var/i = 1, i <= numb, i++)
			var/chosen = pick(optlist)
			attachments += chosen
			optlist -= chosen

/obj/item/clothing/head/helmet/modern/ushelmet/camo/lt
	name = "M1迷彩头盔"
	desc = "典型的美国陆军头盔. 带有米切尔迷彩罩."
	icon_state = "m1_camo_mitchell_lt"
	item_state = "ushelmet_camo_lt"

/obj/item/clothing/head/helmet/modern/ushelmet/crewman
	name = "CVC头盔"
	desc = "车组人员标准配发的头盔."
	icon_state = "cvc_helmet"
	item_state = "cvc_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 60, arrow = 75, gun = 50, energy = 15, bomb = 70, bio = 20, rad = FALSE)

/* Korean war Helmets */
/obj/item/clothing/head/helmet/korean/usm1
	name = "M1头盔"
	desc = "美国陆军典型的圆钢盔."
	icon_state = "korea_m1_standard"
	item_state = "korea_m1_standard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/usm1/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/rope))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你在头盔上装了网罩.</span>")
		new/obj/item/clothing/head/helmet/korean/ustannet(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/korean/ustannet
	name = "带网罩的M1头盔"
	desc = "美国陆军典型的圆钢盔, 带有棕褐色网罩."
	icon_state = "korea_m1_tan_netting"
	item_state = "korea_m1_tan_netting"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/ustannet/verb/toggle_color()
	set category = null
	set src in usr
	set name = "Toggle Color"
	if (color)
		icon_state = "korea_m1_tan_netting"
		item_state = "korea_m1_tan_netting"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m1_tan_netting"
		to_chat(usr, "<span class = 'danger'>你把棕褐色网罩换成了绿色网罩.</span>")
		update_icon()
		color = FALSE
		usr.update_inv_head(1)
	else if (!color)
		icon_state = "korea_m1_green_netting"
		item_state = "korea_m1_green_netting"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m1_green_netting"
		to_chat(usr, "<span class = 'danger'>你把绿色网罩换成了棕褐色网罩.</span>")
		update_icon()
		color = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/korean/usgreennet
	name = "带绿色网罩的M1头盔"
	desc = "美国陆军典型的圆钢盔, 带有绿色网罩."
	icon_state = "korea_m1_green_netting"
	item_state = "korea_m1_green_netting"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/us_medic
	name = "M1医疗兵头盔"
	desc = "美国陆军典型的圆钢盔, 这顶是给医疗兵用的"
	icon_state = "korea_m1_medic"
	item_state = "korea_m1_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/us_2lt
	name = "M1少尉头盔"
	desc = "美国陆军典型的圆钢盔, 这顶带有少尉军衔."
	icon_state = "korea_m1_2nd_lt"
	item_state = "korea_m1_2nd_lt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/us_1lt
	name = "M1中尉头盔"
	desc = "美国陆军典型的圆钢盔, 这顶带有中尉军衔."
	icon_state = "korea_m1_1st_lt"
	item_state = "korea_m1_1st_lt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/korean/us_cap
	name = "M1上尉头盔"
	desc = "美国陆军典型的圆钢盔, 这顶带有上尉军衔."
	icon_state = "korea_m1_cpt"
	item_state = "korea_m1_cpt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/* Ghillie Suits*/

/obj/item/clothing/suit/storage/ghillie
	name = "吉利服"
	desc = "一件迷彩吉利服."
	icon_state = "ghillie"
	item_state = "ghillie"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS|FEET
	armor = list(melee = 12, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = FALSE)
	value = 100

/obj/item/clothing/head/ghillie
	name = "吉利服头罩"
	desc = "吉利服的头罩."
	icon_state = "ghillie"
	item_state = "ghillie"
	body_parts_covered = HEAD
	restricts_view = 1

/obj/item/clothing/suit/storage/ghillie/winter
	name = "冬季吉利服"
	desc = "一件迷彩冬季吉利服."
	icon_state = "ghillie_winter"
	item_state = "ghillie_winter"

/obj/item/clothing/head/ghillie/winter
	name = "冬季吉利服头罩"
	desc = "冬季吉利服的头罩."
	icon_state = "ghillie_winter"
	item_state = "ghillie_winter"

/* Cold War Hats*/

/obj/item/clothing/head/jungle_hat
	name = "黑色奔尼帽"
	desc = "一顶宽檐软质丛林帽."
	icon_state = "black_boonie"
	item_state = "black_boonie"
	body_parts_covered = HEAD

/obj/item/clothing/head/jungle_hat/khaki
	name = "卡其色奔尼帽"
	desc = "一顶宽檐软质丛林帽."
	icon_state = "khaki_boonie"
	item_state = "khaki_boonie"
	body_parts_covered = HEAD

/obj/item/clothing/head/jungle_hat/og107
	name = "橄榄绿奔尼帽"
	desc = "一顶宽檐软质丛林帽."
	icon_state = "og107_boonie"
	item_state = "og107_boonie"
	body_parts_covered = HEAD

/obj/item/clothing/head/rice_hat
	name = "斗笠"
	desc = "一顶宽檐农夫斗笠."
	icon_state = "rice_hat"
	item_state = "rice_hat"
	body_parts_covered = HEAD

/obj/item/clothing/head/chinese_ushanka
	name = "中国护耳冬帽"
	desc = "一顶中国护耳冬帽, 供中国军队士兵使用."
	icon_state = "chinese_ushanka_up"
	item_state = "chinese_ushanka_up"
	cold_protection = HEAD

/obj/item/clothing/head/chinese_ushanka/down
	icon_state = "chinese_ushanka"
	item_state = "chinese_ushanka"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/chinese_ushanka/attack_self(mob/user as mob)
	if (icon_state == "chinese_ushanka")
		icon_state = "chinese_ushanka_up"
		item_state = "chinese_ushanka_up"
		to_chat(user, "你竖起了护耳冬帽的耳罩.")
	else if (icon_state == "chinese_ushanka_up")
		icon_state = "chinese_ushanka"
		item_state = "chinese_ushanka"
		flags_inv = BLOCKHEADHAIR
		to_chat(user, "你放下了护耳冬帽的耳罩.")

/obj/item/clothing/head/helmet/modern/chi_korea_helmet
	name = "中国头盔"
	desc = "一顶改装后供中国人民解放军使用的遗留日本头盔."
	icon_state = "chi_korea_helm"
	item_state = "chi_korea_helm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 45, gun = 15, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 24

/obj/item/clothing/head/helmet/modern/chi_korea_helmet/modernized
	name = "中国头盔"
	desc = "一顶中国人民解放军使用的钢盔."
	icon_state = "chi_korea_helm"
	item_state = "chi_korea_helm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 45, gun = 35, energy = 25, bomb = 55, bio = 20, rad = FALSE)
	health = 100

/obj/item/clothing/head/helmet/modern/chi_korea_helmet/modernized/winter
	name = "白色中国头盔"
	icon_state = "chi_whitehelm"
	item_state = "chi_whitehelm"

/obj/item/clothing/head/helmet/modern/chi_korea_helmet/modernized/med
	name = "中国医疗兵头盔"
	desc = "一顶中国人民解放军医疗兵使用的钢盔."
	icon_state = "chi_med"
	item_state = "chi_med"

/obj/item/clothing/head/nva_hat
	name = "北越军帽"
	desc = "一顶带有北越军官标记的野战帽."
	icon_state = "nva_off_cap"
	item_state = "nva_off_cap"
	body_parts_covered = HEAD

/obj/item/clothing/head/sov_ushanka_new
	name = "苏联护耳冬帽"
	desc = "一顶苏联护耳冬帽, 供红军士兵使用."
	icon_state = "ushanka_new_up"
	item_state = "ushanka_new_up"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/sov_ushanka_new/down
	icon_state = "ushanka_new"
	item_state = "ushanka_new"

/obj/item/clothing/head/sov_ushanka_new/attack_self(mob/user as mob)
	if (icon_state == "ushanka_new")
		icon_state = "ushanka_new_up"
		item_state = "ushanka_new_up"
		to_chat(user, "你竖起了护耳冬帽的耳罩.")
	else
		icon_state = "ushanka_new"
		item_state = "ushanka_new"
		to_chat(user, "你放下了护耳冬帽的耳罩.")

/obj/item/clothing/head/ww2/nkvd_cap/kgb
	name = "克格勃帽"
	desc = "一顶克格勃戴的帽子."
	icon_state = "nkvd_cap"
	item_state = "nkvd_cap"

/obj/item/clothing/head/coldwar/soviet_officer
	name = "苏联军官帽"
	desc = "一顶苏联军官戴的帽子."
	icon_state = "sov_officercap2"
	item_state = "sov_officercap2"

/obj/item/clothing/head/coldwar/cafr_officer
	name = "CAFR军官帽"
	desc = "一顶CAFR军官戴的帽子."
	icon_state = "cafr_officercap"
	item_state = "cafr_officercap"

/obj/item/clothing/head/fieldcap/afghanka
	name = "阿富汗卡野战帽"
	desc = "1980年代配发给苏联军队的野战帽."
	icon_state = "fieldcap_afghanka"
	item_state = "fieldcap_afghanka"
	body_parts_covered = HEAD
	cold_protection = HEAD

/obj/item/clothing/head/beret_rus_vdv
	name = "VDV贝雷帽"
	desc = "苏联和俄罗斯空降兵佩戴的贝雷帽."
	icon_state = "beret_rus_vdv"
	item_state = "beret_rus_vdv"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_rus_vdv/modern
	name = "VDV贝雷帽"
	desc = "俄罗斯空降兵佩戴的贝雷帽."
	icon_state = "beret_rus_vdv_modern"
	item_state = "beret_rus_vdv_modern"

/obj/item/clothing/head/beret_rus_spez
	name = "Spetznaz贝雷帽"
	desc = "Spetznaz佩戴的贝雷帽."
	icon_state = "beret_rus_spez"
	item_state = "beret_rus_spez"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_blugoslavia
	name = "Blugoslavian贝雷帽"
	desc = "Blugoslavian军官佩戴的贝雷帽."
	icon_state = "beret_rus_vdv"
	item_state = "beret_rus_vdv"
	body_parts_covered = HEAD

/obj/item/clothing/head/beret_redmenia
	name = "Redmenian贝雷帽"
	desc = "Redmenian军官佩戴的贝雷帽."
	icon_state = "beret_rus_spez"
	item_state = "beret_rus_spez"
	body_parts_covered = HEAD

/obj/item/clothing/head/cap_blugoslavia
	name = "Blugoslavian海军帽"
	desc = "Blugoslavian海军部队军官佩戴的帽子."
	icon_state = "blugoslavia_cap"
	item_state = "blugoslavia_cap"
	body_parts_covered = HEAD

/obj/item/clothing/head/cap_redmenia
	name = "Redmenian海军帽"
	desc = "Redmenian帝国海军军官佩戴的帽子."
	icon_state = "redmenia_cap"
	item_state = "redmenia_cap"
	body_parts_covered = HEAD

/obj/item/clothing/head/ww2/us_sailor_hat/blugoslavia
	name = "Blugoslavian水兵帽"
	desc = "Blugoslavian海军部队水兵佩戴的帽子."
	icon_state = "upapilotka"
	item_state = "upapilotka"
/obj/item/clothing/head/ww2/us_sailor_hat/redmenia
	name = "Redmenian水兵帽"
	desc = "Redmenian帝国海军水兵佩戴的帽子."

/* Vietcong Clothes*/

/obj/item/clothing/under/localnlf1
	name = "当地NLF制服"
	desc = "NLF的黑色制服."
	icon_state = "localnlfuniform_v1"
	item_state = "localnlfuniform_v1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/localnlf2
	name = "当地NLF制服"
	desc = "NLF的黑蓝色制服."
	icon_state = "localnlfuniform_v2"
	item_state = "localnlfuniform_v2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/localnlf3
	name = "当地NLF制服"
	desc = "NLF的黑卡其色制服."
	icon_state = "localnlfuniform_v3"
	item_state = "localnlfuniform_v3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/localnlf4
	name = "当地NLF制服"
	desc = "NLF的蓝卡其色制服."
	icon_state = "localnlfuniform_v4"
	item_state = "localnlfuniform_v4"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/localnlf5
	name = "当地NLF制服"
	desc = "NLF的灰色制服."
	icon_state = "localnlfuniform_v5"
	item_state = "localnlfuniform_v5"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/accessory/armband/khan_ran/black
	name = "khan ran围巾 (黑白)"
	desc = "传统的湄公河三角洲白灰格纹围巾."
	icon_state = "khan_ran_v1"
	item_state = "khan_ran_v1"
	slot = "decor"

/obj/item/clothing/accessory/armband/khan_ran/blue
	name = "khan ran围巾 (蓝白)"
	desc = "传统的湄公河三角洲白蓝格纹围巾."
	icon_state = "khan_ran_v2"
	item_state = "khan_ran_v2"
	slot = "decor"

/obj/item/clothing/accessory/storage/webbing/nlfsmallpouches
	name = "NLF小袋"
	desc = "绿色胸挂织带,带有多个小型袋."
	slots = 8
	icon_state = "nlfchestrig_v2"
	item_state = "nlfchestrig_v2"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,
			/obj/item/weapon/key,
			/obj/item/ammo_casing,
			/obj/item/ammo_magazine,
			/obj/item/weapon/grenade,
			/obj/item/weapon/attachment,
			/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/nlfsmallpouches/filled_sks/New()
	..()
	for (var/i=1; i <= 7; i++)
		new /obj/item/ammo_magazine/sks(hold)
	new /obj/item/stack/medical/bruise_pack/bint(hold)
/obj/item/clothing/accessory/storage/webbing/nlfsmallpouches/filled_mosin/New()
	..()
	for (var/i=1; i <= 7; i++)
		new /obj/item/ammo_magazine/mosin(hold)
	new /obj/item/stack/medical/bruise_pack/bint(hold)

/obj/item/clothing/accessory/storage/webbing/nlfchestrig
	name = "NLF胸挂"
	desc = "绿色胸挂织带,带有三个中型袋和两个小型袋."
	slots = 5
	icon_state = "nlfchestrig_v1"
	item_state = "nlfchestrig_v1"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,
			/obj/item/weapon/key,
			/obj/item/ammo_casing,
			/obj/item/ammo_magazine,
			/obj/item/weapon/grenade,
			/obj/item/weapon/attachment,
			/obj/item/weapon/gun/projectile/pistol,
			/obj/item/weapon/gun/projectile/revolver,
			/obj/item/weapon/handcuffs,
			/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
			/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/nlfchestrig/filled_akm/New()
	..()
	for (var/i=1; i <= 3; i++)
		new /obj/item/ammo_magazine/ak47(hold)
	new /obj/item/stack/medical/bruise_pack/bint(hold)
	if (prob(50))
		new /obj/item/weapon/grenade/smokebomb/rdg2(hold)
	else
		new /obj/item/weapon/grenade/modern/f1(hold)

/obj/item/clothing/under/nva
	name = "NVA制服"
	desc = "北越军队的卡其色制服."
	icon_state = "NVAuni"
	item_state = "NVAuni"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
/obj/item/clothing/under/nva/green
	desc = "北越军队的绿色制服."
	icon_state = "NVAuni_green"
	item_state = "NVAuni_green"
/obj/item/clothing/under/nva/sl
	name = "NVA中士制服"
	desc = "北越军队的卡其色制服. 这件带有中士军衔."
	icon_state = "NVAuni_sl"
	item_state = "NVAuni_sl"
/obj/item/clothing/under/nva/sl/green
	desc = "北越军队的绿色制服. 这件带有中士军衔."
	icon_state = "NVAuni_green_sl"
	item_state = "NVAuni_green_sl"
/obj/item/clothing/under/nva/officer
	name = "NVA军官制服"
	desc = "北越军队的卡其色制服. 这件带有军官军衔"
	icon_state = "NVAuni_off"
	item_state = "NVAuni_off"
/* Cold War Armor*/

/obj/item/clothing/accessory/armor //again im confused why this is the case. It should be moved somewhere higher up into armor.dm or/and tagged into /modern especially @fantasticfwoosh
	health = 20
	ripable = FALSE

/obj/item/clothing/accessory/armor/coldwar
	icon = 'icons/obj/clothing/ties.dmi'

/obj/item/clothing/accessory/armor/coldwar/get_mob_overlay()
	if (!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if (icon_override)
			if ("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]")
		else
			mob_overlay = image("icon" = 'icons/mob/ties.dmi', "icon_state" = "[tmp_icon_state]")
	return mob_overlay

/obj/item/clothing/accessory/armor/coldwar/plates/tatba //cant find any info on it, looks like a pasgt copy
	name = "TATBA-7背心"
	desc = "中国轻型防弹插板背心, 附带一块插入的插板."
	icon_state = "tatba"
	item_state = "tatba"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 55, arrow = 95, gun = 50, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	slots = 1
	slowdown = 0.1
	weight = 3
	value = 100

/obj/item/clothing/accessory/armor/coldwar/plates/tatba/green
	name = "TATBA-7绿色背心"
	icon_state = "tatbagreen"
	item_state = "tatbagreen"

/obj/item/clothing/head/helmet/modern/ssh_68 //1960 precursor to the 6B47 helmet on apparel_modern.dm
	name = "SSh-68头盔"
	desc = "20世纪中期苏联步兵部队常用的量产金属头盔."
	icon_state = "ssh_68_sovhelm"
	item_state = "ssh_68_sovhelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 55, arrow = 75, gun = 40, energy = 24, bomb = 66, bio = 25, rad = FALSE)

/obj/item/clothing/head/helmet/modern/ssh_68/med
	icon_state = "ssh_68med"
	item_state = "ssh_68med"

/obj/item/clothing/head/helmet/modern/ssh_68/winter
	icon_state = "ssh_68_winter"
	item_state = "ssh_68_winter"

/obj/item/clothing/head/helmet/modern/ssh_68/winter/med
	icon_state = "ssh_68wintmed"
	item_state = "ssh_68wintmed"

/obj/item/clothing/suit/b3 //need checking these assets before path name change, but i've updated the name to a real B3 russian armor circa 1980's
	name = "6B3防弹衣"
	desc = "苏联产防弹背心, 于1980年代中期配发."
	icon_state = "6b3"
	item_state = "6b3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 67, arrow = 95, gun = 60, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	weight = 5

/obj/item/clothing/accessory/armor/coldwar/plates/b3 //Accessory version
	name = "6B3防弹衣"
	desc = "苏联产防弹背心, 于1980年代中期配发."
	icon_state = "6b3"
	item_state = "6b3"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 67, arrow = 95, gun = 60, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	slots = 2
	slowdown = 0.1
	weight = 5

/obj/item/clothing/accessory/armor/coldwar/plates/b3/blue
	name = "6B3蓝色防弹衣"
	icon_state = "6b3blu"
	item_state = "6b3blu"

/obj/item/clothing/accessory/armor/coldwar/plates/b3/camo //uses civ grass tiles, provides alot more camo
	name = "6B3绿色迷彩防弹衣"
	icon_state = "6b3cam"
	item_state = "6b3cam"

/obj/item/clothing/accessory/armor/coldwar/plates/b2
	name = "6B2防弹衣"
	desc = "苏联产防弹背心, 于1980年代初期配发."
	icon_state = "6b2"
	item_state = "6b2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 67, arrow = 95, gun = 30, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	slowdown = 0.2
	weight = 5.1

/obj/item/clothing/accessory/armor/coldwar/plates/b5
	name = "6B5防弹衣"
	desc = "苏联产防弹背心, 于1980年代后期配发."
	icon_state = "6b5"
	item_state = "6b5"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 70, arrow = 95, gun = 70, energy = 30, bomb = 70, bio = 20, rad = FALSE)
	ripable = FALSE
	flags = CONDUCT
	slots = 2
	slowdown = 0.1
	weight = 5.9

/obj/item/clothing/accessory/armor/coldwar/flakjacket // Google searches only reveal M-1965 Field Jacket's being normal american jackets, replace eventually please.
	name = "M-1952防破片衣"
	desc = "用于防护弹片和轻击的可穿戴护甲. 对大口径武器作用不大."
	icon_state = "flakjacket"
	item_state = "flakjacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 75, gun = 15, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	value = 60
	slowdown = 0.2

/obj/item/clothing/accessory/armor/coldwar/flakjacket/m1969 // see note above, this highly likely isn't real article.
	name = "M-1969防破片衣"
	desc = "带有颈部防护, 用于防护弹片和轻击的可穿戴护甲. 对大口径武器作用不大."
	icon_state = "flakjacket1969"
	item_state = "flakjacket1969"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 65, arrow = 75, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 60
	slowdown = 0.2

/obj/item/clothing/accessory/armor/coldwar/flakjacket/b1 //used by spetznaz vdv and soviets in afgan
	name = "6B1背心"
	desc = "用于防护弹片和轻口径武器的可穿戴护甲. 对大口径武器作用不大."
	icon_state = "6b1"
	item_state = "6b1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 65, arrow = 80, gun = 20, energy = 15, bomb = 60, bio = 20, rad = FALSE)
	value = 60
	slowdown = 0.1

/* Cold War Belts*/

/obj/item/weapon/storage/belt/ugl
	name = "手榴弹挎包"
	desc = "通用手榴弹挎包. 有足够空间容纳六枚下挂榴弹."
	icon_state = "soviet_ugl"
	item_state = "soviet_ugl"
	storage_slots = 6
	can_hold = list(/obj/item/weapon/grenade/frag/ugl,/obj/item/weapon/grenade/smokebomb/ugl,/obj/item/weapon/grenade/chemical/ugl,/obj/item/weapon/key)

/obj/item/weapon/storage/belt/ugl/soviet
	desc = "华约使用的通用手榴弹挎包. 有足够空间容纳六枚下挂榴弹."
	can_hold = list(/obj/item/weapon/grenade/frag/ugl/vog25, /obj/item/weapon/grenade/smokebomb/ugl/vog25,/obj/item/weapon/key)

/obj/item/weapon/storage/belt/ugl/soviet/filled/New()
	..()
	for (var/i=1, i<= 4, i++)
		new/obj/item/weapon/grenade/frag/ugl/vog25(src)
	new/obj/item/weapon/grenade/smokebomb/ugl/vog25(src)
	new/obj/item/weapon/grenade/smokebomb/ugl/vog25(src)

/obj/item/weapon/storage/belt/largepouches/olive/m60
/obj/item/weapon/storage/belt/largepouches/olive/m60/New()
	..()
	new/obj/item/ammo_magazine/b762(src)
	new/obj/item/ammo_magazine/b762(src)

/obj/item/weapon/storage/belt/largepouches/olive/madsen
/obj/item/weapon/storage/belt/largepouches/olive/madsen/New()
	..()
	new/obj/item/ammo_magazine/madsen(src)
	new/obj/item/ammo_magazine/madsen(src)
/obj/item/weapon/storage/belt/largepouches/m249
/obj/item/weapon/storage/belt/largepouches/m249/New()
	..()
	new/obj/item/ammo_magazine/m249(src)
	new/obj/item/ammo_magazine/m249(src)

/obj/item/weapon/storage/belt/largepouches/green/m249
/obj/item/weapon/storage/belt/largepouches/green/m249/New()
	..()
	new/obj/item/ammo_magazine/m249(src)
	new/obj/item/ammo_magazine/m249(src)

/obj/item/weapon/storage/belt/largepouches/sovietmg
/obj/item/weapon/storage/belt/largepouches/sovietmg/New()
	..()
	new/obj/item/ammo_magazine/dp(src)
	new/obj/item/ammo_magazine/dp(src)

/obj/item/weapon/storage/belt/largepouches/sovietmg/white
	icon_state = "largepouches_white"
	item_state = "largepouches_white"

/obj/item/weapon/storage/belt/smallpouches/vc_officer
/obj/item/weapon/storage/belt/smallpouches/vc_officer/New()
	..()
	new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new /obj/item/weapon/key/vietnamese(src)
	new /obj/item/weapon/whistle(src)

/obj/item/weapon/storage/belt/largepouches/green/negev
/obj/item/weapon/storage/belt/largepouches/green/negev/New()
	..()
	new/obj/item/ammo_magazine/negev(src)
	new/obj/item/ammo_magazine/negev(src)

/obj/item/weapon/storage/belt/largepouches/pkm
/obj/item/weapon/storage/belt/largepouches/pkm/New()
	..()
	new/obj/item/ammo_magazine/pkm/c100(src)
	new/obj/item/ammo_magazine/pkm/c100(src)

/obj/item/weapon/storage/belt/destructionpouch
/obj/item/weapon/storage/belt/destructionpouch/New()
	..()
	new /obj/item/weapon/grenade/smokebomb(src)
	for (var/i=1, i<=3, i++)
		new /obj/item/weapon/grenade/antitank/stg24_bundle(src)
	new /obj/item/weapon/grenade/ww2/stg1924(src)
	new /obj/item/weapon/grenade/ww2/stg1924(src)

/obj/item/weapon/storage/belt/smallpouches/soviet_ppsh
/obj/item/weapon/storage/belt/smallpouches/soviet_ppsh/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/c762x25_ppsh(src)

/obj/item/weapon/storage/belt/smallpouches/chinese_rifle
/obj/item/weapon/storage/belt/smallpouches/chinese_rifle/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/gewehr98(src)

/obj/item/weapon/storage/belt/smallpouches/us_stanag
/obj/item/weapon/storage/belt/smallpouches/us_stanag/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/m16(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/un_fal
/obj/item/weapon/storage/belt/smallpouches/un_fal/New()
	..()
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/fal(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/fal
/obj/item/weapon/storage/belt/smallpouches/fal/New()
	..()
	for (var/i=1, i<=4, i++)
		new /obj/item/ammo_magazine/fal(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_74
/obj/item/weapon/storage/belt/smallpouches/green/sov_74/New()
	..()
	new /obj/item/weapon/grenade/coldwar/rgd5(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/ak74
/obj/item/weapon/storage/belt/smallpouches/ak74/New()
	..()
	new /obj/item/weapon/grenade/modern/f1(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_74/alt
/obj/item/weapon/storage/belt/smallpouches/green/sov_74/alt/New()
	..()
	new /obj/item/weapon/grenade/chemical/xylyl_bromide(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/rpk74
/obj/item/weapon/storage/belt/smallpouches/green/rpk74/New()
	..()
	new /obj/item/ammo_magazine/rpk74(src)
	new /obj/item/ammo_magazine/rpk74(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)
	new /obj/item/weapon/grenade/coldwar/rgd5(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_74m
/obj/item/weapon/storage/belt/smallpouches/green/sov_74m/New()
	..()
	new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_svd
/obj/item/weapon/storage/belt/smallpouches/green/sov_svd/New()
	..()
	new /obj/item/weapon/grenade/smokebomb/rdg2(src)
	new /obj/item/ammo_magazine/svd(src)
	new /obj/item/ammo_magazine/svd(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_vintorez
/obj/item/weapon/storage/belt/smallpouches/green/sov_vintorez/New()
	..()
	new /obj/item/weapon/grenade/smokebomb/rdg2(src)
	new /obj/item/ammo_magazine/vintorez(src)
	new /obj/item/ammo_magazine/vintorez(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_saiga
/obj/item/weapon/storage/belt/smallpouches/green/sov_saiga/New()
	storage_slots = 5
	..()
	new /obj/item/weapon/grenade/coldwar/rgd5(src)
	new /obj/item/ammo_magazine/saiga12(src)
	new /obj/item/ammo_magazine/saiga12(src)
	new /obj/item/ammo_magazine/saiga12(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_swat
/obj/item/weapon/storage/belt/smallpouches/green/sov_swat/New()
	storage_slots = 6
	..()
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/ammo_magazine/makarov(src)
	new /obj/item/weapon/grenade/chemical/xylyl_bromide(src)
	new /obj/item/weapon/grenade/chemical/xylyl_bromide(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/sov_spz
/obj/item/weapon/storage/belt/smallpouches/green/sov_spz/New()
	storage_slots = 6
	..()
	new /obj/item/weapon/grenade/antitank/rpg40(src)
	new /obj/item/weapon/grenade/modern/f1(src)
	new /obj/item/weapon/grenade/chemical/xylyl_bromide(src)
	new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/ammo_magazine/ak74/ak74m(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/ak74
/obj/item/weapon/storage/belt/smallpouches/green/ak74/New()
	..()
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/ammo_magazine/ak74(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/ak47
/obj/item/weapon/storage/belt/smallpouches/green/ak47/New()
	..()
	new /obj/item/ammo_magazine/ak47(src)
	new /obj/item/ammo_magazine/ak47(src)
	new /obj/item/ammo_magazine/ak47(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/stanag
/obj/item/weapon/storage/belt/smallpouches/green/stanag/New()
	..()
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/ammo_magazine/m16(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/green/m14
/obj/item/weapon/storage/belt/smallpouches/green/m14/New()
	..()
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/ammo_magazine/m14(src)
	new /obj/item/ammo_magazine/m14(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/* PLA Belts */
/obj/item/weapon/storage/belt/smallpouches/china_qbz95
/obj/item/weapon/storage/belt/smallpouches/china_qbz95/New()
	..()
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/china_qbza95_2
/obj/item/weapon/storage/belt/smallpouches/china_qbz95_2/New()
	..()
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/weapon/grenade/coldwar/rgd5(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/china_qblz1
/obj/item/weapon/storage/belt/smallpouches/china_qblz1/New()
	..()
	new /obj/item/ammo_magazine/tibannagas/qblz1(src)
	new /obj/item/ammo_magazine/tibannagas/qblz1(src)
	new /obj/item/weapon/pill_pack/tramadol(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/china_qbz95_officer
/obj/item/weapon/storage/belt/smallpouches/china_qbz95_officer/New()
	..()
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/ammo_magazine/qbz95(src)
	new /obj/item/weapon/pill_pack/tramadol(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/hk417
/obj/item/weapon/storage/belt/smallpouches/hk417/New()
	..()
	new /obj/item/ammo_magazine/scarh(src)
	new /obj/item/ammo_magazine/scarh(src)
	new /obj/item/weapon/pill_pack/tramadol(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/p90
/obj/item/weapon/storage/belt/smallpouches/p90/New()
	..()
	new /obj/item/ammo_magazine/p90(src)
	new /obj/item/ammo_magazine/p90(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/obj/item/weapon/storage/belt/smallpouches/sten
/obj/item/weapon/storage/belt/smallpouches/sten/New()
	..()
	new /obj/item/ammo_magazine/sten2(src)
	new /obj/item/ammo_magazine/sten2(src)
	new /obj/item/weapon/grenade/smokebomb/m18smoke(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)

/* Cold War Balaclavas */

/obj/item/clothing/mask/balaclava
	name = "黑色巴拉克拉瓦头套"
	desc = "黑色巴拉克拉瓦头套, 遮住面部."
	icon_state = "balaclava"
	item_state = "balaclava"
	body_parts_covered = FACE|EYES|HEAD
	flags_inv = HIDEFACE
	w_class = ITEM_SIZE_TINY
	heat_protection = HEAD|FACE|EYES
	cold_protection = HEAD|FACE|EYES

/obj/item/clothing/mask/balaclava/snow
	name = "雪地巴拉克拉瓦头套"
	desc = "白色巴拉克拉瓦头套, 遮住面部."
	icon_state = "snowclava"
	item_state = "snowclava"

/obj/item/clothing/mask/balaclava/green
	name = "雪地巴拉克拉瓦头套"
	desc = "绿色巴拉克拉瓦头套, 遮住面部."
	icon_state = "swatclava"
	item_state = "swatclava"

/obj/item/clothing/mask/balaclava/skull
	name = "骷髅面罩巴拉克拉瓦"
	desc = "带有骷髅印花的巴拉克拉瓦,覆盖面部."
	icon_state = "skullclava"
	item_state = "skullclava"

/obj/item/clothing/mask/headscarfgrey ////German Toque head scarf Issued to soldiers during WW2 to wear as a neck warmer
	name = "灰色头巾"
	desc = "一条头巾,保护你的脸免受寒冷."
	icon_state = "headscarfgrey"
	item_state = "headscarfgrey"
	body_parts_covered = FACE|HEAD
	slot_flags = SLOT_BELT|SLOT_MASK
	flags_inv = BLOCKHAIR
	w_class = ITEM_SIZE_TINY
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE*2
	flammable = TRUE
	cold_protection = HEAD|FACE

/* Headscarves */

/obj/item/clothing/mask/headscarfgrey/asbestos
	name = "石棉头巾"
	desc = "一条重型石棉织物头巾,保护你的头部免受高温和寒冷."
	icon_state = "headscarfgreyA"
	item_state = "headscarfgreyA"
	body_parts_covered = FACE|HEAD
	w_class = ITEM_SIZE_SMALL
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE*4
	armor = list(melee = 5, arrow = FALSE, gun = FALSE, energy = 35, bomb = 25, bio = 5, rad = 5)
	heat_protection = HEAD|FACE
	flammable = FALSE
	cold_protection = HEAD|FACE

/obj/item/clothing/mask/headscarfgrey/olive
	name = "橄榄色头巾"
	icon_state = "headscarfolive"
	item_state = "headscarfolive"

/obj/item/clothing/mask/headscarfgrey/white
	name = "白色头巾"
	icon_state = "headscarfwhite"
	item_state = "headscarfwhite"

/obj/item/clothing/head/commando_bandana
	name = "橄榄褐色方巾"
	desc = "一条橄榄褐色的方巾."
	icon_state = "commando_bandana"
	item_state = "commando_bandana"
	body_parts_covered = HEAD

/obj/item/clothing/mask/sovietbala
	name = "绿色巴拉克拉瓦"
	desc = "一条绿色巴拉克拉瓦,覆盖嘴部."
	icon_state = "sovietbala"
	item_state = "sovietbala"
	body_parts_covered = FACE|EYES|HEAD
	w_class = ITEM_SIZE_TINY
	heat_protection = HEAD|FACE|EYES

/* Cold War Webbing*/

/obj/item/clothing/accessory/storage/webbing/green_webbing
	name = "绿色胸挂"
	desc = "一件绿色胸挂,带有三个中等大小的口袋."
	slots = 3
	icon_state = "green_webbing"
	item_state = "green_webbing"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/gun/projectile/pistol,/obj/item/weapon/gun/projectile/revolver,/obj/item/weapon/handcuffs,/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/green_webbing/mosin
	New()
		..()
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/mosin(hold)

/obj/item/clothing/accessory/storage/webbing/green_webbing/mosin/sniper
	New()
		..()
		new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/ammo_magazine/mosinbox(hold)

/obj/item/clothing/accessory/storage/webbing/green_webbing/m24
	New()
		..()
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/m24(hold)

/obj/item/clothing/accessory/storage/webbing/khaki_webbing
	name = "卡其色胸挂"
	desc = "一件卡其色胸挂,带有三个中等大小的口袋."
	slots = 3
	icon_state = "khaki_webbing"
	item_state = "khaki_webbing"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/gun/projectile/pistol,/obj/item/weapon/gun/projectile/revolver,/obj/item/weapon/handcuffs,/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/khaki_webbing/akm
	New()
		..()
		new/obj/item/weapon/grenade/ww2/mk2(hold)
		new/obj/item/ammo_magazine/ak47(hold)
		new/obj/item/ammo_magazine/ak47(hold)

/obj/item/clothing/accessory/storage/webbing/khaki_webbing/g3
	New()
		..()
		new/obj/item/weapon/grenade/ww2/mk2(hold)
		new/obj/item/ammo_magazine/hk(hold)
		new/obj/item/ammo_magazine/hk(hold)

/obj/item/clothing/accessory/storage/webbing/green_webbing/akm
	New()
		..()
		new/obj/item/weapon/grenade/ww2/mk2(hold)
		new/obj/item/ammo_magazine/ak47(hold)
		new/obj/item/ammo_magazine/ak47(hold)

/obj/item/clothing/accessory/storage/webbing/green_webbing/g3
	New()
		..()
		new/obj/item/weapon/grenade/ww2/mk2(hold)
		new/obj/item/ammo_magazine/hk(hold)
		new/obj/item/ammo_magazine/hk(hold)

/obj/item/clothing/accessory/storage/webbing/pouches
	name = "黑色口袋"
	desc = "一套用于存放弹匣的口袋."
	slots = 3
	icon_state = "black_pouches"
	item_state = "black_pouches"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine)

/obj/item/clothing/accessory/storage/webbing/largepouches
	name = "大型黑色口袋"
	desc = "一套用于存放弹匣的大型口袋."
	slots = 6
	icon_state = "largepouches"
	item_state = "largepouches"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine)

/obj/item/clothing/accessory/storage/webbing/largepouchestan
	name = "大型棕褐色口袋"
	desc = "一套用于存放弹匣的大型口袋."
	slots = 6
	icon_state = "largepouches_tan"
	item_state = "largepouches_tan"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine)

/obj/item/clothing/accessory/storage/webbing/tanpouches
	name = "棕褐色口袋"
	desc = "一套用于存放弹匣的口袋."
	slots = 3
	icon_state = "tan_pouches"
	item_state = "tan_pouches"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine)

/obj/item/clothing/accessory/storage/webbing/ubac
	name = "棕褐色UBAC"
	desc = "一件灵活贴身的衬衫,带有迷彩袖子,设计用于穿在战斗装备下.这件是棕褐色的."
	icon_state = "ubac_tan"
	item_state = "ubac_tan"
	slot = "sash"

/obj/item/clothing/accessory/storage/webbing/ubacgreen
	name = "绿色UBAC"
	desc = "一件灵活贴身的衬衫,带有迷彩袖子,设计用于穿在战斗装备下.这件是绿色的."
	icon_state = "ubac_green"
	item_state = "ubac_green"
	slot = "sash"

/obj/item/clothing/accessory/storage/webbing/ubacblack
	name = "黑色UBAC"
	desc = "一件灵活贴身的衬衫,带有迷彩袖子,设计用于穿在战斗装备下.这件是黑色的."
	icon_state = "ubac_black"
	item_state = "ubac_black"
	slot = "sash"

/obj/item/clothing/accessory/storage/webbing/sweater //does not the capacity to protect against cold currently
	name = "灰色毛衣"
	desc = "一件让你感到舒适的毛衣."
	icon_state = "sweater"
	item_state = "sweater"
	slot = "sash"

/obj/item/clothing/accessory/storage/webbing/light
	name = "轻型胸挂"
	desc = "一件轻型胸挂,容量较低但允许快速移动."
	slots = 3
	icon_state = "german_vest"
	item_state = "german_vest"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/light/chinese
	name = "中国轻型胸挂"
	slots = 4
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
/obj/item/clothing/accessory/storage/webbing/light/chinese/gewehr98
	New()
		..()
		for (var/i=1, i<= 5, i++)
			new/obj/item/ammo_magazine/gewehr98(hold)

/obj/item/clothing/accessory/storage/webbing/light/chinese/ak47
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/ak47(hold)

/obj/item/clothing/accessory/storage/webbing/light/chinese/sks
	New()
		..()
		for (var/i=1, i<= 5, i++)
			new/obj/item/ammo_magazine/sks(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest
	name = "美军胸挂"
	desc = "一件带有若干小口袋的大型胸挂."
	icon_state = "us_vest"
	item_state = "us_vest"
	slots = 5
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/us_vest/m16
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/m16(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest/m60
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/b762(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest/m249
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/m249(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest/c6
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/c6can(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest/sten
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/sten2(hold)

/obj/item/clothing/accessory/storage/webbing/us_vest/springfield
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/springfield(hold)

/obj/item/clothing/accessory/storage/webbing/us_bandolier
	name = "美军弹带"
	desc = "一条带有若干小口袋的大型棉质弹带."
	icon_state = "us_bandolier"
	item_state = "us_badolier"
	slots = 5
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/shotgun_bandolier
	name = "霰弹枪弹带"
	desc = "一条带有若干孔洞的弹带,用于装填霰弹枪弹药."
	icon_state = "shotgun_bandolier"
	item_state = "shotgun_bandolier"
	slots = 12
	New()
		..()
		hold.can_hold = list(/obj/item/ammo_casing/shotgun)

/obj/item/clothing/accessory/storage/webbing/shotgun_bandolier/filled_buckshot
	New()
		..()
		for (var/i=1, i<=12, i++)
			new /obj/item/ammo_casing/shotgun/buckshot(hold)

/obj/item/clothing/accessory/storage/webbing/m79_vest
	name = "美军M79背心"
	desc = "一件带有若干小口袋的大型胸挂."
	icon_state = "m79_vest"
	item_state = "m79_vest"
	slots = 8
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/grenade/frag/ugl,/obj/item/weapon/grenade/smokebomb/ugl,/obj/item/weapon/grenade/chemical/ugl,/obj/item/weapon/key)

/obj/item/clothing/accessory/storage/webbing/m79_vest/filled
	New()
		..()
		for (var/i=1, i<=8, i++)
			new /obj/item/weapon/grenade/frag/ugl/shell40mm(hold)

/obj/item/clothing/accessory/storage/webbing/shell40mm
	name = "掷弹兵胸挂"
	desc = "一件带有若干小口袋的大型胸挂."
	icon_state = "m79_vest"
	item_state = "m79_vest"
	slots = 8
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/grenade/frag/ugl,/obj/item/weapon/grenade/smokebomb/ugl,/obj/item/weapon/grenade/chemical/ugl,/obj/item/weapon/key)
		for (var/i=1, i<=5, i++)
			new /obj/item/weapon/grenade/frag/ugl/shell40mm(hold)
		for (var/i=1, i<=3, i++)
			new /obj/item/weapon/grenade/smokebomb/ugl/shell40mm(hold)

/obj/item/clothing/accessory/storage/webbing/vog25
	name = "掷弹兵胸挂"
	desc = "一件带有若干小口袋的大型胸挂."
	icon_state = "m79_vest"
	item_state = "m79_vest"
	slots = 8
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/grenade/frag/ugl,/obj/item/weapon/grenade/smokebomb/ugl,/obj/item/weapon/grenade/chemical/ugl,/obj/item/weapon/key)
		for (var/i=1, i<=5, i++)
			new /obj/item/weapon/grenade/frag/ugl/vog25(hold)
		for (var/i=1, i<=3, i++)
			new /obj/item/weapon/grenade/smokebomb/ugl/vog25(hold)

/obj/item/clothing/accessory/storage/webbing/survival
	name = "生存胸挂"
	desc = "一套绿色胸部和膝部口袋,用于存放手枪,弹匣以及在野外生存所需的其他装备."
	slots = 11
	w_class = ITEM_SIZE_LARGE // Heavier because it can hold a lot of stuff.
	icon_state = "survival_webbing"
	item_state = "survival_webbing"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/gun/projectile/pistol,
							/obj/item/weapon/gun/projectile/revolver,
							/obj/item/weapon/key,
							/obj/item/ammo_casing,
							/obj/item/ammo_magazine,
							/obj/item/weapon/grenade,
							/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,
							/obj/item/weapon/reagent_containers/food/snacks/MRE/generic,
							/obj/item/weapon/material/hatchet,
							/obj/item/weapon/material/shovel/trench/foldable,
							/obj/item/weapon/attachment/scope/adjustable/binoculars,
							/obj/item/stack/medical/bruise_pack,
							/obj/item/stack/medical/advanced/sulfa)

/obj/item/clothing/accessory/storage/webbing/survival/white
	desc = "一套白色胸部和膝部口袋,用于存放手枪,弹匣以及在野外生存所需的其他物品."
	icon_state = "survival_webbing_white"
	item_state = "survival_webbing_white"

/obj/item/clothing/accessory/storage/webbing/survival/filled
	New()
		..()
		new /obj/item/weapon/material/shovel/trench/foldable/etool(hold)
		new /obj/item/weapon/material/hatchet/steel(hold)
		new /obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(hold)
		new /obj/item/flashlight/flare(hold)
		new /obj/item/stack/medical/advanced/sulfa(hold)
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/canteen(hold)
		new /obj/item/weapon/reagent_containers/food/snacks/MRE/generic(hold)
		new /obj/item/weapon/grenade/smokebomb/signal/rdg2_yellow(hold)

/obj/item/clothing/accessory/storage/webbing/survival/filled/soviet
	New()
		..()
		new /obj/item/weapon/gun/projectile/pistol/tt30(hold)
		new /obj/item/ammo_magazine/tt30(hold)
		new /obj/item/ammo_magazine/tt30(hold)

/* NBC &  Hazmat Suits*/

/obj/item/clothing/head/nbc
	name = "黄色NBC头罩"
	desc = "一个黄色的NBC头罩,用于防护生物,化学和核威胁."
	icon_state = "nbc"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = 25, bomb = 10, bio = 100, rad = 80)

/obj/item/clothing/suit/nbc
	name = "黄色NBC防护服"
	desc = "一件黄色的NBC防护服,用于防护生物,化学和核威胁."
	icon_state = "nbc"
	item_state = "nbc"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = 25, bomb = 10, bio = 100, rad = 80)
	ripable = FALSE

/obj/item/clothing/head/nbc/olive
	name = "橄榄褐色NBC头罩"
	desc = "一个橄榄褐色的NBC头罩,用于防护生物,化学和核威胁."
	icon_state = "nbc2"

/obj/item/clothing/head/nbc/olive/fire
	name = "消防头罩"
	desc = "一件主要用于防火的防护服."
	armor = list(melee = 40, arrow = FALSE, gun = FALSE, energy = 80, bomb = 25, bio = 60, rad = 40)

/obj/item/clothing/suit/nbc/olive
	name = "橄榄褐色NBC防护服"
	desc = "一件橄榄褐色的NBC防护服,用于防护生物,化学和核威胁."
	icon_state = "nbc2"
	item_state = "nbc2"

/obj/item/clothing/suit/nbc/olive/fire
	name = "消防防护服"
	desc = "一件主要用于防火的防护服."
	armor = list(melee = 40, arrow = FALSE, gun = FALSE, energy = 80, bomb = 25, bio = 60, rad = 40)

/obj/item/clothing/suit/hazmat
	name = "防化服"
	desc = "一件明亮的危险防护服,用于防护生物,化学和核威胁."
	icon_state = "hazmat_suit"
	item_state = "hazmat_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS|HEAD
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = 5, bomb = 5, bio = 100, rad = 100)
	ripable = FALSE

/obj/item/clothing/suit/nbcponcho
	name = "NBC斗篷"
	desc = "一件NBC斗篷,非常轻便且易于穿戴,用于防护生物,化学和核威胁."
	icon_state = "nbcponcho"
	item_state = "nbcponcho"
	w_class = ITEM_SIZE_TINY // its light
	item_flags = AIRTIGHT
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HEAD|FEET|HANDS
	armor = list(melee = 5, arrow = FALSE, gun = FALSE, energy = 5, bomb = 5, bio = 100, rad = 75)
	ripable = FALSE

/obj/item/clothing/suit/nbcponcho/white
	name = "白色NBC斗篷"
	icon_state = "nbcponchowhite"
	item_state = "nbcponchowhite"
/* Astronaut Suit and Helmet*/

/obj/item/clothing/head/astronaut
	name = "宇航员头盔"
	desc = "一个灰色头盔,用于防护低压,温度和放射性威胁"
	icon_state = "astronaut"
	armor = list(melee = 20, arrow = 10, gun = 5, energy = 10, bomb = 35, bio = 150, rad = 195)

/obj/item/clothing/suit/astronaut
	name = "宇航服"
	desc = "一件灰色太空服,用于防护低压,温度和放射性威胁."
	icon_state = "astronaut"
	item_state = "astronaut"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	armor = list(melee = FALSE, arrow = FALSE, gun = FALSE, energy = 5, bomb = 35, bio = 150, rad = 195)
	ripable = FALSE

/* Miscallaneous*/

	/* John Toughguy - Jungle Commando defintiely does not rhyme with a certain movie franchise*/

/* Woodland Face Paint Recommended*/

/obj/item/clothing/head/bandana/toughguy
	name = "专家方巾"
	desc = "一条红色方巾,是经验丰富的丛林战士首选的头饰."
	icon_state = "toughguy"
	item_state = "toughguy"
	body_parts_covered = HEAD

/obj/item/clothing/under/toughguy
	name = "带有丛林迷彩涂装的专家裤子"
	desc = "一条军队配发的裤子和丛林迷彩身体涂装;用于无缝融入环境"
	icon_state = "toughguy"
	item_state = "toughguy"

/obj/item/clothing/gloves/toughguy
	name = "专家皮手套"
	icon_state = "toughguy"
	item_state = "toughguy"
	body_parts_covered = HANDS
	armor = list(melee = 30, arrow = 5, gun = 5, energy = 15, bomb = 30, bio = 10, rad = FALSE)
	slot_flags = SLOT_GLOVES

/obj/item/clothing/shoes/toughguy
	name = "专家靴"
	desc = "一双做工精良且踏地无声的军配皮靴."
	icon_state = "toughguy"
	item_state = "toughguy"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 20, arrow = 40, gun = FALSE, energy = 10, bomb = 40, bio = 20, rad = 40)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE
    //china cold war
/obj/item/clothing/under/chinaguard
	name = "中国红卫兵制服"
	desc = "红卫兵穿着的制服."
	icon_state = "redguard"
	item_state = "redguard"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 5, arrow = 5, gun = FALSE, energy = 2, bomb = 5, bio = 10, rad = 10)

obj/item/clothing/head/chinaguardcap
	name = "Chinese Red Guard cap"
	desc = "A cap worn by the Chinese Red guard."
	icon_state = "redguardcap"
	item_state = "redguardcap"
	body_parts_covered = HEAD
	armor = list(melee = 5, arrow = FALSE, gun = 1, energy = FALSE, bomb = FALSE, bio = FALSE, rad = FALSE)
	/* Sovie apparel 70-80'ss*/

/obj/item/clothing/under/afghanka
	name = "阿富汗卡制服"
	desc = "一款在80年代初研发并配发的标准苏联制服,在苏联解体后仍在使用."
	icon_state = "afghanka_open"
	item_state = "afghanka_open"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	var/adjusted = FALSE
/obj/item/clothing/under/afghanka/verb/toggle()
	set category = null
	set src in usr
	set name = "Adjust collar"
	if (type != /obj/item/clothing/under/afghanka)
		return
	else
		if(adjusted)
			item_state = "afghanka_open"
			icon_state = "afghanka_open"
			item_state_slots["w_uniform"] = "afghanka_open"
			to_chat(usr, "你<b>敞开</b>了制服的衣领.")
			adjusted = FALSE
			update_clothing_icon()
		else if (!adjusted)
			item_state = "afghanka_closed"
			icon_state = "afghanka_closed"
			item_state_slots["w_uniform"] = "afghanka_closed"
			to_chat(usr, "你<b>合上</b>了制服的衣领.")
			adjusted = TRUE
			update_clothing_icon()

/obj/item/clothing/under/sov_klmk
	name = "KLMK迷彩制服"
	desc = "一套KLMK迷彩图案的制服,由苏联于1970年代配发."
	icon_state = "sov_klmk"
	item_state = "sov_klmk"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/sov_klmk/alt
	icon_state = "sov_klmk_alt"
	item_state = "sov_klmk_alt"

/obj/item/clothing/under/sov_klmk/yellow
	icon_state = "sov_klmk_yellow"
	item_state = "sov_klmk_yellow"

/obj/item/clothing/under/sov_kzs
	name = "KZS迷彩制服"
	desc = "一套KZS迷彩图案的制服,由苏联于1970年代末配发."
	icon_state = "sov_kzs"
	item_state = "sov_kzs"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/under/coldwar/soviet_officer
	name = "苏联军官制服"
	desc = "一套军官制服,供苏联陆军军官使用."
	icon_state = "sovuni_officer2"
	item_state = "sovuni_officer2"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

	/* Swinging 60's*/

/obj/item/clothing/under/sundress
	name = "黄色太阳裙"
	desc = "一款中世纪风格的连衣裙,常在晴朗天气穿在外面,与新一代独立女性相关联"
	icon_state = "sundress_yellow"
	item_state = "sundress_yellow"

/obj/item/clothing/under/sundress/blue
	name = "蓝色太阳裙"
	desc = "一款中世纪风格的连衣裙,常在晴朗天气穿在外面,与新一代独立女性相关联"
	icon_state = "sundress_blue"
	item_state = "sundress_blue"

/obj/item/clothing/under/sundress/orange
	name = "橙色太阳裙"
	desc = "一款中世纪风格的连衣裙,常在晴朗天气穿在外面,与新一代独立女性相关联"
	icon_state = "sundress_orange"
	item_state = "sundress_orange"

/obj/item/clothing/under/sundress/purple
	name = "紫色太阳裙"
	desc = "一款中世纪风格的连衣裙,常在晴朗天气穿在外面,与新一代独立女性相关联"
	icon_state = "sundress_purple"
	item_state = "sundress_purple"

/obj/item/clothing/under/sundress/red
	name = "红色太阳裙"
	desc = "一款中世纪风格的连衣裙,常在晴朗天气穿在外面,与新一代独立女性相关联"
	icon_state = "sundress_red"
	item_state = "sundress_red"

/obj/item/clothing/under/gatorpants
	name = "无上装鳄鱼裤"
	desc = "一条紧身的鳄鱼鳞纹裤子.当你这么有型的时候;穿上衣只会束缚你的风格."
	icon_state = "gator_pants"
	item_state = "gator_pants"
	body_parts_covered = LOWER_TORSO|LEGS

	/* Other Miscallaneous */

/obj/item/clothing/suit/bx //is this futuristic?
	name = "碳黑西装"
	desc = "一套由压缩碳材料制成的高科技西装."
	icon_state = "bxsuit"
	item_state = "bxsuit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|FEET|HANDS
	armor = list(melee = 140, arrow = 200, gun = 150, energy = 100, bomb = 100, bio = 100, rad = 80)
	ripable = FALSE

/obj/item/clothing/suit/a6b45 //isn't this armor? || Note @FantasticFwoosh- (29/08/2020) Ratnik Programme russian armor is developed in 2016 this is classified in the wrong era.
	name = "6B45 heavy vest"
	desc = "6B45 is a modular bullet-resistant vest. It comprises frontal and rear section and soft-armour shoulder and side protection."
	icon_state = "a6b45"
	item_state = "a6b45"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 103, arrow = 110, gun = 110, energy = 67, bomb = 70, bio = 40, rad = 36)
	var/slots = 4
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/heavyvest1 // Is designative of armor grade/type but not a armor itself. Please replace with identifiable/recognizable armor.
	name = "重型防弹背心"
	desc = "一件重型NIJ IV级防弹背心."
	icon_state = "heavypolice"
	item_state = "heavypolice"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 50, arrow = 40, gun = 112, energy = 68, bomb = 40, bio = 32, rad = 20)
	var/slots = 6
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/medvest // Is designative of armor grade/type but not a armor itself. Please replace with identifiable/recognizable armor.
	name = "中型防弹背心"
	desc = "一件重型NIJ III级防弹背心."
	icon_state = "mediumvest"
	item_state = "mediumvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 30, arrow = 40, gun = 84, energy = 47, bomb = 35, bio = 29, rad = 10)
	var/slots = 6
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/a6b44 // Is designative of armor grade/type but not a armor itself. Please replace with identifiable/recognizable armor.
	name = "6B44防弹背心"
	desc = "6B44是一款模块化防弹背心."
	icon_state = "a6b44"
	item_state = "a6b44"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 80, arrow = 100, gun = 93, energy = 56, bomb = 64, bio = 40, rad = 36)
	var/slots = 4
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/a6b28 // Is designative of armor grade/type but not a armor itself. Please replace with identifiable/recognizable armor.
	name = "6B28防弹插板背心"
	desc = "6B28是一款III级防弹插板背心."
	icon_state = "a6b28"
	item_state = "a6b28"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 74, arrow = 87, gun = 83, energy = 67, bomb = 56, bio = 40, rad = 36)
	var/slots = 3
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/head/helmet/modern/vchelmet
	name = "越南木髓头盔"
	desc = "一顶越南人使用的木髓头盔."
	icon_state = "viet_pith"
	item_state = "viet_pith"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 45, gun = 15, energy = 15, bomb = 55, bio = 20, rad = FALSE)
	health = 24

/obj/item/clothing/head/helmet/modern/vchelmet/two
	icon_state = "viet_pith2"
	item_state = "viet_pith2"
/obj/item/clothing/head/helmet/modern/vchelmet/three
	icon_state = "viet_pith3"
	item_state = "viet_pith3"

/obj/item/clothing/head/helmet/modern/hardhat
	name = "白色安全帽"
	desc = "一顶工人使用的白色安全帽."
	icon_state = "hardhat_white"
	item_state = "hardhat_white"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 65, arrow = 15, gun = 5, energy = 5, bomb = 55, bio = 10, rad = FALSE)
	health = 30

/obj/item/clothing/head/helmet/modern/hardhat/yellow
	name = "黄色安全帽"
	desc = "一顶工人使用的黄色安全帽."
	icon_state = "hardhat_yellow"
	item_state = "hardhat_yellow"

/obj/item/clothing/head/helmet/modern/hardhat/orange
	name = "橙色安全帽"
	desc = "一顶工人使用的橙色安全帽."
	icon_state = "hardhat_orange"
	item_state = "hardhat_orange"

//yare yare daze.

/obj/item/clothing/head/bizarre_hat
	name = "奇异的深蓝色帽子"
	desc = "一顶由麻烦制造者戴的深蓝色帽子."
	icon_state = "bizarre_hat"
	item_state = "bizarre_hat"

/obj/item/clothing/suit/storage/coat/bizarre_coat
	name = "奇异的深蓝色外套"
	desc = "一件非常有型的外套."
	icon_state = "bizarre_coat"
	item_state = "bizarre_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 15, arrow = 5, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 150

/obj/item/clothing/under/ww2/soviet_nkvd/kgb
	name = "克格勃制服"
	desc = "一套俄罗斯克格勃制服,供克格勃使用."
	icon_state = "nkvd_uni"
	item_state = "nkvd_uni"

/obj/item/clothing/under/coldwar/dra/soldier
	name = "DRA制服"
	desc = "一套DRA士兵穿着的军装."
	icon_state = "dra_uni"
	item_state = "dra_uni"

/obj/item/clothing/under/coldwar/dra/nco
	name = "DRA士官制服"
	desc = "一套DRA士官穿着的军装."
	icon_state = "dra_uni_nco"
	item_state = "dra_uni_nco"

/obj/item/clothing/under/coldwar/dra/officer
	name = "DRA军官制服"
	desc = "一套DRA军官穿着的军装."
	icon_state = "dra_uni_officer"
	item_state = "dra_uni_officer"

/obj/item/clothing/suit/coldwar/dra/officer
	name = "DRA军官夹克"
	desc = "一件DRA军官穿着的军用夹克."
	icon_state = "dra_officer"
	item_state = "dra_officer"

/obj/item/clothing/head/custom/fieldcap/dra
	name = "DRA野战帽"
	desc = "一顶DRA军事人员戴的帽子."
	color = "#767160"
	uncolored1 = FALSE

//blugoslavian and redmenian stuff
/obj/item/clothing/under/blugoslavian_sailor
	name = "布卢戈斯拉夫海军制服"
	desc = "一套布卢戈斯拉夫海军的蓝色制服."
	icon_state = "blugoslavian_sailor"
	item_state = "blugoslavian_sailor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS


/obj/item/clothing/under/redmenian_sailor
	name = "雷德梅尼亚海军制服"
	desc = "一套雷德梅尼亚海军的红色制服."
	icon_state = "redmenian_sailor"
	item_state = "redmenian_sailor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
/obj/item/clothing/under/coldwar/bowling_red
	name = "红色保龄球套装"
	desc = "一件有型的红色保龄球衫配黑色裤子."
	icon_state = "bowling_red"
	item_state = "bowling_red"

/obj/item/clothing/under/coldwar/bowling_yellow
	name = "黄色保龄球套装"
	desc = "一件有型的黄色保龄球衫配黑色裤子."
	icon_state = "bowling_yellow"
	item_state = "bowling_yellow"

/obj/item/clothing/under/coldwar/bowling_green
	name = "绿色保龄球套装"
	desc = "一件有型的绿色保龄球衫配黑色裤子."
	icon_state = "bowling_green"
	item_state = "bowling_green"

/obj/item/clothing/under/coldwar/bowling_blue
	name = "蓝色保龄球套装"
	desc = "一件有型的蓝色保龄球衫配黑色裤子."
	icon_state = "bowling_blue"
	item_state = "bowling_blue"

/obj/item/clothing/under/coldwar/hippie
	name = "嬉皮士套装"
	desc = "一件扎染T恤配盗版灰色牛仔裤.太酷了,老兄!"
	icon_state = "hippy"
	item_state = "hippy"

///////MEDICAL SCRUBS//////////////

/obj/item/clothing/under/scrubs
	name = "白色医疗服"
	desc = "医务人员穿着的卫生服装."
	icon_state = "scrubs_white"
	item_state = "scrubs_white"

/obj/item/clothing/under/scrubs/darkgreen
	name = "深绿色医疗服"
	desc = "医务人员穿着的卫生服装. 这件是深绿色的."
	icon_state = "scrubs_darkgreen"
	item_state = "scrubs_darkgreen"

/obj/item/clothing/under/scrubs/lightgreen
	name = "浅绿色医疗服"
	desc = "医务人员穿着的卫生服装. 这件是浅绿色的."
	icon_state = "scrubs_lightgreen"
	item_state = "scrubs_lightgreen"

/obj/item/clothing/under/scrubs/blue
	name = "蓝色医疗服"
	desc = "医务人员穿着的卫生服装. 这件是蓝色的."
	icon_state = "scrubs_blue"
	item_state = "scrubs_blue"

/obj/item/clothing/under/scrubs/navy
	name = "藏青色医疗服"
	desc = "医务人员穿着的卫生服装. 这件是藏青色的."
	icon_state = "scrubs_navy"
	item_state = "scrubs_navy"


////////SURGICAL CAPS/////////

/obj/item/clothing/head/surgical_cap
	name = "白色手术帽"
	desc = "一顶白色无菌手术帽."
	icon_state = "surgcap_white"
	item_state = "surgcap_white"

/obj/item/clothing/head/surgical_cap/darkgreen
	name = "深绿色手术帽"
	desc = "一顶深绿色无菌手术帽."
	icon_state = "surgcap_darkgreen"
	item_state = "surgcap_darkgreen"

/obj/item/clothing/head/surgical_cap/lightgreen
	name = "浅绿色手术帽"
	desc = "一顶浅绿色无菌手术帽."
	icon_state = "surgcap_lightgreen"
	item_state = "surgcap_lightgreen"

/obj/item/clothing/head/surgical_cap/blue
	name = "蓝色手术帽"
	desc = "一顶蓝色无菌手术帽."
	icon_state = "surgcap_blue"
	item_state = "surgcap_blue"

/obj/item/clothing/head/surgical_cap/navy
	name = "藏青色手术帽"
	desc = "一顶藏青色无菌手术帽."
	icon_state = "surgcap_navy"
	item_state = "surgcap_navy"

/obj/item/clothing/under/un_irish
	name = "爱尔兰橄榄色制服"
	desc = "联合国爱尔兰部队穿着的制服."
	icon_state = "un_irish"
	item_state = "un_irish"

/obj/item/clothing/under/afr_merc
	name = "非洲雇佣兵制服"
	desc = "雇佣兵穿着的轻型制服."
	icon_state = "afr_merc"
	item_state = "afr_merc"

/obj/item/clothing/under/afr_merc/alt
	icon_state = "afr_merc2"
	item_state = "afr_merc2"
