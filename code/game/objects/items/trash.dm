//Items labled as 'trash' for the trash bag.
//TODO: Make this an item var or something...

//Added by Jack Rost
/obj/item/trash
	icon = 'icons/obj/trash.dmi'
	w_class = ITEM_SIZE_SMALL
	desc = "这是垃圾。"
	value = 0

/obj/item/kitchen/plate
	name = "盘子"
	desc = "一个普通的盘子。"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "plate"
	dropsound = 'sound/effects/drop_glass.ogg'

/obj/item/kitchen/snack_bowl
	name = "碗"
	desc = "一个普通的碗。"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "snack_bowl"
	dropsound = 'sound/effects/drop_glass.ogg'
	value = 4

/obj/item/kitchen/wood_bowl
	name = "木碗"
	desc = "一个普通的木碗。"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "wood_bowl"
	value = 2
	flammable = TRUE

/obj/item/kitchen/snack_bowl/New()
	..()
	pixel_x = rand(-5,5)

/obj/item/kitchen/wood_bowl/New()
	..()
	pixel_x = rand(-5,5)
/obj/item/trash/tray
	name = "托盘"
	desc = "一个普通的托盘。"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "tray"

/obj/item/trash/candle
	name = "蜡烛"
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4"
	flammable = TRUE

/obj/item/trash/candle/lard
	name = "猪油蜡烛"
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle4_lard"
	flammable = TRUE
	attackby(obj/item/W as obj, mob/user as mob)
		if(istype(W, /obj/item/weapon/reagent_containers/glass))
			var/obj/item/weapon/reagent_containers/glass/G = W
			if(!G.is_open_container())
				to_chat(user, SPAN_NOTICE("\The [G.name] is closed."))
				return
			if(!G.reagents.get_free_space())
				to_chat(user, SPAN_NOTICE("[G.name] is full."))
				return
			to_chat(user, "你把[src.name]砸进了[G.name]里,弄出了猪油.")
			G.reagents.add_reagent("lard", 1)
			qdel(src)
			return
		else
			return ..()

/obj/item/trash/money
	name = "钱"
	desc = "一叠钞票."
	icon_state = "money"
	flammable = TRUE

/obj/item/trash/attack(mob/M as mob, mob/living/user as mob)
	return
