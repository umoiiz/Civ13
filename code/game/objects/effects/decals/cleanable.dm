/obj/effect/decal/cleanable
	var/list/random_icon_states = list()
	var/decay_timer = 0
/obj/effect/decal/cleanable/clean_blood(var/ignore = FALSE)
	if (!ignore)
		qdel(src)
		return
	..()

/obj/effect/decal/cleanable/New()
	if (istype(loc, /turf/floor/beach/water))
		var/found = FALSE
		for(var/obj/covers/C in loc)
			found = TRUE
			break
		if (!found)
			spawn(10)
				if(src)
					qdel(src)
	if (random_icon_states && length(random_icon_states) > 0)
		icon_state = pick(random_icon_states)
	..()
	cleanables += src
	if (decay_timer)
		do_decay()

/obj/effect/decal/cleanable/Destroy()
	cleanables -= src
	..()

/obj/effect/decal/cleanable/proc/do_decay()
	spawn(decay_timer)
		if (src)
			Destroy()

/obj/effect/decal/cleanable/graffiti
	name = "graffiti"
	desc = "一个用油漆制作的涂鸦."
	icon = 'icons/obj/decals.dmi'
	icon_state = "graffiti1"

	New()
		..()
		icon_state = "graffiti[rand(1,3)]"

/obj/effect/decal/cleanable/graffiti_grove
	name = "Grove Street graffiti"
	desc = "一个用喷漆罐制作的涂鸦."
	icon = 'icons/obj/decals.dmi'
	icon_state = "graffiti_grove"

/obj/effect/decal/cleanable/graffiti_ballas
	name = "Rollin Heights Ballas graffiti"
	desc = "喷漆罐画的涂鸦."
	icon = 'icons/obj/decals.dmi'
	icon_state = "graffiti_ballas"