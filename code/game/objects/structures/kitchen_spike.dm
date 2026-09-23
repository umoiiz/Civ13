//////Kitchen Spike

/obj/structure/kitchenspike
	name = "一根肉刺"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "spike"
	desc = "用于从动物身上收集肉类的尖刺。"
	density = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 0.01
	var/meat = FALSE
	var/occupied
	var/meat_type
	var/victim_name = "corpse"
	not_movable = FALSE
	not_disassemblable = TRUE
/obj/structure/kitchenspike/attackby(obj/item/weapon/grab/G as obj, mob/user as mob)
	if (!istype(G, /obj/item/weapon/grab) || !G.affecting)
		return
	if (occupied)
		to_chat(user, "<span class = 'danger'>尖刺上已经有东西了,先把它上面的肉收集完!</span>")
	else
		if (spike(G.affecting))
			visible_message("<span class = 'danger'>[user]将[G.affecting]强行刺到尖刺上,当场将其杀死!</span>")
			qdel(G.affecting)
			qdel(G)
		else
			to_chat(user, "<span class='danger'>它们对尖刺来说太大了,试试小一点的!</span>")

/obj/structure/kitchenspike/proc/spike(var/mob/living/victim)

	if (!istype(victim))
		return

	if (istype(victim, /mob/living/human))
		var/mob/living/human/H = victim
		if (!issmall(H))
			return FALSE
		meat_type = H.species.meat_type
		icon_state = "spikebloody"
	else
		return FALSE

	victim_name = victim.name
	occupied = TRUE
	meat = 5
	return TRUE

/obj/structure/kitchenspike/attack_hand(mob/user as mob)
	if (..() || !occupied)
		return
	meat--
	new meat_type(get_turf(src))
	if (meat > 1)
		to_chat(user, "你从\the [victim_name]上取下了一些肉。")
	else if (meat == TRUE)
		to_chat(user, "你从\the [victim_name]上取下了最后一块肉!")
		icon_state = "spike"
		occupied = FALSE
