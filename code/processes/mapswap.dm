/process/epochswap
	// epoch = required players

	var/list/epochs = list(
		//"Stone Age (?-3000 B.C.)" = 0,
		"PvE (Voyage, Antarctica, etc)" = 0,
		"Chad Mode" = 0,
		"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
		//"Bronze Age (3000 B.C.-400 A.D.)" = 0,
		//"Dark Ages (400-700)" = 0,
		//"Middle Ages (700-1450)" = 0,
		//"Renaissance (1450-1650)" = 0,
		//"Imperial Age (1650-1780)" = 0,
		//"Industrial Age (1850-1895)" = 0,
		//"Early Modern Era (1896-1930)" = 0,
		"Early Fire Arms (1650-1930)" = 0,
		"World War II (1931-1948)" = 0,
		//"Cold War Era (1949-1984)" = 0,
		//"Modern Era (1985-2020)" = 0,
		"Modern Fire Arms (1949-2021)" = 0,
		"HRP TDM (Gulag, Occupation, AOTD, etc)" = 10,
		"Civilization 13 (Nomads)" = 0,
		"Civilization 13 (Colony & Pioneers)" = 0,
		//"Civilization 13 (Prison Camps)" = 15,
		"Civilization 13 (Others)" = 0,
		"Battle Royale" = 0,
		"Fiction" = 0,
	)
	var/list/epoch_desc = list(
		"Chad Mode"                              = "Stone Age survival with scarce resources, hostile wildlife, and no research. A brutal, unforgiving experience.",
		"Pre-Firearms (3000 B.C-1650 A.D.)"      = "Ancient to early-medieval warfare: swords, spears, bows, and siege weapons across iconic historical battlefields.",
		"PvE (Voyage, Antarctica, etc)"          = "Co-operative PvE adventures. Lowpop friendly maps.",
		"Early Fire Arms (1650-1930)"            = "Muskets, rifles, and early artillery spanning the colonial era, Napoleonic wars, and WWI.",
		"World War II (1931-1948)"               = "Full-scale industrial warfare across iconic WWII theatres, from Stalingrad to Normandy.",
		"Modern Fire Arms (1949-2021)"           = "Post-war conflicts from Vietnam to modern-day special operations and urban combat.",
		"HRP TDM (Gulag, Occupation, AOTD, etc)" = "Heavy roleplay scenarios: prison camps, occupied territories, and narrative-driven missions.",
		"Civilization 13 (Nomads)"               = "Open-ended civilization-building starting from the Stone Age across diverse landscapes.",
		"Civilization 13 (Colony & Pioneers)"    = "Colonial-era settlement and frontier expansion: carve out a new world.",
		"Civilization 13 (Others)"               = "Miscellaneous Civ13 scenarios including tribal conflicts, hunts, and kingdom struggles.",
		"Battle Royale"                          = "Last-man-standing combat across multiple historical eras. Only one survives.",
		"Fiction"                                = "Fictional and fantasy settings: space battles, Skyrim, and beyond.",
	)
	var/ready = TRUE
	var/restart_triggered = FALSE
	var/finished_at = -1

/process/epochswap/setup()
	name = "epochswap"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list(GAME_STATE_PLAYING, GAME_STATE_FINISHED)
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.epochswap = src

/process/epochswap/fire()
	// no SCHECK here
	if (is_ready())
		spawn(20)
			map.save_awards()
		if(map.ID == MAP_VOYAGE)
			var/obj/map_metadata/voyage/nmap = map
			nmap.show_stats()
		if (config.allowedgamemodes == "TDM")
			if (clients.len >= 25) // Temporary solution
				var/moderator_present = FALSE
				for (var/client/C in admins)
					if(R_MOD||R_ADMIN & C.holder.rights)
						moderator_present = TRUE
						break
				if (moderator_present == TRUE)
					epochs = list(
						"PvE (Voyage, Antarctica, etc)" = 0,
						"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
						"Early Fire Arms (1650-1930)" = 0,
						"World War II (1931-1948)" = 0,
						"Modern Fire Arms (1949-2021)" = 0,
						"Fiction" = 0,
						"Battle Royale" = 6,
						"HRP TDM (Gulag, Occupation, AOTD, etc)" = 10,
						"Chad Mode" = 30,
//						"MilSim (BETA TESTING)" = 20,
					)
				else
					epochs = list(
						"PvE (Voyage, Antarctica, etc)" = 0,
						"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
						"Early Fire Arms (1650-1930)" = 0,
						"World War II (1931-1948)" = 0,
						"Modern Fire Arms (1949-2021)" = 0,
						"Fiction" = 0,
						"Battle Royale" = 6,
						"Chad Mode" = 30,
//						"MilSim (BETA TESTING)" = 20,
					)
			else
				epochs = list(
					"PvE (Voyage, Antarctica, etc)" = 0,
					"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
					"Early Fire Arms (1650-1930)" = 0,
					"World War II (1931-1948)" = 0,
					"Modern Fire Arms (1949-2021)" = 0,
					"Fiction" = 0,
					"Battle Royale" = 6,
					"HRP TDM (Gulag, Occupation, AOTD, etc)" = 20,
//					"MilSim (BETA TESTING)" = 20,
				)

		else if (config.allowedgamemodes == "RP")
			epochs = list(
//				"The Art of the Deal" = 10,
				"Civilization 13 (Nomads)" = 0,
				"Civilization 13 (Colony & Pioneers)" = 0,
//				"Civilization 13 (Prison Camps)" = 15,
				"Civilization 13 (Others)" = 0,)

		else if (config.allowedgamemodes == "PERSISTENCE")
			epochs = list(
				"Civilization 13 (Nomads)" = 0,)

		else if (config.allowedgamemodes == "BR")
			epochs = list(
				"Battle Royale" = 6,)

		ready = FALSE
		vote.initiate_vote("epoch", "EpochSwap Process", TRUE, list(src, "swap"))

/process/epochswap/proc/is_ready()
	. = FALSE
	if (ready)
		if (restart_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = TRUE
	return .

/process/epochswap/proc/swap(var/winner = "Imperial Age (1650-1780)")
	vote.voted_epoch = winner


/process/mapswap
	// map = required players
	var/list/maps = list(MAP_KARAK = 0,)
	var/epoch = "Imperial Age (1650-1780)"
	var/ready = TRUE
	var/restart_triggered = FALSE
	var/finished_at = -1
	var/next_map_title = "TBD"
	var/done = FALSE

/process/mapswap/setup()
	name = "mapswap"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list(GAME_STATE_PLAYING, GAME_STATE_FINISHED)
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.mapswap = src

/process/mapswap/fire()
	// no SCHECK here
	done = FALSE
	if (is_ready())
		ready = FALSE
		epoch = vote.voted_epoch
		switch(epoch)
			if ("Stone Age (?-3000 B.C.)")
				maps = list(
					MAP_FOUR_KINGDOMS = 0,
					MAP_TRIBES = 0,
				)
			if ("Pre-Firearms (3000 B.C-1650 A.D.)")
//			1013 - TDM
				maps = list(
					MAP_KARAK = 0,
					MAP_CAMP = 0,
					MAP_OASIS = 0,
					MAP_HERACLEA = 0,
					MAP_CLASH = 0,
					MAP_SIEGE = 0,
					MAP_GLADIATORS = 0,
					MAP_TEUTOBURG = 8,
					MAP_HERACLEA = 8,
					MAP_SAMMIRHAYEED = 10,
					MAP_TWOTRIBES = 0,
				)
			if ("Early Fire Arms (1650-1930)")
// 			1903 - TDM
				maps = list(
					MAP_HILL_203 = 0,
					MAP_YPRES = 0,
					MAP_VERDUN = 8,
					MAP_SIBERSYN = 6,
					MAP_TSARITSYN = 6,
					MAP_PORT_ARTHUR = 10,
					MAP_SANTO_TOMAS = 8,
					MAP_CALOOCAN = 0,
					MAP_LITTLE_CREEK_TDM = 0,
					MAP_MISSIONARY_RIDGE = 10,
					MAP_NAVAL = 0,
//					MAP_SKULLISLAND = 0,
					MAP_SUPPLY_RAID = 0,
					MAP_BRIDGE = 0,
					MAP_RECIFE = 10,
					MAP_FIELDS = 10,
					MAP_RUHR_UPRISING = 14,
					MAP_ROBUSTA = 15,
					MAP_SEKIGAHARA = 6,
				)
			if ("World War II (1931-1948)")
//	 		1943 - TDM
				maps = list(
					MAP_REICHSTAG = 0,
					MAP_MICROMAHA = 0,
					MAP_NANKOU = 0,
					MAP_MARCO_POLO_BRIDGE = 0,
					MAP_SMALLINGRAD = 0,
					MAP_REICHFLAKTURM = 0,
					MAP_PAVLOV_HOUSE = 0,
					MAP_HOTEL = 0,
					MAP_KHALKHYN_GOL = 8,
					MAP_KURSK = 10,
					MAP_BARBAROSSA = 10,
					MAP_VITEBSK = 10,
					MAP_STALINGRAD = 10,
					MAP_LONG_MARCH = 12,
					MAP_ARDENNES = 12,
					MAP_SMALLSIEGEMOSCOW = 12,
					MAP_INTRAMUROS = 14,
					MAP_RIZAL_STADIUM = 14,
					MAP_WAKE_ISLAND = 14,
					MAP_NANJING = 14,
					MAP_WARSAW = 14,
					MAP_OMAHA = 20,
//					MAP_BIGSIEGEMOSCOW = 20,
					MAP_FOREST = 20,
//					MAP_KARELIA = 14,
					MAP_BERLIN = 20,
//					MAP_IWO_JIMA = 40,
				)
			if ("Modern Fire Arms (1949-2021)")
// 			2013 - TDM
				maps = list(
					MAP_RETREAT = 6,
					MAP_ROAD_TO_DAK_TO = 0,
					MAP_COMPOUND = 6,
					MAP_ONG_THAHN = 12,
					MAP_HUE = 15,
					MAP_AFRICAN_WARLORDS = 6,
					MAP_TADOJSVILLE = 12,
					MAP_ZHENBAO = 10,
					MAP_MAGISTRAL = 10,
					MAP_HILL_3234 = 12,
					MAP_KANDAHAR = 16,
					MAP_ALLEYWAY = 0,
					MAP_WACO = 0,
					MAP_YELTSIN = 6,
					MAP_GROZNY = 10,
					MAP_BANK_ROBBERY = 0,
					MAP_DRUG_BUST = 0,
					MAP_ARAB_TOWN = 0,
					MAP_ARAB_TOWN_2 = 0,
					MAP_HOSTAGES = 0,
					MAP_SYRIA = 6,
					MAP_CAPITOL_HILL = 6,
				)
			if ("Fiction")
				maps = list(
					MAP_TANTIVEIV = 0,
					MAP_WHITERUN = 10,
					MAP_ROTSTADT = 12,
				)
			if ("HRP TDM (Gulag, Occupation, AOTD, etc)")
				maps = list(
//					MAP_HUNT = 6,
//					MAP_FOOTBALL = 6,
					MAP_GULAG13 = 6,
//					MAP_ABASHIRI = 6,
//					MAP_RIVER_KWAI = 0,
					MAP_LITTLE_CREEK = 6,
					MAP_OCCUPATION = 10,
					MAP_THE_ART_OF_THE_DEAL = 18,
				)
			if ("Battle Royale")
				maps = list(
					MAP_BATTLEROYALE_MEDIEVAL = 0,
					MAP_BATTLEROYALE_IMPERIAL = 0,
					MAP_BATTLEROYALE_WILDWEST = 0,
					MAP_BATTLEROYALE_MODERN = 0,
//					MAP_HUNGERGAMES = 0,
				)
			if ("MilSim (BETA TESTING)")
//			MilSim 2014 to 2023 - TDM
				maps = list(
					MAP_OPERATION_FALCON = 0,
				)
			if ("Chad Mode")
				maps = list(
					MAP_JUNGLE_OF_THE_CHADS = 0,
				)
			if ("PvE (Voyage, Antarctica, etc)")
				maps = list(
					MAP_ANTARCTICA = 0,
					MAP_LIGHTS_OUT = 0,
					MAP_WIZARD_BOY = 0,
					MAP_FOOTBALL = 4,
					//MAP_HUNT = 4,
					MAP_CURSED_ISLAND = 4,
					MAP_VOYAGE = 6,
				)

			if ("Civilization 13 (Nomads)")
				maps = list(
//					MAP_CIVILIZATIONS = 0,
					MAP_NOMADS = 0,
					MAP_NOMADS_DESERT = 0,
					MAP_NOMADS_ICE_AGE = 0,
					MAP_NOMADS_JUNGLE = 0,
					MAP_NOMADS_DIVIDE = 10,
					MAP_NOMADS_CONTINENTAL = 10,
					MAP_NOMADS_PANGEA = 10,
					MAP_NOMADS_WASTELAND = 0,
					MAP_NOMADS_WASTELAND_2 = 0,
					//MAP_NOMADS_WASTELAND_3 = 0,
					MAP_NOMADS_NEW_WORLD = 5,
					MAP_NOMADS_MEDITERRANEAN = 0,
//					MAP_NOMADS_ISLAND = 0,
					MAP_NOMADS_KARAFUTO = 0,
					MAP_NOMADS_EUROPE = 10,
					MAP_NOMADS_ASIA = 10,
//					MAP_NOMADS_UK = 10,
//					MAP_NOMADS_OCEANIA = 10,
				)
			if ("Civilization 13 (Colony & Pioneers)")
				maps = list(
					MAP_COLONY = 0,
					MAP_JUNGLE_COLONY = 4,
					MAP_PIONEERS = 5,
					MAP_PIONEERS_WASTELAND_2 = 0,
					MAP_BOHEMIA = 10,
					MAP_FOUR_COLONIES = 20,
				)
			if ("Civilization 13 (Others)")
				maps = list(
					MAP_TRIBES = 12,
					MAP_HUNT = 0,
					MAP_LITTLE_CREEK = 10,
					MAP_THE_ART_OF_THE_DEAL = 10,
					MAP_FOUR_KINGDOMS = 0,
					MAP_GULAG13 = 0,
//					MAP_ABASHIRI = 6,
//					MAP_RIVER_KWAI = 0,
					MAP_OCCUPATION = 10,
				)
		spawn(10)
			vote.initiate_vote("map", "MapSwap Process", TRUE, list(src, "swap"))
			return

/process/mapswap/proc/is_ready()
	. = FALSE
	if (ready)
		if (restart_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = TRUE
	return .

/process/mapswap/proc/swap(var/winner = "Karak")
	if (map_title_to_id[winner])
		winner = map_title_to_id[winner]
	next_map_title = (map_id_to_title[winner] ? map_id_to_title[winner] : winner)
	winner = uppertext(winner)
	if (!maps.Find(winner))
		winner = pick(maps)
	if (!done)
		processes.python.execute("mapswap.py", list(winner))
		done = TRUE

/process/gamemode
	var/ready = TRUE
	var/restart_triggered = FALSE
	var/finished_at = -1
	var/list/gamemode_desc = list(
		"Normal"                         = "No respawn delays, standard damage.",
		"Competitive"                    = "Respawn delay enabled, increased damage.",
		"Hardcore"                       = "No respawns, increased damage. Field of View enabled. Awards active.",
		"Classic (Stone Age Start)"      = "Starting epoch is the Stone Age, research active.",
		"Auto-Research Mode"             = "Starting epoch is the Stone Age, research active but automatic.",
		"Resource-Based Research"        = "Starting epoch is the Stone Age, research requires the sale of items through Research Desks.",
		"Chad Mode"                      = "Stone Age survival with scarce resources, hostile wildlife, and no research.",
		"Chad Mode +"                    = "Stone Age survival where research is fueled by player sacrifice.",
		"Bronze Age (No Research)"       = "The game starts in the Bronze Age. Research is disabled.",
		"Medieval (No Research)"         = "The game starts in the Medieval Age. Research is disabled.",
		"Imperial Age (No Research)"     = "The game starts in the Imperial Age. Research is disabled.",
		"Industrial Age (No Research)"   = "The game starts in the Industrial Age. Research is disabled.",
		"Early Modern Age (No Research)" = "The game starts in the Early Modern Age. Research is disabled.",
		"WW2 Age (No Research)"          = "The game starts in the World War II era. Research is disabled.",
		"Modern Age (No Research)"       = "The game starts in the Modern Age. Research is disabled.",
		"Siege"                          = "Defend a strategic objective against an attacking force within a time limit.",
		"Protect the VIP"                = "Defenders must protect a High-Value Target from attackers.",
		"Area Capture"                   = "Teams compete to control strategic areas and gain points.",
		"Kills"                          = "A direct confrontation where teams compete for the most eliminations.",
		"After the Fall"                 = "Survival in a desolate, post-apocalyptic world.",
		"Nuclear"                        = "Survival mode where a nuclear strike is imminent.",
		"Zombie Apocalypse"              = "Survive against the undead horde in a fallen society."
	)

/process/gamemode/setup()
	name = "gamemode"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list()
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.gamemode = src
/process/gamemode/fire()
	// no SCHECK here
	if (is_ready())
		ready = FALSE
		vote.initiate_vote("gamemode", "Gamemode Process", TRUE, list(src, "swap"))

/process/gamemode/proc/is_ready()
	. = FALSE

	if (ready)
		if (restart_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = FALSE
	return .

/process/gamemode/proc/swap(var/winner = "Classic (Stone Age Start)")
	vote.voted_gamemode = winner
	round_progressing = TRUE
	ticker.delay_end = FALSE
	ticker.pregame_timeleft = 10
	if (vote.voted_gamemode == "Random")
		vote.voted_gamemode = pick("Classic (Stone Age Start)", "Auto-Research Mode", "Resource-Based Research", "Bronze Age (No Research)","Medieval (No Research)","Imperial Age (No Research)", "Industrial Age (No Research)", "Early Modern Age (No Research)", "WW2 Age (No Research)", "Modern Age (No Research)")

	map.gamemode = vote.voted_gamemode
	switch (vote.voted_gamemode)
		if ("Classic (Stone Age Start)")
			to_chat(world, "<big>正在启动<b>经典</b>模式.起始时代是石器时代,研究已启用.</big>")
			map.ordinal_age = 0
			return

		if ("Chad Mode")
			to_chat(world, "<font color=#CECE00><big>正在启动<b>猛男模式</b>.游戏时代是石器时代,研究未启用.减少初始物品和更恶劣的条件.</big></font>")
			map.ordinal_age = 0
			map.research_active = FALSE
			map.chad_mode = TRUE
			for (var/obj/effect/spawner/mobspawner/MS)
				MS.buff()
			for (var/obj/structure/wild/tree/T)
				T.amount *= 0.5
				T.amount = round(T.amount)
			for (var/obj/structure/wild/jungle/J)
				J.amount *= 0.5
				J.amount = round(J.amount)
			for (var/obj/structure/wild/palm/P)
				P.amount *= 0.5
				P.amount = round(P.amount)
			for (var/obj/structure/wild/junglebush/V)
				if (prob(75) && !istype(V,/obj/structure/wild/junglebush/cinchona))
					qdel(V)
			spawn(10)
				if (map.ID == MAP_NOMADS_ICE_AGE)
					for (var/turf/floor/dirt/winter/W)
						if (prob(40))
							W.ChangeTurf(/turf/floor/winter)
					for (var/turf/floor/winter/grass/WW)
						if (prob(40))
							WW.ChangeTurf(/turf/floor/winter)
				else if (map.ID == MAP_NOMADS_JUNGLE)
					for (var/turf/floor/dirt/winter/W)
						if (prob(40))
							W.ChangeTurf(/turf/floor/winter)
					for (var/turf/floor/winter/grass/WW)
						if (prob(40))
							WW.ChangeTurf(/turf/floor/winter)
			return

		if ("Chad Mode +")
			to_chat(world, "<font color=#CECE00><big>正在启动<b>猛男模式+</b>.起始时代是石器时代,研究通过献祭玩家来完成.减少初始物品和更恶劣的条件.</big></font>")
			map.ordinal_age = 0
			map.research_active = TRUE
			map.chad_mode = TRUE
			map.chad_mode_plus = TRUE
			for (var/obj/effect/spawner/mobspawner/MS)
				MS.buff()
			for (var/obj/structure/wild/tree/T)
				T.amount *= 0.5
				T.amount = round(T.amount)
			for (var/obj/structure/wild/jungle/J)
				J.amount *= 0.5
				J.amount = round(J.amount)
			for (var/obj/structure/wild/palm/P)
				P.amount *= 0.5
				P.amount = round(P.amount)
			for (var/obj/structure/wild/junglebush/V)
				if (prob(75) && !istype(V,/obj/structure/wild/junglebush/cinchona))
					qdel(V)
			spawn(10)
				if (map.ID == MAP_NOMADS_ICE_AGE)
					for (var/turf/floor/dirt/winter/W)
						if (prob(40))
							W.ChangeTurf(/turf/floor/winter)
					for (var/turf/floor/winter/grass/WW)
						if (prob(40))
							WW.ChangeTurf(/turf/floor/winter)
				else if (map.ID == MAP_NOMADS_JUNGLE)
					for (var/turf/floor/dirt/winter/W)
						if (prob(40))
							W.ChangeTurf(/turf/floor/winter)
					for (var/turf/floor/winter/grass/WW)
						if (prob(40))
							WW.ChangeTurf(/turf/floor/winter)
			return

		if ("Bronze Age (No Research)")
			to_chat(world, "<big>正在启动<b>青铜时代</b>模式.游戏时代是青铜时代,研究未启用.</big>")
			map.ordinal_age = 1
			map.age = "313 B.C."
			map.age1_done = TRUE
			map.research_active = FALSE
			var/customresearch = 35
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Auto-Research Mode")
			to_chat(world, "<big>正在启动<b>自动研究模式</b>.起始时代是石器时代,研究已启用但自动进行.</big>")
			map.research_active = FALSE //well, it is, but we dont get research kits.
			map.autoresearch = TRUE
			map.ordinal_age = 0
			spawn(100)
				map.autoresearch_proc()
			return

		if ("Resource-Based Research")
			to_chat(world, "<big>正在启动<b>资源型研究</b>.起始时代是石器时代,研究已启用,需要通过<b>研究台</b>出售物品.</big>")
			map.research_active = FALSE //well, it is, but we dont get research kits.
			map.resourceresearch = TRUE
			map.ordinal_age = 0
			return

		if ("Bronze Age Start")
			to_chat(world, "<big>正在启动经典模式,以<b>青铜时代</b>开始.起始时代是青铜时代,研究已启用.</big>")
			map.ordinal_age = 1
			map.age = "313 B.C."
			map.age1_done = TRUE
			map.research_active = TRUE
			var/customresearch = 35
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Medieval (No Research)")
			to_chat(world, "<big>正在启动<b>中世纪</b>模式.游戏时代是中世纪,研究未启用.</big>")
			map.ordinal_age = 2
			map.age = "1013"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.research_active = FALSE
			var/customresearch = 50
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Imperial Age (No Research)")
			to_chat(world, "<big>正在启动<b>帝国时代</b>模式.游戏时代是帝国时代,研究未启用.</big>")
			map.ordinal_age = 3
			map.age = "1713"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.age3_done = TRUE
			map.research_active = FALSE
			var/customresearch = 90
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Industrial Age (No Research)")
			to_chat(world, "<big>正在启动<b>工业时代</b>模式.游戏时代是工业时代,研究未启用.</big>")
			map.ordinal_age = 4
			map.age = "1873"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.age3_done = TRUE
			map.age4_done = TRUE
			map.research_active = FALSE
			var/customresearch = 105
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Early Modern Age (No Research)")
			to_chat(world, "<big>正在启动<b>近代早期</b>模式.游戏时代是近代早期,研究未启用.</big>")
			map.ordinal_age = 5
			map.age = "1903"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.age3_done = TRUE
			map.age4_done = TRUE
			map.age5_done = TRUE
			map.research_active = FALSE
			var/customresearch = 135
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("WW2 Age (No Research)")
			to_chat(world, "<big>正在启动<b>二战时代</b>模式.游戏时代是二战时代,研究未启用.</big>")
			map.ordinal_age = 6
			map.age = "1943"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.age3_done = TRUE
			map.age4_done = TRUE
			map.age5_done = TRUE
			map.age6_done = TRUE
			map.research_active = FALSE
			var/customresearch = 152
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		if ("Modern Age (No Research)")
			to_chat(world, "<big>正在启动<b>现代</b>模式.游戏时代是现代,研究未启用.</big>")
			map.ordinal_age = 8
			map.age = "2013"
			map.age1_done = TRUE
			map.age2_done = TRUE
			map.age3_done = TRUE
			map.age4_done = TRUE
			map.age5_done = TRUE
			map.age6_done = TRUE
			map.age7_done = TRUE
			map.age8_done = TRUE
			map.research_active = FALSE
			var/customresearch = 230
			map.default_research = customresearch
			map.civa_research = list(customresearch,customresearch,customresearch,null)
			map.civb_research = list(customresearch,customresearch,customresearch,null)
			map.civc_research = list(customresearch,customresearch,customresearch,null)
			map.civd_research = list(customresearch,customresearch,customresearch,null)
			map.cive_research = list(customresearch,customresearch,customresearch,null)
			map.civf_research = list(customresearch,customresearch,customresearch,null)
			return

		/// TDM MODES ///
		if ("Normal")
			to_chat(world, "<font color='green'><big>普通模式</big><br>无重生延迟.</big></font>")
			config.disable_fov = TRUE
			config.no_respawn_delays = TRUE
			map.gamemode = "Normal"
			global_damage_modifier = 1
			return

		if ("Competitive")
			to_chat(world, "<font color='yellow'><big>竞技模式</big><br>启用重生延迟, 提高伤害.</big></font>")
			config.disable_fov = TRUE
			config.no_respawn_delays = FALSE
			map.gamemode = "Competitive"
			global_damage_modifier = 1.15
			return

		if ("Hardcore")
			to_chat(world, "<font color='red'><big>硬核模式</big><br>无法重生, 提高伤害. 启用视野限制. 奖励已激活.</big></font>")
			config.disable_fov = FALSE
			config.no_respawn_delays = FALSE
			map.gamemode = "Hardcore"
			global_damage_modifier = 1.15
			return

		/// CAPITOL MODES //
		if ("Siege")
			if (map && map.ID == MAP_CAPITOL_HILL)
				to_chat(world, "<font color='yellow'><big>围攻</big><br><b>国民警卫队</b>必须保卫<b>国会</b>和<b>参议院</b></big>,坚守<b>40分钟</b>!</font>")
			else if (map && map.ID == MAP_YELTSIN)
				to_chat(world, "<font color='yellow'><big>围攻</big><br><b>民兵</b>必须保卫<b>议会大厅</b></big>直到<b>40分钟</b>!<br><font size=4>所有阵营在战斗开始前有<b>10分钟</b>的准备时间.</font>")
			else if (map && map.ID == MAP_WACO)
				to_chat(world, "<font color='yellow'><big>围攻</big><br><b>大卫教派</b>必须保卫<b>卡梅尔山庄园</b></big>直到<b>20分钟</b>结束!<br><font size=4>所有阵营在战斗开始前有<b>3分钟</b>的准备时间.</font>")
			config.disable_fov = TRUE
			config.no_respawn_delays = TRUE
			map.gamemode = "Siege"
			if (map && map.ID == MAP_WACO)
				for (var/turf/T in get_area_turfs(/area/caribbean/british/land/inside/objective))
					new /area/caribbean/no_mans_land/capturable(T)
			else
				for (var/turf/T in get_area_turfs(/area/caribbean/no_mans_land/capturable/one))
					new /area/caribbean/british/land/inside/objective(T)
				for (var/turf/T in get_area_turfs(/area/caribbean/no_mans_land/capturable/two))
					new /area/caribbean/british/land/inside/objective(T)
			return

		if ("Protect the VIP")
			if (map && map.ID == MAP_CAPITOL_HILL)
				to_chat(world, "<font color='yellow'><big>保护要员</big><br><b>高价值目标</b>正被<b>FBI</b>保护在国民警卫队控制的国会大厦内. 抗议者必须找到他!<br>他们有<b>25分钟的时间来完成!</b></big></font>")
			else if (map && map.ID == MAP_YELTSIN)
				to_chat(world, "<font color='yellow'><big>保护要员</big><br><b>高价值目标</b>正被<b>KGB</b>保护在民兵控制的国会大厦内. 苏联军队必须找到他们!<br>他们有<b>40分钟的时间来完成!</b></big></font>")
			if (map && map.ID == MAP_WACO)
				to_chat(world, "<font color='yellow'><big>保护要员</big><br><b>大卫·考雷什</b>正被<b>大卫教派</b>保护在卡梅尔山庄园内. ATF必须找到他!<br>他们有<b>20分钟的时间来完成!</b></big></font>")
			config.disable_fov = TRUE
			config.no_respawn_delays = TRUE
			map.gamemode = "Protect the VIP"
			return

		if ("Area Capture")
			to_chat(world, "<font color='yellow'><big>区域占领</big><br>占领<b>国会</b>和<b>参议院</b>来获得分数. 首先达到<b>40分</b>的队伍获胜!</big></font>")
			config.disable_fov = TRUE
			config.no_respawn_delays = TRUE
			map.gamemode = "Area Capture"
			var/obj/map_metadata/capitol_hill/CP = map
			CP.points_check()
			return

		if ("Kills")
			if (map && map.ID == MAP_CAPITOL_HILL)
				to_chat(world, "<font color='yellow'><big>击杀</big><br><b>美国民兵</b>突袭了<b>国民警卫队</b>控制的国会大厦!</b></big></font>")
				var/obj/map_metadata/capitol_hill/CP = map
				CP.points_check()
			else if (map && map.ID == MAP_YELTSIN)
				to_chat(world, "<font color='yellow'><big>击杀</big><br><b>苏联军队</b>突袭了<b>民兵</b>控制的国会大厦!</b></big></font>")
				var/obj/map_metadata/yeltsin/CP = map
				CP.points_check()
			config.disable_fov = TRUE
			config.no_respawn_delays = TRUE
			map.gamemode = "Kills"
			return

		/// WASTELAND MODES //
		if ("After the Fall")
			to_chat(world, "<font color='yellow'><big>陨落之后</big><br>世界早已变得荒芜破败. 你能生存下来吗?</big><br><b>Wiki指南: https://civ13.github.io/civ13-wiki/gamemodes/Civilizations_and_Nomads</b>")
			map.gamemode = "After the Fall"
			map.is_zombie = FALSE
			map.hasnukes = FALSE
			return

		if ("Nuclear")
			to_chat(world, "<font color='yellow'><big>核弹</big><br>更糟的是, 在2到3.5小时之间的某个时候, 一枚核导弹将击中附近某处. 你能生存下来吗?</big><br><b>Wiki指南: https://civ13.github.io/civ13-wiki/gamemodes/Civilizations_and_Nomads</b>")
			map.gamemode = "Nuclear"
			map.is_zombie = FALSE
			map.hasnukes = TRUE
			return

		if ("Zombie Apocalypse")
			to_chat(world, "<font color='yellow'><big>僵尸末日</big><br>出了可怕的差错. 怪物横行世界, 社会已经崩溃. 你能生存下来吗?</big><br><b>Wiki指南: https://civ13.github.io/civ13-wiki/gamemodes/Civilizations_and_Nomads</b>")
			map.gamemode = "Zombie Apocalypse"
			map.is_zombie = TRUE
			map.hasnukes = FALSE
			return
