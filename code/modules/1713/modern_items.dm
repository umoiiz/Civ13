///Mostly electrically powered stuff

/obj/structure/lamp
	name = "小型灯柱"
	desc = "一根小型灯柱,适合户外照明."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "lamppost_small"
	var/base_icon = "lamppost_small"
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/on = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	crushable = FALSE
	powerneeded = 2
	var/light_amt = 6 //light range
	layer = 3.95
	var/brightness_color = null
	var/lamp_inside = TRUE
	var/lamp_broken = FALSE
	var/ltype = "lbulb"
/obj/structure/lamp/New()
	..()
	do_light()
/obj/structure/lamp/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		if (prob(80))
			return TRUE
		else
			return FALSE
	else
		return ..()
/obj/structure/lamp/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W,/obj/item/lightbulb) && !lamp_inside)
		var/obj/item/lightbulb/L = W
		if (!L.broken && L.ltype == ltype)
			to_chat(user, "你把灯泡装了进去.")
			qdel(W)
			lamp_inside = TRUE
			lamp_broken = FALSE
			icon_state = base_icon
			update_icon()
			return
	if (istype(W,/obj/item/weapon/wrench) && !not_movable)
		if (powersource)
			to_chat(user, "<span class='notice'>先移除电缆.</span>")
			return
		if (istype(src, /obj/structure/engine))
			var/obj/structure/engine/EN = src
			if (!isemptylist(EN.connections))
				to_chat(user, "<span class='notice'>先移除电缆.</span>")
				return
		playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		to_chat(user, (anchored ? "<span class='notice'>You unfasten \the [src] from the floor.</span>" : "<span class='notice'>You secure \the [src] to the floor.</span>"))
		anchored = !anchored
		return
	if (!anchored)
		to_chat(user, "<span class='notice'>先用扳手把灯固定到位.</span>")
		return
	if (istype(W, /obj/item/stack/cable_coil))
		if (powersource)
			to_chat(user, "这里已经连接了一根电缆!把它从\the [src]处进一步分开.")
			return
		var/obj/item/stack/cable_coil/CC = W
		powersource = CC.place_turf(get_turf(src), user, turn(get_dir(user,src),180))
		if (!powersource)
			return
		powersource.connections += src
		var/opdir1 = 0
		var/opdir2 = 0
		if (powersource.tiledir == "horizontal")
			opdir1 = 4
			opdir2 = 8
		else if  (powersource.tiledir == "vertical")
			opdir1 = 1
			opdir2 = 2
		powersource.update_icon()

		if (opdir1 != 0 && opdir2 != 0)
			for(var/obj/structure/cable/NCOO in get_turf(get_step(powersource,opdir1)))
				if ((NCOO.tiledir == powersource.tiledir) && NCOO != powersource)
					if (!(powersource in NCOO.connections) && !list_cmp(powersource.connections, NCOO.connections))
						NCOO.connections += powersource
					if (!(NCOO in powersource.connections) && !list_cmp(powersource.connections, NCOO.connections))
						powersource.connections += NCOO
					to_chat(user, "你把两根电缆连接起来.")

			for(var/obj/structure/cable/NCOC in get_turf(get_step(powersource,opdir2)))
				if ((NCOC.tiledir == powersource.tiledir) && NCOC != powersource)
					if (!(powersource in NCOC.connections) && !list_cmp(powersource.connections, NCOC.connections))
						NCOC.connections += powersource
					if (!(NCOC in powersource.connections) && !list_cmp(powersource.connections, NCOC.connections))
						powersource.connections += NCOC
		to_chat(user, "你把电缆连接到\the [src].")
	else
		..()


/obj/structure/lamp/update_icon()
	if (lamp_inside && !lamp_broken && on)
		icon_state = "[base_icon]_on"
	else if (lamp_inside && !lamp_broken && !on)
		icon_state = base_icon
	else if (!lamp_inside)
		icon_state = "[base_icon]_empty"
	else if (lamp_inside && lamp_broken)
		icon_state = "[base_icon]_broken"
/obj/structure/lamp/proc/do_light()
	if (!lamp_broken && lamp_inside)
		if (check_power() || !powerneeded)
			if (brightness_color)
				set_light(light_amt, 1, brightness_color)
			else
				set_light(light_amt)
			update_icon()
			powered = TRUE
			on = TRUE
		else
			set_light(0)
			update_icon()
			powered = FALSE
			on = FALSE
	else
		set_light(0)
		update_icon()
		powered = FALSE
		on = FALSE

	spawn(10)
		do_light()

/obj/structure/lamp/proc/check_power()
	if (!powersource || !powerneeded)
		return FALSE
	else
		if (powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
			if (!on)
				powersource.update_power(powerneeded,1)
				on = TRUE
				powersource.currentflow += powerneeded
				powersource.lastupdate2 = world.time
			return TRUE
		else
			if (on)
				powersource.update_power(powerneeded,1)
				on = FALSE
				powersource.currentflow -= powerneeded
				powersource.lastupdate2 = world.time
			return FALSE


/obj/structure/lamp/bullet_act(var/obj/item/projectile/Proj)
	if (lamp_inside && !lamp_broken)
		visible_message("\The [src]碎裂了!")
		playsound(src, 'sound/effects/hit_on_shattered_glass.ogg', 70, TRUE)
//		new/obj/item/weapon/material/shard(loc)
		on = FALSE
		lamp_broken = TRUE
		icon_state = "[base_icon]_broken"
		update_icon()
//	if (powersource)
//		var/obj/structure/cable/CB = powersource
//		CB.connections -= src
//		powersource = null
//	qdel(src)
	..()

/obj/item/lightbulb
	name = "灯泡"
	icon = 'icons/obj/lighting.dmi'
	icon_state = "lbulb"
	anchored = FALSE
	density = FALSE
	opacity = FALSE
	var/broken = FALSE
	var/ltype = "lbulb"
	flags = CONDUCT

/obj/item/lightbulb/broken
	name = "破碎的灯泡"
	icon_state = "lbulb_broken"
	broken = TRUE

/obj/item/lightbulb/tube
	name = "灯管"
	icon_state = "ltube"
	ltype = "ltube"

/obj/item/lightbulb/tube/broken
	name = "破碎的灯管"
	icon_state = "ltube_broken"
	broken = TRUE

/obj/structure/lamp/attack_hand(mob/living/human/user as mob)
	if (lamp_inside)
		if (lamp_broken)
			to_chat(user, "你取下了破碎的灯泡.")
			lamp_inside = FALSE
			lamp_broken = FALSE
			var/obj/item/lightbulb/broken/LP = new/obj/item/lightbulb/broken
			LP.ltype = ltype
			LP.icon_state = "[ltype]_broken"
			LP.update_icon()
			user.put_in_active_hand(LP)

		else
			to_chat(user, "你取下了灯泡.")
			lamp_inside = FALSE
			var/obj/item/lightbulb/LP = new/obj/item/lightbulb
			LP.ltype = ltype
			LP.icon_state = "[ltype]"
			LP.update_icon()
			user.put_in_active_hand(LP)
		icon_state = "[base_icon]_empty"
		update_icon()
	else
		..()

/obj/structure/lamp/lamppost_small
	name = "小型灯柱"
	desc = "一根小型灯柱,适合户外照明."
	icon_state = "lamppost_small"
	powerneeded = 2
	light_amt = 6
/obj/structure/lamp/lamppost_small/alwayson
	powerneeded = 0
	on = TRUE
/obj/structure/lamp/streetlight
	name = "路灯"
	desc = "一盏路灯,适合照亮街道."
	icon = 'icons/obj/lighting_32x64.dmi'
	base_icon = "streetlight"
	icon_state = "streetlight"
	powerneeded = 3
	light_amt = 7
/obj/structure/lamp/streetlight/alwayson
	powerneeded = 0
	on = TRUE


/obj/structure/lamp/lamp_small
	name = "小型灯泡"
	desc = "一个小型灯泡."
	icon_state = "bulb"
	base_icon = "bulb"
	powerneeded = 1
	light_amt = 3
	not_movable = FALSE
	not_disassemblable = FALSE

/obj/structure/lamp/lamp_small/broken
	lamp_broken= TRUE
	icon_state = "bulb_broken"

/obj/structure/lamp/lamp_small/alwayson
	powerneeded = 0
	on = TRUE
/obj/structure/lamp/lamp_small/alwayson/white
	brightness_color = "#ffffff"
/obj/structure/lamp/lamp_small/alwayson/red
	brightness_color = "#da0205"
/obj/structure/lamp/lamp_small/alwayson/space
	icon_state = "spacelights"
	base_icon = "spacelights"
	brightness_color = "bee9e4"
/obj/structure/lamp/lamp_small/tank
	powerneeded = 1
	var/obj/structure/engine/connection = null
	on = FALSE

/obj/structure/lamp/lamp_small/tank/check_power()
	if (!connection || !powerneeded)
		return FALSE
	else
		if (connection.on)
			if (!on)
				on = TRUE
			return TRUE
		else
			if (on)
				on = FALSE
			return FALSE

/obj/structure/lamp/lamp_small/tank/red
	icon_state = ""
	base_icon = ""
	brightness_color = "#da0205"

/obj/structure/lamp/lamp_small/tank/floodlight
	brightness_color = "#fff898"
	icon_state = ""
	base_icon = ""
	light_amt = 8

/obj/structure/lamp/lamp_small/tank/red/police
	name = "警灯"
	pixel_x=32
	update_icon()
		..()
		switch(dir)
			if(NORTH)
				pixel_x=-16
				pixel_y=0
			if(SOUTH)
				pixel_x=16
				pixel_y=0
			if(WEST)
				pixel_y=-16
				pixel_x=0
			if(EAST)
				pixel_y=16
				pixel_x=0
/obj/structure/lamp/lamp_small/tank/blue
	brightness_color = "#0202da"
/obj/structure/lamp/lamp_small/tank/blue/police
	name = "警灯"
	pixel_x=-32
	update_icon()
		..()
		switch(dir)
			if(NORTH)
				pixel_x=16
				pixel_y=0
			if(SOUTH)
				pixel_x=-16
				pixel_y=0
			if(WEST)
				pixel_y=16
				pixel_x=0
			if(EAST)
				pixel_y=-16
				pixel_x=0
/obj/structure/lamp/lamp_big
	name = "灯管"
	desc = "一根灯管."
	icon_state = "tube"
	base_icon = "tube"
	powerneeded = 1.3
	light_amt = 4
	not_movable = FALSE
	not_disassemblable = FALSE
	ltype = "ltube"

/obj/structure/lamp/lamp_big/broken
	lamp_broken= TRUE
	icon_state = "tube_broken"

/obj/structure/lamp/lamp_big/alwayson
	powerneeded = 0
	on = TRUE
/obj/structure/lamp/lamp_big/alwayson/white
	brightness_color = "#ffffff"

/obj/structure/refinery
	name = "炼油厂"
	desc = "一座炼油厂."
	icon = 'icons/obj/obj32x64.dmi'
	icon_state = "refinery"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/list/obj/item/weapon/reagent_containers/glass/barrel/barrel = list()
	var/volume = 0
	var/volume_et = 0
	var/volume_di = 0
	var/maxvolume = 300
	var/active = FALSE
	var/product = "gasoline"
	powerneeded = 1

/obj/structure/refinery/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/glass/barrel))
		if (isemptylist(barrel))
			barrel += W
			H.drop_from_inventory(W)
			W.forceMove(locate(0,0,0))
			visible_message("[H]把\the [W]放入\the [src].","你把\the [W]放入\the [src].")
			return
		else
			if (volume >= maxvolume)
				to_chat(H, SPAN_NOTICE("The refinery is full."))
				return
			var/obj/item/weapon/reagent_containers/glass/barrel/C = W
			if (C.reagents.has_reagent("petroleum",1))
				var/barrelamt = C.reagents.get_reagent_amount("petroleum")
				if (barrelamt < (maxvolume-volume))
					C.reagents.remove_reagent("petroleum",barrelamt)
					volume += barrelamt
					H.visible_message("[H]把\the [W]倒入\the [src].", "你把[barrelamt]单位的石油从\the [W]倒入\the [src].")
					if (volume > maxvolume)
						volume = maxvolume
					return
				else
					C.reagents.remove_reagent("petroleum",(maxvolume-volume))
					volume += (maxvolume-volume)
					H.visible_message("[H]把\the [W]倒入\the [src].", "你把[maxvolume-volume]单位的石油从\the [W]倒入\the [src].")
					if (volume > maxvolume)
						volume = maxvolume
					return
			else
				to_chat(H, SPAN_NOTICE("This [W] has no crude petroleum in it!"))
				return
	else if (istype(W, /obj/item/stack/cable_coil))
		connect_cable(H,W)
		return

	else
		..()

/obj/structure/refinery/verb/empty()
	set category = null
	set name = "Remove Barrel"
	set src in range(1, usr)

	if (active)
		to_chat(usr, SPAN_NOTICE("You need to shut the refinery down first!"))
		return
	if (!isemptylist(barrel))
		to_chat(usr, "你开始从\the [src]中取出\the [barrel[1]]...")
		if (do_after(usr,35,src))
			usr.visible_message("[usr]从\the [src]中取出了\the [barrel[1]].", "你从\the [src]中取出了\the [barrel[1]].")
		for(var/obj/item/weapon/reagent_containers/glass/barrel/B in barrel)
			B.loc = get_turf(src)
			barrel -= B
			active = FALSE
			powered = FALSE
			return
	else
		to_chat(usr, SPAN_NOTICE("There is no barrel to remove from \the [src]."))
		return

/obj/structure/refinery/verb/set_product()
	set category = null
	set name = "Set Output"
	set src in range(1, usr)

	if (active)
		to_chat(usr, SPAN_NOTICE("You need to shut the refinery down first!"))
		return
	else
		var/prod = WWinput(usr, "What to produce?", "Refinery", "Cancel", list("Gasoline","Diesel","Cancel"))
		if (prod == "Cancel")
			return
		else if (prod == "Gasoline")
			product = "gasoline"
			to_chat(usr, "该炼油厂现在将生产<b>汽油</b>.")
			return
		else if (prod == "Diesel")
			product = "diesel"
			to_chat(usr, "该炼油厂现在将生产<b>柴油</b>.")
			return
/obj/structure/refinery/attack_hand(var/mob/living/human/H)
	if (active)
		active = FALSE
		powered = FALSE
		powersource.update_power(powerneeded,1)
		powersource.currentflow -= powerneeded
		powersource.lastupdate2 = world.time
		to_chat(H, "你关闭了炼油厂.")
		return
	if (isemptylist(barrel))
		to_chat(H, SPAN_NOTICE("There is no barrel to collect the refined products."))
		return
	if (volume <= 0 && volume_di <= 0 && volume_et <= 0)
		to_chat(H, SPAN_NOTICE("The refinery is empty! Put some precursors in first."))
		return

	if (!active && powersource && !powersource.powered)
		to_chat(H, SPAN_NOTICE("There is not enough power to start the refinery."))
		return
	else if (!active && powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
		active = TRUE
		powered = TRUE
		powersource.update_power(powerneeded,1)
		powersource.currentflow += powerneeded
		powersource.lastupdate2 = world.time
		power_on()
		to_chat(H, "你启动了炼油厂.")
		return
	else
		to_chat(H, SPAN_NOTICE("There is not enough power to start the refinery."))
		return

/obj/structure/refinery/proc/power_on()
	if (active)
		update_icon()
		spawn(600) // 1 minute
			refine()
	else
		update_icon()
		return


/obj/structure/refinery/proc/refine()
	if (powered && active && volume >= 1 && !isemptylist(barrel))
		if (!barrel[1])
			active = FALSE
			update_icon()
			return
		if (barrel[1].reagents.total_volume >= barrel[1].reagents.maximum_volume)
			visible_message("炼油厂停止工作.[barrel[1]]已满.")
			active = FALSE
			update_icon()
			return
		update_icon()
		var/amt = 10
		if (volume < 10)
			amt = volume
			if (volume < 0)
				volume = 0
		if (product == "gasoline")
			volume -= amt
			barrel[1].reagents.add_reagent("gasoline",0.8*amt)
		else if (product == "diesel")
			volume -= amt
			barrel[1].reagents.add_reagent("diesel",0.7*amt)
		else // default to diesel
			volume -= amt
			barrel[1].reagents.add_reagent("diesel",0.7*amt)
		spawn(600) // 1 minute
			refine()
		return
	else
		update_icon()
		return
/obj/structure/refinery/update_icon()
	if (active)
		icon_state = "refinery1"
	else
		icon_state = "refinery"
//////////////////////////////////////BIOFUELS////////////////////////////////////

/obj/structure/refinery/biofuel
	name = "生物燃料精炼厂"
	desc = "一座生物燃料精炼厂,用于生产乙醇和生物柴油."
	maxvolume = 300
	product = "biodiesel"

/obj/structure/refinery/biofuel/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/glass/barrel))
		if (isemptylist(barrel))
			barrel += W
			H.drop_from_inventory(W)
			W.forceMove(locate(0,0,0))
			H.visible_message("[H]把\the [W]放入\the [src].", "你把\the [W]放入\the [src].")
			return
		else
			if (volume_et+volume_di >= maxvolume)
				to_chat(H, SPAN_NOTICE("The refinery is full."))
				return
			var/obj/item/weapon/reagent_containers/glass/barrel/C = W
			if (C.reagents.has_reagent("olive_oil",1))
				var/barrelamt = C.reagents.get_reagent_amount("olive_oil")
				if (barrelamt < (maxvolume-volume_di))
					C.reagents.remove_reagent("olive_oil",barrelamt)
					volume_di += barrelamt
					H.visible_message("[H]把\the [W]倒入\the [src].", "你把[barrelamt]单位的橄榄油从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_di = maxvolume-volume_et
					return
				else
					C.reagents.remove_reagent("olive_oil",(maxvolume-volume_di))
					volume_di += (maxvolume-volume_di)
					H.visible_message("[H]把\the [W]倒入\the [src].","你把[maxvolume-volume]单位的橄榄油从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_di = maxvolume-volume_et
					return
			else if (C.reagents.has_reagent("ethanol",1))
				var/barrelamt = C.reagents.get_reagent_amount("ethanol")
				if (barrelamt < (maxvolume-volume_et))
					var/strength = 0
					var/maxetvol = 0
					for (var/datum/reagent/ethanol/E in C.reagents.reagent_list)
						maxetvol += E.volume
						strength += E.volume*E.strength
					if (maxetvol <= 0)
						to_chat(H, SPAN_NOTICE("This [W] has no biofuel percursors in it!"))
						return
					strength /= maxetvol
					strength = 1-(strength/100)
					C.reagents.remove_reagent("ethanol",barrelamt)
					volume_et += barrelamt*strength
					H.visible_message("[H]把\the [W]倒入\the [src].", "你把[barrelamt]单位的未提纯乙醇从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_di = maxvolume-volume_di
					return
				else
					C.reagents.remove_reagent("ethanol",(maxvolume-volume_et))
					volume_et += (maxvolume-volume_et)
					visible_message("[H]把\the [W]倒入\the [src].","你把[maxvolume-volume]单位的未提纯乙醇从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_et = maxvolume-volume_di
					return
			else if (C.reagents.has_reagent("fat_oil",1))
				var/barrelamt = C.reagents.get_reagent_amount("fat_oil")
				if (barrelamt < (maxvolume-volume_di))
					C.reagents.remove_reagent("fat_oil",barrelamt)
					volume_di += barrelamt
					H.visible_message("[H]把\the [W]倒入\the [src].", "你把[barrelamt]单位的橄榄油从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_di = maxvolume-volume_et
					return
				else
					C.reagents.remove_reagent("fat_oil",(maxvolume-volume_di))
					volume_di += (maxvolume-volume_di)
					H.visible_message("[H]把\the [W]倒入\the [src].","你把[maxvolume-volume]单位的橄榄油从\the [W]倒入\the [src].")
					if (volume_di+volume_et > maxvolume)
						volume_di = maxvolume-volume_et
					return
			else
				to_chat(H, SPAN_NOTICE("This [W] has no biofuel percursors in it!"))
				return
	else if (istype(W, /obj/item/stack/cable_coil))
		connect_cable(H,W)
	else
		..()


/obj/structure/refinery/biofuel/set_product()
	set category = null
	set name = "Set Output"
	set src in range(1, usr)

	if (active)
		to_chat(usr, "你需要先关闭精炼厂!")
		return
	else
		var/prod = WWinput(usr, "What to produce?", "Refinery", "Cancel", list("Ethanol","Biodiesel","Cancel"))
		if (prod == "Cancel")
			return
		else if (prod == "Ethanol")
			product = "ethanol"
			to_chat(usr, "该精炼厂现在将生产<b>乙醇</b>.")
			return
		else if (prod == "Biodiesel")
			product = "biodiesel"
			to_chat(usr, "该精炼厂现在将生产<b>生物柴油</b>.")
			return


/obj/structure/refinery/biofuel/refine()
	if (powered && active && (volume_di > 0 || volume_et > 0) && !isemptylist(barrel))
		if (!barrel[1])
			active = FALSE
			update_icon()
			return
		if (barrel[1].reagents.total_volume >= barrel[1].reagents.maximum_volume)
			visible_message("精炼厂停止工作.[barrel[1]]已满.")
			active = FALSE
			update_icon()
			return
		update_icon()
		var/amt = 10
		if (volume_et < 0)
			volume_et = 0
		if (volume_di < 0)
			volume_di = 0
		if (product == "ethanol")
			if (volume_et < 10)
				amt = volume_et
			volume_et -= amt
			barrel[1].reagents.add_reagent("pethanol",amt)
		else if (product == "biodiesel")
			if (volume_di < 10)
				amt = volume_di
			volume_di -= amt
			barrel[1].reagents.add_reagent("biodiesel",0.7*amt)
		else // default to diesel
			if (volume_di < 10)
				amt = volume_di
			volume_di -= amt
			barrel[1].reagents.add_reagent("biodiesel",0.7*amt)
		spawn(600) // 1 minute
			refine()
		return
	else
		update_icon()
		return

////////////////////////bakelizer (plastic maker)///////////////////

/obj/structure/bakelizer
	name = "胶木化机"
	desc = "一台用于将石油转化为塑料的机器."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "bakelizer"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/list/obj/item/weapon/reagent_containers/glass/barrel/barrel = list()
	var/volume = 0
	var/active = FALSE
	var/plastic = 0
	powerneeded = 10

/obj/structure/bakelizer/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/reagent_containers))
		var/obj/item/weapon/reagent_containers/C = W
		if (C.reagents.has_reagent("petroleum",1))
			var/barrelamt = C.reagents.get_reagent_amount("petroleum")
			C.reagents.remove_reagent("petroleum",barrelamt)
			volume += barrelamt
			H.visible_message("[H]把\the [W]倒入\the [src].", "你把[barrelamt]单位的石油从\the [W]倒入\the [src].")
			desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and [plastic] plastic sheets inside."
			return
		else
			to_chat(H, SPAN_NOTICE("This [W] has no crude petroleum in it!"))
			return
	else if (istype(W, /obj/item/stack/cable_coil))
		connect_cable(H,W)
	else
		..()


/obj/structure/bakelizer/attack_hand(var/mob/living/human/H)
	if (active)
		active = FALSE
		powered = FALSE
		powersource.update_power(powerneeded,1)
		powersource.currentflow -= powerneeded
		powersource.lastupdate2 = world.time
		to_chat(H, "你关闭了[src].")
		update_icon()
		return
	if (volume < 1)
		to_chat(H, SPAN_NOTICE("The bakelizer is empty! Put some crude petroleum in first."))
		return

	if (!active && !powersource.powered)
		to_chat(H, SPAN_NOTICE("There is not enough power to start the [src]."))
		update_icon()
		return
	else if (!active && powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
		active = TRUE
		powered = TRUE
		powersource.update_power(powerneeded,1)
		powersource.currentflow += powerneeded
		powersource.lastupdate2 = world.time
		power_on()
		to_chat(H, "你启动了[src].")
		update_icon()
		return
	else
		to_chat(H, SPAN_NOTICE("There is not enough power to start the [src]."))
		return
/obj/structure/bakelizer/proc/power_on()
	if (powered && active)
		update_icon()
		spawn(600) // 1 minute
			refine()
	else
		update_icon()
		return


/obj/structure/bakelizer/proc/refine()
	if (!powered || !active)
		return
	if (volume <= 0)
		volume = 0
		desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and [plastic] plastic sheets inside."
		return
	else if (volume >= 5)
		volume-=5
		plastic+=1
		desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and [plastic] plastic sheets inside."
		spawn(600) // 1 minute
			refine()
		return
/obj/structure/bakelizer/verb/empty()
	set category = null
	set name = "Remove Plastic"
	set src in range(1, usr)

	if (!plastic)
		to_chat(usr, "[src]中没有成品塑料.")
		desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and 0 plastic sheets inside."
		return
	else if (plastic <= 0)
		plastic = 0
		desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and 0 plastic sheets inside."
		return
	else if (plastic > 0)
		var/obj/item/stack/material/plastic/P = new/obj/item/stack/material/plastic(get_turf(src))
		P.amount = plastic
		plastic = 0
		desc = "A machine used to transform petroleum into plastics. Has [volume] petroleum and 0 plastic sheets inside."
		return
/obj/structure/bakelizer/update_icon()
	if (active)
		icon_state = "bakelizer_on"
	else
		icon_state = "bakelizer"

/obj/structure/shopping_cart
	name = "购物车"
	desc = "一辆金属购物车."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "shopping_cart"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	anchored = FALSE
	density = TRUE
	opacity = FALSE
	var/obj/item/weapon/storage/internal/storage
	var/max_storage = 6
/obj/structure/shopping_cart/update_icon()
	overlays.Cut()
	for (var/obj/item/I in storage)
		var/image/IM = image(I.icon, I.icon_state, layer=src.layer-0.1)
		var/matrix/M = matrix()
		M.Scale(0.7)
		IM.transform = M
		overlays += IM
	..()

/obj/structure/shopping_cart/New()
	..()
	storage = new/obj/item/weapon/storage/internal(src)
	storage.storage_slots = max_storage
	storage.max_w_class = 5
	storage.max_storage_space = max_storage*5
	update_icon()
/obj/structure/shopping_cart/Destroy()
	qdel(storage)
	storage = null
	..()

/obj/structure/shopping_cart/attack_hand(mob/user as mob)
	if (istype(user, /mob/living/human) && (user in range(1,src)))
		storage.open(user)
		update_icon()
	else
		return
/obj/structure/shopping_cart/MouseDrop(obj/over_object as obj)
	if (storage.handle_mousedrop(usr, over_object))
		..(over_object)
		update_icon()

/obj/structure/shopping_cart/attackby(obj/item/W as obj, mob/user as mob)
	..()
	storage.attackby(W, user)
	update_icon()
///////////////////////////////////////////////////////////////////////////////Katana Wall Stand////////////////////////

/obj/structure/katana_stand
	name = "武士刀展示架"
	desc = "一个用于将武士刀挂在墙上的展示架."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "katana_stand"
	item_state = "katana_stand"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/obj/item/weapon/storage/internal/storage
	var/max_storage = 3

/obj/structure/katana_stand/update_icon()
	if (storage.contents.len > 0)
		icon_state = "katana_stand1"
	else
		icon_state = "katana_stand"
	return

/obj/structure/katana_stand/New()
	..()
	storage = new/obj/item/weapon/storage/internal(src)
	storage.storage_slots = 1
	storage.max_w_class = 3
	storage.max_storage_space = max_storage*3
	storage.can_hold = list(/obj/item/clothing/accessory/storage/sheath/katana, /obj/item/clothing/accessory/storage/sheath/katana/full, /obj/item/weapon/material/sword/katana)
	update_icon()

/obj/structure/katana_stand/Destroy()
	qdel(storage)
	storage = null
	..()

/obj/structure/katana_stand/attack_hand(mob/user as mob)
	if (istype(user, /mob/living/human) && (user in range(1,src)))
		storage.open(user)
		update_icon()
	else
		return

/obj/structure/katana_stand/MouseDrop(obj/over_object as obj)
	if (storage.handle_mousedrop(usr, over_object))
		..(over_object)
		update_icon()

/obj/structure/katana_stand/attackby(obj/item/W as obj, mob/user as mob)
	..()
	storage.attackby(W, user)
	update_icon()

/obj/structure/katana_stand/full

/obj/structure/katana_stand/full/New()
	..()
	new /obj/item/weapon/material/sword/katana(src.storage)
	update_icon()

/obj/structure/floodlight //Works in the basic way, will need more coding for powersupply, being destroyable, etc.
	name = "泛光灯"
	desc = "一盏泛光灯,适合在黑暗环境中进行户外照明."
	icon ='icons/obj/lighting.dmi'
	icon_state = "floodlight"
	var/floodlighton = 0
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	anchored = TRUE
	density = TRUE
	opacity = FALSE
	powerneeded = 0

/obj/structure/floodlight/on
	New()
		..()
		floodlighton = 1
		set_light (8)
		icon_state ="floodlight_on"

/obj/structure/floodlight/Destroy()
	set_light (0)
	..()

/obj/structure/floodlight/attack_hand(var/mob/living/human/H)
	if (!floodlighton)
		floodlighton = 1
		set_light (8)
		icon_state ="floodlight_on"
		playsound (loc, 'sound/effects/Custom_flashlight.ogg', 75, TRUE)
	else
		floodlighton = 0
		set_light (0)
		icon_state ="floodlight"
		playsound (loc, 'sound/effects/Custom_flashlight.ogg', 75, TRUE)


/obj/structure/metal_detector
	name = "金属探测门"
	desc = "当有人通过时探测金属物品."
	icon ='icons/obj/modern_structures.dmi'
	icon_state = "metal_detector1"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	layer = 2.99 //below doors
	powerneeded = 0
	var/on = TRUE

	New()
		..()
		if (on)
			set_light(2, 0.5, "#62cc53")
		else
			set_light(0)

	proc/toggle()
		if (on)
			on = FALSE
			icon_state = "metal_detector"
		else
			on = TRUE
			icon_state = "metal_detector1"

	proc/checkmob(mob/living/human/H)
		if (!on)
			return FALSE
		if (!H)
			return FALSE
		for(var/obj/item/I in H)
			if(I.flags & CONDUCT)
				return TRUE
			for(var/obj/item/I1	in I)
				if(I1.flags & CONDUCT)
					return TRUE
				for(var/obj/item/I2	in I1)
					if(I2.flags & CONDUCT)
						return TRUE
					for(var/obj/item/I3	in I2)
						if(I3.flags & CONDUCT)
							return TRUE
		return FALSE

	Crossed(AM as mob)
		if (isobserver(AM)) return
		if (istype(AM, /obj/item/projectile)) return
		if (ishuman(AM))
			trigger(AM)

	Bumped(AM as mob)
		if (isobserver(AM)) return
		if (istype(AM, /obj/item/projectile)) return
		if (ishuman(AM))
			trigger(AM)

	proc/trigger(mob/living/human/H)
		if (!H)
			return
		if (checkmob(H))
			bleep()

	proc/bleep()
		icon_state = "metal_detector2"
		playsound(loc, 'sound/machines/metal_detector.ogg', 100, 0)
		set_light(2, 0.5,"#ce3535")
		spawn(30)
			icon_state = "metal_detector1"
			set_light(2, 0.5, "#62cc53")

	attack_hand(mob/M)
		if (!ishuman(M))
			return
		if(!on)
			on = TRUE
			M.visible_message("[M]打开了金属探测器.", "你打开了金属探测器.")
			set_light(2, 0.5, "#62cc53")
		else
			M.visible_message("<span class='warning'>[M]正试图关闭金属探测器!</span>", "你开始关闭金属探测器...")
			if(do_after(M, 50, src))
				M.visible_message("<span class='warning'>[M]关闭了金属探测器.</span>", "你关闭了金属探测器.")
				on = FALSE
				set_light(0)

/obj/structure/drill
	name = "工业钻机"
	desc = "一台重型工业深钻,用于采集深埋地下的矿物.它需要通电,位于地下且放置在泥土上才能运作."
	icon = 'icons/obj/machines/mining_drill.dmi'
	icon_state = "mining_drill"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = FALSE
	density = TRUE
	var/ore_types = list(
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/iron,
		/obj/item/stack/ore/gold,
		/obj/item/stack/ore/glass,
		/obj/item/stack/ore/silver,
		/obj/item/stack/ore/copper,
		/obj/item/stack/ore/tin,
		/obj/item/stack/ore/tin,
		/obj/item/stack/ore/tin,
		/obj/item/stack/ore/saltpeter,
		/obj/item/stack/ore/saltpeter,
		/obj/item/stack/ore/saltpeter,
		/obj/item/stack/ore/coal,
		/obj/item/stack/ore/coal,
		/obj/item/stack/ore/coal,
		/obj/item/stack/ore/coal,
		/obj/item/stack/ore/coal,
		/obj/item/stack/ore/sulphur,
		/obj/item/stack/ore/sulphur,
		/obj/item/stack/ore/sulphur,
		/obj/item/stack/ore/lead,
		/obj/item/stack/ore/lead,
		/obj/item/stack/ore/lead,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/stone,
		/obj/item/weapon/barrier,
	)
	var/active = FALSE
	var/next_spawn = -1
	powerneeded = 150

/obj/structure/drill/proc/check_power()
	if (!powersource || !powerneeded)
		powered = FALSE
		return FALSE
	else
		powered = TRUE
		if (powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
			if (!active)
				powersource.update_power(powerneeded,1)
				powersource.currentflow += powerneeded
				powersource.lastupdate2 = world.time
			return TRUE
		else
			if (active)
				powersource.update_power(powerneeded,1)
				active = FALSE
				powersource.currentflow -= powerneeded
				powersource.lastupdate2 = world.time
			return FALSE

/obj/structure/drill/update_icon()
	..()
	if (powered)
		icon_state = "mining_drill_powered"
	else
		icon_state = "mining_drill"
	if (active)
		icon_state = "mining_drill_active"

/obj/structure/drill/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	..()

	if (!anchored)
		to_chat(H, SPAN_NOTICE("Fix \the [src] in place with a wrench first."))
		return

	if (istype(W, /obj/item/stack/cable_coil))
		connect_cable(H,W)
		return

/obj/structure/drill/attack_hand(var/mob/living/human/H)
	if (!anchored)
		to_chat(H, SPAN_NOTICE("Fix \the [src] in place with a wrench first."))
		return
	else if (!check_power())
		to_chat(H, SPAN_WARNING("\The [src] doesn't have any power!"))
		update_icon()
		return
	else if (!active && powered)
		next_spawn = 30
		active = TRUE
		process_machine()
		update_icon()
		to_chat(H, "你启动了\the [src].")
		return
	else if (active)
		next_spawn = -1
		active = FALSE
		update_icon()
		to_chat(H, "你关闭了\the [src].")
		return

/obj/structure/drill/proc/process_machine()
	if (!active)
		return
	else if (!check_power())
		active = FALSE
		update_icon()
		visible_message(SPAN_WARNING("\The [src] stops drilling and powers down."))
		return

	else if (!istype(get_turf(src), /turf/floor/dirt))
		playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, TRUE)
		active = FALSE
		update_icon()
		visible_message(SPAN_WARNING("\The [src] cannot drill here, find some softer ground."))
		return
	for (var/obj/covers/C in get_turf(src))
		playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, TRUE)
		active = FALSE
		update_icon()
		visible_message(SPAN_WARNING("\The [src] cannot drill here, the drill cannot reach the soil."))
		return
	if (!(src.z == 1))
		playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, TRUE)
		active = FALSE
		update_icon()
		visible_message(SPAN_WARNING("\The [src] needs to be underground to drill."))
		return

	else
		playsound(loc, 'sound/machines/drill.ogg', 100, FALSE)
		if (next_spawn == 0)
			var/picked = pick(ore_types)

			var/obj/item/stack/tospawn = new picked(null)
			tospawn.amount = rand(2,5)
			for (var/obj/item/stack/S in get_turf(src))
				if (S.type == tospawn.type)
					S.amount += tospawn.amount
					S.update_icon()
					qdel(tospawn)
					break
			if (tospawn)
				tospawn.loc = get_turf(src)
			visible_message(SPAN_NOTICE("\The [src] drills up [tospawn.name]."))
			next_spawn = 60

		update_icon()
		spawn (2 SECONDS)
			next_spawn--
			process_machine()
