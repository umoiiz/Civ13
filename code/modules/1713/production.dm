//TO DO TODO: CHECK ALL attack_by it MUST return TRUE or FALSE if we don't want after_atttack call

//var/const/MOOD_LOSS_PER_DECISECOND_OF_MENTAL_WORK = 0.1 //it's good values, but if no restoration of mood by resting - no way to use it
//var/const/MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK = 0.05
/var/const/MOOD_LOSS_PER_DECISECOND_OF_MENTAL_WORK = 0 //setting it to 0, because have no normal mood restoration TO DO TODO: make some mood restoration on resting and sleeping, also make meditation (religion?)
/var/const/MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK = 0 //setting it to 0, because have no normal mood restoration
//TO DO TODO: Make some normalization of mood to normal state (not 100, but 50 for full water and food lvl) with time depending on the state: rest, sleep, awake
/var/const/STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK = 0 //(summ of used strength, dexterity and stamina itself in deciseconds)
/var/const/TIME_TO_DRY = 1200 //TO DO: Add dry_transform() procedure, which will replace the old mechanics of items with the mechanics of changing reagents in dried items.
//TO DO TODO: Make this proc global using
/mob/living/human/var/tmp/last_mood_check = 0

/mob/living/human/proc/in_mood(no_mood_check_treshold = 38)
	return TRUE //This is temporary! TO DO TODO: Return this function after reworking mood restoration and mood buff/debuff system
/*
	//checking mood for doing anything
	if (world.timeofday<src.last_mood_check) //prevent mood check spam
		src.mood -= 0.25
		to_chat(src, "<span class='warning'>You are far too upset to work, restore your mood first! Wait 5 seconds at minimum before trying again.</span>")
		return FALSE
	if (src.mood > no_mood_check_treshold)
		return TRUE
	if (prob(src.mood * 1.5))
		return TRUE
	else
		to_chat(src, "<span class='warning'>You are not in the mood to do this. Relax first.</span>")
		src.last_mood_check = world.timeofday + 45
		return FALSE
*/

// TO DO TODO: Make this universal proc for all expirience gains
/mob/living/human/proc/give_exp(var/list/exp_skills_list, var/list/exp_skills_percent = list(), work_amount = 10, no_emotes = FALSE, no_msg = FALSE, change_mood_coefficient = 1, EUREKA_chance = 0.5, breakthrough_chance = 5 , fail_chance = 0, EPIC_fail_chance = 0)
	// returns 0 - nothing happens, 1 - breaktrough, 2 - EUREKA, -1 - fail, -2 - EPIC fail
	// exp_skills_list - list of skills how it declared in human_defines.dm, f.e. list("swords","strength","dexterity","stamina") or empty list if you want simply generate chance
	// exp_skills_percent - list of percent distribution of gain expirience, f.e. list(85,5,5,5) or empty list, if you want equal distribution in skills experience
	// 		if you want to give more experience for any reason, then you can exceed 100% of the total experience (this will work wor mood gains too), f.e. list(130,5,5,5)
	// work_amount - in deciseconds work amount
	// no_emotes - set it to TRUE if no emotes when procedure work
	// no_msg - set it to TRUE if no messages to user when procedure work
	// change_mood_coefficient - set this multiplicator not 1 if you want greater or less effect to mood
	// EUREKA_chance, breakthrough_chance, fail_chance, EPIC_fail_chance - in percents, by default they are 0.5, 5, 5 and 0.5 ||Shinobi|| not anymore, no fails
	var/equal_distribution = 0
	var/exp_gain = work_amount/10/2 //1 exp for every 2 seconds of work
	var/e_c = EUREKA_chance * 100
	var/b_c = breakthrough_chance * 100
	var/f_c = fail_chance * 100
	var/c_c = EPIC_fail_chance * 100
	var/s_c = rand(1,10000)
	var/need_calc = work_amount && exp_skills_list.len
	var/result
	var/this_exp
	if (s_c <= e_c) // EUREKA!
		if (!no_emotes)
			src.emote(pick("laugh","dance"))
		result = 2
	else if (s_c <= e_c+b_c) // breaktrough
		if (!no_emotes)
			src.emote("giggle")
		result = 1
	else if (s_c >= 10000-c_c) // EPIC fail
		if (!no_emotes)
			src.emote(pick("cry", "scream"))
		result = -1
	else if (s_c >= 10000-c_c-f_c) // fail
		if (!no_emotes)
			src.emote("sigh")
		result = -2
	else // all as usual
		result = 0
	if (need_calc)
		if (exp_skills_list.len < exp_skills_percent) //equal distribution
			equal_distribution = 100 / exp_skills_list.len
		for (var/I=1, I<exp_skills_list.len+1, I++)
			if (equal_distribution>0)
				this_exp = exp_gain*equal_distribution/100
			else
				this_exp = exp_gain*exp_skills_percent[I]/100
			switch (result)
				if (2) // EUREKA!
					if (exp_skills_list[I] in list ("strength", "dexterity", "stamina"))
						src.adaptStat(exp_skills_list[I],this_exp) //no boost for physical stats
						src.mood += this_exp * change_mood_coefficient / 5 //mood busted as usual too
						continue
					src.adaptStat(exp_skills_list[I],this_exp*20) //20 times more than usual. EUREKA!
					src.mood += this_exp * change_mood_coefficient * 2 //10 times more than usual
					if(!no_msg)
						if (exp_skills_list[I] in list ("crafting", "swords", "bows", "farming", "throwing", "magic", "philosophy"))
							to_chat(src, "<span class='good'>尤里卡!</span> <span class='notice'>你对[exp_skills_list[I]]有了更深入的了解.</span>")
						if (exp_skills_list[I] in list ("rifle", "pistol", "machinegun"))
							to_chat(src, "<span class='good'>尤里卡!</span> <span class='notice'>你对[exp_skills_list[I]]有了更深入的了解.</span>")
						if (exp_skills_list[I] == "medical")
							to_chat(src, "<span class='good'>尤里卡!</span> <span class='notice'>你对医学有了更深入的了解.</span>")
				if (1) // breaktrough
					if (exp_skills_list[I] in list ("strength", "dexterity", "stamina"))
						src.adaptStat(exp_skills_list[I],this_exp) //no boost for physical stats
						src.mood += this_exp * change_mood_coefficient / 5 //mood busted as usual too
						continue
					src.adaptStat(exp_skills_list[I],this_exp*3) //3 times more than usual.
					src.mood += this_exp * change_mood_coefficient / 5 * 2 //2 times more than usual
					if(!no_msg)
						if (exp_skills_list[I] in list ("crafting", "swords", "bows", "farming", "throwing", "magic", "philosophy"))
							to_chat(src, "<span class='notice'>你对[exp_skills_list[I]]的了解略有增加.</span>")
						if (exp_skills_list[I] in list ("rifle", "pistol", "machinegun"))
							to_chat(src, "<span class='notice'>你对[exp_skills_list[I]]的了解略有增加.</span>")
						if (exp_skills_list[I] == "medical")
							to_chat(src, "<span class='notice'>你对医学的了解略有增加.</span>")
				if (-1) // fail
					src.adaptStat(exp_skills_list[I],this_exp/2) //small mood decreasing, 1/2 exp gain
					src.mood -= this_exp * change_mood_coefficient / 5
				if (-2) // EPIC fail
					if (exp_skills_list[I] in list ("strength", "dexterity", "stamina"))
						src.mood -= this_exp * change_mood_coefficient / 5 //small mood decreasing for physical stats
						continue
					src.adaptStat(exp_skills_list[I],-this_exp*3) //3 times skill anti-boost
					src.mood -= this_exp * change_mood_coefficient / 5 * 5 //5x mood decreasing for intellectual skills
					if(!no_msg)
						if (exp_skills_list[I] in list ("crafting", "swords", "bows", "farming", "throwing", "magic", "philosophy"))
							to_chat(src, "<span class='notice'>你的[exp_skills_list[I]]技能略有退步.</span>")
						if (exp_skills_list[I] in list ("rifle", "pistol", "machinegun"))
							to_chat(src, "<span class='notice'>你的[exp_skills_list[I]]技能略有退步.</span>")
						if (exp_skills_list[I] == "medical")
							to_chat(src, "<span class='notice'>你的医学技能略有退步.</span>")
				else // all as usual
					src.adaptStat(exp_skills_list[I],this_exp)
					src.mood += this_exp * change_mood_coefficient / 5 //small happiness boost, when succeeded (1*coefficient for each 10 seconds of work)
	return result

//TO DO TODO: make this procedure global using
/obj/structure/proc/wrench_action(var/mob/living/human/H)
	if (powersource)
		to_chat(H, SPAN_NOTICE("Remove the cables first."))
		return
	if(!not_movable)
		playsound(src.loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		H.visible_message(
			"<span class='notice'>你可以看到[H.name][anchored ? "un" : ""]如何系紧[src].</span>",
			"<span class='notice'>你[anchored ? "un" : ""]系紧了[src].</span>",
			"<span class='notice'>有人系紧或解开了什么东西.</span>")
		anchored = !anchored
	else
		to_chat(H, "<span class='warning'>\The [src]无法移动.</span>")

//TO DO TODO: make this procedure global using
/obj/structure/proc/hammer_action(var/mob/living/human/H, var/obj/item/weapon/W, var/work_amount = 50, var/list/components = list(), var/list/quantities = list())
	// Dismantling procedure
	// Good: when set work_amount as time of creation, quantities as 75% of used items
	if(!not_disassemblable)
		if (!H.in_mood())
			return
		var/I = work_amount*(0.85/H.getStatCoeff("crafting") + 0.05/H.getStatCoeff("strength") + 0.05/H.getStatCoeff("dexterity") + 0.05/H.getStatCoeff("stamina"))
		if (istype(W,/obj/item/weapon/hammer/tribalhammer))
			I *= 1.5
		if (istype(W,/obj/item/weapon/hammer/modern))
			I /= 1.5
		I = clamp(I, 10, 300)
		if (H.stats["stamina"][1]<H.stats["stamina"][2])
			if (H.stats["stamina"][1]<I*STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK)
				to_chat(H, "<span class='warning'>你必须先恢复体力才能拆解[src].</span>")
				return
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		H.visible_message(
			"<span class='notice'>你可以看到[H.name]如何开始拆解\the [src].</span>",
			"<span class='notice'>你开始拆解\the [src].</span>",
			"<span class='notice'>有人正在拆解什么东西.</span>")
		if (do_after(H, I , src))
			H.stats["stamina"][1] -= I*STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK*0.15
			H.mood -= I*MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK*0.15
			H.mood -= I*MOOD_LOSS_PER_DECISECOND_OF_MENTAL_WORK*0.85
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]如何拆解了\the [src].</span>",
				"<span class='notice'>你拆解了\the [src].</span>",
				"<span class='notice'>有人拆解了什么东西.</span>")
			H.give_exp(list("crafting","strength","dexterity","stamina"), list(85,5,5,5), I)
			I = 1
			for (var/P in components)
				new P(src.loc, quantities[I])
				I++
			for (var/obj/item/P in contents)
				P.loc = src.loc
			qdel(src)
		else
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]如何停止拆解\the [src].</span>",
				"<span class='notice'>你停止了拆解\the [src].</span>",
				"<span class='notice'>棘轮声消失了.</span>")
	else
		to_chat(H, "<span class='warning'>\The [src]无法被拆解.</span>")

////////////////////////////////////////////////////////////////////////
//  Loom  //////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// TO DO TODO: Reconsider the weaving process in a more realistic way (different technological levels
//  	of weaving, a more detailed process: material -> threads -> fabric) e t.c.
/obj/structure/loom
	name = "织布机"
	desc = "一台织布机,用于将棉花织成布料."
	icon = 'icons/obj/structures.dmi'
	icon_state = "loom"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/tmp/obj/item/stack/current_work = null
	var/tmp/obj/item/stack/current_material = null
	var/tmp/mob/living/human/current_user = null
	var/tmp/work_time_amount = 0

/obj/structure/loom/proc/finish_work()
	if (current_work)
		current_user.visible_message(
			"<span class='notice'>你可以看到[current_user.name]如何在\a [src.name]上制作了[current_work.name].</span>",
			"<span class='notice'>你完成了\the [current_work.name]的生产.</span>",
			"<span class='notice'>\the [src.name]的声音消失了.</span>")
		icon_state = "loom"
		qdel(current_material)
		var/obj/item/stack/this_production = new current_work.type(null, current_work.amount, FALSE) //deleting and creating for sterilization effect (we need really new object)
		current_user.put_in_active_hand(this_production)
		qdel(current_work)
		if (current_user.give_exp(list("crafting","dexterity"), list(67,33), work_time_amount) == -2)
			var/newamount = clamp(ceil(this_production.amount/2+rand(1,ceil(this_production.amount/2))),ceil(this_production.amount/2),this_production.amount)
			if (newamount < this_production.amount)
				to_chat(current_user, "<span class='bad'>你少生产了[this_production.amount - newamount][this_production.name].</span>")
				this_production.amount = newamount
		current_user.mood -= work_time_amount*MOOD_LOSS_PER_DECISECOND_OF_MENTAL_WORK*0.67
		current_user.mood -= work_time_amount*MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK*0.33
		current_user.stats["stamina"][1] -= work_time_amount*STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK*0.33
	current_work = null
	current_material = null
	current_user = null
	work_time_amount = 0

/obj/structure/loom/proc/produce(var/obj/item/stack/W, var/mob/living/human/H, var/obj/item/stack/P)
	if (!H.in_mood())
		return
	if(!anchored)
		to_chat(H, "<span class='warning'>\The [src]需要先固定到位才能进行编织.</span>")
		return
	if (current_work)
		to_chat(H, "<span class='warning'>\The [src.name]正忙,等待织工完成工作.</span>")
		return
	current_work = new P(null, W.amount, FALSE) //in fact for information purpose only we really need new object
	current_material = W
	current_user = H
	H.visible_message(
		"<span class='notice'>你可以看到[H.name]如何开始在\a [src.name]上编织[W.name].</span>",
		"<span class='notice'>你开始生产\the [current_work.name].</span>",
		"<span class='notice'>你听到有人在\the [src.name]上开始编织.</span>")
	icon_state = "loom1"
	work_time_amount = round(1000/(W.amount*3+47)) //The efficiency increases with the amount of material. For 1 material we get 20 deciseconds, for 50 material - 254 deciseconds.
	work_time_amount = work_time_amount*(0.67/H.getStatCoeff("crafting") + 0.33/H.getStatCoeff("dexterity"))
	if (do_after(H, work_time_amount, src.loc))
		finish_work()
	else
		icon_state = "loom"
		//20% - with no penalty, 30% - little mood decreasing, 25% - mood decreasing,
		//15% - to lose some material and mood decreasing, 10% to lose all material and great mood decreasing
		switch (rand(1,100)) //here are another algorithm because we don't know how much work was really done
			if (1 to 20) //20% with no penalty... almost
				H.visible_message(
					"<span class='notice'>你看到[H.name]如何从[src.name]中抽出[W.name],停止了工作.</span>",
					"<span class='notice'>你安全地从\the [src.name]中抽出\the [W.name],停止了工作.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				if (prob(25)) //5% to lose or gain some skill
					if (prob(80)) //4% to lose
						H.emote("sigh")
						to_chat(H, "<span class='notice'>你的制作技能略有退步.</span>")
						H.adaptStat("crafting", -1)
					else //1% to gain
						H.emote("giggle")
						to_chat(H, "<span class='notice'>你对这门手艺有了更多了解.</span>")
						H.adaptStat("crafting", 1)
			if (21 to 50) //30% little mood decreasing
				H.visible_message(
					"<span class='notice'>你看到[H.name]如何叹了口气,从[src.name]中抽出[W.name],停止了工作.</span>",
					"<span class='notice'>你从\the [src.name]中抽出\the [W.name],停止了工作.你有点沮丧.</span>",
					"<span class='notice'>你听到一声恼怒的低语.\the [src.name]的声音消失了.</span>")
				H.mood -= 2
			if (51 to 75) //25% nervously
				H.visible_message(
					"<span class='notice'>你看到[H.name]如何紧张地从\the [src.name]中扯出[W.name],停止了工作.</span>",
					"<span class='notice'>你紧张地从\the [src.name]中扯出\the [W.name],停止了工作.你有些沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				H.emote("sigh")
				H.mood -= 4
			if (76 to 90) //15% losing some material
				H.visible_message(
					"<span class='notice'>你看到[H.name]如何从\the [src.name]中扯出[W.name],停止了工作并损失了一些[W.name].</span>",
					"<span class='notice'>你从\the [src.name]中抽出\the [W.name],停止了工作.你很沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				W.amount = round(W.amount/2 + W.amount/10*rand(1,10))
				to_chat(H, "<span class='bad'>你失去了[current_work.amount - W.amount][W.name]\].</span>")
				H.emote("cry")
				H.mood -= 8
				if (prob(33)) //5% to lose or gain some skill
					if (prob(80)) //4% to gain
						to_chat(H, "<span class='notice'>你对这门手艺有了更多了解.</span>")
						H.adaptStat("crafting", rand(1, clamp(current_work.amount-W.amount,1,5)))
					else //1% to lose
						to_chat(H, "<span class='notice'>你的制作技能略有退步.</span>")
						H.adaptStat("crafting", -1)
			else //10% to lose all material
				H.visible_message(
					"<span class='notice'>你看到[H.name]如何从\the [src.name]中扯出[W.name],停止了工作并损失了一些[W.name].</span>",
					"<span class='notice'>你从\the [src.name]中抽出\the [W.name],停止了工作.你非常沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				if (prob(50)) //5% to breakthrough
					if (prob(10)) //0.5% EUREKA!
						to_chat(H, "<span class='notice'>但是...</span> <span class='good'>尤里卡!</span> <span class='notice'>你对这门手艺的了解增加了好几倍.</span>")
						H.adaptStat("crafting", current_work.amount*2) //20 times more than usual. EUREKA!
					else // 4.5% breakthrough
						to_chat(H, "<span class='notice'>但是...你对这门手艺有了更多了解.</span>")
						H.adaptStat("crafting", rand(1, clamp(current_work.amount-W.amount,1,20))) //In fact three times more.
				W.amount = 0
				qdel(W)
				H.emote("scream")
				H.mood -= 16
		qdel(current_work)
		current_work = null
		current_material = null
		current_user = null

/obj/structure/loom/attackby(var/obj/item/stack/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/stack/material/cotton) || istype(W, /obj/item/stack/material/rettedfabric))
		produce(W, H, /obj/item/stack/material/cloth)
		return
	if (istype(W, /obj/item/stack/material/preparedkevlar))
		produce(W, H, /obj/item/stack/material/kevlar)
		return
	if (istype(W, /obj/item/stack/material/wool))
		produce(W, H, /obj/item/stack/material/woolcloth)
		return
	if (istype(W,/obj/item/weapon/wrench))
		wrench_action(H)
		return
	if (istype(W,/obj/item/weapon/hammer))
		hammer_action(H, W, 150, list("/obj/item/stack/material/wood"), list(6))
		return
	..(W, H)

/obj/structure/loom/initialize()
	. = ..()
	finish_work()

/obj/structure/loom/after_load()
	. = ..()
	finish_work()

/obj/structure/loom/before_save()
	. = ..()
	finish_work()

////////////////////////////////////////////////////////////////////////
//  Mills  /////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/obj/structure/mill
	name = "磨坊"
	desc = "一台小磨坊,用于将谷物磨成面粉."
	icon = 'icons/obj/structures.dmi'
	icon_state = "flour_mill"
	anchored = TRUE
	density = FALSE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/tmp/obj/item/weapon/reagent_containers/current_work = null
	var/tmp/complete_percent = 0 //for manual mills
	var/tmp/list/workers_list = list() //mostly for team work possibility in manual mills
	var/tmp/list/workers_work = list()
	var/tmp/obj/item/weapon/reagent_containers/current_material = null

/obj/structure/mill/examine(mob/user, distance)
	..(user, distance)
	if (in_range(user, src) || isghost(user))
		if (current_material)
			var/msg = "<span class='notice'>There is [current_material.name] here and it's ground into [current_work.name]"
			if (istype(src, /obj/structure/mill/large))
				msg += ".</span>"
			else
				switch (complete_percent)
					if (0 to 24)	msg += " less than a quarter"
					if (25 to 33)	msg += " less than a third"
					if (34 to 45)	msg += " less than a half"
					if (46 to 54)	msg += " about a half"
					if (55 to 65)   msg += " more than a half"
					if (66 to 74)	msg += " more than a two thirds"
					if (75 to 85)	msg += " more than a three quarters"
					else			msg += " and need a bit of work to complete"
				msg += ".</span>"
			to_chat(user, msg)
		else
			to_chat(user, "<span class='notice'>里面是空的.</span>")
	else
		if (current_material)
			to_chat(user, "<span class='notice'>里面有一些谷物.</span>")

/obj/structure/mill/proc/finish_work()
	if (current_work)
		if (istype(src, /obj/structure/mill/large))
			icon_state = "mill_large"
			visible_message("<span class='notice'>你可以看到[src.name]完成将[current_material.name]磨成[current_work.name]</span>",
				"<span class='notice'>研磨声停止了.</span>")
		else
			icon_state = "flour_mill"
			visible_message("<span class='notice'>你可以看到[english_list(workers_list, src.name)]完成在[src.name]中将[current_material.name]磨成[current_work.name]</span>",
				"<span class='notice'>研磨声停止了.</span>")
			var/work_index = 1
			for(var/mob/living/human/H in workers_list)
				H.give_exp(list("strength", "stamina", "dexterity"), list(40, 40, 20), workers_work[work_index], TRUE, TRUE, 1, 0, 0, 0, 0)
				work_index += 1
		qdel(current_material)
		new current_work.type(src.loc) //deleting and creating for sterilization effect (we need really new object)
		qdel(current_work)
	current_work = null
	current_material = null
	complete_percent = 0
	workers_list.Cut()
	workers_work.Cut()

/obj/structure/mill/proc/produce(var/obj/item/weapon/reagent_containers/W, var/mob/living/human/H, var/obj/item/weapon/reagent_containers/P)
	if(!anchored)
		to_chat(H, "<span class='warning'>\The [src]需要先固定到位才能研磨任何东西.</span>")
		return
	if (!istype(src, /obj/structure/mill/large))
		if (H.stats["stamina"][1] < H.stats["stamina"][2]*0.1)
			to_chat(H, "<span class='warning'>你必须先恢复体力才能在[src]上研磨.</span>")
			return
		if (!H.in_mood())
			return
	if (current_work)
		if (istype(src, /obj/structure/mill/large))
			to_chat(H, "<span class='warning'>\The [src.name]正忙,等待[src.name]完成工作.</span>")
			return
		if (workers_list.len == 0)
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]继续在\the [src.name]中研磨[current_work.name].</span>",
				"<span class='notice'>你继续生产\a [current_work.name].</span>",
				"<span class='notice'>你听到有人在[src]中开始研磨东西.</span>")
		else
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]开始在\the [src.name]中帮忙研磨[current_work.name].</span>",
				"<span class='notice'>你开始帮忙生产\a [current_work.name].</span>",
				"<span class='notice'>研磨声变得更加频繁.</span>")
	else
		current_work = new P(null)
		current_material = W
		H.drop_item()
		W.loc = null
		H.visible_message(
			"<span class='notice'>你可以看到[H.name]开始在[istype(src, /obj/structure/mill/large) ? "on" : "in"]\the [src.name]中研磨[current_work.name]</span>",
			"<span class='notice'>你[istype(src, /obj/structure/mill/large) ? "put [current_work.name] to [src] for" : "start to"]生产\a [current_work.name].</span>",
			"<span class='notice'>你听到有人在[src]中开始研磨东西.</span>")
	if (istype(src, /obj/structure/mill/large))
		icon_state = "mill_large1"
		spawn(30+rand(1,30))
			finish_work()
	else
		var/total_work = 0
		workers_list += H
		workers_work += 0
		var/work_index = workers_work.len
		var/some_work_done = FALSE
		var/is_tired = FALSE
		var/is_mentally_tired = FALSE
		icon_state = "flour_mill1"
		while (complete_percent<100)
			if (H.stats["stamina"][1] < H.stats["stamina"][2]*0.1)
				some_work_done = TRUE
				is_tired = TRUE
				break
			if (!H.in_mood())
				some_work_done = TRUE
				is_mentally_tired = TRUE
				break
			if (do_after(H, 10, H.loc, TRUE, FALSE))
				complete_percent += 6*H.getStatCoeff("strength") + 6*H.getStatCoeff("stamina") + 3*H.getStatCoeff("dexterity")
				total_work += 10
				workers_work[work_index] = total_work
				H.stats["stamina"] -= STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK*10
				H.mood -= MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK*10
			else
				some_work_done = TRUE
				break
		if (some_work_done)
			H.give_exp(list("strength", "stamina", "dexterity"), list(40, 40, 20), total_work, TRUE, TRUE, 1, 0, 0, 0, 0)
			workers_list.Cut(work_index, work_index+1)
			workers_work.Cut(work_index, work_index+1)
			var/reason = "stopped"
			if (is_mentally_tired) reason = "not in mood to"
			if (is_tired) reason = "tired to"
			if (workers_list.len == 0)
				icon_state = "flour_mill"
				H.visible_message(
					"<span class='notice'>你可以看到[H.name]停止在[src.name]中研磨[current_work.name].</span>",
					"<span class='notice'>你[reason]研磨\a [current_work.name].</span>",
					"<span class='notice'>研磨声停止了.</span>")
			else
				H.visible_message(
					"<span class='notice'>你可以看到[H.name]停止在[src.name]中帮忙研磨[current_work.name].</span>",
					"<span class='notice'>你[reason]帮忙研磨\a [current_work.name].</span>",
					"<span class='notice'>研磨声变得更加稀少.</span>")
		if (complete_percent>=100)
			finish_work()

/obj/structure/mill/attack_hand(mob/user)
	if (current_work) //continue or help to work
		produce(current_material, user, current_work)
		return
	..()

/obj/structure/mill/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/wheat))
		produce(W, H, /obj/item/weapon/reagent_containers/food/condiment/flour)
		return
	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/oat))
		produce(W, H, /obj/item/weapon/reagent_containers/food/condiment/flour/oatflour)
		return
	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/barley))
		produce(W, H, /obj/item/weapon/reagent_containers/food/condiment/flour/barleyflour)
		return
	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/rice))
		produce(W, H, /obj/item/weapon/reagent_containers/food/snacks/rice)
		return
	if (istype(W,/obj/item/weapon/wrench))
		wrench_action(H)
		return
	if (istype(W,/obj/item/weapon/hammer))
		hammer_action(H, W, 90, list("/obj/item/stack/material/wood"), list(3))
		return
	..(W, H)

/obj/structure/mill/large
	name = "磨坊"
	desc = "一块用于将谷物磨成面粉的磨石."
	icon = 'icons/obj/structures.dmi'
	icon_state = "mill_large"
	flammable = TRUE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/mill/initialize()
	. = ..()
	finish_work()

/obj/structure/mill/after_load()
	. = ..()
	finish_work()

/obj/structure/mill/before_save()
	. = ..()
	finish_work()

////////////////////////////////////////////////////////////////////////
// Dehydrator //////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// Accepts items with the dry_type path set, converting them to that path after the drying process is complete.
// Dehydrator have 3x4 size, or 3 collums on 4 rows.
// By default dry_size=2 - this means that the item will take up two slots from left to right in the first empty space on the dehydrator.
// With dry_size values of 1, 2 and 3, an item will take up the corresponding number of slots. For dry_size=4 only turned position will be used, better use dry_size=13 (see below).
// Values of +4 will occupy two rows, for example 6 will occupy 2 slots of 2 rows (2x2); 5: 1x2; 6: 2x2; 7: 3x2; 8 will fit only rotated 2x4, better use dry_size=14 (see below).
// Values +8 will occupy three rows, and +12 all four rows. 9: 1x3; 10: 2x3; 11: 3x3; 12 - will fit only rotated, better use dry_size=15 (see below).
// Values +12 will occipy all four rows 13: 1x4; 14: 2x4; 15: 3x4 (full dehydrator); dry_size>15 will never fit to dehydrator.
// Alghorithm will try to rotate item if not empty space are found. For example 1x3 item (dry_size=9) not found a place, but dehydrator have free row, and item will placed 3x1 (as dry_size=3).
// ====================================================================
// Items must have an icon in 'icons/obj/food/dryer.dmi' named the same as icon_state of drying product
// Items must have an icon in 'icons/obj/food/dryer.dmi' named as icon_state of drying product with additional "R" at end. For example "rawcutletR"
// Product (dried and ready) items must have an icons with normal and rotated states in 'icons/obj/food/dryer.dmi'
// Items with size of 4 rows (dry_size=13..15) or equal side sizes (1x1, 2x2, 3x3) may not have an icon with additional "R".
// For optimization try don't use dry_size 4, 8 and 12. Use instead 13, 14 and 15. Also, this will save you from having to draw two icons: straight and rotated; it will be enough to draw only one straight icon.
// If dehydrator will be dismantled or destroyed all items are dryed will be drop at place, where dehydrator was.
// Ready dried products may have another dry_type (for example, a half-dried item as the dry_type of a fresh item may have a fully dried item as the dry_type)
// ====================================================================
// TO DO: Add dry_transform() procedure, which will replace the old mechanics of items with the mechanics of changing reagents in dried items.
/obj/structure/dehydrator
	name = "脱水器"
	desc = "一个木制结构,用于干燥肉类,鱼类,烟草等."
	icon = 'icons/obj/food/dryer.dmi'
	icon_state = "empty"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/tmp/obj/item/slots[4][3] //[row][slot in row] - food/snacks item list which dries
	var/tmp/obj/item/weapon/storage/internal/storage //storage for dryed raw items (for algorithm purpose)
	var/tmp/current_process_id = "" //for control of only one process at time to one dehydrator

/obj/structure/dehydrator/update_icon()
	var/icon/I = new('icons/obj/food/dryer.dmi')
	for (var/L in overlays)
		overlays -= L
	icon_state = "empty"
	for (var/R=1,R<5,R++)
		for (var/P=1,P<4,P++)
			if (isobj(slots[R][P]))
				var/obj/item/I_slot = slots[R][P]
				overlays += image(I, src, "[I_slot.icon_state][!!findtext(I_slot.name,"_ROTATED_") ? "R" : ""]", OBJ_LAYER+0.1, NORTH, 4+5*P, 1-6*R)

/obj/structure/dehydrator/proc/split_size(from_int, is_rotated = FALSE)
	var/rows = from_int % 4
	if (rows==0)
		rows = 4
	var/columns = round((from_int - rows) / 4) + 1
	if (is_rotated)
		return list(columns, rows)
	return list(rows, columns)

/obj/structure/dehydrator/proc/put_in_place(var/obj/item/W, var/list/pos = list(1, 1), var/list/sizeHV = list(1, 1), is_rotated = FALSE, init = FALSE)
	if (!init)
		if (istype(W, /obj/item/weapon/reagent_containers/food))
			var/obj/item/weapon/reagent_containers/food/D = W
			D.name = "[D.name]ON_DEHYDRATOR[is_rotated ? "_ROTATED_" : "_STRAIGHT_"]DECAY_[num2text(D.decay, 8, 10)]POS_[num2text(pos[1]+(pos[2]-1)*4, 1, 16)]TIMER_00000000"
			D.decay = 0 //stop decaying when on dehydrator
		else
			W.name = "[W.name]ON_DEHYDRATOR[is_rotated ? "_ROTATED_" : "_STRAIGHT_"]DECAY_[num2text(0, 8, 10)]POS_[num2text(pos[1]+(pos[2]-1)*4, 1, 16)]TIMER_00000000"
	slots[pos[1]][pos[2]] = W
	storage.handle_item_insertion(W, TRUE) //put to storage for preparing to destroy, or for map save when it happens
	for (var/P=0, P<sizeHV[1], P++)
		for (var/R=0, R<sizeHV[2], R++)
			if (P==0)
				if (R==0)
					continue
			slots[pos[1]+R][pos[2]+P] = "busy"+num2text(pos[1],1)+num2text(pos[2],1)
	update_icon()

/obj/structure/dehydrator/proc/clean_by(slot_row, slot_pos)
	for (var/R=1, R<5, R++)
		for (var/P=1, P<4, P++)
			if (slots[R][P] == "busy"+num2text(slot_row,1)+num2text(slot_pos,1))
				slots[R][P] = null
	slots[slot_row][slot_pos] = null

/obj/structure/dehydrator/proc/clean_from(slot_row, slot_pos)
	var/obj/item/I = slots[slot_row][slot_pos]
	var/list/sizeHV = split_size(I.dry_size, !!findtext(I.name, "_ROTATED_"))
	for (var/W=0, W<sizeHV[1], W++)
		for (var/H=0, H<sizeHV[2], H++)
			slots[slot_row+H][slot_pos+W] = null

/obj/structure/dehydrator/proc/hang_on(var/obj/item/D, var/list/sizeHV = list())
	var/is_rotated = TRUE
	var/place_found = FALSE
	if (sizeHV.len == 0)
		sizeHV = split_size(D.dry_size)
		is_rotated = FALSE //first call, not rotated
	for (var/R=1, R<5, R++)
		if (place_found)
			break
		for (var/P=1, P<4, P++)
			if (slots[R][P]==null)
				place_found = TRUE
				for (var/W=0, W<sizeHV[1], W++)
					if (P+W>3)
						place_found = FALSE
						break
					if (!place_found)
						break
					for (var/H=0, H<sizeHV[2], H++)
						if (W==0)
							if (H==0)
								continue
						if (R+H>4)
							place_found = FALSE
							break
						if (slots[R+H][P+W])
							place_found = FALSE
							break
				if (place_found)
					if (!istype(D, /obj/item/stack) || D.amount == 1)
						put_in_place(D, list(R, P), sizeHV, is_rotated)
					else
						var/obj/item/stack/S0 = D
						var/obj/item/stack/S1 =	S0.split(1)
						put_in_place(S1, list(R, P), sizeHV, is_rotated)
					break
	if (place_found)
		return TRUE
	else
		if (is_rotated)
			return FALSE
		else
			sizeHV.Swap(1, 2)
			return hang_on(D, sizeHV) //trying to hang this item rotated

/obj/structure/dehydrator/proc/dry_as_text(var/obj/item/I)
	switch(get_dry_timer(I)/TIME_TO_DRY)
		if (0 to 0.15) return "drying"
		if (0.15 to 0.4) return "quarter dried"
		if (0.4 to 0.6) return "half dried"
		if (0.6 to 0.85) return "three quarters dried"
		if (1 to INFINITY)
			if (!findtext(normal_item_name(I),"dried")) // Look at normal_item_name()
				if (!findtext(normal_item_name(I),"dry")) //two if for optimization purpose (This breaks because the name "dried" is in the final product, and so it bugs out and adds an extra space before the dry_as_text descriptor.)
					return "dried"
			else
				return ""
		else
			return "almost dried"

/obj/structure/dehydrator/examine(mob/user, distance)
	..(user, distance)
	var/list/dryed_now = list()
	var/additional_info = in_range(user, src) || isghost(user)
	if (storage.contents.len>0)
		for(var/obj/item/I in storage.contents)
			dryed_now += "[additional_info ? "[dry_as_text(I)]" : ""] [normal_item_name(I)]"
		to_chat(user, SPAN_NOTICE("There hangs \a [english_list(dryed_now, and_text = " and a ")].")) // \a because we need "there hangs an almost dried..."

/obj/structure/dehydrator/proc/normal_item_name(var/obj/item/I)
	return copytext(I.name, 1, findtext(I.name, "ON_DEHYDRATOR"))

/obj/structure/dehydrator/proc/get_dry_timer(var/obj/item/I)
	return text2num(copytext(I.name, findtext(I.name,"TIMER_")+6, findtext(I.name,"TIMER_")+14))

/obj/structure/dehydrator/proc/set_dry_timer(var/obj/item/I, new_timer)
	I.name = splicetext(I.name, findtext(I.name,"TIMER_")+6, findtext(I.name,"TIMER_")+14, num2text(new_timer, 8, 10))

/obj/structure/dehydrator/attackby(var/obj/item/W, var/mob/living/human/H as mob, icon_x, icon_y)
	if (istype(W, /obj/item/weapon/wrench))
		if (H)
			wrench_action(H)
			return TRUE
	if (istype(W, /obj/item/weapon/hammer))
		if (H)
			hammer_action(H, W, 110, list("/obj/item/stack/material/wood"), list(4))
			return TRUE
	if (!W.dried_type)
		if (H)
			to_chat(H, SPAN_WARNING("\The [W.name] cannot be dried."))
		return TRUE//This can't be dryed
	if (!W.dry_size)
		return TRUE//ERROR
	if (istype(W, /obj/item/weapon/reagent_containers/food))
		var/obj/item/weapon/reagent_containers/food/D = W
		if (D.rotten)
			if (H)
				to_chat(H, SPAN_WARNING("\The [W.name] is rotten!"))
			return TRUE
	if (W.dry_size>15)
		if (H)
			to_chat(H, SPAN_WARNING("\The [W.name] does not fit here!"))
		return TRUE
	if (!hang_on(W))
		if (H)
			to_chat(H, "<span class='warning'>没有足够的空间放置\the [W.name]!</span>")
		return TRUE
	if (H)
		H.visible_message(
			"<span class='notice'>你可以看到[H.name]挂着\a [normal_item_name(W)]进行干燥.</span>",
			"<span class='notice'>你挂着\a [normal_item_name(W)]进行干燥.")
		return TRUE
	..(W, H, icon_x, icon_y)

/obj/structure/dehydrator/attack_hand(mob/H, icon_x, icon_y)
	var/obj/item/S = take_product_by_x_y(icon_x, icon_y, H)
	if (S)
		if (!H.put_in_any_hand_if_possible(S, FALSE, TRUE, TRUE, TRUE))
			H.drop_item(S)
		H.visible_message(
			"<span class='notice'>你可以看到[H.name]从\the [src]中取出\a [S.name].</span>",
			"<span class='notice'>你从\the [src]中取出\a [S.name].")
	return TRUE

/obj/structure/dehydrator/proc/dry_process(var/this_process = null)
	var/list/pos
	var/obj/item/P
	var/obj/item/I
	var/dry_timer
	var/list/sizeHV
	var/is_rotated
	if (!isturf(src.loc)) //if dehydrator location is gone, or dehydrator is gone, process must die
		return
	if (this_process==null) //initial call
		this_process = current_process_id
	if (this_process<>current_process_id) //only one process for one dehydrator and this process must die
		return
	spawn(150) //one tick at 15 seconds will be enough
		if (!storage) //storage remove, dehydrator dismantled, process must die
			return
		if (storage.contents.len>0)
			for (I in storage.contents)
				if (I.dried_type)
					dry_timer = get_dry_timer(I)
					dry_timer += 150
					set_dry_timer(I, dry_timer)
					if (dry_timer >= TIME_TO_DRY)
						pos = split_size(text2num(copytext(I.name, findtext(I.name,"POS_")+4, findtext(I.name,"POS_")+5), 16))
						P = new I.dried_type(null)
						var/obj/item/I_s = slots[pos[1]][pos[2]]
						is_rotated = !!findtext(I_s.name, "_ROTATED_")
						sizeHV = split_size(I_s.dry_size, is_rotated)
						put_in_place(P, pos, sizeHV, is_rotated)
						if (!P.dried_type)
							set_dry_timer(P, TIME_TO_DRY+1)
						qdel(I)
						P.visible_message(SPAN_WARNING("\The [normal_item_name(P)] on \the [src] finishes drying."))
						update_icon()
		dry_process(this_process)

/obj/structure/dehydrator/proc/take_product_by_x_y(icon_x, icon_y, new_location)
	var/row = max(1,min(5-ceil((icon_y-3)/6),4))
	var/pos = max(1,min(ceil((icon_x-8)/5),3))
	var/real_row
	var/real_pos
	var/obj/item/S
	if (slots[row][pos] == null)
		return FALSE //no items here
	if (findtext(slots[row][pos],"busy")) //drying object is in another slot
		real_row = text2num(copytext(slots[row][pos],5,6))
		real_pos = text2num(copytext(slots[row][pos],6,7))
	else
		real_row = row
		real_pos = pos
	S = remove_from_dehydrator(real_row, real_pos, new_location)
	clean_by(real_row, real_pos)
	update_icon()
	return S

/obj/structure/dehydrator/bullet_act(var/obj/item/projectile/P, def_zone)
	var/shoot_x = rand(1,32)
	var/shoot_y = rand(1,32)
	var/obj/item/S
	if (shoot_x>6 && shoot_x<26)
		if (shoot_y>3 && shoot_y<30) //in hitbox
			if (shoot_x==7 || shoot_x==8 || shoot_x==24 || shoot_x==25)
				return ..(P, def_zone) //hit to dehydrator vertical frame
			if (shoot_y==4 || shoot_y==5 || shoot_y==10 || shoot_y==11 || shoot_y==16 || shoot_y==17 || shoot_y==22 || shoot_y==23 || shoot_y==28 || shoot_y==29)
				return ..(P, def_zone) //hit to dehydrator horizontal frame
			//shoot throw slots, checking
			S = take_product_by_x_y(shoot_x, shoot_y)
			if (S)
				S.visible_message("<span class = 'warning'>\The [S.name]被刺穿了!</span>")
				P.do_bullet_act(S, def_zone) //bullet hit to product
				return FALSE
			else
				return PROJECTILE_CONTINUE //miss
	else if (shoot_y==3)
		if ((shoot_x>5 && shoot_x<9) || (shoot_x>23 && shoot_x<27))
			return ..(P, def_zone) //hit to dehydrator leg
	else if (shoot_y==2)
		if ((shoot_x>4 && shoot_x<7) || (shoot_x>25 && shoot_x<28))
			return ..(P, def_zone) //hit to dehydrator leg
	return PROJECTILE_CONTINUE //miss

/obj/structure/dehydrator/proc/clean_drop_slots() //Drop all items out without changing names, they will be restored on reinit()
	for (var/R=1, R<5, R++)
		for (var/P=1, P<4, P++)
			if (slots[R][P]<>null)
				if (!findtext(slots[R][P],"busy"))
					storage.remove_from_storage(slots[R][P])
				slots[R][P] = null

/obj/structure/dehydrator/proc/refill()
	var/is_rotated
	var/obj/item/weapon/reagent_containers/food/snacks/S
	var/T
	var/list/pos
	var/list/sizeHV
	clean_drop_slots()
	//place temporary dropped or saved items back in place
	for (S in src.loc)
		if (findtext(S.name, "ON_DEHYDRATOR"))
			is_rotated = !!findtext(S.name, "_ROTATED_")
			T = findtext(S.name,"POS_") + 4
			T = text2num(copytext(S.name, T, T+1), 16)
			pos = split_size(T)
			sizeHV = split_size(S.dry_size, is_rotated)
			put_in_place(S, pos, sizeHV, is_rotated, TRUE)
	for (S in src.loc) //On second pass we try to hang food/snacks items in location (from mapping)
		attackby(S, null)

/obj/structure/dehydrator/proc/reinit()
	spawn(rand(5,15)) //To prevent too much load when starting the server and to slightly spread the processes of dehydrators loaded from the map in time.
		refill()
		current_process_id = "[time2text(world.realtime,"DDhhmmss")]-[num2text(rand(1,99999),5,10)]" //New value will kill old process on next Call
		dry_process()

/obj/structure/dehydrator/New()
	. = ..()
	storage = new/obj/item/weapon/storage/internal(src)
	storage.storage_slots = 12 //enough
	storage.max_storage_space = 120000 //may be enough
	spawn(rand(5,15))
		reinit()

/obj/structure/dehydrator/proc/remove_from_dehydrator(row, pos, new_location)
	var/obj/item/S
	var/T
	S = slots[row][pos]
	storage.remove_from_storage(S, new_location) //placing item from dehydrator storage to turf or into user
	if (istype(S, /obj/item/weapon/reagent_containers/food))
		var/obj/item/weapon/reagent_containers/food/D = S
		T = findtext(S.name,"DECAY_") + 6
		D.decay = text2num(copytext(S.name, T, T+8)) //restoring decay value
		spawn(600+rand(1, 50)) //in order not to create a duplicate process, we wait until the old process dies
			if (D)
				D.food_decay() //restarting decay process
	S.name = normal_item_name(S)
	return S

/obj/structure/dehydrator/Destroy()
	current_process_id = "" //To kill process
	for (var/R=1, R<5, R++)
		for (var/P=1, P<4, P++)
			if (slots[R][P]<>null)
				if (!findtext(slots[R][P],"busy"))
					remove_from_dehydrator(R, P, src.loc)
	qdel(storage)
	storage = null
	..()

/obj/structure/dehydrator/initialize() //on new map start from .dmm
	spawn(50+rand(50,100))
		if(current_process_id=="") // for preventing double initialisation from new() and set autoinit
			reinit()
	. = ..()

/obj/structure/dehydrator/after_load() //after load from map save
	current_process_id = "" //because save algorithm may save this var, or load algorithm may leave old process
	spawn(50+rand(50,100))
		reinit()
	..()

/obj/structure/dehydrator/before_save() //before save to map
	//Don't know which algorithm will be used, but we have reinit() and may safely drop all items to ground without changes
	clean_drop_slots()
	..()

////////////////////////////////////////////////////////////////////////
//  Fermentation jar  //////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// TO DO TODO: Rework this vague mechanism into a chemical reaction, and remake the jar itself into reagents_container like a large beaker, but with much less accurate transfer amounts
// At this time it's infinity yeast generator... o_O ... yes.
/obj/item/weapon/starterjar
	name = "发酵引子罐"
	icon = 'icons/obj/drinks.dmi'
	desc = "一个玻璃罐,用于繁殖酵母."
	icon_state = "jar0"
	item_state = "beaker"
	var/fermenting = 0
	var/fermenting_timer = 0
	var/fermenting_contents = 0
	flags = FALSE

/obj/item/weapon/starterjar/attackby(obj/O as obj, mob/living/human/user as mob)
	if (fermenting != 0)
		to_chat(user, "<span class='warning'>这个罐子里已经有引子培养物了!</span>")
		return
	if (istype(O, /obj/item/weapon/reagent_containers/food/condiment/flour))
		user.visible_message("<span class='notice'>[user.name]往罐子里加了一些面粉.</span>",
			"<span class='notice'>你往罐子里加了[O.name].</span>")
		fermenting = 1
		icon_state = "jarF"
		fermenting_timer = world.time + 1600 + rand(0,200)
		qdel(O)
		fermenting_process()
		return
	if (istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown/wheat) || istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown/oat) || istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown/rice) || istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown/barley))
		user.visible_message("<span class='notice'>[user.name]往罐子里加了一些谷物.</span>",
			"<span class='notice'>你往罐子里加了[O.name].</span>")
		fermenting = 1
		icon_state = "jarG"
		fermenting_timer = world.time + 1000 + rand(0,1400) //wild yeast have more variety
		qdel(O)
		fermenting_process()
		return
	else if (istype(O, /obj/item/weapon/reagent_containers/food/condiment/enzyme))
		user.visible_message("<span class='notice'>[user.name]往罐子里加了[O.name].</span>",
			"<span class='notice'>你往罐子里加了[O.name].</span>")
		fermenting = 2
		fermenting_contents++
		icon_state = "jar1"
		qdel(O)
		yeast_growth()
		return
	else if (istype(O,/obj/item/weapon/hammer) || istype(O,/obj/item/weapon/hammer/modern))
		playsound(loc, 'sound/weapons/smash.ogg', 75, 1)
		to_chat(user, "<span class='notice'>你开始砸碎\the [src].</span>")
		if (do_after(user, 25, src))
			to_chat(user, "<span class='notice'>你砸碎了\the [src].</span>")
			new /obj/item/weapon/material/shard/glass(loc)
			qdel(src)
	else
		..()

/obj/item/weapon/starterjar/proc/fermenting_process()
	if (world.time>=fermenting_timer)
		visible_message("罐子里的面粉发酵了.")
		fermenting = 2
		fermenting_contents = 1
		icon_state = "jar1"
		yeast_growth()
	else
		spawn(100)
			fermenting_process()

/obj/item/weapon/starterjar/proc/yeast_growth()
	//Yeah there is a bug, form abuse load/unload yeast that may produce +4 fermenting_contents at time, BUT enzymes not essentials at this moment
	//	and it will fixed, when working on TO DO part (look at the begining of starterjar TODO)
	if (fermenting_contents>0)
		spawn(1500+rand(0,400))
			if (fermenting_contents > 0 && fermenting_contents < 5)
				fermenting_contents++
				icon_state = "jar[fermenting_contents]"
			yeast_growth()

/obj/item/weapon/starterjar/attack_self(var/mob/living/human/user as mob)
	if (fermenting==2 && fermenting_contents>0)
		to_chat(user, "你从罐子里取出了一些酵母.")
		var/obj/item/weapon/reagent_containers/food/condiment/enzyme/Y = new/obj/item/weapon/reagent_containers/food/condiment/enzyme(null)
		if (!user.put_in_any_hand_if_possible(Y))
			Y.loc = usr.loc
		fermenting_contents--
		icon_state = "jar[fermenting_contents]"
		if (fermenting_contents==0)
			fermenting = 0
	else
		..()

/obj/item/weapon/starterjar/proc/restore_from_icon_state()
	if (fermenting==0 && icon_state<>"jar0")
		switch(icon_state)
			if ("jarF")
				fermenting = 1
				fermenting_timer = world.time + 900 // 1/2 of normal, because not so important
				fermenting_process()
			if ("jarG")
				fermenting = 1
				fermenting_timer = world.time + 1200 // 1/2 of normal, because not so important
				fermenting_process()
			else
				fermenting = 2
				fermenting_contents = text2num(copytext(icon_state,4,5))
				yeast_growth()

/obj/item/weapon/starterjar/initialize()
	. = ..()
	restore_from_icon_state()

/obj/item/weapon/starterjar/after_load()
	. = ..()
	restore_from_icon_state()

////////////////////////////////////////////////////////////////////////
//  Seed collector  ////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// TO DO TODO: If seeds genetics will be implemented, then seeds collector MUST be reworked as production collector
// TO DO TODO: save-load mechanics MUST be in storage.dm - check it and fix it if needs.
/obj/item/weapon/storage/seed_collector
	name = "种子收集器"
	icon = 'icons/obj/storage.dmi'
	desc = "用来存放你的种子."
	icon_state = "seed_collector"
	item_state = "backpack"
	w_class = ITEM_SIZE_LARGE
	flags = FALSE
	slot_flags = SLOT_BACK
	max_storage_space = 50000 //we don't worry that, yes, all calculated by slots
	storage_slots = 21 //we need stop the mess of seeds in one bag
	can_hold = list(/obj/item/stack/farming/seeds)
	flammable = TRUE

/obj/item/weapon/storage/seed_collector/attack_self(var/mob/living/human/user as mob, var/target_loc = null)
	if (src == target_loc)
		return FALSE
	var/collected
	var/some_not_collected = FALSE
	var/some_collected = FALSE
	if (!target_loc)
		target_loc = user.loc
	for (var/obj/item/stack/farming/seeds/G in target_loc)
		collected = FALSE
		for (var/obj/item/stack/farming/seeds/S in contents)
			if (S.type==G.type)
				if (S.amount+G.amount<=S.max_amount)
					S.amount += G.amount
					S.update_icon()
					to_chat(user, "<span class='notice'>你将\the [S.name]放入[src][S.amount==S.max_amount ? " to full stack" : ""].</span>")
					qdel(G)
					collected = TRUE
					some_collected = TRUE
					break
				else if (S.amount < S.max_amount)
					G.amount -= S.max_amount - S.amount
					S.amount = S.max_amount
					some_collected = TRUE
					to_chat(user, "<span class='notice'>你将\the [S.name]放入[src]直至堆满.</span>")
		if (!collected)
			if (can_be_inserted(G, TRUE))
				to_chat(user, "<span class='notice'>你将\the [G.name]放入[src],开始新的一堆[G.amount==G.max_amount ? " to full stack" : ""].</span>")
				handle_item_insertion(G,TRUE)
				some_collected = TRUE
			else
				some_not_collected = TRUE
	if (some_not_collected)
		to_chat(user, "<span class='warning'>一些种子放不进[src],腾出一些空间.</span>")
	if (src == user.s_active)
		orient2hud(user)
	return some_collected || some_not_collected

/obj/item/weapon/storage/seed_collector/afterattack(atom/target, mob/user, proximity_flag, params)
	if (proximity_flag)
		if (user.a_intent <> I_HARM)
			var/to_loc = target.loc
			if (isturf(target))
				to_loc = target
			if (!attack_self(user, to_loc))
				return
	..(target, user, proximity_flag, params)

/obj/item/stack/farming/seeds/AltClick(mob/living/user)
	..(user)
	if (istype(src.loc, /obj/item/weapon/storage/seed_collector))
		var/obj/item/weapon/storage/seed_collector/L = src.loc
		L.orient2hud(user)

/obj/item/weapon/storage/seed_collector/slot_orient_objs(rows, cols, list/obj/item/display_contents, Xcord, Ycord)
	..()
	for (var/obj/item/stack/farming/seeds/S in contents)
		S.maptext = "<font style='text-color: white; font-size: 8pt; font-family: sans-serif; -dm-text-outline: 1px black; vertical-align: top; text-align: right'>[S.amount]</font><br>"
		S.maptext += "<font style='text-color: white; font-size: 6pt; font-family: arial narrow; -dm-text-outline: 1px black; vertical-align: bottom; text-align: center'>[S.plant]</font><br>"

////////////////////////////////////////////////////////////////////////
//  Ore collector  /////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// TO DO TODO: save-load mechanics MUST be in storage.dm - check it and fix it if needs.
// TO DO TODO: Maybe need dirt collector, cotton collector and so on? What about other raw materials collectors? But: think for balance before.
/obj/item/weapon/storage/ore_collector
	name = "矿石收集器"
	icon = 'icons/obj/storage.dmi'
	desc = "一个皮革袋,用于收集矿石和原石."
	icon_state = "ore_collector"
	item_state = "backpack"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK
	max_storage_space = 50000 //we don't worry that, yes, all calculated by slots
	storage_slots = 7 //we need stop the mess of ores in one bag
	can_hold = list(
		/obj/item/stack/ore,
		/obj/item/stack/material/stone,
		/obj/item/stack/material/sandstone,
		/obj/item/stack/material/obsidian,
		/obj/item/stack/material/marble
	)
	flammable = TRUE

/obj/item/weapon/storage/ore_collector/attack_self(var/mob/living/human/user as mob, var/target_loc = null)
	if (src == target_loc)
		return FALSE
	var/collected
	var/some_not_collected = FALSE
	var/some_collected = FALSE
	var/list/not_collected = list()
	if (!target_loc)
		target_loc = user.loc
	for (var/obj/item/stack/G in target_loc)
		if (!is_type_in_list(G, can_hold))
			continue
		collected = FALSE
		for (var/obj/item/stack/S in contents)
			if (S.type==G.type)
				if (S.amount+G.amount<=S.max_amount)
					S.amount += G.amount
					S.update_icon()
					to_chat(user, "<span class='notice'>你将\the [S.name]放入[src][S.amount==S.max_amount ? " to full stack" : ""].</span>")
					qdel(G)
					collected = TRUE
					some_collected = TRUE
					break
				else if (S.amount < S.max_amount)
					G.amount -= S.max_amount - S.amount
					S.amount = S.max_amount
					some_collected = TRUE
					to_chat(user, "<span class='notice'>你将\the [S.name]放入[src]直至堆满.</span>")
		if (!collected)
			if (can_be_inserted(G, TRUE))
				to_chat(user, "<span class='notice'>你将\the [G.name]放入[src],开始新的一堆[G.amount==G.max_amount ? " to full stack" : ""].</span>")
				handle_item_insertion(G,TRUE)
				some_collected = TRUE
			else
				some_not_collected = TRUE
				if (istype(G, /obj/item/stack/ore))
					if (!("ore" in not_collected))
						not_collected += "ore"
				else
					if (!("stone" in not_collected))
						not_collected += "stone"
	if (some_not_collected)
		to_chat(user, "<span class='warning'>一些[english_list(not_collected)]放不进[src],腾出一些空间.</span>")
	if (src == user.s_active)
		orient2hud(user)
	return some_collected || some_not_collected

/obj/item/weapon/storage/ore_collector/afterattack(atom/target, mob/user, proximity_flag, params)
	if (proximity_flag)
		if (user.a_intent <> I_HARM)
			var/to_loc = target.loc
			if (isturf(target))
				to_loc = target
			if (!attack_self(user, to_loc))
				return
	..(target, user, proximity_flag, params)

/obj/item/stack/AltClick(mob/living/user)
	..(user)
	if (istype(src.loc, /obj/item/weapon/storage/ore_collector))
		var/obj/item/weapon/storage/ore_collector/L = src.loc
		L.orient2hud(user)

/obj/item/weapon/storage/ore_collector/slot_orient_objs(rows, cols, list/obj/item/display_contents, Xcord, Ycord)
	..()
	for (var/obj/item/stack/S in contents)
		var/short_name = lowertext(S.name)
		if (short_name == "mineral coal")
			short_name = "coal"
		else if (short_name == "pig iron")
			short_name = "pig iron"
		else if (findtext(short_name," "))
			short_name = copytext(short_name,1,findtext(short_name," "))
		S.maptext = "<font style='text-color: white; font-size: 8pt; font-family: sans-serif; -dm-text-outline: 1px black; vertical-align: top; text-align: right'>[S.amount]</font><br>"
		S.maptext += "<font style='text-color: white; font-size: 6pt; font-family: arial narrow; -dm-text-outline: 1px black; vertical-align: bottom; text-align: center'>[short_name]</font><br>"

////////////////////////////////////////////////////////////////////////
//  Produce basket (produce collector)  ////////////////////////////////
////////////////////////////////////////////////////////////////////////
/obj/item/weapon/storage/produce_basket
	name = "农产品篮"
	icon = 'icons/obj/storage.dmi'
	desc = "一个编织篮,用于收集水果和蔬菜."
	icon_state = "produce_basket"
	item_state = "produce_basket"
	w_class = ITEM_SIZE_LARGE
	flags = FALSE
	max_w_class = 3
	max_storage_space = 30
	storage_slots = 30
	display_contents_with_number = TRUE //visually stack unstackable!
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/grown)
	flammable = TRUE
	var/tmp/next_usage = 0 //for prevent spam clicks

/obj/item/weapon/storage/produce_basket/attack_self(var/mob/living/human/user as mob, var/target_loc = null, var/obj/item/weapon/storage/from_storage=null)
	if (src == target_loc)
		return FALSE
	var/some_items = FALSE
	if (!target_loc)
		target_loc = user.loc
	for (var/obj/item/weapon/reagent_containers/food/snacks/grown/G in target_loc)
		some_items = TRUE
		if (can_be_inserted(G))
			if (from_storage)
				from_storage.remove_from_storage(G)
			handle_item_insertion(G)
	return some_items

/obj/item/weapon/storage/produce_basket/afterattack(atom/target, mob/user, proximity_flag, params)
	if (world.timeofday>next_usage)
		next_usage = world.timeofday + 10
		if (proximity_flag)
			if (user.a_intent <> I_HARM)
				var/to_loc = target.loc
				var/obj/item/weapon/storage/to_storage = null
				if (isturf(target))
					to_loc = target
				if (istype(target, /obj/item/weapon/storage))
					to_storage = target
					to_loc = target.contents
				if (!attack_self(user, to_loc, to_storage))
					//no items here? try unloading!
					var/some_items = FALSE
					for (var/obj/item/weapon/reagent_containers/food/snacks/grown/G in contents)
						some_items = TRUE
						if (to_storage)
							if (to_storage.can_be_inserted(G))
								remove_from_storage(G)
								to_storage.handle_item_insertion(G)
							else
								break
						else
							remove_from_storage(G, to_loc)
					if (some_items)	//items was unloaded
						if (to_storage)
							to_storage.update_icon()
						if (src.loc <> user) //returning back in hand!
							user.put_in_active_hand(src)
						return
				else //after loading items
					if (to_storage)
						to_storage.update_icon()
					if (src.loc <> user) //returning back in hand!
						user.put_in_active_hand(src)
					return
	..(target, user, proximity_flag, params)

////////////////////////////////////////////////////////////////////////
//  Oil well  //////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//TO DO TODO: Add examine proc
//TO DO TODO: Some kind of mechanical energy must be needed to work.
//TO DO TODO: Check /obj/structure/oil_spring in code... it's need to be cleaned! BTW, all oil_fires.dm must be cleaned
//TO DO TODO: Make petroleum production more realistic.... maybe, or not
//TO DO TODO: Clean fuckups in oil_fires.dm
//TO DO TODO: Make different types of blood/oil (look at glass.dm)
//TO DO TODO: Clean fuckups with item/flashlight
/obj/structure/oilwell
	name = "木制油井"
	desc = "一口油井,将石油提取到桶中."
	icon = 'icons/obj/obj32x64.dmi'
	icon_state = "oilwell"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	var/tmp/obj/structure/oil_spring/base = null
	var/tmp/obj/item/weapon/reagent_containers/glass/barrel/work_barrel = null
	var/tmp/extracting_now = FALSE
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/oilwell/New()
	. = ..()
	link_to_spring()

/obj/structure/oilwell/proc/link_to_spring()
	for (var/obj/structure/oil_spring/OS in src.loc)
		base = OS
		break
	if (!work_barrel)
		load_barrel()
	start_extraction()

/obj/structure/oilwell/proc/start_extraction()
	if (base)
		if (!extracting_now)
			extract()

/obj/structure/oilwell/proc/extract()
	extracting_now = TRUE
	var/need_extract
	spawn(1200)
		need_extract = FALSE
		if (work_barrel)
			if (work_barrel.reagents.total_volume < work_barrel.reagents.maximum_volume)
				if (base.counter>0)
					work_barrel.reagents.add_reagent("petroleum", min(work_barrel.reagents.get_free_space(), 10))
					base.counter --
					need_extract = TRUE
					if (work_barrel.reagents.total_volume == work_barrel.reagents.maximum_volume)
						visible_message("<span class='notice'>\The [work_barrel]在\the [src]中装满了.</span>")
						need_extract = FALSE
		if (base.counter<1)
			need_extract = TRUE //need to be sure, that spring will refiled
			if (base.timeout<world.time) //if no sheduled refill() we call it
				base.timeout = world.time + 600 //give default timeout
				base.refill()
		if (need_extract)
			extract()
		else
			extracting_now = FALSE

/obj/structure/oilwell/proc/load_barrel()
	for (var/obj/item/weapon/reagent_containers/glass/barrel/B in src.loc)
		if (B.reagents.total_volume<B.reagents.maximum_volume)
			work_barrel = B
			B.loc = null
			start_extraction()
			break

/obj/structure/oilwell/proc/unload_barrel()
	work_barrel.loc = src.loc
	work_barrel = null

/obj/structure/oilwell/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/glass/barrel))
		if (!work_barrel)
			if (do_after(user, 35, src))
				user.drop_item(src.loc)
				user.visible_message("<span class='notice'>[user]将\the [W]放入\the [src].</span>",
					"<span class='notice'>你将\the [W]放入\the [src].</span>")
				load_barrel()
		else
			to_chat(user, "<span class='warning'>已经有一个连接的[work_barrel]了.</span>")
		return
	if (istype(W,/obj/item/weapon/hammer))
		hammer_action(user, W, 270, list("/obj/item/stack/material/wood"), list(30))
		return
	..(W, user)

/obj/structure/oilwell/attack_hand(var/mob/living/human/H)
	if (work_barrel)
		to_chat(H, "你开始从\the [src]中取出\the 桶...")
		if (do_after(H, 35, src))
			H.visible_message("<span class='notice'>[H]从\the [src]中取出\the [work_barrel].</span>",
				"<span class='notice'>你从\the [src]中取出\the [work_barrel].</span>",)
			unload_barrel()
	else
		to_chat(H, "没有容器可以从\the [src]中取出.")

/obj/structure/oilwell/Destroy()
	unload_barrel()
	. = ..()

/obj/structure/oilwell/initialize()
	. = ..()
	link_to_spring()

/obj/structure/oilwell/before_save()
	. = ..()
	unload_barrel()

/obj/structure/oilwell/after_load()
	. = ..()
	link_to_spring()

////////////////////////////////////////////////////////////////////////
//  Printing press  ////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//TO DO TODO: FIX books at maps!
//TO DO TODO: Fix Chemistry-Reagents-Compounds.dm for compound reactions to books
//TO DO TODO: Fix books recipes. Book is book! Why is 15 wood for book? It's a house? WALL?
//TO DO TODO: Split research "books" to different items types. Stone must be stone. Scroll must be scroll. Paper must be paper. Wood must be wood... Yes, create another type of book: Waxed tablet.
//TO DO TODO: Make a parchments (paper from leather) ? Think about it wisely...
//TO DO TODO: Rework books crafting, they must be crafted from paper or parchments (if it is a book). Parchments book is a different item from paper book.
//TO DO TODO: Rework paper crafting. It's must be different from age to age.
//TO DO TODO: below are not completed rework of printing press... Complete it LATER, not now.
//TO DO TODO: languages for text... many work at /obj/item/weapon/pen , languages for books, languages for all what may be wroten.

//below are untouched original code of printing press... mostly untouched
////////////////////PRINTING/PRESS///////////////////////////
/obj/structure/printingpress
	name = "印刷机"
	desc = "用于复制书籍和文件."
	icon = 'icons/obj/structures.dmi'
	icon_state = "printingpress0"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	var/list/obj/item/base = list()
	var/list/obj/item/copy = list()
	var/copying = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE

/obj/structure/printingpress/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/book) || istype(W, /obj/item/weapon/paper))
		var/tolist = list("Cancel")
		if (isemptylist(copy) && isemptylist(base))
			tolist = list("Original","Copy","Cancel")
		else if (isemptylist(copy) && !isemptylist(base))
			tolist = list("Copy","Cancel")
		else if (!isemptylist(copy) && isemptylist(base))
			tolist = list("Original","Cancel")
		else
			tolist = list("Cancel")
		var/input = WWinput(user, "Add to original or copy?", "Printing Press", "Cancel", tolist)
		if (input == "Cancel")
			return
		else if (input == "Original")
			if (istype(W, /obj/item/weapon/book/language_book))
				var/obj/item/weapon/book/language_book/LB = W
				if (!LB.written)
					to_chat(user, "<span class = 'warning'>你不能复制一本空无一物的语言书!</span>")
					return
			base += W
			user.drop_from_inventory(W)
			W.forceMove(locate(0,0,0))
			return

		else if (input == "Copy")
			if (istype(W, /obj/item/weapon/book/language_book))
				var/obj/item/weapon/book/language_book/LB = W
				if (LB.written)
					to_chat(user, "<span class = 'warning'>你不能复制一本写好的语言书!</span>")
					return
			copy += W
			user.drop_from_inventory(W)
			W.forceMove(locate(0,0,0))
			return

	if (istype(W,/obj/item/weapon/wrench))
		playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		to_chat(user, (anchored ? "<span class='notice'>You unfasten \the [src] from the floor.</span>" : "<span class='notice'>You secure \the [src] to the floor.</span>"))
		anchored = !anchored
	else if (istype(W,/obj/item/weapon/hammer) || istype(W,/obj/item/weapon/hammer/modern))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始拆解\the [src].</span>")
		if (do_after(user,60,src))
			to_chat(user, "<span class='notice'>你拆解了\the [src].</span>")
			for (var/i=1, i<=5, i++)
				new /obj/item/stack/material/wood(loc) //5 out of 12 to craft
			qdel(src)

	else
		..()

/obj/structure/printingpress/attack_hand(var/mob/living/human/H)
	if (copying)
		return

	if (isemptylist(base) && isemptylist(copy))
		to_chat(H, "印刷机里什么都没有.")
		return

	if (isemptylist(copy))
		for(var/obj/item/weapon/B in base)
			to_chat(H, "你取出了\the [B].")
			B.loc = get_turf(src)
			base -= B
		return

	if (isemptylist(base))
		for(var/obj/item/weapon/C in copy)
			to_chat(H, "你取出了\the [C].")
			C.loc = get_turf(src)
			copy -= C
		return
	if (!isemptylist(base) && !isemptylist(copy))
		if (base[1].type != copy[1].type)
			to_chat(H, "两份文件必须是同一类型.")
			for(var/obj/item/weapon/C in copy)
				C.loc = get_turf(src)
				copy -= C
			for(var/obj/item/weapon/B in base)
				B.loc = get_turf(src)
				base -= B
			return
		else
			var/spawntimer = 90
			if (istype(base[1], /obj/item/weapon/book))
				spawntimer = 250
			else if (istype(base[1], /obj/item/weapon/paper))
				spawntimer = 90
			copying = TRUE
			visible_message("正在复制\the [base[1]]...")
			icon_state = "printingpress1"
			if (do_after(H, spawntimer, src))
				if (!isemptylist(base) && !isemptylist(copy))
					visible_message("印刷机完成了复制.")
					icon_state = "printingpress0"
					for(var/obj/item/weapon/B in base)
						B.loc = get_turf(src)
						base -= B
						if (istype(B, /obj/item/weapon/book) && !istype(B, /obj/item/weapon/book/holybook) && !istype(B, /obj/item/weapon/book/research) && !istype(B, /obj/item/weapon/book/language_book))
							var/obj/item/weapon/book/NC = B
							var/obj/item/weapon/book/NB = new/obj/item/weapon/book(src.loc)
							NB.dat = NC.dat
							NB.due_date = NC.due_date
							NB.author = NC.author
							NB.unique = NC.unique
							NB.title = NC.title
						else if (istype(B, /obj/item/weapon/book/holybook))
							var/obj/item/weapon/book/holybook/NC = B
							var/obj/item/weapon/book/holybook/NB = new/obj/item/weapon/book/holybook(src.loc)
							NB.author = NC.author
							NB.title = NC.title
							NB.name = NC.name
							NB.desc = NC.desc
							NB.religion = NC.religion
							NB.religion_type = NC.religion_type
						else if (istype(B, /obj/item/weapon/paper))
							var/obj/item/weapon/paper/NC = B
							var/obj/item/weapon/paper/NP = new/obj/item/weapon/paper(src.loc)
							NP.name = NC.name
							NP.info = NC.info
							NP.info_links = NC.info_links
							NP.fields = NC.fields
							NP.free_space = NC.free_space
							NP.rigged = NC.rigged
							NP.spam_flag = NC.spam_flag
						else if (istype(B, /obj/item/weapon/book/research))
							var/obj/item/weapon/book/research/NC = B
							var/obj/item/weapon/book/research/NB = new/obj/item/weapon/book/research(src.loc)
							NB.author = NC.author
							NB.title = NC.title
							NB.name = NC.name
							NB.desc = NC.desc
							NB.completed = NC.completed = 0
							NB.k_class = NC.k_class = "none"
							NB.k_level = NC.k_level = 0
							NB.styleb = NC.styleb = "scroll"
						else if (istype(B, /obj/item/weapon/book/language_book))
							var/obj/item/weapon/book/language_book/NC = B
							var/obj/item/weapon/book/language_book/NB = new/obj/item/weapon/book/language_book(src.loc)
							NB.written = TRUE
							NB.lang1 = NC.lang1
							NB.lang2 = NC.lang2
							NB.name = NC.name
							NB.desc = NC.desc
							/*
 							//Theese have no sense for research or not used anywhere in code
							NB.sum_a = NC.sum_a = 0
							NB.sum_b = NC.sum_b = 0
							NB.sum_c = NC.sum_c = 0
							NB.monk = NC.monk = FALSE //if the book was authored by a monk
							NB.religion = NC.religion = "none"
							*/
					for(var/obj/item/weapon/C in copy)
						copy -= C
						qdel(C)
					copying = FALSE
					return
			else
				copying = FALSE
				icon_state = "printingpress0"
				return
	return

////////////////////////////////////////////////////////////////////////
//  Canning  ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
//TO DO TODO: look to this code later, not now. Some fixes was implemented, but not detailed.
/obj/structure/canner
	name = "封罐机"
	desc = "一种用于密封罐头的压力工具."
	icon = 'icons/obj/cans.dmi'
	icon_state = "canner"
	anchored = TRUE
	density = FALSE
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = FALSE
	flags = CONDUCT

/obj/structure/canner/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/can))
		var/obj/item/weapon/can/C = W
		if (C.stored.len)
			to_chat(H, "你开始密封\the [C]...")
			icon_state = "canner_active"
			if (do_after(H, 50, H.loc))
				to_chat(H, "你完成了密封\the [C].")
				C.open = FALSE
				C.sealed = TRUE
				C.update_icon()
				icon_state = "canner"
			else
				icon_state = "canner"
		return
	if (istype(W, /obj/item/weapon/wrench))
		playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		to_chat(H, (anchored ? "<span class='notice'>You unfasten \the [src] from the floor.</span>" : "<span class='notice'>You secure \the [src] to the floor.</span>"))
		anchored = !anchored
		return
	if (istype(W, /obj/item/weapon/hammer))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(H, "<span class='notice'>你开始拆解\the [src].</span>")
		if (do_after(H, 50, src))
			to_chat(H, "<span class='notice'>你拆解了\the [src].</span>")
			var/P = "/obj/item/stack/material/iron"
			new P(loc, 4) //4 out of 7 to craft
			qdel(src)

/obj/item/weapon/can
	name = "空罐头"
	desc = "一种能让食物长时间保鲜的铁罐. 可容纳5个单位."
	icon = 'icons/obj/cans.dmi'
	icon_state = "can_empty"
	var/base_icon = "can"
	w_class = ITEM_SIZE_SMALL
	flammable = FALSE
	slot_flags = null
	var/max_capacity = 5
	var/brand = ""
	var/list/obj/item/stored = list()
	var/open = TRUE
	var/sealed = FALSE
	var/customcolor1 = null
	var/customcolor2 = null
	basematerials = list("tin", 0.45)
	New()
		flags |= CONDUCT

/obj/item/weapon/can/small
	name = "空小罐头"
	desc = "一种能让食物长时间保鲜的铁罐. 可容纳3个单位."
	icon_state = "small_can_empty"
	base_icon = "small_can"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_POCKET
	max_capacity = 3
	basematerials = list("tin", 0.3)

/obj/item/weapon/can/large
	name = "空大罐头"
	desc = "一种能让食物长时间保鲜的铁罐. 可容纳10个单位."
	icon_state = "large_can_empty"
	base_icon = "large_can"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = null
	max_capacity = 10
	basematerials = list("tin", 0.9)

/obj/item/weapon/can/update_icon()
	if (open)
		if (stored.len)
			icon_state = "[base_icon]_open"
		else
			icon_state = "[base_icon]_empty"
	else
		icon_state = "[base_icon]"

/obj/item/weapon/can/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/reagent_containers/food/snacks) && open)
		if (stored.len<max_capacity && !sealed)
			stored += W
			H.drop_from_inventory(W)
			W.forceMove(src)
			to_chat(H, "你将\the [W]放入了\the [src].")
			icon_state = "[base_icon]_open"
			if (stored.len==1)
				name = "[brand]canned [W]"
				name = replacetext(name, "the","")
			else
				if (!findtext(name, "[W]"))
					name = replacetext(name, " and ",", ")
					name = "[name] and [W]"
					name = replacetext(name, "the","")
			if (!findtext(W.name, "canned"))
				W.name = replacetext(W.name, "the","")
				W.name = "canned [W.name]"
			name = replacetext(name, "  "," ")
			var/obj/item/weapon/reagent_containers/food/snacks/S = W
			if (S.satisfaction > 0)
				S.satisfaction *= 0.5 //canned food doesn't taste as good
			else
				S.satisfaction *= 1.5 //food that is already bad will taste worse when canned
		else
			to_chat(H, "<span class='notice'>\the [src]已满!</span>")
		return
	if (istype(W, /obj/item/weapon/material/kitchen/utensil/knife) || istype(W, /obj/item/weapon/attachment/bayonet))
		if (!open)
			open = TRUE
			update_icon()
			to_chat(H, "你打开了\the [src].")
		return
	..()

/obj/item/weapon/can/attack_hand(mob/living/human/user)
	if (stored.len && user.has_empty_hand() && loc == user && open)
		for (var/obj/item/I in stored)
			I.loc = user.loc
			stored -= I
			user.put_in_active_hand(I)
			to_chat(user, "你从\the [src]中取出了\the [I].")
			if (!stored.len)
				name = "empty [brand]can"
				icon_state = "[base_icon]_empty"
			break //one item per time
	else
		..()

/obj/item/weapon/can/proc/do_color()
	if (customcolor1)
		var/image/colorov1 = image("icon" = icon, "icon_state" = "[base_icon]_o1")
		colorov1.color = customcolor1
		overlays += colorov1
	if (customcolor2)
		var/image/colorov2 = image("icon" = icon, "icon_state" = "[base_icon]_o2")
		colorov2.color = customcolor2
		overlays += colorov2

/obj/item/weapon/can/filled
	var/list/randbrand = list(
		"Master Taislin", "Metsobeshi", "Old Man", "Welmert",
		"McDonohugh", "McKellen's Delight",	"Freeman", "Valithorento's Finest",
		"Slowman", "Pajeet Special", "Toyoda", "Uma Delicia",
		"Ooga's Cuisine", "Burner King", "Kenobi Kabosh"
	)
	var/list/custcolor = list(
		"#bb5865", "#66b985", "#f9e082", "#7694d0", "#f6a879", "#b88fd0", "#72cfcf", "#8b537a",
		"#bbdf8e", "#f5c5c5", "#5a8080", "#d4b4e8", "#b19f8a", "#f5f3d9", "#9c1414", "#9ed3b5",
		"#9e9f61", "#f6cfb5", "#282869", "#b3b3b3", "#f7f7f7", "#333333"
	)

	var/list/filllist = list(
		/obj/item/weapon/reagent_containers/food/snacks/grown/grapes, /obj/item/weapon/reagent_containers/food/snacks/grown/olives,
		/obj/item/weapon/reagent_containers/food/snacks/grown/mushroom,	/obj/item/weapon/reagent_containers/food/snacks/grown/watermelon,
		/obj/item/weapon/reagent_containers/food/snacks/grown/orange, /obj/item/weapon/reagent_containers/food/snacks/grown/apple,
		/obj/item/weapon/reagent_containers/food/snacks/grown/banana, /obj/item/weapon/reagent_containers/food/snacks/grown/coconut,
		/obj/item/weapon/reagent_containers/food/snacks/grown/tomato, /obj/item/weapon/reagent_containers/food/snacks/grown/beans,
		/obj/item/weapon/reagent_containers/food/snacks/grown/cabbage, /obj/item/weapon/reagent_containers/food/snacks/grown/carrot,
		/obj/item/weapon/reagent_containers/food/snacks/grown/corn
	)
	var/currspawn = null
	icon_state = "can"

/obj/item/weapon/can/filled/New()
	..()
	currspawn = pick(filllist)
	brand = "[pick(randbrand)]"
	stored = fill()
	open = FALSE
	sealed = TRUE
	customcolor1 = pick(custcolor)
	customcolor2 = pick(custcolor)
	name = "[brand]'s [stored[1].name]"
	spawn(1)
		do_color()

/obj/item/weapon/can/filled/proc/fill()
	var/list/tlist = list()
	currspawn = pick(filllist)
	for (var/i=1, i <= rand(3,5), i++)
		var/obj/item/weapon/reagent_containers/food/snacks/grown/GS = new currspawn(src)
		GS.name = "canned [GS.name]"
		if (GS.satisfaction>0)
			GS.satisfaction *= 0.5 //canned food doesn't taste as good
		else
			GS.satisfaction *= 1.5 //food that is already bad will taste worse when canned
		tlist += GS
	return tlist

/obj/item/weapon/can/JPNMRE //I'm too sleep deprived and brain dead to figure out how to do this properly -kenobi
	var/list/randbrand = list(
		"IJA", "IJN"
	)
	var/list/custcolor = list(
		"#8F1313"
	)

	var/list/filllist = list(
		/obj/item/weapon/reagent_containers/food/snacks/boiledrice, /obj/item/weapon/reagent_containers/food/snacks/ramen,
		/obj/item/weapon/reagent_containers/food/snacks/driedsalmon,	/obj/item/weapon/reagent_containers/food/snacks/hardtack
	)
	icon_state = "can"
	var/currspawn = null
/obj/item/weapon/can/JPNMRE/New()
	..()
	currspawn = pick(filllist)
	brand = "[pick(randbrand)]"
	stored = fill()
	open = FALSE
	sealed = TRUE
	customcolor1 = pick(custcolor)
	customcolor2 = pick(custcolor)
	name = "[brand]'s [stored[1].name]"
	spawn(1)
		do_color()

/obj/item/weapon/can/JPNMRE/proc/fill()
	var/list/tlist = list()
	currspawn = pick(filllist)
	for (var/i=1, i <= rand(3,5), i++)
		var/obj/item/weapon/reagent_containers/food/snacks/grown/GS = new currspawn(src)
		GS.name = "canned [GS.name]"
		if (GS.satisfaction>0)
			GS.satisfaction *= 0.5 //canned food doesn't taste as good
		else
			GS.satisfaction *= 1.5 //food that is already bad will taste worse when canned
		tlist += GS
	return tlist
////////////////////////////////////////////////////////////////////////
//  Compost bin  ///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// TO DO TODO: Think about what if game continues after saving??? Yes, think it in details.
// TO DO TODO: Maybe a rough estimate of the quantity from the whole like in examine() make more global procedure?
/obj/structure/compost
	name = "堆肥箱"
	desc = "一个木箱, 用于将垃圾和残渣转化为肥料."
	icon = 'icons/obj/structures.dmi'
	icon_state = "compostbin"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/tmp/current = 0
	var/tmp/composting = FALSE

/obj/structure/compost/examine(mob/user)
	if (!..(user, TRUE))
		return
	if (current==0)
		to_chat(user, "<span class='notice'>它是空的</span>")
	else if (current<1)
		to_chat(user, "<span class='notice'>有混合废弃物, 但不足以开始堆肥过程.</span>")
	else if (current<2.5)
		to_chat(user, "<span class='notice'>[src]不到四分之一满, 堆肥过程正在进行中.</span>")
	else if (current<3.3)
		to_chat(user, "<span class='notice'>[src]不到三分之一满, 堆肥过程正在进行中.</span>")
	else if (current>=10)
		to_chat(user, "<span class='notice'>[src]已满, 堆肥过程正在进行中.</span>")
	else if (current>7.5)
		to_chat(user, "<span class='notice'>[src]超过四分之三满, 堆肥过程正在进行中.</span>")
	else if (current>6.6)
		to_chat(user, "<span class='notice'>[src]超过三分之二满, 堆肥过程正在进行中.</span>")
	else if (current>5)
		to_chat(user, "<span class='notice'>[src]超过一半满, 堆肥过程正在进行中.</span>")
	else
		to_chat(user, "<span class='notice'>[src]不到一半满, 堆肥过程正在进行中.</span>")

/obj/structure/compost/New()
	..()
	initialize()

/obj/structure/compost/proc/add(var/obj/item/W, var/mob/living/human/H, amount_to_add)
	current += amount_to_add
	if (H)
		H.visible_message("<span class='warning'>[H]将\the [W]放入\the [src], 进行堆肥.</span>",
			"<span class='notice'>你将\the [W]放入\the [src], 进行堆肥.</span>")
	qdel(W)

/obj/structure/compost/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (current>=10)
		to_chat(H, "<span class='warning'>堆肥箱已满!</span>")
		return
	var/list/allow_types = list(/obj/item/weapon/reagent_containers/food, /obj/item/stack/material/leaf, /obj/item/stack/farming/seeds,
		/obj/item/stack/material/poppy, /obj/item/stack/material/tobacco, /obj/item/stack/material/tobacco_green, /obj/item/stack/material/coca,
		/obj/item/stack/material/flax, /obj/item/stack/material/hemp, /obj/item/stack/material/rettedfabric,
		/obj/item/stack/dung
	)
	if (is_type_in_list(W, allow_types))
		H.drop_item(src.loc)
		auto_load(H)
		return TRUE
	if (istype(W,/obj/item/weapon/wrench))
		wrench_action(H)
		return TRUE
	if (istype(W,/obj/item/weapon/hammer))
		hammer_action(H, W, 150, list("/obj/item/stack/material/wood"), list(7))
		return TRUE
	to_chat(H, "<span class='warning'>\the [W]不适合用于堆肥.</span>")

/obj/structure/compost/proc/auto_load(var/mob/living/human/H)
	for (var/obj/item/W in src.loc)
		if (current>=10)
			if (H)
				to_chat(H, "<span class='warning'>堆肥箱已满!</span>")
			break
		if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/poo)) //poo and fertilizer not need compost, but we have now storage for poo
			if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/poo/fertilizer))
				continue
			if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/poo/animal))
				continue
			add(W, H, 0.75) //human poo is near fertilizer, but need composting first
			continue
		if (istype(W, /obj/item/stack/dung))
			continue
		if (W.type == /obj/item/stack/ore)
			add(W, H, W.amount*10) //It's not obtainable item now, we used it for save/load current values
			continue
		if (istype(W, /obj/item/weapon/reagent_containers/food))
			add(W, H, 0.5)
			continue
		if (istype(W, /obj/item/stack/material/leaf))
			add(W, H, W.amount/18) //divides (using /) by eighteenth's from each plant input of 1, 0.05(5555555555556) gain per leaf
			continue
		if (istype(W, /obj/item/stack/farming/seeds))
			add(W, H, W.amount/10) //divides (using /) by tenths from each plant input of 1, 0.10 gain per seed, 10 seeds = 1 unit. 100 seeds = 10
			continue
		if (istype(W, /obj/item/stack/material/poppy) || istype(W, /obj/item/stack/material/tobacco_green) || istype(W, /obj/item/stack/material/tobacco) || istype(W, /obj/item/stack/material/coca))
			add(W, H, W.amount/4) //by fourths from each stack plant input of 1, 0.25 gain per plant, 4 stackplants = 1 unit. 40 stackplants = 10
			continue
		if (istype(W, /obj/item/stack/material/flax) || istype(W, /obj/item/stack/material/hemp) || istype(W, /obj/item/stack/material/rettedfabric))
			add(W, H, W.amount/4) //by fourths from each stack plant input of 1, 0.25 gain per plant, 4 stackplants = 1 unit. 40 stackplants = 10

/obj/structure/compost/proc/compost()
	if (!src)
		return
	if (!src.loc)
		return
	composting = TRUE
	if (current<1)
		spawn(rand(450,600))
			compost()
	else
		spawn(rand(800,1000))
			visible_message("堆肥材料开始降解.")
			spawn(rand(800,1000))
				current--
				new/obj/item/weapon/reagent_containers/food/snacks/poo/fertilizer(loc)
				compost()

/obj/structure/compost/initialize()
	. = ..()
	if (!composting)
		auto_load()
		composting = TRUE
		spawn(rand(25,100))
			compost()

/obj/structure/compost/before_save()
	. = ..()
	var/obj/item/O = new/obj/item/stack/ore(src.loc, current/10)
	O.alpha = 0
	current = 0

/obj/structure/compost/after_load()
	. = ..()
	initialize()




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////PLANKAGE////////////////SAWMILLS//////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/structure/sawmill
	name = "原始锯木厂"
	desc = "一个小型锯木厂, 用于将原木切割成木板. 这台简陋的机器每根原木只能生产1块木板."
	icon = 'icons/obj/plankage.dmi'
	icon_state = "primitive_sawmill"
	anchored = TRUE
	density = TRUE
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/tmp/obj/item/stack/current_work = null
	var/tmp/obj/item/stack/current_material = null
	var/tmp/mob/living/human/current_user = null
	var/tmp/work_time_amount = 0

/obj/structure/sawmill/large
	name = "大型锯木厂"
	desc = "一个大型锯木厂, 用于将原木切割成木板. 这台每根原木能生产2块木板."
	icon = 'icons/obj/plankage_64.dmi'
	icon_state = "sawmill"
	bound_width = 64
	bound_height = 32

/obj/structure/sawmill/powered
	name = "动力锯木厂"
	desc = "一个大型动力锯木厂, 用于将原木切割成木板. 这台每根原木能生产4块木板."
	icon = 'icons/obj/plankage_64.dmi'
	bound_width = 64
	bound_height = 32
	icon_state = "sawmill_power"
	powerneeded = 1

/obj/structure/sawmill/proc/check_power()
	if (!powersource || !powerneeded)
		return FALSE
	else
		if (powersource.powered && ((powersource.powerflow-powersource.currentflow) >= powerneeded))
			if (!powered)
				powersource.update_power(powerneeded,1)
				powered = TRUE
				powersource.currentflow += powerneeded
				powersource.lastupdate2 = world.time
				return TRUE
		else
			powered = FALSE
			return

/obj/structure/sawmill/proc/finish_work()
	check_power()
	if (current_work)
		current_user.visible_message(
			"<span class='notice'>你可以看到[current_user.name]是如何在\a [src.name]上制作[current_work.name]的.</span>",
			"<span class='notice'>你完成了生产\the [current_work.name].</span>",
			"<span class='notice'>\the [src.name]的声音消失了.</span>")
		if (istype(src, /obj/structure/sawmill/large))
			icon_state = "sawmill"
		else if (istype(src, /obj/structure/sawmill/powered))
			icon_state = "sawmill_power"
		else
			icon_state = "primitive_sawmill"
		qdel(current_material)
		var/obj/item/stack/this_production = new current_work.type(null, current_work.amount, FALSE) //deleting and creating for sterilization effect (we need really new object)
		current_user.put_in_active_hand(this_production)
		qdel(current_work)
		if (current_user.give_exp(list("crafting","dexterity"), list(67,33), work_time_amount) == -2)
			var/newamount = clamp(ceil(this_production.amount/2+rand(1,ceil(this_production.amount/2))),ceil(this_production.amount/2),this_production.amount)
			if (newamount < this_production.amount)
				to_chat(current_user, "<span class='bad'>由于严重失误, 你少生产了[this_production.amount - newamount] [this_production.name].</span>")
				this_production.amount = newamount
		current_user.mood -= work_time_amount*MOOD_LOSS_PER_DECISECOND_OF_MENTAL_WORK*0.67
		current_user.mood -= work_time_amount*MOOD_LOSS_PER_DECISECOND_OF_PHYSICAL_WORK*0.33
		current_user.stats["stamina"][1] -= work_time_amount*STAMINA_LOSS_BASE_PER_DECISECOND_SDS_OF_WORK*0.33
	current_work = null
	current_material = null
	current_user = null
	work_time_amount = 0

/obj/structure/sawmill/proc/produce(var/obj/item/stack/W, var/mob/living/human/H, var/obj/item/stack/P)
	check_power()
	if (!H.in_mood())
		return
	if(!anchored)
		to_chat(H, "<span class='warning'>\The [src]需要先固定到位才能切割任何东西.</span>")
		return
	if(istype(src, /obj/structure/sawmill/powered) && powered == FALSE)
		to_chat(H, "<span class='warning'>\The [src]需要先通电才能切割任何东西.</span>")
		return
	if (current_work)
		to_chat(H, "<span class='warning'>\The [src.name]正忙, 等待锯片完成切割.</span>")
		return
	if (istype(src, /obj/structure/sawmill/large))
		current_work = new P(null, W.amount * 10, FALSE) //in fact for information purpose only we really need new object
		icon = 'icons/obj/plankage_64.dmi'
		icon_state = "sawmill1"
		work_time_amount = round(0.1*(W.amount*8+47)) //The efficiency increases with the amount of material. For 1 material we get 20 deciseconds, for 50 material - 254 deciseconds.
	else if (istype(src, /obj/structure/sawmill/powered) && powered == TRUE)
		current_work = new P(null, W.amount * 12, FALSE) //in fact for information purpose only we really need new object
		icon = 'icons/obj/plankage_64.dmi'
		icon_state = "sawmill_power1"
		work_time_amount = round(0.1*(W.amount*4+47)) //The efficiency increases with the amount of material. For 1 material we get 20 deciseconds, for 50 material - 254 deciseconds.
	else
		current_work = new P(null, W.amount * 4, FALSE) //in fact for information purpose only we really need new object
		icon_state = "primitive_sawmill1"
		work_time_amount = round(0.1*(W.amount*12+47)) //The efficiency increases with the amount of material. For 1 material we get 20 deciseconds, for 50 material - 254 deciseconds.
	current_material = W
	current_user = H
	H.visible_message(
		"<span class='notice'>你可以看到[H.name]是如何在\a [src.name]上开始切割[W.name]的.</span>",
		"<span class='notice'>你开始生产\the [current_work.name].</span>",
		"<span class='notice'>你听到有人在\the [src.name]上开始切割.</span>")
	work_time_amount = work_time_amount*(0.67/H.getStatCoeff("crafting") + 0.33/H.getStatCoeff("dexterity"))
	if (do_after(H, work_time_amount, src.loc))
		playsound(loc, 'sound/effects/woodfile.ogg', 100, TRUE)
		finish_work()
	else
		if (istype(src, /obj/structure/sawmill/large))
			icon_state = "sawmill"
		else if (istype(src, /obj/structure/sawmill/powered))
			icon_state = "sawmill_power"
		else
			icon_state = "primitive_sawmill"
		//20% - with no penalty, 30% - little mood decreasing, 25% - mood decreasing,
		//15% - to lose some material and mood decreasing, 10% to lose all material and great mood decreasing
		switch (rand(1,100)) //here are another algorithm because we don't know how much work was really done
			if (1 to 20) //20% with no penalty... almost
				H.visible_message(
					"<span class='notice'>你看到[H.name]将[W.name]从[src.name]中拉出, 停止了工作.</span>",
					"<span class='notice'>你安全地将\the [W.name]从\the [src.name]中拉出, 停止了工作.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				if (prob(25)) //5% to lose or gain some skill
					if (prob(80)) //4% to lose
						H.emote("sigh")
						to_chat(H, "<span class='notice'>你失去了一点制作技能.</span>")
						H.adaptStat("crafting", -1)
					else //1% to gain
						H.emote("giggle")
						to_chat(H, "<span class='notice'>你对这门手艺又多了解了一点.</span>")
						H.adaptStat("crafting", 1)
			if (21 to 50) //30% little mood decreasing
				H.visible_message(
					"<span class='notice'>你看到[H.name]叹了口气, 将[W.name]从[src.name]中拉出, 停止了工作.</span>",
					"<span class='notice'>你将\the [W.name]从\the [src.name]中拉出, 停止了工作. 你有点沮丧.</span>",
					"<span class='notice'>你听到一声恼怒的低语. \the [src.name]的声音消失了.</span>")
				H.mood -= 2
			if (51 to 75) //25% nervously
				H.visible_message(
					"<span class='notice'>你看到[H.name]紧张地将[W.name]从\the [src.name]中拔出, 停止了工作.</span>",
					"<span class='notice'>你紧张地将\the [W.name]从\the [src.name]中拔出, 停止了工作. 你有些沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				H.emote("sigh")
				H.mood -= 4
			if (76 to 90) //15% losing some material
				H.visible_message(
					"<span class='notice'>你看到[H.name]将[W.name]从\the [src.name]中拔出, 停止了工作并失去了一些[W.name].</span>",
					"<span class='notice'>你将\the [W.name]从\the [src.name]中拉出, 停止了工作. 你很沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				W.amount = round(W.amount/2 + W.amount/10*rand(1,10))
				to_chat(H, "<span class='bad'>你失去了[current_work.amount - W.amount] [W.name]\].</span>")
				H.emote("cry")
				H.mood -= 8
				if (prob(33)) //5% to lose or gain some skill
					if (prob(80)) //4% to gain
						to_chat(H, "<span class='notice'>你对这门手艺又多了解了一点.</span>")
						H.adaptStat("crafting", rand(1, clamp(current_work.amount-W.amount,1,5)))
					else //1% to lose
						to_chat(H, "<span class='notice'>你失去了一点制作技能.</span>")
						H.adaptStat("crafting", -1)
			else //10% to lose all material
				H.visible_message(
					"<span class='notice'>你看到[H.name]从\the [src.name]中拔出[W.name],停止了工作并失去了一些[W.name].</span>",
					"<span class='notice'>你从\the [src.name]中拔出\the [W.name],停止了工作.你非常沮丧.</span>",
					"<span class='notice'>\the [src.name]的声音消失了.</span>")
				if (prob(50)) //5% to breakthrough
					if (prob(10)) //0.5% EUREKA!
						to_chat(H, "<span class='notice'>但是...</span><span class='good'>我发现了!</span><span class='notice'>你对这门手艺的了解增加了好几倍.</span>")
						H.adaptStat("crafting", current_work.amount*2) //20 times more than usual. EUREKA!
					else // 4.5% breakthrough
						to_chat(H, "<span class='notice'>但是...你对这门手艺多了一点了解.</span>")
						H.adaptStat("crafting", rand(1, clamp(current_work.amount-W.amount,1,20))) //In fact three times more.
				W.amount = 0
				qdel(W)
				H.emote("scream")
				H.mood -= 16
		qdel(current_work)
		current_work = null
		current_material = null
		current_user = null

/obj/structure/sawmill/attackby(var/obj/item/stack/W as obj, var/mob/living/human/H as mob, var/obj/item/I)
	check_power()
	if (istype(W, /obj/item/stack/material/wood))
		produce(W, H, /obj/item/stack/material/woodplank)
		return
	if (istype(W,/obj/item/weapon/wrench))
		wrench_action(H)
		return
	if (istype(W,/obj/item/weapon/hammer))
		hammer_action(H, W, 150, list("/obj/item/stack/material/wood"), list(6))
		return
	if (istype(W, /obj/item/stack/cable_coil))
		if (powersource)
			to_chat(H, "这里已经连接了一根电缆!把它从[src]处再分开一些.")
			return
		var/obj/item/stack/cable_coil/CC = W
		powersource = CC.place_turf(get_turf(src), H, turn(get_dir(H,src),180))
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
					to_chat(H, "你连接了两根电缆.")

			for(var/obj/structure/cable/NCOC in get_turf(get_step(powersource,opdir2)))
				if ((NCOC.tiledir == powersource.tiledir) && NCOC != powersource)
					if (!(powersource in NCOC.connections) && !list_cmp(powersource.connections, NCOC.connections))
						NCOC.connections += powersource
					if (!(NCOC in powersource.connections) && !list_cmp(powersource.connections, NCOC.connections))
						powersource.connections += NCOC
		to_chat(H, "你将电缆连接到[src].")
	else
		..()
	..(W, H)

/obj/structure/sawmill/initialize()
	. = ..()
	finish_work()

/obj/structure/sawmill/after_load()
	. = ..()
	finish_work()

/obj/structure/sawmill/before_save()
	. = ..()
	finish_work()
