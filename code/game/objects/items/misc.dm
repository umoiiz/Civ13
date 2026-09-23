/obj/item/wood_ash //This new item exists due to the cleanable/ash can only exist in one per tile
	name = "灰烬"
	desc = "尘归尘,土归土。"
	gender = PLURAL
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	anchored = TRUE
	var/decay_timer = 16000
	New()
		..()
		pixel_x = rand(-8, 8)
		pixel_y = rand(-8, 8)
		spawn(decay_timer)
			qdel(src)

/obj/item/wood_ash/attackby(obj/item/weapon/reagent_containers/glass/C as obj, mob/user as  mob )
	C.reagents.add_reagent("ash", 1)
	to_chat(user, "你将灰烬收集到\the [C.name]中")
	qdel(src)
	return

/obj/item/wood_ash/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("[src] sifts through your fingers."))
	var/turf/floor/F = get_turf(src)
	if (istype(F))
		F.dirt += 4
	qdel(src)