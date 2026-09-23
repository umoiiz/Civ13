/obj/map_metadata/nomads/africa
	ID = MAP_NOMADS_AFRICA
	title = "Nomads (Africa)"
	research_active = TRUE

	var/eruptions_enabled = TRUE

/obj/map_metadata/nomads/africa/New()
	..()
	spawn(2000)
		eruption_check()

/obj/map_metadata/nomads/africa/proc/eruption_check()
	spawn(rand(33000,40000))
		if (eruptions_enabled)
			do_eruption()
		eruption_check()

/obj/map_metadata/nomads/africa/proc/do_eruption()
	if (eruptions_enabled)
		if (clients.len>5)
			to_chat(world, "<big><b>山体轰鸣, 浓烟从山顶涌出... 一场喷发可能即将来临...</b></big>")
			spawn(rand(4800,6000))
				if (clients.len>5)
					volcano_eruption()
				return
		else
			return FALSE
	else
		return FALSE

/obj/map_metadata/nomads/africa/volcano_eruption()
	for(var/turf/wall/rockwall/lavaspawner/L in world)
		L.start_lava_flow()
	to_chat(world, "<font color='red'><big><b>火山喷发了, 熔岩顺着山体流下!</b></big></font>")
	return TRUE