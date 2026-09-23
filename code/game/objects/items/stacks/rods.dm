/obj/item/stack/rods
	name = "金属杆"
	desc = "一些金属杆. 可用于建造."
	icon = 'icons/obj/materials.dmi'
	singular_name = "metal rod"
	icon_state = "rods"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 3
	throw_range = 3
	max_amount = 50
	attack_verb = list("hit", "bludgeoned", "whacked")
	flags = CONDUCT

/obj/item/stack/rods/attack_self(mob/user as mob)
	add_fingerprint(user)

	if (!istype(user.loc,/turf)) return FALSE

	if (locate(/obj/structure/grille, usr.loc))
		for (var/obj/structure/grille/G in usr.loc)
			if (G.destroyed)
				G.health = 10
				G.density = TRUE
				G.destroyed = FALSE
				G.icon_state = "grille"
				use(1)
			else
				return TRUE

	else if (!in_use)
		if (amount < 2)
			to_chat(user, "<span class='warning'>你至少需要两根金属杆才能这样做.</span>")
			return
		to_chat(usr, "<span class='notice'>正在组装格栅...</span>")
		in_use = TRUE
		if (!do_after(usr, 10))
			in_use = FALSE
			return
		var/obj/structure/grille/F = new /obj/structure/grille/ ( usr.loc )
		to_chat(usr, "<span class='notice'>你组装了一个格栅</span>")
		in_use = FALSE
		F.add_fingerprint(usr)
		use(2)
	return
