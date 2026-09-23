//for unfired clay stuff, i.e. unusable
/obj/item/weapon/clay
	name = "未烧制的黏土"
	desc = "未烧制的黏土. 把它放进火里烘干"
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claylump"
	item_state = "claylump"
	throwforce = WEAPON_FORCE_WEAK
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	throw_speed = 3
	throw_range = 5
	var/result = "none"
	var/base_icon = "claylump"
	value = 1
	flags = FALSE

/obj/item/weapon/clay/roofing
	name = "未烧制的黏土屋顶瓦"
	icon_state = "unfired_clayroofing"
	result = /obj/item/weapon/roofbuilder/clay

/obj/item/weapon/clay/roofing/blue
	name = "未烧制的蓝黏土屋顶瓦"
	icon_state = "unfired_clayroofing"
	result = /obj/item/weapon/roofbuilder/clay/blue

/obj/item/weapon/clay/roofing/black
	name = "未烧制的黑黏土屋顶瓦"
	icon_state = "unfired_clayroofing"
	result = /obj/item/weapon/roofbuilder/clay/black

/obj/item/weapon/clay/roofing/kerawa
	name = "未烧制的黑凯拉瓦屋顶瓦"
	icon_state = "unfired_clayroofing"
	result = /obj/item/weapon/roofbuilder/clay/kerawa

/obj/item/weapon/clay/vase
	name = "未烧制的黏土花瓶"
	icon_state = "unfired_clayvase"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/clayvase

/obj/item/weapon/clay/winecup
	name = "未烧制的黏土酒杯"
	icon_state = "unfired_winecup"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/claywinecup

/obj/item/weapon/clay/claypot
	name = "未烧制的中号黏土罐"
	icon_state = "unfired_claypot1"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/claypot
	New()
		..()
		icon_state = "unfired_claypot[pick(1,2,3)]"
/obj/item/weapon/clay/claybricks
	name = "未烧制的黏土块"
	icon_state = "unfired_claybricks"
	result = /obj/item/weapon/clay/claybricks/fired

/obj/item/weapon/clay/advclaybricks
	name = "未烧制的砖"
	icon_state = "unfired_advclaybricks"
	result = /obj/item/weapon/clay/advclaybricks/fired

/obj/item/weapon/clay/advclaybricks/cement
	name = "未烧制的水泥砖"
	icon_state = "unfired_cementbricks"
	result = /obj/item/weapon/clay/advclaybricks/fired/cement

/obj/item/weapon/clay/claybowl
	name = "未烧制的陶碗"
	icon_state = "unfired_claybowl"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/claybowl

/obj/item/weapon/clay/clayjug
	name = "未烧制的陶壶"
	icon_state = "unfired_bigclaypot1"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/clayjug
	New()
		..()
		icon_state = "unfired_clayjug[pick(1,2)]"
/obj/item/weapon/clay/claycup
	name = "未烧制的陶杯"
	icon_state = "unfired_claycup"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/claycup

/obj/item/weapon/clay/smallclaypot
	name = "未烧制的小陶罐"
	icon_state = "unfired_smallclaypot1"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/smallclaypot
	New()
		..()
		icon_state = "unfired_smallclaypot[pick(1,2)]"
/obj/item/weapon/clay/bigclaypot
	name = "未烧制的大陶罐"
	icon_state = "unfired_bigclaypot1"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/bigclaypot
	New()
		..()
		icon_state = "unfired_bigclaypot[pick(1,2)]"
/obj/item/weapon/clay/verysmallclaypot
	name = "未烧制的极小陶罐"
	icon_state = "unfired_verysmallclaypot"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/verysmallclaypot

/obj/item/weapon/clay/claypitcher
	name = "未烧制的陶水罐"
	icon_state = "unfired_claypitcher"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/claypitcher

/obj/item/weapon/clay/largeclaypitcher
	name = "未烧制的大陶水罐"
	icon_state = "unfired_largeclaypitcher"
	result = /obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher

/obj/item/weapon/clay/claybricks/fired
	name = "黏土块"
	icon_state = "claybricks"
	desc = "黏土块. 可用于建造黏土墙."
	throwforce = WEAPON_FORCE_WEAK+2
	force = WEAPON_FORCE_WEAK+4

/obj/item/weapon/clay/advclaybricks/fired
	name = "砖块"
	icon_state = "advclaybricks"
	desc = "现代砖块. 可用于建造砖墙."
	throwforce = WEAPON_FORCE_WEAK+3
	force = WEAPON_FORCE_WEAK+5

/obj/item/weapon/clay/advclaybricks/fired/cement
	name = "水泥砖"
	icon_state = "cementbricks"
	desc = "现代砖块. 可用于建造水泥墙."
	throwforce = WEAPON_FORCE_WEAK+4
	force = WEAPON_FORCE_WEAK+6


/obj/item/weapon/clay/claybricks/fired/attack_self(mob/user)
	var/choice = WWinput(user, "What time of clay wall do you want to build?","Clay Walls","Clay Blocks",list("Clay Blocks","Sumerian Clay"))
	if (choice == "Clay Blocks")
		to_chat(user, "你开始建造黏土墙...")
		if (do_after(user, 25, src))
			to_chat(user, "你完成了黏土块墙地基的放置.")
			new /obj/covers/clay_wall/incomplete(user.loc)
			qdel(src)
			return

	else if (choice == "Sumerian Clay")
		to_chat(user, "你开始建造苏美尔黏土墙...")
		if (do_after(user, 25, src))
			to_chat(user, "你完成了苏美尔黏土墙地基的放置.")
			new /obj/covers/clay_wall/sumerian/incomplete(user.loc)
			qdel(src)
			return

/obj/item/weapon/clay/advclaybricks/fired/attack_self(mob/user)
	to_chat(user, "你开始建造砖墙...")
	if (do_after(user, 25, src))
		to_chat(user, "你完成了砖墙地基的放置.")
		new /obj/covers/brick_wall/incomplete(user.loc)
		qdel(src)
		return

/obj/item/weapon/clay/advclaybricks/fired/cement/attack_self(mob/user)
	to_chat(user, "你开始建造水泥墙...")
	if (do_after(user, 25, src))
		to_chat(user, "你完成了水泥墙地基的放置.")
		new /obj/covers/cement_wall/incomplete(user.loc)
		qdel(src)
		return

//pots
/obj/item/weapon/reagent_containers/food/drinks/clay
	name = "陶罐"
	desc = "一个陶罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claypot1"
	amount_per_transfer_from_this = 10
	volume = 100
	center_of_mass = list("x"=17, "y"=10)
	w_class = ITEM_SIZE_SMALL


/obj/item/weapon/reagent_containers/food/drinks/clay/Bump(atom/A)
	if (isliving(A) || isturf(A) || (isobj(A) && A.density))
		shatter()

/// This code is not to be confused with apply_hit_effect()
///
/// This code handles the throwing of bottles.
///
/obj/item/weapon/reagent_containers/food/drinks/clay/throw_impact(atom/hit_atom, var/speed)

	..()
	if (reagents && reagents.total_volume > 0)
		hit_atom.visible_message("<span class='notice'>\the [src]的内容物溅了[hit_atom]一身!</span>")
		reagents.splash(hit_atom, reagents.total_volume)
		
	else
		hit_atom.visible_message("<span class='notice'>\the [src]的陶土碎裂在[hit_atom]身上!</span>")
	shatter(loc, hit_atom)

// call shatter when you want it to become a broken_bottle


/// This code is not to be confused with throw_impact()
///
/// This code handles the hitting of bottles on people.
///
/obj/item/weapon/reagent_containers/food/drinks/clay/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	var/blocked = ..()

	if (user.a_intent != I_HARM)
		return


	// You are going to knock someone out for longer if they are not wearing a helmet.
	var/weaken_duration = FALSE
	if (blocked < 2)
		weaken_duration = 5 + min(0, force - target.getarmor(hit_zone, "melee") + 10)

	var/mob/living/human/H = target
	if (istype(H) && H.headcheck(hit_zone))
		var/obj/item/organ/affecting = H.get_organ(hit_zone) //headcheck should ensure that affecting is not null
		user.visible_message("<span class='danger'>[user]将[src]砸进了[H]的[affecting.name]里!</span>")
		if (weaken_duration)
			target.apply_effect(min(weaken_duration, 5), WEAKEN, blocked) // Never weaken more than a flash!
	else
		user.visible_message("<span class='danger'>\The [user]将[src]砸进了[target]里!</span>")

	if (reagents && reagents.total_volume > 0)
		spawn (1) // wait until after our explosion, if we have one
			user.visible_message("<span class='notice'>\the [src]的内容物溅了[target]一身!</span>")
			reagents.splash(target, reagents.total_volume)
			
	else
		user.visible_message("<span class='notice'>\the [src]的陶土碎裂在[target]身上!</span>")
	shatter(loc, target)
	
// call shatter when you want it to become a broken_bottle
	//Finally, shatter the bottle. This kills (qdel) the bottle.

	var/obj/item/weapon/clayshards/B = shatter(target.loc, target)
	user.put_in_active_hand(B)

/obj/item/weapon/reagent_containers/food/drinks/clay/proc/shatter(var/newloc, atom/against = null)

	if (!newloc)
		newloc = get_turf(src)


	if (src)
		if (ismob(loc))
			var/mob/M = loc
			M.drop_from_inventory(src)

		//Creates a shattering noise and replaces the bottle with a broken_bottle
		var/obj/item/weapon/clayshards/B = new/obj/item/weapon/clayshards(newloc) // Create a glass shard at the target's location!

		playsound(src,'sound/effects/drop_glass.ogg',100,1)
		transfer_fingerprints_to(B)

		qdel(src)
		return B

/obj/item/weapon/reagent_containers/food/drinks/clay/verysmallclaypot
	name = "极小陶罐"
	desc = "一个极小陶罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "verysmallclaypot"
	amount_per_transfer_from_this = 2
	volume = 25
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/reagent_containers/food/drinks/clay/smallclaypot
	name = "小陶罐"
	desc = "小陶罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "smallclaypot"
	amount_per_transfer_from_this = 5
	volume = 55
	w_class = ITEM_SIZE_TINY
	New()
		..()
		icon_state = "smallclaypot[pick(1,2)]"

/obj/item/weapon/reagent_containers/food/drinks/clay/claypot
	name = "中陶罐"
	desc = "中陶罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claypot1"
	amount_per_transfer_from_this = 10
	volume = 90
	w_class = ITEM_SIZE_SMALL
	New()
		..()
		icon_state = "claypot[pick(1,2,3)]"


/obj/item/weapon/reagent_containers/food/drinks/clay/bigclaypot
	name = "大陶罐"
	desc = "大陶罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "bigclaypot1"
	amount_per_transfer_from_this = 10
	volume = 130
	w_class = ITEM_SIZE_SMALL
	New()
		..()
		icon_state = "bigclaypot[pick(1,2)]"

/obj/item/weapon/reagent_containers/food/drinks/clay/clayjug
	name = "陶壶"
	desc = "陶壶."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "clayjug1"
	amount_per_transfer_from_this = 10
	volume = 100
	w_class = ITEM_SIZE_SMALL
	New()
		..()
		icon_state = "clayjug[pick(1,2)]"

/obj/item/weapon/reagent_containers/food/drinks/clay/claybowl
	name = "陶碗"
	desc = "陶碗."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claybowl"
	amount_per_transfer_from_this = 10
	volume = 55
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/reagent_containers/food/drinks/clay/claycup
	name = "陶杯"
	desc = "陶杯."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claycup"
	amount_per_transfer_from_this = 10
	volume = 40
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/reagent_containers/food/drinks/clay/claywinecup
	name = "陶酒杯"
	desc = "陶酒杯."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claywinecup"
	amount_per_transfer_from_this = 5
	volume = 30
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/reagent_containers/food/drinks/clay/clayvase
	name = "陶花瓶"
	desc = "陶花瓶."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "clayvase"
	amount_per_transfer_from_this = 15
	volume = 130
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/reagent_containers/food/drinks/clay/claypitcher
	name = "陶水罐"
	desc = "陶水罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claypitcher"
	amount_per_transfer_from_this = 15
	volume = 80
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher
	name = "大陶水罐"
	desc = "大陶水罐."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "largeclaypitcher"
	amount_per_transfer_from_this = 20
	volume = 130
	w_class = ITEM_SIZE_SMALL
	var/quality = 0

/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/attackby(var/obj/item/I, var/mob/living/human/H)
	if (istype(I, /obj/item/stack/material))
		var/obj/item/stack/material/S = I
		if (istype(I, /obj/item/stack/material/gold))
			if (S.amount >= 1)
				if (S.amount > 1)
					S.amount--
				else if (S.amount == 1)
					qdel(S)
				new/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/gold(H.loc)
				qdel(src)
				return
			else
				return
		else if (istype(I, /obj/item/stack/material/silver))
			if (S.amount >= 1)
				if (S.amount > 1)
					S.amount--
				else if (S.amount == 1)
					qdel(S)
				new/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/silver(H.loc)
				qdel(src)
				return
			else
				return
		else if (istype(I, /obj/item/stack/material/diamond))
			if (S.amount >= 1)
				if (S.amount > 1)
					S.amount--
				else if (S.amount == 1)
					qdel(S)
				new/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/diamond(H.loc)
				qdel(src)
				return
			else
				return
	..()

/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/gold
	name = "金陶水罐"
	icon_state = "pitcher_gold"
	quality = 10
/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/silver
	name = "银陶水罐"
	icon_state = "pitcher_silver"
	quality = 5
/obj/item/weapon/reagent_containers/food/drinks/clay/largeclaypitcher/diamond
	name = "镶钻陶水罐"
	icon_state = "pitcher_diamond"
	quality = 20

/obj/item/weapon/clayshards
	name = "陶片"
	desc = "破碎陶器留下的陶片."
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "clayshards"
	item_state = "clayshards"
	throwforce = WEAPON_FORCE_WEAK+1
	force = WEAPON_FORCE_WEAK+4
	w_class = ITEM_SIZE_TINY
	throw_speed = 5
	throw_range = 8
	flags = FALSE


/obj/item/weapon/stucco
	name = "普通生灰泥"
	desc = "生灰泥. 成分无特别之处, 可直接涂抹于表面"
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "stucco"
	item_state = "stucco"
	flags = FALSE
	throwforce = WEAPON_FORCE_WEAK
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	throw_speed = 3
	throw_range = 5
	var/result = "none"
	value = 1

/obj/item/weapon/stucco/generic

/obj/item/weapon/stucco/greek
	name = "希腊生灰泥"
	desc = "生灰泥. 带有蓝色条纹和隐秘白色染色, 可直接涂抹于粗糙石质表面"
	icon_state = "greek_stucco"
	item_state = "greek_stucco"

/obj/item/weapon/stucco/roman
	name = "罗马生灰泥"
	desc = "生灰泥. 呈奶油色, 可直接涂抹于粗糙石质表面"
	icon_state = "roman_stucco"
	item_state = "roman_stucco"

/obj/item/weapon/clay/cookingpot
	name = "未烧制的陶锅"
	icon_state = "unfired_cookingpot"
	result = /obj/item/weapon/reagent_containers/glass/small_pot/clay
