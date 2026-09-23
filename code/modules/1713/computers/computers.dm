
/obj/structure/computer/
	name = "母体计算机"
	desc = "一台简易计算机。这是母体对象。"
	icon = 'icons/obj/computers.dmi'
	icon_state = "ibm_off"
	var/internals = list()
	var/operatingsystem = "unga OS"
	var/memory = list()
	var/display = "Unga OS V 0.0.1"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/active = FALSE
	powered = FALSE
	powerneeded = 1
	var/mainbody = ""
	var/mainmenu = ""
	var/mob/user

	var/list/programs = list()

/obj/structure/computer/New()
	..()
	boot(operatingsystem)
	program_checker()

/obj/structure/computer/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/stack/cable_coil))
		if (!anchored)
			to_chat(H, "<span class='notice'>先用扳手把 [src] 固定到位。</span>")
			return
		if (powersource)
			to_chat(H, "这里已经连接了一根电缆! 把它从 [src] 处进一步分开。")
			return
		var/obj/item/stack/cable_coil/CC = W
		powersource = CC.place_turf(get_turf(src), H, turn(get_dir(H,src),180))
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
					to_chat(H, "你把两根电缆连接起来。")

			for(var/obj/structure/cable/NCOC in get_turf(get_step(powersource,opdir2)))
				if ((NCOC.tiledir == powersource.tiledir) && NCOC != powersource)
					if (!(powersource in NCOC.connections) && !list_cmp(powersource.connections, NCOC.connections))
						NCOC.connections += powersource
					if (!(NCOC in powersource.connections) && !list_cmp(powersource.connections, NCOC.connections))
						powersource.connections += NCOC
					to_chat(H, "你把两根电缆连接起来。")
		to_chat(H, "你把电缆连接到 [src]。")

	else
		if (istype(W, /obj/item/weapon/disk/os))
			var/obj/item/weapon/disk/os/OSD = W
			if (OSD.operatingsystem != src.operatingsystem)
				src.operatingsystem = OSD.operatingsystem
				src.programs = list()
				src.boot(OSD.operatingsystem)
				playsound(get_turf(src), 'sound/machines/computer/floppydisk.ogg', 100, TRUE)
				to_chat(H, "你成功将 \the [src.operatingsystem] 安装到这台机器上。")
			else
				to_chat(H, "你已经安装了此操作系统。")
				return
		else if (istype(W, /obj/item/weapon/disk/program))
			var/obj/item/weapon/disk/program/PD = W
			if (!(operatingsystem in PD.compatible_os))
				to_chat(H, "不支持此操作系统。")
				return
			if (PD.included)
				var/datum/program/NP = new PD.included
				NP.origin = src
				for(var/datum/program/EP in programs)
					if (istype(EP,NP))
						to_chat(H, "此程序已安装在这台机器上。")
						return
				programs += NP
				playsound(get_turf(src), 'sound/machines/computer/floppydisk.ogg', 100, TRUE)
				to_chat(H, "你将 \the [NP.name] 载入这台机器。")
				return
		else
			..()

/obj/structure/computer/verb/toggle_power(var/mob/living/human/H)
	set category = null
	set name = "Turn On"
	set src in range(1, usr)
	if(src.active)
		name = "Turn Off"
	if(!powersource && powerneeded)
		to_chat(H, "<span class = 'notice'>你需要先插上 [src]。</span>")
		return
	if (active)
		active = FALSE
		powered = FALSE
		powersource.update_power(powerneeded,1)
		powersource.currentflow -= powerneeded
		powersource.lastupdate2 = world.time
		to_chat(H, "你关闭了 [src] 的电源。")
		update_icon()
		return
	else if (!active && !powersource.powered)
		to_chat(H, "<span class = 'notice'>没有足够的电力来启动 [src]。</span>")
		update_icon()
		return
	else if (!active && powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
		active = TRUE
		powered = TRUE
		powersource.update_power(powerneeded,1)
		powersource.currentflow += powerneeded
		powersource.lastupdate2 = world.time
		power_on()
		to_chat(H, "你启动了 [src] 的电源。")
		update_icon()
		return
	else
		to_chat(H, "<span class = 'notice'>没有足够的电力来启动 [src]。</span>")
		return
/obj/structure/computer/attack_hand(var/mob/living/human/H)
	if(src.active)
		boot(operatingsystem)
		do_html(H)
	else
		to_chat(H, "<span class = 'notice'>你需要先打开 [src]!</span>")
/obj/structure/computer/proc/power_on()
	if (powered && active)
		update_icon()
	else
		update_icon()
		return

/obj/structure/computer/update_icon()
	if (active)
		icon_state = "ibm_on"
	else
		icon_state = "ibm_off"

/obj/structure/computer/proc/program_checker()
	for(var/datum/program/P in programs)
		if (P.does_checks)
			P.does_checks_proc()
	spawn(600) // 1 minute
		if (src)
			program_checker()
			return

/obj/structure/computer/nopower
	name = "台式计算机"
	desc = "一台运行最新版 Unga OS 的台式计算机。"
	icon_state = "ibm_on"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	active = TRUE
