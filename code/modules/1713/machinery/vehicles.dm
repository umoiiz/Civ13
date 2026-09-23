
/obj/structure/vehicleparts
	name = "载具部件"
	desc = "一个基础载具部件。"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "part"
	anchored = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	flammable = FALSE
	var/broken_icon = 'icons/obj/vehicles/vehicleparts_damaged.dmi'
	var/normal_icon = 'icons/obj/vehicles/vehicleparts.dmi'
	var/datum/wheel_config/wconfig = null
/////////////////////////////////AXIS/////////////////////////////////////
/obj/structure/vehicleparts/axis
	name = "载具车轴"
	desc = "用于支撑车轮。"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "axis_powered"
	var/vehicle_type = "car"
	var/list/obj/structure/vehicleparts/movement/wheels = list()
	var/currentspeed = 0
	var/speeds = 5
	var/maxpower = 50
	var/list/speedlist = alist(1=6,2=5,3=4,4=3,5=2)
	powerneeded = 0
	var/obj/structure/engine/engine = null
	var/moving = FALSE
	var/vehicle_m_delay = 1
	var/obj/item/vehicleparts/wheel/modular/wheel = null
	var/reverse = FALSE
	var/list/atom/movable/transporting = list()
	var/list/obj/structure/vehicleparts/components = list()
	var/current_weight = 5
	var/lastmovementloop = 0
	var/mob/living/human/driver = null

	//matrix/turning stuff
	var/list/obj/corners = list(null, null, null, null)
	var/list/matrix = list()
	var/matrix_l = 0
	var/matrix_h = 0
	var/list/matrix_current_locs = list()

/obj/structure/vehicleparts/axis/bike
	name = "摩托车车轴"
	currentspeed = 0
	speeds = 3
	maxpower = 10
	speedlist = alist(1=3,2=2,3=1)
	reg_number = ""
	turntimer = 5
	vehicle_type = "bike"

/obj/structure/vehicleparts/axis/carriage
	name = "马车车轴"
	currentspeed = 0
	speeds = 3
	maxpower = 10
	speedlist = null
	reg_number = ""
	turntimer = 5
	vehicle_type = "carriage"

/obj/structure/vehicleparts/axis/boat
	name = "船用舵控"
	currentspeed = 0
	speeds = 3
	maxpower = 40
	speedlist = alist(1=8,2=6,3=4)
	reg_number = ""
	vehicle_type = "boat"

/obj/structure/vehicleparts/axis/boat/fast
	name = "船用舵控"
	currentspeed = 0
	speeds = 4
	maxpower = 40
	speedlist = alist(1=6,2=5,3=3,4=2)
	reg_number = ""
	vehicle_type = "boat"

/obj/structure/vehicleparts/axis/heavy
	name = "重型载具车轴"
	desc = "一个沉重且缓慢的载具车轴。"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "axis_powered"
	speeds = 3
	maxpower = 2500
	speedlist = alist(1=12,2=8,3=6)
	vehicle_type = "tank"

/obj/structure/vehicleparts/axis/heavy/is1
	name = "IS-1"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#4a5243"
	broken_icon = 'icons/obj/vehicles/tankparts96x96_damaged.dmi'
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/is2
	name = "IS-2"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#4a5243"
	broken_icon = 'icons/obj/vehicles/tankparts96x96_damaged.dmi'
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/is3
	name = "IS-3"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#4a5243"
	broken_icon = 'icons/obj/vehicles/tankparts96x96_damaged.dmi'
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t34
	name = "T-34"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#3d5931"
	broken_icon = 'icons/obj/vehicles/tankparts96x96_damaged.dmi'
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t34/t3485
	name = "T-34-85"
	color = "#4a5243"

/obj/structure/vehicleparts/axis/heavy/su100
	name = "SU-100"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#4a5243"
	broken_icon = 'icons/obj/vehicles/tankparts96x96_damaged.dmi'
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/su100/su85m
	name = "SU-85M"

/obj/structure/vehicleparts/axis/heavy/bt7
	name = "BT-7"
	speeds = 7
	speedlist = alist(1=12,2=8,3=6,4=5,5=4,6=3,7=2)
	reg_number = ""
	color = "#5c784f"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/su85
	name = "SU-85"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#506945"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/kv1a
	name = "KV-1A"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#3d5931"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/mtlb
	name = "MT-LB"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#4a5243"
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/m113
	name = "M113 装甲运兵车"
	speeds = 4
	speedlist = alist(1=14,2=10,3=8)
	reg_number = ""
	color = "#939276"
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_usa -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/m41
	name = "M41"
	speeds = 4
	speedlist = alist(1=14,2=10,3=8)
	reg_number = ""
	color = "#494224"
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_usa -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/bmd1
	name = "BMD-1"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#787859"
	broken_icon = 'icons/obj/vehicles/apcparts96x96_damaged.dmi'
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/bmd2
	name = "BMD-2"
	speeds = 4
	speedlist = alist(1=9,2=6,3=4,4=3)
	reg_number = ""
	color = "#787859"
	broken_icon = 'icons/obj/vehicles/apcparts96x96_damaged.dmi'
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/btr80
	name = "BTR-80"
	speeds = 5
	speedlist = alist(1=10,2=6,3=5,4=4,5=3)
	reg_number = ""
	color = "#4a5243"
	broken_icon = 'icons/obj/vehicles/apcparts96x96_damaged.dmi'
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/btr80/atgm

/obj/structure/vehicleparts/axis/heavy/bradley
	name = "M2 布雷德利"
	speeds = 5
	speedlist = alist(1=10,2=6,3=5,4=4,5=3)
	reg_number = ""
	color = "#787859"
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_usa -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/cv90
	name = "CV-90"
	speeds = 5
	speedlist = alist(1=10,2=6,3=5,4=4,5=3)
	reg_number = ""
	color = "#5C5C4C"
	vehicle_type = "apc"
	New()
		..()
		var/pickedname = pick(tank_names_nato)
		tank_names_nato -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t80u
	name = "T-80U"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t80uk
	name = "T-80UK"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t72
	name = "T-72"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t72m1
	name = "T-72M1"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t72b3
	name = "T-72B3"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t64bm
	name = "T-64BM"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t64bv
	name = "T-64BV"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t62a
	name = "T-62A"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t62m
	name = "T-62M"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t62mv
	name = "T-62MV"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/t55
	name = "T-55"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/panzeriv
	name = "四号坦克"
	speeds = 3
	speedlist = alist(1=12,2=8,3=6)
	reg_number = ""
	color = "#585A5C"
	New()
		..()
		var/pickedname = pick(tank_names_german)
		tank_names_german -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/panzervi
	name = "六号坦克 虎式"
	speeds = 4
	speedlist = alist(1=14,2=11,3=9,4=7)
	reg_number = ""
	color = "#3B3F41"
	New()
		..()
		var/pickedname = pick(tank_names_german)
		tank_names_german -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/l3
	name = "L3/33"
	speeds = 4
	speedlist = alist(1=10,2=6,3=4,4=3)
	reg_number = ""
	color = "#D79E57"

/obj/structure/vehicleparts/axis/heavy/l3cc
	name = "L3/33 CC"
	speeds = 4
	speedlist = alist(1=9,2=5,3=3,4=2)
	reg_number = ""
	color = "#c4a567"

/obj/structure/vehicleparts/axis/heavy/m13
	name = "M13/40"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	reg_number = ""
	color = "#778687"

/obj/structure/vehicleparts/axis/heavy/omw22_2
	name = "OMW-22 mk. II"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#774D4C"

/obj/structure/vehicleparts/axis/heavy/baf1_a
	name = "BAF I mod. A"
	speeds = 4
	speedlist = alist(1=9,2=6,3=4,4=3)
	reg_number = ""
	color = "#8383C2"

/obj/structure/vehicleparts/axis/heavy/t90a
	name = "T-90A"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	reg_number = ""
	color = "#5C5C4C"
	New()
		..()
		var/pickedname = pick(tank_names_soviet)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/leopard
	name = "豹2A6"
	speeds = 4
	speedlist = alist(1=9,2=6,3=4,4=3)
	reg_number = ""
	color = "#5C5C4C"

/obj/structure/vehicleparts/axis/heavy/challenger2
	name = "FV4034 挑战者2"
	speeds = 4
	speedlist = alist(1=9,2=6,3=4,4=3)
	reg_number = ""
	color = "#CCC0A6"

/obj/structure/vehicleparts/axis/heavy/m1a1_abrams
	name = "M1A1 艾布拉姆斯"
	speeds = 4
	speedlist = alist(1=9,2=6,3=4,4=3)
	reg_number = ""
	color = "#58564a"
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_usa -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/i_go
	name = "八九式中战车"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	color = "#6a5a3d"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_japanese)
		tank_names_japanese -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/chi_ha
	name = "九七式中战车"
	speeds = 4
	speedlist = alist(1=10,2=7,3=5,4=4)
	color = "#6a5a3d"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_japanese)
		tank_names_japanese -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/hago
	name = "九五式轻战车"
	speeds = 4
	speedlist = alist(1=8,2=5,3=3,4=2)
	color = "#6a5a3d"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_japanese)
		tank_names_japanese -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/m4
	name = "M-4 谢尔曼"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	color = "#494224"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/m48a1
	name = "M-48A1 巴顿"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	color = "#494224"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/m60a3
	name = "M60A3 巴顿"
	speeds = 4
	speedlist = alist(1=12,2=8,3=6,4=5)
	color = "#4B4D40"
	reg_number = ""
	New()
		..()
		var/pickedname = pick(tank_names_usa)
		tank_names_soviet -= pickedname
		name = "[name] \'[pickedname]\'"

/obj/structure/vehicleparts/axis/heavy/bmv1_1
	name = "BMV-1 mk. I"
	speeds = 4
	speedlist = alist(1=10,2=7,3=6,4=4)
	reg_number = ""
	color = "#4D5D53"

/obj/structure/vehicleparts/axis/heavy/smf1_a
	name = "SMF I mod. A"
	speeds = 4
	speedlist = alist(1=10,2=7,3=6,4=4)
	reg_number = ""
	color = "#555346"

/obj/structure/vehicleparts/axis/car
	name = "汽车车轴"
	desc = "来自汽车的动力车轴。"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "axis_powered"
	speeds = 5
	maxpower = 800
	speedlist = alist(1=8,2=6,3=4,4=3,5=2)
	turntimer = 8
	vehicle_type = "car"

/obj/structure/vehicleparts/axis/proc/get_speed()
	if (currentspeed <= 0)
		currentspeed = 0
		powerneeded = 0
		return 0
	else
		var/spd = (currentspeed/speeds)*maxpower
		powerneeded = spd
		if (currentspeed > speeds)
			currentspeed = speeds
		if (currentspeed == null || !speedlist[currentspeed])
			return 0
		return speedlist[currentspeed]

/obj/structure/vehicleparts/axis/proc/check_enginepower(var/esize = 0)
	return

/obj/structure/vehicleparts/axis/bike/check_enginepower(var/esize = 0)
	if (esize == 0)
		return
	if (esize >= 120)
		speedlist = alist(1=3,2=2,3=1)
	else if (esize >= 95)
		speedlist = alist(1=4,2=3,3=2)
	else
		speedlist = alist(1=5,2=4,3=3)
		return

/obj/structure/vehicleparts/axis/boat/check_enginepower(var/esize = 0)
	if (esize == 0)
		return
	if (esize >= 300)
		speedlist = alist(1=8,2=6,3=4)
	else if (esize >= 200)
		speedlist = alist(1=9,2=7,3=5)
	else
		speedlist = alist(1=10,2=8,3=6)
		return
///////////////////////////////////DRIVING WHEEL/////////////////////
/obj/item/vehicleparts/wheel
	name = "载具车轮"
	desc = "用于操控载具。"
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "wheel"
	anchored = FALSE
	flammable = FALSE
	nothrow = TRUE
	nodrop = TRUE
	w_class = ITEM_SIZE_HUGE
	flags = CONDUCT
	secondary_action = TRUE
	var/obj/structure/vehicle/origin = null

/obj/item/vehicleparts/wheel/rope
	name = "缰绳"
	desc = "用于控制动物牵引载具。"
	icon = 'icons/obj/items.dmi'
	icon_state = "leash"

/obj/item/vehicleparts/wheel/rope/attack_self(mob/living/human/H)
	if(istype(H.driver_vehicle, /obj/structure/vehicle/carriage))
		var/obj/structure/vehicle/carriage/M = H.driver_vehicle
		if(M.buckled_animal_propulsion <= 0)
			to_chat(H, "你需要动物来移动[H.driver_vehicle.name]。")
			return
		else if(M.buckled_animal_propulsion == 1)
			H.driver_vehicle.axis.speedlist = alist(1=25,2=20)
		else if(M.buckled_animal_propulsion == 2)
			H.driver_vehicle.axis.speedlist = alist(1=20,2=15,3=10)
		else if(M.buckled_animal_propulsion == 4)
			H.driver_vehicle.axis.speedlist = alist(1=10,2=4,3=1.6)
		else if(M.buckled_animal_propulsion == 6)
			H.driver_vehicle.axis.speedlist = alist(1=9,2=3,3=1.4)
		else if(M.buckled_animal_propulsion == 8)
			H.driver_vehicle.axis.speedlist = alist(1=8,2=2.8,3=1.2)
	if (H.driver_vehicle.axis.currentspeed <= 0)
		H.driver_vehicle.axis.currentspeed = 1
		var/spd = H.driver_vehicle.axis.get_speed()
		if (spd <= 0)
			return
		else
			H.driver_vehicle.vehicle_m_delay = spd
		spawn(1)
			if (H.driver_vehicle.axis.currentspeed == 1)
				H.driver_vehicle.moving = TRUE
				H.driver_vehicle.startmovementloop()
				to_chat(H, "你击打动物使其移动.")
		return
	else if (H.driver_vehicle.axis.currentspeed<H.driver_vehicle.axis.speedlist.len)
		H.driver_vehicle.axis.currentspeed++
		if (H.driver_vehicle.axis.currentspeed>H.driver_vehicle.axis.speedlist.len)
			H.driver_vehicle.axis.currentspeed = H.driver_vehicle.axis.speedlist.len
		var/spd = H.driver_vehicle.axis.get_speed()
		if (spd <= 0)
			return
		else
			H.driver_vehicle.vehicle_m_delay = spd
			to_chat(H, "你更用力地击打动物.")
			return
	else
		return

/obj/item/vehicleparts/wheel/rope/secondary_attack_self(mob/living/human/user)
	if (user && user.driver_vehicle && user.driver_vehicle.axis && user.driver_vehicle.axis.currentspeed <= 0)
		return
	else
		user.driver_vehicle.axis.currentspeed--
		var/spd = user.driver_vehicle.axis.get_speed()
		if (spd <= 0 || user.driver_vehicle.axis.currentspeed == 0)
			user.driver_vehicle.moving = FALSE
			to_chat(user, "你停下\the [user.driver_vehicle].")
			return
		else
			user.driver_vehicle.vehicle_m_delay = spd
			to_chat(user, "你拉动绳索以降低速度.")
			return

/obj/item/vehicleparts/wheel/handle
	name = "摩托车把手"
	desc = "用于操控摩托车."
	icon_state = "bike_handles"

/obj/item/vehicleparts/wheel/rudder
	name = "船用舵"
	desc = "用于操控船只."
	icon_state = "rudder"

/obj/item/vehicleparts/wheel/rudder_sails
	name = "船用舵和帆控制"
	desc = "用于操控船只并控制船帆."
	icon_state = "rudder"
	var/spamtimer = 0

/obj/item/vehicleparts/wheel/rudder_sails/attack_self(mob/living/human/H)
	if(!H.driver_vehicle)
		return
	if (!H.driver_vehicle.sails)
		return
	if (!(H.driver_vehicle in range(3,loc)))
		return
	if (H.driver_vehicle.sails)
		if (!H.driver_vehicle.sails_on)
			if (world.time > spamtimer)
				to_chat(H, "你升起船帆.")
				H.driver_vehicle.sails_on = TRUE
				H.driver_vehicle.check_sails()
				spamtimer = world.time + 20
				H.driver_vehicle.update_overlay()
				return
		else
			to_chat(H, "你收起船帆.")
			H.driver_vehicle.sails_on = FALSE
			H.driver_vehicle.update_overlay()
			return

/obj/item/vehicleparts/wheel/attack_self(mob/living/human/H)
	if(!H.driver_vehicle)
		return
	if(!H.driver_vehicle.engine)
		return
	if (!(H.driver_vehicle in range(3,loc)))
		return
	if (!H.driver_vehicle.engine.on && H.driver_vehicle.fueltank.reagents.total_volume > 0)
		H.driver_vehicle.engine.turn_on(H)
		H.driver_vehicle.set_light(3)
		playsound(loc, H.driver_vehicle.engine.starting_snd, 35, FALSE, 2)
		spawn(40)
			if (H.driver_vehicle && H.driver_vehicle.engine && H.driver_vehicle.engine.on)
				H.driver_vehicle.running_sound()
		return
	else if (H.driver_vehicle.fueltank.reagents.total_volume <= 0)
		to_chat(H, "燃料不足!")
		return

	if (H.driver_vehicle.axis.currentspeed <= 0)
		H.driver_vehicle.axis.currentspeed = 1
		var/spd = H.driver_vehicle.axis.get_speed()
		if (spd <= 0)
			return
		else
			H.driver_vehicle.vehicle_m_delay = spd
		spawn(1)
			if (H.driver_vehicle.axis.currentspeed == 1)
				H.driver_vehicle.moving = TRUE
				H.driver_vehicle.startmovementloop()
				to_chat(H, "你将载具挂入一档.")
		return
	else if (H.driver_vehicle.axis.currentspeed < H.driver_vehicle.axis.speedlist.len)
		H.driver_vehicle.axis.currentspeed++
		if (H.driver_vehicle.axis.currentspeed > H.driver_vehicle.axis.speedlist.len)
			H.driver_vehicle.axis.currentspeed = H.driver_vehicle.axis.speedlist.len
		var/spd = H.driver_vehicle.axis.get_speed()
		if (spd <= 0)
			return
		else
			H.driver_vehicle.vehicle_m_delay = spd
			if (H.driver_vehicle.axis.currentspeed < H.driver_vehicle.axis.speedlist.len+1)
				to_chat(H, "你提高速度.")
			return
	else
		return
/*
	else if (H.driver_vehicle.moving == TRUE)
		H.driver_vehicle.moving = FALSE
		H.driver_vehicle.stopmovementloop()
		to_chat(H, "You brake.")
		return
*/

/obj/item/vehicleparts/wheel/secondary_attack_self(mob/living/human/user)
	if (user && user.driver_vehicle && user.driver_vehicle.axis && user.driver_vehicle.axis.currentspeed <= 0 || !user.driver_vehicle.engine.on || user.driver_vehicle.fueltank.reagents.total_volume <= 0)
		return
	else
		user.driver_vehicle.axis.currentspeed--
		var/spd = user.driver_vehicle.axis.get_speed()
		if (spd <= 0 || user.driver_vehicle.axis.currentspeed == 0)
			user.driver_vehicle.moving = FALSE
			to_chat(user, "你停下\the [user.driver_vehicle].")
			return
		else
			user.driver_vehicle.vehicle_m_delay = spd
			to_chat(user, "你降低速度.")
			return
///////////////////FRAME///////////////////////////////
/obj/item/vehicleparts/frame
	name = "载具框架"
	desc = "一个载具框架."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "motorcycle_frame0"
	var/customcolor = "#FFFFFF"
	var/maxengine = 500
	var/maxfueltank = 100
	var/base_icon = "motorcycle_frame"
	density = TRUE
	weight = 100
	w_class = 10
	nothrow = TRUE
	throw_speed = 1
	throw_range = 1
	var/obj/structure/engine/engine = null
	var/obj/item/weapon/reagent_containers/glass/barrel/fueltank/fueltank = null
	var/step = 0
	var/maxstep = 3
	var/targettype = /obj/structure/vehicle
	var/image/colorv = null

/obj/item/vehicleparts/frame/bike
	name = "摩托车框架"
	desc = "一个摩托车框架. 可适配最高125cc的引擎和最高75u的油箱."
	icon_state = "motorcycle_frame1"
	base_icon = "motorcycle_frame"
	customcolor = "#FFFFFF"
	maxengine = 125
	maxfueltank = 75
	weight = 20
	w_class = ITEM_SIZE_GARGANTUAN
	step = 1
	maxstep = 3
	targettype = /obj/structure/vehicle/motorcycle

/obj/item/vehicleparts/frame/boat
	name = "舷外支架船框架"
	desc = "一个简易的舷外支架船框架, 没有引擎或推进模式. 支持最高400cc的引擎和最高150u的油箱"
	icon = 'icons/obj/vehicles/vehicleparts64x64.dmi'
	icon_state = "outrigger_frame1"
	base_icon = "outrigger_frame"
	maxengine = 400
	maxfueltank = 150
	weight = 60
	w_class = ITEM_SIZE_GARGANTUAN
	step = 1
	maxstep = 3
	targettype = /obj/structure/vehicle/boat

/obj/item/vehicleparts/frame/boat/rhib
	name = "硬壳充气艇框架"
	desc = "一个硬壳充气艇框架, 没有引擎或推进模式. 支持最高600cc的引擎和最高200u的油箱"
	icon = 'icons/obj/vehicles/vehicleparts64x64.dmi'
	icon_state = "rib_frame1"
	base_icon = "rib_frame"
	maxengine = 600
	maxfueltank = 200
	weight = 60
	step = 1
	maxstep = 3
	targettype = /obj/structure/vehicle/boat/rhib

/obj/item/vehicleparts/frame/proc/do_color()
	colorv = image("icon" = icon, "icon_state" = "[icon_state]_mask")
	colorv.color = customcolor
	overlays += colorv
	update_icon()

/obj/item/vehicleparts/frame/update_icon()
	..()
	icon_state = "[base_icon][step]"

/obj/item/vehicleparts/frame/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/sail) && istype(src, /obj/item/vehicleparts/frame/boat) && step == 1)
		if (do_after(user,130,src) && src && W)
			to_chat(user, SPAN_NOTICE("You attach \the [W] to \the [src]."))
			user.drop_from_inventory(W)
			qdel(W)
			var/obj/structure/vehicle/boat/sailboat/N = new/obj/structure/vehicle/boat/sailboat(get_turf(user))
			N.name = name
			qdel(src)
			return

	if (istype(W, /obj/item/weapon/reagent_containers/glass/barrel/fueltank) && step == 2)
		var/obj/item/weapon/reagent_containers/glass/barrel/fueltank/NF = W
		if (NF.reagents.maximum_volume <= maxfueltank)
			if (do_after(user,100,src))
				if (fueltank == null)
					to_chat(user, SPAN_NOTICE("You attach \the [W] to \the [src]."))
					user.drop_from_inventory(W)
					fueltank = W
					W.forceMove(src)
					step = 3
					check_step()
					return
		else
			to_chat(user, SPAN_NOTICE("This fuel tank is too big for \the [src]!"))
			return
	else
		..()

/obj/item/vehicleparts/frame/MouseDrop_T(obj/structure/O as obj, mob/user as mob)
	if (istype(O, /obj/structure/engine/internal) && step == 1)
		var/obj/structure/engine/internal/NE = O
		if (NE.enginesize <= maxengine && NE.enginesize >= maxengine/4)
			to_chat(user, SPAN_NOTICE("You start placing \the [O]."))
			if (do_after(user,130,src))
				if (engine == null)
					to_chat(user, SPAN_NOTICE("You attach \the [O] to \the [src]."))
					engine = O
					O.forceMove(src)
					step = 2
					check_step()
					update_icon()
					return
		else if (NE.enginesize > maxengine)
			to_chat(user, SPAN_NOTICE("This engine is too big for \the [src]!"))
			return
		else if (NE.enginesize <= maxengine && NE.enginesize < maxengine/4)
			to_chat(user, SPAN_NOTICE("This engine is too small for \the [src]!"))
			return

/obj/item/vehicleparts/frame/proc/check_step()
	if (step >= maxstep)
		var/obj/structure/vehicle/NEWVEHICLE = new targettype(get_turf(src))
		NEWVEHICLE.dir = dir
		NEWVEHICLE.customcolor = customcolor
		NEWVEHICLE.do_color()
		NEWVEHICLE.engine = engine
		NEWVEHICLE.fueltank = fueltank
		NEWVEHICLE.name = name
		spawn(1)
			NEWVEHICLE.engine.fueltank = NEWVEHICLE.fueltank
			NEWVEHICLE.engine.connections += NEWVEHICLE.axis
			NEWVEHICLE.dwheel.forceMove(NEWVEHICLE)
			spawn(1)
				engine.forceMove(NEWVEHICLE)
				fueltank.forceMove(NEWVEHICLE)
				NEWVEHICLE.axis.check_enginepower(NEWVEHICLE.engine.enginesize)
				qdel(src)
				return
	else
		update_icon()
		if (colorv)
			colorv = image("icon" = icon, "icon_state" = "[icon_state]_mask")
			colorv.color = customcolor
		update_icon()
		return

/obj/item/vehicleparts/frame/attack_hand(mob/user as mob)
	return

/obj/item/vehicleparts/frame/boat/check_step()
	if (step >= maxstep)
		var/obj/structure/vehicle/NEWVEHICLE = new targettype(get_turf(src))
		NEWVEHICLE.dir = dir
		NEWVEHICLE.engine = engine
		NEWVEHICLE.fueltank = fueltank
		NEWVEHICLE.name = name
		spawn(1)
			NEWVEHICLE.engine.fueltank = NEWVEHICLE.fueltank
			NEWVEHICLE.engine.connections += NEWVEHICLE.axis
			NEWVEHICLE.dwheel.forceMove(NEWVEHICLE)
			spawn(1)
				engine.forceMove(NEWVEHICLE)
				fueltank.forceMove(NEWVEHICLE)
				NEWVEHICLE.axis.check_enginepower(NEWVEHICLE.engine.enginesize)
				qdel(src)
				return
		return

///////////////////////EXTRA STUFF//////////////////////

/obj/item/sail
	name = "小布帆"
	desc = "一面小布帆. 可适配小型船只."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "sailing0"
	anchored = FALSE
	flammable = TRUE
	w_class = ITEM_SIZE_LARGE

/obj/item/sail/wool
	name = "小羊毛帆"
	desc = "一面小布帆. 可适配小型船只."

/obj/item/tank_system
	name = "坦克系统"
	desc = "基础父对象, 请勿使用."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "none"
	anchored = TRUE
	flammable = FALSE
	w_class = ITEM_SIZE_LARGE
	opacity = FALSE
	density = FALSE

/obj/item/tank_system/New()
	..()
	processing_objects += src

/obj/item/tank_system/Del()
	processing_objects -= src
	..()

/obj/item/tank_system/ecms
	name = "电磁反雷系统"
	desc = "一个电磁反水雷系统."

/obj/item/tank_system/ecms/process()
	for (var/obj/item/mine/M in range(5, src))
		if (M.anchored)
			M.trigger(src)
			for (var/mob/O in viewers(7, get_turf(src)))
				to_chat(O, SPAN_DANGER("\The [src] explodes the [M]!"))

/obj/item/tank_system/aps
	name = "主动防护系统"
	desc = "一个用于防御火箭推进榴弹和反坦克制导导弹的硬杀伤主动防护系统."

/obj/item/tank_system/aps/process()
	for (var/obj/item/projectile/shell/missile/M in range(6, src))
		if (M)
			M.initiate(get_turf(M))
			for (var/mob/O in viewers(7, get_turf(src)))
				to_chat(O, SPAN_DANGER("<big>\The [src] explodes the rocket!</big>"))

/obj/item/tank_system/aps/ironfist
	name = "铁拳主动防护系统"