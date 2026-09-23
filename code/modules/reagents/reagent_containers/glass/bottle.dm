
//Not to be confused with /obj/item/weapon/reagent_containers/food/drinks/bottle

/obj/item/weapon/reagent_containers/glass/bottle
	name = "瓶子"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "atoxinbottle"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60)
	flags = FALSE
	volume = 60
	var/base_state = "bottle"

	on_reagent_change()
		update_icon()

	pickup(mob/user)
		..()
		update_icon()

	dropped(mob/user)
		..()
		update_icon()

	attack_hand()
		..()
		update_icon()

	New()
		..()
		if (!icon_state)
			if (base_state)
				icon_state = base_state
			else
				icon_state = "bottle-[rand(1,4)]"

	update_icon()
		overlays.Cut()

		if (reagents.total_volume && (icon_state == "bottle-1" || icon_state == "bottle-2" || icon_state == "bottle-3" || icon_state == "bottle-4" || icon_state == "bottle"))
			var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

			var/percent = round((reagents.total_volume / volume) * 100)
			switch(percent)
				if (0 to 9)		filling.icon_state = "[icon_state]--10"
				if (10 to 24) 	filling.icon_state = "[icon_state]-10"
				if (25 to 49)	filling.icon_state = "[icon_state]-25"
				if (50 to 74)	filling.icon_state = "[icon_state]-50"
				if (75 to 79)	filling.icon_state = "[icon_state]-75"
				if (80 to 90)	filling.icon_state = "[icon_state]-80"
				if (91 to INFINITY)	filling.icon_state = "[icon_state]-100"

			filling.color = reagents.get_color()
			overlays += filling

		if (!is_open_container())
			var/image/lid = image(icon, src, "lid_bottle")
			overlays += lid

/obj/item/weapon/reagent_containers/glass/bottle/adrenaline
	name = "肾上腺素瓶"
	desc = "一个小瓶子。含有肾上腺素 - 用于稳定病人。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

	New()
		..()
		reagents.add_reagent("adrenaline", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/opium
	name = "鸦片瓶"
	desc = "一个小瓶子。含有鸦片 - 一种强效止痛药。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

	New()
		..()
		reagents.add_reagent("opium", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/toxin
	name = "毒素瓶"
	desc = "一小瓶毒素。不要喝,有毒。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

	New()
		..()
		reagents.add_reagent("toxin", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/cyanide
	name = "氰化物瓶"
	desc = "一小瓶氰化物。苦杏仁味?"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

	New()
		..()
		reagents.add_reagent("cyanide", 30) //volume changed to match chloral
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/stoxin
	name = "安眠药瓶"
	desc = "一小瓶安眠药。光是闻到气味就让人犯困。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

	New()
		..()
		reagents.add_reagent("stoxin", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/chloralhydrate
	name = "水合氯醛瓶"
	desc = "一小瓶水合氯醛。米老鼠的最爱!"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

	New()
		..()
		reagents.add_reagent("chloralhydrate", 30)		//Intentionally low since it is so strong. Still enough to knock someone out.
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/antitoxin
	name = "二乙烯瓶"
	desc = "一个小瓶子。含有二乙烯 - 可中和毒素。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

	New()
		..()
		reagents.add_reagent("anti_toxin", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/mutagen
	name = "不稳定诱变剂瓶"
	desc = "一个小瓶子。含有不稳定诱变剂 - 会随机改变接触者的DNA结构。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-1"

	New()
		..()
		reagents.add_reagent("mutagen", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/ammonia
	name = "氨水瓶"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-1"

	New()
		..()
		reagents.add_reagent("ammonia", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/diethylamine
	name = "二乙胺瓶"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

	New()
		..()
		reagents.add_reagent("diethylamine", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/acetone
	name = "丙酮瓶"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-2"

	New()
		..()
		reagents.add_reagent("acetone", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/potassium_chloride
	name = "氯化钾瓶"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

	New()
		..()
		reagents.add_reagent("potassium_chloride", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/carbon
	name = "碳瓶"
	desc = "一个小瓶子。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

	New()
		..()
		reagents.add_reagent("carbon", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/pacid
	name = "多聚烟酸瓶"
	desc = "一个小瓶子。含有多聚烟酸"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"
	New()
		..()
		reagents.add_reagent("pacid", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/adminordrazine
	name = "Adminordrazine瓶"
	desc = "一个小瓶子。含有众神的液体精华。"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "holyflask"
	New()
		..()
		reagents.add_reagent("adminordrazine", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/capsaicin
	name = "辣椒素瓶"
	desc = "一个小瓶子。含有辣酱。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"
	New()
		..()
		reagents.add_reagent("capsaicin", 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/frostoil
	name = "霜油瓶"
	desc = "一个小瓶子。含有冷酱。"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"
	New()
		..()
		reagents.add_reagent("frostoil", 60)
		update_icon()
