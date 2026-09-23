/obj/structure/fitness
	icon = 'icons/obj/objects.dmi'
	anchored = 1
	var/being_used = 0

/obj/structure/fitness/punchingbag
	name = "沙袋"
	desc = "一个沙袋."
	icon_state = "pbag"
	color = "#801a08"
	density = 1
	var/list/hit_message = list("hit", "punch", "left hook", "right hook")

/obj/structure/fitness/punchingbag/attack_hand(var/mob/living/human/H)
	if(!istype(H))
		..()
		return
	if(H.nutrition < 20)
		to_chat(H, "<span class='warning'>你需要更多能量才能使用沙袋.去吃点东西吧.</span>")
	else
		if(H.a_intent == I_HARM)
			H.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			flick("[icon_state]_hit", src)
			playsound(src.loc, 'sound/effects/woodhit.ogg', 25, 1, -1)
			H.do_attack_animation(src)
			H.nutrition -= (5 * DEFAULT_HUNGER_FACTOR)
			H.water -= (5 * 0.05)
			if (prob(80))
				if (prob(50))
					H.adaptStat("strength", 1)
				else
					H.adaptStat("dexterity", 1)
			to_chat(H, "<span class='warning'>你[pick(hit_message)]\the [src].</span>")

/obj/structure/fitness/weightlifter
	name = "举重机"
	desc = "一台用于举重的机器."
	icon_state = "weightlifter"
	var/weight = 1
	var/list/qualifiers = list("with ease", "without any trouble", "with great effort")

/obj/structure/fitness/weightlifter/attackby(obj/item/weapon/W as obj, mob/H as mob)
	if(istype(W, /obj/item/weapon/wrench))
		playsound(src.loc, 'sound/items/Deconstruct.ogg', 75, 1)
		weight = ((weight) % qualifiers.len) + 1
		to_chat(H, "你将机器的重量等级设置为[weight].")

/obj/structure/fitness/weightlifter/attack_hand(var/mob/living/human/H)
	if(!istype(H))
		return
	if(H.loc != src.loc)
		to_chat(H, "<span class='warning'>你必须站在举重机上才能使用它.</span>")
		return
	if(H.nutrition < 50)
		to_chat(H, "<span class='warning'>你需要更多能量才能举重.去吃点东西吧.</span>")
		return
	if(H.water < 50)
		to_chat(H, "<span class='warning'>你开始脱水了.去喝点东西吧.</span>")
		return
	if(being_used)
		to_chat(H, "<span class='warning'>举重机已经被其他人占用了.</span>")
		return
	else
		being_used = 1
		playsound(src.loc, 'sound/effects/weightlifter.ogg', 50, 1)
		H.set_dir(SOUTH)
		flick("[icon_state]_[weight]", src)
		if(do_after(H, 20 + (weight * 10)))
			playsound(src.loc, 'sound/effects/weightdown.ogg', 25, 1)
			H.nutrition -= (weight * DEFAULT_HUNGER_FACTOR)
			H.water -= (weight * 0.05)
			to_chat(H, "<span class='notice'>你[qualifiers[weight]]举起了重物.</span>")
			if (prob(60))
				H.adaptStat("strength", 1)
			being_used = 0
		else
			to_chat(H, "<span class='notice'>与你之前的判断相反,也许健身并不适合你.</span>")
			being_used = 0