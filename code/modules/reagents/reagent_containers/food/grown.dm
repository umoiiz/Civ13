// the botany & seed system was removed entirely, so now we have this
// because bay removed the color from sprites, we recolor them manually

/obj/item/weapon/reagent_containers/food/snacks/grown
	name = "某种所有种植食物的魔法超类. 这东西为什么会在这里"
	nutriment_amt = 1
	nutriment_desc = list("fruit" = TRUE)
	w_class = ITEM_SIZE_TINY
	value = 3
	bitesize = 2
	decay = 25*600

/obj/item/weapon/reagent_containers/food/snacks/grown/cinchona
	name = "金鸡纳树"
	icon_state = "cinchona_inhand" // No icon_state exists for this, will be an ERROR.
	desc = "含有奎宁."
	nutriment_amt = 1
	nutriment_desc = "bitter"
	decay = 70*600
	New()
		..()
		reagents.del_reagents()
		reagents.add_reagent("quinine", 10)

/obj/item/weapon/reagent_containers/food/snacks/grown/peyote
	name = "佩约特仙人掌"
	icon_state = "peyote"
	desc = "一种强效致幻剂."
	filling_color = "#6AAF6A"
	decay = 120*600
	New()
		..()
		reagents.add_reagent("peyote", 5)

/obj/item/weapon/reagent_containers/food/snacks/grown/juniper
	name = "杜松子"
	icon_state = "juniper_berry"
	desc = "一颗看起来普通的浆果."
	filling_color = "#6AAF6A"
	decay = 60*600
	New()
		..()
		reagents.add_reagent("juniper", 5)

/obj/item/weapon/reagent_containers/food/snacks/grown/sapote
	name = "人心果"
	icon_state = "sapote"
	desc = "一种非常奇怪的水果,带有坚果风味."
	color = "#4CBB17"
	decay = 60*600
	New()
		..()
		reagents.add_reagent("sapotejuice", 2)

/obj/item/weapon/reagent_containers/food/snacks/grown/parsnip
	name = "欧防风根"
	icon_state = "parsnip"
	desc = "一种有用的食物甜味剂."
	filling_color = "#dad0bc"
	decay = 60*600
	New()
		..()
		reagents.add_reagent("sugar", 2)

/obj/item/weapon/reagent_containers/food/snacks/grown/zucchini
	name = "西葫芦"
	icon_state = "zucchini"
	desc = "一种直形的葫芦植物."
	filling_color = "#6AAF6A"
	decay = 60*600
	New()
		..()
		reagents.add_reagent("zucchinijuice", 5)

/obj/item/weapon/reagent_containers/food/snacks/grown/sapodilla
	name = "人心果"
	icon_state = "sapodilla"
	desc = "奇怪地甜."
	color = "#f3bc5f"
	decay = 60*600
	New()
		..()
		reagents.add_reagent("sapodillajuice", 5)

/obj/item/weapon/reagent_containers/food/snacks/grown/redpepper
	name = "红辣椒"
	icon_state = "paprika_pepper"
	desc = "一种非常有用的食物调味辣椒."
	decay = 60*600
	New()
		..()
		reagents.add_reagent("capsaicin", 8)

/obj/item/weapon/reagent_containers/food/snacks/grown/liquorice
	name = "甘草"
	icon_state = "liquorice_root"
	desc = "一种味道非常奇怪的根."
	decay = 0
	New()
		..()
		reagents.add_reagent("liquorice", 8)

/obj/item/weapon/reagent_containers/food/snacks/grown/celery
	name = "芹菜"
	icon_state = "celery_stalk"
	desc = "尝起来像绿色."
	decay = 60*600
	New()
		..()
		reagents.add_reagent("celery", 8)

/obj/item/weapon/reagent_containers/food/snacks/grown/agave
	name = "龙舌兰"
	icon_state = "agave_leaf"
	desc = "一种沙漠植物,有一定用处."
	decay = 60*600
	New()
		..()
		reagents.add_reagent("agave", 10)

/obj/item/weapon/reagent_containers/food/snacks/grown/parsley
	name = "欧芹"
	icon_state = "parsley"
	decay = 90*600
	satisfaction = 2
	New()
		..()
		reagents.add_reagent("parsley", 15)

/obj/item/weapon/reagent_containers/food/snacks/grown/coffee
	name = "绿咖啡"
	icon_state = "coffee"
	color = "#a5201d"
	decay = 180*600
	satisfaction = 8
	New()
		..()
		reagents.add_reagent("coffee", 15)
// fruit
/obj/item/weapon/reagent_containers/food/snacks/grown/grapes
	name = "一串葡萄"
	icon_state = "grapes_b"
	filling_color = "#7a378b"
	satisfaction = 4
	decay = 12*600

/obj/item/weapon/reagent_containers/food/snacks/grown/olives
	name = "一串橄榄"
	icon_state = "olives"
	decay = 20*600

/obj/item/weapon/reagent_containers/food/snacks/grown/mushroompsy
	name = "裸盖菇"
	icon_state = "mushrooms"
	satisfaction = 10
	decay = 35*600
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("thc", 30)

/obj/item/weapon/reagent_containers/food/snacks/grown/mushroom
	name = "一串蘑菇"
	icon_state = "mushrooms"
	satisfaction = 4
	decay = 30*600

/obj/item/weapon/reagent_containers/food/snacks/grown/watermelon
	name = "西瓜"
	icon_state = "watermelon"
	satisfaction = 4
	filling_color = "#f08080"
	decay = 20*600
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/watermelonslice
	slices_num = 12

/obj/item/weapon/reagent_containers/food/snacks/watermelonslice
	name = "西瓜片"
	desc = "多汁的西瓜片."
	icon_state = "watermelonslice"
	filling_color = "#f08080"
	decay = 18*600

/obj/item/weapon/reagent_containers/food/snacks/grown/pumpkin
	name = "南瓜"
	icon_state = "pumpkin"
	satisfaction = 4
	filling_color = "#eb9e45"
	decay = 100*600
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/pumpkinslice
	slices_num = 12

/obj/item/weapon/reagent_containers/food/snacks/pumpkinslice
	name = "南瓜片"
	desc = "南瓜片."
	icon_state = "pumpkinslice"
	filling_color = "#eb9e45"
	decay = 20*600

/obj/item/weapon/reagent_containers/food/snacks/grown/lemon //Added proper reagents to food.
	name = "柠檬"
	icon_state = "lemon"
	satisfaction = 1
	decay = 100*600
	filling_color = "#eedd82"
	New()
		..()
		reagents.add_reagent("lemonjuice", 20)

/obj/item/weapon/reagent_containers/food/snacks/grown/lime //Added proper reagents to food.
	name = "青柠"
	icon_state = "lime"
	satisfaction = 1
	decay = 100*600
	filling_color = "#a7ce68"
	New()
		..()
		reagents.add_reagent("limejuice", 20)

/obj/item/weapon/reagent_containers/food/snacks/grown/orange //Added proper reagents to food.
	name = "橙子"
	icon_state = "orange"
	satisfaction = 3
	decay = 100*600
	filling_color = "#ffae00"
	New()
		..()
		reagents.add_reagent("orangejuice", 20)

/obj/item/weapon/reagent_containers/food/snacks/grown/apple //Added proper reagents to food.
	name = "苹果"
	icon_state = "apple_green"
	satisfaction = 3
	decay = 50*600
	filling_color = "#dfffaa"
	New()
		..()
		reagents.add_reagent("applejuice", 15)

/obj/item/weapon/reagent_containers/food/snacks/grown/banana //Added proper reagents to food.
	name = "香蕉"
	icon_state = "banana"
	satisfaction = 6
	decay = 15*600
	filling_color = "#fff896"
	New()
		..()
		reagents.add_reagent("banana", 10)

/obj/item/weapon/reagent_containers/food/snacks/grown/apricot //Added proper reagents to food.
	name = "杏子"
	icon_state = "apricot"
	satisfaction = 6
	decay = 15*600
	New()
		..()
		reagents.add_reagent("apricotjuice", 15)

/obj/item/weapon/reagent_containers/food/snacks/grown/cherry //Added proper reagents to food.
	name = "樱桃"
	icon_state = "cherry"
	satisfaction = 6
	decay = 15*600
	New()
		..()
		reagents.add_reagent("cherryjelly", 10)

/obj/item/weapon/reagent_containers/food/snacks/grown/coconut
	name = "椰子"
	icon_state = "coconut"
	satisfaction = 3
	decay = 150*600
	New()
		..()
		reagents.add_reagent("coconutmilk", 20)

/obj/item/weapon/reagent_containers/food/snacks/grown/cocoa
	name = "可可豆"
	icon_state = "cocoa"
	satisfaction = -2
	decay = 150*600
	New()
		..()
		reagents.add_reagent("cocoa", 20)

// misc crops
/obj/item/weapon/reagent_containers/food/snacks/grown/rice
	name = "稻秆"
	icon_state = "rice"
	filling_color = "#dcdcdc"
	nutriment_desc = list("rice" = TRUE)
	decay = 0
	satisfaction = -2
/obj/item/weapon/reagent_containers/food/snacks/grown/wheat
	name = "小麦"
	icon_state = "wheat"
	desc = "小麦. 可以磨成粉."
	filling_color = "#fffaf0"
	nutriment_desc = list("wheat" = TRUE)
	decay = 500*6000
	satisfaction = -2
/obj/item/weapon/reagent_containers/food/snacks/grown/oat
	name = "燕麦"
	icon_state = "oat"
	desc = "燕麦. 可以磨成粉."
	filling_color = "#fffaf0"
	nutriment_desc = list("oats" = TRUE)
	decay = 200*6000
	satisfaction = -2
/obj/item/weapon/reagent_containers/food/snacks/grown/barley
	name = "大麦"
	icon_state = "barley"
	desc = "大麦. 可以磨成粉."
	filling_color = "#fffaf0"
	nutriment_desc = list("barley" = TRUE)
	decay = 200*6000
	satisfaction = -2
/obj/item/weapon/reagent_containers/food/snacks/grown/tomato
	name = "番茄"
	icon_state = "tomato"
	filling_color = "#eb2535"
	nutriment_desc = list("tomato" = TRUE)
	decay = 15*600
	satisfaction = 3
/obj/item/weapon/reagent_containers/food/snacks/grown/potato
	name = "土豆"
	icon_state = "potato"
	filling_color = "#fce4c0"
	nutriment_desc = list("potato" = TRUE)
	decay = 70*6000
	satisfaction = -3
/obj/item/weapon/reagent_containers/food/snacks/grown/beans
	name = "豆子"
	icon_state = "beans_brownred"
	filling_color = "#a14130"
	nutriment_desc = list("beans" = TRUE)
	decay = 100*6000

/obj/item/weapon/reagent_containers/food/snacks/grown/cabbage
	name = "卷心菜"
	icon_state = "cabbage"
	filling_color = "#caff70"
	nutriment_desc = list("cabbage" = TRUE)
	decay = 20*600

/obj/item/weapon/reagent_containers/food/snacks/grown/carrot
	name = "胡萝卜"
	icon_state = "carrot"
	filling_color = "#ff5e00"
	nutriment_desc = list("carrot" = TRUE)
	decay = 25*600

/obj/item/weapon/reagent_containers/food/snacks/grown/corn
	name = "玉米"
	icon_state = "corn"
	filling_color = "#cebb4f"
	nutriment_desc = list("corn" = TRUE)
	decay = 10*600
	satisfaction = 2

/obj/item/weapon/reagent_containers/food/snacks/grown/corn/attack_self(mob/user as mob)
	if (do_after(user, 120, user.loc))
		new/obj/item/clothing/mask/smokable/pipe/cobpipe(user.loc)
		qdel(src)
		return
	else
		return

/obj/item/weapon/reagent_containers/food/snacks/honeycomb
	name = "蜂巢"
	icon = 'icons/farming/beekeeping.dmi'
	icon_state = "honeycomb"
	filling_color = "#ffbf00"
	decay = 250*600
	w_class = ITEM_SIZE_TINY
	New()
		..()
		reagents.add_reagent("honey", 10)