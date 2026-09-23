
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food. They all
//	leave empty containers when used up and can be filled/re-filled with other items. Formatting for first section is identical
//	to mixed-drinks code. If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/weapon/reagent_containers/food/condiment
	name = "调味品容器"
	desc = "就是你常见的调味品容器."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "emptycondiment"
	flags = OPENCONTAINER
	possible_transfer_amounts = list(1,5,10)
	center_of_mass = list("x"=16, "y"=6)
	volume = 50
	flammable = TRUE
	attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
		return

	attack_self(var/mob/user as mob)
		return

	attack(var/mob/M as mob, var/mob/user as mob, var/def_zone)
		if (standard_feed_mob(user, M))
			return

	afterattack(var/obj/target, var/mob/user, var/proximity)
		if (!proximity)
			return

		if (istype(target, /obj/structure/pot))
			return

		if (standard_dispenser_refill(user, target))
			return
		if (standard_pour_into(user, target))
			return

		if (istype(target, /obj/item/weapon/reagent_containers/food/snacks)) // These are not opencontainers but we can transfer to them
			if (!reagents || !reagents.total_volume)
				to_chat(user, "<span class='notice'>\the [src]里没有调味品了.</span>")
				return

			if (!target.reagents.get_free_space())
				to_chat(user, "<span class='notice'>你无法向\the [target]中添加更多调味品.</span>")
				return

			var/trans = reagents.trans_to_obj(target, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>你向\the [target]中添加了[trans]单位调味品.</span>")
		else
			..()

	feed_sound(var/mob/user)
		playsound(user.loc, "drink", rand(10, 50), TRUE)

	self_feed_message(var/mob/user)
		to_chat(user, "<span class='notice'>你咽下了\the [src]中的一些内容物.</span>")

	on_reagent_change()
		if (icon_state == "saltshakersmall" || icon_state == "peppermillsmall")
			return
		if (reagents.reagent_list.len > 0)
			switch(reagents.get_master_reagent_id())
				if ("ketchup")
					name = "番茄酱"
					desc = "你感觉自己更像美国人了."
					icon_state = "ketchup"
					center_of_mass = list("x"=16, "y"=6)
				if ("capsaicin")
					name = "辣酱"
					desc = "你现在几乎能尝到胃溃疡了!"
					icon_state = "hotsauce"
					center_of_mass = list("x"=16, "y"=6)
				if ("enzyme")
					name = "酵母"
					desc = "用于食物和饮品的发酵."
					icon_state = "enzyme"
					center_of_mass = list("x"=16, "y"=6)
				if ("soysauce")
					name = "酱油"
					desc = "一种咸味的豆制调味料."
					icon_state = "soysauce"
					center_of_mass = list("x"=16, "y"=6)
				if ("frostoil")
					name = "冰酱"
					desc = "经过时会让舌头麻木."
					icon_state = "coldsauce"
					center_of_mass = list("x"=16, "y"=6)
				if ("sodiumchloride")
					name = "盐堆"
					desc = "盐. 大概来自海洋."
				if ("blackpepper")
					name = "胡椒研磨器"
					desc = "常用于给食物调味或让人打喷嚏."
					icon_state = "peppermillsmall"
					center_of_mass = list("x"=16, "y"=10)
				if ("cornoil")
					name = "玉米油"
					desc = "一种用于烹饪的美味油脂. 由玉米制成."
					icon_state = "oliveoil"
					center_of_mass = list("x"=16, "y"=6)
				if ("sugar")
					name = "糖"
					desc = "甜!"
					center_of_mass = list("x"=16, "y"=6)
				if ("tea")
					name = "茶叶"
					desc = "与热水混合."
					center_of_mass = list("x"=16, "y"=6)
				if ("flour")
					name = "面粉袋"
					desc = "一袋小麦面粉."
					center_of_mass = list("x"=16, "y"=6)
				if ("barleyflour")
					name = "大麦面粉袋"
					desc = "一袋大麦面粉."
					center_of_mass = list("x"=16, "y"=6)
				if ("oatflour")
					name = "燕麦面粉袋"
					desc = "一袋燕麦面粉."
					center_of_mass = list("x"=16, "y"=6)
				else
					name = "杂项调味瓶"
					if (reagents.reagent_list.len==1)
						desc = "看起来是[reagents.get_master_reagent_name()],但你不确定."
					else
						desc = "多种调味品的混合物. [reagents.get_master_reagent_name()]是其中之一."
					icon_state = "mixedcondiments"
					center_of_mass = list("x"=16, "y"=6)
		else
			icon_state = "emptycondiment"
			name = "调味瓶"
			desc = "一个空调味瓶."
			center_of_mass = list("x"=16, "y"=6)
			qdel(src)
			return

/obj/item/weapon/reagent_containers/food/condiment/enzyme
	name = "酵母"
	desc = "用于食物和饮品的发酵."
	icon_state = "enzyme"
	decay = 30*600
	New()
		..()
		reagents.add_reagent("enzyme", 50)

/obj/item/weapon/reagent_containers/food/condiment/sugar
	decay = 45*600
	New()
		..()
		reagents.add_reagent("sugar", 50)

/obj/item/weapon/reagent_containers/food/condiment/saltpile		//Seperate from above since it's a small shaker rather then
	name = "盐堆"
	desc = "盐. 大概来自海洋."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "salt"
	possible_transfer_amounts = list(1,10)
	amount_per_transfer_from_this = 10
	volume = 10
	New()
		..()
		reagents.add_reagent("sodiumchloride", 10)

/obj/item/weapon/reagent_containers/food/condiment/saltpile/empty		//Seperate from above since it's a small shaker rather then
	name = "盐堆"
	desc = "盐. 大概来自海洋."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "salt"
	possible_transfer_amounts = list(1,10)
	amount_per_transfer_from_this = 10
	volume = 10

/obj/item/weapon/reagent_containers/food/condiment/saltshaker		//Seperate from above since it's a small shaker rather then
	name = "盐瓶"											//	a large one.
	desc = "盐. 大概来自海洋."
	icon_state = "saltshakersmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = TRUE
	volume = 20
	New()
		..()
		reagents.add_reagent("sodiumchloride", 20)

/obj/item/weapon/reagent_containers/food/condiment/peppermill
	name = "胡椒研磨器"
	desc = "常用于给食物调味或让人打喷嚏."
	icon_state = "peppermillsmall"
	possible_transfer_amounts = list(1,20) //for clown turning the lid off
	amount_per_transfer_from_this = TRUE
	volume = 20
	New()
		..()
		reagents.add_reagent("blackpepper", 20)

/obj/item/weapon/reagent_containers/food/condiment/flour
	name = "小面粉袋"
	desc = "一袋面粉. 适合烘焙!"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "flour"
	item_state = "flour"
	decay = 100*6000
	satisfaction = -3
	volume = 10
	New()
		..()
		if (istype(src, /obj/item/weapon/reagent_containers/food/condiment/flour/oatflour))
			reagents.add_reagent("oatflour", 10)
		else if (istype(src, /obj/item/weapon/reagent_containers/food/condiment/flour/barleyflour))
			reagents.add_reagent("barleyflour", 10)
		else
			reagents.add_reagent("flour", 10)
		pixel_x = rand(-10.0, 10)
		pixel_y = rand(-10.0, 10)

/obj/item/weapon/reagent_containers/food/condiment/flour/barleyflour
	name = "小大麦面粉袋"
/obj/item/weapon/reagent_containers/food/condiment/flour/oatflour
	name = "小燕麦面粉袋"
/obj/item/weapon/reagent_containers/food/condiment/flour/attack_self(mob/user)
	var/obj/item/weapon/reagent_containers/glass/WW
	if (!istype(user.l_hand, /obj/item/weapon/reagent_containers/glass))
		if(!istype(user.r_hand, /obj/item/weapon/reagent_containers/glass))
			to_chat(user, "<span class = 'warning'>你需要另一只手拿着水才能制作面团.</span>")
			return
		else
			WW = user.r_hand
	else
		WW = user.l_hand
	if (WW.reagents.has_reagent("water", 5))
		if (src.reagents.has_reagent("flour", 5))
			WW.reagents.remove_reagent("water", 5)
			src.reagents.remove_reagent("flour", 5)
			new/obj/item/weapon/reagent_containers/food/snacks/dough(user.loc)
			return
		else if (src.reagents.has_reagent("barleyflour", 5))
			WW.reagents.remove_reagent("water", 5)
			src.reagents.remove_reagent("barleyflour", 5)
			new/obj/item/weapon/reagent_containers/food/snacks/dough(user.loc)
			return
		else if (src.reagents.has_reagent("oatflour", 5))
			WW.reagents.remove_reagent("water", 5)
			src.reagents.remove_reagent("oatflour", 5)
			new/obj/item/weapon/reagent_containers/food/snacks/dough(user.loc)
			return
		else
			to_chat(user, "<span class = 'warning'>你需要更多面粉.</span>")
			return
	else
		to_chat(user, "<span class = 'warning'>你需要更多水。</span>")
		return

/obj/item/weapon/reagent_containers/food/condiment/bsugar
	name = "甘蔗糖"
	desc = "一堆未精炼的红糖。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "sugar"
	item_state = "flour"
	satisfaction = 8
	New()
		..()
		reagents.add_reagent("sugar", 30)
		pixel_x = rand(-10.0, 10)
		pixel_y = rand(-10.0, 10)
	decay = 0

/obj/item/weapon/reagent_containers/food/condiment/tealeaves
	name = "茶叶"
	desc = "一些茶叶。与热水混合。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "tea_leaves_dried"
	item_state = "flour"
	decay = 0
	satisfaction = 4
	New()
		..()
		reagents.add_reagent("tea", 10)
		pixel_x = rand(-10.0, 10)
		pixel_y = rand(-10.0, 10)