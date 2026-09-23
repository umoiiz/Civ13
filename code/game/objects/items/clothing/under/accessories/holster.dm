/obj/item/clothing/accessory/holster
	name = "肩部枪套"
	desc = "一个手枪枪套."
	icon_state = "holster"
	slot = "utility"
	var/obj/item/holstered = null
	var/obj/item/holstered2 = null //for double holsters
	var/capacity = 1
	ripable = FALSE
	map_storage_saved_vars = "density;icon_state;dir;name;pixel_x;pixel_y;holstered;holstered2"
/obj/item/clothing/accessory/holster/proc/holster(var/obj/item/I, var/mob/living/user)
	if (holstered && istype(user) && capacity == 1)
		to_chat(user, "<span class='warning'>这里已经插着\a 把[holstered]了!</span>")
		return

	if (holstered && holstered2 && istype(user) && capacity == 2)
		to_chat(user, "<span class='warning'>这里已经插着\a 把[holstered]和\a 把[holstered2]了!</span>")
		return

	if (!(I.slot_flags & SLOT_HOLSTER))
		to_chat(user, "<span class='warning'>[I]放不进[src]!</span>")
		return
	/*if (istype(I, /obj/item/weapon/gun))
		var/obj/item/weapon/gun/G = I
		if (G.silencer)
			to_chat(user, "<span class='warning'>[I] won't fit in [src]!</span>")
			return*/ //Comments it out until special holsters for silenced pistols can be made
	if (istype(user))
		user.stop_aiming(no_message=1)
	if (capacity == 1)
		holstered = I
		user.drop_from_inventory(holstered)
		holstered.loc = src
		holstered.add_fingerprint(user)
		w_class = max(w_class, holstered.w_class)
		user.visible_message("<span class='notice'>[user]将\the [holstered]插入枪套.</span>", "<span class='notice'>你将\the [holstered]插入枪套.</span>")
		name = "occupied [initial(name)]"
	else if (capacity == 2)
		if (holstered && !holstered2)
			holstered2 = I
			user.drop_from_inventory(holstered2)
			holstered2.loc = src
			holstered2.add_fingerprint(user)
			w_class = max(w_class, holstered2.w_class)
			user.visible_message("<span class='notice'>[user]将\the [holstered2]插入枪套.</span>", "<span class='notice'>你将\the [holstered2]插入枪套.</span>")
			name = "occupied [initial(name)]"
		else if (!holstered)
			holstered = I
			user.drop_from_inventory(holstered)
			holstered.loc = src
			holstered.add_fingerprint(user)
			w_class = max(w_class, holstered.w_class)
			user.visible_message("<span class='notice'>[user]将\the [holstered]插入枪套.</span>", "<span class='notice'>你将\the [holstered]插入枪套.</span>")
			name = "occupied [initial(name)]"
		else //this really shouldnt happen
			return

/obj/item/clothing/accessory/holster/proc/clear_holster()
	if (capacity == 1)
		holstered = null
		name = initial(name)

/obj/item/clothing/accessory/holster/proc/unholster(mob/user as mob)
	if (capacity == 1)
		if (!holstered)
			return

	else if (capacity == 2)
		if (!holstered && !holstered2)
			return

	if (holstered && capacity == 1)
		if (istype(user.get_active_hand(),/obj) && istype(user.get_inactive_hand(),/obj))
			to_chat(user, "<span class='warning'>你需要空出一只手才能拔出\the [holstered]!</span>")
		else
			if (user.a_intent == I_HARM)
				usr.visible_message(
					"<span class='danger'>[user]拔出\the [holstered],准备射击!</span>",
					"<span class='warning'>你拔出\the [holstered],准备射击!</span>"
					)
			else
				user.visible_message(
					"<span class='notice'>[user]拔出\the [holstered],枪口指向地面.</span>",
					"<span class='notice'>你拔出\the [holstered],枪口指向地面.</span>"
					)
			user.put_in_hands(holstered)
			holstered.add_fingerprint(user)
			w_class = initial(w_class)
			clear_holster()
			return
	else if (holstered2 && capacity == 2)
		if (istype(user.get_active_hand(),/obj) && istype(user.get_inactive_hand(),/obj))
			to_chat(user, "<span class='warning'>你需要空出一只手才能拔出\the [holstered2]!</span>")
		else
			if (user.a_intent == I_HARM)
				usr.visible_message(
					"<span class='danger'>[user]拔出\the [holstered2],准备射击!</span>",
					"<span class='warning'>你拔出\the [holstered2],准备射击!</span>"
					)
			else
				user.visible_message(
					"<span class='notice'>[user]拔出\the [holstered2],枪口指向地面.</span>",
					"<span class='notice'>你拔出\the [holstered2],枪口指向地面.</span>"
					)
			user.put_in_hands(holstered2)
			holstered.add_fingerprint(user)
			w_class = initial(w_class)
			holstered2 = null

	else if (holstered && capacity == 2)
		if (istype(user.get_active_hand(),/obj) && istype(user.get_inactive_hand(),/obj))
			to_chat(user, "<span class='warning'>你需要空出一只手才能拔出\the [holstered]!</span>")
		else
			if (user.a_intent == I_HARM)
				usr.visible_message(
					"<span class='danger'>[user]拔出\the [holstered],准备射击!</span>",
					"<span class='warning'>你拔出\the [holstered],准备射击!</span>"
					)
			else
				user.visible_message(
					"<span class='notice'>[user]拔出\the [holstered],指向地面.</span>",
					"<span class='notice'>你拔出\the [holstered],指向地面.</span>"
					)
			user.put_in_hands(holstered)
			holstered.add_fingerprint(user)
			w_class = initial(w_class)
			holstered = null
			name = initial(name)

/obj/item/clothing/accessory/holster/attack_hand(mob/user as mob)
	if (has_suit)	//if we are part of a suit
		if (holstered || holstered2)
			unholster(user)
		return

	..(user)

/obj/item/clothing/accessory/holster/attackby(obj/item/W as obj, mob/user as mob)
	holster(W, user)

/obj/item/clothing/accessory/holster/emp_act(severity)
	if (holstered)
		holstered.emp_act(severity)
	if (holstered2)
		holstered2.emp_act(severity)
	..()

/obj/item/clothing/accessory/holster/examine(mob/user)
	..(user)
	if (capacity == 1)
		if (holstered)
			to_chat(user, "一个[holstered]套在这里.")
		else
			to_chat(user, "它是空的.")
	else if (capacity == 2)
		if (holstered && !holstered2)
			to_chat(user, "一个[holstered]套在这里.")
		else if (holstered && holstered2)
			to_chat(user, "一个[holstered]和一个[holstered2]套在这里.")
		else if (!holstered && holstered2)
			to_chat(user, "一个[holstered2]套在这里.")
		else
			to_chat(user, "它是空的.")
/obj/item/clothing/accessory/holster/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	has_suit.verbs += /obj/item/clothing/accessory/holster/verb/holster_verb

/obj/item/clothing/accessory/holster/on_removed(mob/user as mob)
	has_suit.verbs -= /obj/item/clothing/accessory/holster/verb/holster_verb
	..()

//For the holster hotkey
/obj/item/clothing/accessory/holster/verb/holster_verb()
	set name = "Holster"
	set category = null
	set src in usr
	if (!istype(usr, /mob/living)) return
	if (usr.stat) return

	//can't we just use src here?
	var/obj/item/clothing/accessory/holster/H = null
	if (istype(src, /obj/item/clothing/accessory/holster))
		H = src
	else if (istype(src, /obj/item/clothing/under))
		var/obj/item/clothing/under/S = src
		if (S.accessories.len)
			H = locate() in S.accessories

	if (!H)
		to_chat(usr, "<span class='warning'>有些非常不对劲.</span>")

	if (!H.holstered)
		var/obj/item/W = usr.get_active_hand()
		if (!istype(W, /obj/item))
			to_chat(usr, "<span class='warning'>你需要装备你的枪才能将其收起.</span>")
			return
		H.holster(W, usr)
	else
		H.unholster(usr)

/obj/item/clothing/accessory/holster/armpit
	name = "腋下枪套"
	desc = "一个破旧的手枪枪套.非常适合隐蔽携带"
	icon_state = "holster"

/obj/item/clothing/accessory/holster/waist
	name = "腰部枪套"
	desc = "一个手枪枪套.由昂贵的皮革制成."
	icon_state = "holster"
	overlay_state = "holster_low"

/obj/item/clothing/accessory/holster/chest
	name = "胸前枪套"
	desc = "一个挂在胸前的手枪枪套."
	icon_state = "waist_holster"
	overlay_state = "waist_holster"

/obj/item/clothing/accessory/holster/hip
	name = "臀部枪套"
	desc = "一个低挂在臀部的手枪枪套."
	icon_state = "holster_hip"

/obj/item/clothing/accessory/holster/hip/double
	name = "双联臀部枪套"
	desc = "一个低挂在臀部的双联手枪枪套."
	icon_state = "holster_hip2"
	capacity = 2

/obj/item/clothing/accessory/holster/tactical
	name = "臀部枪套"
	desc = "一个低挂在臀部的手枪枪套."
	icon_state = "tacholster"

/obj/item/clothing/accessory/holster/replicantkama
	name = "复制人卡玛"
	desc = "一条低挂在臀部、内置枪套的卡玛裙."
	icon_state = "replicant_kama"
