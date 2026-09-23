/obj/item/weapon/mop
	desc = "没有拖把,清洁工的世界就不完整."
	name = "拖把"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "mop"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 5
	throw_range = 10
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("mopped", "bashed", "bludgeoned", "whacked")
	var/mopping = FALSE
	flammable = TRUE
	flags = FALSE

/obj/item/weapon/mop/New()
	create_reagents(30)

/obj/item/weapon/mop/afterattack(atom/A, mob/user, proximity)
	if (!proximity) return
	if (istype(A, /turf) || istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay) || istype(A, /obj/covers))
		if (reagents.total_volume < 1)
			to_chat(user, "<span class='notice'>你的拖把是干的!</span>")
			return
		var/turf/T = get_turf(A)
		if (!T)
			return

		user.visible_message("<span class='warning'>[user]开始清洁\the [T].</span>")

		if (do_after(user, 40, T))
			if (T)
				T.clean(src, user)
			to_chat(user, "<span class='notice'>你完成了拖地!</span>")


/obj/effect/attackby(obj/item/I, mob/user)
	if (istype(I, /obj/item/weapon/mop) /*|| istype(I, /obj/item/weapon/soap)*/)
		return
	..()
