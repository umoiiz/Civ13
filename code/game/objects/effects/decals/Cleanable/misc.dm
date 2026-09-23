/obj/effect/decal/cleanable/generic
	name = "clutter"
	desc = "该有人清理一下了."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/obj/objects.dmi'
	icon_state = "shards"

/obj/effect/decal/cleanable/ash
	name = "ashes"
	desc = "尘归尘,土归土."
	gender = PLURAL
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	anchored = TRUE
	decay_timer = 16000
	New()
		..()
		pixel_x = rand(-8, 8)
		pixel_y = rand(-8, 8)

/obj/effect/decal/cleanable/ash/attackby(obj/item/weapon/reagent_containers/glass/C as obj, mob/user as  mob )
	if (istype(C))
		C.reagents.add_reagent("ash", 1)
		to_chat(user, "你把灰烬收进[C.name].")
		qdel(src)
		return

/obj/effect/decal/cleanable/ash/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("[src] sifts through your fingers."))
	var/turf/floor/F = get_turf(src)
	if (istype(F))
		F.dirt += 4
	qdel(src)

/obj/effect/decal/cleanable/dirt
	name = "dirt"
	desc = "该有人清理一下了."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/effects.dmi'
	icon_state = "dirt"
	mouse_opacity = FALSE

/obj/effect/decal/cleanable/flour
	name = "flour"
	desc = "它还挺好的. 四秒规则!"
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/effects.dmi'
	icon_state = "flour"
	decay_timer = 18000

/obj/effect/decal/cleanable/greenglow
	name = "glowing goo"
	desc = "天哪. 希望那不是午餐."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	light_range = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

	decay_timer = 1200

/obj/effect/decal/cleanable/foam
	name = "foam"
	desc = "灭火器喷出的白色泡沫."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	light_range = TRUE
	icon = 'icons/effects/effects.dmi'
	icon_state = "foam"

	decay_timer = 300


/obj/effect/decal/cleanable/cobweb
	name = "cobweb"
	desc = "该有人清理一下了."
	density = FALSE
	anchored = TRUE
	layer = 3
	icon = 'icons/effects/effects.dmi'
	icon_state = "cobweb1"

/obj/effect/decal/cleanable/molten_item
	name = "gooey grey mass"
	desc = "看起来像是融化的...什么东西."
	density = FALSE
	anchored = TRUE
	layer = 3
	icon = 'icons/obj/chemical.dmi'
	icon_state = "molten"
	decay_timer = 18000

/obj/effect/decal/cleanable/cobweb2
	name = "cobweb"
	desc = "该有人清理一下了."
	density = FALSE
	anchored = TRUE
	layer = 3
	icon = 'icons/effects/effects.dmi'
	icon_state = "cobweb2"

//Vomit (sorry)
/obj/effect/decal/cleanable/vomit
	name = "vomit"
	desc = "天哪,真恶心."
	gender = PLURAL
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/blood.dmi'
	icon_state = "vomit_1"
	random_icon_states = list("vomit_1", "vomit_2", "vomit_3", "vomit_4")
	decay_timer = 18000

	Destroy()
		..()

/obj/effect/decal/cleanable/vomit/bloody
	name = "bloody vomit"
	icon_state = "vomit_b1"
	random_icon_states = list("vomit_b1", "vomit_b2", "vomit_b3", "vomit_b4")

	Destroy()
		..()
/obj/effect/decal/cleanable/tomato_smudge
	name = "tomato smudge"
	desc = "它是红色的."
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")
	decay_timer = 18000

/obj/effect/decal/cleanable/egg_smudge
	name = "smashed egg"
	desc = "看来这个孵不出来了."
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")
	decay_timer = 12000

/obj/effect/decal/cleanable/pie_smudge //honk
	name = "smashed pie"
	desc = "这是奶油派的奶油."
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("smashed_pie")
	decay_timer = 18000

/obj/effect/decal/cleanable/fruit_smudge
	name = "smudge"
	desc = "某种水果的污渍."
	density = FALSE
	anchored = TRUE
	layer = 2
	icon = 'icons/effects/blood.dmi'
	icon_state = "mfloor1"
	random_icon_states = list("mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")
	decay_timer = 18000