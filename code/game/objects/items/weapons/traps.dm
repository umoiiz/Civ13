/obj/item/weapon/beartrap
	name = "机械陷阱"
	throw_speed = 2
	throw_range = TRUE
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "beartrap0"
	desc = "一种机械触发的捕兽夹.技术含量低,但可靠.看起来踩上去会非常疼."
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	var/deployed = FALSE

/obj/item/weapon/beartrap/armed
	deployed = TRUE
	anchored = TRUE
	icon_state = "beartrap1"
	layer = 2

/obj/item/weapon/beartrap/proc/can_use(mob/user)
	return (user.IsAdvancedToolUser() && !user.stat && !user.restrained())

/obj/item/weapon/beartrap/attack_self(mob/user as mob)
	..()
	if (!deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user]开始部署\the [src].</span>",
			"<span class='danger'>你开始部署\the [src]!</span>",
			"你听到弹簧缓慢的吱嘎声."
			)

		if (do_after(user, 60, src))
			user.visible_message(
				"<span class='danger'>\The [user]已部署\the [src].</span>",
				"<span class='danger'>你已部署\the [src]!</span>",
				"你听到一声响亮的锁扣咔嗒声."
				)

			deployed = TRUE
			user.drop_from_inventory(src)
			update_icon()
			anchored = TRUE

/obj/item/weapon/beartrap/attack_hand(mob/user as mob)
	if (buckled_mob && can_use(user))
		user.visible_message(
			"<span class='notice'>[user]开始将[buckled_mob]从\the [src]中解救出来.</span>",
			"<span class='notice'>你小心地开始将[buckled_mob]从\the [src]中解救出来.</span>",
			)
		if (do_after(user, 60, src))
			user.visible_message("<span class='notice'>[buckled_mob]已被[user]从\the [src]中解救出来.</span>")
			unbuckle_mob()
			anchored = FALSE
	else if (deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user]开始拆除\the [src].</span>",
			"<span class='notice'>你开始解除\the [src]的保险!</span>",
			"你听到一声闩锁咔哒声,随后是弹簧缓慢的吱嘎声."
			)
		if (do_after(user, 60, src))
			user.visible_message(
				"<span class='danger'>[user]解除了\the [src]的保险.</span>",
				"<span class='notice'>你解除了\the [src]的保险!</span>"
				)
			deployed = FALSE
			anchored = FALSE
			update_icon()
	else
		..()

/obj/item/weapon/beartrap/proc/attack_mob(mob/living/L)

	var/target_zone
	if (L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_foot", "r_foot", "l_leg", "r_leg")

	//armor
	var/blocked = L.run_armor_check(target_zone, "melee")

	if (blocked >= 2)
		return

	if (!L.apply_damage(30, BRUTE, target_zone, blocked, used_weapon=src))
		return FALSE

	//trap the victim in place
	if (!blocked)
		set_dir(L.dir)
		can_buckle = TRUE
		buckle_mob(L)
		to_chat(L, "<span class='danger'>\the [src]的钢制夹爪咬住了你,将你困在原地!</span>")
		deployed = FALSE
		can_buckle = initial(can_buckle)

/obj/item/weapon/beartrap/Crossed(AM as mob|obj)
	if (deployed && isliving(AM))
		var/mob/living/L = AM
		L.visible_message(
			"<span class='danger'>[L]踩到了\the [src].</span>",
			"<span class='danger'>你踩到了\the [src]!</span>",
			"<b>你听到一声响亮的金属咔嗒声!</b>"
			)
		attack_mob(L)
		if (!buckled_mob)
			anchored = FALSE
		deployed = FALSE
		update_icon()
	..()

/obj/item/weapon/beartrap/update_icon()
	..()

	if (!deployed)
		icon_state = "beartrap0"
	else
		icon_state = "beartrap1"


/obj/item/weapon/punji_sticks
	name = "尖竹桩陷阱"
	throw_speed = 2
	throw_range = TRUE
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "punji0"
	desc = "一个简单的坑洞,里面插着尖锐的竹桩,上面覆盖着树叶.致命."
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	flammable = TRUE
	var/deployed = FALSE
	flags = FALSE

/obj/item/weapon/punji_sticks/proc/can_use(mob/user)
	return (user.IsAdvancedToolUser() && !user.stat && !user.restrained())

/obj/item/weapon/punji_sticks/attack_self(mob/user as mob)
	..()
	if (!deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user]开始部署\the [src].</span>",
			"<span class='danger'>你开始部署\the [src]!</span>",
			)

		if (do_after(user, 120, src))
			user.visible_message(
				"<span class='danger'>\The [user]已部署\the [src].</span>",
				"<span class='danger'>你已部署\the [src]!</span>",
				)

			deployed = TRUE
			user.drop_from_inventory(src)
			update_icon()
			anchored = TRUE

/obj/item/weapon/punji_sticks/attack_hand(mob/user as mob)
	if (buckled_mob && can_use(user))
		user.visible_message(
			"<span class='notice'>[user]开始将[buckled_mob]从\the [src]中解救出来.</span>",
			"<span class='notice'>你小心地开始将[buckled_mob]从\the [src]中解救出来.</span>",
			)
		if (do_after(user, 120, src))
			user.visible_message("<span class='notice'>[buckled_mob]已被[user]从\the [src]中解救出来.</span>")
			unbuckle_mob()
			anchored = FALSE
	else if (deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user]开始解除\the [src]的保险.</span>",
			"<span class='notice'>你开始解除\the [src]的保险!</span>",
			)
		if (do_after(user, 90, src))
			user.visible_message(
				"<span class='danger'>[user]解除了\the [src]的保险.</span>",
				"<span class='notice'>你解除了\the [src]的保险!</span>"
				)
			deployed = FALSE
			anchored = FALSE
			update_icon()
	else
		update_icon()
		..()

/obj/item/weapon/punji_sticks/proc/attack_mob(mob/living/L)
	var/target_zone
	if (L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_foot", "r_foot", "l_leg", "r_leg")

	if (!L.apply_damage(90, BRUTE, target_zone, 0, used_weapon=src))
		return FALSE

	//trap the victim in place
	set_dir(L.dir)
	can_buckle = TRUE
	buckle_mob(L)
	to_chat(L, "<span class='danger'>你掉进了尖竹桩陷阱,被卡住了!</span>")
	deployed = FALSE
	can_buckle = initial(can_buckle)

/obj/item/weapon/punji_sticks/Crossed(AM as mob|obj)
	if (deployed && isliving(AM))
		var/mob/living/L = AM
		L.visible_message(
			"<span class='danger'>[L]掉进了\the [src].</span>",
			"<span class='danger'>你掉进了\the [src]!</span>",
			)
		if (istype(L, /mob/living/simple_animal))
			var/mob/living/simple_animal/SA = L
			SA.stop_automated_movement = TRUE
			SA.adjustBruteLoss(rand(20,35))
			return
		else
			attack_mob(L)
			if (!buckled_mob)
				anchored = FALSE
			deployed = FALSE
			update_icon()
	..()

/obj/item/weapon/punji_sticks/update_icon()
	..()

	if (!deployed)
		icon_state = "punji2_sand"
	else
		icon_state = "punji1_sand"