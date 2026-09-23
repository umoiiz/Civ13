
/obj/map_metadata/bagne13
	ID = MAP_BAGNE13
	title = "Bagne 13"
	no_winner ="The round is proceeding normally."
	lobby_icon = "icons/lobby/bagne.png"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/jungle, /area/caribbean/no_mans_land/invisible_wall/one)
	respawn_delay = 3600
	has_hunger = TRUE
	//this follows the format mob = list(item to score, target amount, current amount)
	var/list/prisoner_scores = list()

	faction_organization = list(
		FRENCH,
		CIVILIAN)

	roundend_condition_sides = list(
		list(FRENCH) = /area/caribbean/british,
		list(CIVILIAN) = /area/caribbean/russian/land/inside/command,
		)
	age = "1933"
	ordinal_age = 6
	faction_distribution_coeffs = list(FRENCH = 0.25, CIVILIAN = 0.75)
	battle_name = "Bagne de L'Enfer Vert"
	mission_start_message = "<font size=4>You have <b>4 minutes</b> to prepare before the grace wall is removed.<br>The <b>Guards</b> must keep the prisoners contained, and make them serve the French Republic with forced labor. The <b>Prisoners</b> must try to survive, work, and fulfill their personal objectives.</font>"
	faction1 = FRENCH
	faction2 = CIVILIAN
	valid_weather_types = list(WEATHER_NONE, WEATHER_WET, WEATHER_EXTREME)
	songs = list(
		"Red Army Choir - Slavery and Suffering:1" = "sound/music/slavery_and_suffering.ogg")
	gamemode = "Prison Simulation"
	var/score_guards = 0
	is_RP = TRUE
	var/siren = FALSE
	grace_wall_timer = 2400

/obj/map_metadata/bagne13/roundend_condition_def2name(define)
	..()
	switch (define)
		if (FRENCH)
			return "Guard"
		if (CIVILIAN)
			return "Prisoner"
/obj/map_metadata/bagne13/roundend_condition_def2army(define)
	..()
	switch (define)
		if (FRENCH)
			return "Guards"
		if (CIVILIAN)
			return "Prisoners"

/obj/map_metadata/bagne13/army2name(army)
	..()
	switch (army)
		if ("Guards")
			return "Guard"
		if ("Prisoners")
			return "Prisoner"


/obj/map_metadata/bagne13/cross_message(faction)
	if (faction == CIVILIAN)
		return ""
	else if (faction == FRENCH)
		return "<font size = 4>The grace wall is down!</font>"
	else
		return ""

/obj/map_metadata/bagne13/reverse_cross_message(faction)
	if (faction == CIVILIAN)
		return ""
	else if (faction == FRENCH)
		return "<font size = 4>The grace wall is up!</font>"
	else
		return ""
/obj/map_metadata/bagne13/New()
	..()
	spawn(100)
		load_new_recipes("config/crafting/material_recipes_camp.txt")
		override_global_recipes = "camp"
	spawn(3000)
		check_points_msg()
		config.no_respawn_delays = FALSE

/obj/map_metadata/bagne13/proc/check_points_msg()
	spawn(1)
		to_chat(world, "<font size = 4><span class = 'notice'><b>守卫得分:</b> </span>[score_guards]</font>")
		
		for (var/mob/living/human/H in prisoner_scores)
			if (H && H.stat != DEAD && H.client)
				var/score = prisoner_scores[H][3]
				var/score_tgt = prisoner_scores[H][2]
				var/score_item = prisoner_scores[H][1]
				to_chat(H, "<font size = 4><span class = 'notice'>你当前的得分是: </span><b>[score]</b>,满分 <b>[score_tgt]</b> [score_item].</font>")
	spawn(2400)
		check_points_msg()
	return

/obj/map_metadata/bagne13/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (caribbean_blocking_area_types.Find(A.type))
		return (!faction1_can_cross_blocks() || !faction2_can_cross_blocks())
	return FALSE

/obj/map_metadata/bagne13/proc/alarm_proc()
	if (siren)
		var/warning_sound = sound("sound/misc/siren.ogg", repeat = FALSE, wait = TRUE, channel = 777)
		for (var/mob/M in player_list)
			if (M && M.client)
				M.client << warning_sound
		to_chat(world, "<font size=3 color='red'><center><b>警报</b><br>警报仍在响!</center></font>")

		spawn(285)
			if (siren)
				alarm_proc()
			return

/obj/map_metadata/bagne13/update_win_condition()
	if (win_condition_spam_check)
		return FALSE
	if (processes.ticker.playtime_elapsed > 45000 || map.round_finished) //75 mins
		ticker.finished = TRUE
		to_chat(world, "<font size = 4><span class = 'notice'>回合已结束! 守卫得分: </span><b>[score_guards]</b></font>")
		for (var/mob/living/human/H in prisoner_scores)
			if (H && H.stat != DEAD && H.client)
				var/score = prisoner_scores[H][3]
				var/score_tgt = prisoner_scores[H][2]
				var/score_item = prisoner_scores[H][1]
				if (score >= score_tgt)
					to_chat(H, "<font size = 4><span style='color:green'><b>恭喜! 你达成了你的个人目标!</b></span></font>")
					to_chat(H, "<font size = 4>你的最终得分是: <b>[score]</b>,满分 <b>[score_tgt]</b> [score_item].</font>")
					if (H.client && H.client.ckey)
						to_chat(world, "[H.ckey]: <span style='color:green'><b>成功</b></span>!")
				else
					to_chat(H, "<font size = 4><span style='color:red'><b>你未能达成你的个人目标.</b></span></font>")
					if (H.client && H.client.ckey)
						to_chat(world, "[H.ckey]: <span style='color:red'><b>失败</b></span>")
		win_condition_spam_check = TRUE
		return FALSE
	last_win_condition = win_condition.hash
	return TRUE

/obj/structure/camp_exportbook/bagne
	name = "营地出口"
	desc = "用这个从营地出口产品,获得报酬并赚取积分. 5单位木材等于1法郎."
	icon = 'icons/obj/structures.dmi'
	icon_state = "supplybook2"
	density = TRUE
	anchored = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/camp_exportbook/bagne/attackby(var/obj/item/stack/S, var/mob/living/human/H)
	var/obj/map_metadata/bagne13/G = null
	if (istype(map, /obj/map_metadata/bagne13))
		G = map
		if (istype(S, /obj/item/stack/material/wood) && S.amount >= 5)
			G.score_guards+=floor(S.amount/5)
			to_chat(H, "你出口了\the [S]. 你将为此获得[floor(S.amount/5)]法郎.")
			qdel(S)
			new/obj/item/stack/money/francs(src.loc, floor(S.amount/5))
			return
	else
		return


/obj/structure/camp_exportbook/bagne/hideout
	name = "秘密藏匿处"
	desc = "用这个藏匿你的违禁品并增加你的得分."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "beach_closed"
	density = FALSE
	anchored = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/camp_exportbook/bagne/hideout/attackby(var/obj/item/I, var/mob/living/human/H)
	var/obj/map_metadata/bagne13/G = null
	if (istype(map, /obj/map_metadata/bagne13))
		G = map
		var/accepted = FALSE
		var/accepted_item = ""
		if (G.prisoner_scores[H] && H.original_job_title == "Bucheron")
			if (istype(I, /obj/item/clothing/mask/smokable/cigarette) && G.prisoner_scores[H][1] == "cigarettes")
				G.prisoner_scores[H][3] += 1
				accepted = TRUE
				accepted_item = "cigarettes"
				qdel(I)
			else if (istype(I, /obj/item/weapon/reagent_containers/pill/opium) && G.prisoner_scores[H][1] == "opium")
				G.prisoner_scores[H][3] += 1
				accepted = TRUE
				accepted_item = "opium"
				qdel(I)
		else
			to_chat(H, "你没有个人目标,所以藏匿物品不会增加你的得分.")
			return

		if (accepted)
			to_chat(H, "你藏匿了[accepted_item]. 你当前的得分是[G.prisoner_scores[H][3]],满分[G.prisoner_scores[H][2]].")
		else
			to_chat(H, "此物品无法藏匿以获取积分.")
			return