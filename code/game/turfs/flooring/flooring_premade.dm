/turf/floor/carpet
	name = "carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	initial_flooring = /decl/flooring/carpet

/turf/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "wood"
	initial_flooring = /decl/flooring/wood

/turf/floor/grass
	name = "wild grass"
	icon = 'icons/turf/floors.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass
	is_diggable = TRUE
	uses_winter_overlay = TRUE
	may_become_muddy = TRUE

/turf/floor/grass/ex_act(severity)
	return

/turf/floor/grass/New()
	..()
	grass_turf_list += src
	icon_state = "grass[rand(0,3)]"

/turf/floor/proc/plant()
	return

/turf/floor/beach/sand/desert/plant()
	if (locate(/obj/structure) in src)
		return
	if (locate(/obj/covers) in src)
		return
	if (locate(/obj/item) in src)
		return

	if (prob(3))
		new/obj/structure/wild/rock(src)
	else if (prob(1.5))
		new/obj/structure/wild/rock/basalt(src)
	else if (prob(1.5))
		new/obj/structure/wild/palm(src)
	else if (prob(1))
		new/obj/structure/wild/tree/dead_tree(src)
	else if (prob(1))
		new/obj/structure/wild/tree/cactus(src)
	else if (prob(1))
		new/obj/structure/wild/tallgrass2(src)

/turf/floor/dirt/plant()
	if (istype(src, /turf/floor/dirt/burned) || istype(src, /turf/floor/dirt/dry_lava) || istype(src, /turf/floor/dirt/flooded) || istype(src, /turf/floor/dirt/ploughed) || istype(src, /turf/floor/dirt/underground))
		return
	if (locate(/obj/structure) in src)
		return
	if (locate(/obj/covers) in src)
		return
	if (locate(/obj/item) in src)
		return
	var/area/A = get_area(src)
	if (A.location == AREA_INSIDE)
		return
	if (prob(3))
		new/obj/structure/wild/rock(src)
	else if (prob(1.5))
		new/obj/structure/wild/rock/basalt(src)
	else
		switch(A.climate)
			if ("tundra")
				if(prob(1.5))
					new/obj/structure/wild/smallbush(src)
			if ("taiga")
				if(prob(2))
					new/obj/structure/wild/smallbush(src)
			if ("temperate")
				if(prob(3.5))
					new/obj/structure/wild/smallbush(src)
				else if(prob(4))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(1.5))
					new/obj/structure/wild/junglebush(src)
			if ("semiarid")
				if (prob(1.5))
					new/obj/structure/wild/jungle/medpine(src)
				else if(prob(1))
					new/obj/structure/wild/smallbush(src)
				else if(prob(3))
					new/obj/structure/wild/tallgrass2(src)
				else if(prob(1))
					new/obj/structure/wild/palm(src)
			if ("jungle")
				if(prob(2))
					new/obj/structure/wild/smallbush(src)
				else if(prob(7))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(1.5))
					new/obj/structure/wild/junglebush(src)
			if ("savanna")
				if(prob(2))
					new/obj/structure/wild/smallbush(src)
				else if(prob(7))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(1.5))
					new/obj/structure/wild/junglebush(src)
			if ("desert")
				if (prob(3))
					new/obj/structure/wild/rock(src)
				else if (prob(1.5))
					new/obj/structure/wild/rock/basalt(src)
				else if (prob(1))
					new/obj/structure/wild/palm(src)
				else if (prob(0.5))
					new/obj/structure/wild/tree/dead_tree(src)
				else if (prob(1.5))
					new/obj/structure/wild/tallgrass2(src)
/turf/floor/winter/grass/plant()
	if (locate(/obj/structure) in src)
		return
	if (locate(/obj/covers) in src)
		return
	if (locate(/obj/item) in src)
		return
	var/area/A = get_area(src)
	if (prob(1))
		new/obj/structure/wild/rock(src)
	else if (prob(0.5))
		new/obj/structure/wild/rock/basalt(src)
	else
		switch(A.climate)
			if ("tundra")
				if (prob(3))
					new/obj/structure/wild/tree/live_tree/pine(src)
				else if(prob(1.5))
					new/obj/structure/wild/smallbush(src)
			if ("taiga")
				if (prob(9))
					new/obj/structure/wild/tree/live_tree/pine(src)
				else if(prob(2))
					new/obj/structure/wild/smallbush(src)
			if ("temperate")
				if (prob(9))
					new/obj/structure/wild/tree/live_tree(src)
				else if(prob(2.5))
					new/obj/structure/wild/smallbush(src)
				else if(prob(1))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(0.5))
					new/obj/structure/wild/junglebush(src)

/turf/floor/grass/plant()
	if (locate(/obj/structure) in src)
		return
	if (locate(/obj/covers) in src)
		return
	if (locate(/obj/item) in src)
		return
	var/area/A = get_area(src)

	if (prob(1))
		new/obj/structure/wild/rock(src)
	else if (prob(0.5))
		new/obj/structure/wild/rock/basalt(src)
	else
		switch(A.climate)
			if ("tundra")
				if (prob(3))
					new/obj/structure/wild/tree/live_tree/pine(src)
				else if(prob(1.5))
					new/obj/structure/wild/smallbush(src)
			if ("taiga")
				if (prob(9))
					new/obj/structure/wild/tree/live_tree/pine(src)
				else if(prob(2))
					new/obj/structure/wild/smallbush(src)
			if ("temperate")
				if (prob(7))
					new/obj/structure/wild/tree/live_tree(src)
				else if(prob(5))
					new/obj/structure/wild/smallbush(src)
				else if(prob(3))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(0.5))
					new/obj/structure/wild/junglebush(src)
				else if (prob(0.5))
					new/obj/structure/wild/flowers(src)
			if ("semiarid")
				if (prob(7))
					new/obj/structure/wild/jungle/medpine(src)
				else if(prob(1))
					new/obj/structure/wild/smallbush(src)
				else if(prob(3))
					new/obj/structure/wild/tallgrass2(src)
				else if(prob(2))
					new/obj/structure/wild/palm(src)
			if ("jungle")
				if (prob(9))
					new/obj/structure/wild/jungle(src)
				else if(prob(2))
					if (prob(50))
						new/obj/structure/wild/bamboo(src)
					else
						new/obj/structure/wild/palm(src)
				else if(prob(3))
					new/obj/structure/wild/smallbush(src)
				else if(prob(5))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(0.5))
					new/obj/structure/wild/junglebush(src)
				else if(prob(1))
					new/obj/structure/wild/largejungle(src)
				else if (prob(1))
					new/obj/structure/wild/flowers(src)
			if ("savanna")
				if (prob(3))
					new/obj/structure/wild/jungle/acacia(src)
				else if(prob(3))
					new/obj/structure/wild/smallbush(src)
				else if(prob(5))
					new/obj/structure/wild/tallgrass(src)
				else if(prob(0.5))
					new/obj/structure/wild/junglebush(src)

/turf/floor/dirt
	name = "dirt"
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt"
	uses_winter_overlay = TRUE
	may_become_muddy = TRUE
	available_dirt = 3
	is_diggable = TRUE
	var/soil_nutrition = 150
	var/max_soil_nutrition = 150
	var/min_soil_nutrition = 0
	initial_flooring = /decl/flooring/dirt

/turf/floor/dirt/New()
	soil_nutrition_recover() // Starts soil nutrition recover
	return ..()

/turf/floor/dirt/proc/soil_nutrition_recover()
	spawn(rand(12000,12010)) // Every 20 minutes the soil will recover. Randomised values to prevent all the turfs from running it at the same time lagging the game
		if(!istype(src, /turf/floor/dirt)) // It could be that the turf has ceased to be dirt during the wait
			return
		if(soil_nutrition < max_soil_nutrition)
			if (!locate(/obj/structure/farming/plant) in src) // Soil recovers when no farming plants
				var/nutrition_to_be_recovered = rand(20, 40)
				if(soil_nutrition + nutrition_to_be_recovered > max_soil_nutrition)
					soil_nutrition = max_soil_nutrition
				else
					soil_nutrition += nutrition_to_be_recovered
		soil_nutrition_recover()
		return

/turf/floor/dirt/examine(mob/user)
	if (get_dist(src, user) <= 1)
		if (soil_nutrition >= 130)
			to_chat(user, "<span class='notice'>土壤看起来非常有活力,植物会很容易生长.</span>")
		else if (soil_nutrition >= 80)
			to_chat(user, "<span class='notice'>土壤看起来有活力,植物会长得很好.</span>")
		else if (soil_nutrition >= 25)
			to_chat(user, "<span class='notice'>土壤看起来半死不活,植物不会像应有的那样良好发育.</span>")
		else if (soil_nutrition > 0)
			to_chat(user, "<span class='notice'>土壤看起来相当死寂,植物很难生长.</span>")
		else
			to_chat(user, "<span class='notice'>土壤看起来已经死了,植物几乎无法生长.</span>")
	if (ishuman(user))
		var/mob/living/human/H = user
		if (H.getStatCoeff("farming")>= 2.2)
			to_chat(user, "[src]的营养水平为<b>[soil_nutrition]/[max_soil_nutrition]</b>.")
	return ..()

/turf/floor/space
	name = "space"
	icon = 'icons/turf/floors.dmi'
	icon_state = "space"
	uses_winter_overlay = FALSE
	may_become_muddy = FALSE
	is_diggable = FALSE
	initial_flooring = /decl/flooring/dirt/space

/turf/floor/dirt/dark_dirt
	name = "dark dirt"
	desc = "比普通泥土更暗,阴森森的."
	icon = 'icons/turf/floors.dmi'
	icon_state = "dark_dirt"
	is_diggable = FALSE
	uses_winter_overlay = FALSE
	may_become_muddy = FALSE
//	flags = TURF_HAS_EDGES

/turf/floor/dirt/flooded
	name = "flood plains dirt"
	icon = 'icons/turf/floors.dmi'
	icon_state = "flood_dirt"
	desc = "一块肥沃的泥土,在雨季会被淹没."
	uses_winter_overlay = FALSE
	may_become_muddy = TRUE
	available_dirt = 3
	is_diggable = TRUE
	initial_flooring = /decl/flooring/flooded

/turf/floor/dirt/winter
	name = "snowy dirt"
	icon = 'icons/turf/snow.dmi'
	icon_state = "dirt"
	uses_winter_overlay = TRUE
	may_become_muddy = TRUE
	available_snow = 2
	available_dirt = 0
	is_diggable = TRUE
	initial_flooring = /decl/flooring/snow_dirt

/turf/floor/dirt/dry_lava
	name = "dried lava"
	icon_state = "lava_dry"
	uses_winter_overlay = FALSE
	may_become_muddy = TRUE
	available_dirt = 0
	is_diggable = TRUE
	initial_flooring = /decl/flooring/dirt/dry_lava

/turf/floor/dirt/burned
	name = "burnt ground"
	icon_state = "burned_dirt"
	uses_winter_overlay = TRUE
	may_become_muddy = TRUE
	available_dirt = 1
	is_diggable = TRUE
	initial_flooring = /decl/flooring/dirt/burned

/turf/floor/dirt/underground
	name = "underground rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rocky"
	desc = "这个空间被松软的泥土和岩石堵住了.可以挖掘."
	uses_winter_overlay = FALSE
	may_become_muddy = TRUE
	available_dirt = 0
	is_diggable = FALSE
	is_mineable = TRUE
	opacity = TRUE
	density = TRUE
	initial_flooring = /decl/flooring/dirt/underground
	New()
		..()

/turf/floor/dirt/underground/attackby(obj/item/W as obj, mob/user as mob)
	var/mob/living/human/H = user
	if(istype(W, /obj/item/weapon/chisel))
		var design = "smooth"
		if (!istype(H.l_hand, /obj/item/weapon/hammer) && !istype(H.r_hand, /obj/item/weapon/hammer))
			to_chat(user, "<span class = 'warning'>你需要有一只手拿着锤子才能使用凿子.</span>")
			return
		else
			var/display = list("Smooth", "Cave", "Underground Cave", "Brick", "Cobbled", "Tiled", "Cancel")
			var/input =  WWinput(user, "What design do you want to carve?", "Carving", "Cancel", display)
			if (input == "Cancel")
				return
			else if  (input == "Smooth")
				to_chat(user, "<span class='notice'>你现在将雕刻光滑图案!</span>")
				design = "smooth"
			else if  (input == "Cave")
				to_chat(user, "<span class='notice'>你现在将雕刻洞穴图案!</span>")
				design = "cave"
			else if  (input == "Underground Cave")
				to_chat(user, "<span class='notice'>你现在将雕刻洞穴图案!</span>")
				design = "undercave"
			else if  (input == "Brick")
				to_chat(user, "<span class='notice'>你现在将雕刻砖块图案!</span>")
				design = "brick"
			else if  (input == "Cobbled")
				to_chat(user, "<span class='notice'>你现在将雕刻鹅卵石图案!</span>")
				design = "cobbled"
			else if  (input == "Tiled")
				to_chat(user, "<span class='notice'>你现在将雕刻瓷砖图案!</span>")
				design = "tiled"
			visible_message("<span class='danger'>[user]开始雕刻一个图案!</span>", "<span class='danger'>你开始雕刻一个图案.</span>")
			playsound(src,'sound/effects/pickaxe.ogg',60,1)
			if (do_after(user, 60, src))
			//Designs possible are "smooth", "cave", "brick", "cobbled", "tiled"
				if(design == "smooth")
					src.icon_state = "b_stone_wall"
					src.name = "stone wall"
					src.desc = "A cave wall carved smooth."
				else if(design == "cave")
					src.icon_state = "rocky"
					src.name = "underground cave wall"
					src.desc = "A cave wall."
				else if(design == "undercave")
					src.icon_state = "rock"
					src.name = "cave wall"
					src.desc = "A cave wall."
				else if(design == "brick")
					src.icon_state = "b_brick_stone_wall"
					src.name = "stone brick wall"
					src.desc = "A cave wall carved to look like its made of stone bricks."
				else if(design == "cobbled")
					src.icon_state = "b_cobbled_stone_wall"
					src.name = "cobbled stone wall"
					src.desc = "A cave wall carved to look like piled up stones."
				else if(design == "tiled")
					src.icon_state = "b_tiled_stone_wall"
					src.name = "tiled stone wall"
					src.desc = "A cave wall carved to have a tiled stone pattern."
				return
	..()

/turf/floor/dirt/underground/sandy
	name = "sandy underground rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "sandyrocky"
	desc = "这个空间被松软的泥土和沙质岩石堵住了.可以挖掘."
	New()
		..()
/turf/floor/dirt/underground/sandy/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/chisel))
		to_chat(user, "沙质岩石太脆了,无法雕刻!")
		return//Temp until I feel like improving chisel system.
	..()
/turf/floor/dirt/underground/icy
	name = "icy underground rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "icyrocky"
	desc = "这个空间被冻土和岩石堵住了.可以挖掘."
	New()
		..()

/turf/floor/dirt/underground/icy/rock
	name = "icy rock"

/turf/floor/dirt/underground/icy/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/chisel))
		to_chat(user, "冻岩太硬了,无法雕刻!")
		return //Temp until I feel like improving chisel system.
	..()

/turf/floor/dirt/underground/empty
	name = "rock debris"
	icon_state = "rock_debris1"

/turf/floor/dirt/underground/empty/New()
	..()
	icon_state = "rock_debris[rand(1,2)]"

/turf/floor/dirt/underground/empty/proc/mining_clear_debris()
	var/area/A = get_area(get_turf(src))
	if(map.ID == MAP_NOMADS_DESERT)
		ChangeTurf(/turf/floor/dirt/dust)
	else if (A.climate == "jungle" || A.climate == "savanna")
		ChangeTurf(/turf/floor/dirt/jungledirt)
	else
		ChangeTurf(/turf/floor/dirt)

/turf/floor/dirt/fertile
	soil_nutrition = 150

/turf/floor/dirt/medium_fertile
	soil_nutrition = 50

/turf/floor/dirt/infertile
	soil_nutrition = 0

/turf/floor/dirt/ploughed
	name = "ploughed field"
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt_ploughed"
	is_plowed = TRUE
	initial_flooring = /decl/flooring/dirt/ploughed

/turf/floor/dirt/ploughed/fertile
	soil_nutrition = 150

/turf/floor/dirt/ploughed/medium_fertile
	soil_nutrition = 50

/turf/floor/dirt/ploughed/infertile
	soil_nutrition = 0

/turf/floor/dirt/ploughed/flooded
	name = "ploughed field"
	icon = 'icons/turf/floors.dmi'
	icon_state = "flood_dirt_ploughed"
	is_plowed = TRUE
	initial_flooring = /decl/flooring/dirt/ploughed

/turf/floor/dirt/dust
	name = "dry dirt"
	icon = 'icons/turf/floors.dmi'
	icon_state = "dust"
	interior = FALSE
	stepsound = "dirt"
	available_dirt = 2
	may_become_muddy = FALSE
	is_diggable = TRUE
	initial_flooring = /decl/flooring/dust

/turf/floor/dirt/jungledirt
	name = "dirt"
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt"
	interior = FALSE
	stepsound = "dirt"
	available_dirt = 2
	may_become_muddy = TRUE
	is_diggable = TRUE
	initial_flooring = /decl/flooring/dirt


/turf/floor/mining
	name = "minerals"
	icon = 'icons/turf/floors.dmi'
	icon_state = "minerals"
	interior = FALSE
	stepsound = "dirt"
	available_dirt = 2
	may_become_muddy = TRUE
	is_diggable = FALSE
	initial_flooring = null