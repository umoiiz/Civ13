/obj/structure/gatecontrol
	name = "大门控制"
	desc = "控制附近的大门."
	icon = 'icons/obj/structures.dmi'
	icon_state = "gate_control"
	anchored = TRUE
	var/cooldown = 0
	var/distance = 3
	density = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = 3.01
	crushable = FALSE

/obj/structure/gatecontrol/blastcontrol
	name = "防爆门控制"
	desc = "控制附近的防爆门."
	icon = 'icons/obj/structures.dmi'
	icon_state = "blast_control"
	anchored = TRUE
	distance = 5
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/gatecontrol/blastcontrol/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/blast/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user] 关闭了防爆门!</span>",
									"<span class='notice'>你关闭了防爆门.</span>",
									"你听到有什么东西正在关闭.")
				G.open = FALSE
				cooldown = world.time + 3 SECONDS
				playsound(G.loc, 'sound/effects/rollermove.ogg', 100)
				flick("blastclosing",G)
				spawn(10)
					playsound(G.loc, 'sound/effects/lever.ogg', 100)
					G.icon_state = "blast"
					G.density = TRUE
					G.opacity = TRUE
			else
				user.visible_message("<span class='warning'>[user] 打开了防爆门!</span>",
									"<span class='notice'>你打开了防爆门.</span>",
									"你听到有什么东西正在打开.")
				G.open = TRUE
				cooldown = world.time + 3 SECONDS
				playsound(G.loc, 'sound/effects/lever.ogg', 100)
				flick("blastopening",G)
				spawn(10)
					playsound(G.loc, 'sound/effects/rollermove.ogg', 100)
					G.icon_state = "blastopen"
					G.density = FALSE
					G.opacity = FALSE

/obj/structure/gatecontrol/blastcontrol/garage
	name = "车库卷帘门控制"
	desc = "控制附近的车库卷帘门"

/obj/structure/gatecontrol/blastcontrol/garage/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/blast/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user] 关闭了卷帘门!</span>",
									"<span class='notice'>你关闭了卷帘门.</span>",
									"你听到有什么东西正在关闭.")
				G.open = FALSE
				cooldown = world.time + 6 SECONDS
				flick("garage_closing",G)
				playsound(G.loc, 'sound/effects/garage.ogg', 100)
				spawn(13)
					G.icon_state = "garage_closed"
					G.density = TRUE
					G.opacity = TRUE
			else
				user.visible_message("<span class='warning'>[user] 打开了卷帘门!</span>",
									"<span class='notice'>你打开了卷帘门.</span>",
									"你听到有什么东西正在打开.")
				G.open = TRUE
				cooldown = world.time + 6 SECONDS
				flick("garage_opening",G)
				playsound(G.loc, 'sound/effects/garage.ogg', 100)
				spawn(13)
					G.icon_state = "garage_open"
					G.density = FALSE
					G.opacity = FALSE

/obj/structure/gatecontrol/sandstone
	name = "大门控制"

/obj/structure/gatecontrol/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user] 关闭了大门!</span>",
									"<span class='notice'>你关闭了大门.</span>",
									"你听到有什么东西正在关闭.")
				G.open = FALSE
				cooldown = world.time + 6 SECONDS
				if (G.name == "gate")
					playsound(G.loc, 'sound/effects/castle_gate.ogg', 100)
					G.icon_state = "gate_closing"
					spawn(30)
						G.icon_state = "gate0"
						G.density = TRUE
			else
				user.visible_message("<span class='warning'>[user] 打开了大门!</span>",
									"<span class='notice'>你打开了大门.</span>",
									"你听到有什么东西正在打开.")
				G.open = TRUE
				cooldown = world.time + 6 SECONDS
				if (G.name == "gate")
					playsound(G.loc, 'sound/effects/castle_gate.ogg', 100)
					G.icon_state = "gate_opening"
					spawn(30)
						G.icon_state = "gate1"
						G.density = FALSE

/obj/structure/gatecontrol/sandstone/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/sandstone/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user] 关闭了大门!</span>",
									"<span class='notice'>你关闭了大门.</span>",
									"你听到有什么东西正在关闭.")
				G.open = FALSE
				cooldown = world.time + 6 SECONDS
				playsound(G.loc, 'sound/effects/castle_gate.ogg', 100)
				flick("s_gate_closing",G)
				spawn(30)
					G.icon_state = "s_gate0"
					G.density = TRUE
			else
				user.visible_message("<span class='warning'>[user] 打开了大门!</span>",
									"<span class='notice'>你打开了大门.</span>",
									"你听到有什么东西正在打开.")
				G.open = TRUE
				cooldown = world.time + 6 SECONDS
				playsound(G.loc, 'sound/effects/castle_gate.ogg', 100)
				flick("s_gate_opening",G)
				spawn(30)
					G.icon_state = "s_gate1"
					G.density = FALSE

/obj/structure/gate
	name = "大门"
	desc = "一扇铁门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "gate0"
	anchored = TRUE
	density = TRUE
	var/open = FALSE
	var/health = 600
	var/maxhealth = 600
	not_movable = TRUE
	not_disassemblable = TRUE
	crushable = FALSE

/obj/structure/gate/open
	name = "大门"
	desc = "一扇铁门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "gate1"
	anchored = TRUE
	density = FALSE
	open = TRUE

/obj/structure/gate/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/siegeladder))
		user.visible_message("<span class='danger'>\The [user] 开始部署 \the [W.name].</span>",
							"<span class='notice'>你开始部署 \the [W.name].</span>",
							"你听到有什么东西正在被部署.")
		if (do_after(user, 8 SECONDS, src))
			user.visible_message("<span class='danger'>\The [user] 已部署 \the [W.name]!</span>",
								"<span class='notice'>你已部署 \the [W.name]!</span>",
								"你听到有什么东西正在被部署.")
			var/obj/item/weapon/siegeladder/ANCH = W
			user.remove_from_mob(ANCH)
			ANCH.loc = src.loc
			ANCH.anchored = TRUE
			climbable = TRUE
			ANCH.deployed = TRUE
			ANCH.icon_state = ANCH.depicon
			ANCH.dir = src.dir
			return
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/wrench) && !istype(W,/obj/item/weapon/hammer)) //No weapons can harm me! If not weapon and not a wrench.
		user.visible_message("<span class='warning'>[user] 徒劳地击中 \the [src]!</span>",
							"<span class='warning'>你徒劳地击中 \the [src]!</span>",
							"你听到有什么东西被击中了!")

	..()

/obj/structure/gate/blast
	name = "防爆门"
	desc = "一扇厚重的钢制防爆门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "blast"
	anchored = TRUE
	opacity = TRUE
	density = TRUE
	health = 1200
	maxhealth = 1200
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/gate/blast/open
	name = "防爆门"
	desc = "一扇厚重的钢制防爆门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "blastopen"
	opacity = FALSE
	anchored = TRUE
	density = FALSE
	health = 1200
	maxhealth = 1200
	not_movable = TRUE
	not_disassemblable = TRUE
	open = TRUE

/obj/structure/gate/blast/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/wrench) && !istype(W,/obj/item/weapon/hammer)) //No weapons can harm me! If not weapon and not a wrench.
		user.visible_message("<span class='warning'>[user] 徒劳地击中 \the [src]!</span>",
							"<span class='warning'>你徒劳地击中 \the [src]!</span>",
							"你听到有什么东西被击中了!")
		..()

/obj/structure/gate/blast/garage
	name = "车库卷帘门"
	desc = "一扇钢制车库卷帘门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "garage_closed"
	anchored = TRUE
	opacity = TRUE
	density = TRUE
	health = 800
	maxhealth = 800
	not_movable = TRUE

/obj/structure/gate/blast/garage/open
	name = "车库卷帘门"
	desc = "一扇钢制车库卷帘门."
	icon = 'icons/obj/doors/material_doors.dmi'
	icon_state = "garage_open"
	opacity = FALSE
	anchored = TRUE
	density = FALSE
	health = 800
	maxhealth = 800
	not_movable = TRUE
	open = TRUE

/obj/structure/gate/blast/garage/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/weldingtool)) //No weapons can harm me!
		user.visible_message("<span class='warning'>[user] 徒劳地击中 \the [src]!</span>",
							"<span class='warning'>你徒劳地击中了\the [src]!</span>",
							"你听到有什么东西被击中了!")
	else if (istype(W,/obj/item/weapon/weldingtool)) //ARGH! MY ONLY WEAKNESS... WELDINGTOOLS!
		user.visible_message("<span class='warning'>[user]开始切割\the [src]...</span>",
							"<span class='notice'>你开始切割\the [src]...</span>",
							"你听到有什么东西被切割了.")
		playsound(loc, 'sound/effects/extinguish.ogg', 50, TRUE)
		if (do_after(user, 5 SECONDS, src))
			qdel(src)
			return

/obj/structure/gate/sandstone
	name = "砂岩门"
	icon_state = "s_gate0"
	anchored = TRUE
	density = TRUE

/obj/structure/gate/sandstone/open
	icon_state = "s_gate1"
	anchored = TRUE
	density = FALSE
	open = TRUE

/obj/structure/gate/whiterun
	name = "白漫城门"
	desc = "一扇大型木制双开门"
	icon = 'icons/obj/doors/gates_64x96.dmi'
	icon_state = "whiterun1"
	anchored = TRUE
	density = TRUE
	health = 1000
	maxhealth = 1000
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = MOB_LAYER + 0.01
	bound_width = 64
	bound_height = 64

/obj/structure/gate/whiterun/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon) && !istype(W,/obj/item/weapon/wrench) && !istype(W,/obj/item/weapon/hammer)) //No weapons can harm me! If not weapon and not a wrench.
		user.visible_message("<span class='warning'>[user]徒劳地击中了大门!</span>",
							"<span class='warning'>你徒劳地击中了大门!</span>",
							"你听到有什么东西被击中了!")
	else
		..()

/obj/structure/gate/whiterun/r
	name = "白漫城门"
	icon_state = "whiterun2"

/obj/structure/gate/whiterun/l
	name = "白漫城门"
	icon_state = "whiterun1"

/obj/structure/gate/ex_act(severity)
	switch(severity)
		if (1)
			health -= maxhealth
		if (2)
			health -= rand(100, 300)
		if (3)
			health -= rand(50, 100)
			
	if (health <= 0)
		visible_message("<span class='danger'>\The [src]被炸碎了!</span>")
		qdel(src)
		return

/obj/structure/gatecontrol/whiterun
	name = "大门控制"
	desc = "控制附近的大门."
	icon = 'icons/obj/structures.dmi'
	icon_state = "gate_control"
	anchored = TRUE
	distance = 6
	density = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/gatecontrol/whiterun/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/whiterun/r/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user]关闭了大门!</span>",
									"<span class='notice'>你关闭了大门.</span>",
									"你听到有什么东西关闭了.")
				G.open = FALSE
				cooldown = world.time + 6 SECONDS
				if (G.name == "Whiterun gate")
					playsound(loc, 'sound/effects/castle_gate.ogg', 100)
					flick("whiterun2_closing",G)
					spawn(30)
						G.icon_state = "whiterun2"
						G.density = TRUE
			else
				user.visible_message("<span class='warning'>[user]打开了大门!</span>",
									"<span class='notice'>你打开了大门.</span>",
									"你听到有什么东西打开了.")
				G.open = TRUE
				cooldown = world.time + 6 SECONDS
				if (G.name == "Whiterun gate")
					playsound(loc, 'sound/effects/castle_gate.ogg', 100)
					flick("whiterun2_opening",G)
					spawn(30)
						G.icon_state = "whiterun2_open"
						G.density = FALSE

		for (var/obj/structure/gate/whiterun/l/G in range(distance,src.loc))
			if (G.open)
				user.visible_message("<span class='warning'>[user]关闭了大门!</span>",
									"<span class='notice'>你关闭了大门.</span>",
									"你听到有什么东西关闭了.")
				G.open = FALSE
				cooldown = world.time + 6 SECONDS
				if (G.name == "Whiterun gate")
					playsound(loc, 'sound/effects/castle_gate.ogg', 100)
					flick("whiterun1_closing",G)
					spawn(30)
						G.icon_state = "whiterun1"
						G.density = TRUE
			else
				user.visible_message("<span class='warning'>[user]打开了大门!</span>",
									"<span class='notice'>你打开了大门.</span>",
									"你听到有什么东西打开了.")
				G.open = TRUE
				cooldown = world.time + 6 SECONDS
				if (G.name == "Whiterun gate")
					playsound(loc, 'sound/effects/castle_gate.ogg', 100)
					flick("whiterun1_opening",G)
					spawn(30)
						G.icon_state = "whiterun1_open"
						G.density = FALSE

/////////////////////////////////////////////////////////////////////////////////
/obj/structure/gate/barrier
	name = "屏障门"
	desc = "一道长长的屏障门."
	icon = 'icons/obj/doors/gates_64x64.dmi'
	icon_state = "barriergate"
	anchored = TRUE
	density = TRUE
	opacity = FALSE
	health = 100
	maxhealth = 100
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = MOB_LAYER + 0.01
	climbable = TRUE
	open = FALSE
	var/cooldown = 0
	bound_width = 64
	crushable = TRUE

/obj/structure/gate/barrier/vertical
	name = "屏障门"
	desc = "一道长长的屏障门."
	icon = 'icons/obj/doors/gates_64x64.dmi'
	icon_state = "barriergate_vertical_left"
	anchored = TRUE
	density = TRUE
	opacity = FALSE
	health = 100
	maxhealth = 100
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = MOB_LAYER + 0.01
	climbable = TRUE
	open = FALSE
	bound_width = 32
	bound_height = 64 // Only left facing version present because the rest of those variables, a solution would be to separate the open states from the closed states by making two separate .dmi files, where one's icon sizes are 64x32px, while the other one is 32x64px (not tested though)

/obj/structure/gate/barrier/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		if (open)
			user.visible_message("<span class='notice'>[user]关闭了屏障门!</span>",
								"<span class='notice'>你关闭了屏障门.</span>",
								"你听到有什么东西关闭了.")
			open = FALSE
			cooldown = world.time + 2 SECONDS
			playsound(loc, 'sound/effects/lever.ogg', 100)
			icon_state = "barriergate"
			density = TRUE
			return
		else
			user.visible_message("<span class='notice'>[user]打开了屏障门!</span>",
								"<span class='notice'>你打开了屏障门.</span>",
								"你听到有什么东西打开了.")
			open = TRUE
			cooldown = world.time + 2 SECONDS
			playsound(loc, 'sound/effects/lever.ogg', 100)
			icon_state = "barriergate_open"
			density = FALSE
			return

/obj/structure/gate/barrier/vertical/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		if (open)
			user.visible_message("<span class='notice'>[user]关闭了屏障门!</span>",
								"<span class='notice'>你关闭了屏障门.</span>",
								"你听到有什么东西关闭了.")
			open = FALSE
			cooldown = world.time + 2 SECONDS
			playsound(loc, 'sound/effects/lever.ogg', 100)
			icon_state = "barriergate_vertical_left"
			density = TRUE
			return
		else
			user.visible_message("<span class='notice'>[user]打开了屏障门!</span>",
								"<span class='notice'>你打开了屏障门.</span>",
								"你听到有什么东西打开了.")
			open = TRUE
			cooldown = world.time + 2 SECONDS
			playsound(loc, 'sound/effects/lever.ogg', 100)
			icon_state = "barriergate_vertical_left_open"
			density = FALSE
			return

//Make it destroyable as it takes basis from the usual gates which can't be broken, using a weapon simply says "You hit the gate uselessly."

/////Pseudo-Elavators///// Currently designed for a 2x2 enclosed space, code needs to be overhauled in case we want bigger, more complex elevators (see about porting Baystation's turbolifts)

/obj/structure/gate/elevator_door
	name = "电梯门"
	desc = "一部电梯."
	icon = 'icons/obj/doors/doors_64x32.dmi'
	icon_state = "elevator_door"
	anchored = TRUE
	density = TRUE
	opacity = TRUE
	health = 200
	maxhealth = 200
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = MOB_LAYER + 0.01
	open = FALSE
	bound_width = 64
	var/list/opacity_objects = list()

/obj/structure/gate/elevator_door/New()
	..()
	var/atom/movable/S = new (locate(x+1,y,z))
	S.set_opacity(opacity)
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
	opacity_objects += S

/obj/structure/gate/elevator_door/Destroy()
	for(var/atom/movable/S in opacity_objects)
		qdel(S)
	..()

/obj/structure/gate/elevator_door/proc/toggle()
	playsound(src.loc, 'sound/effects/elevatordoor.ogg', 100)
	if (open)
		visible_message("电梯门关闭了.")
		open = FALSE
		flick("elevator_doorclosing",src)
		spawn(6)
			icon_state = "elevator_door"
			density = TRUE
			opacity = TRUE
			for(var/atom/movable/S in opacity_objects)
				S.set_opacity(TRUE)
	else
		visible_message("电梯门打开了.")
		open = TRUE
		flick("elevator_dooropening",src)
		spawn(6)
			icon_state = "elevator_dooropen"
			density = FALSE
			opacity = FALSE
			for(var/atom/movable/S in opacity_objects)
				S.set_opacity(FALSE)
	autoclose()
	return

/obj/structure/gate/elevator_door/proc/autoclose()
	spawn(10 SECONDS)
		if (src.open)
			src.toggle()
			return

/obj/structure/gatecontrol/elevator_door
	name = "电梯门按钮"
	desc = "呼叫电梯."
	icon = 'icons/obj/structures.dmi'
	icon_state = "lift_panel2"
	anchored = TRUE
	distance = 5
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/gatecontrol/elevator_door/attack_hand(var/mob/user as mob)
	if (cooldown <= world.time)
		for (var/obj/structure/gate/elevator_door/D in range(distance,src.loc))
			D.toggle()
		cooldown = world.time + 6 SECONDS

/obj/structure/elevator_button
	name = "电梯控制按钮"
	icon = 'icons/obj/structures.dmi'
	icon_state = "lift_panel"
	anchored = TRUE
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	crushable = FALSE
	var/next_activation = -1

/obj/structure/elevator_button/attack_hand(var/mob/user as mob)
	if (world.time < next_activation)
		next_activation = world.time + 5 SECONDS
	else
		next_activation = world.time + 15 SECONDS
		for (var/obj/structure/gate/elevator_door/D in range(4,src.loc))
			if (D.open)
				D.toggle()
		spawn(5)
			visible_message("电梯正在离开!")
			spawn(10)
				for (var/mob/M in range(1, src))
					if (M.z == 1)
						M.z = 2
					else if (M.z == 2)
						M.z = 1
					to_chat(M, "电梯已到达!")
				for (var/obj/O in range(1, src))
					if (!istype(O, /obj/structure/elevator_button/) && !istype (O, /obj/covers/))
						if (O.z == 1)
							O.z = 2
						else if (O.z == 2)
							O.z = 1
				spawn(5)
					var/destination_upper = locate(src.x, src.y, src.z+1)
					var/destination_lower = locate(src.x, src.y, src.z-1)
					if (src.z == 1)
						for (var/obj/structure/gate/elevator_door/D in range(4,destination_upper))
							D.toggle()
							playsound(destination_upper, 'sound/effects/elevatording.ogg', 100)
					else
						for (var/obj/structure/gate/elevator_door/D in range(4,destination_lower))
							D.toggle()
							playsound(destination_lower, 'sound/effects/elevatording.ogg', 100)
//////////////////////////////////////////////////////////////////////////////////////////////////
