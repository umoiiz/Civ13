/obj/structure/gong
	name = "gong"
	icon = 'icons/obj/structures.dmi'
	icon_state = "gong"
	anchored = TRUE
	density = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/cooldown_gong = FALSE

obj/structure/gong/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench))
			visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"]\the [src][anchored ? "from" : "to"]地面。</span>")
			playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
			if (do_after(H,50,src))
				visible_message("<span class='warning'>[H][anchored ? "unsecures" : "secures"]\the [src][anchored ? "from" : "to"]地面。</span>")
				anchored = !anchored
				return
		if (istype(I, /obj/item/weapon/hammer))
			visible_message("<span class='warning'>[H]开始拆解\the [src]。</span>")
			playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
			if (do_after(H,50,src))
				visible_message("<span class='warning'>[H]拆解了\the [src]。</span>")
				qdel(src)
				return
		if (istype(I, /obj/item/weapon/gongmallet))
			if (cooldown_gong == FALSE)
				playsound(loc, 'sound/effects/gong.ogg', 200, FALSE, 5)
				visible_message("<span class='warning'>[H]敲响了锣!</span>")
				cooldown_gong = TRUE
				spawn(75)
					cooldown_gong = FALSE
				return
