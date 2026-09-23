/obj/item/remains
	name = "遗骸"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	anchored = FALSE
	value = 0
/obj/item/remains/human
	desc = "看起来像是人类遗骸. 它们散发着一种奇怪的气息."

/obj/item/remains/mouse
	desc = "看起来像是小型啮齿动物的遗骸."
	icon_state = "mouse"

/obj/item/remains/lizard
	desc = "看起来像是小型爬行动物的遗骸."
	icon_state = "lizard"

/obj/item/remains/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("[src] sinks together into a pile of ash."))
	var/turf/floor/F = get_turf(src)
	if (istype(F))
		new /obj/effect/decal/cleanable/ash(F)
	qdel(src)