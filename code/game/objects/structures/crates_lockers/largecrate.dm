/obj/structure/largecrate
	name = "大板条箱"
	desc = "一个沉重的木制板条箱。"
	icon = 'icons/obj/storage.dmi'
	icon_state = "densecrate"
	density = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
/obj/structure/largecrate/attack_hand(mob/user as mob)
	to_chat(user, "<span class='notice'>你需要一根撬棍才能撬开这个!</span>")
	return

/obj/structure/largecrate/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/crowbar))
		new /obj/item/stack/material/woodplank(src)
		var/turf/T = get_turf(src)
		for (var/atom/movable/AM in contents)
			if (AM.simulated) AM.forceMove(T)
		user.visible_message("<span class='notice'>[user] 撬开了 \the [src]。</span>", \
							 "<span class='notice'>You pry open \the [src].</span>", \
							 "<span class='notice'>You hear splitting wood.</span>")
		qdel(src)
	else
		return attack_hand(user)

/obj/structure/largecrate/animal
	icon_state = "mulecrate"
	var/held_count = TRUE
	var/held_type

/obj/structure/largecrate/animal/New()
	..()
	for (var/i = TRUE;i<=held_count;i++)
		new held_type(src)

/obj/structure/largecrate/animal/dog

/obj/structure/largecrate/animal/dog/german
	held_type = /mob/living/simple_animal/complex_animal/dog/german_shepherd
	name = "德国牧羊犬板条箱"

/obj/structure/largecrate/animal/dog/pirates
	held_type = /mob/living/simple_animal/complex_animal/dog/samoyed
	name = "萨摩耶板条箱"