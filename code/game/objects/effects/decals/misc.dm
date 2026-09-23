/obj/effect/decal/point
	name = "arrow"
	desc = "一支悬在半空中的箭. 附近可能有巫师."
	icon = 'icons/mob/screen/effects.dmi'
	icon_state = "arrow"
	layer = 16.0
	anchored = TRUE
	mouse_opacity = FALSE
	should_save = 0

// Used for spray that you spray at walls, tables, hydrovats etc
/obj/effect/decal/spraystill
	density = FALSE
	anchored = TRUE
	layer = 50

/obj/effect/decal/rubbish
	name = "rubbish"
	desc = "一堆垃圾."
	icon = 'icons/obj/trash.dmi'
	icon_state = "trash_1"
	var/random = TRUE

/obj/effect/decal/rubbish/New()
	..()
	if (random)
		icon_state = "trash_[rand(1,17)]"
		update_icon()

/obj/effect/decal/piping
	name = "pipes"
	desc = "一堆管道,把什么东西运往某处."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "intact"
	layer = 2.99

/obj/effect/decal/piping/manifold
	icon_state = "manifold"

/obj/effect/decal/piping/blue
	icon_state = "intact-db"

/obj/effect/decal/piping/blue/manifold
	icon_state = "manifold-db"

/obj/effect/decal/piping/yellow
	icon_state = "intact-y"

/obj/effect/decal/piping/green
	icon_state = "intact-g-f"

/obj/effect/decal/piping/purple
	icon_state = "intact-p"

/obj/effect/decal/piping/red
	icon_state = "intact-r"

/obj/effect/decal/piping/meter
	name = "pipe meter"
	desc = "一个管道仪表."
	icon_state = "meter"
	layer = 3.01