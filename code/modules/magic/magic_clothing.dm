
/obj/item/clothing/under/civ2/wizard
	name = "巫师服装"
	desc = "一套老派的白色衬衫和黑色长裤,巫师们常穿。"
	icon_state = "civuni2"
	item_state = "civuni2"
	
/obj/item/clothing/suit/storage/jacket/wizard
	name = "巫师长袍"
	desc = "巫师穿着的黑色长袍。"
	icon_state = "magic_boy_robe"
	item_state = "magic_boy_robe"
	var/house_colors = "#000000"
	var/uncolored = TRUE

	New()
		..()
		spawn(1)
			if (src)
				var/image/lines = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "magic_boy_robe_decoration")
				lines.color = house_colors
				overlays += lines
				update_icon()

/obj/item/clothing/suit/storage/jacket/wizard/red
	name = "红宝石龙巫师长袍"
	house_colors = "#7F0000"

/obj/item/clothing/suit/storage/jacket/wizard/green
	name = "薄荷蛇巫师长袍"
	house_colors = "#007F00"

/obj/item/clothing/suit/storage/jacket/wizard/blue
	name = "板岩派巫师长袍"
	house_colors = "#0000c8"

/obj/item/clothing/suit/storage/jacket/wizard/yellow
	name = "芥末鼬巫师长袍"
	house_colors = "#cbb600"

/obj/item/clothing/suit/storage/jacket/wizard/pinkrobe
	name = "L.O.S.E.R.巫师长袍"
	icon_state = "magic_boy_robe_pink"
	item_state = "magic_boy_robe_pink"
	desc = "一件粉色巫师长袍,供那些获得\"兰博瓦特弃儿与不合格教育废品\"身份的人穿着。"
	house_colors = "#000000"

/obj/item/clothing/suit/storage/jacket/wizard/greyrobe
	name = "I.D.I.O.T.巫师长袍"
	desc = "一件灰色巫师长袍,供那些获得\"无能且缺陷个体普通测试\"证书的人穿着。不要把它无人看管地放在蜡笔附近。"
	house_colors = "#000000"
	icon_state = "magic_boy_robe_grey"
	item_state = "magic_boy_robe_grey"

/obj/item/clothing/suit/storage/jacket/wizard/greyrobe/red
	name = "红宝石龙I.D.I.O.T.巫师长袍"
	house_colors = "#7F0000"

/obj/item/clothing/suit/storage/jacket/wizard/greyrobe/green
	name = "薄荷蛇I.D.I.O.T.巫师长袍"
	house_colors = "#007F00"

/obj/item/clothing/suit/storage/jacket/wizard/greyrobe/blue
	name = "板岩派I.D.I.O.T.巫师长袍"
	house_colors = "#0000c8"

/obj/item/clothing/suit/storage/jacket/wizard/greyrobe/yellow
	name = "芥末鼬I.D.I.O.T.巫师长袍"
	house_colors = "#cbb600"

/obj/item/clothing/head/wizard
	name = "巫师帽"
	desc = "一顶宽檐黑色巫师帽。"
	icon_state = "blackwizard"
	item_state = "blackwizard"

/obj/item/clothing/head/custodian_helmet
	name = "custodian头盔"
	desc = "一顶传统的英国警察custodian头盔,配有银色徽章。"
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "constable"
	item_state = "constable"

/obj/item/clothing/suit/storage/jacket/wizard/neon_yellow
	name = "警察巫师长袍"
	desc = "一件高可见度的巫师长袍,由C.A.P.,即奥术实践治安队穿着。"
	house_colors = "#E5FF00"
	icon_state = "magic_boy_robe_police"

// the school tier pins/certificates
/obj/item/weapon/magic_id
	name = "L.A.M.E.教授徽章"
	desc = "一枚由兰博瓦特魔法教育学院教授佩戴的徽章。它赋予佩戴者少量魔法力量,但主要只是作为时尚宣言。"
	icon = 'icons/obj/clothing/badges.dmi'
	item_icons = 'icons/mob/badge.dmi'
	icon_state = "Order of the Patriotic War, 1st Class"
	item_state = "OPW I, on body"
	throwforce = FALSE
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_ID
	throw_range = TRUE
	throw_speed = TRUE
	attack_verb = list("bapped")
	flammable = FALSE
	icon_override = 'icons/mob/badge.dmi'

	attack_hand(mob/M)
		if (istype(M, /mob/living/human))
			var/mob/living/human/H = M
			if (H.wear_id == src)
				return //cannot remove the badge once equipped, so no attack_hand proc
		..()
// Tier 0: I.D.I.O.T. certificate
/obj/item/weapon/magic_id/idiot
	name = "I.D.I.O.T.证书"
	desc = "\"无能且缺陷个体普通测试\"证书。不要把它无人看管地放在蜡笔附近。"
	icon_state = "wizard_idiot"
	item_state = "christian_party_pin"

// Tier 1: U.N.G.A. certificate
/obj/item/weapon/magic_id/unga
	name = "U.N.G.A.证书"
	desc = "\"表现不佳蠢货综合评估\"证书。最基础的魔法资质等级。"
	icon_state = "wizard_unga"
	item_state = "nationalist_party_pin"

// Tier 2: C.O.A.L. licence
/obj/item/weapon/magic_id/coal
	name = "C.O.A.L.执照"
	desc = "\"社区普通业余执照\"。在山谷中携带魔杖而不被逮捕所需的最低要求。"
	icon_state = "wizard_coal"
	item_state = "pirate_flag_pin"

// Tier 3: G.E.M. licence
/obj/item/weapon/magic_id/slate
	name = "G.E.M.执照"
	desc = "\"重力与元素操控\"。授予那些被证明不太可能意外弄塌学校板岩屋顶的人。"
	icon_state = "wizard_gem"
	item_state = "nationalist_party_pin"

// Tier 4: B.A.S.E.D. licence
/obj/item/weapon/magic_id/based
	name = "B.A.S.E.D.执照"
	desc = "\"野猪疣高级巫术与实验行为\"执照。保留给那些行为被认为极其based,但高度不稳定的学生。"
	icon_state = "wizard_based"
	item_state = "AS, on body"

// Tier 5: C.H.A.D. degree
/obj/item/weapon/magic_id/chad
	name = "C.H.A.D.学位"
	desc = "\"机密高级奥术毁灭\"学位。魔法教育的绝对巅峰。需要绝对的gigachad能量。"
	icon_state = "wizard_chad"
	item_state = "Verwund Geld, on body"

// Tier R: L.O.S.E.R. status
/obj/item/weapon/magic_id/loser
	name = "L.O.S.E.R.身份徽章"
	desc = "\"兰博瓦特弃儿与不合格教育废品\"身份。对那些违反校规者的纪律耻辱标记。"
	icon_state = "wizard_loser"
	item_state = "globalist_pin"
