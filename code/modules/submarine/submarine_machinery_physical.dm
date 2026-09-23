// All physical submarine machinery. Processed once per second by
// /process/submarine — NOT via processing_objects, which would make
// /process/obj call process() on these a second time.
var/global/list/sub_physical_machines = list()

/obj/structure/machinery/sub_physical
	name = "潜艇机械"
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "transponder"
	density = TRUE
	anchored = TRUE
	var/health = 100
	var/max_health = 100
	var/panel_open = FALSE
	var/datum/submarine/my_sub

/obj/structure/machinery/sub_physical/New()
	..()
	if(global.all_submarines.len)
		my_sub = global.all_submarines[1]
	sub_physical_machines += src

/obj/structure/machinery/sub_physical/Destroy()
	sub_physical_machines -= src
	..()

/obj/structure/machinery/sub_physical/proc/can_use_sub(mob/user)
	// Ghost/dead check: allowed only in single-player mode (skip distance check)
	if(user.stat == DEAD || isobserver(user))
		var/obj/map_metadata/subcom13/SM = map
		if(istype(SM) && SM.single_player)
			return TRUE
		return FALSE
	// Standard check: alive, adjacent, not incapacitated
	if(user.incapacitated() || user.lying) return FALSE
	if(get_dist(user, src) > 1) return FALSE
	return TRUE

/obj/structure/machinery/sub_physical/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	..()

/obj/structure/machinery/sub_physical/attack_ghost(mob/observer/ghost/user)
	var/obj/map_metadata/subcom13/SM = map
	if(istype(SM) && SM.single_player)
		attack_hand(user)
		return
	..()

/obj/structure/machinery/sub_physical/proc/get_efficiency()
	return max(0, health / max_health)

/obj/structure/machinery/sub_physical/attackby(obj/item/W, mob/user)
	// Screwdriver: Open/Close Panels
	if(istype(W, /obj/item/weapon/screwdriver))
		panel_open = !panel_open
		user.visible_message("<span class='notice'>[user][panel_open ? "opens" : "closes"][src]上的维护面板.</span>")
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		return

	// Wrench: Secure/Unsecure (Logic for specific components)
	if(istype(W, /obj/item/weapon/wrench))
		anchored = !anchored
		user.visible_message("<span class='notice'>[user] [anchored ? "secures" : "unsecures"] [src].</span>")
		playsound(src.loc, 'sound/items/ratchet.ogg', 50, 1)
		return

	// Welder: Repair structural damage
	if(istype(W, /obj/item/weapon/weldingtool))
		if(health < max_health)
			user.visible_message("<span class='notice'>[user]开始用[W]修理[src].</span>")
			if(do_after(user, 40, src))
				health = min(max_health, health + 20)
				to_chat(user, "<span class='notice'>你修复了[src]上的一些结构损伤.</span>")
		else
			to_chat(user, "<span class='notice'>[src]已经处于良好状态.</span>")
		return

	// Multitool: Diagnostic check
	if(istype(W, /obj/item/weapon/wirecutters) || istype(W, /obj/item/weapon/screwdriver))
		to_chat(user, "<span class='notice'><b>[src]的诊断输出:</b></span>")
		to_chat(user, "<span class='notice'>完整度:[health]/[max_health] ([get_efficiency()*100]%)</span>")
		return

	..()

/* --- STRUCTURAL BASE --- */
// Used for non-processing structures like beds and lockers
/obj/structure/sub_physical
	name = "潜艇结构"
	icon = 'icons/obj/machines/submarine.dmi'
	density = TRUE
	anchored = TRUE
	var/health = 100
	var/max_health = 100
	var/datum/submarine/my_sub

/obj/structure/sub_physical/New()
	..()
	if(global.all_submarines.len)
		my_sub = global.all_submarines[1]

/obj/structure/sub_physical/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/weldingtool))
		if(health < max_health)
			user.visible_message("<span class='notice'>[user]修理了[src].</span>")
			if(do_after(user, 30, src))
				health = min(max_health, health + 25)
		return
	if(istype(W, /obj/item/weapon/screwdriver) || istype(W, /obj/item/weapon/wirecutters))
		to_chat(user, "<span class='notice'>完整度:[health]%</span>")
		return
	..()

// --- 1. REACTOR CORE ---

/obj/structure/machinery/sub_physical/reactor_core
	name = "核反应堆核心"
	desc = "潜艇嗡嗡作响的心脏.如果警示灯闪烁,请远离."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "reactor_0"
	health = 340
	max_health = 340
	var/id = 1 // Reactor 1 or 2
	var/last_rad_message_time = 0
	var/shielding = 100

/obj/structure/machinery/sub_physical/reactor_core/process()
	if(!my_sub) return

	var/core_temp = my_sub.r_core_temp[id]

	// Flooding damage: water on the reactor core causes radiation leaks
	var/turf/floor/sub_deck/my_turf = get_turf(src)
	if(istype(my_turf) && my_turf.water_depth > 30)
		radiation_pulse()
		if(prob(10))
			visible_message("<span class='danger'>[src]在海水接触过热的堆芯时发出嘶嘶声!</span>")
		// Direct damage from thermal shock
		health = max(0, health - my_turf.water_depth * 0.02)
	
	// Meltdown and Damage Logic
	if(health < (max_health * 0.5) || core_temp > 1000)
		radiation_pulse()

/obj/structure/machinery/sub_physical/reactor_core/proc/radiation_pulse()
	for(var/mob/living/L in range(3, src))
		L.rad_act(8) // ~8 rads per tick near a damaged core
	if(world.time > last_rad_message_time + 100)
		last_rad_message_time = world.time
		for(var/mob/living/L in range(3, src))
			to_chat(L, "<span class='danger'>空气感觉沉重而带有金属味...</span>")

	if(prob(5))
		visible_message("<span class='warning'>[src]释放出一阵电离辐射!</span>")

// --- 2. COOLANT PUMP ---

/obj/structure/machinery/sub_physical/coolant_pump
	name = "冷却剂循环泵"
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "smes2"
	var/pump_id = 1
	var/is_primary = TRUE // TRUE = Primary, FALSE = Secondary

/obj/structure/machinery/sub_physical/coolant_pump/process()
	if(!my_sub) return

	var/eff = get_efficiency()
	
	// Degrade global performance based on physical health
	if(is_primary)
		if(my_sub.r_primary_pump_speed[pump_id] > (18 * eff))
			my_sub.r_primary_pump_speed[pump_id] = round(18 * eff)
	else
		if(my_sub.r_secondary_pump_speed[pump_id] > (10 * eff))
			my_sub.r_secondary_pump_speed[pump_id] = round(10 * eff)

	if(health <= 0)
		visible_message("<span class='danger'>[src]伴随着刺耳的金属尖啸声卡死了!</span>")
		if(is_primary) my_sub.r_primary_pump_speed[pump_id] = 0
		else my_sub.r_secondary_pump_speed[pump_id] = 0

// --- 3. STEAM TURBINE ---

/obj/structure/machinery/sub_physical/steam_turbine
	name = "主推进蒸汽轮机"
	icon = 'icons/obj/engines64.dmi'
	icon_state = "turbine_double"
	health = 200
	max_health = 200
	var/gearbox_integrity = 100

/obj/structure/machinery/sub_physical/steam_turbine/process()
	if(!my_sub) return

	var/eff = get_efficiency()
	var/max_possible_speed = 30 * eff

	// Cap sub target speed based on physical health
	if(my_sub.target_speed > max_possible_speed)
		my_sub.target_speed = max_possible_speed
		if(prob(10))
			to_chat(viewers(src), "<span class='warning'>轮机在受损叶片的应力下呻吟!</span>")

	// Ambient sound logic
	if(my_sub.speed > 20 && prob(5))
		playsound(src.loc, 'sound/effects/doorcreaky.ogg', 40, 1)

// --- 4. DIESEL ENGINE ---

/obj/structure/machinery/sub_physical/diesel_engine
	name = "备用柴油发电机"
	icon = 'icons/obj/engines64.dmi'
	icon_state = "engine"
	health = 150
	max_health = 150
	var/carbon_buildup = 0

/obj/structure/machinery/sub_physical/diesel_engine/process()
	if(!my_sub) return

	// Flooding: water kills the diesel engine
	var/turf/floor/sub_deck/my_turf = get_turf(src)
	if(istype(my_turf) && my_turf.water_depth > 30)
		if(my_sub.diesel_throttle > 0)
			my_sub.diesel_throttle = 0
			visible_message("<span class='danger'>[src]在海水淹没发动机时噼啪作响后熄火!</span>")
			playsound(src.loc, 'sound/machines/submarine/dgenstop.ogg', 70, 1)
		health -= my_turf.water_depth * 0.05
		return

	// Throttle-based maintenance logic
	if(my_sub.diesel_throttle > 0 && my_sub.diesel_throttle < 40)
		carbon_buildup += 0.1
	
	// Carbon buildup reduces efficiency
	if(carbon_buildup > 50)
		health -= 0.05

	// High throttle risk
	if(my_sub.diesel_throttle >= 95 && health < 100)
		if(prob(2))
			visible_message("<span class='danger'>[src]在过热时喷出火花!</span>")
			playsound(src.loc, 'sound/machines/submarine/dgenstop.ogg', 50, 1)

// --- 4b. DIESEL PROPULSION MOTOR ---
// Used on diesel-only submarines. Converts diesel engine output to propeller thrust.
// Only functional when surfaced and diesel throttle is engaged.

/obj/structure/machinery/sub_physical/diesel_propulsion
	name = "柴电推进电动机"
	desc = "一台连接到螺旋桨轴的重型电力牵引电动机.由柴油发电机供电."
	icon = 'icons/obj/engines64.dmi'
	icon_state = "engine"
	health = 200
	max_health = 200
	var/motor_temp = 20

/obj/structure/machinery/sub_physical/diesel_propulsion/process()
	if(!my_sub) return
	if(my_sub.has_nuclear_engine) return  // Should not exist on nuclear subs

	// Flooding: water kills the propulsion motor
	var/turf/floor/sub_deck/my_turf = get_turf(src)
	if(istype(my_turf) && my_turf.water_depth > 30)
		if(my_sub.diesel_throttle > 0)
			my_sub.diesel_throttle = 0
			visible_message("<span class='danger'>[src]在海水淹没电动机时伴随着一阵火花卡死了!</span>")
			playsound(src.loc, 'sound/machines/submarine/dgenstop.ogg', 70, 1)
		health -= my_turf.water_depth * 0.03
		return

	var/eff = get_efficiency()

	// Diesel-only propulsion: max speed is capped by motor health
	if(my_sub.depth == 0 && my_sub.diesel_throttle > 0 && my_sub.diesel_fuel > 0)
		var/max_possible_speed = SUB_MAX_SPEED_DIESEL * eff
		if(my_sub.target_speed > max_possible_speed)
			my_sub.target_speed = max_possible_speed
			if(prob(5))
				visible_message("<span class='warning'>推进电动机在负载下发出呜呜声!</span>")

		// Motor heating from high throttle
		if(my_sub.diesel_throttle > 70)
			motor_temp += 0.5
		else
			motor_temp = max(SUB_AMBIENT_TEMP, motor_temp - 0.3)

		// Overheating damage
		if(motor_temp > 80)
			health -= 0.1
			if(prob(3))
				visible_message("<span class='warning'>[src]散发出绝缘层烧焦的气味!</span>")

		// Motor damage limits output
		if(health <= 0)
			my_sub.diesel_throttle = 0
			visible_message("<span class='danger'>[src]伴随着一阵火花卡死了!推进力丧失!</span>")
	else
		// Cooldown when idle
		motor_temp = max(SUB_AMBIENT_TEMP, motor_temp - 0.5)

// --- 5. BILGE PUMP ---
// Reworked to use typed water_depth on /turf/floor/sub_deck.
// Drains water from the turf it sits on and adjacent connected turfs.

/obj/structure/machinery/sub_physical/bilge_pump
	name = "舱底泵"
	desc = "一台用于从进水舱室排出海水的大容量离心泵."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "bilge_pump"
	health = 80
	max_health = 80
	var/active = FALSE
	var/drain_rate = 10            // cm of water removed per tick
	var/power_draw = 15            // kW per tick when active
	var/drain_range = 1            // How many turfs away it can drain (1 = adjacent only)

/obj/structure/machinery/sub_physical/bilge_pump/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(!my_sub) return
	active = !active
	if(active)
		icon_state = "[initial(icon_state)]_on"
		to_chat(user, "<span class='notice'>你打开了[src].它嗡嗡作响地启动了.</span>")
		playsound(src.loc, 'sound/machines/machine_switch.ogg', 50, 1)
	else
		icon_state = initial(icon_state)
		to_chat(user, "<span class='notice'>你关闭了[src].</span>")
		playsound(src.loc, 'sound/machines/click.ogg', 50, 1)

/obj/structure/machinery/sub_physical/bilge_pump/process()
	if(!active || health <= 0) return
	if(!my_sub) return

	// Check power: bilge pumps need battery power
	if(my_sub.battery_current < power_draw)
		active = FALSE
		icon_state = initial(icon_state)
		visible_message("<span class='warning'>[src]噼啪作响后停机 - 电力不足.</span>")
		playsound(src.loc, 'sound/machines/submarine/alarm_flooding.ogg', 40, 1)
		return

	my_sub.battery_current -= power_draw

	// Find the turf we're on and drain it
	var/turf/floor/sub_deck/my_turf = get_turf(src)
	if(!my_turf || !istype(my_turf)) return

	// Drain our own tile
	if(my_turf.water_depth > 0)
		var/amount = min(my_turf.water_depth, drain_rate)
		my_turf.remove_water(amount)

	// Drain adjacent tiles within range
	if(drain_range > 0)
		for(var/direction in list(NORTH, SOUTH, EAST, WEST))
			var/turf/floor/sub_deck/neighbor = get_step(my_turf, direction)
			if(neighbor && istype(neighbor) && !neighbor.water_sealed)
				if(neighbor.water_depth > 0)
					var/amount = min(neighbor.water_depth, drain_rate * 0.5)
					neighbor.remove_water(amount)

	// Visual feedback: pump is working hard if there's lots of water
	if(my_turf.water_depth > 50 && prob(10))
		visible_message("<span class='notice'>[src]在上涨的水位中吃力地发出咕噜声.</span>")

// --- 5b. EMERGENCY BILGE PUMP ---
// A smaller, emergency-only pump. Slower but doesn't need as much power.

/obj/structure/machinery/sub_physical/bilge_pump/emergency
	name = "应急舱底泵"
	desc = "一台手动启动的备用泵.速度慢,但总比淹死好."
	icon_state = "bilge_pump_small"
	drain_rate = 5
	power_draw = 8
	drain_range = 0  // Only drains the tile it's on

// ============================================================
// VENTILATION SYSTEM
// ============================================================

// --- 5c. VENT DUCT ---
// Links deck turfs into a ventilation network. Air equalizes
// across all turfs in the same vent_id network.

/obj/structure/machinery/sub_physical/vent_duct
	name = "通风管道"
	desc = "一条连接各舱室与中央通风系统的重型通风管道."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "vent"
	health = 60
	max_health = 60
	density = FALSE
	var/vent_id = "main"           // Network ID - all ducts with same vent_id are connected
	var/flow_rate = 0.3            // Lerp factor for air equalization (0 = no flow, 1 = instant)
	var/active = TRUE

// Predefined vent ducts - one per compartment, each with its own air network
/obj/structure/machinery/sub_physical/vent_duct/fwd_torpedo
	name = "通风管道 - 前部鱼雷舱"
	vent_id = "fwd_torpedo"

/obj/structure/machinery/sub_physical/vent_duct/storage
	name = "通风管道 - 储藏室"
	vent_id = "storage"

/obj/structure/machinery/sub_physical/vent_duct/operations
	name = "通风管道 - 作战室"
	vent_id = "operations"

/obj/structure/machinery/sub_physical/vent_duct/medical_bay
	name = "通风管道 - 医疗舱"
	vent_id = "medical_bay"

/obj/structure/machinery/sub_physical/vent_duct/galley
	name = "通风管道 - 厨房"
	vent_id = "galley"

/obj/structure/machinery/sub_physical/vent_duct/central_corridor
	name = "通风管道 - 中央走廊"
	vent_id = "central_corridor"

/obj/structure/machinery/sub_physical/vent_duct/rear_corridor
	name = "通风管道 - 后部走廊"
	vent_id = "rear_corridor"

/obj/structure/machinery/sub_physical/vent_duct/reactor_room
	name = "通风管道 - 反应堆室"
	vent_id = "reactor_room"

/obj/structure/machinery/sub_physical/vent_duct/engine_room
	name = "通风管道 - 引擎室"
	vent_id = "engine_room"

/obj/structure/machinery/sub_physical/vent_duct/New()
	..()
	// Register with the flooding controller
	if(global.subcom_flooding)
		var/turf/floor/sub_deck/my_turf = get_turf(src)
		if(my_turf && istype(my_turf))
			global.subcom_flooding.register_vent(vent_id, my_turf)

/obj/structure/machinery/sub_physical/vent_duct/Destroy()
	if(global.subcom_flooding)
		var/turf/floor/sub_deck/my_turf = get_turf(src)
		if(my_turf && istype(my_turf))
			global.subcom_flooding.unregister_vent(vent_id, my_turf)
	..()

/obj/structure/machinery/sub_physical/vent_duct/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	active = !active
	if(active)
		to_chat(user, "<span class='notice'>你打开了通风管道.空气开始流通.</span>")
		playsound(src.loc, 'sound/machines/submarine/gas.ogg', 40, 1)
	else
		to_chat(user, "<span class='notice'>你关闭了通风管道.气流停止.</span>")

/obj/structure/machinery/sub_physical/vent_duct/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/weapon/weldingtool))
		if(health < max_health)
			user.visible_message("<span class='notice'>[user]修理了[src].</span>")
			if(do_after(user, 25, src))
				health = min(max_health, health + 20)
		return
	if(istype(W, /obj/item/weapon/screwdriver) || istype(W, /obj/item/weapon/wirecutters))
		to_chat(user, "<span class='notice'>网络:[vent_id] | 状态:[active ? "OPEN" : "CLOSED"]</span>")
		return
	..()

// --- 5d. SCRUBBER ---
// Actively removes CO2 and optionally injects O2.
// Higher power draw than passive vents.

/obj/structure/machinery/sub_physical/scrubber
	name = "二氧化碳洗涤器"
	desc = "一台活性炭过滤装置,用于去除空气中的二氧化碳."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "airfilter2"
	health = 70
	max_health = 70
	var/active = FALSE
	var/power_draw = 25            // kW per tick
	var/scrub_rate = 0.5           // Moles of CO2 removed per tick
	var/inject_o2 = FALSE          // If TRUE, also injects O2 (from electrolysis)
	var/o2_inject_rate = 0.2       // Moles of O2 added per tick when inject_o2 is TRUE
	var/scrub_channel = 0

/obj/structure/machinery/sub_physical/scrubber/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(!my_sub) return
	active = !active
	if(active)
		to_chat(user, "<span class='notice'>你启动了[src].它开始过滤空气.</span>")
		playsound(src.loc, 'sound/machines/submarine/gas.ogg', 40, 1)
		var/sound/S = sound('sound/machines/submarine/scrubber_hum.ogg', repeat = TRUE, wait = 0, volume = 15, channel = 772)
		scrub_channel = 772
		src << S
	else
		to_chat(user, "<span class='notice'>你关闭了[src].</span>")
		if(scrub_channel)
			src << sound(null, channel = scrub_channel)
			scrub_channel = 0

/obj/structure/machinery/sub_physical/scrubber/process()
	if(!active || health <= 0) return
	if(!my_sub) return

	// Power check
	if(my_sub.battery_current < power_draw)
		active = FALSE
		visible_message("<span class='warning'>[src]停机 - 电力不足.</span>")
		if(scrub_channel)
			src << sound(null, channel = scrub_channel)
			scrub_channel = 0
		return

	my_sub.battery_current -= power_draw

	// Scrub CO2 from all turfs in the compartment
	var/turf/floor/sub_deck/my_turf = get_turf(src)
	if(!my_turf || !istype(my_turf)) return
	if(!my_turf.compartment_id) return

	if(global.subcom_flooding)
		var/list/comp_turfs = global.subcom_flooding.compartment_turfs[my_turf.compartment_id]
		if(comp_turfs)
			for(var/turf/floor/sub_deck/T in comp_turfs)
				T.co2_moles = max(0, T.co2_moles - scrub_rate)
				if(inject_o2)
					T.oxygen_moles = min(30, T.oxygen_moles + o2_inject_rate)

// --- 5e. HULL BREACH SEALANT SPRAYER ---
// Emergency tool: sprays a fast-curing polymer to seal small hull breaches.

/obj/structure/machinery/sub_physical/breach_sealant
	name = "船体破损密封剂喷洒器"
	desc = "一种自动喷雾器,用于在受损的船体部位覆盖快速固化的聚合物密封剂."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "sealant"
	health = 50
	max_health = 50
	var/sealant_remaining = 100    // Uses of sealant left
	var/power_draw = 10            // kW per tick
	var/active = FALSE

// Predefined sealant sprayers - one per compartment
/obj/structure/machinery/sub_physical/breach_sealant/fwd_torpedo
	name = "密封剂喷雾器 - 前部鱼雷舱"
/obj/structure/machinery/sub_physical/breach_sealant/storage
	name = "密封剂喷雾器 - 储藏室"
/obj/structure/machinery/sub_physical/breach_sealant/operations
	name = "密封剂喷雾器 - 作战室"
/obj/structure/machinery/sub_physical/breach_sealant/medical_bay
	name = "密封剂喷雾器 - 医疗舱"
/obj/structure/machinery/sub_physical/breach_sealant/galley
	name = "密封剂喷雾器 - 厨房"
/obj/structure/machinery/sub_physical/breach_sealant/central_corridor
	name = "密封剂喷雾器 - 中央走廊"
/obj/structure/machinery/sub_physical/breach_sealant/rear_corridor
	name = "密封剂喷雾器 - 后部走廊"
/obj/structure/machinery/sub_physical/breach_sealant/reactor_room
	name = "密封剂喷雾器 - 反应堆室"
/obj/structure/machinery/sub_physical/breach_sealant/engine_room
	name = "密封剂喷雾器 - 引擎室"

/obj/structure/machinery/sub_physical/breach_sealant/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(!my_sub) return
	if(sealant_remaining <= 0)
		to_chat(user, "<span class='warning'>密封剂储备已耗尽!</span>")
		return
	active = !active
	if(active)
		to_chat(user, "<span class='notice'>你启动了[src]. 它开始扫描破损处.</span>")
	else
		to_chat(user, "<span class='notice'>你关闭了[src].</span>")

/obj/structure/machinery/sub_physical/breach_sealant/process()
	if(!active || health <= 0) return
	if(!my_sub) return
	if(sealant_remaining <= 0)
		active = FALSE
		return

	// Power check
	if(my_sub.battery_current < power_draw)
		active = FALSE
		return

	my_sub.battery_current -= power_draw

	// Scan adjacent turfs for breached hull walls and attempt to seal
	for(var/direction in list(NORTH, SOUTH, EAST, WEST))
		var/turf/wall/sub_hull/hull = get_step(src, direction)
		if(hull && istype(hull) && hull.breached)
			hull.repair_breach()
			sealant_remaining--
			visible_message("<span class='notice'>[src]将密封剂喷涂到船体破损处. 密封剂在固化时发出嘶嘶声.</span>")
			playsound(src.loc, 'sound/machines/submarine/gas.ogg', 60, 1)
			break  // One repair per tick

// --- 5f. BALLAST CONTROL VALVE ---
// Controls water intake for dive planes. Fills/empties ballast tanks.

/obj/structure/machinery/sub_physical/ballast_valve
	name = "压载控制阀"
	desc = "一个重型阀门,用于控制海水流入压载水舱."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "ballast"
	health = 100
	max_health = 100
	var/valve_open = FALSE
	var/fill_rate = 5              // cm of water moved per tick

/obj/structure/machinery/sub_physical/ballast_valve/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(!my_sub) return
	valve_open = !valve_open
	if(valve_open)
		to_chat(user, "<span class='notice'>你打开了压载阀. 水开始涌入水舱.</span>")
		playsound(src.loc, 'sound/machines/submarine/valve_turn.ogg', 50, 1)
	else
		to_chat(user, "<span class='notice'>你关闭了压载阀.</span>")
		playsound(src.loc, 'sound/machines/submarine/valve_turn.ogg', 50, 1)

/obj/structure/machinery/sub_physical/ballast_valve/process()
	if(!valve_open || health <= 0) return
	if(!my_sub) return

	// Ballast fill affects the sub's depth control
	// Each tick, add ballast weight to simulate flooding the tanks
	my_sub.ballast = min(my_sub.ballast + fill_rate, 50)  // Max 50 tons of ballast

// --- 6. TORPEDO TUBE ---

/obj/structure/props/torpedo_tube
	name = "鱼雷发射管"
	desc = "舰船的鱼雷发射管."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "torpedo_tube2"

/obj/structure/machinery/sub_physical/torpedo_tube
	name = "鱼雷发射管"
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "torpedo_tube1"
	var/tube_id = 1 // 1-4
	var/is_loaded = FALSE

/obj/structure/machinery/sub_physical/torpedo_tube/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(!my_sub) return

	to_chat(user, "<span class='notice'>发射管[tube_id]状态: [my_sub.tubes_loaded[tube_id] ? "LOADED" : "EMPTY"]</span>")

/obj/structure/machinery/sub_physical/torpedo_tube/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/torpedo))
		if(my_sub.tubes_loaded[tube_id])
			to_chat(user, "<span class='warning'>发射管[tube_id]已经装填完毕.</span>")
			return
		
		user.visible_message("<span class='notice'>[user]开始将[I]滑入发射管[tube_id].</span>")
		if(do_after(user, 60, src))
			user.drop_item()
			qdel(I)
			my_sub.tubes_loaded[tube_id] = TRUE
			icon_state = "torpedo_tube1_closed"
			to_chat(user, "<span class='notice'>发射管[tube_id]现在可以发射了.</span>")
		return

	// Service/Unload
	if(istype(I, /obj/item/weapon/crowbar) || istype(I, /obj/item/weapon/wrench))
		if(my_sub.tubes_loaded[tube_id])
			user.visible_message("<span class='notice'>[user]开始手动从发射管[tube_id]中取出鱼雷.</span>")
			if(do_after(user, 80, src))
				my_sub.tubes_loaded[tube_id] = FALSE
				icon_state = "torpedo_tube1"
				new /obj/item/weapon/torpedo(src.loc)
				to_chat(user, "<span class='notice'>你成功卸载了发射管.</span>")
		return

	..()

// --- 7. BUNK BED ---

/obj/structure/bed/bunk
	name = "船员铺位"
	desc = "一个狭窄但必不可少的潜艇船员休息区."
	icon = 'icons/obj/bed_chair.dmi'
	icon_state = "bunk_bed"
	material = "steel"
	applies_material_colour = FALSE

// --- 8. GALLEY ---

/obj/structure/machinery/sub_physical/galley
	name = "厨房食物处理器"
	desc = "分配浓缩营养糊和合成饮料."
	icon = 'icons/obj/vending.dmi'
	icon_state = "hotfood"
	var/food_stored = 50

/obj/structure/machinery/sub_physical/galley/attack_hand(mob/user)
	if(!can_use_sub(user)) return
	if(health < 30)
		to_chat(user, "<span class='warning'>处理器损坏严重,无法运行.</span>")
		return
	if(food_stored <= 0)
		to_chat(user, "<span class='notice'>厨房补给已耗尽.</span>")
		return

	food_stored--
	to_chat(user, "<span class='notice'>机器发出哐当声,产出了一份营养口粮.</span>")
	new /obj/item/weapon/reagent_containers/food/snacks/MRE/generic(src.loc)

// --- 9. EQUIPMENT STORAGE (converted to vendor in vending.dm) ---

// --- 10. TORPEDO FUEL STORAGE (HTP) ---

/obj/structure/machinery/sub_physical/fuel_storage
	name = "高浓度过氧化氢燃料罐"
	desc = "含有高浓度过氧化氢. 极不稳定."
	icon = 'icons/obj/barrel.dmi'
	icon_state = "htp"
	health = 80
	var/htp_volume = 100
	var/temperature = 20

/obj/structure/machinery/sub_physical/fuel_storage/process()
	var/turf/T = get_turf(src)
	
	// External heating
	for(var/obj/effect/fire/F in T)
		temperature += 5

	// Volatility Logic
	if(health < 30 || temperature > 45)
		if(prob(20))
			T.visible_message("<span class='warning'>有毒的过氧化氢烟雾从[src]中嘶嘶喷出!</span>")
			// Simulate toxic leak
			for(var/mob/living/L in range(2, src))
				L.apply_damage(2, TOX)

	if(health <= 0 || temperature > 70)
		explode()

/obj/structure/machinery/sub_physical/fuel_storage/proc/explode()
	visible_message("<span class='danger'><b>[src]灾难性地破裂了!</b></span>")
	playsound(src.loc, 'sound/machines/submarine/fire.ogg', 100, 1)
	playsound(src.loc, 'sound/machines/submarine/nuke_exp.ogg', 100, 1)
	explosion(src.loc, 1, 2, 4)
	qdel(src)

// --- 11. STERN PLANE ---

/obj/structure/sub_physical/stern_plane
	name = "尾部水平舵"
	desc = "用于转向的外部水翼. 需要浮出水面进行维护."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "placeholder_plane"
	var/plane_side = "port"

/obj/structure/sub_physical/stern_plane/New()
	..()
	if(my_sub)
		my_sub.stern_planes += src

/obj/structure/sub_physical/stern_plane/attackby(obj/item/W, mob/user)
	if(my_sub && my_sub.depth > 0)
		to_chat(user, "<span class='warning'>在水下时你无法触及外部水平舵!</span>")
		return
	..()
	update_sub_efficiency()

/obj/structure/sub_physical/stern_plane/proc/update_sub_efficiency()
	if(!my_sub || !my_sub.stern_planes.len) return
	var/total_health = 0
	for(var/obj/structure/sub_physical/stern_plane/SP in my_sub.stern_planes)
		total_health += (SP.health / SP.max_health)
	my_sub.steering_efficiency = total_health / my_sub.stern_planes.len


// Dummy item for torpedo implementation
/obj/item/weapon/torpedo
	name = "Mk.48鱼雷"
	desc = "一种大型重型声学制导鱼雷."
	icon = 'icons/obj/machines/submarine.dmi'
	icon_state = "torpedo_item"
	w_class = 5.0 // Heavy

