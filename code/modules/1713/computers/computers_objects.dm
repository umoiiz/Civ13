/obj/structure/computer/nopower/aotd
	name = "台式计算机"
	desc = "一台运行最新版 Unga OS 的台式计算机。带有一个软盘驱动器。"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	display = "<b>unga OS</b>"
	operatingsystem = "unga OS 94"
	var/faction = "none"

/obj/structure/computer/nopower/aotd/civilian/New()
	..()
	programs += new/datum/program/monkeysoftmail
	programs += new/datum/program/deepnet
	programs += new/datum/program/orion_trail
	programs += new/datum/program/junglebank

/obj/structure/computer/nopower/aotd/green/New()
	..()
	programs += new/datum/program/monkeysoftmail/green
	programs += new/datum/program/deepnet
	programs += new/datum/program/elektra
	programs += new/datum/program/orion_trail
	programs += new/datum/program/swiftfix
	faction = "Kogama Kraftsmen"

/obj/structure/computer/nopower/aotd/red/New()
	..()
	programs += new/datum/program/monkeysoftmail/red
	programs += new/datum/program/deepnet
	programs += new/datum/program/elektra
	programs += new/datum/program/orion_trail
	programs += new/datum/program/swiftfix
	faction = "Rednikov Industries"

/obj/structure/computer/nopower/aotd/yellow/New()
	..()
	programs += new/datum/program/monkeysoftmail/yellow
	programs += new/datum/program/deepnet
	programs += new/datum/program/elektra
	programs += new/datum/program/orion_trail
	programs += new/datum/program/swiftfix
	faction = "Goldstein Solutions"

/obj/structure/computer/nopower/aotd/blue/New()
	..()
	programs += new/datum/program/monkeysoftmail/blue
	programs += new/datum/program/deepnet
	programs += new/datum/program/elektra
	programs += new/datum/program/orion_trail
	programs += new/datum/program/swiftfix
	faction = "Giovanni Blu Stocks"

/obj/structure/computer/nopower/aotd/attack_hand(var/mob/living/human/H)
	..()
/obj/structure/computer/nopower/aotd/attackby(var/obj/item/W, var/mob/living/human/H)
	if (istype(W, /obj/item/weapon/disk))
		if (istype(W, /obj/item/weapon/disk/os))
			var/obj/item/weapon/disk/os/OSD = W
			if (OSD.operatingsystem != src.operatingsystem)
				src.operatingsystem = OSD.operatingsystem
				src.programs = list()
				src.boot(OSD.operatingsystem)
				to_chat(H, "你成功将 \the [src.operatingsystem] 安装到这台机器上。")
				playsound(get_turf(src), 'sound/machines/computer/floppydisk.ogg', 100, TRUE)
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
		var/obj/item/weapon/disk/D = W
		if (D.faction == H.civilization)
			to_chat(H, "<span class='notice'>你无法读取属于你公司的磁盘。</span>")
			return
		else if (src.faction != H.civilization)
			to_chat(H, "<span class='notice'>你无法在另一家公司的计算机上读取磁盘。</span>")
			return
		else if (H.civilization == "Sheriff Office")
			to_chat(H, "<span class='notice'>你不知道如何解密这个... 你应该把它放到证物室。</span>")
			return
		else if (H.civilization == "Paramedics")
			to_chat(H, "<span class='notice'>你不知道如何解密这个... 你应该把它交给警长办公室。</span>")
			return
		else if (H.civilization == "Government")
			to_chat(H, "<span class='notice'>你不知道如何解密这个... 你应该把它交给警长办公室。</span>")
			return
		else if (D.used)
			to_chat(H, "<span class='notice'>此磁盘已被解密并擦除。</span>")
			return
		else
			playsound(get_turf(src), 'sound/machines/computer/floppydisk.ogg', 100, TRUE)
			switch(D.exchange_state)
				if (-1)
					if (D.fake)
						map.scores[H.civilization] -= 100
						map.give_stock_points(H.civilization,-100)
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a fake inactive disk! You lose 100 points.", "Fake Disk")
					else
						map.scores[H.civilization] += 100
						map.give_stock_points(H.civilization,100)
						var/obj/item/stack/money/dollar/DLR = new/obj/item/stack/money/dollar(loc)
						DLR.amount = 40
						DLR.update_icon()
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a real inactive disk! You gain 100 dollars and 100 points.", "Real Disk")

				if (0)
					if (D.fake)
						map.scores[H.civilization] -= 400
						map.give_stock_points(H.civilization,-400)
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a fake disk! Since you exchanged it with a fake disk too, both factions lose 400 points.", "Fake Disk")


				if (1)
					if (D.fake)
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a fake disk! Since you exchanged it with a real disk, you gain nothing and the other faction gains 500 dollars and 500 points.", "Fake Disk")

					else
						map.scores[H.civilization] += 500
						map.give_stock_points(H.civilization,500)
						var/obj/item/stack/money/dollar/DLR = new/obj/item/stack/money/dollar(loc)
						DLR.amount = 100
						DLR.update_icon()
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a real disk! Since you exchanged it with a fake disk, you gain 500 dollars, 500 points and the other faction gains nothing.", "Real Disk")

				if (2)
					if (!D.fake)
						map.scores[H.civilization] += 200
						map.give_stock_points(H.civilization,200)
						var/obj/item/stack/money/dollar/DLR = new/obj/item/stack/money/dollar(loc)
						DLR.amount = 40
						DLR.update_icon()
						D.used = TRUE
						qdel(D)
						spawn(1)
							WWalert(H,"This is a real disk! Since you exchanged it with a real disk too, both factions gain 200 dollars and 200 points.", "Real Disk")


//////////////////////////////////////////////////////////////

/obj/structure/computer/nopower/carsales
	name = "CARTRADER 终端"
	desc = "一台连接到 CARTRADER 网络的计算机终端。"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	operatingsystem = "unga OS 94"
	New()
		..()
		programs += new/datum/program/cartrader

/obj/structure/computer/nopower/carspawn
	name = "载具补给终端"
	desc = "一台连接到补给网络的计算机终端。"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	operatingsystem = "unga OS 94"
	New()
		..()
		programs += new/datum/program/carspawn

/obj/structure/computer/nopower/carspawn/examine(mob/user)
	if (ishuman(user))
		var/mob/living/human/H = user
		switch (H.faction_text)
			if (DUTCH)
				to_chat(H, "你当前拥有 [faction1_supply_points] 补给点。")
			if (RUSSIAN)
				to_chat(H, "你当前拥有 [faction2_supply_points] 补给点。")
			if (BRITISH)
				to_chat(H, "你当前拥有 [faction1_supply_points] 补给点。")

//////////////////////////////////////////////////////////////

/obj/structure/computer/nopower/police
	name = "警务处理终端"
	desc = "一台运行 unga OS 94 执法版的计算机, 可访问平民和执法人员的资料。"
	icon_state = "research_on"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	density = TRUE
	operatingsystem = "unga OS 94 Law Enforcement Edition"
	New()
		..()
		programs += new/datum/program/permits
		programs += new/datum/program/warrants
		programs += new/datum/program/bail

/obj/structure/computer/nopower/police/inside
	New()
		..()
		programs += new/datum/program/monkeysoftmail/police
		programs += new/datum/program/squadtracker
		programs += new/datum/program/gunregistry
		programs += new/datum/program/licenseplates
		programs += new/datum/program/fingerprintregistry

//////////////////////////////////////////////////////////////

/obj/structure/computer/nopower/platoontracker
	name = "军事资产追踪系统"
	desc = "一套基于卫星的系统, 可实时追踪你的部队。"
	icon = 'icons/obj/device.dmi'
	icon_state = "tracking"
	powered = TRUE
	powerneeded = FALSE
	anchored = TRUE
	density = TRUE
	operatingsystem = "unga OS 94"
	New()
		..()
		programs += new/datum/program/platoontracker

//////////////////////////////////////////
/////////DISKS///////////////////////////

/obj/item/weapon/disk
	name = "软盘"
	desc = "某种软盘。"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "disk_red"
	item_state = "disk_red"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	force = 4.0
	throwforce = 3.0
	attack_verb = list("bashed", "bludgeoned", "whacked")
	sharp = FALSE
	edge = FALSE
	w_class = ITEM_SIZE_TINY
	is_contraband = TRUE

	var/fake = FALSE
	var/used = FALSE
	var/faction = null
	var/exchange_state = -1 //-1 inactive, 1-both fake, 2-one is real, 3-both real
	var/datum/program/program
	
/obj/item/weapon/disk/examine(mob/user)
	..()
	if (faction)
		if (used)
			to_chat(user, "<font color='yellow'><i><b>该磁盘已被解密并擦除</b></i></font>。")
		if (exchange_state == -1)
			to_chat(user, "该磁盘 <b><font color='red'>未激活</font></b>。")
		else
			to_chat(user, "该磁盘 <b><font color='green'>已激活</font></b>。")
		if (ishuman(user))
			var/mob/living/human/H = user
			if (H.civilization == faction)
				to_chat(H, "这是一张 <b>[fake ? "<font color ='red'>fake</font>" : "<font color ='green'>real</font>"]</b> 磁盘。")
		else if (isghost(user))
			to_chat(user, "这是一张 <b>[fake ? "<font color ='red'>fake</font>" : "<font color ='green'>real</font>"]</b> 磁盘。")

/obj/item/weapon/disk/attackby(var/obj/item/weapon/disk/D, var/mob/living/human/H)
	if (istype(D, /obj/item/weapon/disk))
		H.setClickCooldown(20)
		if (src.faction == D.faction)
			to_chat(H, "这些磁盘属于同一阵营, 你需要另一阵营的磁盘来激活它们。")
			return
		else if (src.used)
			to_chat(H, "\The [src] 已被使用并擦除。")
			return
		else if (D.used)
			to_chat(H, "\The [src] 已被使用并擦除。")
			return
		else if (src.exchange_state != -1 && D.exchange_state != -1)
			visible_message("<big><font color='red'>两张磁盘都已激活。</font></big>")
			return
		else if (src.exchange_state != -1)
			visible_message("<big><font color='yellow'>\The [src] 已被激活。</font></big>")
			return
		else if (D.exchange_state != -1)
			visible_message("<big><font color='yellow'>\The [D] 已被激活。</font></big>")
			return

		if (D.fake && src.fake) //both fake
			D.exchange_state = 0
			src.exchange_state = 0
			visible_message("<big><font color='green'>两张磁盘都被激活, 完成了交易。</font></big>")
			return
		else if ((D.fake && !src.fake) || (!D.fake && src.fake)) //one is fake
			D.exchange_state = 1
			src.exchange_state = 1
			visible_message("<big><font color='green'>两张磁盘都被激活, 完成了交易。</font></big>")
			return
		else if (!D.fake && !src.fake) //both real
			D.exchange_state = 2
			src.exchange_state = 2
			visible_message("<big><font color='green'>两张磁盘都被激活, 完成了交易。</font></big>")
			return
	else
		..()
/obj/item/weapon/disk/red
	name = "红色软盘"
	icon_state = "disk_red"
	item_state = "disk_red"
	faction = "Rednikov Industries"

/obj/item/weapon/disk/red/fake
	name = "红色软盘"
	faction = "Rednikov Industries"
	fake = TRUE

/obj/item/weapon/disk/blue
	name = "蓝色软盘"
	icon_state = "disk_blue"
	item_state = "disk_blue"
	faction = "Giovanni Blu Stocks"

/obj/item/weapon/disk/blue/fake
	name = "蓝色软盘"
	faction = "Giovanni Blu Stocks"
	fake = TRUE

/obj/item/weapon/disk/yellow
	name = "黄色软盘"
	icon_state = "disk_yellow"
	item_state = "disk_yellow"
	faction = "Goldstein Solutions"

/obj/item/weapon/disk/yellow/fake
	name = "黄色软盘"
	faction = "Goldstein Solutions"
	fake = TRUE

/obj/item/weapon/disk/green
	name = "绿色软盘"
	icon_state = "disk_green"
	item_state = "disk_green"
	faction = "Kogama Kraftsmen"

/obj/item/weapon/disk/green/fake
	name = "绿色软盘"
	faction = "Kogama Kraftsmen"
	fake = TRUE
///OSes/////////////////

/obj/item/weapon/disk/os
	name = "unga OS 启动盘"
	desc = "一张用于启动 unga OS 的磁盘。"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "disk_uos0"
	item_state = "disk_uos0"
	var/operatingsystem = "unga OS"
	is_contraband = FALSE

	attackby(obj/item/W, mob/living/M)
		return

/obj/item/weapon/disk/os/uos94
	name = "unga OS 94 启动盘"
	desc = "用于启动 unga OS 94 的磁盘."
	icon_state = "disk_uos94"
	item_state = "disk_uos94"
	operatingsystem = "unga OS 94"

/obj/item/weapon/disk/os/uos94pe
	name = "unga OS 94 LE 启动盘"
	desc = "用于启动 unga OS 94 执法版 的磁盘."
	icon_state = "disk_uos94"
	item_state = "disk_uos94"
	operatingsystem = "unga OS 94 Law Enforcement Edition"
///////////////components/////////////////////
/obj/item/stack/component
	icon = 'icons/obj/computers.dmi'
	name = "电子元件"
	desc = "一块基础电子芯片."
	icon_state = "generic_chip"
	amount = 1
	value = 400
	w_class = ITEM_SIZE_TINY
	max_amount = 20
	flags = CONDUCT

/obj/item/stack/component/red
	name = "RDKV S-445 芯片"
	desc = "一块高度先进的芯片, 由 Rednikov 工业制造."
	icon_state = "card_red"

/obj/item/stack/component/green
	name = "KOGM S5R1 芯片"
	desc = "一块高度先进的芯片, 由 Kogama Kraftsmen 制造."
	icon_state = "card_ram"

/obj/item/stack/component/blue
	name = "GBSA-1994 芯片"
	desc = "一块高度先进的芯片, 由 Giovanni Blu Stocks 制造."
	icon_state = "cpu_chip_blue"

/obj/item/stack/component/yellow
	name = "GS-IC-M3 芯片"
	desc = "一块高度先进的芯片, 由 Goldstein Solutions 制造."
	icon_state = "yellow_card"
/////////////////precursors///////////////////
///////////////components/////////////////////
/obj/item/stack/precursor
	icon = 'icons/obj/mining.dmi'
	name = "晶体"
	desc = "一种稀有的化学物质, 呈结晶形态."
	icon_state = "ore_diamond"
	var/produces = /obj/item/stack/component
	amount = 1
	value = 60
	w_class = ITEM_SIZE_TINY
	max_amount = 20

/obj/item/stack/precursor/red
	name = "绯红晶体"
	desc = "一种稀有的化学物质, 呈结晶形态. 带有红色色调."
	icon_state = "ore_crimsonite"
	produces = /obj/item/stack/component/red

/obj/item/stack/precursor/green
	name = "翠绿晶体"
	desc = "一种稀有的化学物质, 呈结晶形态. 带有绿色色调."
	icon_state = "ore_verdine"
	produces = /obj/item/stack/component/green

/obj/item/stack/precursor/blue
	name = "靛蓝晶体"
	desc = "一种稀有的化学物质, 呈结晶形态. 带有蓝色色调."
	icon_state = "ore_indigon"
	produces = /obj/item/stack/component/blue

/obj/item/stack/precursor/yellow
	name = "加尔多尼姆晶体"
	desc = "一种稀有的化学物质, 呈结晶形态. 带有黄色色调."
	icon_state = "ore_galdonium"
	produces = /obj/item/stack/component/yellow

//////////////////assembler/////////////////////
/obj/structure/assembler
	name = "组装机"
	desc = "一台自动化机器, 是传送带的一部分, 用于组装电路."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "stacker0"
	var/base_icon = "stacker"
	anchored = TRUE
	density = TRUE
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	var/on = FALSE
	var/requires = /obj/item/stack/precursor
	var/faction
/obj/structure/assembler/processor

/obj/structure/assembler/loader
	name = "装载机"
	desc = "一台自动化机器, 是传送带的一部分, 用于装载前体材料."
	icon_state = "loader0"
	base_icon = "loader"

/obj/structure/assembler/unloader
	name = "卸载机"
	desc = "一台自动化机器, 是传送带的一部分, 用于卸载最终产品."
	icon_state = "unloader0"
	base_icon = "unloader"

/obj/structure/assembler/loader/red
	requires = /obj/item/stack/precursor/red
	faction = "Rednikov Industries"

/obj/structure/assembler/loader/green
	requires = /obj/item/stack/precursor/green
	faction = "Kogama Kraftsmen"

/obj/structure/assembler/loader/yellow
	requires = /obj/item/stack/precursor/yellow
	faction = "Goldstein Solutions"

/obj/structure/assembler/loader/blue
	requires = /obj/item/stack/precursor/blue
	faction = "Giovanni Blu Stocks"

/obj/structure/assembler/update_icon()
	if (on)
		icon_state = "[base_icon]1"
	else
		icon_state = "[base_icon]0"

/obj/structure/assembler/loader/attackby(var/obj/item/I, var/mob/living/human/H)
	var/found1 = FALSE
	var/found2 = FALSE
	if (faction && H.civilization != faction)
		to_chat(H, "你没有接受过操作这台机器的训练.")
		return
	if (on)
		to_chat(H, "组装机正忙, 请稍候...")
		return
	for(var/obj/structure/assembler/processor/A in locate(x+1,y,z))
		found1 = TRUE
	for(var/obj/structure/assembler/unloader/A in locate(x+2,y,z))
		found2 = TRUE
	if (!found1 && !found2)
		to_chat(H, "组装机不完整, 无法使用.")
		return
	if (istype(I, requires))
		H.drop_from_inventory(I)
		I.forceMove(locate(1,1,1))
		manufacture(I,H)
	else
		to_chat(H, "<span class='warning'>这是错误的前体材料!</span>")
		return
/obj/structure/assembler/loader/manufacture(var/obj/item/stack/precursor/P,var/mob/living/human/H)
	if (istype(P,/obj/item/stack/precursor))
		for(var/mob/L in range(7,src))
			L << sound('sound/machines/steam_loop.ogg', 1, 0, 987, 100)
			spawn(520)
				L << sound(null, channel = 987)
		on = TRUE
		update_icon()
		spawn(20)
			if (P)
				on = FALSE
				update_icon()
				for(var/obj/structure/assembler/processor/A in locate(x+1,y,z))
					A.manufacture(P)
					return
			else
				on = FALSE
				update_icon()
				return
/obj/structure/assembler/proc/manufacture(var/obj/item/stack/precursor/P,var/mob/living/human/H)
	return

/obj/structure/assembler/processor/manufacture(var/obj/item/stack/precursor/P,var/mob/living/human/H)
	on = TRUE
	update_icon()
	spawn(500)
		on = FALSE
		update_icon()
		for(var/obj/structure/assembler/unloader/A in locate(x+1,y,z))
			A.manufacture(P)
			return
/obj/structure/assembler/unloader/manufacture(var/obj/item/stack/precursor/P,var/mob/living/human/H)
	on = TRUE
	update_icon()
	spawn(20)
		for(var/i=1, i<=P.amount,i++)
			new P.produces(loc)
		on = FALSE
		qdel(P)
		update_icon()
//////////////////programs////////////////////

/obj/item/weapon/disk/program
	name = "程序盘"
	desc = "用于启动 unga OS 的磁盘."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "disk_black"
	item_state = "disk_black"
	is_contraband = FALSE
	var/included
	var/list/compatible_os = list()

	attackby(obj/item/W, mob/living/M)
		return

/obj/item/weapon/disk/program/orion_trail
	name = "猎户座之旅 安装盘"
	desc = "了解我们的后代将如何抵达猎户座, 并在此过程中享受乐趣!"
	compatible_os = list("unga OS 94")
	New()
		..()
		included = /datum/program/orion_trail

/obj/item/weapon/disk/program/monkeysoftmail
	name = "MonkeySoft Mail 安装盘"
	desc = "使用最新的 MonkeySoft Mail 客户端发送和接收电子邮件!"
	compatible_os = list("unga OS 94", "unga OS")
	New()
		..()
		included = /datum/program/monkeysoftmail

/obj/item/weapon/disk/program/squadtracker
	name = "Squad-Trak 安装盘"
	desc = "追踪你小队的位置."
	compatible_os = list("unga OS 94","unga OS 94 Law Enforcement Edition")
	New()
		..()
		included = /datum/program/squadtracker
