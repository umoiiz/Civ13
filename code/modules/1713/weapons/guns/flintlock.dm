//All the flintlock weapons

/obj/item/weapon/gun/projectile/flintlock
	name = "燧发滑膛枪"
	desc = "一把十八世纪初的简单燧发滑膛枪."
	icon = 'icons/obj/guns/ancient.dmi'
	icon_state = "musket"
	item_state = "musket"
	w_class = ITEM_SIZE_LARGE
	throw_range = 4
	throw_speed = 2
	force = 10
	throwforce = 10
	max_shells = 1 //duh
	slot_flags = SLOT_SHOULDER
	caliber = "musketball"
	shake_strength = 3 //extra kickback
	handle_casings = REMOVE_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/musketball
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/musket.ogg'
	//+2 accuracy over the LWAP because only one shot
//	scoped_accuracy = 2
	gun_type = GUN_TYPE_RIFLE
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	KD_chance = KD_CHANCE_HIGH
	stat = "rifle"
	gtype = "rifle"
	move_delay = 5
	fire_delay = 5
	equiptimer = 20
	maxhealth = 20
	accuracy = 5

	load_delay = 110 //11 seconds for rifles, 8 seconds for pistols & blunderbuss

	var/cocked = FALSE
	var/check_cocked = FALSE //Keeps the bolt from being interfered with
	var/jammed_until = -1
	var/jamcheck = 0
	var/last_fire = -1

/obj/item/weapon/gun/projectile/flintlock/attack_self(mob/user)
//	var/mob/living/human/H = user
	if (!check_cocked)//Keeps people from spamming the bolt
		check_cocked++
		if (!do_after(user, 2, src, FALSE, TRUE, INCAPACITATION_DEFAULT, TRUE))//Delays the bolt
			check_cocked--
			return
	else return
	if (!cocked)
		playsound(loc, 'sound/weapons/guns/interact/bolt_open.ogg', 50, TRUE)
		to_chat(user, SPAN_WARNING("You cock \the [src]!"))
		cocked = TRUE
	else
		playsound(loc, 'sound/weapons/guns/interact/bolt_close.ogg', 50, TRUE)
		to_chat(user, SPAN_NOTICE("You uncock \the [src]."))
		cocked = FALSE
	add_fingerprint(user)
	update_icon()
	check_cocked--

/obj/item/weapon/gun/projectile/flintlock/special_check(mob/user)
//	var/mob/living/human/H = user
	if (!cocked)
		to_chat(user, "<span class='warning'>武器未处于待击状态时你无法发射\the [src]!</span>")
		return FALSE
	if (!(user.has_empty_hand(both = FALSE)) && !istype(src, /obj/item/weapon/gun/projectile/flintlock/pistol) && !istype(src, /obj/item/weapon/gun/projectile/flintlock/blunderbuss/pistol) && !istype(src, /obj/item/weapon/gun/projectile/flintlock/pistoletmodelean1733) && !istype(src, /obj/item/weapon/gun/projectile/flintlock/duellingpistol) && !istype(src, /obj/item/weapon/gun/projectile/flintlock/pistoletmodeleanxiii))
		to_chat(user, "<span class='warning'>你需要双手才能发射\the [src]!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/flintlock/load_ammo(var/obj/item/A, mob/user)
//	var/mob/living/human/H = user
	if (cocked)
		return
	..()

/obj/item/weapon/gun/projectile/flintlock/unload_ammo(mob/user, var/allow_dump=1)
	return

/obj/item/weapon/gun/projectile/flintlock/handle_post_fire()
	..()
	if (max_shells == 1)
		loaded = list()
		chambered = null
	cocked = FALSE
	spawn (1)
		new/obj/effect/effect/smoke/chem(get_step(src, dir))
	spawn (5)
		new/obj/effect/effect/smoke/chem(get_step(src, dir))
	spawn (12)
		new/obj/effect/effect/smoke/chem(get_step(src, dir))

/obj/item/weapon/gun/projectile/flintlock/update_icon()
	..()
	item_state = initial(item_state)

/obj/item/weapon/gun/projectile/flintlock/musket
	name = "燧发滑膛枪"
	desc = "一把十八世纪初的简单燧发滑膛枪."
	force = 12
	caliber = "musketball"
	weight = 6.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/m1752
	name = "M1752 滑膛枪"
	desc = "一把十八世纪初的简单西班牙滑膛枪."
	force = 11.5
	caliber = "musketball"
	weight = 6.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "musket"
	icon_state = "mosquete1752"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/jezail
	name = "杰撒伊滑膛枪"
	desc = "一把十八世纪初的非常简单的阿拉伯滑膛枪."
	force = 10
	caliber = "musketball"
	weight = 5.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "musket"
	icon_state = "jezail"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/kabyle
	name = "卡拜尔滑膛枪"
	desc = "一把十八世纪初的非常简单的北非滑膛枪."
	force = 10.2
	caliber = "musketball"
	weight = 4.7
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "musket"
	icon_state = "moukalla"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/brownbess
	name = "褐贝斯滑膛枪"
	desc = "一把十八世纪初的简单英国滑膛枪."
	force = 11
	caliber = "musketball"
	weight = 5.9
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "musket"
	icon_state = "brownbess"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/charleville
	name = "沙勒维尔滑膛枪"
	desc = "一把十八世纪初的简单法国滑膛枪."
	force = 11.3
	caliber = "musketball"
	weight = 5.6
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "musket"
	icon_state = "charleville_mousquet"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/plexico
	name = "燧发滑膛枪"
	desc = "一把更精致的燧发滑膛枪, 这把似乎由乌木和钢材制成."
	force = 12
	caliber = "musketball"
	weight = 6.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 110
	item_state = "plexciomusket"
	icon_state = "plexciomusket"
	accuracy = 1

/obj/item/weapon/gun/projectile/flintlock/springfield
	name = "斯普林菲尔德 M1861 滑膛枪"
	desc = "一把十九世纪六十年代的简单燧发滑膛枪, 常用于南北战争."
	force = 12
	caliber = "musketball"
	weight = 6.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "springfield"
	icon_state = "springfield"
	load_delay = 70
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/springfield1795
	name = "斯普林菲尔德 1795 滑膛枪"
	desc = "1795型是美国生产的第一款滑膛枪."
	force = 12
	caliber = "musketball"
	weight = 5.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 100
	item_state = "springfield"
	icon_state = "springfield1795"
	load_delay = 80
	accuracy = 1

/obj/item/weapon/gun/projectile/flintlock/musketoon
	name = "燧发短滑膛枪"
	desc = "燧发滑膛枪的缩小版本, 因其紧凑而深受水手喜爱, 尽管精度较低."
	icon_state = "compactmusket"
	item_state = "musketoon"
	force = 8
	caliber = "musketball"
	weight = 4.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 80
	equiptimer = 12
	accuracy = 5

/obj/item/weapon/gun/projectile/flintlock/crude
	name = "粗糙滑膛枪"
	desc = "一把粗糙的自制滑膛枪. 不太可靠, 精度也不高."
	icon_state = "crude"
	item_state = "musketoon"
	force = 8
	caliber = "musketball"
	weight = 4.0
	ammo_type = /obj/item/ammo_casing/musketball
	value = 45
	accuracy = 5

/obj/item/weapon/gun/projectile/flintlock/pistol
	// less accurate than rifles against still targets, but better against moving targets
	// less accurate than semiautos but with the same ratios
	name = "燧发手枪"
	desc = "一把典型的燧发手枪. 适合近距离, 除此之外毫无用处."
	icon_state = "flintpistol"
	item_state = "pistol"
	shake_strength = 2
	force = 6
	w_class = ITEM_SIZE_SMALL
	fire_sound = 'sound/weapons/guns/fire/hpistol.ogg'
	caliber = "musketball_pistol"
	weight = 2.5
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/musketball_pistol
	move_delay = 3
	fire_delay = 3
	load_delay = 80
	value = 70
	stat = "pistol"
	gtype = "pistol"
	equiptimer = 7
	gun_type = GUN_TYPE_PISTOL
	KD_chance = KD_CHANCE_LOW
	stat = "pistol"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/blunderbuss
	stat = "heavy"
	name = "雷铳"
	desc = "短滑膛枪的放大版本, 可以发射更大的子弹. 远距离毫无用处."
	icon_state = "blunderbuss"
	item_state = "blunderbuss"
	shake_strength = 4
	force = 14
	load_delay = 100
	caliber = "blunderbuss"
	stat = "rifle"
	weight = 4.5
	value = 80
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/blunderbuss
	gun_type = GUN_TYPE_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	equiptimer = 15
	// 15% more accurate than SMGs
	accuracy = 5

	KD_chance = KD_CHANCE_HIGH

/obj/item/weapon/gun/projectile/flintlock/pistoletmodelean1733
	name = "1733年式手枪"
	desc = "一把典型的法国手枪. 由骑兵部队使用."
	icon_state = "pistolet_modele1733"
	item_state = "pistol"
	shake_strength = 2.1
	force = 6.1
	w_class = ITEM_SIZE_SMALL
	fire_sound = 'sound/weapons/guns/fire/hpistol.ogg'
	caliber = "musketball_pistol"
	weight = 2.5
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/musketball_pistol
	move_delay = 3
	fire_delay = 3
	load_delay = 80
	value = 70
	stat = "pistol"
	gtype = "pistol"
	gun_type = GUN_TYPE_PISTOL
	equiptimer = 7
	KD_chance = KD_CHANCE_LOW
	stat = "pistol"
	accuracy = 10
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/duellingpistol
	name = "决斗燧发枪"
	desc = "一把典型的燧发枪. 由参加决斗的绅士使用."
	icon_state = "flintlock_duelingpistol"
	item_state = "pistol"
	shake_strength = 2.5
	force = 8
	w_class = ITEM_SIZE_SMALL
	fire_sound = 'sound/weapons/guns/fire/hpistol.ogg'
	caliber = "musketball_pistol"
	weight = 2.9
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/musketball_pistol
	move_delay = 3.4
	fire_delay = 3.1
	load_delay = 75
	value = 70
	stat = "pistol"
	gtype = "pistol"
	gun_type = GUN_TYPE_PISTOL
	equiptimer = 7
	accuracy = 3

/obj/item/weapon/gun/projectile/flintlock/pistoletmodeleanxiii
	name = "XIII年式手枪"
	desc = "一把典型的法国手枪. 由骑兵部队使用."
	icon_state = "pistolet_modele13"
	item_state = "pistol"
	shake_strength = 2.1
	force = 6.1
	w_class = ITEM_SIZE_SMALL
	fire_sound = 'sound/weapons/guns/fire/hpistol.ogg'
	caliber = "musketball_pistol"
	weight = 2.5
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/musketball_pistol
	move_delay = 3
	fire_delay = 3
	load_delay = 80
	value = 70
	stat = "pistol"
	gtype = "pistol"
	gun_type = GUN_TYPE_PISTOL
	equiptimer = 7
	KD_chance = KD_CHANCE_LOW
	stat = "pistol"
	accuracy = 4

/obj/item/weapon/gun/projectile/flintlock/blunderbuss/pistol
	stat = "heavy"
	name = "雷铳手枪"
	desc = "短滑膛枪的放大版本, 可以发射更大的子弹. 这把被设计成可以单手使用. 中距离毫无用处."
	icon_state = "flintlock_blunderbusspistol"
	item_state = "pistol"
	shake_strength = 5
	force = 14
	load_delay = 110
	caliber = "blunderbuss"
	stat = "pistol"
	gtype = "pistol"
	gun_type = GUN_TYPE_PISTOL
	weight = 2.5
	w_class = ITEM_SIZE_SMALL
	value = 80
	attachment_slots = ATTACH_IRONSIGHTS
	ammo_type = /obj/item/ammo_casing/blunderbuss
	accuracy = 6