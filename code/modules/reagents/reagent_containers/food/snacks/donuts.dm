//Ports donuts from /tg/

/obj/item/weapon/reagent_containers/food/snacks/donut
	name = "甜甜圈"
	desc = "配咖啡很棒.警察最爱的零食."
	icon = 'icons/obj/food/donuts.dmi'
	icon_state = "donut"
	filling_color = "#8F5A04"
	nutriment_desc = list("sweetness" = 1, "donut" = 1)
	nutriment_amt = 3
	satisfaction = 4
	decay = 25*600
	w_class = ITEM_SIZE_TINY
	var/decorated_icon = "donut_homer"
	var/is_decorated = FALSE
	var/decorated_adjective = "sprinkled"
	New()
		..()
		reagents.add_reagent("sugar", 3)
		if(prob(30))//Probability for a donut to be decorated
			decorate_donut()

/obj/item/weapon/reagent_containers/food/snacks/donut/proc/decorate_donut()
	if(is_decorated || !decorated_icon)
		return
	is_decorated = TRUE
	name = "[decorated_adjective] [name]"
	icon_state = decorated_icon
	reagents.add_reagent("sprinkles", 1)
	return TRUE

/obj/item/weapon/reagent_containers/food/snacks/donut/proc/in_box_sprite()
	return "[icon_state]_inbox"


/obj/item/weapon/reagent_containers/food/snacks/donut/plain
	icon_state = "donut"

/obj/item/weapon/reagent_containers/food/snacks/donut/berry
	name = "浆果甜甜圈"
	icon_state = "donut_pink"
	decorated_icon = "donut_homer"
	New ()
		..()
		reagents.add_reagent("berryjuice", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/cherry
	name = "樱桃甜甜圈"
	icon_state = "donut_purple"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("cherryjelly", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/apple
	name = "苹果甜甜圈"
	icon_state = "donut_olive"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("applejuice", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/caramel
	name = "焦糖甜甜圈"
	icon_state = "donut_beige"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("caramel", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/chocolate
	name = "巧克力甜甜圈"
	icon_state = "donut_choc"
	decorated_icon = "donut_choc_sprinkles"
	New ()
		..()
		reagents.add_reagent("hot_coco", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/mint
	name = "薄荷甜甜圈"
	icon_state = "donut_blue"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("mint", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/banana
	name = "香蕉甜甜圈"
	icon_state = "donut_yellow"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("banana", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

/obj/item/weapon/reagent_containers/food/snacks/donut/lime
	name = "青柠甜甜圈"
	icon_state = "donut_green"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("limejuice", rand(1,3))
		reagents.add_reagent("sprinkles", 1)


/obj/item/weapon/reagent_containers/food/snacks/donut/grenadine
	name = "石榴糖浆甜甜圈"
	icon_state = "donut_laugh"
	is_decorated = TRUE
	New ()
		..()
		reagents.add_reagent("grenadine", rand(1,3))
		reagents.add_reagent("sprinkles", 1)

//JELLY DONUTS ARE TO BE DONE IN THE FUTURE