///////////////////////////////////////////////Alchohol bottles! -Agouri //////////////////////////
//Functionally identical to regular drinks. The only difference is that the default bottle size is 100. - Darem
//Bottles now weaken and break when shattered on people's heads. - Giacom

/obj/item/weapon/reagent_containers/food/drinks/bottle
	amount_per_transfer_from_this = 10
	volume = 100
	icon = 'icons/obj/drinks.dmi'
	item_state = "broken_beer" //Generic held-item sprite until unique ones are made.
	force = 5
	var/shatter_duration = 5 //Directly relates to the 'weaken' duration. Lowered by armor (i.e. helmets)
	var/isGlass = TRUE //Whether the 'bottle' is made of glass or not so that milk s dont shatter when someone gets hit by it

	var/obj/item/weapon/reagent_containers/glass/rag/rag = null
	var/rag_underlay = "rag"
	var/icon_state_full
	var/icon_state_empty

	dropsound = 'sound/effects/drop_glass.ogg'

	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov/New()
	..()
	icon_state_full = icon_state
	if (findtext(icon_state, "bottle") || findtext(icon_state, "canteen"))
		icon_state_empty = icon_state
	else
		icon_state_empty = "[icon_state]_empty"
	var/obj/item/weapon/reagent_containers/glass/rag/R = new /obj/item/weapon/reagent_containers/glass/rag/soaked(null)
	rag = R
	rag.loc = src
	flags &= ~OPENCONTAINER
	update_icon()

/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov/vodka
	icon_state = "vodkabottle"
	New()
		..()
		reagents.add_reagent("vodka", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov/whiskey
	icon_state = "whiskeybottle"
	New()
		..()
		reagents.add_reagent("whiskey", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov/beer
	icon_state = "oldstyle_beer"
	volume = 35
	New()
		..()
		reagents.add_reagent("beer", 35)

/obj/item/weapon/reagent_containers/food/drinks/bottle/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/food/drinks/bottle/New()
	..()
	icon_state_full = icon_state
	if (findtext(icon_state, "bottle") || findtext(icon_state, "canteen"))
		icon_state_empty = icon_state
	else
		icon_state_empty = "[icon_state]_empty"

/obj/item/weapon/reagent_containers/food/drinks/bottle/Destroy()
	if (rag)
		rag.loc = loc
	rag = null
	return ..()

/// This code is not to be confused with apply_hit_effect()
///
/// This code handles the throwing of bottles.
///
///when thrown on impact, bottles shatter and spill their contents
/obj/item/weapon/reagent_containers/food/drinks/bottle/throw_impact(atom/hit_atom, var/speed)
	var/alcohol_power = calculate_alcohol_power()

	..()

	var/mob/M = thrower
	if (isGlass && istype(M))
		var/throw_dist = get_dist(throw_source, loc)
		if (shatter_check(throw_dist)) //not as reliable as shattering directly
			if (reagents && reagents.total_volume > 0)  // Check if reagents exist and the bottle is not empty
				hit_atom.visible_message("<span class='notice'>\the 的内容[src]溅了\the [hit_atom]一身!</span>")
				reagents.splash(hit_atom, reagents.total_volume)
			else
				hit_atom.visible_message("<span class='notice'>\the 的空瓶子[src]在\the [hit_atom]身上碎得到处都是!</span>")  // Adds an else statement for shattering into shards
			shatter(loc, hit_atom, alcohol_power)
// call shatter when you want it to become a broken_bottle


/obj/item/weapon/reagent_containers/food/drinks/bottle/proc/calculate_alcohol_power()
	. = 0

	if (reagents)
		for (var/datum/reagent/R in reagents.reagent_list)
			if (istype(R, /datum/reagent/ethanol))
				var/datum/reagent/ethanol/E = R
				. += (min(max(E.strength, 25), 50) * E.volume)

	if (rag && rag.reagents)
		for (var/datum/reagent/R in rag.reagents.reagent_list)
			if (istype(R, /datum/reagent/ethanol))
				var/datum/reagent/ethanol/E = R
				. += (min(max(E.strength, 25), 50) * E.volume)

/obj/item/weapon/reagent_containers/food/drinks/bottle/proc/shatter_check(var/distance)
	if (!isGlass || !shatter_duration)
		return FALSE

	var/list/chance_table = list(50, 75, 90, 95, 100, 100, 100) //starting from distance 0
	var/idx = max(distance + 1, 1) //since list indices start at 1
	if (idx > chance_table.len)
		return 0
	return prob(chance_table[idx])

/obj/item/weapon/reagent_containers/food/drinks/bottle/throw_at(atom/target, range, speed, thrower)
	..(target, range, speed, thrower)
	spawn (3)
		while (src && throwing)
			sleep(1)
		if (src && !throwing)
			if (loc == get_turf(target))
				Bump(target, TRUE)
			else
				var/area/src_area = get_area(src)
				if (src_area && map && map.caribbean_blocking_area_types.Find(src_area.type))
					Bump(loc, TRUE, FALSE)
				else
					Bump(loc, TRUE)

/obj/item/weapon/reagent_containers/food/drinks/bottle/Bump(atom/A, yes, explode = TRUE)
	if (src && isGlass)
		if (isliving(A) || isturf(A) || (isobj(A) && A.density))
			shatter(get_turf(A), A, explode ? calculate_alcohol_power() : 0)
	..(A, yes)

// molotov recode, 4/7/18 - Kachnov
/obj/item/weapon/reagent_containers/food/drinks/bottle/proc/shatter(var/newloc, atom/against = null, var/alcohol_power = 0)

	if (!newloc)
		newloc = get_turf(src)

	if (rag && rag.on_fire && alcohol_power)

		forceMove(newloc)

		if (against && isliving(against))
			var/mob/living/L = against
			L.IgniteMob()

		rag.loc = null
		qdel(rag)
		rag = null

// for reference:
// "apply_damage(ceil(fire_stacks/3)+1, BURN, "chest", FALSE)" is the fire damage formula, found in living_defense.dm

		mainloop:
			for (var/turf/T in range(get_turf(src), 1))
				if ((prob(90) || T == get_turf(src)) && !T.density)
					for (var/obj/structure/S in T)
						if (S.density && !S.low)
							continue mainloop
					new/obj/effect/fire(T)
					for (var/mob/living/L in T)
						if (L.on_fire)
							continue
						L.fire_stacks += ceil(alcohol_power/1000)
						L.IgniteMob()
						L.adjustBurnLoss(rand(alcohol_power*0.004,alcohol_power*0.008))
						if (ishuman(L))
							L.emote("painscream")

	if (src)
		if (ismob(loc))
			var/mob/M = loc
			M.drop_from_inventory(src)

		//Creates a shattering noise and replaces the bottle with a broken_bottle
		var/obj/item/weapon/broken_bottle/B = new /obj/item/weapon/broken_bottle(newloc)
		if (prob(33))
			new/obj/item/weapon/material/shard(newloc) // Create a glass shard at the target's location!

		B.icon_state = icon_state

		var/icon/I = new('icons/obj/drinks.dmi', icon_state)
		I.Blend(B.broken_outline, ICON_OVERLAY, rand(5), TRUE)
		I.SwapColor(rgb(255, FALSE, 220, 255), rgb(0, FALSE, FALSE, FALSE))
		B.icon = I

		playsound(src,'sound/effects/drop_glass.ogg',100,1)
		transfer_fingerprints_to(B)

		qdel(src)
		return B

/obj/item/weapon/reagent_containers/food/drinks/bottle/attackby(obj/item/W, mob/user)
	if (!rag && istype(W, /obj/item/weapon/reagent_containers/glass/rag))
		insert_rag(W, user)
		update_icon()
		return
	else if (rag && (istype(W, /obj/item/weapon/flame) || istype(W, /obj/item/clothing/mask/smokable/cigarette) && W:on))
		rag.attackby(W, user)
		update_icon()
		return
	else return ..()

/obj/item/weapon/reagent_containers/food/drinks/bottle/attack_self(mob/user)
	if (rag)
		remove_rag(user)
	else
		..()

/obj/item/weapon/reagent_containers/food/drinks/bottle/proc/insert_rag(obj/item/weapon/reagent_containers/glass/rag/R, mob/user)
	if (!isGlass || rag) return
	if (user.unEquip(R))
		to_chat(user, "<span class='notice'>你把[R]塞进[src].</span>")
		rag = R
		rag.loc = src
		flags &= ~OPENCONTAINER
		update_icon()

/obj/item/weapon/reagent_containers/food/drinks/bottle/proc/remove_rag(mob/user)
	if (!rag) return
	user.put_in_hands(rag)
	rag = null
	flags |= (initial(flags) & OPENCONTAINER)
	update_icon()
	to_chat(user, "<span class='notice'>你从[src]上取下抹布.</span>")

/obj/item/weapon/reagent_containers/food/drinks/bottle/open(mob/user)
	if (rag) return
	..()

/obj/item/weapon/reagent_containers/food/drinks/bottle/update_icon()
	underlays.Cut()
	if (rag)
		var/underlay_image = image(icon='icons/obj/drinks.dmi', icon_state=rag.on_fire? "[rag_underlay]_lit" : rag_underlay)
		underlays += underlay_image
		if (rag.on_fire)
			set_light(2)
	else
		set_light(0)
		if (reagents.total_volume)
			icon_state = icon_state_full
		else
			icon_state = icon_state_empty


/// This code is not to be confused with throw_impact()
///
/// This code handles the hitting of bottles on people.
///
/obj/item/weapon/reagent_containers/food/drinks/bottle/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	var/blocked = ..()

	if (user.a_intent != I_HARM)
		return
	if (!shatter_check(1))
		return //won't always break on the first hit

	// You are going to knock someone out for longer if they are not wearing a helmet.
	var/weaken_duration = FALSE
	if (blocked < 2)
		weaken_duration = shatter_duration + min(0, force - target.getarmor(hit_zone, "melee") + 10)

	var/mob/living/human/H = target
	if (istype(H) && H.headcheck(hit_zone))
		var/obj/item/organ/affecting = H.get_organ(hit_zone) //headcheck should ensure that affecting is not null
		user.visible_message("<span class='danger'>[user]把[src]砸碎在[H]的[affecting.name]上!</span>")
		if (weaken_duration)
			target.apply_effect(min(weaken_duration, 5), WEAKEN, blocked) // Never weaken more than a flash!
	else
		user.visible_message("<span class='danger'>\The [user]把[src]砸碎在[target]上!</span>")

	//The reagents in the bottle splash all over the target, thanks for the idea Nodrak
	var/alcohol_power = calculate_alcohol_power()


// Checks if there are reagents in the bottle to output the message of us splashing alcohol over the target.
	if (reagents && reagents.total_volume > 0)
		reagents.splash(target, reagents.total_volume)
		user.visible_message("<span class='notice'>\the 的内容[src]溅了[target]一身!</span>")
	else
		user.visible_message("<span class='notice'>\the 的空瓶子[src]在[target]身上碎得到处都是!</span>")
	spawn (1)
		shatter(loc, target, alcohol_power)


	//Finally, shatter the bottle. This kills (qdel) the bottle.

	var/obj/item/weapon/broken_bottle/B = shatter(target.loc, target, alcohol_power)
	user.put_in_active_hand(B)

//Keeping this here for now, I'll ask if I should keep it here.
/obj/item/weapon/broken_bottle

	name = "破瓶子"
	desc = "一个底部破损锋利的瓶子。"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	force = 9
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = TRUE
	edge = FALSE
	dropsound = 'sound/effects/drop_glass.ogg'
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")
	value = 0
/obj/item/weapon/broken_bottle/attack(mob/living/human/M as mob, mob/living/human/user as mob)
	if (M != user || M.a_intent != I_HELP)
		playsound(loc, 'sound/weapons/bladeslice.ogg', 50, TRUE, -1)
	return ..()


/obj/item/weapon/reagent_containers/food/drinks/bottle/gin
	name = "狮鹫食者金酒"
	desc = "一瓶高品质金酒。"
	icon_state = "ginbottle"
	center_of_mass = list("x"=16, "y"=4)
	New()
		..()
		reagents.add_reagent("gin", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/gin/empty
	name = "狮鹫食者金酒"
	desc = "一瓶高品质金酒。"
	icon_state = "ginbottle"
	center_of_mass = list("x"=16, "y"=4)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey
	name = "吉特叔叔特别珍藏"
	desc = "一款优质单一麦芽威士忌, 在核避难所的隧道中温和陈酿. 隧道威士忌万岁."
	icon_state = "whiskeybottle"
	center_of_mass = list("x"=16, "y"=3)
	New()
		..()
		reagents.add_reagent("whiskey", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey/empty
	name = "吉特叔叔特别珍藏"
	desc = "一款优质单一麦芽威士忌, 在核避难所的隧道中温和陈酿. 隧道威士忌万岁."
	icon_state = "whiskeybottle"
	center_of_mass = list("x"=16, "y"=3)
	New()
		..()
		reagents.del_reagents()


/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka
	name = "通古斯三重蒸馏"
	desc = "啊, 伏特加. 全世界俄罗斯人首选的饮品兼燃料."
	icon_state = "vodkabottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.add_reagent("vodka", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/bluegoose
	name = "蓝鹅伏特加"
	desc = "一款昂贵的伏特加, 只适合拿来炫耀."
	icon_state = "bluegoose"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.add_reagent("vodka", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/empty
	name = "通古斯三重蒸馏"
	desc = "啊, 伏特加. 全世界俄罗斯人首选的饮品兼燃料."
	icon_state = "vodkabottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla
	name = "卡卡沃保证品质龙舌兰酒"
	desc = "由优质石油馏出物, 纯沙利度胺和其他优质原料制成!"
	icon_state = "tequillabottle"
	center_of_mass = list("x"=16, "y"=3)
	New()
		..()
		reagents.add_reagent("tequilla", 100)
/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla/empty
	name = "卡卡沃保证品质龙舌兰酒"
	desc = "由优质石油馏出物, 纯沙利度胺和其他优质原料制成!"
	icon_state = "tequillabottle"
	center_of_mass = list("x"=16, "y"=3)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing
	name = "空无一物的瓶子"
	desc = "一个里面什么都没有的瓶子"
	icon_state = "bottleofnothing"
	center_of_mass = list("x"=17, "y"=5)
	New()
		..()
		reagents.add_reagent("nothing", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/patron
	name = "拉普艺术家培恩龙舌兰"
	desc = "银丝龙舌兰, 供应给全球各地的夜店."
	icon_state = "patronbottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.add_reagent("patron", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/patron/empty
	name = "拉普艺术家培恩龙舌兰"
	desc = "银丝龙舌兰, 供应给全球各地的夜店."
	icon_state = "patronbottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/rum
	name = "一瓶朗姆酒"
	desc = "海盗的最爱."
	icon_state = "oldstyle_rum"
	value = 25
	center_of_mass = list("x"=16, "y"=8)
	New()
		..()
		reagents.add_reagent("rum", 80)

/obj/item/weapon/reagent_containers/food/drinks/bottle/rum/empty
	name = "空朗姆酒瓶"
	desc = "海盗的最爱. 当然, 是装满的时候."
	icon_state = "oldstyle_rum_empty"
	value = 1
	center_of_mass = list("x"=16, "y"=8)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/quinine
	name = "奎宁"
	desc = "用于治疗发烧和疟疾."
	icon_state = "oldstyle_beer"
	item_state = "beer"
	value = 25
	center_of_mass = list("x"=16, "y"=8)
	New()
		..()
		reagents.add_reagent("quinine", 80)

/obj/item/weapon/reagent_containers/food/drinks/bottle/large
	name = "大瓶子"
	desc = "一个容量80单位的大瓶子."
	icon_state = "oldstyle_rum_empty"
	value = 2
	volume = 80
	center_of_mass = list("x"=16, "y"=8)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/large/update_icon()
	if (reagents.reagent_list.len)
		icon_state = "oldstyle_rum"
	else
		icon_state = "oldstyle_rum_empty"

/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth
	name = "金眼味美思"
	desc = "甜蜜又干爽."
	icon_state = "vermouthbottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.add_reagent("vermouth", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth/empty
	name = "金眼味美思"
	desc = "甜蜜又干爽"
	icon_state = "vermouthbottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua
	name = "罗伯特 罗布斯特的咖啡利口酒"
	desc = "一款广为人知的墨西哥咖啡风味利口酒. 自1936年起生产, HONK"
	icon_state = "kahluabottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.add_reagent("kahlua", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua/empty
	name = "罗伯特 罗布斯特的咖啡利口酒"
	desc = "一款广为人知的墨西哥咖啡风味利口酒. 自1936年起生产, HONK"
	icon_state = "kahluabottle"
	center_of_mass = list("x"=17, "y"=3)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager
	name = "女大学生金箔酒"
	desc = "因为只有她们才会喝100 proof的肉桂烈酒."
	icon_state = "goldschlagerbottle"
	center_of_mass = list("x"=15, "y"=3)
	New()
		..()
		reagents.add_reagent("goldschlager", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager/empty
	name = "女大学生金箔酒"
	desc = "因为只有她们才会喝100 proof的肉桂烈酒."
	icon_state = "goldschlagerbottle"
	center_of_mass = list("x"=15, "y"=3)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac
	name = "巴顿城堡特级干邑"
	desc = "一种甜美且酒精度很高的饮品, 经过多次蒸馏和多年陈酿制成. 这次你最好别喊'SHITCURITY'."
	icon_state = "cognacbottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.add_reagent("cognac", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac/empty
	name = "巴顿城堡特级干邑"
	desc = "一种甜美且酒精度很高的饮品, 经过多次蒸馏和多年陈酿制成. 这次你最好别喊'SHITCURITY'."
	icon_state = "cognacbottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.del_reagent()

/obj/item/weapon/reagent_containers/food/drinks/bottle/wine
	name = "红葡萄酒"
	desc = "典型的红葡萄酒."
	icon_state = "winebottle"
	center_of_mass = list("x"=16, "y"=4)
	value = 16
	New()
		..()
		reagents.add_reagent("wine", 100)
/obj/item/weapon/reagent_containers/food/drinks/bottle/palmwine
	name = "棕榈酒"
	desc = "一种粗制饮品, 由发酵棕榈树液制成."
	icon_state = "tribalpot"
	center_of_mass = list("x"=16, "y"=4)
	value = 18
	New()
		..()
		reagents.add_reagent("palmwine", 40)

/obj/item/weapon/reagent_containers/food/drinks/bottle/wine/empty
	name = "双须大胡子特酿葡萄酒"
	desc = "一股隐约的不安与蛋疼感环绕着这个瓶子."
	icon_state = "winebottle"
	center_of_mass = list("x"=16, "y"=4)
	value = 1
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe
	name = "越狱绿"
	desc = "喝上一口你就知道你将会玩得很开心."
	icon_state = "absinthebottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.add_reagent("absinthe", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe/empty
	name = "越狱绿"
	desc = "喝上一口你就知道你将会玩得很开心."
	icon_state = "absinthebottle"
	center_of_mass = list("x"=16, "y"=6)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/bottle/expensivewine
	name = "昂贵葡萄酒 (La spetia)"
	desc = "一股隐约的不安与蛋疼感环绕着这个瓶子.."
	icon_state = "expensivewine"
	center_of_mass = list("x"=16, "y"=4)
	value = 16
	New()
		..()
		reagents.add_reagent("wine", 100)

/obj/item/weapon/reagent_containers/food/drinks/bottle/wine/expensivewine
	name = "昂贵葡萄酒 (La spetia)"
	desc = "一股隐约的不安与蛋疼感环绕着这个瓶子."
	icon_state = "expensivewine_empty"
	center_of_mass = list("x"=16, "y"=4)
	value = 1
	New()
		..()
		reagents.del_reagents("wine", 100)

//////////////////////////SMALL BOTTLES ///////////////////////


//Small bottles
/obj/item/weapon/reagent_containers/food/drinks/bottle/small
	name = "小瓶子"
	desc = "一个35单位的小瓶子."
	volume = 35
	shatter_duration = TRUE
	flags = FALSE //starts closed
	rag_underlay = "rag_small"
	icon_state = "oldstyle_beer_empty"
	item_state = "beer"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/update_icon()
	if (reagents.reagent_list.len)
		icon_state = "oldstyle_beer"
	else
		icon_state = "oldstyle_beer_empty"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer
	name = "啤酒"
	desc = "一瓶啤酒."
	icon_state = "oldstyle_beer"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=12)
	value = 5
	New()
		..()
		reagents.add_reagent("beer", 40)

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale
	name = "麦酒"
	desc = "一瓶黑麦酒."
	icon_state = "oldstyle_beer"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	value = 6
	New()
		..()
		reagents.add_reagent("ale", 40)

//////////Plastic bottles (Non-custom ones, see custom_containers for these ones)////////////////////////

/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic
	name = "塑料瓶"
	desc = "一个小塑料瓶."
	icon_state = "plastic_bottle"
	item_state = "plastic_bottle"
	isGlass = FALSE
	center_of_mass = list("x"=16, "y"=12)
	volume = 40
	var/image/fluid_image
	New()
		..()
		fluid_image = image('icons/obj/drinks.dmi', "fluid-[icon_state]")
		update_icon()
/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic/update_icon()
	overlays.Cut()
	if (reagents.total_volume > 0)
		if (!fluid_image)
			fluid_image = image('icons/obj/drinks.dmi', "fluid-[icon_state]")
		fluid_image.color = reagents.get_color()
		overlays += fluid_image
	return
/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic/on_reagent_change()
	update_icon()
/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic/large
	name = "大塑料瓶"
	desc = "一个大塑料瓶."
	icon_state = "plastic_bottle_large"
	item_state = "plastic_bottle_large"
	volume = 70
/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic/water
	name = "塑料水瓶"
	desc = "一个装有水的小塑料瓶. 或者没有."
	New()
		..()
		reagents.add_reagent("water", 40)
/obj/item/weapon/reagent_containers/food/drinks/bottle/plastic/large/water
	name = "大塑料水瓶"
	desc = "一个装有水的大塑料瓶. 或者没有."
	New()
		..()
		reagents.add_reagent("water", 70)
//////////////////////////SKYRIM/////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/mead
	name = "蜂蜜酒"
	desc = "一瓶北欧蜂蜜酒."
	icon_state = "mead"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	volume = 40
	value = 20
	New()
		..()
		reagents.add_reagent("mead", 40)
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/mead/update_icon()
	if (reagents.reagent_list.len && flags != OPENCONTAINER)
		icon_state = "mead"
	else
		icon_state = "mead_open"
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/mead/open(mob/user)
		playsound(loc,'sound/effects/canopen.ogg', rand(10,50), TRUE)
		to_chat(user, "<span class='notice'>你拔开了[src]的软木塞!</span>")
		flags |= OPENCONTAINER
		icon_state = "mead_open"
		update_icon()
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/alto_wine
	name = "高葡萄酒"
	desc = "一瓶葡萄酒, 泰姆瑞尔最好的."
	icon_state = "wine"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	value = 20
	volume = 80
	New()
		..()
		reagents.add_reagent("wine", 80)
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/alto_wine/update_icon()
	if (reagents.reagent_list.len && flags != OPENCONTAINER)
		icon_state = "wine"
	else
		icon_state = "wine_open"
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/alto_wine/open(mob/user)
		playsound(loc,'sound/effects/canopen.ogg', rand(10,50), TRUE)
		to_chat(user, "<span class='notice'>你拔开了[src]的软木塞!</span>")
		flags |= OPENCONTAINER
		icon_state = "wine_open"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing
	name = "治疗药水"
	desc = "一瓶治疗化学药剂."
	icon_state = "health_minor"
	item_state = "beer"
	flags = OPENCONTAINER
	center_of_mass = list("x"=16, "y"=10)
	value = 20
	volume = 5
	slot_flags = SLOT_BELT|SLOT_POCKET
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/update_icon()
	if (reagents.reagent_list.len)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]"
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/minor
	name = "次级治疗药水"
	desc = "一瓶弱效治疗化学药剂."
	icon_state = "health_minor"
	New()
		..()
		reagents.add_reagent("minor", 5)
		icon_state = "health_minor"
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/healing_potion
	name = "治疗药水"
	desc = "一瓶中效治疗化学药剂."
	icon_state = "health_potion"
	value = 40
	New()
		..()
		reagents.add_reagent("healing", 5)
		icon_state = "health_potion"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/plentiful
	name = "充沛治疗药水"
	desc = "一瓶良效治疗化学药剂."
	icon_state = "health_plentiful"
	value = 60
	New()
		..()
		reagents.add_reagent("plentiful", 5)
		icon_state = "health_plentiful"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/vigorous
	name = "强效治疗药水"
	desc = "一瓶极效治疗化学药剂."
	icon_state = "health_vigor"
	value = 60
	slot_flags = SLOT_BELT
	New()
		..()
		reagents.add_reagent("vigor", 5)
		icon_state = "health_vigor"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/healing/draught
	name = "强效治疗药水"
	desc = "一瓶极效治疗化学药剂."
	icon_state = "health_vigor"
	value = 200
	slot_flags = SLOT_BELT
	New()
		..()
		reagents.add_reagent("draught", 5)
		icon_state = "health_vigor"

/////////////////stamina/////////////////
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/stamina
	name = "耐力药水"
	desc = "一瓶耐力化学药剂."
	icon_state = "stamina_minor"
	item_state = "beer"
	flags = OPENCONTAINER
	center_of_mass = list("x"=16, "y"=10)
	value = 20
	volume = 5
	slot_flags = SLOT_BELT|SLOT_POCKET
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/stamina/update_icon()
	if (reagents.reagent_list.len)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/stamina/minor
	name = "次级耐力药水"
	desc = "一瓶耐力化学药剂."
	icon_state = "stamina_minor"
	New()
		..()
		reagents.add_reagent("minor_stamina", 5)
		icon_state = "stamina_minor"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/stamina/plentiful
	name = "充沛耐力药水"
	desc = "一瓶耐力化学药剂."
	icon_state = "stamina_plentiful"
	New()
		..()
		reagents.add_reagent("plentiful_stamina", 5)
		icon_state = "stamina_plentiful"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/stamina/vigorous
	name = "强效耐力药水"
	desc = "一瓶耐力化学药剂."
	icon_state = "stamina_vigor"
	slot_flags = SLOT_BELT
	New()
		..()
		reagents.add_reagent("stamina_vigor", 5)
		icon_state = "stamina_vigor"


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/drinks/bottle/small/sake
	volume = 50
	name = "清酒"
	desc = "一瓶清酒."
	icon_state = "sake"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=10)
	value = 6
	New()
		..()
		reagents.add_reagent("sake", 50)
		if (!flags)
			icon_state = "sake_closed"
		else
			icon_state = "sake"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/sake/empty
	volume = 50
	shatter_duration = TRUE
	flags = FALSE //starts closed
	rag_underlay = "rag_small"
	icon_state = "sake_empty"
	item_state = "beer"


/obj/item/weapon/reagent_containers/food/drinks/bottle/small/sake/update_icon()
	if (reagents.reagent_list.len)
		icon_state = "sake"
	else
		icon_state = "sake_empty"

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/cola
	name = "可乐"
	icon_state = "cola"
	item_state = "beer"
	center_of_mass = list("x"=16, "y"=12)
	value = 5
	New()
		..()
		reagents.add_reagent("cola", 60)

////////Cans///////////
/obj/item/weapon/reagent_containers/food/drinks/can
	name = "小罐"
	desc = "一个35单位的小罐."
	volume = 35
	flags = FALSE //starts closed
	icon_state = "monster"
	item_state = "beer"
	var/base_icon = "monster"

/obj/item/weapon/reagent_containers/food/drinks/can/update_icon()
	if (reagents.reagent_list.len)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_empty"
	return
/obj/item/weapon/reagent_containers/food/drinks/can/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/food/drinks/can/monster
	icon_state = "monster"
	base_icon = "monster"
	name = "能量饮料"
	desc = "一罐能量饮料."
	New()
		..()
		reagents.add_reagent("sugar", 5)
		reagents.add_reagent("coffee", 20)
		reagents.add_reagent("cola", 10)
/obj/item/weapon/reagent_containers/food/drinks/can/lite
	name = "淡啤酒"
	desc = "一罐淡啤酒."
	icon_state = "bud"
	base_icon = "bud"
	New()
		..()
		reagents.add_reagent("beer", 25)
		reagents.add_reagent("water", 10)

/obj/item/weapon/reagent_containers/food/drinks/can/water
	name = "水罐"
	desc = "一罐普通水."
	icon_state = "bud"
	base_icon = "bud"
	volume = 50
	New()
		..()
		reagents.add_reagent("water", 50)

/obj/item/weapon/reagent_containers/food/drinks/can/cola
	name = "可乐罐"
	desc = "一罐可乐."
	icon_state = "cola"
	base_icon = "cola"
	volume = 35
	New()
		..()
		reagents.add_reagent("cola", 35)

/obj/item/weapon/reagent_containers/food/drinks/can/tonic
	name = "汤力水罐"
	desc = "一罐可乐."
	icon_state = "cola"
	base_icon = "cola"
	volume = 35
	New()
		..()
		reagents.add_reagent("tonic", 35)

/obj/item/weapon/reagent_containers/food/drinks/can/ice_tea
	name = "冰茶罐"
	desc = "一罐冰茶."
	icon_state = "ice_tea_can"
	base_icon = "ice_tea_can"
	volume = 35
	New()
		..()
		reagents.add_reagent("tea", 30)
		reagents.add_reagent("ice", 5)

/obj/item/weapon/reagent_containers/food/drinks/can/lemonade
	name = "柠檬水罐"
	desc = "一罐柠檬水."
	icon_state = "7up"
	base_icon = "7up"
	volume = 35
	New()
		..()
		reagents.add_reagent("lemonade", 35)

//////////////////Milk jug//////////////////
obj/item/weapon/reagent_containers/food/drinks/can/milk
	name = "milk jug"
	desc = "A jug of milk."
	icon_state = "milk"
	base_icon = "milk"
	volume = 60
	New()
		..()
		reagents.add_reagent("milk", 60)
