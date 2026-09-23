/obj/structure/barricade/wood_pole // TODO move this and procs to barricade.dm
	name = "木杆"
	desc = "一根简单的木杆. 你可以把东西挂在上面."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wood_pole_good"
	health = 50
	maxhealth = 50
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/attached = "none"
	var/obj/attached_ob = null
	flammable = TRUE
	protection_chance = 30

/obj/structure/barricade/wood_pole/New()
	..()
	name = "wood pole"
	desc = "A simple wood pole. You can attach stuff to it."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wood_pole_good"

/obj/structure/grille/fence
	name = "栅栏"
	desc = "一道老旧的木栅栏."
	icon = 'icons/obj/fence.dmi'
	icon_state = "fence"
	health = 16
	hitsound = 'sound/effects/wooddoorhit.ogg'
	flammable = TRUE

/obj/structure/grille/fence/attackby(obj/O as obj, mob/user as mob)
	if (istype(O, /obj/item/weapon/leash))
		var/obj/item/weapon/leash/L = O
		if (L.onedefined == TRUE && (src in range(3,L.S1)))
			L.S2 = src
			L.S1.following_mob = src
			L.S1.stop_automated_movement = TRUE
			to_chat(user, SPAN_NOTICE("You tie \the [L.S1] to \the [src] with the leash."))
			qdel(L)
			return
	else
		..()
	if (health >= initial(health))
		icon_state = "[initial(icon_state)]"
	else if (health >= initial(health)*0.6)
		icon_state = "[initial(icon_state)]2"
	else if (health >= initial(health)*0.3)
		icon_state = "[initial(icon_state)]3"

/obj/structure/grille/fence/picket
	name = "尖桩栅栏"
	desc = "一道传统的木栅栏."
	icon_state = "picket"
	health = 30

/obj/structure/grille/fence/steel_picket
	name = "金属栅栏"
	desc = "一道传统的金属栅栏."
	icon_state = "steel_picket"
	health = 60
	flammable = FALSE

/obj/structure/barricade/wood_pole/attackby(obj/O as obj, mob/user as mob)
	if (istype(O, /obj/item/weapon/leash))
		var/obj/item/weapon/leash/L = O
		if (L.onedefined == TRUE && (src in range(3,L.S1)))
			L.S2 = src
			L.S1.following_mob = src
			L.S1.stop_automated_movement = TRUE
			to_chat(user, SPAN_NOTICE("You tie \the [L.S1] to \the [src] with the leash."))
			attached = "animal"
			qdel(L)
			return
	else if (istype(O, /obj/item/flashlight/lantern))
		var/obj/item/flashlight/lantern/LT = O
		to_chat(user, SPAN_NOTICE("You tie \the [O] to \the [src]."))
		LT.anchored = TRUE
		LT.on = TRUE
		LT.update_icon()
		LT.icon_state = "lantern-on_pole"
		LT.on_state = "lantern-on_pole"
		LT.off_state = "lantern_pole"
		attached_ob = O
		user.drop_from_inventory(O)
		O.forceMove(loc)
	else
		..()
/obj/structure/barricade/wood_pole/attack_hand(mob/living/user as mob)
	if (!isliving(user))
		return
	if (attached_ob && istype(attached_ob, /obj/item/flashlight/lantern))
		to_chat(user, SPAN_NOTICE("You remove \the [attached_ob] from \the [src]."))
		var/obj/item/flashlight/lantern/O = attached_ob
		O.anchored = FALSE
		O.forceMove(user.loc)
		user.put_in_hands(O)
		attached_ob = null
		return
/obj/structure/barricade/wood_pole/Destroy()
	if (attached_ob != null)
		if (istype(attached_ob, /obj/item/flashlight/lantern))
			var/obj/item/flashlight/lantern/LT = attached_ob
			LT.anchored = FALSE
			LT.icon_state = "lantern"
			LT.on = FALSE
			LT.on_state = "lantern-on"
			LT.off_state = "lantern"
			LT.update_icon()
			attached_ob = null
	..()

/obj/structure/grille/logfence
	name = "木桩栅栏"
	desc = "一道木制栅栏."
	icon = 'icons/obj/structures.dmi'
	icon_state = "palisade"
	health = 32
	opacity = TRUE
	hitsound = 'sound/effects/wooddoorhit.ogg'
	flammable = TRUE

/obj/structure/grille/ironfence
	name = "铁栅栏"
	desc = "一道锻铁栅栏."
	icon = 'icons/obj/fence.dmi'
	icon_state = "iron_fence"
	health = 70
	hitsound = 'sound/weapons/blade_parry1.ogg'

/obj/structure/grille/metalsheetfence
	name = "金属栅栏"
	desc = "一道金属板栅栏."
	icon = 'icons/obj/fence.dmi'
	icon_state = "metal_fence1"
	health = 80
	opacity = TRUE
	hitsound = 'sound/weapons/blade_parry1.ogg'

/obj/structure/grille/metalsheetfence/attackby(obj/item/W, mob/user)
	if (istype(W, /obj/item/weapon/siegeladder))
		user.visible_message(
			SPAN_WARNING("[user] starts deploying \the [W.name]."),
			SPAN_NOTICE("You start deploying \the [W.name]."))
		if (do_after(user, 8 SECONDS, src))
			user.visible_message(
				SPAN_WARNING("[user] has deployed \the [W.name]!"),
				SPAN_WARNING("You have deployed \the [W.name]!"))
			var/obj/item/weapon/siegeladder/ANCH = W
			user.remove_from_mob(ANCH)
			ANCH.loc = src.loc
			ANCH.anchored = TRUE
			climbable = TRUE
			ANCH.deployed = TRUE
			ANCH.icon_state = ANCH.depicon
			ANCH.dir = src.dir
		else
			user.visible_message(
				SPAN_WARNING("[user] stops deploying \the [W.name]."),
				SPAN_WARNING("You stop deploying \the [W.name]."))
	..()

/obj/structure/grille/metalsheetfence/blue
	icon_state = "metal_fence2"
/obj/structure/grille/metalsheetfence/red
	icon_state = "metal_fence3"
/obj/structure/grille/metalsheetfence/green
	icon_state = "metal_fence4"
/obj/structure/grille/metalsheetfence/yellow
	icon_state = "metal_fence5"

/obj/structure/grille/metalsheetfence/corner
	name = "金属板栅栏"
	desc = "一道编织钢栅栏."
	icon = 'icons/obj/fence.dmi'
	icon_state = "metal_fence_corner1"
	health = 120
	opacity = TRUE
	hitsound = 'sound/weapons/blade_parry1.ogg'
/obj/structure/grille/metalsheetfence/corner/blue
	icon_state = "metal_fence_corner2"
/obj/structure/grille/metalsheetfence/corner/red
	icon_state = "metal_fence_corner3"
/obj/structure/grille/metalsheetfence/corner/green
	icon_state = "metal_fence_corner4"
/obj/structure/grille/metalsheetfence/corner/yellow
	icon_state = "metal_fence_corner5"

//////////////CHAIN-LINK FENCES////////////////

/obj/structure/grille/chainlinkfence
	name = "铁丝网栅栏"
	desc = "一道编织钢栅栏."
	icon = 'icons/obj/fence.dmi'
	icon_state = "chainlinkfence"
	health = 50
	hitsound = 'sound/weapons/blade_parry1.ogg'

	var/cuttable = TRUE
	var/hole_size = 0
	var/invulnerable = FALSE

/obj/structure/grille/chainlinkfence/New()
	.=..()
	update_cut_status()

/obj/structure/grille/chainlinkfence/examine(mob/user)
	.=..()
	switch(hole_size)
		if (1)
			user.show_message("There is a small hole in \the [src].")
		if (2)
			user.show_message("There is a large hole in \the [src].")
		if (3)
			user.show_message("\The [src] has been completely cut through.")

/obj/structure/grille/chainlinkfence/attackby(obj/item/W, mob/living/human/user)
	if(istype(W, /obj/item/weapon/wirecutters))
		if(!cuttable)
			to_chat(user, "<span class='notice'>这段栅栏无法被切开.</span>")
			return
		if(invulnerable)
			to_chat(user, "<span class='notice'>这道栅栏太坚固了,无法切开.</span>")
			return
		var/current_stage = hole_size
		if(current_stage >= 3)
			to_chat(user, "<span class='notice'>这道栅栏已经被完全切开了.</span>")
			return

		user.visible_message("<span class='danger'>\The [user]开始用\the [W]切开\the [src].</span>",\
		"<span class='danger'>You start cutting through \the [src] with \the [W].</span>")

		if(do_after(user, (120/user.getStatCoeff("crafting")), src))
			if(current_stage == hole_size)
				switch(++hole_size)
					if (1)
						visible_message("<span class='notice'>\The [user]继续切入\the [src].</span>")
						climbable = FALSE
					if (2)
						visible_message("<span class='notice'>\The [user]继续切入\the [src].</span>")
						to_chat(user, "<span class='info'>你现在大概能从那洞里钻过去了. 不过如果你把它弄得更大些,爬过去会快得多.</span>")
						climbable = TRUE
					if (3)
						visible_message("<span class='notice'>\The [user]完全切开了\the [src].</span>")
						to_chat(user, "<span class='info'>\the [src]上的洞现在大到可以走过去了.</span>")
						climbable = FALSE

				update_cut_status()

	return TRUE

///////CHAIN-LINK FENCE PROC AND DEFINES/////////////

/obj/structure/grille/chainlinkfence/proc/update_cut_status()
	if(!cuttable)
		return
	density = TRUE
	switch(hole_size)
		if(0)
			icon_state = initial(icon_state)
		if(1)
			icon_state = "chainlinkfence_cut1"
		if(2)
			icon_state = "chainlinkfence_cut2"
		if(3)
			icon_state = "chainlinkfence_cut3"
			density = FALSE

/obj/structure/grille/chainlinkfence/cut
	icon_state = "chainlinkfence_cut1"
	hole_size = 1
/obj/structure/grille/chainlinkfence/cut/larger
	icon_state = "chainlinkfence_cut2"
	hole_size = 2
/obj/structure/grille/chainlinkfence/cut/larger/complete
	icon_state = "chainlinkfence_cut3"
	hole_size = 3

/obj/structure/grille/chainlinkfence/corner
	icon_state = "chainlinkfence_corner"
	hitsound = 'sound/weapons/blade_parry1.ogg'
	cuttable = FALSE
	density = FALSE

///////CHAIN-LINK FENCE DOOR /////////////

/obj/structure/grille/chainlinkfence/door
	name = "铁丝网栅栏门"
	desc = "一道编织钢栅栏门."
	icon_state = "chainlinkfence_door"
	cuttable = FALSE
	var/open = FALSE

/obj/structure/grille/chainlinkfence/door/New()
	. = ..()
	update_door_status()

/obj/structure/grille/chainlinkfence/door/opened
	icon_state = "chainlinkfence_door_open"
	open = TRUE
	density = TRUE

/obj/structure/grille/chainlinkfence/door/attack_hand(mob/user)
	if(can_open(user))
		toggle(user)
	return TRUE

/obj/structure/grille/chainlinkfence/door/proc/toggle(mob/user)
	switch(open)
		if(FALSE)
			user.visible_message("<span class='warning'>\The [user]打开了\the [src].</span>",
								"<span class='notice'>你打开了\the [src].</span>",
								"你听到有什么东西被打开了.")

			open = TRUE
		if(TRUE)
			user.visible_message("<span class='warning'>\The [user]关上了\the [src].</span>",
								"<span class='notice'>你关上了\the [src].</span>",
								"你听到有什么东西被关上了.")

			open = FALSE

	update_door_status()
	playsound(src, 'sound/machines/click.ogg', 100, 1)

/obj/structure/grille/chainlinkfence/door/proc/update_door_status()
	switch(open)
		if(FALSE)
			density = TRUE
			icon_state = "chainlinkfence_door"
		if(TRUE)
			density = FALSE
			icon_state = "chainlinkfence_door_open"

/obj/structure/grille/chainlinkfence/door/proc/can_open(mob/user)
	return TRUE

////////////////////wallclock////////////////////////////

/obj/structure/wallclock
	name = "落地钟"
	desc = "一座经典的落地钟."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wall_clock"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	anchored = TRUE
/obj/structure/wallclock/examine(mob/user)
	..()
	to_chat(user, "<big>现在是[clock_time()].</big>")

//////////Props/////////////////////////////

/obj/structure/props/server
	name = "服务器中枢"
	desc = "一台看起来又大又吓人的服务器,用于连接其他服务器."
	icon = 'icons/obj/machines/servers.dmi'
	icon_state = "hub"

/obj/structure/props/server/controller
	name = "服务器控制器"
	desc = "一个服务器的控制器... 之类的... 你完全不知道这玩意儿是干什么用的."
	icon_state = "controller"

/obj/structure/props/server/processor
	name = "服务器处理器"
	desc = "一个把东西处理成东西的处理器, IT部门起名字真是够奇怪的..."
	icon_state = "processor"

/obj/structure/props/server/comm
	name = "通信服务器"
	desc = "一台用于与其他服务器和人员通信的通信服务器, 我真的需要解释这个吗?"
	icon_state = "comm_server"

/obj/structure/transformer
	name = "电力变压器"
	desc = "一台大型重型电力变压器, 把高压电转换成低压电供用户使用, 不然呢."
	icon = 'icons/obj/machines/servers.dmi'
	icon_state = "controller"

//////////More Props/////////////////////////////

/obj/structure/props/junk
	name = "废品"
	desc = "一堆废品."
	icon = 'icons/obj/junk.dmi'
	icon_state = "Junk_1"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = TRUE
	anchored = TRUE
/obj/structure/props/junk/New()
	..()
	icon_state = "Junk_[rand(1,14)]"

/obj/structure/props/barrel
	name = "桶"
	desc = "一个桶, 天知道里面装了什么."
	icon = 'icons/obj/junk.dmi'
	icon_state = "barrel1"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE
/obj/structure/props/barrel/New()
	..()
	icon_state = "barrel[rand(1,5)]"

/obj/structure/props/fueltank
	name = "燃料罐"
	desc = "一个巨大的工业燃料罐."
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "fueltank"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	bound_width = 96
	bound_height = 64

/obj/structure/props/stove
	name = "煤气灶"
	desc = "一个煤气灶."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "stove"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = TRUE
	opacity = FALSE
	anchored = TRUE

/obj/structure/props/stove/old
	icon_state = "gasstove"

/obj/structure/props/radiator
	name = "散热器"
	desc = "一个热交换器."
	icon = 'icons/obj/junk.dmi'
	icon_state = "radiator"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE

/////////Pipes/////////////////////////////

/obj/structure/props/piping/pipe
	name = "管道"
	desc = "一根大管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "s_pipe"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/pipe/under
	layer = 1

/obj/structure/props/piping/broken_pipe
	name = "破损的管道"
	desc = "一根破损的大管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "pipe-b"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/broken_pipe/under
	layer = 1

/obj/structure/props/piping/pipe_up
	name = "管道"
	desc = "一根大管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "pipe-t"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/pipe_up/under
	layer = 1

/obj/structure/props/piping/small/pipe
	name = "小管道"
	desc = "一根管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "s_pipe2_thin"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/small/pipe/under
	layer = 1

/obj/structure/props/piping/small/pipex
	name = "小管道"
	desc = "一根管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "s_pipe_connection4_thin"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/small/pipex/under
	layer = 1

/obj/structure/props/piping/small/pipel
	name = "小管道"
	desc = "一根L形小管道."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "s_pipe_turn"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/small/pipel/under
	layer = 1

/obj/structure/props/piping/small/pipet
	name = "小管道"
	desc = "一个小型T形管."
	icon = 'icons/obj/machines/pipes.dmi'
	icon_state = "s_pipe_connection3_thin"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	layer = MOB_LAYER + 8

/obj/structure/props/piping/small/pipet/under
	layer = 1

/////////////////////////////////////////////////////////

/obj/structure/props/bathtub
	name = "浴缸"
	desc = "一个浴缸."
	icon = 'icons/obj/junk.dmi'
	icon_state = "bathtub"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = TRUE
	opacity = FALSE
	anchored = TRUE

/obj/structure/props/djtable
	name = "DJ台"
	desc = "一个DJ台."
	icon = 'icons/obj/junk.dmi'
	icon_state = "djtable"
	flammable = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = FALSE
	anchored = TRUE

/obj/structure/props/coatrack
	name = "衣帽架"
	desc = "一个衣帽架."
	icon = 'icons/obj/junk.dmi'
	icon_state = "coatrack"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE

/obj/structure/props/sofa
	name = "沙发"
	desc = "一个沙发."
	icon = 'icons/obj/junk.dmi'
	icon_state = "sofa_forward_left"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = TRUE
	opacity = FALSE
	anchored = TRUE

/obj/structure/props/sofa/p2
	icon_state = "sofa_forward_right"

/obj/structure/props/sofa/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		return prob(75)
	else
		return FALSE

/obj/structure/props/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		return prob(50)
	else
		return FALSE


/obj/structure/potted_plant
	name = "盆栽"
	desc = "一盆盆栽."
	icon = 'icons/obj/structures.dmi'
	icon_state = "potted_plant"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE

/obj/structure/props/hookah
	name = "水烟壶"
	desc = "一种用于吸食烟草或其他物质的玻璃管."
	icon = 'icons/obj/items.dmi'
	icon_state = "hookah1"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE

/obj/structure/props/hookah/New()
	..()
	var/pickhookah = pick("hookah1", "hookah2", "hookah3")
	icon_state = pickhookah

/obj/structure/props/bong
	name = "大麻烟枪"
	desc = "一种用于吸食大麻或其他物质的玻璃管."
	icon = 'icons/obj/items.dmi'
	icon_state = "bong"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	density = FALSE
	opacity = FALSE


/obj/structure/props/bike
	name = "摩托车"
	desc = "一辆摩托车."
	icon = 'icons/obj/vehicles/vehicleparts64x64.dmi'
	icon_state = "bike"
	flammable = FALSE
	not_movable = TRUE
	anchored = TRUE
	not_disassemblable = TRUE
	density = TRUE
	bound_width = 64

/obj/structure/props/car_wreck
	name = "汽车残骸"
	desc = "看起来已经在这里有一段时间了."
	icon = 'icons/obj/vehicles/wip_vehicles.dmi'
	icon_state = "car_wreck"
	flammable = FALSE
	not_movable = TRUE
	anchored = TRUE
	not_disassemblable = TRUE
	density = TRUE
	bound_width = 96
	bound_height = 64
/obj/structure/props/car_wreck/alt
	icon_state = "car_wreck2"
/obj/structure/props/car_wreck/vertical
	icon_state = "car_wreck_vert"
	bound_width = 32
	bound_height = 96
/obj/structure/props/car_wreck/van
	icon_state = "van_wreck"
/obj/structure/props/car_wreck/van/alt
	icon_state = "van_wreck2"
/obj/structure/props/car_wreck/truck
	icon_state = "truck_wreck"
	bound_width = 128
	bound_height = 64

/obj/structure/props/watts_tower
	name = "雕塑塔"
	desc = "一座建筑雕塑塔."
	icon = 'icons/obj/decals_widest.dmi'
	icon_state = "watts_tower"
	flammable = FALSE
	anchored = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	bound_width = 64
	bound_height = 64
	layer = MOB_LAYER+1

/obj/structure/props/engineprops
	name = "通用"
	desc = "一个通用引擎道具."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline_static"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	not_movable = TRUE
/obj/structure/props/engineprops/gas
	name = "汽油发动机"
	desc = "一台运转中的汽油发动机."
	icon_state = "gasoline_on"
/obj/structure/props/engineprops/frunace
	name = "熔炉"
	desc = "一座运转中的熔炉."
	icon_state = "furnace_open_on"
/obj/structure/props/engineprops/turbine
	name = "涡轮发动机"
	desc = "一台运转中的涡轮发动机."
	icon_state = "turbine_on"
/obj/structure/props/engineprops/diesel
	name = "柴油发动机"
	desc = "一台运转中的柴油发动机."
	icon_state = "biodiesel_on"
/obj/structure/props/engineprops/hotbulb
	name = "热球发动机"
	desc = "一台运转中的热球发动机."
	icon_state = "hotbulb_on"
/obj/structure/props/engineprops/dieselgeni
	name = "柴油发电机"
	desc = "一台运转中的柴油发电机."
	icon_state = "diesel_on"
/obj/structure/props/engineprops/hesselman
	name = "黑塞尔曼发动机"
	desc = "一台运转中的黑塞尔曼发动机."
	icon_state = "hesselman_on"
/obj/structure/props/engineprops/steam
	name = "蒸汽机"
	desc = "一台运转中的蒸汽机."
	icon_state = "steam_on"
/obj/structure/props/engineprops/aeolipile
	name = "汽转球引擎"
	desc = "一个运转中的汽转球."
	icon_state = "aeolipile_on"
/obj/structure/props/engineprops/reactor
	name = "反应堆外壳"
	desc = "一个用于核裂变/聚变的反应堆外壳."
	icon_state = "reactor_3"
/obj/structure/props/engineprops/big
	name = "大型发动机"
	desc = "一台运转中的发动机. 这个似乎相当大."
	icon = 'icons/obj/engines64.dmi'
	icon_state = "static_engine_on"
	bound_width = 64
	bound_height = 64
	bound_x = 32

/obj/structure/props/engineprops/waterpump
	name = "大型泵"
	desc = "一个相当大的泵."
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "waterpump"
	bound_width = 96
	bound_height = 96
	bound_x = 32
	anchored = TRUE
	not_movable = TRUE
/obj/structure/props/random/container
	name = "一个集装箱"
	desc = "6面金属, 其中两面可以打开. 一个很难改进的概念."
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "container1"
	bound_width = 96
	bound_height = 64
	anchored = TRUE
	not_movable = TRUE
	density = TRUE
/obj/structure/props/random/podlock
	name = "吊舱锁"
	desc = "坚固的吊舱锁, 应该能挡住除破门炸药以外的任何东西."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "blast"
	anchored = TRUE
	not_movable = TRUE
	density = TRUE
/obj/structure/props/random/container/two
	icon_state = "container2"
/obj/structure/props/random/container/three
	icon_state = "container3"
/obj/structure/props/random/container/four
	icon_state = "container4"
/obj/structure/props/random/container/five
	icon_state = "container5"

/obj/structure/props/machineprops/refinery
	name = "冒烟圆柱"
	desc = "这个烟囱肯定在产生蒸汽或者也许是烟雾. 你不确定它在搞什么."
	icon = 'icons/obj/obj32x64.dmi'
	icon_state = "refinery1"
	bound_width = 32
	bound_height = 64
	bound_x = 32

/* Computer props */

/obj/structure/props/computerprops
	name = "访问终端"
	desc = "屏幕亮着, 按钮也都能用, 但你不确定该按哪些."
	light_range = 2
	icon = 'icons/obj/computers.dmi'
	icon_state = "1980_computer_on"
	anchored = TRUE
/obj/structure/props/computerprops/info_panel
	icon_state = "info_panel"
/obj/structure/props/computerprops/research
	icon_state = "research_on"
/obj/structure/props/computerprops/lab
	icon_state = "lab_on"
/obj/structure/props/computerprops/lunar
	icon_state = "lunar"
/obj/structure/props/computerprops/lunar2
	icon_state = "lunar_on"
/obj/structure/props/computerprops/enclave
	icon_state = "enclave_on"
/obj/structure/props/computerprops/machine
	icon = 'icons/obj/device.dmi'
	icon_state = "machine_on"
/obj/structure/props/computerprops/tracking
	icon = 'icons/obj/device.dmi'
	icon_state = "tracking"
/obj/structure/props/computerprops/modern
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "airfilter2"
/obj/structure/props/computerprops/modern/obj34
	icon_state = "obj34"
/obj/structure/props/computerprops/modern/a9
	icon_state = "a9"
/obj/structure/props/computerprops/modern/a10
	icon_state = "a10"
/obj/structure/props/computerprops/modern/a11
	icon_state = "a11"
/obj/structure/props/computerprops/modern/smes2
	icon_state = "smes2"
/obj/structure/props/computerprops/modern/synth2
	icon_state = "synth2"

/* Fallout */

/obj/structure/props/computerprops/enclave
	icon_state = "enclave_on"

/obj/structure/props/computerprops/terminal
	icon_state = "terminal_on"

/* Broken Helicopter Parts */

/obj/structure/broken_hind
	name = "Mi-24残骸"
	desc = "一架苏联直升机的残骸."
	icon = 'icons/obj/decals_huge.dmi'
	icon_state = "brokenhind"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = FALSE
	anchored = TRUE
	density = TRUE
	layer = MOB_LAYER + 0.01
	bound_width = 128
	bound_height = 128
	bound_x = 32
	crushable = FALSE

/obj/structure/broken_hind_tail
	name = "直升机尾部"
	desc = "一架直升机的尾部."
	icon = 'icons/obj/decals_huge.dmi'
	icon_state = "brokenhind_tail"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = FALSE
	anchored = TRUE
	density = TRUE
	layer = MOB_LAYER + 0.01
	bound_width = 128
	bound_height = 128
	bound_x = 32
	crushable = FALSE

/obj/structure/props/marketstall
	name = "市场摊位"
	desc = "一个市场摊位."
	icon = 'icons/obj/structures.dmi'
	icon_state = "propstall1"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	New()
		..()
		icon_state ="propstall[rand(1,4)]"

/obj/structure/props/keyboard
	name = "电子琴"
	desc = "一台电子琴."
	icon = 'icons/obj/structures.dmi'
	icon_state = "keyboard"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE

/obj/structure/props/dj
	name = "DJ台"
	desc = "一套用来制作超赞节拍的DJ设备."
	icon = 'icons/obj/junk.dmi'
	icon_state = "djtable"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE

/obj/structure/props/micstand
	name = "麦克风支架"
	desc = "一个麦克风支架."
	icon = 'icons/obj/structures.dmi'
	icon_state = "microphone_stand"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE

/obj/structure/props/power_transformer
	name = "电力变压器"
	desc = "一种将电压从一个等级或相位转换到另一个等级的静态设备."
	icon = 'icons/obj/powertransformer.dmi'
	icon_state = "powertransformer"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	crushable = FALSE

/obj/structure/flag
	icon = 'icons/obj/flags.dmi'
	icon_state = "black"
	layer = MOB_LAYER + 0.01
	bound_width = 32
	bound_height = 32
	density = FALSE
	anchored = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	crushable = FALSE

/obj/structure/flag/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			if (prob(66))
				qdel(src)
				return
		if (3.0)
			return

/obj/structure/flag/pirates
	icon_state = "pirates"
	name = "海盗旗"
	desc = "一面带有骷髅和交叉骨的黑白海盗旗."

/obj/structure/flag/black
	icon_state = "black"
	name = "黑旗"
	desc = "一面黑旗."

/obj/structure/flag/white
	icon_state = "white"
	name = "白旗"
	desc = "一面白旗."

/obj/structure/flag/french
	icon_state = "french"
	name = "法国国旗"
	desc = "法国国旗,白色底配金色鸢尾花."

/obj/structure/flag/french_modern
	icon_state = "french2"
	name = "法国国旗"
	desc = "现代法国三色旗."

/obj/structure/flag/french_monarchist
	icon_state = "french3"
	name = "法国国旗"
	desc = "法国君主主义旗帜."


/obj/structure/flag/spanish
	icon_state = "spanish"
	name = "西班牙国旗"
	desc = "西班牙国旗,白色底配勃艮第红色十字."

/obj/structure/flag/spanish_modern
	icon_state = "spanish2"
	name = "西班牙国旗"
	desc = "现代黄红西班牙国旗."

/obj/structure/flag/italian
	icon_state = "italian"
	name = "意大利国旗"
	desc = "现代意大利国旗."

/obj/structure/flag/british
	icon_state = "british"
	name = "英国国旗"
	desc = "联合杰克旗."

/obj/structure/flag/portuguese
	icon_state = "portuguese"
	name = "葡萄牙国旗"
	desc = "中间带有葡萄牙国徽的白旗."

/obj/structure/flag/dutch
	icon_state = "netherlands"
	name = "荷兰国旗"
	desc = "荷兰三色旗."

/obj/structure/flag/dutch_old
	icon_state = "netherlands_old"
	name = "荷兰国旗"
	desc = "荷兰三色旗."

/obj/structure/flag/japanese
	icon_state = "japanese"
	name = "大日本帝国国旗"
	desc = "大日本帝国国旗."

/obj/structure/flag/russian
	icon_state = "russian"
	name = "俄罗斯国旗"
	desc = "俄罗斯三色旗."

/obj/structure/flag/russian
	icon_state = "russian"
	name = "俄罗斯国旗"
	desc = "俄罗斯三色旗."

/obj/structure/flag/soviet
	icon_state = "soviet"
	name = "苏联国旗"
	desc = "苏联国旗."

/obj/structure/flag/us
	icon_state = "us"
	name = "美国国旗"
	desc = "美国国旗."

/obj/structure/flag/german
	icon_state = "german"
	name = "德国国旗"
	desc = "德国国旗."

/obj/structure/flag/german_modern
	icon_state = "german2"
	name = "德国国旗"
	desc = "德国国旗."

/obj/structure/flag/confed
	icon_state = "confed"
	name = "邦联国旗"
	desc = "邦联国旗"

/obj/structure/flag/reich
	icon_state = "reich"
	name = "第三帝国国旗"
	desc = "第三帝国战旗."

/obj/structure/flag/chinese
	icon_state = "chinese"
	name = "中华民国国旗"
	desc = "中华民国国旗."

/obj/structure/flag/filipino
	icon_state = "filipino"
	name = "菲律宾共和国"
	desc = "菲律宾共和国国旗."

/obj/structure/flag/filipino_war
	icon_state = "filipino_wartime"
	name = "菲律宾共和国"
	desc = "菲律宾共和国国旗.这面是战时翻转版本."

/obj/structure/flag/nva
	icon_state = "nva"
	name = "北越国旗"
	desc = "北越国旗."

/obj/structure/flag/vietcong
	icon_state = "vietcong"
	name = "越共旗帜"
	desc = "越南民族解放阵线旗帜."

/obj/structure/flag/redmenia
	icon_state = "redmenia"
	name = "雷德梅尼亚国旗"
	desc = "雷德梅尼亚国旗."

/obj/structure/flag/blugoslavia
	icon_state = "blugoslavia"
	name = "布鲁戈斯拉维亚国旗"
	desc = "布鲁戈斯拉维亚国旗."

/obj/structure/flag/cafr
	icon_state = "cafr"
	name = "中亚联邦共和国国旗"
	desc = "中亚联邦共和国国旗."

/obj/structure/flag/pole
	icon_state = "flagpole_blank"
	name = "旗杆"
	desc = "无旗帜,可挂上布料或旗帜."

/obj/structure/flag/bearclan
	icon_state = "bearclan"
	name = "熊族旗帜"
	desc = "熊族旗帜."

/obj/structure/flag/ravenclan
	icon_state = "ravenclan"
	name = "渡鸦旗帜"
	desc = "渡鸦族旗帜."

/obj/structure/flag/objective
	icon_state = "white"
	name = "目标旗帜"
	desc = "一面目标旗帜."

/obj/structure/flag/objective/one
	name = "目标旗帜一"
/obj/structure/flag/objective/two
	name = "目标旗帜二"
/obj/structure/flag/objective/three
	name = "目标旗帜三"
/obj/structure/flag/objective/four
	name = "目标旗帜四"
/obj/structure/flag/objective/five
	name = "目标旗帜五"

/obj/structure/flag/campaign
	var/faction_text = null
	var/original_faction = null
/obj/structure/flag/campaign/attack_hand(var/mob/living/human/user)
	if (faction_text != user.faction_text)
		if (original_faction == user.faction_text)
			to_chat(user, SPAN_NOTICE("You begin hoisting your own flag..."))
			if (do_after(user, 10 SECONDS, src))
				faction_text = user.faction_text
				switch(faction_text)
					if (REDFACTION)
						icon_state = "redmenia"
						name = "Redmenia Flag"
						desc = "The flag of Redmenia."
						var/warning_sound = sound('sound/effects/siren_once.ogg', repeat = FALSE, wait = TRUE, channel = 777)
						for (var/mob/M in player_list)
							M.client << warning_sound
						to_chat(world, "<font size = 5><b>雷德梅尼亚已夺回其首都.</b></font>")
					if (BLUEFACTION)
						icon_state = "blugoslavia"
						name = "Blugoslavia Flag"
						desc = "The flag of Blugoslavia."
						var/warning_sound = sound('sound/effects/siren_once.ogg', repeat = FALSE, wait = TRUE, channel = 777)
						for (var/mob/M in player_list)
							M.client << warning_sound
						to_chat(world, "<font size = 5><b>布鲁戈斯拉维亚已夺回其首都.</b></font>")
				to_chat(user, "你成功升起了自己的旗帜!<br><font size = 5><span class = 'good'>[capitalize(icon_state)]万岁!</span></font>")
		else
			to_chat(user, SPAN_NOTICE("You begin hoisting your own flag..."))
			if (do_after(user, 10 SECONDS, src))
				faction_text = user.faction_text
				switch(faction_text)
					if (REDFACTION)
						icon_state = "redmenia"
						name = "Redmenia Flag"
						desc = "The flag of Redmenia."
						var/warning_sound = sound('sound/effects/siren_once.ogg', repeat = FALSE, wait = TRUE, channel = 777)
						for (var/mob/M in player_list)
							M.client << warning_sound
						to_chat(world, "<font size = 5><b>雷德梅尼亚已占领布鲁戈斯拉维亚首都.</b></font>")
					if (BLUEFACTION)
						icon_state = "blugoslavia"
						name = "Blugoslavia Flag"
						desc = "The flag of Blugoslavia."
						var/warning_sound = sound('sound/effects/siren_once.ogg', repeat = FALSE, wait = TRUE, channel = 777)
						for (var/mob/M in player_list)
							M.client << warning_sound
						to_chat(world, "<font size = 5><b>布鲁戈斯拉维亚已占领雷德梅尼亚首都.</b></font>")
				to_chat(user, "你成功升起了自己的旗帜!<br><font size = 5><span class = 'good'>[capitalize(icon_state)]万岁!</span></font>")
	else
		to_chat(user, SPAN_WARNING("Long live [capitalize(icon_state)]!"))

/obj/structure/flag/campaign/redmenia
	icon_state = "redmenia"
	name = "雷德梅尼亚国旗"
	desc = "雷德梅尼亚国旗."
	faction_text = REDFACTION
	original_faction = REDFACTION

/obj/structure/flag/campaign/blugoslavia
	icon_state = "blugoslavia"
	name = "蓝斯拉夫旗帜"
	desc = "蓝斯拉夫的旗帜."
	faction_text = BLUEFACTION
	original_faction = BLUEFACTION

/obj/structure/flag/pole/attackby(obj/item/W as obj, var/mob/living/human/H)
	if(istype(W, /obj/item/stack/material/cloth))
		if(W.amount >= 5)
			W.amount -= 5
			new /obj/structure/flag/pole/custom(src.loc)
			if(W.amount <= 0)
				qdel(W)
			qdel(src)
		else
			to_chat(H, "你至少需要五块布料才能做那个!")
	else if(istype(W, /obj/item/flagmaker))
		new /obj/structure/flag/pole/custom(src.loc)
		qdel(src)
	else
		..()
	..()
/obj/structure/flag/pole/custom
	icon_state = "cust_flag"
	name = "旗帜"
	desc = "一面旗帜."
	var/uncolored = TRUE
	var/flagcolor
	var/symbol
	var/symbolcolor

/obj/structure/flag/pole/custom/attackby(obj/item/W as obj, var/mob/living/human/H)
	if(istype(W, /obj/item/weapon))
		if(W.sharp)
			to_chat(H, "你扯下了旗帜!")
			new/obj/structure/flag/pole(src.loc)
			qdel(src)

/obj/structure/flag/pole/custom/attack_hand(var/mob/living/human/H)
	if (uncolored)
		var/input = WWinput(H, "Flag Color - Choose a color:", "Flag Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			flagcolor= input
	if (!symbol)
		var/display = list("Moon", "Cross", "Star", "Sun", "Plus", "Saltire", "None", "Cancel")
		var/input =  WWinput(H, "What symbol would you like?", "Flag Making", "Cancel", display)
		playsound(src.loc,'sound/items/ratchet.ogg',40) //rip_pack.ogg
		if (input == "Cancel")
			return
		else if(input == "Moon")
			symbol = "cust_f_moon"
		else if(input == "Cross")
			symbol = "cust_f_cross"
		else if(input == "Star")
			symbol = "cust_f_star"
		else if(input == "Sun")
			symbol = "cust_f_sun"
		else if(input == "Plus")
			symbol = "cust_f_plus"
		else if(input == "Saltire")
			symbol = "cust_f_saltire"
		else if(input == "None")
			symbol = "cust_f_blank"
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	if (!symbolcolor)
		var/input = WWinput(H, "Symbol Color - Choose a color:", "Symbol Color" , "#000000", "color")
		if (input == null || input == "")
			return
		else

			symbolcolor= input
	if (flagcolor && symbol && symbolcolor)
		uncolored = FALSE
		var/image/flag = image("icon" = 'icons/obj/flags.dmi', "icon_state" = "cust_flag_cloth")
		flag.color = flagcolor
		var/image/border = image("icon" = 'icons/obj/flags.dmi', "icon_state" = "cust_flag_outline")
		var/image/csymbol = image("icon" = 'icons/obj/flags.dmi', "icon_state" = symbol)
		csymbol.color = symbolcolor
		overlays += flag
		overlays += border
		overlays += csymbol
		return
	else
		..()
	..()

/obj/structure/wallframe
	name = "木墙框架"
	desc = "一个木制墙框架, 往里面加点纸, 竹捆或木头之类的东西.."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wall_frame"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	anchored = TRUE
	density = FALSE
	opacity = FALSE

/obj/structure/wallframe/attackby(obj/item/W as obj, var/mob/living/human/H)
	if(istype(W, /obj/item/stack/material/clay))
		var/input
		var/display = list("Medieval Window - 4", "Medieval Wall - 6","Cancel")
		input =  WWinput(H, "What wall would you like to make?", "Building", "Cancel", display)
		playsound(src.loc,'sound/items/ratchet.ogg',40) //rip_pack.ogg
		if (input == "Cancel")
			return
		else if(input == "Medieval Window - 4")
			if(W.amount >= 4)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/medieval(src.loc)
					qdel(src)
					W.amount -= 4
		else if(input == "Medieval Wall - 6")
			if(W.amount >= 6)
				if (do_after(H, 41, src))
					new/obj/covers/wood_wall/medieval(src.loc)
					qdel(src)
					W.amount -= 6
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	else if(istype(W, /obj/item/weapon/paper))
		var/input
		var/display = list("Shoji Door - 1", "Shoji Wall - 1", "Shoji Divider - 1", "Shoji Window - 1", "Cancel")
		input =  WWinput(H, "What wall would you like to make?", "Building", "Cancel", display)
		playsound(src.loc,'sound/effects/rip_pack.ogg',40)
		if (input == "Cancel")
			return
		else if(input == "Shoji Door - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/structure/simple_door/key_door/anyone/shoji(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Wall - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/shoji(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Divider - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/shoji_divider(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Window - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/shoji(src.loc)
					qdel(src)
					qdel(W)
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	else if(istype(W, /obj/item/stack/material/bamboo))
		var/input = WWinput(H, "What wall would you like to make?", "Building", "Cancel",list ("Bamboo Wall - 3", "Bamboo Doorway - 2", "Bamboo Window - 2", "Cancel"))
		if (input == "Cancel")
			return
		if(input == "Bamboo Wall - 3")
			if(W.amount >= 3)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/bamboo(src.loc)
					qdel(src)
					W.amount -= 3
		else if(input == "Bamboo Doorway - 2")
			if(W.amount >= 2)
				if (do_after(H, 40, src))
					var/obj/covers/wood_wall/bamboo/S = new /obj/covers/wood_wall/bamboo(loc)
					S.icon_state = "bamboo-door"
					S.name = "bamboo doorway"
					S.desc = "A doorway made from bamboo."
					S.density = FALSE
					S.opacity = FALSE
					qdel(src)
					W.amount -= 2
		else if(input == "Bamboo Window - 2")
			if(W.amount >= 2)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/bamboo(src.loc)
					qdel(src)
					W.amount -= 2
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	else if(istype(W, /obj/item/stack/material/woodplank))
		playsound(loc, 'sound/effects/woodfile.ogg', 100, TRUE) //rip_pack.ogg
		if(W.amount >= 10)
			if (do_after(H, 40, src))
				new/obj/covers/wood_wall/adjustable(src.loc)
				qdel(src)
				W.amount -= 10
		else
			to_chat(H, "<span class='notice'>你需要10块木板来建造墙壁!</span>")

/* Bamboo Wall-Frame*/

/obj/structure/wallframe/bamboo
	name = "竹墙框架"
	desc = "一个竹制墙框架, 往里面加点纸, 竹捆或木头之类的东西."
	icon = 'icons/obj/structures.dmi'
	icon_state = "wall_frame_bamboo"

/obj/structure/wallframe/bamboo/attackby(obj/item/W as obj, var/mob/living/human/H)
	if(istype(W, /obj/item/stack/material/wood))
		var/input
		var/display = list("Oriental Window - 4", "Oriental Wall - 6","Oriental Braced Wall (--) - 6", "Oriental Doorway - 6", "Oriental Two Panelled Wall (|) - 6", "Oriental Two Panelled Braced Wall (-|-)", "Oriental Three Panelled Wall (||) - 6",  "Oriental Three Panelled Braced Wall (-|-|-) - 6", "Cancel")
		input =  WWinput(H, "What wall would you like to make?", "Building", "Cancel", display)
		playsound(src.loc,'sound/items/ratchet.ogg',40) //rip_pack.ogg
		if (input == "Cancel")
			return
		else if(input == "Oriental Window - 4")
			if(W.amount >= 4)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/oriental(src.loc)
					qdel(src)
					W.amount -= 4
		else if(input == "Oriental Wall - 6")
			if(W.amount >= 6)
				if (do_after(H, 41, src))
					new/obj/covers/wood_wall/oriental(src.loc)
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Braced Wall (--) - 6")
			if(W.amount >= 6)
				if (do_after(H, 43, src))
					new/obj/covers/wood_wall/oriental/b(src.loc)
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Doorway - 6")
			if(W.amount >= 6)
				if (do_after(H, 40, src))
					var/obj/covers/wood_wall/oriental/S = new /obj/covers/wood_wall/oriental(loc)
					S.icon_state = "oriental-door"
					S.name = "oriental doorway"
					S.desc = "A east-oriental style doorway."
					S.density = FALSE
					S.opacity = FALSE
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Two Panelled Wall (|) - 6")
			if(W.amount >= 6)
				if (do_after(H, 42, src))
					new/obj/covers/wood_wall/oriental/twop(src.loc)
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Two Panelled Braced Wall (-|-)")
			if(W.amount >= 6)
				if (do_after(H, 42, src))
					new/obj/covers/wood_wall/oriental/twop/b(src.loc)
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Three Panelled Wall (||) - 6")
			if(W.amount >= 6)
				if (do_after(H, 42, src))
					new/obj/covers/wood_wall/oriental/threep(src.loc)
					qdel(src)
					W.amount -= 6
		else if(input == "Oriental Three Panelled Braced Wall (-|-|-) - 6")
			if(W.amount >= 6)
				if (do_after(H, 42, src))
					new/obj/covers/wood_wall/oriental/threep/b(src.loc)
					qdel(src)
					W.amount -= 6
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	else if(istype(W, /obj/item/weapon/paper))
		var/input
		var/display = list("Shoji Door - 1", "Shoji Wall - 1", "Shoji Divider - 1", "Shoji Window - 1", "Cancel")
		input =  WWinput(H, "What wall would you like to make?", "Building", "Cancel", display)
		playsound(src.loc,'sound/effects/rip_pack.ogg',40)
		if (input == "Cancel")
			return
		else if(input == "Shoji Door - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/structure/simple_door/key_door/anyone/shoji(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Wall - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/shoji(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Divider - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/shoji_divider(src.loc)
					qdel(src)
					qdel(W)
		else if(input == "Shoji Window - 1")
			if(W.amount >= 1)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/shoji(src.loc)
					qdel(src)
					qdel(W)
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")
	else if(istype(W, /obj/item/stack/material/bamboo))
		var/input = WWinput(H, "What wall would you like to make?", "Building", "Cancel",list ("Bamboo Wall - 3", "Bamboo Doorway - 2", "Bamboo Window - 2", "Cancel"))
		if (input == "Cancel")
			return
		if(input == "Bamboo Wall - 3")
			if(W.amount >= 3)
				if (do_after(H, 40, src))
					new/obj/covers/wood_wall/bamboo(src.loc)
					qdel(src)
					W.amount -= 3
		else if(input == "Bamboo Doorway - 2")
			if(W.amount >= 2)
				if (do_after(H, 40, src))
					var/obj/covers/wood_wall/bamboo/S = new /obj/covers/wood_wall/bamboo(loc)
					S.icon_state = "bamboo-door"
					S.name = "bamboo doorway"
					S.desc = "A doorway made from bamboo."
					S.density = FALSE
					S.opacity = FALSE
					qdel(src)
					W.amount -= 2
		else if(input == "Bamboo Window - 2")
			if(W.amount >= 2)
				if (do_after(H, 40, src))
					new/obj/structure/window_frame/bamboo(src.loc)
					qdel(src)
					W.amount -= 2
		else
			to_chat(H, "<span class='notice'>那不存在!</span>")

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////SHIP////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/structure/ship_bow
	name = "船首斜桅"
	desc = "一根大型船首桅杆, 用于船的前部."
	icon = 'icons/obj/vehicles/bow.dmi'
	icon_state = "bowstir"
	layer = 5
	density = FALSE
	anchored = TRUE
	crushable = FALSE

//////////////////////////////////////////////////////////////////////////////
//////////////////////TORCH STAND/////////////////////////////////////////////
/obj/structure/torch_stand
	name = "火炬架"
	desc = "一个用于将火炬或灯笼固定在墙上的支架"
	icon = 'icons/obj/structures.dmi'
	icon_state = "torch_stand"
	item_state = "torch_stand"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = FALSE
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/obj/item/weapon/storage/internal/storage
	var/max_storage = 3
	var/brightness_on = 5 //luminosity when on
	crushable = FALSE

/obj/structure/torch_stand/update_icon()
	if (dir == 1)
		pixel_y = 32
	else
		pixel_y = 0
	if (storage && storage.contents.len > 0)
		for (var/obj/item/flashlight/torch/TOR in src.storage.contents)
			if (TOR.on == TRUE)
				icon_state = "torch_stand1_on"
				set_light(1)
				light_color = "#FCDA7C"
				light_range = 4
				return
			else
				icon_state = "torch_stand1"
				set_light(0)
				light_color = null
				light_range = 0
				return
		for (var/obj/item/flashlight/lantern/LAN in src.storage.contents)
			if (LAN.on == TRUE)
				icon_state = "torch_stand_lantern_on"
				set_light(1)
				light_color = "#FCDA7C"
				light_range = 6
				return
			else
				icon_state = "torch_stand_lantern"
				set_light(0)
				return

	else
		icon_state = "torch_stand"

/obj/structure/torch_stand/New()
	..()
	storage = new/obj/item/weapon/storage/internal(src)
	storage.storage_slots = 1
	storage.max_w_class = 2
	storage.max_storage_space = max_storage*3
	storage.can_hold = list(/obj/item/flashlight/torch, /obj/item/flashlight/lantern)
	update_icon()

/obj/structure/torch_stand/Destroy()
	qdel(storage)
	storage = null
	..()

/obj/structure/torch_stand/attack_hand(mob/user as mob)
	if (istype(user, /mob/living/human) && (user in range(1,src)))
		storage.open(user)
		update_icon()
	else
		return

/obj/structure/torch_stand/MouseDrop(obj/over_object as obj)
	if (storage.handle_mousedrop(usr, over_object))
		..(over_object)
		update_icon()

/obj/structure/torch_stand/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if (storage)
		storage.attackby(W, user)
	update_icon()

/obj/structure/torch_stand/full

/obj/structure/torch_stand/full/New()
	..()
	new /obj/item/flashlight/torch/on(src.storage)
	update_icon()

/obj/structure/torch_stand/lantern

/obj/structure/torch_stand/lantern/New()
	..()
	new /obj/item/flashlight/lantern/on(src.storage)
	update_icon()

//////////////////////////CAMONET/////////////////////////////////

/obj/structure/camonet
	name ="迷彩网"
	icon = 'icons/obj/structures.dmi'
	icon_state ="camonet"
	layer = MOB_LAYER + 8
	alpha = 175
	density = FALSE
	anchored = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	mouse_opacity = FALSE


///////////////////////CARGO CONTAINERS///////////////////////////

/obj/structure/cargo_container
	name = "货物集装箱"
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "container1"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 96
	bound_height = 64
	crushable = FALSE

/obj/structure/cargo_container/New()
	var/number = rand(1,5)
	icon_state = "container[number]"

/////////////////////CONSTRUCTION PROPS///////////////////////

/obj/structure/machinery/water_pump
	name = "水泵"
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "waterpump"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 96
	bound_height = 96
	crushable = FALSE

/obj/structure/machinery/construction_crane
	name = "起重机"
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "crane"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 64
	bound_height = 64
	crushable = FALSE

/obj/structure/machinery/construction_crane/New()
	if (dir == NORTH || dir == EAST)//Need to find another way to displace bounds than bound_x;bound_y
		bound_width = 64
		bound_height = 64
	else
		bound_width = 64
		bound_height = 64

/obj/structure/machinery/construction_crane/excavator
	name = "挖掘机"
	icon_state = "excavator"

/obj/structure/machinery/forklift
	name = "叉车"
	desc = "\'一个用于叉子的升降装置\', 这个似乎没电了, 缺少油箱, 火花塞还-- 哦! 发动机也不见了."
	icon = 'icons/obj/vehicles/vehicleparts64x64.dmi'
	icon_state = "forklift"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 64
	bound_height = 64
	crushable = FALSE

/obj/structure/machinery/construction_crane/New()
	if (dir == NORTH || dir == EAST)//Need to find another way to displace bounds than bound_x;bound_y
		bound_width = 64
		bound_height = 64
	else
		bound_width = 64
		bound_height = 64

/obj/structure/truck
	name = "运输卡车"
	desc = "看起来这玩意一时半会儿动不了."
	icon = 'icons/obj/vehicles/wip_vehicles.dmi'
	icon_state = "truck"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 64
	bound_height = 128
	crushable = FALSE

/obj/structure/radome
	name = "无线电圆顶"
	icon = 'icons/obj/decals_widest.dmi'
	icon_state = "radome"
	density = TRUE
	anchored = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	bound_width = 128
	bound_height = 128
	crushable = FALSE

/obj/structure/medical_divider
	name = "医疗隔断"
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "medical_divider_half"
	density = FALSE
	flammable = TRUE
	anchored = TRUE

/obj/structure/medical_divider/full
	icon_state = "medical_divider_full"
	density = TRUE
	flammable = TRUE
	anchored = TRUE
