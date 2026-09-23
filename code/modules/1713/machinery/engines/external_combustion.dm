///////////////////////EXTERNAL/////////////////////////////////////////////

//steam, sterling

/obj/structure/engine/external
	enginetype = "external"
	name = "外燃机"
	desc = "一个基础引擎."
	weight = 30
	var/defaultmaxpower = 0
	starting_snd = 'sound/machines/steam_starting.ogg'
	running_snd = 'sound/machines/steam_loop.ogg'
	ending_snd = 'sound/machines/steam_ending.ogg'
/obj/structure/engine/external/turn_on(var/mob/user = null)
	var/pwd=0
	var/hts=0
	for(var/obj/structure/heatsource/HS in range(1,src))
		hts=1
		if (HS.on)
			pwd=1
	if (pwd && hts)
		if(!on)
			visible_message("[user]打开了\the [src].","你打开了\the [src].")
			playsound(loc, starting_snd, 35, FALSE, 3)
			on = TRUE
			update_icon()
			running()
			spawn(40)
				running_sound()
			return
	else if (pwd && !hts)
		to_chat(user, "<span class = 'notice'>你需要先点燃热源.</span>")
		on = FALSE
		return
	else
		to_chat(user, "<span class = 'notice'>这个引擎需要外部热源才能工作!</span>")
		on = FALSE
		return

/obj/structure/engine/external/running()
	var/pwd=0
	for(var/obj/structure/heatsource/HSI in range(1,src))
		if (HSI.on)
			pwd=1
	if (!pwd)
		visible_message("引擎熄火了.")
		playsound(loc, ending_snd, 100, FALSE, 3)
		on = FALSE
		power_off_connections()
		currentspeed = 0
		currentpower = 0
		update_icon()
		return
	else
		maxpower = 0
		for(var/obj/structure/heatsource/HS in range(1,src))
			if (HS.on)
				maxpower += 15
		if (maxpower > defaultmaxpower)
			maxpower = defaultmaxpower
		currentpower = process_power_output()
		spawn(10)
			running()
		for (var/obj/structure/cable/CB in connections)
			CB.power_on(maxpower)
		return

/obj/structure/engine/external/New()
	..()
	defaultmaxpower = maxpower
	maxpower = 0

///////////////////////ENGINES//////////////////////////////////////////////
/obj/structure/engine/external/steam
	name = "蒸汽机"
	desc = "一个大型蒸汽动力引擎. 功率重量比低, 但适合静态运作."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "steam_static"
	engineclass = "steam"

	maxpower = 45
	torque = 1.4

/obj/structure/engine/external/aeolipile
	name = "汽转球"
	desc = "一个小型蒸汽动力装置. 功率重量比低, 但不太适合静态运作."
	icon = 'icons/obj/engines32.dmi'
	icon_state = "aeolipile_static"
	engineclass = "steam"

	maxpower = 25
	torque = 1.1

/obj/structure/engine/external/stirling
	name = "斯特林发动机"
	desc = "一个大型斯特林循环引擎. 功率重量比非常低, 但适合静态运作, 并且可以依靠任何热源或温差运行, 而不仅仅是燃烧."
	icon = 'icons/obj/engines.dmi'
	icon_state = "stirling_static"
	engineclass = "stirling"

	maxpower = 30
	torque = 1.1
