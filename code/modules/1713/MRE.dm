//Food items that are eaten normally and don't leave anything behind.
/obj/item/weapon/reagent_containers/food/snacks/MRE
	name = "单兵口粮"
	desc = "难吃的食物"
	nutriment_desc = list("horrible food" = 1)
	nutriment_amt = 5
	var/open = FALSE
	var/opens = TRUE
	var/base_state = ""
	trash = null
	flammable = TRUE
	decay = 0
	non_vegetarian = TRUE
/obj/item/weapon/reagent_containers/food/snacks/MRE/attack(mob/M as mob, mob/user as mob, def_zone)
	if (!open && opens && M == user)
		to_chat(user, "<span class = 'warning'>先打开它.</span>")
		return FALSE
	return ..(M, user, def_zone)

/obj/item/weapon/reagent_containers/food/snacks/MRE/attack_self(var/mob/living/human/H)
	if (!istype(H))
		return
	if (!open && opens)
		playsound(get_turf(src), 'sound/effects/rip_pack.ogg', 100)
		visible_message("<span class = 'notice'>[H] 打开了 [src].</span>")
		icon_state = "[base_state]_open"
		open = TRUE
	return

// generic MRE

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic
	base_state = "mre_food"
	icon_state = "mre_food"
	name = "单兵口粮"
	opens = FALSE
	trash = /obj/item/weapon/generic_MRE_trash
	flags = FALSE
/obj/item/weapon/generic_MRE_trash
	icon = 'icons/obj/food/food.dmi'
	icon_state = "mre_food_trash"
	name = "单兵口粮垃圾"
	desc = "一些单兵口粮的残渣."
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/german
	name = "德国单兵口粮: 酸菜"
	desc = "一份酸菜单兵口粮."
	nutriment_desc = list("pickled cabbage" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/british
	name = "英国单兵口粮: 罐头肉"
	desc = "一份罐头肉单兵口粮."
	nutriment_desc = list("canned meat" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/french
	name = "法国单兵口粮: 奶酪"
	desc = "一份奶酪单兵口粮."
	nutriment_desc = list("cheese" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/pirates
	name = "苏联单兵口粮: 卷心菜"
	desc = "一份卷心菜单兵口粮."
	nutriment_desc = list("overcooked cabbage" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/italian
	name = "意大利单兵口粮: 意大利面"
	desc = "妈妈咪呀!"
	nutriment_desc = list("spaghett" = 1, "tomat" = 1, "spicia meatball")

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/american
	name = "美国单兵口粮: 罐头肉"
	desc = "一包罐头肉和蔬菜."
	nutriment_desc = list("canned meat" = 1, "canned vegetables" = 1)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/blugoslavian
	name = "布卢戈斯拉夫单兵口粮: 通用战斗口粮"
	desc = "一个密封包装,内含你继续战斗所需的一切!."
	nutriment_desc = list("canned meat" = 2, "canned vegetables" = 2, "tea", 2)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/blugoslavian/officer
	name = "布卢戈斯拉夫军官单兵口粮: 披萨配咖啡"
	desc = "一个密封包装,装的是好东西,只留给精英中的精英!."
	nutriment_desc = list("coffee", 5, "baked pastry" = 4, "spices" = 2, "cheese" = 4)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/redmenian
	name = "雷德梅尼亚单兵口粮: 通用战斗口粮"
	desc = "一个密封包装,内含你继续战斗所需的一切!."
	nutriment_desc = list("canned meat" = 2, "canned vegetables" = 2, "tea", 2)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/redmenian/officer
	name = "雷德梅尼亚军官单兵口粮: 甜面包卷配咖啡"
	desc = "一个密封包装,装的是好东西,只留给精英中的精英!."
	nutriment_desc = list("coffee", 5, "baked pastry" = 2, "sweetness" = 3, "icing" = 2, "donut" = 2)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/japanese
	name = "日本单兵口粮: 面条"
	desc = "一包预煮面条和干肉."
	nutriment_desc = list("noodles" = 1, "vegetables" = 1, "dried meat")

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/russian
	name = "俄罗斯单兵口粮: 土豆"
	desc = "一包预煮土豆."
	nutriment_desc = list("potatoes" = 1,)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/idf
	name = "IDF单兵口粮: 白鲑鱼"
	desc = "一包未标识的犹太洁食白鲑鱼."
	nutriment_desc = list("fish" = 1,)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/russian/modern
	name = "俄军单兵口粮: 战斗口粮"
	desc = "一包土豆, 肉罐头, 蔬菜罐头和一些茶."
	nutriment_desc = list("potatoes" = 1, "canned meat" = 2, "canned vegetables" = 2,"tea" = 2)

/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/space
	name = "口粮包"
	desc = "一包聚合淀粉份面包和素肉."
	nutriment_desc = list("polystarch" = 1, "veg-meat" =1)