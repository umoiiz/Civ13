/proc/getHumanBreakoutTime(var/mob/living/human/H, var/time = 100)
	if (!istype(H))
		return time
	return time /= (H.getStatCoeff("strength")*H.getStatCoeff("strength"))

/mob/living/human/process_resist()

	//drop && roll
	if (on_fire && !buckled)
		fire_stacks -= 1.2
		Weaken(3)
		spin(32,2)
		visible_message(
			"<span class='danger'>[src]在地上打滚,试图扑灭自己身上的火!</span>",
			"<span class='notice'>你停下、趴下、打滚!</span>"
			)
		sleep(30)
		if (fire_stacks <= 0)
			visible_message(
				"<span class='danger'>[src]成功扑灭了自己身上的火!</span>",
				"<span class='notice'>你扑灭了自己身上的火。</span>"
				)
			ExtinguishMob()
		return TRUE

	if (..())
		return TRUE

	if (handcuffed)
		spawn() escape_handcuffs()
	else if (legcuffed)
		spawn() escape_legcuffs()

/mob/living/human/proc/escape_handcuffs()
	//if (!(last_special <= world.time)) return

	//This line represent a significant buff to grabs...
	// We don't have to check the click cooldown because /mob/living/verb/resist() has done it for us, we can simply set the delay
	setClickCooldown(100)

	if (can_break_cuffs()) //Don't want to do a lot of logic gating here.
		break_handcuffs()
		return

	var/obj/item/weapon/handcuffs/HC = handcuffed

	//A default in case you are somehow handcuffed with something that isn't an obj/item/weapon/handcuffs type
	var/breakouttime = getHumanBreakoutTime(src, 1 MINUTE)
	var/displaytime = 2 //Minutes to display in the "this will take X minutes."
	//If you are handcuffed with actual handcuffs... Well what do I know, maybe someone will want to handcuff you with toilet paper in the future...
	if (istype(HC))
		breakouttime = HC.breakouttime
		displaytime = breakouttime / 600 //Minutes

//	var/mob/living/human/H = src

	visible_message(
		"<span class='danger'>\The [src]试图取下\the [HC]!</span>",
		"<span class='warning'>你试图取下\the [HC]。(这大约需要[displaytime]分钟,并且你需要保持不动)</span>"
		)

	if (do_after(src, breakouttime, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
		if (!handcuffed || buckled)
			return
		visible_message(
			"<span class='danger'>\The [src]成功取下了\the [handcuffed]!</span>",
			"<span class='notice'>你成功取下了\the [handcuffed]。</span>"
			)
		drop_from_inventory(handcuffed)

/mob/living/human/proc/escape_legcuffs()
	if (!canClick())
		return

	setClickCooldown(100)

	if (can_break_cuffs()) //Don't want to do a lot of logic gating here.
		break_legcuffs()
		return

	var/obj/item/weapon/legcuffs/HC = legcuffed

	//A default in case you are somehow legcuffed with something that isn't an obj/item/weapon/legcuffs type
	var/breakouttime = getHumanBreakoutTime(src, 1 MINUTE)
	var/displaytime = 2 //Minutes to display in the "this will take X minutes."
	//If you are legcuffed with actual legcuffs... Well what do I know, maybe someone will want to legcuff you with toilet paper in the future...
	if (istype(HC))
		breakouttime = HC.breakouttime
		displaytime = breakouttime / 600 //Minutes

	visible_message(
		"<span class='danger'>[usr]试图取下\the [HC]!</span>",
		"<span class='warning'>你试图取下\the [HC]。(这大约需要[displaytime]分钟,并且你需要保持不动)</span>"
		)

	if (do_after(src, breakouttime, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
		if (!legcuffed || buckled)
			return
		visible_message(
			"<span class='danger'>[src]成功取下了\the [legcuffed]!</span>",
			"<span class='notice'>你成功取下了\the [legcuffed]。</span>"
			)

		drop_from_inventory(legcuffed)
		legcuffed = null
		update_inv_legcuffed()

/mob/living/human/proc/can_break_cuffs()
	if (ishuman(src))
		var/mob/living/human/H = src
		return H.getStatCoeff("strength") >= 2.3

/mob/living/human/proc/break_handcuffs()
	visible_message(
		"<span class='danger'>[src]正试图挣脱\the [handcuffed]!</span>",
		"<span class='warning'>你试图挣脱你的[handcuffed.name]。(这大约需要5秒,并且你需要保持不动)</span>"
		)

	if (do_after(src, 5 SECONDS, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
		if (!handcuffed || buckled)
			return

		visible_message(
			"<span class='danger'>[src]成功挣脱了\the [handcuffed]!</span>",
			"<span class='warning'>你成功挣脱了你的[handcuffed.name]。</span>"
			)

		say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))

		qdel(handcuffed)
		handcuffed = null
		if (buckled && buckled.buckle_require_restraints)
			buckled.unbuckle_mob()
		update_inv_handcuffed()

/mob/living/human/proc/break_legcuffs()
	to_chat(src, "<span class='warning'>你试图挣脱脚镣。(这大约需要5秒,并且你需要保持不动)</span>")
	visible_message("<span class='danger'>[src]正试图挣脱脚镣!</span>")

	if (do_after(src, 5 SECONDS, incapacitation_flags = INCAPACITATION_DEFAULT & ~INCAPACITATION_RESTRAINED))
		if (!legcuffed || buckled)
			return

		visible_message(
			"<span class='danger'>[src]成功挣脱了脚镣!</span>",
			"<span class='warning'>你成功挣脱了脚镣。</span>"
			)

		say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))

		qdel(legcuffed)
		legcuffed = null
		update_inv_legcuffed()

/mob/living/human/escape_buckle()
	setClickCooldown(100)
	if (!buckled) return

	if (!restrained())
		..()
	else
		visible_message(
			"<span class='danger'>[usr]试图解开自己的安全带!</span>",
			"<span class='warning'>你试图解开自己的安全带。(这大约需要一分钟,并且你需要保持不动)</span>"
			)


		if (do_after(usr, getHumanBreakoutTime(src, 1 MINUTE), incapacitation_flags = INCAPACITATION_DEFAULT & ~(INCAPACITATION_RESTRAINED | INCAPACITATION_BUCKLED_FULLY)))
			if (!buckled)
				return
			visible_message("<span class='danger'>\The [usr]成功解开了自己的安全带!</span>",
							"<span class='notice'>你成功解开了自己的安全带。</span>")
			buckled.user_unbuckle_mob(src)
