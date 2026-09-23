
/obj/structure/wild/rock
	name = "岩石"
	icon_state = "rock5"
	icon = 'icons/obj/flora/rocks.dmi'
	deadicon = 'icons/obj/flora/rocks.dmi'
	deadicon_state = "rock5"
	opacity = FALSE
	density = FALSE
	flammable = FALSE
	amount = 0
	health = 20
	maxhealth = 20
	var/flint_amount = 5
	var/rocktype = "rock"

/obj/structure/wild/rock/basalt
	icon_state = "basalt1"
	rocktype = "basalt"
	density = TRUE
	maxhealth = 60
	health = 60

/obj/structure/wild/rock/attack_hand(var/mob/living/human/H)
	if (H.a_intent == I_GRAB)
		to_chat(H, "你开始在岩石中寻找燧石...")
		if (do_after(H, 50, H.loc) && flint_amount > 0)
			to_chat(H, "你找到了一些燧石.")
			flint_amount--
			var/obj/item/weapon/flint/newflint = new/obj/item/weapon/flint(src.loc)
			H.put_in_hands(newflint)
			flint_regen()
		return
	else
		..()

/obj/structure/wild/rock/attackby(var/obj/item/weapon/W, var/mob/living/human/H)
	if (istype(W, /obj/item/weapon/flint))
		H.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		var/obj/item/weapon/flint/F = W
		if (!F.sharpened)
			to_chat(H, "<span class='warning'>你用\the [W]敲击岩石.</span>")
			playsound(src,'sound/effects/chop.ogg',100,1)
			if (prob(20))
				to_chat(H, "\The [W]被敲下一片, 露出了锋利的边缘!")
				F.sharpen()
		return

	..()

/obj/structure/wild/rock/proc/flint_regen()
	spawn(18000)
		if (src && flint_amount < 5)
			flint_amount++
		return

/obj/structure/wild/rock/New()
	..()
	icon_state = "[rocktype][rand(1,5)]"
	deadicon = 'icons/obj/flora/rocks.dmi'
	deadicon_state = "[rocktype][rand(1,5)]"

/obj/item/weapon/flint
	name = "燧石"
	desc = "一小块燧石岩石."
	icon_state = "flint"
	item_state = ""
	icon = 'icons/obj/old_weapons.dmi'
	force = 5
	sharp = FALSE
	edge = FALSE
	w_class = ITEM_SIZE_TINY
	throw_speed = 7
	throw_range = 10
	allow_spin = TRUE
	attack_verb = list("hit","bashed")
	value = 1
	cooldownw = 5
	flammable = FALSE
	var/sharpened = FALSE
	var/itemtype1 = /obj/item/weapon/material/sword
	var/itemtype2 = /obj/item/weapon/material/spear
	var/itemtype3 = /obj/item/weapon/material/kitchen/utensil/knife
	var/itemtype4 = /obj/item/weapon/material/hatchet
	var/itemtype5 = /obj/item/weapon/material/boarding_axe
	var/itemtype6 = /obj/item/weapon/material/machete
	var/itemtype7 = /obj/item/weapon/material/machete1
	var/itemtype8 = /obj/item/weapon/material/twohanded
	var/itemtype9 =/obj/item/weapon/material/thrown
	var/itemtype10 = /obj/item/weapon/material/shovel
	var/itemtype11 = /obj/item/weapon/material/pickaxe
	var/delay = 250 //Time to do the action.
	var/noise = 'sound/machines/grindstone.ogg' //Noise to do when doing the action.
	var/repairamount = 6 //0 is full repair, any other number adds until it hits max.
	var/damageamount = 4 //How much max durability to take away.
	var/actiontext = "sharpen" //Plural, flavortext

/obj/item/weapon/flint/attackby(obj/item/M as obj, mob/user as mob)
	if(istype(M, itemtype1) || istype(M, itemtype2) || istype(M, itemtype3) || istype(M, itemtype4) || istype(M, itemtype5) || istype(M, itemtype6) || istype(M, itemtype7) || istype(M, itemtype8) || istype(M, itemtype9) || istype(M, itemtype10) || istype(M, itemtype11))
		visible_message("<span class='notice'>[user]开始[actiontext][M.name]...</span>")
		playsound(src,noise,40,1)
		if (do_after(user, delay, src))
			M.maxhealth -= damageamount
			M.health = min(M.health + repairamount, M.maxhealth)
			visible_message("<span class='notice'>[user]完成了对[M.name]的[actiontext].</span>")
			if(M.maxhealth <= 0 || M.health <= 0)
				qdel(M)
				playsound(src, "shatter", 70, TRUE)
				visible_message("<span class='alert'>[M.name]因过度受力而损坏!</span>")
		else
			visible_message("<span class='notice'>[user]停止[actiontext][M.name].</span>")
	else if (istype(M, /obj/item/weapon/hammer) || istype(M, /obj/item/weapon/wrench))
		..()
		return
	else
		to_chat(user, "<span class='notice'>你无法用[src.name]来修理这个!</span>")
		return

/obj/item/weapon/flint/sharpened
	name = "磨尖的燧石"
	desc = "一小块磨尖的燧石岩石."
	icon_state = "sharpened_flint"
	edge = TRUE
	sharp = TRUE
	attack_verb = list("cut","stabbed")
	sharpened = TRUE
	force = 12

/obj/item/weapon/flint/proc/sharpen()
	if (!sharpened)
		name = "sharpened flint"
		desc = "A small piece of sharpened flint rock."
		icon_state = "sharpened_flint"
		edge = TRUE
		sharp = TRUE
		attack_verb = list("cut","stabbed")
		sharpened = TRUE
		force = 12
	return