/obj/covers/dirt_wall/blocks
	name = "dirt blocks wall"
	desc = "一堵泥土块墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "drysod_wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 550
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 4
	buildstack = /obj/item/weapon/barrier

/obj/covers/dirt_wall/blocks/incomplete
	name = "dirt blocks wall"
	desc = "一堵泥土块墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "drysod_wall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 30
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE

/obj/covers/dirt_wall/blocks/incomplete/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		return prob(30 + (P.penetrating*2))
	else
		if (density)
			return FALSE
		else
			return TRUE

/obj/covers/dirt_wall/blocks/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (W.type == /obj/item/weapon/barrier)
		if (stage == 3)
			to_chat(user, "你开始往墙上添加泥土...")
			if (do_after(user, 20, src) && W)
				to_chat(user, "你完成了往墙上添加泥土,将其建成.")
				qdel(W)
				new /obj/covers/dirt_wall/blocks(loc)
				qdel(src)
				return
		else if (stage <= 2)
			to_chat(user, "你开始往墙上抹泥土...")
			if (do_after(user, 20, src))
				if (stage <= 2)
					to_chat(user, "你完成了往墙上抹泥土.")
					stage = (stage+1)
					icon_state = "drysod_wall_inc[stage]"
					base_icon_state = icon_state
					health = (20*stage)
					qdel(W)
					return
	..()

/obj/covers/clay_wall
	name = "clay block wall"
	desc = "一面黏土块墙."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claybrickwall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 750
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 6
	material = "Stone"
	hardness = 75
	buildstack = /obj/item/weapon/clay/claybricks/fired

/obj/covers/clay_wall/claydoorway //if you actually wanted to summon one.
	name = "clay block doorway"
	desc = "一个黏土块门道."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "clay_doorway"
	passable = TRUE
	not_movable = TRUE
	density = FALSE
	opacity = FALSE

/obj/covers/clay_wall/incomplete
	name = "clay block wall"
	desc = "一面黏土块墙."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claybrickwall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 40
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/clay_wall/incomplete/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		return prob(20 + (P.penetrating*2))
	else
		if (density)
			return FALSE
		else
			return TRUE

/obj/covers/clay_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/claybricks/fired))
		if (stage >= 2)
			to_chat(user, "你开始往墙上添加黏土块...")
			if (do_after(user, 20, src) && W)
				to_chat(user, "你完成了往墙上添加黏土块, 将其建成.")
				qdel(W)
				var/obj/covers/clay_wall/S = new /obj/covers/clay_wall(loc)
				qdel(src)
				var/choice = WWinput(user, "What type of construction?","Clay Constructions","Normal",list("Wall", "Alternative Brick Style", "Doorway"))
				if (choice == "Wall")
					return
				else if (choice == "Alternative Brick Style")
					S.icon_state = "clay_block_alt"
					base_icon_state = icon_state
					S.name = "clay block wall"
				else if (choice == "Doorway")
					new /obj/covers/clay_wall/claydoorway(S.loc)
					qdel(S)
				return
		else if (stage <= 1)
			to_chat(user, "你开始往墙上添加黏土块...")
			if (do_after(user, 20, src))
				if (stage <= 1)
					to_chat(user, "你完成了往墙上添加黏土块.")
					stage += 1
					icon_state = "claybrickwall_inc[stage]"
					base_icon_state = icon_state
					health = (30*stage)
					qdel(W)
					return
	..()

/obj/covers/clay_wall/sumerian
	name = "sumerian clay wall"
	desc = "一面苏美尔风格的黏土墙."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "sumerian-wall"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 750
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 6
	material = "Stone"

/obj/covers/clay_wall/sumerian/doorway //if you actually wanted to summon one.
	name = "sumerian clay doorway"
	desc = "一个苏美尔风格的黏土门道."
	icon_state = "sumerian-door"
	density = FALSE
	opacity = FALSE

/obj/covers/clay_wall/sumerian/incomplete
	name = "sumerian clay wall"
	desc = "一面苏美尔风格的黏土墙."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "sumerian-wall_inc1"
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 40
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/clay_wall/sumerian/incomplete/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		return prob(20 + (P.penetrating*2))
	else
		if (density)
			return FALSE
		else
			return TRUE

/obj/covers/clay_wall/sumerian/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/claybricks/fired))
		if (stage >= 2)
			to_chat(user, "你开始往墙上添加黏土...")
			if (do_after(user, 20, src) && W)
				to_chat(user, "你完成了往墙上添加黏土, 将其建成.")
				qdel(W)
				var/obj/covers/clay_wall/sumerian/S = new /obj/covers/clay_wall/sumerian(loc)
				qdel(src)
				var/choice = WWinput(user, "What type of wall?","Sumerian Clay Walls","Normal",list("Normal","Doorway","Window","Corner"))
				if (choice == "Normal")
					return
				else if (choice == "Doorway")
					S.icon_state = "sumerian-door"
					base_icon_state = icon_state
					S.name = "sumerian clay door"
					S.density = FALSE
					S.opacity = FALSE
				else if (choice == "Window")
					new /obj/structure/window_frame/sumerian(S.loc)
					qdel(S)
				else if (choice == "Corner")
					S.icon_state = "sumerian-corner1"
					base_icon_state = icon_state
					var/choice1 = WWinput(user, "Which corner?","Clay Walls","North-West",list("North-West","North-East","South-West","South-East"))
					if (choice1 == "North-West")
						S.dir = SOUTH
					else if (choice1 == "North-East")
						S.dir = EAST
					else if (choice1 == "South-West")
						S.dir = NORTH
					else if (choice1 == "South-East")
						S.dir = WEST
				return
		else if (stage <= 1)
			to_chat(user, "你开始往墙上添加黏土块...")
			if (do_after(user, 20, src))
				if (stage <= 1)
					to_chat(user, "你完成了往墙上添加黏土.")
					stage += 1
					icon_state = "sumerian-wall_inc[stage]"
					base_icon_state = icon_state
					health = (30*stage)
					qdel(W)
					return
	..()

/obj/covers/brick_wall
	name = "brick wall"
	desc = "一面红砖墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "new_brick0"
	base_icon_state = "new_brick"
	adjusts = TRUE
	passable = FALSE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 2250
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 7
	material = "Stone"
	hardness = 92
	buildstack = /obj/item/weapon/clay/advclaybricks/fired

/obj/covers/brick_wall/attackby(var/obj/item/weapon/material/kitchen/utensil/I, var/mob/living/human/U)
	if (istype(I,/obj/item/weapon/material/kitchen/utensil/spoon) || istype(I,/obj/item/weapon/material/kitchen/utensil/fork) || istype(I,/obj/item/weapon/material/kitchen/utensil/chopsticks))
		if (I.shiv < 10)
			I.shiv++
			visible_message("<span class='warning'>[U]在\the [src]上磨利了\the [I]!</span>")
			if (I.shiv >= 10)
				U.drop_from_inventory(I)
				var/obj/item/weapon/material/kitchen/utensil/knife/shank/SHK = new /obj/item/weapon/material/kitchen/utensil/knife/shank(U,I.material.name)
				U.put_in_hands(SHK)
				to_chat(U, "\The [I]变成了一把简易刀具.")
				qdel(I)
	..()

/obj/covers/tiled_wall
	name = "tiled wall"
	desc = "一面瓷砖墙"
	icon = 'icons/turf/walls.dmi'
	icon_state = "tiles0"
	base_icon_state = "tiles"
	passable = FALSE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 3250 //until there are stronger alternatives.
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 13
	material = "Stone"
	hardness = 95
	adjusts = TRUE
	buildstack = /obj/item/weapon/clay/advclaybricks/fired/cement //For now, until proper crafting materials are done

/obj/covers/tiled_wall/attackby(var/obj/item/weapon/material/kitchen/utensil/I, var/mob/living/human/U)
	if (istype(I,/obj/item/weapon/material/kitchen/utensil/spoon) || istype(I,/obj/item/weapon/material/kitchen/utensil/fork) || istype(I,/obj/item/weapon/material/kitchen/utensil/chopsticks))
		if (I.shiv < 10)
			I.shiv++
			visible_message("<span class='warning'>[U]在\the [src]上磨利了\the [I]!</span>")
			if (I.shiv >= 10)
				U.drop_from_inventory(I)
				var/obj/item/weapon/material/kitchen/utensil/knife/shank/SHK = new /obj/item/weapon/material/kitchen/utensil/knife/shank(U,I.material.name)
				U.put_in_hands(SHK)
				to_chat(U, "\The [I]变成了一把简易刀具.")
				qdel(I)
	..()

/obj/covers/cement_wall
	name = "concrete wall"
	desc = "一面混凝土墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "cement_wall0"
	base_icon_state = "cement_wall"
	passable = FALSE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 3250 //until there are stronger alternatives.
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 13
	material = "Stone"
	hardness = 95
	adjusts = TRUE
	buildstack = /obj/item/weapon/clay/advclaybricks/fired/cement

/obj/covers/cement_wall/attackby(var/obj/item/weapon/material/kitchen/utensil/I, var/mob/living/human/U)
	if (istype(I,/obj/item/weapon/material/kitchen/utensil/spoon) || istype(I,/obj/item/weapon/material/kitchen/utensil/fork) || istype(I,/obj/item/weapon/material/kitchen/utensil/chopsticks))
		if (I.shiv < 10)
			I.shiv++
			visible_message("<span class='warning'>[U]在\the [src]上磨利了\the [I]!</span>")
			if (I.shiv >= 10)
				U.drop_from_inventory(I)
				var/obj/item/weapon/material/kitchen/utensil/knife/shank/SHK = new /obj/item/weapon/material/kitchen/utensil/knife/shank(U,I.material.name)
				U.put_in_hands(SHK)
				to_chat(U, "\The [I]变成了一把简易刀具.")
				qdel(I)
	..()

/obj/covers/cement_wall/horizontal
	name = "concrete blocks wall"
	icon_state = "horizontal_concrete_blocks0"
	base_icon_state = "horizontal_concrete_blocks"

/obj/covers/cement_wall/vertical
	name = "concrete blocks wall"
	icon_state = "vertical_concrete_blocks0"
	base_icon_state = "vertical_concrete_blocks"

/obj/covers/cement_wall/incomplete
	name = "incomplete concrete wall"
	desc = "一面水泥砖墙."
	icon = 'icons/turf/walls.dmi'
	base_icon_state = "cement_wall_inc"
	icon_state = "cement_wall_inc0"
	adjusts = FALSE
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 80
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"
	buildstack = /obj/item/weapon/clay/advclaybricks/fired/cement

/obj/covers/cement_wall/incomplete/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		return prob(20 + (P.penetrating*2))
	else
		if (density)
			return FALSE
		else
			return TRUE

/obj/covers/cement_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/advclaybricks/fired/cement))
		to_chat(user, "你开始往墙上添加水泥...")
		if (do_after(user, 20, src) && W)
			to_chat(user, "你完成了往墙上添加水泥, 将其建成.")
			qdel(W)
			new /obj/covers/cement_wall(loc)
			qdel(src)
			return
	..()

/obj/covers/brick_wall/incomplete
	name = "incomplete brick wall"
	desc = "一面红砖墙."
	icon = 'icons/turf/walls.dmi'
	base_icon_state = "new_brick_inc"
	icon_state = "new_brick_inc0"
	adjusts = FALSE
	passable = TRUE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	incomplete = TRUE
	amount = 0
	layer = 3
	health = 80
	var/stage = 1
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	material = "Stone"

/obj/covers/brick_wall/incomplete/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		return prob(20 + (P.penetrating*2))
	else
		if (density)
			return FALSE
		else
			return TRUE

/obj/covers/brick_wall/incomplete/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/clay/advclaybricks/fired))
		to_chat(user, "你开始往墙上添加砖块...")
		if (do_after(user, 20, src) && W)
			to_chat(user, "你完成了往墙上添加砖块, 将其建成.")
			var/choice = WWinput(user, "What type of wall?","Brick Walls","Wall",list("Wall","Window","Full Window"))
			if (choice == "Wall")
				qdel(W)
				new /obj/covers/brick_wall(loc)
				qdel(src)
				return
			else if (choice == "Window")
				qdel(W)
				new /obj/structure/window_frame/brick(loc)
				qdel(src)
				return
			else if (choice == "Full Window")
				qdel(W)
				new /obj/structure/window_frame/brickfull(loc)
				qdel(src)
				return
	..()

/obj/covers/generic_wall
	name = "simple wall"
	desc = "一面普通墙."
	icon = 'icons/turf/walls.dmi'
	icon_state = "generic0"
	base_icon_state = "generic"
	passable = FALSE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 1000
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 13
	material = "Stone"
	hardness = 95
	adjusts = TRUE
	buildstack = /obj/item/weapon/clay/advclaybricks/fired/cement



/obj/covers/metal
	name = "metal wall"
	desc = "一面金属板墙."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "metal0"
	base_icon_state = "metal"
	adjusts = TRUE
	passable = FALSE
	not_movable = TRUE
	density = TRUE
	opacity = TRUE
	amount = 0
	layer = 3
	health = 999999
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 100
	material = "Stone"
	hardness = 100

/obj/covers/shipwindow
	name = "windscreen"
	desc = "船体结构上一个用挡风玻璃覆盖的大缺口."
	icon = 'icons/obj/windows.dmi'
	icon_state = "windowmetal"
	base_icon_state = "windowmetal"
	adjusts = FALSE
	passable = FALSE
	not_movable = TRUE
	density = TRUE
	opacity = FALSE
	amount = 0
	layer = 3
	health = 999999
	wood = FALSE
	wall = TRUE
	flammable = FALSE
	explosion_resistance = 100
	material = "Stone"
	hardness = 100