
/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/custom
	icon = 'icons/obj/custom_containers.dmi'
	var/uncolored = TRUE
	var/image/color1
	var/image/color2
	var/topcolor = "#000000"
	var/undercolor = "#FFFFFF"
	New()
		..()
		color1 = image(icon, "[icon_state]_label1")
		color2 = image(icon, "[icon_state]_label2")
		overlays += color1
		overlays += color2
		update_icon()
/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/custom/New()
	..()
	fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[glass_type]")
	update_icon()

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/custom/update_icon()
	..()
	overlays.Cut()
	if (reagents.total_volume > 0)
		if (!fluid_image)
			fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[glass_type]")
		fluid_image.color = reagents.get_color()
		overlays += fluid_image
	overlays += color1
	overlays += color2

/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/custom/fastfoodcup
	volume = 40
	name = "快餐杯"
	desc = "一个塑料快餐杯。"
	icon_state = "fastfoodcup"
	item_state = "beer"
	value = 1


/obj/item/weapon/reagent_containers/food/drinks/drinkingglass/custom/attack_self(mob/user as mob)
	if (uncolored)
		var/input = WWinput(user, "Logo Symbol - Choose the logo symbol color:", "Main Color" , "#000000", "color")
		if (input == null || input == "")
			return
		else

			topcolor= input

		input = WWinput(user, "Background color - Choose the background color:", "Background Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			undercolor= input
		uncolored = FALSE
		color1.color = topcolor
		color2.color = undercolor
		update_icon()
	else
		..()


/obj/item/weapon/reagent_containers/food/drinks/plastic
	icon = 'icons/obj/custom_containers.dmi'
	var/uncolored = TRUE
	var/image/color1
	var/image/color2
	var/topcolor = "#000000"
	var/undercolor = "#FFFFFF"
	var/image/fluid_image
	New()
		..()
		color1 = image(icon, "[icon_state]_label1")
		color2 = image(icon, "[icon_state]_label2")
		overlays += color1
		overlays += color2
		fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[icon_state]")
		update_icon()

	on_reagent_change()
		update_icon()

/obj/item/weapon/reagent_containers/food/drinks/plastic/attack_self(mob/user as mob)
	if (uncolored)
		var/input = WWinput(user, "Logo Symbol - Choose the logo symbol color:", "Main Color" , "#000000", "color")
		if (input == null || input == "")
			return
		else

			topcolor= input

		input = WWinput(user, "Background color - Choose the background color:", "Background Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			undercolor= input
		uncolored = FALSE
		color1.color = topcolor
		color2.color = undercolor
		update_icon()
	else
		..()

/obj/item/weapon/reagent_containers/food/drinks/plastic/update_icon()
	overlays.Cut()
	if (reagents.total_volume > 0)
		if (!fluid_image)
			fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[icon_state]")
		fluid_image.color = reagents.get_color()
		overlays += fluid_image
	overlays += color1
	overlays += color2
	return

/obj/item/weapon/reagent_containers/food/drinks/plastic/cola
	volume = 70
	name = "塑料瓶"
	desc = "一个塑料瓶。"
	icon_state = "cola"
	item_state = "beer"
	value = 3

/obj/item/weapon/reagent_containers/food/drinks/plastic/condiment
	volume = 25
	name = "调味瓶"
	desc = "一个塑料调味瓶。"
	icon_state = "condiment"
	item_state = "beer"
	value = 0.5

/obj/item/weapon/reagent_containers/food/drinks/plastic/tallcan
	volume = 50
	name = "高罐"
	desc = "一个金属高罐。"
	icon_state = "tallcan"
	item_state = "beer"
	value = 1

/obj/item/weapon/reagent_containers/food/drinks/plastic/sodacan
	volume = 30
	name = "汽水罐"
	desc = "一个金属汽水罐。"
	icon_state = "sodacan"
	item_state = "beer"
	value = 0.75

/obj/item/weapon/reagent_containers/food/drinks/plastic/gallonjug
	volume = 160
	name = "加仑壶"
	desc = "一个加仑大小的壶。"
	icon_state = "gallonjug"
	item_state = "beer"
	value = 1.25

/obj/item/weapon/reagent_containers/food/drinks/plastic/carton
	volume = 50
	name = "纸盒"
	desc = "一个纸板牛奶式纸盒。"
	icon_state = "carton"
	item_state = "beer"
	value = 1


//Small bottles
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/custom
	icon = 'icons/obj/custom_containers.dmi'
	volume = 35
	var/uncolored = TRUE
	var/image/color1
	var/image/color2
	var/topcolor = "#000000"
	var/undercolor = "#FFFFFF"
	var/image/fluid_image
	New()
		..()
		color1 = image(icon, "[icon_state]_label1")
		color2 = image(icon, "[icon_state]_label2")
		overlays += color1
		overlays += color2
		fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[icon_state]")
		update_icon()

	on_reagent_change()
		update_icon()

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/custom/attack_self(mob/user as mob)
	if (uncolored)
		var/input = WWinput(user, "Logo Symbol - Choose the logo symbol color:", "Main Color" , "#000000", "color")
		if (input == null || input == "")
			return
		else

			topcolor= input

		input = WWinput(user, "Background color - Choose the background color:", "Background Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			undercolor= input
		uncolored = FALSE
		color1.color = topcolor
		color2.color = undercolor
		update_icon()
	else
		..()

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/custom/update_icon()
	overlays.Cut()
	if (reagents.total_volume > 0)
		if (!fluid_image)
			fluid_image = image('icons/obj/custom_containers.dmi', "fluid-[icon_state]")
		fluid_image.color = reagents.get_color()
		overlays += fluid_image
	overlays += color1
	overlays += color2
	return


/obj/item/weapon/reagent_containers/food/drinks/bottle/small/custom/beer
	volume = 40
	name = "啤酒瓶"
	desc = "一个玻璃啤酒瓶。"
	icon_state = "normalbeer"
	item_state = "beer"
	value = 1

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/custom/fancybeer
	volume = 50
	name = "精致啤酒瓶"
	desc = "一个精致的玻璃啤酒瓶。"
	icon_state = "fancybeer"
	item_state = "beer"
	value = 1.5

/obj/item/weapon/storage/foodbox
	name = "食品盒"
	desc = "一个盒子。装有食物。"
	icon_state = "foodbox"
	item_state = "foodbox"
	w_class = ITEM_SIZE_SMALL
	max_w_class = 2
	max_storage_space = 5
	flammable = TRUE
	icon = 'icons/obj/custom_containers.dmi'
	var/uncolored = TRUE
	var/image/color1
	var/image/color2
	var/topcolor = "#000000"
	var/undercolor = "#FFFFFF"
	New()
		..()
		color1 = image(icon, "[icon_state]_label1")
		color2 = image(icon, "[icon_state]_label2")
		overlays += color1
		overlays += color2
		update_icon()

/obj/item/weapon/storage/foodbox/attack_self(mob/user as mob)
	if (uncolored)
		var/input = WWinput(user, "Logo Symbol - Choose the logo symbol color:", "Main Color" , "#000000", "color")
		if (input == null || input == "")
			return
		else

			topcolor= input

		input = WWinput(user, "Background color - Choose the background color:", "Background Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			undercolor= input
		uncolored = FALSE
		color1.color = topcolor
		color2.color = undercolor
		update_icon()
	else
		..()

/obj/item/weapon/storage/foodbox/update_icon()
	overlays.Cut()
	overlays += color1
	overlays += color2

/obj/item/weapon/storage/foodbox/chippack
	name = "薯片包"
	desc = "一小包食物。"
	icon_state = "chippack"
	item_state = "chippack"
	w_class = ITEM_SIZE_TINY
	max_w_class = 1
	max_storage_space = 3