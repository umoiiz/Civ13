//Melee Weapons, non edged or piercing (clubs, batons, maces)
/obj/item/weapon/melee
	edge = FALSE
	sharp = FALSE
	var/force_multiplier = 1.2
	var/force_divisor = 3
	var/weakens = 0
	var/weaken_chance = 40

/obj/item/weapon/melee/attack(mob/M as mob, mob/living/user as mob, var/target_zone)

	switch (user.a_intent) // harm intent lets us murder people, others not so much - Kachnov
		if (I_HARM)
			force *= force_multiplier
		if (I_HELP, I_GRAB, I_DISARM)
			force /= force_divisor

	var/user_last_intent = user.a_intent
	user.a_intent = I_HARM // so we actually hit people right

	..(M, user, target_zone)
	if (weakens && prob(weaken_chance))
		M.Weaken(weakens) // decent

	user.a_intent = user_last_intent

	force = initial(force)

/obj/item/weapon/melee/mace
	name = "铁制钉头锤"
	desc = "一把铁制钉头锤,很适合打断骨头和盔甲."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "mace"
	item_state = "mace"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_WEAK+2
	weakens = 1
	w_class = ITEM_SIZE_SMALL
	flammable = FALSE

/obj/item/weapon/melee/mace/kanabo
	name = "铁制金棒"
	desc = "一把铁制金棒,这种源自日本的大型钝器以其重量和造型将受害者砸成肉泥."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "kanabo"
	item_state = "kanabo"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_WEAK+3
	weakens = 1
	w_class = ITEM_SIZE_NORMAL
	flammable = FALSE

/obj/item/weapon/melee/mace/mauler
	name = "重型晨星锤"
	desc = "一把大得令人畏惧的晨星锤,可以轻易将任何人砸成肉酱;更不用说从头到脚全副武装的人了."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "maul"
	item_state = "mauler1"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_NORMAL
	weakens = 1
	w_class = ITEM_SIZE_NORMAL
	flammable = FALSE

/obj/item/weapon/melee/classic_baton
	name = "木制警棍"
	desc = "一根用来殴打罪犯渣滓的木制警棍."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "baton"
	item_state = "classic_baton"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK+1
	weakens = 3
	flammable = TRUE
	flags = FALSE

/obj/item/weapon/melee/classic_baton/guard
	name = "重型警棍"
	desc = "一根用来殴打罪犯渣滓的重型木制警棍."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "baton"
	item_state = "classic_baton"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK
	weakens = 5
	flammable = TRUE

/obj/item/weapon/melee/nightbaton
	name = "警棍"
	desc = "警察使用的棍子."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "nightbaton"
	item_state = "nightbaton"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK+2
	weakens = 6
	flammable = TRUE
	flags = FALSE

/obj/item/weapon/melee/nightbaton/sandman
	name = "重型"
	desc = "一根由营地指挥官持有的警棍,囚犯们因其击打之重而给它起了个绰号叫睡魔."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "kombaton"
	item_state = "nightbaton"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK+2
	weakens = 0
	flammable = TRUE
	var/cooldown = FALSE

/obj/item/weapon/melee/nightbaton/sandman/attack(mob/M as mob, mob/living/user as mob)
	if(!cooldown)
		M.SetWeakened(50)
		src.cooldown = TRUE
		spawn(100)
			src.cooldown = FALSE
	else
		to_chat(user, "<span class='notice'>你不久前才用过这根警棍.冷静点!</span>")
	..()

/obj/item/weapon/melee/classic_baton/club
	name = "木棒"
	desc = "世界上最古老的武器之一.当你需要把人打倒在地时很好用."
	icon_state = "club"
	item_state = "club"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_WEAK
	flammable = TRUE
	weakens = 1
	weaken_chance = 20

/* 	//Commented out for the moment, as an attack proc has been made for all melee weapons
	//(see line 10)
/obj/item/weapon/melee/classic_baton/club/attack(mob/M as mob, mob/living/user as mob)

	switch (user.a_intent)
		if (I_HARM)
			force*=1.2
		if (I_HELP, I_GRAB, I_DISARM)
			force/=3

	var/user_last_intent = user.a_intent
	user.a_intent = I_HARM

	..(M, user)
	if (weakens && prob(20))
		M.Weaken(weakens) // decent

	user.a_intent = user_last_intent

	force = initial(force)
*/

/obj/item/weapon/melee/classic_baton/whip
	name = "鞭子"
	desc = "一条皮鞭.用来让你的奴隶守规矩."
	icon = 'icons/obj/items.dmi'
	hitsound = 'sound/weapons/whipcrack.ogg'
	icon_state = "whip"
	item_state = "whip"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK+1
	flammable = TRUE

/obj/item/weapon/melee/knuckle_duster
	name = "指虎"
	desc = "一块套在手上的金属.可以打碎几颗牙."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "knuckle_duster"
	item_state = "knuckle_duster"
	slot_flags = SLOT_POCKET
	force = WEAPON_FORCE_PAINFUL
	flammable = FALSE
	weakens = FALSE

/obj/item/weapon/melee/baseball_bat
	name = "木制棒球棍"
	desc = "一根用于棒球运动的平滑木棒.很适合砸碎头骨."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "woodbat"
	item_state = "woodbat"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	flammable = TRUE
	weakens = 1

/obj/item/weapon/melee/baseball_bat/aluminium
	name = "铝制棒球棍"
	desc = "一根用于棒球运动的平滑金属棒.这根比木制的更结实."
	icon_state = "metalbat"
	item_state = "metalbat"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL+3
	flammable = FALSE
	flags = CONDUCT

/obj/item/weapon/melee/classic_baton/big_club
	name = "大木棒"
	desc = "这看起来好大!"
	icon_state = "big_club"
	item_state = "big_club"
	force = WEAPON_FORCE_PAINFUL
	weakens = 3
	force_multiplier = 2.5
	force_divisor = 1.5

/* 	//Commented out for the moment, as an attack proc has been made for all melee weapons
	//(see line 10)
/obj/item/weapon/melee/classic_baton/big_club/attack(mob/M as mob, mob/living/user as mob)

	switch (user.a_intent) // harm intent lets us murder people, others not so much - Kachnov
		if (I_HARM)
			force*=2.5
		if (I_HELP, I_GRAB, I_DISARM)
			force/=1.5

	var/user_last_intent = user.a_intent
	user.a_intent = I_HARM // so we actually hit people right

	..(M, user)

	if (weakens && prob(40))
		M.Weaken(weakens) // decent

	user.a_intent = user_last_intent

	force = initial(force)
*/

/obj/item/weapon/macuahuitl
	name = "马夸威特"
	desc = "一把带有黑曜石刀刃的中美洲木棒."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "macuahuitl"
	item_state = "macuahuitl"
	attack_verb = list("smacked", "hit", "bludgeoned")
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_ROBUST
	sharp = TRUE
	edge = TRUE
	sharpness = 15
	w_class = ITEM_SIZE_NORMAL
	flammable = FALSE

////////////////GARROTE/////////////////////
/obj/item/garrote
	name = "绞索"
	desc = "一种手持的绳索勒具,用于勒死一个人."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "garrote"
	item_state = "zippo"
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_WEAK
	flammable = TRUE
	slot_flags = SLOT_BELT | SLOT_POCKET
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 5
	throw_range = 8
	var/next_garrote = 0
	var/garroting = FALSE

/obj/item/garrote/Destroy()
	garroting = FALSE
	update_icon()
	return ..()

/obj/item/garrote/update_icon()
	icon_state = "garrote[garroting ? "_w" : ""]"

/obj/item/garrote/attack(mob/living/human/target as mob, mob/living/human/user as mob)
	if (garroting)
		stop_garroting(user,target)
		return
	else
		start_garroting(user,target)
		return
/obj/item/garrote/proc/start_garroting(mob/living/human/user,mob/living/human/target)
	if (!user.has_empty_hand())
		to_chat(user, "<span class='notice'>你需要一只空闲的手才能使用绞索!</span>")
		return
	var/obj/item/weapon/grab/GR = new /obj/item/weapon/grab(user, target)
	user.put_in_hands(GR)
	GR.synch()
	target.LAssailant = user
	if (GR != null)
		playsound(target.loc, 'sound/weapons/grapple.ogg', 40, 1, -4)
		playsound(target.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -5)
		garroting = TRUE
		update_icon()
		garroting_process(user,target,GR)
		next_garrote = world.time + 40
		user.visible_message(
			"<span class='danger'>[user]用\the [src]抓住了\the [target]!</span>",\
			"<span class='danger'>You grab \the [target] with \the [src]!</span>",\
			"You hear some struggling and muffled cries of surprise")
		return
/obj/item/garrote/proc/stop_garroting(mob/living/human/user,mob/living/human/target)
	garroting = FALSE
	to_chat(user, "<span class='notice'>你松开了勒住受害者的绞索.</span>") //Not the grab, though. Only the garrote.
	update_icon()
	return
/obj/item/garrote/attack_self(mob/living/human/user)
	if(world.time <= next_garrote) 	return
	if(garroting)
		stop_garroting(user)
		return

/obj/item/garrote/proc/garroting_process(mob/living/human/user,mob/living/human/target,obj/item/weapon/grab/GB)
	if (!ishuman(user) || !ishuman(target) || !GB)
		return FALSE
	if(ishuman(user))
		if(!(user.l_hand == src || user.r_hand == src)) //THE GARROTE IS NOT IN HANDS, ABORT
			stop_garroting(user,target)
			return FALSE

		if(!(user.l_hand == GB || user.r_hand == GB)) //THE GRAB IS NOT IN HANDS, ABORT
			stop_garroting(user,target)
			return FALSE

		if (garroting == FALSE)
			stop_garroting(user,target)
			return FALSE

		spawn(25)
			garroting_process(user,target,GB)

		if(istype(target))
			target.canmove = FALSE
			if(!target.mouth_covered)
				target.forcesay(list("-hrk!", "-hrgh!", "-urgh!", "-kh!", "-hrnk!"))

		if (garroting) //Only do oxyloss if in agreesive grab to prevent passive grab choking or something.
			target.adjustOxyLoss(10) //Stack the chokes with additional oxyloss for quicker death
			if(prob(5))
				target.stuttering = max(target.stuttering, 3) //It will hamper your voice, being choked and all.
				target.losebreath = max(target.losebreath, 3)
		return TRUE
	else
		garroting = FALSE
		update_icon()

		return FALSE

/obj/item/weapon/melee/telebaton
	name = "伸缩警棍"
	desc = "一种紧凑但重新平衡过的个人防身武器.折叠时可以隐藏."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "telebaton_0"
	item_state = "telebaton_0"
	slot_flags = SLOT_BELT
	var/on = 0
	flags = FALSE


/obj/item/weapon/melee/telebaton/attack_self(mob/user as mob)
	on = !on
	if(on)
		user.visible_message("<span class='warning'>随着手腕一抖,[user]甩出了伸缩警棍.</span>",\
		"<span class='warning'>You extend the baton.</span>",\
		"You hear an ominous click.")
		force = 15//quite robust
		attack_verb = list("smacked", "struck", "slapped")
	else
		user.visible_message("<span class='notice'>\The [user]收起了伸缩警棍.</span>",\
		"<span class='notice'>You collapse the baton.</span>",\
		"You hear a click.")
		force = 3//not so robust now
		attack_verb = list("hit", "punched")

	playsound(src.loc, 'sound/weapons/empty.ogg', 50, 1)
	add_fingerprint(user)
	update_icon()
	update_held_icon()

/obj/item/weapon/melee/telebaton/update_icon()
	if(on)
		icon_state = "telebaton_1"
		item_state = "telebaton_1"
	else
		icon_state = "telebaton_0"
		item_state = "telebaton_0"
	if(length(blood_DNA))
		generate_blood_overlay(TRUE) // Force recheck.
		overlays.Cut()
		overlays += blood_overlay

/obj/item/weapon/soviet_flag // To be placed elsewhere in the code
	desc = "苏联国旗."
	name = "苏联国旗"
	icon = 'icons/obj/flags.dmi'
	icon_state = "sov_flag_object"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand.dmi',
		)
	item_state = "sov_flag"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 5
	throw_range = 3
	w_class = ITEM_SIZE_GARGANTUAN
	attack_verb = list("poked", "bashed", "bludgeoned", "whacked")
	flammable = TRUE
	slot_flags = null