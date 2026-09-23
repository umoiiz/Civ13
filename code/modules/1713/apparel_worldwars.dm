/obj/item/clothing/suit/storage/coat/germcoat
	name = "德国大衣"
	desc = "一件德国大衣."
	icon_state = "germtrench"
	item_state = "germtrench"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 20)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/frenchcoat
	name = "法国风衣"
	desc = "一件法国风衣,它押韵!"
	icon_state = "frenchtrench"
	item_state = "frenchtrench"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	var/colorn = 1

/obj/item/clothing/suit/storage/coat/britishcoat
	name = "英国大衣"
	desc = "一件英国大衣."
	icon_state = "britishtrench"
	item_state = "britishtrench"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 20)
	value = 65
	var/colorn = 1


/obj/item/clothing/head/ww/germcap
	name = "德国军帽"
	desc = "一种有时由德国士兵佩戴的军帽."
	icon_state = "germcap2"
	item_state = "germcap2"

/obj/item/clothing/head/ww/frenchcap
	name = "法国军帽"
	desc = "一种由法国士兵佩戴的平顶圆形军帽."
	icon_state = "frenchcap"
	item_state = "frenchcap"

/obj/item/clothing/head/ww/britishcap
	name = "英国军帽"
	desc = "一种经典的英国军帽,通常由英国士兵佩戴."
	icon_state = "brittcap"
	item_state = "brittcap"

/obj/item/clothing/head/helmet/ww
	health = 18

/obj/item/clothing/head/helmet/ww/stahlhelm
	name = "M1915 钢盔"
	desc = "一款标志性的德国钢盔,在战斗中被士兵广泛使用."
	icon_state = "stahlhelm_old"
	item_state = "stahlhelm_old"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 45, arrow = 35, gun = 10, energy = 15, bomb = 45, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww/adriangreek
	name = "希腊 M15 亚德里安头盔"
	desc = "一款希腊亚德里安头盔,在战斗中被士兵普遍佩戴."
	icon_state = "adrian_greek"
	item_state = "adrian_greek"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

	var/strap = FALSE

/obj/item/clothing/head/helmet/ww/adriangreek/verb/toggle_strap()
	set category = null
	set src in usr
	set name = "Toggle Strap"
	if (strap)
		icon_state = "adrian_greek"
		item_state = "adrian_greek"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "adrian_greek"
		usr.visible_message("<span class = 'notice'>[usr]放下了头盔的系带.</span>", "<span class = 'notice'>你放下了头盔的系带.</span>")
		update_icon()
		strap = FALSE
		usr.update_inv_head(1)
	else if (!strap)
		icon_state = "adrian_greek_strap"
		item_state = "adrian_greek_strap"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "adrian_greek_strap"
		usr.visible_message("<span class = 'notice'>[usr]系上了头盔的系带.</span>", "<span class = 'notice'>你系上了头盔的系带.</span>")
		update_icon()
		strap = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/ww/adrian
	name = "M15 亚德里安头盔"
	desc = "一款标志性的 M15 亚德里安头盔,被法国士兵广泛使用."
	icon_state = "adrian_standard"
	item_state = "adrian_standard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

	var/strap = FALSE

/obj/item/clothing/head/helmet/ww/adrian/verb/toggle_strap()
	set category = null
	set src in usr
	set name = "Toggle Strap"
	if (strap)
		icon_state = "adrian_standard"
		item_state = "adrian_standard"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "adrian_standard"
		usr.visible_message("<span class = 'notice'>[usr]放下了头盔的系带.</span>", "<span class = 'notice'>你放下了头盔的系带.</span>")
		update_icon()
		strap = FALSE
		usr.update_inv_head(1)
	else if (!strap)
		icon_state = "adrian_standard_strap"
		item_state = "adrian_standard_strap"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "adrian_standard_strap"
		usr.visible_message("<span class = 'notice'>[usr]系上了头盔的系带.</span>", "<span class = 'notice'>你系上了头盔的系带.</span>")
		update_icon()
		strap = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/ww/adrian/greek
	name = "希腊 M15 亚德里安头盔"
	desc = "一款 M15 希腊亚德里安头盔,以其独特的设计而闻名."
	icon_state = "adrian_greek"
	item_state = "adrian_greek"

/obj/item/clothing/head/helmet/ww/adrian/greekmedic
	name = "医疗兵 M15 亚德里安头盔"
	desc = "一款 M15 希腊亚德里安头盔,专为医疗兵设计."
	icon_state = "m26_medic"
	item_state = "m26_medic"

/obj/item/clothing/head/helmet/ww/adriansoviet
	name = "俄罗斯 M15 亚德里安头盔"
	desc = "亚德里安头盔的苏联版本,由红军使用."
	icon_state = "adrian_russian"
	item_state = "adrian_russian"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

	var/strap = FALSE

/obj/item/clothing/head/helmet/ww/adriansoviet/verb/toggle_strap()
	set category = null
	set src in usr
	set name = "Toggle Strap"
	if (strap)
		icon_state = "adrian_russian"
		item_state = "adrian_russian"
		body_parts_covered = HEAD 
		item_state_slots["slot_wear_head"] = "adrian_standard" 
		usr.visible_message("<span class = 'notice'>[usr]放下了头盔的系带.</span>", "<span class = 'notice'>你放下了头盔的系带.</span>")
		update_icon()
		strap = FALSE
		usr.update_inv_head(1)
	else if (!strap)
		icon_state = "adrian_russian_strap"
		item_state = "adrian_russian_strap"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "adrian_standard_strap"
		usr.visible_message("<span class = 'notice'>[usr]系上了头盔的系带.</span>", "<span class = 'notice'>你系上了头盔的系带.</span>")
		update_icon()
		strap = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/ww/adrianm15medic
	name = "医疗兵 M15 亚德里安头盔"
	desc = "一款 M15 亚德里安头盔,专为医疗兵配备."
	icon_state = "m15_adrian_m"
	item_state = "m15_adrian_m"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww/adrianm26
	name = "M26 亚德里安头盔"
	desc = "一款标志性的 M26 亚德里安头盔,在其时代被广泛使用."
	icon_state = "m26_adrian"
	item_state = "m26_adrian"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

	var/strap = FALSE

/obj/item/clothing/head/helmet/ww/adrianm26/verb/toggle_strap()
	set category = null
	set src in usr
	set name = "Toggle Strap"
	if (strap)
		icon_state = "m26_adrian"
		item_state = "m26_adrian"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m26_adrian"
		usr.visible_message("<span class = 'notice'>[usr]放下了头盔的系带.</span>", "<span class = 'notice'>你放下了头盔的系带.</span>")
		update_icon()
		strap = FALSE
		usr.update_inv_head(1)
	else if (!strap)
		icon_state = "m26_adrian_s"
		item_state = "m26_adrian_s"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m26_adrian_s"
		usr.visible_message("<span class = 'notice'>[usr]系上了头盔的系带.</span>", "<span class = 'notice'>你系上了头盔的系带.</span>")
		update_icon()
		strap = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/ww/adrianm26medic
	name = "医疗兵 M26 亚德里安头盔"
	desc = "一款标志性的 M26 亚德里安头盔,专为医疗兵设计."
	icon_state = "m26_medic"
	item_state = "m26_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww/mk1brodiedeb
	name = "Mk1 布罗迪头盔"
	desc = "一款经典的英国头盔,这一顶被涂成了鸭蛋蓝."
	icon_state = "brodie_mk1_deb"
	item_state = "brodie_mk1_deb"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww/mk1brodieag
	name = "Mk1 布罗迪头盔"
	desc = "一款经典的英国头盔,这一顶被涂成了苹果绿."
	icon_state = "brodie_mk1_ag"
	item_state = "brodie_mk1_ag"

/obj/item/clothing/head/helmet/ww/mk2brodieog
	name = "Mk2 布罗迪头盔"
	desc = "一款标志性的英国头盔,这一顶被涂成了橄榄绿."
	icon_state = "brodie_mk2_og"
	item_state = "brodie_mk2_og"

/obj/item/clothing/head/helmet/ww/mk2brodiemedic
	name = "Mk2 布罗迪医疗兵头盔"
	desc = "一款专为医疗人员设计的英国头盔."
	icon_state = "brodie_mk2_medic"
	item_state = "brodie_mk2_medic"

/obj/item/clothing/head/helmet/ww/mk2brodieirish
	name = "爱尔兰 Mk2 布罗迪头盔"
	desc = "一款由爱尔兰皇家步枪队使用的 Mk2 布罗迪头盔变体."
	icon_state = "brodie_mk2_irish"
	item_state = "brodie_mk2_irish"

/obj/item/clothing/head/helmet/ww/mk2brodiegnet
	name = "带绿色网罩的 Mk2 布罗迪头盔"
	desc = "一款配备绿色网罩以提供额外伪装的英国头盔."
	icon_state = "brodie_mk2_netgreen"
	item_state = "brodie_mk2_netgreen"

/obj/item/clothing/head/helmet/ww/mk2brodietnet
	name = "带棕褐色网罩的 Mk2 布罗迪头盔"
	desc = "一顶配有棕褐色网罩以增强伪装的英军头盔."
	icon_state = "brodie_mk2_nettan"
	item_state = "brodie_mk2_nettan"

/obj/item/clothing/head/helmet/ww/mk2brodieog/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/leaf))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把树叶插在头盔上.</span>", "<span class='notice'>你把树叶插在头盔上.</span>")
		new/obj/item/clothing/head/helmet/ww/mk2brodiegnet(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/ww/mk2brodiegnet/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/leaf))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把树叶插在头盔上.</span>", "<span class='notice'>你把树叶插在头盔上.</span>")
		new/obj/item/clothing/head/helmet/ww/mk2brodiegreennetf(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/ww/mk2brodietnet/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/leaf))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把树叶插在头盔上.</span>", "<span class='notice'>你把树叶插在头盔上.</span>")
		new/obj/item/clothing/head/helmet/ww/mk2brodietannetf(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/ww/mk2brodietannetf
	name = "带伪装的Mk2布罗迪头盔"
	desc = "一顶配有棕褐色网罩和树叶用于伪装的英军头盔."
	icon_state = "brodie_mk2_nettanf"
	item_state = "brodie_mk2_nettanf"

/obj/item/clothing/head/helmet/ww/mk2brodiegreennetf
	name = "带伪装的Mk2布罗迪头盔"
	desc = "一顶配有绿色网罩和树叶用于伪装的英军头盔."
	icon_state = "brodie_mk2_netgreenf"
	item_state = "brodie_mk2_netgreenf"

/obj/item/clothing/head/helmet/ww/pickelhaube2
	name = "皮质尖顶盔"
	desc = "一顶典型的尖顶头盔."
	icon_state = "pickelhaube2"
	item_state = "pickelhaube2"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 30, arrow = 30, gun = 3, energy = 10, bomb = 35, bio = 20, rad = FALSE)

/* GLASSES */

/obj/item/clothing/glasses/pilot
	name = "飞行员护目镜"
	desc = "20世纪初的飞行员护目镜." //Probably shouldn't belong in here [apparel_worldwars.dm] then, more like apparel_earlymodern.dm
	icon_state = "biker"
	item_state = "biker"

/* GULAG */

/obj/item/clothing/under/ww2/gulag_prisoner
	name = "古拉格囚服"
	desc = "一套破旧的古拉格囚服."
	icon_state = "gulagprisoner"
	item_state = "gulagprisoner"

/obj/item/clothing/under/ww2/bagne_prisoner
	name = "苦役囚服"
	desc = "一套破旧的囚服,通常为法国苦役场的囚犯所穿."
	icon_state = "bagneprisoner"
	item_state = "bagneprisoner"

////////////////////////////////////////////////////////////////////////
///////////////////////////////WW2 JAPS/////////////////////////////////
////////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/helmet/ww2
	health = 20

/obj/item/clothing/head/helmet/ww2/japsakurahelm
	name = "日本樱花头盔"
	desc = "一顶\"阿德里安\"样式的日本头盔,顶部有樱花形状的通风孔."
	icon_state = "sakura_helm"
	item_state = "sakura_helm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 33, arrow = 25, gun = 8, energy = 15, bomb = 38, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/japhelm
	name = "日本头盔"
	desc = "这顶日本头盔采用经典的圆钢设计,通常由前线士兵佩戴."
	icon_state = "japhelm"
	item_state = "japhelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 43, arrow = 33, gun = 10, energy = 15, bomb = 44, bio = 20, rad = FALSE)
	var/has_headband = FALSE
	var/has_havelock = FALSE

/obj/item/clothing/head/helmet/ww2/japhelm/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/ww2/japhelm)
		return
	else
		if (has_headband && !has_havelock)
			item_state = "japhelm"
			icon_state = "japhelm"
			item_state_slots["slot_w_uniform"] = "japhelm"
			usr.visible_message("<span class='notice'>[usr]从他们的头盔上取下了防汗带.</span>", "<span class='notice'>你从你的头盔上取下了防汗带.</span>")
			has_headband = FALSE
			new/obj/item/clothing/head/ww2/jap_headband(user.loc)
			update_clothing_icon()
		else if (has_havelock && !has_headband)
			item_state = "japhelm"
			icon_state = "japhelm"
			item_state_slots["slot_w_uniform"] = "japhelm"
			usr.visible_message("<span class='notice'>[usr]从他们的头盔上取下了遮阳布.</span>", "<span class='notice'>你从你的头盔上取下了遮阳布.</span>")
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else if (has_headband && has_havelock)
			item_state = "japhelm"
			icon_state = "japhelm"
			item_state_slots["slot_w_uniform"] = "japhelm"
			usr.visible_message("<span class='notice'>[usr]从他们的头盔上取下了遮阳布和防汗带.</span>", "<span class='notice'>你从你的头盔上取下了遮阳布和防汗带.</span>")
			has_havelock = FALSE
			has_headband = FALSE
			new/obj/item/havelock(user.loc)
			new/obj/item/clothing/head/ww2/jap_headband(user.loc)
			update_clothing_icon()
		else if (!has_headband && !has_havelock)
			item_state = "japhelm"
			icon_state = "japhelm"
			item_state_slots["slot_w_uniform"] = "japhelm"
			to_chat(usr, SPAN_WARNING("You have nothing attached to your helmet!"))
			update_clothing_icon()


/obj/item/clothing/head/helmet/ww2/japhelm/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/clothing/head/ww2/jap_headband) && !has_headband)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把防汗带装到了他们的头盔上.</span>", "<span class='notice'>你把防汗带装到了你的头盔上.</span>")
		src.has_headband = TRUE
		qdel(W)
		if(src.has_havelock == TRUE)
			src.item_state = "japhelm_bandana_extended"
			src.icon_state = "japhelm_bandana_extended"
		else
			src.item_state = "japhelm_bandana"
			src.icon_state = "japhelm_bandana"
		update_clothing_icon()
		return
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, SPAN_NOTICE("You place the havelock on the helmet."))
		src.has_havelock = TRUE
		qdel(W)
		if(src.has_headband == TRUE)
			src.item_state = "japhelm_bandana_extended"
			src.icon_state = "japhelm_bandana_extended"
		else
			src.item_state = "japhelm_extended"
			src.icon_state = "japhelm_extended"
		update_clothing_icon()
		return


/obj/item/clothing/head/helmet/ww2/japhelm_snlf
	name = "日本海军陆战队头盔"
	desc = "这顶日本海军陆战队头盔采用经典的圆钢设计,是日本海军特别陆战队士兵的标准装备."
	icon_state = "japhelm_snlf"
	item_state = "japhelm_snlf"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 43, arrow = 33, gun = 10, energy = 15, bomb = 44, bio = 20, rad = FALSE)
	var/has_havelock = FALSE

/obj/item/clothing/head/helmet/ww2/japhelm_snlf/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/ww2/japhelm_snlf)
		return
	else
		if (has_havelock)
			item_state = "japhelm_snlf"
			icon_state = "japhelm_snlf"
			item_state_slots["slot_w_uniform"] = "japhelm_snlf"
			usr.visible_message("<span class='notice'>[usr]从他们的头盔上取下了遮阳布.</span>", "<span class='notice'>你从你的头盔上取下了遮阳布.</span>")
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else
			item_state = "japhelm_snlf"
			icon_state = "japhelm_snlf"
			item_state_slots["slot_w_uniform"] = "japhelm_snlf"
			to_chat(usr, SPAN_WARNING("You have nothing attached to the helmet!"))
			update_clothing_icon()

/obj/item/clothing/head/helmet/ww2/japhelm_snlf/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把遮阳布装到了他们的头盔上.</span>", "<span class='notice'>你把遮阳布装到了你的头盔上.</span>")
		src.has_havelock = TRUE
		qdel(W)
		src.item_state = "japhelm_snlf_extended"
		src.icon_state = "japhelm_snlf_extended"
		update_clothing_icon()
		return



/obj/item/clothing/head/helmet/ww2/japhelm_med
	name = "日本医疗兵头盔"
	desc = "这顶日本医疗兵头盔采用典型的圆钢设计,带有医疗兵的识别标志,表明其由日本医疗人员使用"
	icon_state = "japhelm_medic"
	item_state = "japhelm_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 43, arrow = 33, gun = 10, energy = 15, bomb = 44, bio = 20, rad = FALSE)
	var/has_havelock = FALSE

/obj/item/clothing/head/helmet/ww2/japhelm_med/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/helmet/ww2/japhelm_med)
		return
	else
		if (has_havelock)
			item_state = "japhelm_medic"
			icon_state = "japhelm_medic"
			item_state_slots["slot_w_uniform"] = "japhelm_medic"
			usr.visible_message("<span class='notice'>[usr]从他们的头盔上取下了遮阳布.</span>", "<span class='notice'>你从你的头盔上取下了遮阳布.</span>")
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else
			item_state = "japhelm_medic"
			icon_state = "japhelm_medic"
			item_state_slots["slot_w_uniform"] = "japhelm_medic"
			to_chat(usr, SPAN_WARNING("You have nothing attached to the helmet!"))
			update_clothing_icon()

/obj/item/clothing/head/helmet/ww2/japhelm_med/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把遮阳布装到了他们的头盔上.</span>", "<span class='notice'>你把遮阳布装到了你的头盔上.</span>")
		src.has_havelock = TRUE
		qdel(W)
		src.item_state = "japhelm_med_extended"
		src.icon_state = "japhelm_med_extended"
		update_clothing_icon()
		return

/obj/item/clothing/head/helmet/ww2/japhelm_tanker
	name = "日本坦克兵头盔"
	desc = "这顶日本坦克兵头盔由坚固的网材和坚韧的皮革混合制成,采用典型的圆钢设计,为日本坦克乘员提供可靠的保护."
	icon_state = "japtanker"
	item_state = "japtanker"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 20, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/japhelm/bandana
	has_headband = TRUE
/obj/item/clothing/head/helmet/ww2/japhelm/bandana/New()
	..()
	update_clothing_icon()

/obj/item/clothing/head/ww2/japcap
	name = "日本军帽"
	desc = "一顶大日本帝国陆军佩戴的军帽."
	icon_state = "ww2_japcap"
	item_state = "ww2_japcap"
	var/has_havelock = FALSE

/obj/item/clothing/head/ww2/japcap/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ww2/japcap)
		return
	else
		if (has_havelock)
			item_state = "ww2_japcap"
			icon_state = "ww2_japcap"
			item_state_slots["slot_w_uniform"] = "ww2_japcap"
			usr.visible_message("<span class='danger'>[usr]从他们的军帽上取下了遮阳布.</span>", "<span class='danger'>你从你的军帽上取下了遮阳布.</span>")
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else
			item_state = "ww2_japcap"
			icon_state = "ww2_japcap"
			item_state_slots["slot_w_uniform"] = "ww2_japcap"
			to_chat(usr, SPAN_WARNING("You have nothing attached to the cap!"))
			update_clothing_icon()

/obj/item/clothing/head/ww2/japcap/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把遮阳布装到了他们的军帽上.</span>", "<span class='notice'>你把遮阳布装到了你的军帽上.</span>")
		src.has_havelock = TRUE
		qdel(W)
		src.item_state = "ww2_japcap_extended"
		src.icon_state = "ww2_japcap_extended"
		update_clothing_icon()
		return

/obj/item/clothing/head/ww2/japoffcap
	name = "日本军官帽"
	desc = "一顶日本军官佩戴的军帽."
	icon_state = "ww2_japoffcap"
	item_state = "ww2_japoffcap"
	var/has_havelock = FALSE

/obj/item/clothing/head/ww2/japoffcap/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ww2/japoffcap)
		return
	else
		if (has_havelock)
			item_state = "ww2_japoffcap"
			icon_state = "ww2_japoffcap"
			item_state_slots["slot_w_uniform"] = "ww2_japoffcap"
			usr.visible_message("<span class='notice'>[usr]从他们的军帽上取下了遮阳布.</span>", "<span class='notice'>你从你的军帽上取下了遮阳布.</span>") // Removing here has no sound, and some more havelocks down the code.
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else
			item_state = "ww2_japoffcap"
			icon_state = "ww2_japoffcap"
			item_state_slots["slot_w_uniform"] = "ww2_japoffcap"
			to_chat(usr, SPAN_WARNING("You have nothing attached to the cap!"))
			update_clothing_icon()
/obj/item/clothing/head/ww2/japoffcap/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把遮阳布装到了他们的军帽上.</span>", "<span class='notice'>你把遮阳布装到了你的军帽上.</span>")
		src.has_havelock = TRUE
		qdel(W)
		src.item_state = "ww2_japoffcap_extended"
		src.icon_state = "ww2_japoffcap_extended"
		update_clothing_icon()
		return

/obj/item/clothing/head/ww2/japcap_navy_officer
	name = "日本海军军官帽"
	desc = "一顶日本海军军官佩戴的军帽."
	icon_state = "ww2_japcap_navy_officer"
	item_state = "ww2_japcap_navy_officer"

/obj/item/clothing/head/ww2/japcap_navy_po
	name = "日本海军士官帽"
	desc = "一顶日本海军士官佩戴的军帽."
	icon_state = "ww2_japcap_navy"
	item_state = "ww2_japcap_navy"

/obj/item/clothing/head/ww2/japcap_navy_cap
	name = "日本水兵帽"
	desc = "一顶日本水兵佩戴的军帽."
	icon_state = "japanese_sailor_hat"
	item_state = "japanese_sailor_hat"

/obj/item/clothing/head/ww2/japcap_snlf
	name = "日本军帽"
	desc = "一顶大日本帝国陆军佩戴的军帽,尤其是海军特别陆战队军衔者所戴."
	icon_state = "ww2_japcap_snlf"
	item_state = "ww2_japcap_snlf"
	var/has_havelock = FALSE

/obj/item/clothing/head/ww2/japcap_snlf/verb/strip_accessories(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ww2/japcap_snlf)
		return
	else
		if (has_havelock)
			item_state = "ww2_japcap_snlf"
			icon_state = "ww2_japcap_snlf"
			item_state_slots["slot_w_uniform"] = "ww2_japcap_snlf"
			usr.visible_message("<span class='notice'>[usr]从他们的军帽上取下了遮阳布.</span>", "<span class='notice'>你从你的军帽上取下了遮阳布.</span>")
			has_havelock = FALSE
			new/obj/item/havelock(user.loc)
			update_clothing_icon()
		else
			item_state = "ww2_japcap_snlf"
			icon_state = "ww2_japcap_snlf"
			item_state_slots["slot_w_uniform"] = "ww2_japcap_snlf"
			to_chat(usr, SPAN_WARNING("You have nothing attached to the cap!"))
			update_clothing_icon()

/obj/item/clothing/head/ww2/japcap_snlf/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/havelock) && !has_havelock)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class='notice'>[user]把遮阳布装到了他们的军帽上.</span>", "<span class='notice'>你把遮阳布装到了你的军帽上.</span>")
		src.has_havelock = TRUE
		qdel(W)
		src.item_state = "ww2_japcap_snlf_extended"
		src.icon_state = "ww2_japcap_snlf_extended"
		update_clothing_icon()
		return

/obj/item/clothing/under/ww2/japoffuni
	name = "日本军官制服"
	desc = "一套大日本帝国陆军军官制服."
	icon_state = "ww2_japoffuni"
	item_state = "ww2_japoffuni"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/japoffuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/japoffuni)
		return
	else
		if (rolled)
			item_state = "ww2_japoffuni"
			icon_state = "ww2_japoffuni"
			item_state_slots["w_uniform"] = "ww2_japoffuni"
			usr.visible_message("<span class='notice'>[usr]放下了他们制服的袖子.</span>", "<span class='notice'>你放下了你制服的袖子.</span>")
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_japoffuni_rolled"
			icon_state = "ww2_japoffuni_rolled"
			item_state_slots["w_uniform"] = "ww2_japoffuni_rolled"
			usr.visible_message("<span class='notice'>[usr]卷起了他们制服的袖子.</span>", "<span class='notice'>你卷起了你制服的袖子.</span>")
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/japuni
	name = "日本军服"
	desc = "大日本帝国陆军军服."
	icon_state = "ww2_japuni"
	item_state = "ww2_japuni"
	var/rolled = FALSE
	var/stripped = FALSE

/obj/item/clothing/under/ww2/japuni/update_icon()
	if (map && (map.ID == MAP_NANKOU || map.ID == MAP_NANJING))
		item_state = "1937_japuni"
		icon_state = "1937_japuni"
	else
		item_state = "ww2_japuni"
		icon_state = "ww2_japuni"

/obj/item/clothing/under/ww2/japuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/japuni)
		return
	else
		if (!stripped)
			if (rolled)
				if (map.ID == MAP_NANKOU || map.ID == MAP_NANJING)
					item_state = "1937_japuni"
					icon_state = "1937_japuni"
					item_state_slots["w_uniform"] = "1937_japuni"
					usr.visible_message("<span class='notice'>[usr]放下了制服的袖子.</span>", "<span class='notice'>你放下了制服的袖子.</span>")
					rolled = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
				else
					item_state = "ww2_japuni"
					icon_state = "ww2_japuni"
					item_state_slots["w_uniform"] = "ww2_japuni"
					usr.visible_message("<span class='notice'>[usr]放下了制服的袖子.</span>", "<span class='notice'>你放下了制服的袖子.</span>")
					rolled = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
			if (!rolled)
				if (map.ID == MAP_NANKOU || map.ID == MAP_NANJING)
					item_state = "1937_japuni_rolled"
					icon_state = "1937_japuni_rolled"
					item_state_slots["w_uniform"] = "1937_japuni_rolled"
					usr.visible_message("<span class='notice'>[usr]卷起了制服的袖子.</span>", "<span class='notice'>你卷起了制服的袖子.</span>")
					rolled = TRUE
					heat_protection = ARMS
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
					update_clothing_icon()
					return
				else
					item_state = "ww2_japuni_rolled"
					icon_state = "ww2_japuni_rolled"
					item_state_slots["w_uniform"] = "ww2_japuni_rolled"
					usr.visible_message("<span class='notice'>[usr]卷起了制服的袖子.</span>", "<span class='notice'>你卷起了制服的袖子.</span>")
					rolled = TRUE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
		else
			if (rolled)
				item_state = "japuni_summer"
				icon_state = "japuni_summer"
				item_state_slots["w_uniform"] = "japuni_summer"
				usr.visible_message("<span class='notice'>[usr]放下了衬衣的袖子.</span>", "<span class='notice'>你放下了衬衣的袖子.</span>")
				rolled = FALSE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return
			else
				item_state = "japuni_summer_rolled"
				icon_state = "japuni_summer_rolled"
				item_state_slots["w_uniform"] = "japuni_summer_rolled"
				usr.visible_message("<span class='notice'>[usr]卷起了衬衣的袖子.</span>", "<span class='notice'>你卷起了衬衣的袖子.</span>")
				rolled = TRUE
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
				update_clothing_icon()
				return

/obj/item/clothing/under/ww2/japuni/verb/strip()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/japuni)
		return
	else
		if (stripped)
			if (map.ID == MAP_NANKOU || map.ID == MAP_NANJING)
				if (!rolled)
					item_state = "1937_japuni"
					icon_state = "1937_japuni"
					item_state_slots["w_uniform"] = "1937_japuni"
					usr.visible_message("<span class='notice'>[usr]穿上了制服.</span>", "<span class='notice'>你穿上了制服.</span>")
					stripped = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
				else
					item_state = "1937_japuni_rolled"
					icon_state = "1937_japuni_rolled"
					item_state_slots["w_uniform"] = "1937_japuni_rolled"
					usr.visible_message("<span class='notice'>[usr]穿上了制服.</span>", "<span class='notice'>你穿上了制服.</span>")
					stripped = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
			else
				if (!rolled)
					item_state = "ww2_japuni"
					icon_state = "ww2_japuni"
					item_state_slots["w_uniform"] = "ww2_japuni"
					usr.visible_message("<span class='notice'>[usr]穿上了制服.</span>", "<span class='notice'>你穿上了制服.</span>")
					stripped = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
				else
					item_state = "ww2_japuni_rolled"
					icon_state = "ww2_japuni_rolled"
					item_state_slots["w_uniform"] = "1937_japuni_rolled"
					usr.visible_message("<span class='notice'>[usr]穿上了制服.</span>", "<span class='notice'>你穿上了制服.</span>")
					stripped = FALSE
					cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
					update_clothing_icon()
					return
		else
			if (!rolled)
				item_state = "japuni_summer"
				icon_state = "japuni_summer"
				item_state_slots["w_uniform"] = "japuni_summer"
				usr.visible_message("<span class='notice'>[usr]脱到只剩衬衣.</span>", "<span class='notice'>你脱到只剩衬衣.</span>")
				stripped = TRUE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return
			else
				item_state = "japuni_summer_rolled"
				icon_state = "japuni_summer_rolled"
				item_state_slots["w_uniform"] = "japuni_summer_rolled"
				usr.visible_message("<span class='notice'>[usr]脱到只剩衬衣.</span>", "<span class='notice'>你脱到只剩衬衣.</span>")
				stripped = TRUE
				heat_protection = ARMS
				cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
				update_clothing_icon()
				return

/obj/item/clothing/under/ww2/japuni/New()
	..()
	update_clothing_icon()

/obj/item/clothing/under/ww2/japuni_navy
	name = "日本海军军服"
	desc = "大日本帝国海军军服."
	icon_state = "ww2_japuni_navy"
	item_state = "ww2_japuni_navy"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/japuni_navy/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/japuni_navy)
		return
	else
		if (rolled)
			item_state = "japuni_navy"
			icon_state = "japuni_navy"
			item_state_slots["w_uniform"] = "japuni_navy"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "japuni_navy_rolled"
			icon_state = "japuni_navy_rolled"
			item_state_slots["w_uniform"] = "japuni_navy_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/japuni_navy_po
	name = "日本海军下士官军服"
	desc = "大日本帝国海军下士官军服."
	icon_state = "ww2_japuni_navy_po"
	item_state = "ww2_japuni_navy_po"

/obj/item/clothing/under/ww2/japuni_navy_officer
	name = "日本海军军官军服"
	desc = "大日本帝国海军军官军服."
	icon_state = "ww2_japuni_navy_officer"
	item_state = "ww2_japuni_navy_officer"

/obj/item/clothing/under/ww2/japuni_snlf
	name = "日本海军陆战队军服"
	desc = "一件威风的大日本帝国海军陆战队军服,由精锐海军步兵穿着,他们以擅长两栖突击作战而闻名."
	icon_state = "ww2_japuni_snlf"
	item_state = "ww2_japuni_snlf"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/japuni_snlf/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/japuni_snlf)
		return
	else
		if (rolled)
			item_state = "ww2_japuni_snlf"
			icon_state = "ww2_japuni_snlf"
			item_state_slots["w_uniform"] = "ww2_japuni_snlf"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_japuni_snlf_rolled"
			icon_state = "ww2_japuni_snlf_rolled"
			item_state_slots["w_uniform"] = "ww2_japuni_snlf_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/japuni_tanker
	name = "日本坦克兵军服"
	desc = "大日本帝国陆军军服,这一件带有坦克兵的军衔."
	icon_state = "japtanker"
	item_state = "japtanker"

/obj/item/clothing/head/ww2/jap_headband
	name = "日本头巾"
	desc = "日本士兵佩戴的头巾."
	icon_state = "japbandana"
	item_state = "japbandana"

/obj/item/clothing/accessory/harness
	name = "日本飞行员背带"
	desc = "用于将人固定在飞机上的背带."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "jap_harn"
	item_state = "jap_harn"
	ripable = FALSE
	flags = CONDUCT

/obj/item/clothing/suit/storage/coat/ww2/japcoat
	name = "日本大衣"
	desc = "大日本帝国陆军大衣."
	icon_state = "ww2_japcoat"
	item_state = "ww2_japcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65

/obj/item/clothing/suit/storage/coat/ww2/japcoat/sand
	name = "日本沙色夹克"
	desc = "大日本帝国陆军沙色夹克."

/obj/item/clothing/suit/storage/coat/ww2/japcoat_rain
	name = "日本雨衣"
	desc = "大日本帝国陆军雨衣."
	icon_state = "jap_raincoat"
	item_state = "jap_raincoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 75

/obj/item/clothing/suit/storage/coat/ww2/japcoat_pilot
	name = "日本飞行员外套"
	desc = "日本空军神风特攻队夹克."
	icon_state = "jappilotcoat"
	item_state = "jappilotcoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 100

/obj/item/clothing/head/ww2/jap_pilotcap
	name = "日本飞行员帽"
	desc = "日本飞行员佩戴的帽子."
	icon_state = "jappilotcap"
	item_state = "jappilotcap"
	flags = CONDUCT

/obj/item/clothing/head/ww2/jap_mp
	name = "宪兵队军警帽"
	desc = "大日本帝国陆军宪兵队佩戴的帽子."
	icon_state = "japcap_mp"
	item_state = "japcap_mp"

/obj/item/clothing/head/ww2/japwinter
	name = "日本冬帽"
	desc = "大日本帝国陆军士兵佩戴的冬帽."
	icon_state = "japwinter_up"
	item_state = "japwinter_up"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/ww2/japwinter/down
	icon_state = "japwinter"
	item_state = "japwinter"

/obj/item/clothing/head/ww2/japwinter/attack_self(mob/user as mob)
	if (icon_state == "japwinter")
		icon_state = "japwinter_up"
		item_state = "japwinter_up"
		to_chat(user, SPAN_NOTICE("You raise the ear flaps on the fur cap."))
	else
		icon_state = "japwinter"
		item_state = "japwinter"
		to_chat(user, SPAN_NOTICE("You lower the ear flaps on the fur cap."))

/obj/item/puttees
	name = "绑腿"
	desc = "用来防止石子进入靴子并给小腿提供支撑的腿部绑带."
	icon = 'icons/obj/items.dmi'
	icon_state = "puttees"

/obj/item/havelock
	name = "帽帘"
	desc = "挂在战斗帽上用来保护佩戴者颈部免受日晒的布片."
	icon = 'icons/obj/items.dmi'
	icon_state = "havelock"

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2
	name = "皮靴"
	desc = "一双带防滑钉的皮靴."
	icon_state = "japboots_ww2"
	item_state = "japboots_ww2"
	var/puttees = FALSE

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/update_icon()
	if (puttees)
		item_state = "japboots_ww2_puttees"
		icon_state = "japboots_ww2_puttees"
		item_state_slots["shoes"] = "japboots_ww2_puttees"
	else
		item_state = "japboots_ww2"
		icon_state = "japboots_ww2"
		item_state_slots["slot_w_uniform"] = "japboots_ww2"

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/verb/strip_off_puttees(mob/user as mob)
	set category = null
	set src in usr
	if (type != /obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2 && type != /obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/puttees && type != /obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/navy)
		return
	else
		if (puttees)
			item_state = "japboots_ww2"
			icon_state = "japboots_ww2"
			item_state_slots["slot_w_uniform"] = "japboots_ww2"
			user.visible_message("<span class = 'notice'>[user]解开了腿上的绑腿.</span>", "<span class = 'notice'>你解开了腿上的绑腿.</span>") // We don't play a sound here for some reason, TODO: enhance.
			puttees = FALSE
			new/obj/item/puttees(user.loc)
			update_clothing_icon()
		else if (!puttees)
			item_state = "japboots_ww2"
			icon_state = "japboots_ww2"
			item_state_slots["slot_w_uniform"] = "japboots_ww2"
			to_chat(usr, SPAN_WARNING("You haven't any puttees on the boots!"))
			puttees = FALSE
			update_clothing_icon()

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/puttees) && !puttees)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class = 'notice'>[user]缠上了腿上的绑腿.</span>", "<span class = 'notice'>你缠上了腿上的绑腿.</span>") // Could probably take a do_after to enhance the realism, and a better .ogg.
		src.puttees = TRUE
		qdel(W)
		src.item_state = "japboots_ww2_puttees"
		src.icon_state = "japboots_ww2_puttees"
		item_state_slots["shoes"] = "japboots_ww2_puttees"
		update_clothing_icon()
		return

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/puttees
	puttees = TRUE

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/puttees/update_icon()
	if (puttees)
		item_state = "japboots_ww2_puttees"
		icon_state = "japboots_ww2_puttees"
		item_state_slots["shoes"] = "japboots_ww2_puttees"
	else
		item_state = "japboots_ww2"
		icon_state = "japboots_ww2"
		item_state_slots["slot_w_uniform"] = "japboots_ww2"

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/puttees/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/puttees) && !puttees)
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		user.visible_message("<span class = 'notice'>[user]缠上了腿上的绑腿.</span>", "<span class = 'notice'>你缠上了腿上的绑腿.</span>") // Could probably take a do_after to enhance the realism, and a better .ogg.
		src.puttees = TRUE
		qdel(W)
		src.item_state = "japboots_ww2_puttees"
		src.icon_state = "japboots_ww2_puttees"
		item_state_slots["shoes"] = "japboots_ww2_puttees"
		update_clothing_icon()
		return

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/puttees/New()
	..()
	update_icon()

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/navy
	name = "黑皮靴"
	desc = "一双带钉皮鞋."
	icon_state = "japboots_ww2_navy"
	item_state = "japboots_ww2_navy"
	puttees = FALSE

/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/navy/puttees
	puttees = TRUE
/obj/item/clothing/shoes/heavyboots/wrappedboots/jap_ww2/navy/puttees/New()
	..()
	update_icon()

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////BRITISH////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/ww2/britishoffcap
	name = "英国军官帽"
	desc = "英国军官佩戴的帽子."
	icon_state = "ww2_british_officer"
	item_state = "ww2_british_officer"
	var/toggled = FALSE

/obj/item/clothing/head/ww2/britishoffcap/verb/toggle_flaps()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ww2/britishoffcap)
		return
	else
		if (toggled)
			item_state = "ww2_british_officer"
			icon_state = "ww2_british_officer"
			item_state_slots["slot_w_uniform"] = "ww2_british_officer"
			usr.visible_message("<span class = 'notice'>[usr]放下了帽子的护耳.</span>", "<span class = 'notice'>你放下了帽子的护耳.</span>")
			toggled = FALSE
			update_clothing_icon()
		else if (!toggled)
			item_state = "ww2_british_officer_flap"
			icon_state = "ww2_british_officer_flap"
			item_state_slots["slot_w_uniform"] = "ww2_british_officer_flap"
			usr.visible_message("<span class = 'notice'>[usr]收起了帽子的护耳.</span>", "<span class = 'notice'>你收起了帽子的护耳.</span>")
			toggled = TRUE
			update_clothing_icon()

/obj/item/clothing/head/ww2/britishoffcap_tropical
	name = "英国军官帽"
	desc = "英国军官佩戴的帽子,这顶是热带绿色."
	icon_state = "ww2_british_officer_tropical"
	item_state = "ww2_british_officer_tropical"
	var/toggled = FALSE

/obj/item/clothing/head/ww2/britishoffcap_tropical/verb/toggle_flaps()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/head/ww2/britishoffcap_tropical)
		return
	else
		if (toggled)
			item_state = "ww2_british_officer_tropical"
			icon_state = "ww2_british_officer_tropical"
			item_state_slots["slot_w_uniform"] = "ww2_british_officer_tropical"
			usr.visible_message("<span class = 'notice'>[usr]放下了帽子的护耳.</span>", "<span class = 'notice'>你放下了帽子的护耳.</span>")
			toggled = FALSE
			update_clothing_icon()
		else if (!toggled)
			item_state = "ww2_british_officer_tropical_flap"
			icon_state = "ww2_british_officer_tropical_flap"
			item_state_slots["slot_w_uniform"] = "ww2_british_officer_tropical_flap"
			usr.visible_message("<span class = 'notice'>[usr]收起了帽子的护耳.</span>", "<span class = 'notice'>你收起了帽子的护耳.</span>")
			toggled = TRUE
			update_clothing_icon()

/obj/item/clothing/under/ww2/british
	name = "英国军服"
	desc = "一套卡其色英国军服."
	icon_state = "ww2_british_tropical"
	item_state = "ww2_british_tropical"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/british/verb/roll_sleeves()
	set category = null
	set src in usr
	if (!istype(src, /obj/item/clothing/under/ww2/british))
		return
	else
		if (rolled)
			item_state = "ww2_british_tropical"
			icon_state = "ww2_british_tropical"
			item_state_slots["w_uniform"] = "ww2_british_tropical"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_british_tropical_rolled"
			icon_state = "ww2_british_tropical_rolled"
			item_state_slots["w_uniform"] = "ww2_british_tropical_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

//this is just a renamed uniform for the french colonial forces
/obj/item/clothing/under/ww2/british/french
	name = "法国殖民地军服"
	desc = "一套卡其色军服,由法国驻热带殖民地的部队穿着."

/obj/item/clothing/under/ww2/british_off
	name = "英国军官军服"
	desc = "一套热带绿色英国军官军服."
	icon_state = "ww2_british_off_tropical"
	item_state = "ww2_british_off_tropical"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/british_off/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/british_off)
		return
	else
		if (rolled)
			item_state = "ww2_british_off_tropical"
			icon_state = "ww2_british_off_tropical"
			item_state_slots["w_uniform"] = "ww2_british_off_tropical"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_british_off_tropical_rolled"
			icon_state = "ww2_british_off_tropical_rolled"
			item_state_slots["w_uniform"] = "ww2_british_off_tropical_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

/obj/item/clothing/head/ww2/british_hat
	name = "英国帽"
	desc = "一顶英国人有时佩戴的棕色帽子."
	icon_state = "ww2_aussie"
	item_state = "ww2_aussie"

/obj/item/clothing/head/ww2/british_tropical_hat
	name = "热带英国帽"
	desc = "一顶英国陆军在热带气候下佩戴的卡其色帽子."
	icon_state = "ww2_british_tropical"
	item_state = "ww2_british_tropical"

/obj/item/clothing/head/ww2/british_beret
	name = "英国贝雷帽"
	desc = "一顶英国陆军佩戴的卡其色贝雷帽."
	icon_state = "ww2_british_beret"
	item_state = "ww2_british_beret"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/ww2/chiuni
	name = "中国军服"
	desc = "一套中国红军军服."
	icon_state = "ww2_china"
	item_state = "ww2_china"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/chiuni/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/chiuni)
		return
	else
		if (rolled)
			item_state = "ww2_china"
			icon_state = "ww2_china"
			item_state_slots["w_uniform"] = "ww2_china"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_china_rolled"
			icon_state = "ww2_china_rolled"
			item_state_slots["w_uniform"] = "ww2_china_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

/obj/item/clothing/under/ww2/chiuni_off
	name = "中国军服"
	desc = "一套中国红军军服."
	icon_state = "ww2_china_off"
	item_state = "ww2_china_off"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/chiuni_off/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/chiuni_off)
		return
	else
		if (rolled)
			item_state = "ww2_china_off"
			icon_state = "ww2_china_off"
			item_state_slots["w_uniform"] = "ww2_china_off"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_china_off_rolled"
			icon_state = "ww2_china_off_rolled"
			item_state_slots["w_uniform"] = "ww2_china_off_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

/obj/item/clothing/under/ww2/chiuni2
	name = "中国军服"
	desc = "一套中国红军军服."
	icon_state = "ww2_china2"
	item_state = "ww2_china2"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/chiuni2/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/chiuni2)
		return
	else
		if (rolled)
			item_state = "ww2_china2"
			icon_state = "ww2_china2"
			item_state_slots["w_uniform"] = "ww2_china2"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_china2_rolled"
			icon_state = "ww2_china2_rolled"
			item_state_slots["w_uniform"] = "ww2_china2_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

/obj/item/clothing/under/ww2/chiuni2_off
	name = "中国军服"
	desc = "一套中国军队军服."
	icon_state = "ww2_china2_off"
	item_state = "ww2_china2_off"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/chiuni2_off/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/chiuni2_off)
		return
	else
		if (rolled)
			item_state = "ww2_china_off"
			icon_state = "ww2_china_off"
			item_state_slots["w_uniform"] = "ww2_china_off"
			usr.visible_message("<span class = 'notice'>[usr]放下了军服的袖子.</span>", "<span class = 'notice'>你放下了军服的袖子.</span>" )
			rolled = FALSE
			update_clothing_icon()
		else if (!rolled)
			item_state = "ww2_china_off_rolled"
			icon_state = "ww2_china_off_rolled"
			item_state_slots["w_uniform"] = "ww2_china_off_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了军服的袖子.</span>", "<span class = 'notice'>你卷起了军服的袖子.</span>" )
			rolled = TRUE
			update_clothing_icon()

obj/item/clothing/head/ww2/chicap
	name = "Chinese cap"
	desc = "A cap worn by the Chinese Red Army."
	icon_state = "fieldcap_china"
	item_state = "fieldcap_china"

obj/item/clothing/head/ww2/chicap2
	name = "Chinese cap"
	desc = "A cap worn by the Chinese Red Army."
	icon_state = "fieldcap_china2"
	item_state = "fieldcap_china2"

/obj/item/clothing/under/ww2/cra_uni
	name = "中国红军军服"
	desc = "一套中国红军穿着的军服."
	icon_state = "cra_uni"
	item_state = "cra_uni"

obj/item/clothing/head/ww2/cra_cap
	name = "Chinese Red Army cap"
	desc = "A cap worn by the Chinese Red Army."
	icon_state = "cra_cap"
	item_state = "cra_cap"

///////////WW1 UNIFORMS///////////
/obj/item/clothing/under/ww1/german
	name = "德国军服"
	desc = "一套德意志帝国陆军穿着的原野灰军服."
	icon_state = "ww1_german"
	item_state = "ww1_german"

/obj/item/clothing/under/ww1/british
	name = "英国军服"
	desc = "一套英国陆军穿着的卡其色军服."
	icon_state = "ww1_british"
	item_state = "ww1_british"

/obj/item/clothing/under/ww1/trenchsuit
	name = "英国军服"
	desc = "一套英国陆军士兵穿着的卡其色战壕服."
	icon_state = "trenchsuit"
	item_state = "trenchsuit"

/obj/item/clothing/under/ww1/trenchsuit/poland //looks very similiar to the ww2 polish uniform so lets pretend that its the polish uniform
	name = "波兰军服"
	desc = "一套波兰军队使用的波兰军服."

/obj/item/clothing/under/ww1/french
	name = "法国军服"
	desc = "一套法国军队使用的法国浅蓝色军服."
	icon_state = "ww1_french"
	item_state = "ww1_french"


/obj/item/clothing/accessory/storage/webbing/ww1
	name = "织带背心"
	desc = "这件织带背心包含两条结实的皮带,配有小袋用于装弹药和手榴弹,为前线士兵提供必要的储物空间."
	icon_state = "german_vest"
	item_state = "german_vest"
	slots = 8
	New()
		..()
		hold.storage_slots = slots
		hold.can_hold = list(/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade, /obj/item/weapon/attachment/bayonet,/obj/item/weapon/material/shovel/trench,/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,/obj/item/weapon/reagent_containers/food/snacks/MRE,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/mosin
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 5, i++)
			new/obj/item/ammo_magazine/mosin(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/mosinalt
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/weapon/grenade/modern/f1(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/mosinbay
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/weapon/attachment/bayonet(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/mosinaltsmoke
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/snipermosin
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/ammo_magazine/mosin(hold)
		new/obj/item/ammo_magazine/mosinbox(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/svt
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 5, i++)
			new/obj/item/ammo_magazine/svt(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/svt/frag
	New()
		..()
		new/obj/item/weapon/grenade/ww2/rgd33(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/svtassault
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		new/obj/item/ammo_magazine/svt(hold)
		new/obj/item/ammo_magazine/mosinbox(hold)
		new/obj/item/ammo_magazine/svt(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/ppsh
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 5, i++)
			new/obj/item/ammo_magazine/c762x25_ppsh(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/ppsh/grenade
	New()
		..()
		new/obj/item/weapon/grenade/ww2/rgd33(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/ppshassault
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/c762x25_ppsh(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)
		new/obj/item/weapon/grenade/ww2/rgd33(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/leather/ww2/dpgun
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/dp(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/ww2/stormgroup
	name = "突击群织带背心"
	desc = "这件织带背心由突击群穿着."
	slots = 9
	New()
		..()
		hold.can_hold = list(/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade, /obj/item/weapon/attachment/bayonet,/obj/item/weapon/material/shovel/trench,/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,/obj/item/weapon/reagent_containers/food/snacks/MRE,/obj/item/stack/medical/bruise_pack,/obj/item/weapon/gun/projectile/pistol)

obj/item/clothing/accessory/storage/webbing/ww1/ww2/stormgroup/svt
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/svt(hold)
		new/obj/item/ammo_magazine/mosinbox(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)
		new/obj/item/weapon/grenade/ww2/rgd33(hold)
		new/obj/item/weapon/compass(hold)
		new/obj/item/weapon/attachment/bayonet(hold)

obj/item/clothing/accessory/storage/webbing/ww1/ww2/stormgroup/Scout
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/c762x25_ppsh(hold)
		new/obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(hold)
		new/obj/item/weapon/grenade/ww2/rgd33(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)
		new/obj/item/weapon/compass(hold)
		new/obj/item/weapon/attachment/bayonet(hold)

/obj/item/clothing/accessory/storage/webbing/russian
	name = "俄罗斯织带背心"
	desc = "这件织带背心似乎有四个绿色聚酯小袋."
	icon_state = "russian_vest"
	item_state = "russian_vest"
	slots = 6
	New()
		..()
		hold.can_hold = list(/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade, /obj/item/weapon/attachment/bayonet,/obj/item/weapon/material/shovel/trench,/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen,/obj/item/weapon/reagent_containers/food/snacks/MRE,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/russian/guns
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)

/obj/item/clothing/accessory/storage/webbing/russian/guns/pkm
	New()
		..()
		for (var/i=1, i<=4, i++)
			new /obj/item/ammo_magazine/pkm/c100(hold)
		new /obj/item/weapon/grenade/coldwar/rgd5(hold)

/obj/item/clothing/accessory/storage/webbing/russian/guns/rpk
	New()
		..()
		new /obj/item/ammo_magazine/rpk74/drum(hold)
		for (var/i=1, i<=3, i++)
			new /obj/item/ammo_magazine/rpk74(hold)
		new /obj/item/weapon/grenade/coldwar/rgd5(hold)

/obj/item/clothing/accessory/storage/webbing/russian/guns/rpd
	New()
		..()
		for (var/i=1, i<=3, i++)
			new /obj/item/ammo_magazine/rpd(hold)
		new /obj/item/weapon/grenade/coldwar/rgd5(hold)

/obj/item/clothing/accessory/storage/webbing/russian/guns/ak47
	New()
		..()
		for (var/i=1, i<=3, i++)
			new /obj/item/ammo_magazine/ak47(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german
	name = "德军挂带背心" //ww1
	icon_state = "german_vest"
	item_state = "german_vest"

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2
	name = "德军挂带背心" //ww2
	slots = 9
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)
		new/obj/item/weapon/material/shovel/trench/foldable/etool/german(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/gewehr98 // Giving this to all sub-types is bad because the max-slots for this webbing is 9, so when you give 6 mags to the sniper, their gauze, etool and 7 ammo, exceeds 9. BUG.
	New()
		..()
		for (var/i=1, i<= 6, i++) 
			new/obj/item/ammo_magazine/gewehr98(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/gewehr98/assault
	New()
		..()
		new/obj/item/ammo_magazine/gewehr98(hold)
		new/obj/item/weapon/grenade/modern/stg1915(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/gewehr98/smoke
	New()
		..()
		new/obj/item/ammo_magazine/gewehr98(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/gewehr98/sniper
	New()
		..()
		new/obj/item/ammo_magazine/gewehr98box(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/mg34
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/mg34(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/mauser
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/mauser(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/mp40
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/mp40(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/mp40/assault
	New()
		..()
		new/obj/item/weapon/grenade/ww2/stg1924(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/fg42
	New()
		..()
		new/obj/item/ammo_magazine/fg42(hold)
		new/obj/item/ammo_magazine/fg42(hold)
		for (var/i=1, i<= 3, i++)
			new/obj/item/ammo_magazine/fg42/small(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/g43
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/g43(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/german/ww2/stg
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/stg(hold)
		new/obj/item/weapon/grenade/modern/stg1915(hold)
		new/obj/item/weapon/grenade/antitank/stg24_bundle(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/italian
	name = "意军挂带背心"
	icon_state = "german_vest"
	item_state = "german_vest"

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2/carcano
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/carcano(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2/carcano/assault
	New()
		..()
		/obj/item/weapon/grenade/modern/impact/oto35

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2/carcano/smoke
	New()
		..()
		/obj/item/weapon/grenade/smokebomb

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2/modello38
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new /obj/item/ammo_magazine/mp40/modello38(hold)
		new /obj/item/weapon/grenade/smokebomb(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/italian/ww2/breda30
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/breda30(hold)
		new/obj/item/weapon/grenade/smokebomb(hold)


/obj/item/clothing/accessory/storage/webbing/ww1/greek
	name = "希军挂带背心"
	icon_state = "german_vest"
	item_state = "german_vest"

/obj/item/clothing/accessory/storage/webbing/ww1/greek/ww2
	New()
		..()
		new/obj/item/stack/medical/bruise_pack/gauze(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/greek/ww2/c8x50
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/c8x50(hold)

/obj/item/clothing/accessory/storage/webbing/ww1/greek/ww2/c8x50/assault
	New()
		..()
		/obj/item/weapon/grenade/modern/f1

/obj/item/clothing/accessory/storage/webbing/ww1/greek/ww2/c8x50/smoke
	New()
		..()
		/obj/item/weapon/grenade/smokebomb

/obj/item/clothing/accessory/storage/webbing/ww1/french
	name = "法军挂带背心"
	icon_state = "french_vest"
	item_state = "french_vest"

/obj/item/clothing/accessory/storage/webbing/ww1/british
	name = "英军挂带背心"
	icon_state = "british_vest"
	item_state = "british_vest"

/obj/item/clothing/accessory/storage/webbing/ww1/leather
	name = "皮革挂带背心"
	icon_state = "british_vest"
	item_state = "british_vest"

/obj/item/clothing/accessory/armor/modern
	health = 20
/obj/item/clothing/accessory/armor/modern/plate
	name = "胸甲式护甲"
	desc = "由钢板制成的可穿戴护甲."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "modern_platearmor"
	item_state = "modern_platearmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 70, arrow = 95, gun = 45, energy = 15, bomb = 45, bio = 20, rad = 20)
	value = 50
	slowdown = 0.8

/obj/item/clothing/accessory/armor/modern/british
	name = "戴菲尔德式护甲"
	desc = "英国制造的可穿戴钢板护甲."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "modern_dayfield"
	item_state = "modern_dayfield"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 70, arrow = 90, gun = 40, energy = 12, bomb = 40, bio = 20, rad = 15)
	value = 50
	slowdown = 0.8

///////////////other////////////////

/obj/item/clothing/accessory/armor/modern/lightplate
	name = "轻型胸甲式护甲"
	desc = "由钢板制成的可穿戴轻型护甲."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "modern_armorvest"
	item_state = "modern_armorvest"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, arrow = 95, gun = 35, energy = 15, bomb = 45, bio = 20, rad = 20)
	value = 50
	slowdown = 0.6
	health = 50

/obj/item/clothing/accessory/armor/modern/lightplate/lead
	name = "绿色铅制胸甲式护甲"
	desc = "由钢板和铅制成的可穿戴胸甲护甲."
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 95, gun = 35, energy = 15, bomb = 45, bio = 20, rad = 60)
	value = 50
	slowdown = 0.8
	health = 50

/obj/item/clothing/accessory/armor/modern/lightplate/black
	name = "黑色轻型胸甲式护甲"
	desc = "由钢板制成的可穿戴轻型护甲."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "modern_blackvest"
	item_state = "modern_blackvest"

/obj/item/clothing/accessory/armor/modern/lightplate/black/lead
	name = "铅制胸甲式护甲"
	desc = "由钢板和铅制成的可穿戴胸甲护甲."
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 60, arrow = 95, gun = 35, energy = 15, bomb = 45, bio = 20, rad = 60)
	value = 50
	slowdown = 0.8
	health = 50

////////////////////////////////////
///////////////WW2//////////////////
////////////////////////////////////
/obj/item/clothing/under/ww2/german
	name = "德军制服"
	desc = "一套德军原野灰制服,常由国防军穿着."
	icon_state = "geruni_ww2"
	item_state = "geruni_ww2"
	var/rolled = FALSE
/*
/obj/item/clothing/under/ww2/german/New()
	..()
	if (map && (map.ID == MAP_STALINGRAD || map.ID == MAP_SMALLINGRAD))
		icon_state = "geruni_ww2_winter"
		item_state = "geruni_ww2_winter"
		item_state_slots["slot_w_uniform"] = "geruni_ww2_winter"
*/
/obj/item/clothing/under/ww2/german/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/german)
		return
	else
/*
		if (map && (map.ID == MAP_STALINGRAD || map.ID == MAP_SMALLINGRAD))
			if (rolled)
				item_state = "geruni_ww2_winter"
				item_state_slots["slot_w_uniform"] = "geruni_ww2_winter"
				to_chat(usr, "<span class = 'danger'>You roll down your uniform's sleeves.</span>")
				rolled = FALSE
			else if (!rolled)
				item_state = "geruni_ww2_winter_rolled"
				item_state_slots["slot_w_uniform"] = "geruni_ww2_winter_rolled"
				to_chat(usr, "<span class = 'danger'>You roll up your uniform's sleeves.</span>")
				rolled = TRUE
		else
*/
		if (rolled)
			item_state = "geruni_ww2"
			icon_state = "geruni_ww2"
			item_state_slots["w_uniform"] = "geruni_ww2"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "geruni_ww2_rolled"
			icon_state = "geruni_ww2_rolled"
			item_state_slots["w_uniform"] = "geruni_ww2_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/german_doctor
	name = "德军军医制服"
	desc = "一套德军原野灰制服,通常由国防军中的军医穿着."
	icon_state = "geruni_doctor"
	item_state = "geruni_doctor"
	var/rolled = FALSE

/obj/item/clothing/under/ww2/german_doctor/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/german_doctor)
		return
	else
		if (rolled)
			item_state = "geruni_doctor"
			icon_state = "geruni_doctor"
			item_state_slots["w_uniform"] = "geruni_doctor"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled)
			item_state = "geruni_doctor_rolled"
			icon_state = "geruni_doctor_rolled"
			item_state_slots["w_uniform"] = "geruni_doctor_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/german_officer
	name = "德军军官制服"
	desc = "一套德军原野灰制服,几乎总是由国防军中的军官穿着."
	icon_state = "geruni_officer"
	item_state = "geruni_officer"

/obj/item/clothing/under/ww2/german_tanker
	name = "德军坦克兵制服"
	desc = "一套德军原野灰制服,常由国防军中的坦克兵穿着."
	icon_state = "gertanker"
	item_state = "gertanker"

/obj/item/clothing/under/ww2/german_mp
	name = "德军宪兵制服"
	desc = "一套德军原野灰制服,多由国防军中的军事警察穿着."
	icon_state = "geruni_mp"
	item_state = "geruni_mp"

/obj/item/clothing/under/ww2/german_ss
	name = "德军党卫军制服"
	desc = "一套德军党卫军制服,总是由党卫队中的士兵穿着."
	icon_state = "ssuni"
	item_state = "ssuni"

/obj/item/clothing/under/ww2/german_ss_officer
	name = "德军党卫军军官制服"
	desc = "一套德军党卫军军官制服,由党卫队中的军官穿着."
	icon_state = "ssuni_officer"
	item_state = "ssuni_officer"

/obj/item/clothing/under/ww2/german_ss_camo
	name = "德军党卫军迷彩制服"
	desc = "这套德军党卫军制服采用标志性的1944年豌豆迷彩点状图案,历史上由党卫队成员穿着."
	icon_state = "ssuni_camo"
	item_state = "ssuni_camo"

/obj/item/weapon/storage/ammo_can
	name = "弹药箱"
	desc = "这个金属弹药箱专为便捷运输和储存弹药而设计."
	icon_state = "ammo_can"
	item_state = "ammo_can"
	throw_speed = 2
	throw_range = 8
	max_storage_space = 14
	max_w_class = 4
	slot_flags = SLOT_BELT | SLOT_BACK
	can_hold = list(
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/weapon/key,
		)

/obj/item/weapon/storage/ammo_can/mg34belt
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/mg34belt(src)

/obj/item/weapon/storage/ammo_can/mg34drum
	New()
		..()
		for (var/i=1, i<= 6, i++)
			new/obj/item/ammo_magazine/mg34(src)

/obj/item/weapon/storage/ammo_can/bar
	New()
		..()
		for (var/i=1, i<= 6, i++)
			new/obj/item/ammo_magazine/bar(src)

/obj/item/weapon/storage/ammo_can/browning
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new/obj/item/ammo_magazine/browning(src)

/obj/item/weapon/storage/ammo_can/ak74
	New()
		..()
		for (var/i=1, i<= 7, i++)
			new/obj/item/ammo_magazine/ak74(src)

/obj/item/weapon/storage/ammo_can/m16
	New()
		..()
		for (var/i=1, i<=4, i++)
			new/obj/item/ammo_magazine/m16(src)
		for (var/i=1, i<=2, i++)
			new/obj/item/ammo_magazine/m16/box(src)

/obj/item/weapon/storage/ammo_can/dp
	New()
		..()
		for (var/i=1, i<=6, i++)
			new/obj/item/ammo_magazine/dp(src)

/obj/item/weapon/storage/ammo_can/breda30
	New()
		..()
		for (var/i=1, i<=6, i++)
			new/obj/item/ammo_magazine/breda30(src)

/obj/item/weapon/storage/ammo_can/german_mg
/obj/item/weapon/storage/ammo_can/german_mg/New()
	..()
	for (var/i=1, i<=4, i++)
		new/obj/item/ammo_magazine/mg34belt(src)

/obj/item/weapon/storage/ammo_can/german_mg_drum
/obj/item/weapon/storage/ammo_can/german_mg_drum/New()
	..()
	for (var/i=1, i<=6, i++)
		new/obj/item/ammo_magazine/mg34(src)

/obj/item/weapon/storage/ammo_can/american_bar
/obj/item/weapon/storage/ammo_can/american_bar/New()
	..()
	for (var/i=1, i<=6, i++)
		new/obj/item/ammo_magazine/bar(src)

/obj/item/weapon/storage/ammo_can/american_mg
/obj/item/weapon/storage/ammo_can/american_mg/New()
	..()
	for (var/i=1, i<=4, i++)
		new/obj/item/ammo_magazine/browning(src)

/obj/item/weapon/storage/ammo_can/ak74
/obj/item/weapon/storage/ammo_can/ak74/New()
	..()
	for (var/i=1, i<=6, i++)
		new/obj/item/ammo_magazine/ak74(src)

/obj/item/weapon/storage/ammo_can/stanag
/obj/item/weapon/storage/ammo_can/stanag/New()
	..()
	for (var/i=1, i<=3, i++)
		new/obj/item/ammo_magazine/m16(src)
	for (var/i=1, i<=2, i++)
		new/obj/item/ammo_magazine/m16/box(src)

/obj/item/weapon/storage/ammo_can/dp
/obj/item/weapon/storage/ammo_can/dp/New()
	..()
	for (var/i=1, i<=6, i++)
		new/obj/item/ammo_magazine/dp(src)

/obj/item/clothing/under/ww2/soviet
	name = "苏军制服"
	desc = "一套苏军制服,由红军步兵穿着."
	icon_state = "sovuni"
	item_state = "sovuni"
	var/rolled = FALSE
/obj/item/clothing/under/ww2/soviet/update_icon()
	if (ishuman(loc))
		var/mob/living/human/H = loc
		if (H.gender == "female")
		else

/obj/item/clothing/under/ww2/soviet/verb/roll_sleeves()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/under/ww2/soviet)
		return
	else
		if (rolled && usr.gender == "male")
			item_state = "sovuni"
			icon_state = "sovuni"
			item_state_slots["w_uniform"] = "sovuni"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled && usr.gender == "male")
			item_state = "sovuni_rolled"
			icon_state = "sovuni_rolled"
			item_state_slots["w_uniform"] = "sovuni_rolled"
			to_chat(usr, "<span class = 'danger'>你卷起了制服的袖子.</span>")
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()
		if (rolled && usr.gender == "female")
			item_state = "sovuni"
			icon_state = "sovuni"
			item_state_slots["w_uniform"] = "sovuni"
			usr.visible_message("<span class = 'notice'>[usr]放下了制服的袖子.</span>", "<span class = 'notice'>你放下了制服的袖子.</span>" )
			rolled = FALSE
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
			update_clothing_icon()
		else if (!rolled && usr.gender == "female")
			item_state = "sovuni_rolled"
			icon_state = "sovuni_rolled"
			item_state_slots["w_uniform"] = "sovuni_rolled"
			usr.visible_message("<span class = 'notice'>[usr]卷起了制服的袖子.</span>", "<span class = 'notice'>你卷起了制服的袖子.</span>" )
			rolled = TRUE
			heat_protection = ARMS
			cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
			update_clothing_icon()

/obj/item/clothing/under/ww2/soviet_tanker
	name = "苏军坦克兵制服"
	desc = "一套苏军坦克兵制服,由红军中的坦克乘员穿着."
	icon_state = "sovtanker"
	item_state = "sovtanker"

/obj/item/clothing/under/ww2/soviet_officer
	name = "苏军军官制服"
	desc = "一套苏军军官制服,由红军中的军官穿着."
	icon_state = "sovuni_officer"
	item_state = "sovuni_officer"

/obj/item/clothing/under/ww2/soviet_nkvd
	name = "内务人民委员部制服"
	desc = "一套苏联内务人民委员部制服,由内务人民委员部成员穿着."
	icon_state = "nkvd_uni"
	item_state = "nkvd_uni"

/obj/item/clothing/under/ww2/soviet_berezka
	name = "苏军白桦迷彩制服"
	desc = "一套苏军白桦迷彩制服,适应冬季荒野环境."
	icon_state = "berezka"
	item_state = "berezka"

/obj/item/clothing/under/ww2/soviet_amoeba
	name = "苏军变形虫迷彩服"
	desc = "一套苏军迷彩服,专为侦察部队设计."
	icon_state = "amoeba"
	item_state = "amoeba"

/obj/item/clothing/under/ww2/soviet_amoeba/winter
	name = "苏军冬季变形虫迷彩服"
	desc = "这套苏军冬季迷彩服专为侦察部队设计,可在雪地地形中提供有效隐蔽."
	icon_state = "amoebaw"
	item_state = "amoebaw"

/obj/item/clothing/shoes/jackboots/soviet
	name = "苏军长靴"
	desc = "苏联产的长筒靴.又称'尤夫捷维耶长靴'."
	icon_state = "sovietboots"
	item_state = "sovietboots"

/obj/item/clothing/under/ww2/italian
	name = "意军制服"
	desc = "一套意军制服,由意大利皇家陆军穿着."
	icon_state = "it_uni"
	item_state = "it_uni"

/obj/item/clothing/under/ww2/italian_officer
	name = "意军军官制服"
	desc = "一套意军制服,由意大利皇家陆军的军官穿着."
	icon_state = "it_uni_officer"
	item_state = "it_uni_officer"

/obj/item/clothing/under/ww2/greek
	name = "希军制服"
	desc = "希腊军装."
	icon_state = "ww2_japuni"
	item_state = "ww2_japuni"

/obj/item/clothing/under/ww2/civ1
	name = "绿色平民服装"
	desc = "20世纪中期的平民服装."
	icon_state = "ww2_civuni1"
	item_state = "ww2_civuni1"

/obj/item/clothing/under/ww2/civ2
	name = "棕色平民服装"
	desc = "20世纪中期的平民服装."
	icon_state = "ww2_civuni2"
	item_state = "ww2_civuni2"

/obj/item/clothing/under/ww2/hitlerjugend
	name = "希特勒青年团服装"
	desc = "希特勒青年团的标准制服."
	icon_state = "hj_uni"
	icon_state = "hj_uni"
	icon_state = "hj_uni"


///////////////////////////////////////////////////UNITED STATES/////////////////////////////////////////
/obj/item/clothing/under/ww2/us
	name = "美军制服"
	desc = "美军制服,二战期间美国陆军士兵穿着."
	icon_state = "usuni2"
	item_state = "usuni2"

/obj/item/clothing/under/ww2/us_tanker
	name = "美军坦克兵制服"
	desc = "美军制服,美国陆军坦克兵穿着."
	icon_state = "ustanker"
	item_state = "ustanker"

/obj/item/clothing/under/ww2/us_navy
	name = "美国海军制服"
	desc = "美军制服,二战期间美国海军水兵穿着."
	icon_state = "us_navy"
	item_state = "us_navy"

/obj/item/clothing/under/ww2/us_cap
	name = "美军上尉制服"
	desc = "美军制服,美国陆军上尉穿着."
	icon_state = "usuni_cap"
	item_state = "usuni_cap"

/obj/item/clothing/under/ww2/us_mp
	name = "美军宪兵制服"
	desc = "美军制服,美国陆军宪兵穿着."
	icon_state = "usuni_mp"
	item_state = "usuni_mp"

/obj/item/clothing/under/ww2/us_shirtless
	name = "美军衬衫制服"
	desc = "美军制服,美国陆军士兵穿着,这件没有外套."
	icon_state = "us_shirtless"
	item_state = "us_shirtless"

/obj/item/clothing/suit/storage/coat/ww2/us_coat
	name = "美军大衣"
	desc = "美国陆军大衣."
	icon_state = "us_coat"
	item_state = "us_coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/shoes/us_ww2_boots
	name = "棕色靴子"
	desc = "棕色皮革制成的作战靴,带有鞋头和橡胶鞋底."
	icon_state = "brownboots"
	item_state = "brownboots_us_ww2"
	force = WEAPON_FORCE_WEAK
	armor = list(melee = 10, arrow = 20, gun = 0, energy = 25, bomb = 50, bio = 10, rad = 0)
	item_flags = NOSLIP
	siemens_coefficient = 0.6
	cold_protection = FEET
	min_cold_protection_temperature = SHOE_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/shoes/us_ww2_boots/leggings
	name = "带绑腿的棕色靴子"
	desc = "这些作战靴由耐用的棕色皮革制成,带有鞋头和橡胶鞋底.它们配有防护绑腿,为穿着者的腿部提供额外的覆盖和支撑."
	icon_state = "brownboots_us_ww2_alt"
	item_state = "brownboots_us_ww2_alt"

/obj/item/clothing/accessory/storage/webbing/us_ww2
	name = "美军携行具"
	desc = "卡其色帆布弹药包组,共有10个弹药包,用于装弹药和其他各种物品"
	icon_state = "us_webbing"
	item_state = "us_webbing"
	New()
		..()
		hold.storage_slots = slots
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,/obj/item/weapon/key,/obj/item/ammo_casing, /obj/item/ammo_magazine, /obj/item/weapon/grenade,/obj/item/weapon/attachment,/obj/item/weapon/handcuffs,/obj/item/stack/medical/bruise_pack)

/obj/item/clothing/accessory/storage/webbing/us_ww2/garand
	New()
		..()
		new /obj/item/stack/medical/bruise_pack/gauze(hold)
		for (var/i=1, i<=8, i++)
			new /obj/item/ammo_magazine/garand(hold)

////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/ww2/finnish
	name = "芬兰制服"
	desc = "芬兰冬季制服."
	icon_state = "geruni_ww2_winter"
	item_state = "geruni_ww2_winter"

/obj/item/clothing/suit/storage/coat/ww2/german
	name = "德军派克大衣"
	desc = "德军派克大衣,国防军士兵穿着."
	icon_state = "gerparka"
	item_state = "gerparka"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65

/obj/item/clothing/suit/storage/coat/ww2/german/winter
	icon_state = "gerparka_winter"
	item_state = "gerparka_winter"
	name = "德军冬季大衣"
	desc = "德军大衣,国防军士兵穿着."
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT|LOWER_TORSO

/obj/item/clothing/suit/storage/coat/ww2/german/civ
	name = "灰色派克大衣"
	desc = "灰色派克大衣,冬季保暖效果好."

/obj/item/clothing/suit/storage/coat/ww2/german_officer
	name = "德军军官大衣"
	desc = "德军军官大衣,国防军军官穿着."
	icon_state = "ger_offcoat"
	item_state = "ger_offcoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/ss_parka
	name = "党卫军派克大衣"
	desc = "一件德军\'党卫军\'派克大衣,1944年豌豆迷彩,党卫军士兵穿着."
	icon_state = "sssmock"
	item_state = "sssmock"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65

/obj/item/clothing/suit/storage/coat/ww2/soviet
	name = "苏联大衣"
	desc = "苏联风衣,红军红军战士穿着."
	icon_state = "ruscoat"
	item_state = "ruscoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65


/obj/item/clothing/suit/storage/coat/ww2/sovcoat
	name = "苏联冬季大衣"
	desc = "传统苏联大衣,深黄色."
	icon_state = "gulagguard"
	item_state = "gulagguard"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/suit/storage/coat/ww2/sovcoat2
	name = "苏联冬季大衣"
	desc = "传统苏联大衣,浅蓝色."
	icon_state = "gulagprisoner1"
	item_state = "gulagprisoner1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 65
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	New()
		..()
		icon_state = "gulagprisoner[rand(1,3)]"
		item_state = icon_state

/obj/item/clothing/suit/storage/coat/ww2/soviet_officer
	name = "苏联军官大衣"
	desc = "苏联风衣,红军军官穿着."
	icon_state = "sov_offcoat"
	item_state = "sov_offcoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	value = 65

/obj/item/clothing/suit/storage/coat/ww2/soviet_officer/alt
	icon_state = "sov_offcoat_alt"
	item_state = "sov_offcoat_alt"

/obj/item/clothing/head/helmet/ww2/us_mp
	name = "美军宪兵头盔"
	desc = "典型的圆形钢盔.这顶上面有宪兵标记."
	icon_state = "m1_mp_white"
	item_state = "m1_mp_white"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww2/us_nco_cap
	name = "美军士官帽"
	desc = "美国士官戴的帽子."
	icon_state = "usnco_cap"
	item_state = "usnco_cap"

/obj/item/clothing/head/ww2/us_sailor_hat
	name = "美国水兵帽"
	desc = "美国水兵戴的帽子."
	icon_state = "sailor_hat"
	item_state = "sailor_hat"

/obj/item/clothing/head/ww2/us_tanker
	name = "美军坦克兵帽"
	desc = "美国坦克兵戴的帽子."
	icon_state = "ustanker"
	item_state = "ustanker"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 20, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww2/german_tanker
	name = "德军坦克兵耳机"
	desc = "国防军德军坦克乘员戴的帽子和无线电耳机."
	icon_state = "gertanker"
	item_state = "gertanker"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 0, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww2/italian_tanker
	name = "意大利坦克兵耳机"
	desc = "意大利坦克乘员戴的帽子和无线电耳机."
	icon_state = "gertanker"
	item_state = "gertanker"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 0, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww2/soviet_tanker
	name = "苏联坦克兵帽"
	desc = "苏联坦克乘员戴的帽子."
	icon_state = "sovtanker"
	item_state = "sovtanker"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 20, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/ww2/soviet_tanker/New()
	..()
	if (map.ordinal_age >= 8)
		name = "russian tanker cap"
		desc = "A cap worn by russian tank crewmen."

/obj/item/clothing/head/ww2/ger_officercap
	name = "德军军官帽"
	desc = "国防军德军军官戴的帽子."
	icon_state = "ger_officercap"
	item_state = "ger_officercap"

/obj/item/clothing/head/ww2/ger_officercap_tanker
	name = "德军装甲军官帽"
	desc = "国防军德军装甲部队军官戴的帽子."
	icon_state = "ger_officercap_tanker"
	item_state = "ger_officercap_tanker"
	flags = CONDUCT

/obj/item/clothing/head/ww2/sov_officercap
	name = "苏联军官帽"
	desc = "红军苏联军官戴的帽子."
	icon_state = "sov_officercap"
	item_state = "sov_officercap"

/obj/item/clothing/head/ww2/sov_pilotka
	name = "苏联船形帽"
	desc = "红军苏联士兵戴的帽子."
	icon_state = "sovpilotka"
	item_state = "sovpilotka"

/obj/item/clothing/head/ww2/sov_ushanka
	name = "苏联护耳冬帽"
	desc = "苏联护耳冬帽,红军士兵使用."
	icon_state = "ushanka_up"
	item_state = "ushanka_up"
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD

/obj/item/clothing/head/ww2/sov_ushanka/down
	icon_state = "ushanka"
	item_state = "ushanka"

/obj/item/clothing/head/ww2/sov_ushanka/attack_self(mob/user as mob)
	if (icon_state == "ushanka")
		icon_state = "ushanka_up"
		item_state = "ushanka_up"
		to_chat(user, "你竖起护耳冬帽的护耳.")
	else
		icon_state = "ushanka"
		item_state = "ushanka"
		to_chat(user, "你放下护耳冬帽的护耳.")

/obj/item/clothing/head/ww2/sov_ushanka/nomads
	name = "护耳冬帽"
	desc = "保暖的护耳冬帽,寒冷气候下的平民和士兵常戴."
	icon_state = "ushanka_plain_up"
	item_state = "ushanka_plain_up"
	cold_protection = HEAD|FACE

/obj/item/clothing/head/ww2/sov_ushanka/nomads/down
	icon_state = "ushanka_plain"
	item_state = "ushanka_plain"

/obj/item/clothing/head/ww2/sov_ushanka/nomads/attack_self(mob/user as mob)
	if (icon_state == "ushanka_plain")
		icon_state = "ushanka_plain_up"
		item_state = "ushanka_plain_up"
		to_chat(user, "你抬起乌什卡帽的护耳。")
	else
		icon_state = "ushanka_plain"
		item_state = "ushanka_plain"
		to_chat(user, "你放下乌什卡帽的护耳。")

/obj/item/clothing/head/ww2/nkvd_cap
	name = "NKVD帽"
	desc = "NKVD成员佩戴的帽子。"
	icon_state = "nkvd_cap"
	item_state = "nkvd_cap"

/obj/item/clothing/head/ww2/ss_cap
	name = "SS帽"
	desc = "党卫军军官佩戴的帽子。"
	icon_state = "sscap"
	item_state = "sscap"

/obj/item/clothing/head/ww2/german_fieldcap
	name = "德军野战帽"
	desc = "德国国防军佩戴的帽子。"
	icon_state = "fieldcap1"
	item_state = "fieldcap1"

/obj/item/clothing/head/ww2/german_fieldcap/New()
	..()
	if (map && (map.ID == MAP_STALINGRAD || map.ID == MAP_SMALLINGRAD))
		var/randhead = rand(1,2)
		if (randhead == 1)
			icon_state = "fieldcap1_winter"
			item_state = "fieldcap1_winter"
			item_state_slots["slot_w_uniform"] = "fieldcap1_winter"
		else if (randhead == 2)
			icon_state = "fieldcap1_winter2"
			item_state = "fieldcap1_winter2"
			item_state_slots["slot_w_uniform"] = "fieldcap1_winter2"

/obj/item/clothing/head/ww2/soviet_fieldcap
	name = "苏联野战帽"
	desc = "苏联红军佩戴的帽子。"
	icon_state = "fieldcap2"
	item_state = "fieldcap2"

/obj/item/clothing/head/helmet/ww2/gerhelm
	name = "德军钢盔"
	desc = "国防军典型的圆顶钢盔"
	icon_state = "stahlhelm"
	item_state = "stahlhelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/gerhelm/New()
	..()
	if (map && (map.ID == MAP_STALINGRAD || map.ID == MAP_SMALLINGRAD))
		var/randhead = rand(1,2)
		if (randhead == 1)
			icon_state = "gerhelm_winter"
			item_state = "gerhelm_winter"
			item_state_slots["slot_w_uniform"] = "gerhelm_winter"
		else if (randhead == 2)
			icon_state = "gerhelm_winter2"
			item_state = "gerhelm_winter2"
			item_state_slots["slot_w_uniform"] = "gerhelm_winter2"

/obj/item/clothing/head/helmet/ww2/gerhelm/winter
	name = "德军钢盔"
	desc = "国防军典型的圆顶钢盔"
	icon_state = "gerhelm_winter"
	item_state = "gerhelm_winter"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/gerhelm/paratrooper
	name = "伞兵钢盔"
	desc = "伞兵头盔。"
	icon_state = "stahlhelm_para"
	item_state = "stahlhelm_para"
	armor = list(melee = 35, arrow = 30, gun = 10, energy = 15, bomb = 35, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/gerhelm_medic
	name = "德军医疗兵钢盔"
	desc = "国防军典型的圆顶钢盔,这一顶属于医疗兵。"
	icon_state = "gerhelm_medic"
	item_state = "gerhelm_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/gerhelm_mp
	name = "德军钢盔"
	desc = "国防军典型的圆顶钢盔,这一顶专为宪兵配备。"
	icon_state = "gerhelm_mp"
	item_state = "gerhelm_mp"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/roa_helmet1
	name = "钢盔 ROA"
	desc = "一顶普通的德军钢盔,很可能属于俄罗斯解放军。"
	icon_state = "roa_helmet"
	item_state = "roa_helmet"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/roa_helmet2
	name = "德军钢盔 ROA"
	desc = "一顶普通的德军钢盔,带有表明其属于俄罗斯解放军的识别标记。"
	icon_state = "roa_helmet2"
	item_state = "roa_helmet2"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/ss
	name = "德军\'SS\'头盔"
	desc = "党卫军典型的圆顶钢盔。这一顶配有迷彩。"
	icon_state = "sshelm"
	item_state = "sshelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 42, arrow = 32, gun = 12, energy = 15, bomb = 42, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/ss/dark
	name = "德军\'SS\'头盔"
	desc = "党卫军典型的圆顶钢盔。"
	icon_state = "stahlhelm"
	item_state = "stahlhelm"

/obj/item/clothing/head/helmet/ww2/soviet
	name = "苏联头盔"
	desc = "红军典型的圆顶钢盔。"
	icon_state = "sovhelm"
	item_state = "sovhelm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)
/obj/item/clothing/head/helmet/ww2/soviet/New()
	..()
	if (map && (map.ID == MAP_STALINGRAD || map.ID == MAP_SMALLINGRAD))
		icon_state = "sovhelm_winter"
		item_state = "sovhelm_winter"
		item_state_slots["sovhelm_winter"] = "sovhelm_winter"

/obj/item/clothing/head/helmet/ww2/soviet/winter
	icon_state = "sovhelm_winter"
	item_state = "sovhelm_winter"

/obj/item/clothing/head/helmet/ww2/m1934
	name = "希腊M1934/39头盔"
	desc = "M1934/39头盔是二战期间希腊武装部队使用的主要战斗头盔。希腊在战前从意大利购买了这些头盔,以替换其一战时期的阿德里安头盔。"
	icon_state = "m33_helm"
	item_state = "m33_helm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	weight = 1.0
	armor = list(melee = 35, arrow = 25, gun = 8, energy = 15, bomb = 33, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/m33
	name = "M33头盔"
	desc = "Elmetto Mod. 33是20世纪30年代在意大利设计的钢制战斗头盔。虽然不如德国钢盔,但M33被视为成功的设计,因为它的防护力是阿德里安头盔的三倍,而且相对舒适。"
	icon_state = "m33_helm"
	item_state = "m33_helm"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	weight = 1.2
	armor = list(melee = 35, arrow = 25, gun = 9, energy = 15, bomb = 35, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/m33_medic
	name = "M33医疗兵头盔"
	desc = "Elmetto Mod. M33是20世纪30年代在意大利设计的钢制战斗头盔。虽然不如德国钢盔,但M33被视为成功的设计,因为它的防护力是阿德里安头盔的三倍,而且相对舒适。这一顶是给医疗兵的"
	icon_state = "m33_helm_med"
	item_state = "m33_helm_med"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	weight = 1.2
	armor = list(melee = 35, arrow = 25, gun = 9, energy = 15, bomb = 35, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/usm1
	name = "M1头盔"
	desc = "美国陆军典型的圆顶钢盔。"
	icon_state = "m1_standard"
	item_state = "m1_standard"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/usm1/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/rope))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你给头盔装上网罩。</span>")
		new/obj/item/clothing/head/helmet/ww2/ustannet(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/ww2/ustannet/verb/toggle_color()
	set category = null
	set src in usr
	set name = "Toggle Color"
	if (color)
		icon_state = "m1_tan_netting"
		item_state = "m1_tan_netting"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m1_tan_netting"
		to_chat(usr, "<span class = 'danger'>你把棕褐色网罩换成绿色网罩。</span>")
		update_icon()
		color = FALSE
		usr.update_inv_head(1)
	else if (!color)
		icon_state = "m1_green_netting"
		item_state = "m1_green_netting"
		body_parts_covered = HEAD
		item_state_slots["slot_wear_head"] = "m1_green_netting"
		to_chat(usr, "<span class = 'danger'>你把绿色网罩换成棕褐色网罩。</span>")
		update_icon()
		color = TRUE
		usr.update_inv_head(1)

/obj/item/clothing/head/helmet/ww2/usgreennet
	name = "带绿色网罩的M1头盔"
	desc = "美国陆军典型的圆顶钢盔,带有绿色网罩。"
	icon_state = "m1_green_netting"
	item_state = "m1_green_netting"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/usgreennet/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really don't understand why this check is needed
	if (istype(W, /obj/item/stack/material/leaf))
		playsound(loc, 'sound/machines/click.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你给头盔装上枝叶。</span>")
		new/obj/item/clothing/head/helmet/ww2/usm1camogreen(user.loc)
		qdel(src)
		qdel(W)

/obj/item/clothing/head/helmet/ww2/usm1camogreen
	name = "带网罩的M1头盔"
	desc = "美国陆军典型的圆顶钢盔,带有棕褐色网罩。"
	icon_state = "m1_greennet_leaves"
	item_state = "m1_greennet_leaves"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/ustannet
	name = "带网罩的M1头盔"
	desc = "美国陆军典型的圆顶钢盔,带有棕褐色网罩。"
	icon_state = "m1_tan_netting"
	item_state = "m1_tan_netting"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_chaplain
	name = "M1随军牧师头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶饰有十字架。"
	icon_state = "m1_chaplain"
	item_state = "m1_chaplain"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)


/obj/item/clothing/head/helmet/ww2/usm1mpblack
	name = "黑色M1宪兵头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶是给军事警察的。"
	icon_state = "m1_mp_black"
	item_state = "m1_mp_black"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/usm1mpgreen
	name = "M1宪兵头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶是给军事警察的。"
	icon_state = "m1_mp_green"
	item_state = "m1_mp_green"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)


/obj/item/clothing/head/helmet/ww2/us_medic
	name = "M1医疗兵头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶是给医疗兵的"
	icon_state = "m1_medic"
	item_state = "m1_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_2lt
	name = "M1少尉头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶带有少尉军衔。"
	icon_state = "m1_2nd_lt"
	item_state = "m1_2nd_lt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_1lt
	name = "M1中尉头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶带有中尉军衔。"
	icon_state = "m1_1st_lt"
	item_state = "m1_1st_lt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_cap
	name = "M1上尉头盔"
	desc = "美国陆军典型的圆顶钢盔,这一顶带有上尉军衔。"
	icon_state = "m1_cpt"
	item_state = "m1_cpt"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_mar
	name = "USMC头盔"
	desc = "美国海军陆战队典型的圆顶钢盔。"
	icon_state = "ushelmet_mar"
	item_state = "ushelmet_mar"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/us_mar_sgt
	name = "USMC中士头盔"
	desc = "美国海军陆战队典型的圆顶钢盔,这一顶带有中士军衔。"
	icon_state = "ushelmet_mar_nco"
	item_state = "ushelmet_mar_nco"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)

/obj/item/clothing/head/helmet/ww2/soviet_medic
	name = "苏联医疗头盔"
	desc = "红军典型的圆顶钢盔,带有医疗部队的白色标记。"
	icon_state = "sovhelm_medic"
	item_state = "sovhelm_medic"
	body_parts_covered = HEAD
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 40, arrow = 30, gun = 10, energy = 15, bomb = 40, bio = 20, rad = FALSE)
/////////////////////////////////////////UPA////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/ww2/upa
	name = "UPA制服"
	desc = "一件乌克兰起义军制服。"
	icon_state = "upa_uni"
	item_state = "upa_uni"
	var/base_state = "upa_uni"
	var/rolled = FALSE
/obj/item/clothing/under/ww2/upa/update_icon()
	if (ishuman(loc))
		var/mob/living/human/H = loc
		if (H.gender == "female")
			H.update_inv_w_uniform()
		else
			H.update_inv_w_uniform()
/obj/item/clothing/under/ww2/upa/off
	name = "UPA军官制服"
	desc = "一件乌克兰起义军军官制服。"
	icon_state = "upa_off"
	item_state = "upa_off"
	base_state = "upa_off"
	rolled = FALSE
/obj/item/clothing/under/ww2/upa/verb/roll_sleeves()
	set category = null
	set src in usr
	if (rolled && usr.gender == "male")
		item_state = "[base_state]"
		icon_state = "[base_state]"
		item_state_slots["w_uniform"] = "[base_state]"
		to_chat(usr, "<span class = 'danger'>你放下制服的袖子。</span>")
		rolled = FALSE
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		update_clothing_icon()
	else if (!rolled && usr.gender == "male")
		item_state = "[base_state]_rolled"
		icon_state = "[base_state]_rolled"
		item_state_slots["w_uniform"] = "[base_state]_rolled"
		to_chat(usr, "<span class = 'danger'>你卷起制服的袖子。</span>")
		rolled = TRUE
		heat_protection = ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
		update_clothing_icon()
	if (rolled && usr.gender == "female")
		item_state = "[base_state]"
		icon_state = "[base_state]"
		item_state_slots["w_uniform"] = "[base_state]"
		to_chat(usr, "<span class = 'danger'>你放下制服的袖子。</span>")
		rolled = FALSE
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
		update_clothing_icon()
	else if (!rolled && usr.gender == "female")
		item_state = "[base_state]_rolled"
		icon_state = "[base_state]_rolled"
		item_state_slots["w_uniform"] = "[base_state]_rolled"
		to_chat(usr, "<span class = 'danger'>你卷起制服的袖子.</span>")
		rolled = TRUE
		heat_protection = ARMS
		cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS
		update_clothing_icon()

/obj/item/clothing/head/ww2/upa_cap
	name = "乌克兰起义军野战帽"
	desc = "一顶由乌克兰起义军佩戴的帽子."
	icon_state = "upa_cap"
	item_state = "upa_cap"
/obj/item/clothing/head/ww2/upa_pilotka
	name = "乌克兰起义军船形帽"
	desc = "一顶由乌克兰起义军佩戴的船形帽."
	icon_state = "upapilotka"
	item_state = "upapilotka"
/obj/item/clothing/head/ww2/upa_cap_off
	name = "乌克兰起义军军官帽"
	desc = "一顶由乌克兰起义军士官佩戴的帽子."
	icon_state = "upa_off"
	item_state = "upa_off"
/obj/item/clothing/head/ww2/upa_cap_commander
	name = "乌克兰起义军军官帽"
	desc = "一顶由乌克兰起义军军官佩戴的帽子."
	icon_state = "upa_commander"
	item_state = "upa_commander"
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/accessory/armband/redcross
	name = "红十字臂章"
	desc = "一个带有红十字的白色臂章."
	icon_state = "redcross"
	slot = "armband"

/obj/item/clothing/accessory/armband/nsdap
	name = "纳粹党臂章"
	desc = "一个带有卐字的红色臂章."
	icon_state = "nsdap"
	slot = "armband"

/obj/item/clothing/accessory/armband/kenpeitai
	name = "宪兵队臂章"
	desc = "一个带有红色日文字符的白色臂章."
	icon_state = "japanesemp"
	slot = "armband"

/obj/item/clothing/accessory/armband/usmp
	name = "军事警察臂章"
	desc = "一个写有\"MP\"的黑色臂章."
	icon_state = "usmp"
	slot = "armband"

/obj/item/clothing/accessory/armband/volkssturm
	name = "人民冲锋队臂章"
	desc = "一个人民冲锋队的红白黑三色臂章"
	icon_state = "volkssturm"
	slot = "armband"

/obj/item/clothing/suit/storage/coat/ww2/moderncoat
	name = "现代大衣"
	desc = "一件由羊毛制成的标准大衣."
	icon_state = "moderncoat"
	item_state = "moderncoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/fancycoat
	name = "黑色大衣"
	desc = "一件由羊毛制成的精致大衣."
	icon_state = "woolcoat"
	item_state = "woolcoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww1/royalcoat
	name = "皇家大衣"
	desc = "一件供皇室成员使用的皇家大衣."
	icon_state = "royalcoat"
	item_state = "royalcoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/expensivecoat
	name = "精致大衣"
	desc = "一件由羊毛和皮革制成的昂贵大衣."
	icon_state = "expensivecoat"
	item_state = "expensivecoat"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/servicejacket
	name = "军装夹克"
	desc = "一件标准军用夹克."
	icon_state = "servicejacket"
	item_state = "servicejacket"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 5, arrow = 0, gun = FALSE, energy = 10, bomb = 5, bio = 15, rad = 15)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/bomberjacketbrown
	name = "棕色轰炸机夹克"
	desc = "一件专为高海拔低温设计的棕色夹克."
	icon_state = "bomberjacket"
	item_state = "bomberjacket"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/bomberjacketblack
	name = "黑色轰炸机夹克"
	desc = "一件专为高海拔低温设计的黑色夹克."
	icon_state = "blackbomberjacket"
	item_state = "blackbomberjacket"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/biker //it may have started this 'era', but biker jackets became popular still long after
	name = "机车夹克"
	desc = "一件黑色夹克, 深受大胆和休闲寻求刺激者的青睐."
	icon_state = "biker"
	item_state = "biker"
	body_parts_covered = UPPER_TORSO||ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 0, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 30)
	value = 100

/obj/item/clothing/suit/storage/coat/ww2/biker/gator_jacket
	name = "鳄鱼鳞夹克"
	desc = "一件光滑的鳄鱼鳞夹克, 大胆且令人印象深刻, 就像穿着它的人一样. '回头见, 鳄鱼'."
	icon_state = "gator_jacket"
	item_state = "gator_jacket"
	value = 150

/obj/item/weapon/storage/belt/gulagguard
	name = "警卫腰带"
	desc = "一条可以容纳警卫标准装备的腰带."
	icon_state = "japbelt"
	item_state = "japbelt"
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
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/whistle,
		/obj/item/weapon/pen,
		)

//swimwear//
/obj/item/clothing/under/red/strappedbikini
	name = "红色系带比基尼"
	desc = "似乎是两件套红色比基尼, 上衣由系带支撑."
	icon_state = "r_strapbikini"
	item_state = "r_strapbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/red/bandbikini
	name = "红色束带比基尼"
	desc = "似乎是两件套红色比基尼, 上衣由紧身水平束带支撑."
	icon_state = "r_bandbikini"
	item_state = "r_bandbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT


/obj/item/clothing/under/red/swimtrunks
	name = "红色泳裤"
	desc = "似乎是专为游泳设计的裤子."
	icon_state = "r_swimtrunks"
	item_state = "r_swimtrunks"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT


/obj/item/clothing/under/blue/strappedbikini
	name = "蓝色系带比基尼"
	desc = "似乎是两件套蓝色比基尼, 上衣由系带支撑."
	icon_state = "b_strapbikini"
	item_state = "b_strapbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/blue/bandbikini
	name = "蓝色束带比基尼"
	desc = "似乎是两件套蓝色比基尼, 上衣由紧身水平束带支撑."
	icon_state = "b_bandbikini"
	item_state = "b_bandbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/blue/swimtrunks
	name = "蓝色泳裤"
	desc = "似乎是专为游泳设计的裤子."
	icon_state = "b_swimtrunks"
	item_state = "b_swimtrunks"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/green/strappedbikini
	name = "绿色系带比基尼"
	desc = "似乎是两件套绿色比基尼, 上衣由系带支撑."
	icon_state = "g_strapbikini"
	item_state = "g_strapbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT

/obj/item/clothing/under/green/bandbikini
	name = "绿色束带比基尼"
	desc = "似乎是两件套绿色比基尼, 上衣由紧身水平布料支撑."
	icon_state = "g_bandbikini"
	item_state = "g_bandbikini"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT


/obj/item/clothing/under/green/swimtrunks
	name = "绿色泳裤"
	desc = "似乎是专为游泳设计的裤子."
	icon_state = "g_swimtrunks"
	item_state = "g_swimtrunks"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection = LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT


/obj/item/weapon/storage/belt/gulagguard/filled/New()
	..()
	new /obj/item/weapon/material/classic_baton(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	for (var/i=1, i<=4, i++)
		new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/whistle(src)
	new /obj/item/weapon/pen/pencil(src)
	new /obj/item/weapon/clipboard/full(src)

/obj/item/weapon/storage/belt/gulagguard/filledwar/New()
	..()
	new /obj/item/weapon/material/classic_baton(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/whistle(src)
	new /obj/item/ammo_magazine/c762x25_ppsh(src)
	new /obj/item/ammo_magazine/c762x25_ppsh(src)

/obj/item/weapon/storage/belt/gulagguard/filledwarak/New()
	..()
	new /obj/item/weapon/material/classic_baton(src)
	new /obj/item/stack/medical/bruise_pack/bint(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/weapon/whistle(src)
	for (var/i=1, i<=3, i++)
		new /obj/item/ammo_magazine/ak47(src)

/obj/item/weapon/storage/belt/smallpouches/gerbelt
	icon_state = "gerbelt"
	item_state = "gerbelt"

/obj/item/weapon/storage/belt/smallpouches/gerbelt/officer
/obj/item/weapon/storage/belt/smallpouches/gerbelt/officer/New()
	..()
	new/obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new/obj/item/stack/medical/bruise_pack/bint(src)
	new/obj/item/weapon/whistle(src)
	new/obj/item/weapon/reagent_containers/food/drinks/flask/officer/schnapps(src)

/obj/item/weapon/storage/belt/smallpouches/us/officer
/obj/item/weapon/storage/belt/smallpouches/us/officer/New()
	..()
	new/obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new/obj/item/stack/medical/bruise_pack/bint(src)
	new/obj/item/weapon/whistle(src)
	new/obj/item/weapon/reagent_containers/food/drinks/flask/officer/whiskey(src)

/obj/item/weapon/storage/belt/smallpouches/us/idfoff
/obj/item/weapon/storage/belt/smallpouches/us/idfoff/New()
	..()
	new/obj/item/weapon/attachment/scope/adjustable/binoculars/binoculars(src)
	new/obj/item/stack/medical/bruise_pack/bint(src)
	new/obj/item/weapon/whistle(src)
	new/obj/item/weapon/reagent_containers/food/drinks/flask/officer/wine(src)

/obj/item/clothing/suit/storage/coat/leathercoat_black
	name = "黑色皮长衣"
	desc = "一件黑色皮长衣."
	icon_state = "leathercoat_black"
	item_state = "leathercoat_black"

/obj/item/clothing/suit/storage/coat/modern_long_brown
	name = "现代棕色大衣"
	desc = "一件现代棕色长衣."
	icon_state = "mlongcoat_brown"
	item_state = "mlongcoat_brown"

/obj/item/clothing/suit/storage/coat/modern_long_black
	name = "现代黑色大衣"
	desc = "一件现代黑色长衣."
	icon_state = "mlongcoat_black"
	item_state = "mlongcoat_black"

/obj/item/clothing/suit/storage/coat/gentleman
	name = "绅士大衣"
	desc = "一件优雅的黑色大衣."
	icon_state = "gentlemancoat"
	item_state = "gentlemancoat"
