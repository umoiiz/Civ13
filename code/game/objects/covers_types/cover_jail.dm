/obj/covers/jail
	name = "jail"
	desc = "不要使用这个."
	icon = 'icons/turf/walls.dmi'
	icon_state = "woodjail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	amount = 1
	layer = 3
	health = 100000
	wall = TRUE
	explosion_resistance = 100
	material = "Wood"
	hardness = 15

/obj/covers/jail/attackby(obj/item/W as obj, mob/living/human/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if (istype(W,/obj/item/weapon/material/kitchen/utensil/spoon) || istype(W,/obj/item/weapon/material/kitchen/utensil/fork))
		var/obj/item/weapon/material/kitchen/utensil/I = W
		if (I.shiv < 10)
			I.shiv++
			visible_message("<span class='warning'>[user]在\the [src]上磨快了\the [I]!</span>")
			if (I.shiv >= 10)
				user.drop_from_inventory(I)
				var/obj/item/weapon/material/kitchen/utensil/knife/shank/SHK = new /obj/item/weapon/material/kitchen/utensil/knife/shank(user,I.material.name)
				user.put_in_hands(SHK)
				to_chat(user, "\The [I]变成了一把小刀.")
				qdel(I)
	if (istype(W,/obj/item/weapon/material/kitchen/utensil/chopsticks))
		var/obj/item/weapon/material/kitchen/utensil/I = W
		if (I.shiv < 10)
			I.shiv++
			visible_message("<span class='warning'>[user]在\the [src]上磨尖了\the [I]!</span>")
			if (I.shiv >= 10)
				user.drop_from_inventory(I)
				var/obj/item/weapon/material/kitchen/utensil/knife/shank/wood/SHK = new /obj/item/weapon/material/kitchen/utensil/knife/shank/wood(user,I.material.name)
				user.put_in_hands(SHK)
				to_chat(user, "\The [I]变成了一把尖刀.")
				qdel(I)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/weldingtool) && !istype(W,/obj/item/weapon/wrench) && !istype(W,/obj/item/weapon/metalfile)) //No weapons can harm me! If not weapon and not a wrench.
		to_chat(user, "你徒劳地猛砸栏杆!")//sucker

	else if (istype(W,/obj/item/weapon/weldingtool))//if it is a welding tool
		if (material != "Steel")
			to_chat(user, "这是错误的工具.")
		else
			user.visible_message(SPAN_WARNING("[user] starts disassembling \the [src]..."), SPAN_WARNING("You start disassembling \the [src]..."), "你听到什么东西在转动.")
			playsound(loc, 'sound/effects/extinguish.ogg', 50, TRUE)
			if (do_after(user, 30, target = src))
				for (var/i = TRUE, i <= buildstackamount, i++)
					new buildstack(get_turf(src))
				qdel(src)
				return
	else if (istype(W,/obj/item/weapon/wrench))//if it is a wrench
		if (material != "Wood")
			to_chat(user, "这是错误的工具.")
		else
			user.visible_message(SPAN_WARNING("[user] starts disassembling \the [src]..."), SPAN_WARNING("You start disassembling \the [src]..."), "你听到什么东西在转动.")
			playsound(loc, 'sound/items/Screwdriver.ogg', 50, TRUE)
			if (do_after(user, 30, target = src))
				for (var/i = TRUE, i <= buildstackamount, i++)
					new buildstack(get_turf(src))
				qdel(src)
	else if (istype(W,/obj/item/weapon/metalfile))//if it is a metalfile
		if (material != "Steel")
			to_chat(user, "这是错误的工具.")
		else
			user.visible_message(SPAN_WARNING("[user] starts filing through \the [src]..."), SPAN_WARNING("You start filing through \the [src]..."), "你听到金属锉磨的声音.")
			playsound(loc, 'sound/items/Screwdriver.ogg', 50, TRUE)
			if (do_after(user, 1000, target = src))
				for (var/i = TRUE, i <= buildstackamount, i++)
					new buildstack(get_turf(src))
				qdel(src)
				return
	return TRUE

/obj/covers/jail/bullet_act(var/obj/item/projectile/P)
	return PROJECTILE_CONTINUE

/obj/covers/jail/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE
	else if (istype(mover, /obj/item/projectile))
		return TRUE
	..()

/obj/covers/jail/woodjail
	name = "wood jail bars"
	desc = "用来关押囚犯."
	icon = 'icons/turf/walls.dmi'
	icon_state = "woodjail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 6
	wall = TRUE
	explosion_resistance = 0
	buildstackamount = 8
	buildstack = /obj/item/stack/material/wood
	opacity = 0
	material = "Wood"
	passable = FALSE

/obj/covers/jail/steeljail
	name = "steel jail bars"
	desc = "用来更好地关押囚犯."
	icon = 'icons/turf/walls.dmi'
	icon_state = "steeljail"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 1
	layer = 3
	health = 800
	wall = TRUE
	explosion_resistance = 65
	buildstackamount = 8
	buildstack = /obj/item/stack/rods
	opacity = 0
	material = "Steel"
	passable = FALSE
	flammable = FALSE


