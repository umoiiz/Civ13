/obj/item/weapon/gun/projectile/shotgun
	maxhealth = 45
	gun_type = GUN_TYPE_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	icon = 'icons/obj/guns/rifles.dmi'
	// 15% more accurate than SMGs
	equiptimer = 17
	magazine_type = /obj/item/ammo_magazine/shellbox

	KD_chance = KD_CHANCE_HIGH
	stat = "rifle"

	gtype = "shotgun"

/obj/item/weapon/gun/projectile/shotgun/pump
	name = "泵动式霰弹枪"
	desc = "一款占位用霰弹枪,发射12号口径弹药."
	icon_state = "shotgun"
	item_state = "shotgun"
	max_shells = 6
	w_class = ITEM_SIZE_LARGE
	force = 10
	flags =  CONDUCT
	slot_flags = SLOT_SHOULDER
	caliber = "12gauge"
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	handle_casings = HOLD_CASINGS
	stat = "rifle"
	var/recentpump = FALSE // to prevent spammage
	load_delay = 1

/obj/item/weapon/gun/projectile/shotgun/pump/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/shotgun/pump/attack_self(mob/living/user as mob)
	if (world.time >= recentpump + 10)
		pump(user)
		recentpump = world.time

/obj/item/weapon/gun/projectile/shotgun/pump/update_icon()
	..()
	item_state = initial(item_state)

/obj/item/weapon/gun/projectile/shotgun/pump/proc/pump(mob/M as mob)
	playsound(M, 'sound/weapons/guns/interact/shotgun_pump.ogg', 60, TRUE)

	if (chambered)//We have a shell in the chamber
		chambered.loc = get_turf(src)//Eject casing
		chambered.randomrotation()
		chambered = null

	if (loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()

/obj/item/weapon/gun/projectile/shotgun/coachgun
	name = "马车枪"
	desc = "一款双管霰弹枪,常被信使和驿站马车使用."
	icon_state = "doublebarreled"
	item_state = "shotgun"
	max_shells = 2
	w_class = ITEM_SIZE_LARGE
	force = 10
	flags =  CONDUCT
	slot_flags = SLOT_SHOULDER
	caliber = "12gauge"
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	handle_casings = HOLD_CASINGS
	stat = "rifle"
	var/open = FALSE
	var/recentpump = FALSE // to prevent spammage
	load_delay = 1
	blackpowder = TRUE

/obj/item/weapon/gun/projectile/shotgun/coachgun/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/shotgun/coachgun/update_icon()
	..()
	if (open)
		icon_state = "doublebarreled_open"
	else
		icon_state = "doublebarreled"

/obj/item/weapon/gun/projectile/shotgun/coachgun/attack_self(mob/living/user as mob)
	if (world.time >= recentpump + 10)
		if (open)
			open = FALSE
			to_chat(user, "<span class='notice'>你合上了\the [src].</span>")
			icon_state = "doublebarreled"
			if (loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC
		else
			open = TRUE
			to_chat(user, "<span class='notice'>你折开了\the [src].</span>")
			icon_state = "doublebarreled_open"
		recentpump = world.time

/obj/item/weapon/gun/projectile/shotgun/coachgun/load_ammo(var/obj/item/A, mob/user)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先折开\the [src]!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/shotgun/coachgun/unload_ammo(mob/user, var/allow_dump=1)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先折开\the [src]!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/shotgun/coachgun/special_check(mob/user)
	if (open)
		to_chat(user, "<span class='warning'>当\the [src]处于折开状态时你无法开火!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/shotgun/coachgun/handle_post_fire()
	..()
	if (loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))
		spawn (6)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))


/obj/item/weapon/gun/projectile/shotgun/pump/remington870
	name = "雷明顿870 Express"
	desc = "一款泵动式霰弹枪,配备3英寸12号口径弹膛."
	icon_state = "remington870"
	item_state = "remington"
	max_shells = 7
	slot_flags = SLOT_SHOULDER
	caliber = "12gauge"
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	handle_casings = HOLD_CASINGS
	load_delay = 1

/obj/item/weapon/gun/projectile/shotgun/pump/remington870/brown
	icon_state = "remington870_brown"
	item_state = "remington_brown"

/obj/item/weapon/gun/projectile/shotgun/pump/ks23
	name = "KS-23"
	desc = "一款苏联泵动式霰弹枪,口径为23mm."
	icon_state = "ks23"
	item_state = "ks23"
	max_shells = 4
	slot_flags = SLOT_SHOULDER
	caliber = "12gauge" // To be converted to 23mm when proper shotgun ammo is added
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	handle_casings = HOLD_CASINGS
	load_delay = 1

/obj/item/weapon/gun/projectile/shotgun/mts225
	name = "MTS-225"
	desc = "一款俄罗斯6管转轮霰弹枪,被俄罗斯猎人使用."
	icon_state = "mts225"
	item_state = "shotgun"
	base_icon = "shotgun"
	max_shells = 5
	w_class = ITEM_SIZE_LARGE
	force = 10
	flags =  CONDUCT
	slot_flags = SLOT_SHOULDER
	caliber = "12gauge"
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	handle_casings = HOLD_CASINGS
	stat = "rifle"
	var/open = FALSE
	var/recentpump = FALSE // to prevent spammage
	load_delay = 3

/obj/item/weapon/gun/projectile/shotgun/mts225/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null
/obj/item/weapon/gun/projectile/shotgun/mts225/update_icon()
	..()
	if (open)
		icon_state = "mts225_open"
	else
		icon_state = "mts225"

/obj/item/weapon/gun/projectile/shotgun/mts225/attack_self(mob/living/user as mob)
	if (world.time >= recentpump + 10)
		if (open)
			open = FALSE
			to_chat(user, "<span class='notice'>你将转轮装回了\the [src].</span>")
			icon_state = "mts225"
			if (loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC
		else
			open = TRUE
			to_chat(user, "<span class='notice'>你释放了\the [src]的转轮.</span>")
			icon_state = "mts225_open"
		recentpump = world.time

/obj/item/weapon/gun/projectile/shotgun/mts225/load_ammo(var/obj/item/A, mob/user)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先释放\the [src]的转轮!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/shotgun/coachgun/unload_ammo(mob/user, var/allow_dump=1)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先释放\the [src]的转轮!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/shotgun/mts225/special_check(mob/user)
	if (open)
		to_chat(user, "<span class='warning'>当转轮不在枪内时你无法开火\the [src]!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/shotgun/mts225/handle_post_fire()
	..()
	if (loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC
