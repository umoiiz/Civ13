/* Doors*/

/obj/covers/saloon_door
	name = "saloon door"
	desc = "一扇木门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "saloon"
	passable = TRUE
	not_movable = TRUE
	density = FALSE
	opacity = FALSE
	amount = 2
	layer = 3
	health = 90
	wall = FALSE
	explosion_resistance = 3
	material = "Wood"


/obj/covers/saloon_door/Crossed(mob/living/human/M as mob )
	if (ismob(M) && !isghost(M) && M.mob_size >= MOB_MEDIUM)
		visible_message("[M]推了\the [src].","你推了\the [src]")
		icon_state = "saloon_opening"
		update_icon()
		spawn(20)
			icon_state = "saloon"
			update_icon()

/* Doors - End*/

/obj/covers/wood_wall/oriental/doorway
	name = "oriental doorway"
	desc = "一个东方式门道."
	icon = 'icons/turf/walls.dmi'
	icon_state = "oriental-door"
	density = FALSE
	opacity = FALSE
	health = 180

/obj/covers/wood_wall/bamboo/door
	name = "bamboo doorway"
	desc = "一个竹制门道."
	icon = 'icons/obj/bamboostuff.dmi'
	icon_state = "bamboo-door"
	density = FALSE
	opacity = FALSE
	health = 80
	amount = 3
	layer = 3
	health = 70
	wall = TRUE
	explosion_resistance = 3
	material = "Wood"
	hardness = 40

/obj/covers/sandstone_wall/classic/archway
	name = "sandstone block archway"
	desc = "一个砂岩块拱门."
	icon_state = "sandstone_block_archway"
	base_icon_state = "sandstone_block_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/sandstone_wall/classic/archway/red
	name = "red sandstone block archway"
	desc = "一个红砂岩块拱门."
	icon_state = "redsandstone_block_archway"
	base_icon_state = "redsandstone_block_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/sandstone_wall/egyptian/archway
	name = "egyptian archway"
	desc = "一个埃及风格砂岩拱门."
	icon_state = "egyptian_archway"
	base_icon_state = "egyptian_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/stone_wall/classic/archway
	name = "stone block archway"
	desc = "一个石块拱门."
	icon_state = "stone_block_archway"
	base_icon_state = "stone_block_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/stone_wall/classic/archway/marble
	name = "marble block archway"
	desc = "一个大理石块拱门."
	icon_state = "marble_block_archway"
	base_icon_state = "marble_block_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/marble_wall/grecian/archway
	name = "grecian archway"
	desc = "一个宏伟的希腊式拱门."
	icon_state = "grecian_archway"
	base_icon_state = "grecian_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/marble_wall/grecian/archway/modern
	name = "grand marble archway"
	desc = "一个宏伟的大理石拱门."

/obj/covers/stone_wall/brick/archway
	name = "stone brick archway"
	desc = "一个石砖拱门."
	icon_state = "new_stonebrick_archway"
	base_icon_state = "new_stonebrick_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE

/obj/covers/stone_wall/fortress/archway
	name = "fortress brick archway"
	desc = "一个要塞砖拱门."
	icon_state = "fortress_brickwall_archway"
	base_icon_state = "fortress_brickwall_archway"
	adjusts = FALSE
	density = FALSE
	opacity = FALSE
