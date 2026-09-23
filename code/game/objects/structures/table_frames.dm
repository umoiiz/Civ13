/* Table Frames
 * Contains:
 *		Frames
 *		Wooden Frames
 */


/*
 * Normal Frames
 */

/obj/structure/table_frame
	name = "桌架"
	desc = "四条金属桌腿和四根桌架横杆组成的桌架.你可以轻松穿过它."
	icon = 'icons/obj/structures.dmi'
	icon_state = "table_frame"
	density = FALSE
	anchored = FALSE
	layer = 2.8
	var/framestack = /obj/item/stack/rods
	var/framestackamount = 2
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
/obj/structure/table_frame/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/weapon/wrench))
		to_chat(user, "<span class='notice'>你开始拆解[src]...</span>")
		playsound(loc, 'sound/items/Ratchet.ogg', 50, TRUE)
		if (do_after(user, 30, target = src))
			playsound(loc, 'sound/items/Deconstruct.ogg', 50, TRUE)
			for (var/i = TRUE, i <= framestackamount, i++)
				new framestack(get_turf(src))
			qdel(src)
			return
	if (istype(I, /obj/item/stack/material/iron))
		var/obj/item/stack/material/iron/M = I
		if (M.amount < 1)
			to_chat(user, "<span class='warning'>你需要一张金属板才能做到!</span>")
			return
		to_chat(user, "<span class='notice'>你开始将[M]添加到[src]上...</span>")
		if (do_after(user, 20, target = src))
			M.use(1)
			new /obj/structure/table(loc)
			qdel(src)
		return
	if (istype(I, /obj/item/stack/material/glass))
		var/obj/item/stack/material/glass/G = I
		if (G.amount < 1)
			to_chat(user, "<span class='warning'>你需要一张玻璃板才能做到!</span>")
			return
		to_chat(user, "<span class='notice'>你开始将[G]添加到[src]上...</span>")
		if (do_after(user, 20, target = src))
			G.use(1)

			new /obj/structure/table/glass(loc)
			qdel(src)
		return

/*
 * Wooden Frames
 */

/obj/structure/table_frame/wood
	name = "木桌架"
	desc = "四条木桌腿和四根木桌架横杆组成的木桌架.你可以轻松穿过它."
	icon_state = "wood_frame"
	framestack = /obj/item/stack/material/wood
	framestackamount = 2

/obj/structure/table_frame/wood/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/weapon/wrench))
		..()
	if (istype(I, /obj/item/stack/material/wood))
		var/obj/item/stack/material/wood/W = I
		if (W.amount < 1)
			to_chat(user, "<span class='warning'>你需要一张木板才能做到!</span>")
			return
		to_chat(user, "<span class='notice'>你开始将[W]添加到[src]上...</span>")
		if (do_after(user, 20, target = src))
			W.use(1)
			new /obj/structure/table/wood(loc)
			qdel(src)
		return
