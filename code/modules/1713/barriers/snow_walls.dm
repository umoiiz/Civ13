// this now inherits from window as its an easy way to give it the same
// multidirectional collision behavior

/obj/structure/window/barrier/snowwall
	name = "雪地屏障"
	icon_state = "snow_wall"
	desc = "那是由雪构成的屏障."
	icon = 'icons/obj/structures.dmi'
	layer = MOB_LAYER + 0.01 //just above mobs
	anchored = TRUE
	climbable = TRUE
	flammable = FALSE
	var/progress = FALSE

/obj/structure/window/barrier/snowwall/attack_hand(var/mob/user as mob)
	if (locate(src) in range(user, 1)) // TODO: Somehow make the user face what they are dismantling.
		if (dismantlable && user.a_intent == I_HARM)
			visible_message("<span class='danger'>[user]开始拆除雪地屏障.</span>", "<span class='danger'>你开始拆除雪地屏障.</span>")
			if (do_after(user, 200, src))
				visible_message("<span class='danger'>[user]完成了拆除雪地屏障.</span>", "<span class='danger'>你完成了拆除雪地屏障.</span>")
				var/turf = get_turf(src)

				if (!istype(src, /obj/structure/window/barrier/snowwall/incomplete))
					for (var/v in TRUE to rand(4,6))
						new /obj/item/weapon/snowwall(turf)
				else
					var/obj/structure/window/barrier/snowwall/incomplete/I = src
					for (var/v in TRUE to (1 + pick(I.progress-1, I.progress)))
						new /obj/item/weapon/snowwall(turf)
				qdel(src)


//incomplete snowwall structures
/obj/structure/window/barrier/snowwall/incomplete
	name = "未完成的雪地屏障"
	desc = "这个雪地屏障尚未完工. 再加一些雪."
	icon_state = "snow_wall_33%"
	flammable = FALSE
	incomplete = TRUE

/obj/structure/window/barrier/snowwall/incomplete/ex_act(severity)
	qdel(src)

/obj/structure/window/barrier/snowwall/incomplete/attackby(obj/O as obj, mob/user as mob)
	user.dir = get_dir(user, src)
	if (istype(O, /obj/item/weapon/snowwall))
		if (progress < 3)
			progress += 1
			if (progress == 2)
				icon_state = "snow_wall_66%"
			if (progress >= 3)
				icon_state = "snow_wall"
				new/obj/structure/window/barrier/snowwall(loc, dir)
				qdel(src)
			visible_message("<span class='danger'>[user]将雪添加到\the [src]上.</span>")
			qdel(O)
	else
		return

/obj/item/weapon/snowwall
	name = "雪堆"
	icon_state = "snow_pile"
	icon = 'icons/obj/items.dmi'
	w_class = ITEM_SIZE_TINY
	var/sand_amount = FALSE
	flammable = FALSE
	flags = FALSE

/obj/item/weapon/snowwall/attack_self(mob/user)
	to_chat(user, "你开始建造雪块墙...")
	if (do_after(user, 25, src))
		to_chat(user, "你完成了雪块墙地基的放置.")
		new /obj/covers/snow_wall/blocks/incomplete(user.loc)
		qdel(src)
		return

/obj/item/weapon/snowwall/attack_hand(mob/user)
	if (user.a_intent == I_GRAB)
		to_chat(user, "你开始把雪捏成一些雪球...")
		if (do_after(user,40,user.loc))
			to_chat(user, "你完成了雪球.")
			new/obj/item/weapon/snowball(user.loc)
			new/obj/item/weapon/snowball(user.loc)
			new/obj/item/weapon/snowball(user.loc)
			qdel(src)
	else
		..()

/obj/covers/snow_wall/blocks
	name = "snow blocks wall"
	desc = "雪块墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "igloo_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 2.12
	health = 110
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	buildstack = /obj/item/weapon/snowwall

/obj/covers/snow_wall/blocks/incomplete
	name = "snow blocks wall"
	desc = "雪块墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "igloo_wall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	amount = 0
	layer = 2.12
	health = 30
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	incomplete = TRUE

/obj/covers/snow_wall/blocks/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/snowwall))
		if (stage == 3)
			to_chat(user, "你开始往墙上添加雪...")
			if (do_after(user, 20, src) && W)
				to_chat(user, "你完成了往墙上添加雪, 将其完工.")
				qdel(W)
				new /obj/covers/snow_wall/blocks(loc)
				qdel(src)
				return
		else if (stage <= 2)
			to_chat(user, "你开始往墙上添加雪...")
			if (do_after(user, 20, src))
				if (stage <= 2)
					to_chat(user, "你完成了往墙上添加雪.")
					stage = (stage+1)
					icon_state = "igloo_wall_inc[stage]"
					health = (20*stage)
					qdel(W)
					return
	..()
