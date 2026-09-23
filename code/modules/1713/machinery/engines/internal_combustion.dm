///////////////////////INTERNAL//////////////////////////////////////////////

//two-stroke (small gasoline gasoline)
//four-stroke (otto gasoline)
//six-stroke (experimental?)
//diesel (compression-ignition, two-stroke)
//hot-bulb/crude oil
//hesselman (hybrid, low compression and spark-ignition)
//rotary (Wankel)
//Turbine

#define FUEL_CONSUMPTION_MODIFIER 2

/obj/structure/engine/internal
	name = "内燃机"
	desc = "一个基础引擎."
	enginetype = "internal"
	var/list/fuels = list() //accepted fuels (can be more than one)
	var/fuelefficiency = 0 //fuel consumption on max power. Lower is better. The default value is per 1000 cc (liter)
	var/enginesize = 1000 //in cubic centimeters (cc)


/obj/structure/engine/internal/bullet_act(var/obj/item/projectile/proj)
	if (istype(proj, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/S = proj
		if (S.atype == "HE")
			if (prob(90))
				visible_message("<span class = 'warning'>\The [src]爆炸了!</span>")
				explosion(loc, 1, 2, 2, 0)
				qdel(src)
			else
				visible_message("<span class = 'warning'>\The [src]损坏了!</span>")
				broken = TRUE
				on = FALSE
				new/obj/effect/decal/cleanable/blood/oil(loc)
				update_icon()
		else
			if (prob(20))
				visible_message("<span class = 'warning'>\The [src]爆炸了!</span>")
				explosion(loc, 1, 1, 2, 0)
				qdel(src)
			else if (prob(75))
				visible_message("<span class = 'warning'>\The [src]损坏了!</span>")
				broken = TRUE
				on = FALSE
				new/obj/effect/decal/cleanable/blood/oil(loc)
				update_icon()
/obj/structure/engine/internal/New()
	..()
	weight = 20*(enginesize/1000)
	name = "[enginesize]cc [name]"
	maxpower *= (enginesize/1000)
	fuelefficiency *= (enginesize/1000)

/obj/structure/engine/internal/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/glass/barrel) && fueltank == null)
		user.drop_from_inventory(W)
		fueltank = W
		W.anchored = TRUE
		to_chat(user, "你将\the [W]连接到[src].")
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		return
	else
		..()

/obj/structure/engine/internal/verb/remove_fueltank()
	set category = null
	set name = "Remove Fueltank"
	set src in range(1, usr)

	if (!ishuman(usr))
		return

	if (fueltank == null)
		return

	else
		if (map && map.ID == MAP_THE_ART_OF_THE_DEAL)
			if (usr.original_job_title == "Mechanic")
				on = FALSE
				power_off_connections()
				fueltank.anchored = FALSE
				to_chat(usr, "你断开了[src]上的燃料箱.")
				fueltank = null
				update_icon()
				return
			else
				to_chat(usr, SPAN_WARNING("You do not know how to do this."))
				return

		on = FALSE
		power_off_connections()
		fueltank.anchored = FALSE
		to_chat(usr, "你断开了[src]上的燃料箱.")
		fueltank = null
		update_icon()
		return

/obj/structure/engine/internal/turn_on(var/mob/user = null)
	if (on)
		return
	if (broken)
		to_chat(user, "\The [src]已损坏, 你无法启动它!")
		return
	if (fueltank != null)
		var/done = FALSE
		for (var/F in fuels)
			if (fueltank && fueltank.reagents && fueltank.reagents.has_reagent(F, fuelefficiency*5) && done == FALSE)
				if (user)
					visible_message("[user]打开了[src].","你打开了[src].")
					on = TRUE
				playsound(loc, starting_snd, 35, FALSE, 3)
				spawn(starting_snd_len)
					running_sound()
					update_icon() //Having the update_icon here means that the icon for it being on doesn't start until after the spawn which is arguably a downside, maybe patchable
					running()
					for (var/obj/structure/cable/CB in connections)
						CB.power_on(maxpower)
					done = TRUE
	return


/obj/structure/engine/internal/running()
	if (on)
		var/done = FALSE
		var/fuelconsumption = fuelefficiency*(min(currentpower, maxpower)/maxpower)*FUEL_CONSUMPTION_MODIFIER //fuelconsumption is based on current load
		for (var/F in fuels)
			if (fueltank && fueltank.reagents && fueltank.reagents.has_reagent(F, fuelconsumption) && done == FALSE)
				fueltank.reagents.remove_reagent(F, fuelconsumption)
				//add polution to global meter
				//change_global_pollution(fuelconsumption)
				done = TRUE
		if (broken)
			on = FALSE
			power_off_connections()
			currentspeed = 0
			currentpower = 0
			update_icon()
			return
		if (!done)
			visible_message("引擎熄火了.")
			playsound(loc, ending_snd, 100, FALSE, 3)
			on = FALSE
			power_off_connections()
			currentspeed = 0
			currentpower = 0
			update_icon()
			return
		else
			currentpower = process_power_output()

		spawn(10)
			running()
	return

///////////////////////ENGINES//////////////////////////////////////////////
/obj/structure/engine/internal/hotbulb
	name = "热球引擎"
	desc = "一个大型且效率略低的引擎, 几乎可以依靠任何液体燃料运行."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "hotbulb_static"
	engineclass = "hotbulb"

	maxpower = 66
	torque = 1.1
	fuelefficiency = 0.5
	fuels = list("petroleum", "gasoline", "diesel", "pethanol", "biodiesel", "olive_oil", "fat_oil") //basically everything

/obj/structure/engine/internal/gasoline
	name = "四冲程汽油引擎"
	desc = "一个相对便宜的四冲程汽油引擎."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline_static"
	engineclass = "gasoline"

	maxpower = 100
	torque = 0.9
	fuelefficiency = 0.3
	fuels = list("gasoline")

	starting_snd = 'sound/machines/gasoline_starting.ogg'
	running_snd = 'sound/machines/gasoline_loop.ogg'
	ending_snd = 'sound/machines/gasoline_ending.ogg'

/obj/structure/engine/internal/gasoline/efficient
	name = "高效四冲程汽油引擎"
	desc = "一个相对昂贵但高效的四冲程汽油引擎."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline_static"
	engineclass = "gasoline"

	maxpower = 500
	torque = 5
	fuelefficiency = 0.001
	fuels = list("gasoline")

	starting_snd = 'sound/machines/gasoline_starting.ogg'
	running_snd = 'sound/machines/gasoline_loop.ogg'
	ending_snd = 'sound/machines/gasoline_ending.ogg'

/obj/structure/engine/internal/gasoline/twostroke
	name = "二冲程汽油引擎"
	desc = "一个便宜且简单的二冲程汽油引擎."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline_static"
	engineclass = "gasoline"

	maxpower = 90
	torque = 0.83
	fuelefficiency = 0.38
	fuels = list("gasoline")

/obj/structure/engine/internal/gasoline/sixstroke
	name = "六冲程汽油引擎"
	desc = "一个非常高效但昂贵的汽油引擎. 燃料效率良好."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline6_static"
	engineclass = "gasoline6"

	maxpower = 90
	torque = 0.92
	fuelefficiency = 0.25
	fuels = list("gasoline")

/obj/structure/engine/internal/gasoline/ethanol
	name = "四冲程汽油-乙醇引擎"
	desc = "一个相对便宜的四冲程汽油引擎, 经过改装后也能使用乙醇. 可以使用两种燃料, 但效率大约低15%."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "gasoline_static"
	engineclass = "gasoline"

	maxpower = 86
	torque = 0.77
	fuelefficiency = 0.35
	fuels = list("gasoline","pethanol")

/obj/structure/engine/internal/gasoline/wankel
	name = "汪克尔转子汽油引擎"
	desc = "一个略显复杂的转子引擎. 功率重量比非常高, 但燃料经济性差."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "wankel_static"
	engineclass = "wankel"

	maxpower = 150
	torque = 0.83
	fuelefficiency = 0.37
	fuels = list("gasoline")

	starting_snd = 'sound/machines/gasoline_starting.ogg'
	running_snd = 'sound/machines/gasoline_loop.ogg'
	ending_snd = 'sound/machines/gasoline_ending.ogg'

/obj/structure/engine/internal/turbine
	name = "涡轮引擎"
	desc = "一个使用空气压缩机的涡轮引擎. 功率重量比高, 可以使用多种燃料, 但燃料经济性差."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "turbine_static"
	engineclass = "turbine"

	maxpower = 136
	torque = 0.88
	fuelefficiency = 0.4
	fuels = list("petroleum", "gasoline", "diesel", "pethanol", "biodiesel", "olive_oil", "fat_oil")

	starting_snd = 'sound/machines/atomic_turbine_exterior_starting.ogg'
	running_snd = 'sound/machines/atomic_turbine_exterior_loop.ogg'
	ending_snd = 'sound/machines/atomic_turbine_exterior_ending.ogg'

	starting_snd_len = 39
	running_snd_len = 37

/obj/structure/engine/internal/diesel
	name = "柴油引擎"
	desc = "一个重型柴油引擎, 使用压缩而非火花塞点火. 扭矩和燃料效率高."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "diesel_static"
	engineclass = "diesel"

	maxpower = 80
	torque = 1.25
	fuelefficiency = 0.22
	fuels = list("diesel")

/obj/structure/engine/internal/diesel/biodiesel
	name = "柴油引擎"
	desc = "一个重型柴油引擎, 使用压缩而非火花塞点火. 扭矩和燃料效率高. 经过改装后也能使用生物柴油, 但效率低10%."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "diesel_static"
	engineclass = "diesel"

	maxpower = 72
	torque = 1.12
	fuelefficiency = 0.245
	fuels = list("diesel","biodiesel")

/obj/structure/engine/internal/hesselman
	name = "赫塞尔曼引擎"
	desc = "一个汽油和柴油的混合引擎. 功率重量比优于柴油但效率较低. 可以使用汽油, 柴油和生物柴油."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "diesel_static"
	engineclass = "diesel"

	maxpower = 86
	torque = 1.08
	fuelefficiency = 0.37
	fuels = list("diesel","biodiesel","gasoline")

#undef FUEL_CONSUMPTION_MODIFIER
