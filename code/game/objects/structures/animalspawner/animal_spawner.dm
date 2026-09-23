/obj/structure/animalspawner
	name = "空洞穴"
	icon = 'icons/obj/animal_spawner.dmi'
	desc = "那是个空洞穴.看起来像是动物们喜欢躲藏的地方."
	anchored = TRUE
	density = TRUE
	var/females = 0
	var/males = 0
	var/cubs = 0
	var/cub_growing = FALSE
	var/total_population = 0
	var/ticking = FALSE
	var/t_climate = null
	var/aggroed = FALSE
	var/empty = TRUE
	var/procreate_holder = 27000 //45 minutes - TIMER TO PROCREATE
	var/procreate_cooldown = FALSE
	var/wanderer_holder = 18000 //30 minutes to roll the chance for the wanderer to go out
	var/wanderer_cooldown = FALSE

/obj/structure/animalspawner/attackby(obj/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/material/pickaxe) && empty)
		if (do_after(user,65,src))
			to_chat(user, "<span class='notice'>你拆开了\the [src].</span>")
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			new /obj/item/stack/material/stone(loc)
			qdel(src)
	..()