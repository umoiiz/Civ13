obj/structure/bell_stand
	name = "bell stand"
	desc = "Fire! Fire!"
	icon = 'icons/obj/structures.dmi'
	icon_state = "bell_stand"
	anchored = TRUE
	density = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/cooldown_bell_stand = FALSE

/obj/structure/bell_stand/attack_hand(var/mob/living/human/H)
	if (cooldown_bell_stand == FALSE)
		icon_state = "bell_stand_ringing"
		playsound(loc, 'sound/effects/bell_stand.ogg', 200, FALSE, 5)
		visible_message("<span class='warning'>[H]敲响了铃铛!</span>")
		cooldown_bell_stand = TRUE
		spawn(10 SECONDS)
			cooldown_bell_stand = FALSE
			icon_state = "bell_stand"
	else
		to_chat(H, "你至少需要等待10秒.")
	return

/obj/structure/bell_stand
	name = "教堂钟"
	desc = "一口教堂钟.看起来它可能会<b>极其</b>响亮."

/obj/structure/bell_stand/church/attack_hand(var/mob/living/human/H)
	if (cooldown_bell_stand == FALSE)
		cooldown_bell_stand = TRUE
		icon_state = "bell_stand_ringing"
		world << sound('sound/effects/church_bells.ogg', repeat = TRUE, wait = TRUE, channel = 777)
		visible_message("<span class='warning'>[H]敲响了教堂钟!</span>")
		to_chat(world, "<font size = 5>\icon[getFlatIcon(src)]<span class='warning'>教堂钟正在鸣响.</span></font>")
		spawn(16 SECONDS)
			world << sound(null, channel = 777)
			icon_state = "bell_stand"
			cooldown_bell_stand = FALSE
	else
		to_chat(H, "你至少需要等待16秒.")
	return

/obj/structure/bell_stand/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench))
			visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"]\the [src][anchored ? "from" : "to"]地面.</span>")
			playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
			if (do_after(H,50,src))
				visible_message("<span class='warning'>[H][anchored ? "unsecures" : "secures"]\the [src][anchored ? "from" : "to"]了地面.</span>")
				anchored = !anchored
				return
		if (istype(I, /obj/item/weapon/hammer))
			visible_message("<span class='warning'>[H]开始拆除\the [src].</span>")
			playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
			if (do_after(H,50,src))
				visible_message("<span class='warning'>[H]拆除了\the [src].</span>")
				qdel(src)
				return

/obj/item/weapon/handbell
	name = "手铃"
	desc = "适合用来悦耳地发出信号."
	icon = 'icons/obj/items.dmi'
	icon_state = "handbell"
	item_state = "handbell"
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL

	attack_verb = list("attacked", "whacked")
	var/cooldown_handbell = FALSE

/obj/item/weapon/handbell/attack_self(mob/user as mob)
	if (cooldown_handbell == FALSE)
		playsound(loc, 'sound/effects/handbell.ogg', 100, FALSE, 5)
		user.visible_message("<span class='warning'>[user]敲响了[name]!</span>")
		cooldown_handbell = TRUE
		spawn(5 SECONDS)
			cooldown_handbell = FALSE
		return
