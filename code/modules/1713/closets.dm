/obj/structure/closet/cabinet
	name = "柜子"
	desc = "旧物永远时尚."
	icon_state = "cabinet_closed"
	icon_closed = "cabinet_closed"
	icon_opened = "cabinet_open"

/obj/structure/closet/cabinet/ceiling
	name = "柜子"
	desc = "旧物永远时尚."
	icon_state = "cabinet_closed_ceiling"
	icon_closed = "cabinet_closed_ceiling"
	icon_opened = "cabinet_open_ceiling"
	anchored = TRUE
	store_mobs = FALSE

/obj/structure/closet/cabinet/first_aid
	name = "急救柜"
	desc = "一个壁挂式储物柜,用于存放急救用品."
	icon_state = "medical_wall"
	icon_closed = "medical_wall"
	icon_opened = "medical_wall_open"
	anchored = TRUE
	density =  FALSE
	wall_mounted = TRUE
	storage_capacity = 2
	store_mobs = FALSE
	New()
		..()
		new /obj/item/weapon/storage/firstaid/advsmall(src)

/obj/structure/closet/cabinet/defibrillator
	name = "除颤器柜"
	desc = "一个壁挂式储物柜,用于存放除颤器."
	icon_state = "defib_wall"
	icon_closed = "defib_wall"
	icon_opened = "defib_wall_open"
	anchored = TRUE
	density =  FALSE
	wall_mounted = TRUE
	storage_capacity = 1
	store_mobs = FALSE
	New()
		..()
		new /obj/item/weapon/defibrillator/loaded(src)

/obj/structure/closet/cabinet/extinguisher_cabinet
	name = "灭火器柜"
	desc = "一个小型壁挂式柜子,用于存放灭火器."
	icon_state = "extinguisher_closed"
	icon_closed = "extinguisher_closed"
	icon_opened = "extinguisher_empty"
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	storage_capacity = 2
	var/obj/item/weapon/reagent_containers/glass/fire_extinguisher/has_extinguisher

/obj/structure/closet/cabinet/extinguisher_cabinet/New()
	..()
	has_extinguisher = new/obj/item/weapon/reagent_containers/glass/fire_extinguisher(src)

/obj/structure/closet/cabinet/extinguisher_cabinet/attackby(obj/item/O, mob/user)
	if(!ishuman(user))
		return
	if(istype(O, /obj/item/weapon/reagent_containers/glass/fire_extinguisher))
		if(!has_extinguisher && opened)
			user.remove_from_mob(O)
			contents += O
			has_extinguisher = O
			to_chat(user, "<span class='notice'>你将[O]放入[src].</span>")
			playsound(src.loc, 'sound/effects/extin.ogg', 50, 0)
			density = FALSE
		else
			opened = !opened
	else
		opened = !opened
	update_icon()

/obj/structure/closet/cabinet/extinguisher_cabinet/attack_hand(mob/user)
	if(!ishuman(user))
		return
	if(has_extinguisher)
		user.put_in_hands(has_extinguisher)
		to_chat(user, "<span class='notice'>你从[src]中取出[has_extinguisher].</span>")
		playsound(src.loc, 'sound/effects/extout.ogg', 50, 0)
		has_extinguisher = null
		opened = 1
	else
		opened = !opened
	update_icon()

/obj/structure/closet/cabinet/extinguisher_cabinet/update_icon()
	if(!opened)
		icon_state = "extinguisher_closed"
		return
	if(has_extinguisher)
		icon_state = "extinguisher_full"
	else
		icon_state = "extinguisher_empty"

/obj/structure/closet/cabinet/extinguisher_cabinet/AltClick(mob/user)
	if(!ishuman(user))
		return
	opened = !opened
	update_icon()

///////////////Hide-outs//////////////////

/obj/structure/closet/hideout
	name = "奇怪的叶子"
	desc = "这里有些可疑..."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "pine_closed"
	icon_closed = "pine_closed"
	icon_opened = "pine_open"
	anchored = TRUE
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/closet/hideout/pine
	name = "奇怪的叶子"
	desc = "这里有些可疑..."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "pine_closed"
	icon_closed = "pine_closed"
	icon_opened = "pine_open"
	anchored = TRUE
	density = FALSE

/obj/structure/closet/hideout/beach
	name = "奇怪的叶子"
	desc = "这里有些可疑..."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "beach_closed"
	icon_closed = "beach_closed"
	icon_opened = "beach_open"
	anchored = TRUE
	density = FALSE

/obj/structure/closet/hideout/autumn
	name = "奇怪的叶子"
	desc = "这里有些可疑..."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "autumn_closed"
	icon_closed = "autumn_closed"
	icon_opened = "autumn_open"
	anchored = TRUE
	density = FALSE


/obj/structure/closet/cabinet/update_icon()
	if (!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/chemical
	name = "化学品柜"
	desc = "在此存放危险化学品."
	icon_state = "medical1"
	icon_closed = "medical"
	icon_opened = "medicalopen"

	New()
		..()
		new /obj/item/weapon/storage/box/pillbottles(src)
		new /obj/item/weapon/storage/box/pillbottles(src)