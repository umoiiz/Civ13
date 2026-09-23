//all bolt-action weapons

/obj/item/weapon/gun/projectile/boltaction
	name = "栓动步枪"
	icon = 'icons/obj/guns/rifles.dmi'
	desc = "一把真正的二战栓动步枪 (你不应该看到这个)"
	icon_state = "mosin"
	item_state = "mosin" //placeholder
	base_icon = "mosin"
	w_class = ITEM_SIZE_LARGE
	force = 10
	throwforce = 20
	max_shells = 5
	slot_flags = SLOT_SHOULDER
	caliber = "a762x54"
	shake_strength = 0 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a762x54
	magazine_type = /obj/item/ammo_magazine/mosin
	good_mags = list(/obj/item/ammo_magazine)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/battle_rifle.ogg'
	var/bolt_open_sound = 'sound/weapons/guns/interact/bolt_open.ogg'
	var/bolt_close_sound = 'sound/weapons/guns/interact/bolt_close.ogg'
	//+2 accuracy over the LWAP because only one shot
//	scoped_accuracy = 2
	gun_type = GUN_TYPE_RIFLE
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	KD_chance = KD_CHANCE_HIGH
	stat = "rifle"
	fire_delay = 2
	equiptimer = 15
	gun_safety = TRUE
	maxhealth = 20
	gtype = "rifle"
	load_delay = 4
	accuracy = 1

	barrel_x_offset = 16
	barrel_y_offset = 17

	var/bolt_open = FALSE
	var/check_bolt = FALSE //Keeps the bolt from being interfered with
	var/check_bolt_lock = FALSE //For locking the bolt. Didn't put this in with check_bolt to avoid issues
	var/bolt_safety = FALSE //If true, locks the bolt when gun is empty
	var/jammed_until = -1
	var/jamcheck = 0
	var/last_fire = -1

/obj/item/weapon/gun/projectile/boltaction/attack_self(mob/user)
	if (!check_bolt)//Keeps people from spamming the bolt
		check_bolt++
		if (!do_after(user, 2, src, FALSE, TRUE, INCAPACITATION_DEFAULT, TRUE))//Delays the bolt
			check_bolt--
			return
	else return
	if (check_bolt_lock)
		to_chat(user, "<span class='notice'>枪栓动不了,枪是空的!</span>")
		check_bolt--
		return
	bolt_open = !bolt_open
	if (bolt_open)
		if (chambered)
			playsound(loc, bolt_open_sound, 50, TRUE)
			to_chat(user, "<span class='notice'>你拉开枪栓,退出了[chambered]!</span>")
			chambered.loc = get_turf(src)
			chambered.randomrotation()
			loaded -= chambered
			chambered = null
			if (bolt_safety)
				if (!loaded.len)
					check_bolt_lock++
					to_chat(user, "<span class='notice'>枪栓被锁住了!</span>")
		else
			playsound(loc, bolt_open_sound, 50, TRUE)
			to_chat(user, "<span class='notice'>你拉开了枪栓.</span>")
	else
		playsound(loc, bolt_close_sound, 50, TRUE)
		to_chat(user, "<span class='notice'>你推上了枪栓.</span>")
		bolt_open = FALSE
	add_fingerprint(user)
	update_icon()
	check_bolt--

/obj/item/weapon/gun/projectile/boltaction/special_check(mob/user)
	if (gun_safety && safetyon)
		to_chat(user, "<span class='warning'>保险打开时你无法发射\the [src]!</span>")
		return FALSE
	if (bolt_open)
		to_chat(user, "<span class='warning'>枪栓打开时你无法发射[src]!</span>")
		return FALSE
	if (!user.has_empty_hand(both = FALSE) && !istype(src,/obj/item/weapon/gun/projectile/boltaction/mosin/obrez))
		to_chat(user, "<span class='warning'>你需要双手才能发射\the [src]!</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/boltaction/load_ammo(var/obj/item/A, mob/user)
	if (!bolt_open)
		return
	if (check_bolt_lock)
		--check_bolt_lock // preincrement is superior
	..()

/obj/item/weapon/gun/projectile/boltaction/unload_ammo(mob/user, var/allow_dump=1)
	if (!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/boltaction/handle_post_fire()
	..()
	var/reverse_health_percentage = (1-(health/maxhealth)+0.25)*100

	if (last_fire != -1)
		if (world.time - last_fire <= 7)
			jamcheck += 4
		else if (world.time - last_fire <= 10)
			jamcheck += 3
		else if (world.time - last_fire <= 20)
			jamcheck += 2
		else if (world.time - last_fire <= 30)
			++jamcheck
		else if (world.time - last_fire <= 40)
			++jamcheck
		else if (world.time - last_fire <= 50)
			++jamcheck
		else
			jamcheck = 0
	else
		++jamcheck

	if (prob(jamcheck*reverse_health_percentage))
		jammed_until = max(world.time + (jamcheck * 5), 50)
		jamcheck = 0
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))
	last_fire = world.time

/obj/item/weapon/gun/projectile/boltaction/update_icon()
	update_attachment_icon()
	if (!bolt_open)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_open"
	update_held_icon()
	return

/obj/item/weapon/gun/projectile/boltaction/singleshot
	name = "夏普斯步枪"
	desc = "单发落块式步枪,射程远.使用.45-70弹药."
	icon_state ="sharps"
	item_state ="shotgun"
	base_icon = "sharps"
	force = 12
	caliber = "a4570"
	weight = 4.5
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 16
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/a4570
	magazine_type = /obj/item/ammo_magazine/sharps
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 1
	gun_safety = FALSE
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	var/bolt_delay = 2
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/singleshot/martini_henry
	name = "马蒂尼-亨利步枪"
	desc = "单发落块式步枪,射程远.使用.577/450弹药."
	icon_state ="martini_henry"
	item_state ="shotgun"
	base_icon = "martini_henry"
	force = 13
	caliber = "a577"
	weight = 5
	bolt_safety = FALSE
	value = 90
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 17
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/a577
	magazine_type = /obj/item/ammo_magazine/c577
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 1
	load_delay = 7
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/singleshot/rollingblock
	name = "滚块式步枪"
	desc = "单发滚块式步枪,射程远.使用.45-70 Gov弹药."
	icon_state ="rollingblock"
	item_state ="rollingblock"
	base_icon = "rollingblock"
	force = 13
	caliber = "a4570"
	weight = 5
	bolt_safety = FALSE
	value = 90
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 17
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/a4570
	magazine_type = /obj/item/ammo_magazine/sharps
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 1
	load_delay = 7
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/singleshot/rollingblock/spanish
	name = "滚块式步枪"
	desc = "单发滚块式步枪,射程远.这支西班牙型号使用.43弹药."
	caliber = "a43"
	ammo_type = /obj/item/ammo_casing/a43
	magazine_type = /obj/item/ammo_magazine/c43
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/singleshot/makeshiftbolt
	name = "简易栓动步枪"
	desc = "单发简易栓动步枪."
	icon_state ="makeshiftbolt"
	item_state ="shotgun"
	base_icon = "makeshiftbolt"
	force = 13
	caliber = "a762x54"
	weight = 5
	bolt_safety = FALSE
	value = 90
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 17
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/a762x54
	magazine_type = /obj/item/ammo_magazine/mosin
	good_mags = list(/obj/item/ammo_magazine/mosin)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 1
	load_delay = 7
	accuracy = 3

/obj/item/weapon/gun/projectile/boltaction/singleshot/barrett
	name = "巴雷特 M99"
	desc = "由巴雷特枪械公司设计的单发反器材步枪."
	icon_state = "m99"
	item_state = "m99"
	base_icon = "m99"
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE
	w_class = ITEM_SIZE_HUGE
	force = 10
	throwforce = 5
	max_shells = 1
	KD_chance = KD_CHANCE_HIGH
	slot_flags = null
	caliber = "a50cal"
	weight = 14.8
	shake_strength = 3
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = list (/obj/item/ammo_casing/a50cal, /obj/item/ammo_casing/a50cal_ap, /obj/item/ammo_casing/a50cal_he)
	magazine_type = /obj/item/ammo_magazine/mosin
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/BarrettM99.ogg'
	bolt_open_sound = 'sound/weapons/guns/interact/barrett_bolt_open.ogg'
	bolt_close_sound = 'sound/weapons/guns/interact/barrett_bolt_close.ogg'
	fire_delay = 10
	equiptimer = 15
	gun_safety = TRUE
	load_delay = 20
	bolt_open = FALSE
	bolt_safety = FALSE
	bolt_delay = 3
	accuracy = 1
	scope_mounts = list("picatinny")

/obj/item/weapon/gun/projectile/boltaction/singleshot/barrett/sniper/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/singleshot/ptrd
	name = "PTRD-41"
	desc = "苏联反器材步枪,口径14.5x114mm,设计用于击毁坦克."
	icon_state = "ptrd"
	item_state = "ptrd"
	base_icon = "ptrd"
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE
	w_class = ITEM_SIZE_HUGE
	force = 10
	throwforce = 5
	max_shells = 1
	KD_chance = KD_CHANCE_HIGH
	slot_flags = null
	caliber = "a145"
	weight = 8
	shake_strength = 3
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = list (/obj/item/ammo_casing/a145, /obj/item/ammo_casing/a145_ap)
	magazine_type = /obj/item/ammo_magazine/mosin
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'

	fire_delay = 10
	equiptimer = 20
	gun_safety = FALSE
	load_delay = 20
	bolt_open = FALSE
	bolt_safety = FALSE
	bolt_delay = 6
	accuracy = 1
	scope_mounts = list("kochetov")

	scope_x_offset = -1

/obj/item/weapon/gun/projectile/boltaction/singleshot/ptrd/sniper/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pu(src)
	SP.attached(null,src,TRUE)

// /obj/item/weapon/gun/projectile/boltaction/singleshot/ptrd/ptrs - To be added soon, just needs an icon change

/obj/item/weapon/gun/projectile/boltaction/singleshot/pzb39
	name = "PzB 39"
	desc = "德国反坦克步枪,口径7.92x94mm."
	icon_state = "pzb39"
	item_state = "pzb39"
	base_icon = "pzb39"
	attachment_slots = ATTACH_IRONSIGHTS
	w_class = ITEM_SIZE_HUGE
	force = 10
	throwforce = 5
	max_shells = 1
	KD_chance = KD_CHANCE_HIGH
	slot_flags = null
	caliber = "a792x94"
	weight = 8
	shake_strength = 3
	handle_casings = EJECT_CASINGS
	load_method = SINGLE_CASING | MAGAZINE
	ammo_type = list (/obj/item/ammo_casing/a792x94, /obj/item/ammo_casing/a792x94_ap)
	magazine_type = /obj/item/ammo_magazine/pzb_case
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'

	fire_delay = 4
	equiptimer = 20
	gun_safety = FALSE
	load_delay = 20
	bolt_open = FALSE
	bolt_safety = FALSE
	bolt_delay = 6
	accuracy = 1

/obj/item/weapon/gun/projectile/boltaction/singleshot/special_check(mob/user)
	if (bolt_open)
		to_chat(user, "<span class='warning'>枪膛打开时你无法开火[src]!</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/boltaction/singleshot/attack_self(mob/user)
	if (!check_bolt)//Keeps people from spamming the bolt
		check_bolt++
		if (!do_after(user, bolt_delay, src, FALSE, TRUE, INCAPACITATION_DEFAULT, TRUE))//Delays the bolt
			check_bolt--
			return
	else return
	bolt_open = !bolt_open
	if (bolt_open)
		if (chambered)
			playsound(loc, bolt_open_sound, 50, TRUE)
			to_chat(user, "<span class='notice'>你打开枪膛拉杆,退出了[chambered]!</span>")
			chambered.loc = get_turf(src)
			chambered.randomrotation()
			loaded -= chambered
			chambered = null
		else
			playsound(loc, bolt_open_sound, 50, TRUE)
			to_chat(user, "<span class='notice'>你打开枪膛拉杆.</span>")
	else
		playsound(loc, bolt_close_sound, 50, TRUE)
		to_chat(user, "<span class='notice'>你关闭枪膛拉杆.</span>")
		bolt_open = FALSE
	add_fingerprint(user)
	update_icon()
	check_bolt--

/obj/item/weapon/gun/projectile/boltaction/mosin
	name = "莫辛 M1891"
	desc = "俄罗斯栓动步枪,口径7.62x54mmR弹药."
	icon_state ="mosin"
	item_state ="mosin"
	base_icon = "mosin"
	fire_sound = 'sound/weapons/guns/fire/Mosin.ogg'
	force = 12
	caliber = "a762x54"
	weight = 4.3
	bolt_safety = FALSE
	value = 100
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 20
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a762x54
	magazine_type = /obj/item/ammo_magazine/mosin
	good_mags = list(/obj/item/ammo_magazine/mosin)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 18
	accuracy = 2
	barrel_x_offset = 16
	barrel_y_offset = 17

/obj/item/weapon/gun/projectile/boltaction/mosin/m30
	name = "莫辛 91/30"
	desc = "原版M1891的现代化版本.栓动步枪,口径7.62x54mmR弹药."
	icon_state ="mosin30"
	item_state ="mosin30"
	base_icon = "mosin30"
	weight = 4
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/mosin/m30/sniper/New()
	name = "Sniper Mosin 91/30"
	scope_mounts = list("kochetov")
	accuracy = 1
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pu(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/arisaka30
	name = "有坂三十年式"
	desc = "日本栓动步枪,口径6.50x50mm有坂弹药."
	icon_state = "arisaka30"
	item_state = "arisaka30"
	base_icon = "arisaka30"
	caliber = "a65x50"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a65x50
	magazine_type = /obj/item/ammo_magazine/arisaka
	good_mags = list(/obj/item/ammo_magazine/arisaka)
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	bolt_open_sound = 'sound/weapons/guns/interact/arisaka_open.ogg'
	bolt_close_sound = 'sound/weapons/guns/interact/arisaka_close.ogg'
	equiptimer = 18
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_UNDER
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/arisaka38
	name = "有坂三八式"
	desc = "日本栓动步枪,口径6.50x50mm有坂弹药."
	icon_state = "arisaka38"
	item_state = "arisaka38"
	base_icon = "arisaka38"
	caliber = "a65x50"
	weight = 3.8
	magazine_type = /obj/item/ammo_magazine/arisaka
	good_mags = list(/obj/item/ammo_magazine/arisaka)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	bolt_open_sound = 'sound/weapons/guns/interact/arisaka_open.ogg'
	bolt_close_sound = 'sound/weapons/guns/interact/arisaka_close.ogg'
	equiptimer = 18
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL|ATTACH_UNDER
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/arisaka38/sniper
	name = "有坂九七式"
	desc = "日本栓动步枪,口径6.5x50mm有坂弹药."
	scope_mounts = list("type97_cronstein")
/obj/item/weapon/gun/projectile/boltaction/arisaka38/sniper/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/type97/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/type97(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/arisaka99
	name = "有坂九九式"
	desc = "日本栓动步枪,口径7.7x58mm有坂弹药."
	icon_state = "arisaka99"
	item_state = "arisaka99"
	base_icon = "arisaka99"
	caliber = "a77x58"
	ammo_type = /obj/item/ammo_casing/a77x58
	weight = 3.8
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/arisaka99
	good_mags = list(/obj/item/ammo_magazine/arisaka99)
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	bolt_open_sound = 'sound/weapons/guns/interact/arisaka_open.ogg'
	bolt_close_sound = 'sound/weapons/guns/interact/arisaka_close.ogg'
	equiptimer = 18
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL|ATTACH_UNDER
	accuracy = 2
	scope_mounts = list("type97_cronstein")

/obj/item/weapon/gun/projectile/boltaction/arisaka99/sniper
	name = "有坂九九式"
	desc = "日本栓动步枪,口径7.7x58mm有坂弹药."
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL|ATTACH_UNDER

/obj/item/weapon/gun/projectile/boltaction/arisaka99/sniper/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/type97/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/type97(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/arisaka99/bayonet

/obj/item/weapon/gun/projectile/boltaction/arisaka99/bayonet/New()
	..()
	var/obj/item/weapon/attachment/bayonet/SP = new/obj/item/weapon/attachment/bayonet(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/arisaka99_training
	name = "有坂九九式训练步枪"
	desc = "日本栓动步枪,口径7.7x58mm有坂弹药.这支是发射木制子弹的训练步枪."
	icon_state = "arisaka99"
	item_state = "arisaka99"
	base_icon = "arisaka99"
	caliber = "a77x58_wood"
	weight = 3.8
	fire_sound = 'sound/weapons/guns/fire/rifle.ogg'
	ammo_type = /obj/item/ammo_casing/a77x58_wood
	magazine_type = /obj/item/ammo_magazine/arisaka99_training
	good_mags = list(/obj/item/ammo_magazine/arisaka99, /obj/item/ammo_magazine/arisaka99_training)
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	bolt_open_sound = 'sound/weapons/guns/interact/arisaka_open.ogg'
	bolt_close_sound = 'sound/weapons/guns/interact/arisaka_close.ogg'
	equiptimer = 18
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_UNDER
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/gewehr71
	name = "Gewehr 71"
	desc = "德国栓动步枪,口径7.65x53mm毛瑟弹药."
	icon_state = "gewehr71"
	item_state = "gewehr71"
	base_icon = "gewehr71"
	caliber = "a765x53"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a765x53
	magazine_type = /obj/item/ammo_magazine/gewehr71
	good_mags = list(/obj/item/ammo_magazine/gewehr71)
	value = 90
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	shake_strength = 10
	throwforce = 20
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 19
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/madsenm47
	name = "马德森 M47"
	desc = "丹麦栓动步枪."
	icon_state = "madsenm47"
	item_state = "gewehr71"
	base_icon = "madsenm47"
	caliber = "a765x53"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a762x51
	magazine_type = /obj/item/ammo_magazine/gewehr71
	good_mags = list(/obj/item/ammo_magazine/gewehr71)
	bolt_safety = FALSE
	value = 90
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 10
	throwforce = 20
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 20
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/mauser1890
	name = "毛瑟 M1890"
	desc = "德国栓动步枪,通常被称为\"奥斯曼毛瑟\",口径7.65x53mm毛瑟弹药."
	icon_state = "mauser90"
	item_state = "gewehr98"
	base_icon = "mauser90"
	fire_sound = 'sound/weapons/guns/fire/Kar98k.ogg'
	caliber = "a765x53"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a765x53
	magazine_type = /obj/item/ammo_magazine/gewehr71
	good_mags = list(/obj/item/ammo_magazine/gewehr71)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 10
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/mauser1893
	name = "毛瑟 M1893"
	desc = "德国栓动步枪,通常被称为\"西班牙毛瑟\",口径7x57mm毛瑟弹药."
	icon_state = "mauser93"
	item_state = "mauser93"
	base_icon = "mauser93"
	fire_sound = 'sound/weapons/guns/fire/Kar98k.ogg'
	caliber = "a7x57"
	weight = 3.68
	ammo_type = /obj/item/ammo_casing/a7x57
	magazine_type = /obj/item/ammo_magazine/mauser1893
	good_mags = list(/obj/item/ammo_magazine/mauser1893)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 10
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/mauser1893/mauser1893o
	name = "毛瑟 M1893 (奥斯曼)"
	desc = "\"西班牙毛瑟\"的奥斯曼版本,口径7.65x53mm毛瑟弹药."
	caliber = "a765x53"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a765x53
	magazine_type = /obj/item/ammo_magazine/gewehr71
	equiptimer = 15

/obj/item/weapon/gun/projectile/boltaction/gewehr98
	name = "Gewehr 98"
	desc = "德国栓动步枪,口径7.92x57mm毛瑟弹药."
	icon_state = "gewehr98"
	item_state = "gewehr98"
	base_icon = "gewehr98"
	caliber = "a792x57"
	fire_sound = 'sound/weapons/guns/fire/Kar98k.ogg'
	weight = 4
	ammo_type = /obj/item/ammo_casing/a792x57
	magazine_type = /obj/item/ammo_magazine/gewehr98
	good_mags = list(/obj/item/ammo_magazine/gewehr98)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 15
	accuracy = 2
	barrel_x_offset = 15

/obj/item/weapon/gun/projectile/boltaction/vg //for balance reasons this gun wont use the STG mags instead it will use just clips also i dont know how to code in mag usage by bolties
	name = "国民突击步枪"
	desc = "一种非常原始的德国栓动步枪,口径7.92x33mm Kurz."
	icon_state = "vg1"
	item_state = "vg1"
	base_icon = "vg1"
	caliber = "a792x33"
	fire_sound = 'sound/weapons/guns/fire/stg.ogg'
	weight = 4.2
	ammo_type = /obj/item/ammo_casing/a792x33
	magazine_type = /obj/item/ammo_magazine/vgclip
	good_mags = list(/obj/item/ammo_magazine/vgclip)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 15
	throwforce = 29
	max_shells = 10
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/gewehr98/mauser1903
	name = "毛瑟 M1903"
	desc = "毛瑟M1898的奥斯曼版本,口径7.65x53mm毛瑟弹药."
	caliber = "a765x53"
	weight = 3.7
	ammo_type = /obj/item/ammo_casing/a765x53
	magazine_type = /obj/item/ammo_magazine/gewehr71
	good_mags = list(/obj/item/ammo_magazine/gewehr71)
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98a
	name = "Karabiner 98a"
	desc = "Gewehr 98的缩短卡宾版本,口径7.92x57mm毛瑟弹药."
	icon_state = "kar98a"
	item_state = "kar98k"
	base_icon = "kar98a"
	weight = 3.5
	equiptimer = 12
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98k
	name = "Karabiner 98k"
	desc = "Gewehr 98的缩短现代化卡宾版本,口径7.92x57mm毛瑟弹药."
	icon_state = "kar98k"
	item_state = "kar98k"
	base_icon = "kar98k"
	weight = 3.7
	equiptimer = 12
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98k/sniper/New()
	name = "Sniper Karabiner 98k"
	scope_mounts = list("swept_back")
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/zf39/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/zf39(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/gewehr98/karabiner98k/chinese
	name = "中正式"
	desc = "Gewehr 98的缩短现代化卡宾版本,口径7.92x57mm毛瑟弹药.这支被中国采用."
	scope_mounts = list("swept_back")
	
/obj/item/weapon/gun/projectile/boltaction/p14enfield
	name = "Pattern 1914 恩菲尔德"
	desc = "基于毛瑟系列的英国栓动步枪,口径.303恩菲尔德弹药."
	icon_state = "p14enfield"
	item_state = "p14enfield"
	base_icon = "p14enfield"
	caliber = "a303"
	weight = 4.2
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	throwforce = 16
	ammo_type = /obj/item/ammo_casing/a303
	magazine_type = /obj/item/ammo_magazine/enfield
	good_mags = list(/obj/item/ammo_magazine/enfield)
	slot_flags = SLOT_SHOULDER
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 12
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/carcano
	name = "卡尔卡诺 1891"
	desc = "意大利栓动步枪,口径6.50x52mm弹药."
	icon_state = "carcano"
	item_state = "carcano"
	base_icon = "carcano"
	caliber = "a65x52"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a65x52
	magazine_type = /obj/item/ammo_magazine/carcano
	good_mags = list(/obj/item/ammo_magazine/carcano)
	bolt_safety = FALSE
	value = 100
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 14
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/arisaka35
	name = "有坂三五式"
	desc = "日本栓动步枪,口径6.50x50mm有坂弹药."
	icon_state = "arisaka35"
	item_state = "arisaka35"
	base_icon = "arisaka35"
	caliber = "a65x50"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a65x50
	bolt_safety = FALSE
	value = 120
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 12
	throwforce = 20
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	magazine_type = /obj/item/ammo_magazine/arisaka
	good_mags = list(/obj/item/ammo_magazine/arisaka)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/murata
	name = "二十二年式村田"
	desc = "日本栓动步枪,口径8x53mm村田弹药."
	icon_state = "murata"
	item_state = "murata"
	base_icon = "murata"
	caliber = "a8x53"
	weight = 3.8
	ammo_type = /obj/item/ammo_casing/a8x53
	bolt_safety = FALSE
	value = 120
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 12
	throwforce = 20
	max_shells = 8
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	magazine_type = /obj/item/ammo_magazine/murata
	good_mags = list(/obj/item/ammo_magazine/murata)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	blackpowder = TRUE
	equiptimer = 17
	accuracy = 2
	/////need to add:
	///Springfield Model
	///1861,Pattern
	//1853 Enfield,
	//Frank Wesson Rifle,
	//Colt Revolving Rifle,
	//Sharps & Hankins Carbine,
	///Volcanic Carbine,
	///M1817 Common Rifle (All Rifles used during the civil war)

/obj/item/weapon/gun/projectile/boltaction/berdan
	name = "伯丹 M1870"
	desc = "俄罗斯栓动步枪,口径7.62x54mmR弹药."
	icon_state ="berdanka"
	item_state ="berdan"
	base_icon = "berdanka"
	force = 12
	caliber = "a762x54"
	weight = 4.0
	bolt_safety = FALSE
	value = 100
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 20
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a762x54
	magazine_type = /obj/item/ammo_magazine/mosin
	good_mags = list(/obj/item/ammo_magazine/mosin)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 17
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/enfield
	name = "李-恩菲尔德 Mk. III"
	desc = "10发栓动步枪,英国军队制式装备,口径.303英国弹药."
	icon_state ="enfield"
	item_state ="enfield"
	base_icon = "enfield"
	force = 12
	caliber = "a303"
	weight = 4.5
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 16
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a303
	magazine_type = /obj/item/ammo_magazine/enfield
	good_mags = list(/obj/item/ammo_magazine/enfield)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 10
	equiptimer = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/lebel
	name = "勒贝尔 1886/M93"
	desc = "8发栓动步枪,法国军队制式装备,口径8x50mmR勒贝尔弹药."
	icon_state ="lebel"
	item_state ="lebel"
	base_icon = "lebel"
	force = 12
	caliber = "a8x50"
	weight = 4.4
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 16
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/a8x50
	magazine_type = /obj/item/ammo_magazine/c8x50
	good_mags = list(/obj/item/ammo_magazine/c8x50)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 8
	equiptimer = 16
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/lebel/sniper/New()
	name = "Sniper Lebel 1886/M93"
	scope_mounts = list("apx_cronstein")
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/apx/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/apx(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/berthier
	name = "贝蒂埃 M1907/15"
	desc = "3发栓动卡宾枪,口径8x50mmR勒贝尔弹药."
	icon_state ="berthier"
	item_state ="berthier"
	base_icon = "berthier"
	force = 12
	caliber = "a8x50"
	weight = 3
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 16
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a8x50
	magazine_type = /obj/item/ammo_magazine/c8x50_3clip
	good_mags = list(/obj/item/ammo_magazine/c8x50_3clip)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 3
	equiptimer = 13
	accuracy = 2

/obj/item/weapon/gun/projectile/boltaction/berthier/m16
	name = "贝蒂埃 M1907/16"
	desc = "5发栓动卡宾枪,口径8x50mmR勒贝尔弹药."
	magazine_type = /obj/item/ammo_magazine/c8x50_5clip
	good_mags = list(/obj/item/ammo_magazine/c8x50_3clip)
	max_shells = 5
	equiptimer = 13

/obj/item/weapon/gun/projectile/boltaction/berthier/m16/sniper/New()
	name = "Sniper Berthier M1907/16"
	scope_mounts = list("apx_cronstein")
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/apx/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/apx(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/berthier/m16/sniper/update_icon()
	..()
	if (scope)
		overlays -= scope_image
		scope_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = "apx_berthier", pixel_x = scope_x_offset, pixel_y = scope_y_offset)
		overlays += scope_image

/obj/item/weapon/gun/projectile/boltaction/mosin/obrez
	name = "莫辛-纳甘 \"截短型\""
	desc = "一把临时改装的截短莫辛 \"手枪\", 使用7.62x54mmR弹药."
	icon_state ="obrez"
	item_state ="pistol"
	base_icon = "obrez"
	force = 5
	attachment_slots =	ATTACH_BARREL|ATTACH_IRONSIGHTS|ATTACH_SCOPE
	caliber = "a762x54"
	damage_modifier = 0.8
	weight = 1.4
	w_class = ITEM_SIZE_SMALL
	value = 60
	slot_flags = SLOT_BELT|SLOT_HOLSTER|SLOT_SHOULDER
	equiptimer = 9
	accuracy = 4
	scope_mounts = list("kochetov")
	barrel_x_offset = 6
	barrel_y_offset = 8

/obj/item/weapon/gun/projectile/boltaction/m24
	name = "M24 SWS"
	desc = "雷明顿700步枪的军用版本."
	icon_state = "m24"
	item_state = "m24"
	base_icon = "m24"
	caliber = "a762x51"
	weight = 4
	ammo_type = /obj/item/ammo_casing/a762x51
	damage_modifier = 1.25
	magazine_type = /obj/item/ammo_magazine/m24
	good_mags = list(/obj/item/ammo_magazine/m24)
	bolt_safety = FALSE
	value = 130
	slot_flags = SLOT_SHOULDER
	shake_strength = 0
	force = 11
	throwforce = 25
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	equiptimer = 12
	accuracy = 1
	scope_mounts = list("picatinny")
	scope_x_offset = -1

/obj/item/weapon/gun/projectile/boltaction/m24/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/boltaction/springfield
	name = "M1903 斯普林菲尔德"
	desc = "一把1903年制造的栓动步枪, 使用.30-06弹药, 内置5发弹仓."
	icon_state ="springfield_ww2"
	item_state ="springfield_ww2"
	base_icon = "springfield_ww2"
	force = 12
	caliber = "a3006"
	weight = 4.5
	bolt_safety = FALSE
	value = 80
	shake_strength = 0
	slot_flags = SLOT_SHOULDER
	throwforce = 16
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a3006
	magazine_type = /obj/item/ammo_magazine/springfield
	good_mags = list(/obj/item/ammo_magazine/springfield,/obj/item/ammo_magazine/garand)
	load_shell_sound = 'sound/weapons/guns/interact/clip_reload.ogg'
	max_shells = 5
	equiptimer = 12
	accuracy = 1

/obj/item/weapon/gun/projectile/boltaction/springfield/sniper/New()
	..()
	scope_mounts = list("picatinny")
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/m84/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/m84(src)
	SP.attached(null,src,TRUE)
