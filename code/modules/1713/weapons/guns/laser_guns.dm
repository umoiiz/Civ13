/obj/item/weapon/gun/projectile/semiautomatic/laser
	name = "DC-15"
	desc = "共和国大军的标准配发卡宾枪"
	icon_state = "DC-15A"
	item_state = "DC-15A"
	base_icon = "DC-15A"
	fire_sound = 'sound/weapons/guns/fire/blasterdc2.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 200
	caliber = "laserb"
	ammo_type = /obj/item/ammo_casing/laser/b
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/dc15
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dc15)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = null
	handle_casings = REMOVE_CASINGS
	can_tactical_reload = TRUE

/obj/item/weapon/gun/projectile/semiautomatic/laser/consume_next_projectile(var/check = FALSE)
	//get the next casing
	if (loaded.len)
		chambered = loaded[1] //load next casing.
		if (handle_casings != HOLD_CASINGS)
			loaded -= chambered
			if (infinite_ammo)
				loaded += new chambered.type

	else if (ammo_magazine && ammo_magazine.stored_ammo.len)
		chambered = ammo_magazine.stored_ammo[1]
		if (handle_casings != HOLD_CASINGS)
			ammo_magazine.stored_ammo -= chambered
			if (infinite_ammo)
				ammo_magazine.stored_ammo += new chambered.type

	if (chambered)
		if (gibs)
			chambered.BB.gibs = TRUE
		if (crushes)
			chambered.BB.crushes = TRUE
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/semiautomatic/laser/handle_post_fire()
	..()
	jamcheck = 0
	last_fire = world.time

/obj/item/weapon/gun/projectile/semiautomatic/laser/dc15
	name = "DC-15"
	desc = "共和国大军的标准配发卡宾枪"
	icon_state = "DC-15"
	item_state = "DC-15"
	base_icon = "DC-15"
	fire_sound = 'sound/weapons/guns/fire/blasterdc2.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 200
	caliber = "laserb"
	ammo_type = /obj/item/ammo_casing/laser/b
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/dc15
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dc15)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/semiautomatic/laser/dc15a
	name = "DC-15A"
	desc = "共和国大军的标准配发步枪"
	icon_state = "DC-15A"
	item_state = "DC-15A"
	base_icon = "DC-15A"
	fire_sound = 'sound/weapons/guns/fire/blasterdc1.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 500
	caliber = "laserb"
	ammo_type = /obj/item/ammo_casing/laser/b
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/dc15a
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dc15a, /obj/item/ammo_magazine/tibannagas/dc15)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 20
	throwforce = 25
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/semiautomatic/laser/e5
	name = "E-5"
	desc = "独立星系邦联的标准配发步枪"
	icon_state = "E-5"
	item_state = "E-5"
	base_icon = "E-5"
	fire_sound = 'sound/weapons/guns/fire/blasterimperial.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 100
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/e5
	good_mags = list(/obj/item/ammo_magazine/tibannagas/e5)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 15
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/semiautomatic/laser/e11
	name = "E-11"
	desc = "银河帝国风暴兵军团的标准配发步枪"
	icon_state = "E-11"
	item_state = "E-11"
	base_icon = "E-11"
	fire_sound = 'sound/weapons/guns/fire/blasterimperial2.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 100
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/e11
	good_mags = list(/obj/item/ammo_magazine/tibannagas/e11, /obj/item/ammo_magazine/tibannagas/dc15a)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 15
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/semiautomatic/laser/a280
	name = "A280爆能枪"
	desc = "义军同盟的标准配发步枪."
	icon_state = "A280"
	item_state = "A280"
	base_icon = "A280"
	fire_sound = 'sound/weapons/guns/fire/blasterrebel.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 100
	caliber = "laser"
	ammo_type = /obj/item/ammo_casing/laser
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/tibannagas/a280
	good_mags = list(/obj/item/ammo_magazine/tibannagas/a280)
	weight = 5.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 15
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////PISTOLS/////////////////////////////////////////////
/obj/item/weapon/gun/projectile/pistol/laser
	name = "激光手枪"
	desc = "一种通用激光射击武器"
	icon_state = "DC-17"
	w_class = ITEM_SIZE_SMALL
	caliber = "laserb"
	fire_sound = 'sound/weapons/guns/fire/blasterdc2.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/dc17
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dc17)
	weight = 0.5
	ammo_type = /obj/item/ammo_casing/laser/b
	load_method = MAGAZINE
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/pistol/laser/dc17
	name = "DC-17爆能手枪"
	desc = "共和国大军最常使用的DC-17爆能手枪."
	icon_state = "DC-17"

/obj/item/weapon/gun/projectile/pistol/laser/dc17c
	name = "DC-17突击队爆能手枪"
	desc = "共和国大军突击队最常使用的DC-17突击队爆能手枪."
	icon_state = "DC-17c"

/obj/item/weapon/gun/projectile/pistol/laser/dl44
	name = "DL-44爆能手枪"
	desc = "银河系各组织广泛使用的DL-44爆能手枪."
	icon_state = "DL-44"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blasterdl44.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/dl44
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dl44)
	weight = 0.5
	ammo_type = /obj/item/ammo_casing/laser/pistol

/obj/item/weapon/gun/projectile/pistol/laser/dh17
	name = "DH-17爆能手枪"
	desc = "帝国用作制式手枪、同时在义军同盟中也十分常见的DH-17爆能手枪."
	icon_state = "DH-17"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blasterrebel.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/dh17
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dh17)
	weight = 0.5
	ammo_type = /obj/item/ammo_casing/laser/pistol

/obj/item/weapon/gun/projectile/pistol/laser/westar34
	name = "Westar-34爆能手枪"
	desc = "一种Westar-34爆能手枪,多为买得起这种华丽致命副武器的人所使用."
	icon_state = "Westar-34"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blasterrebel.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/westar34
	good_mags = list(/obj/item/ammo_magazine/tibannagas/westar34)
	weight = 0.5
	ammo_type = /obj/item/ammo_casing/laser/pistol
/////////////////////////////STAT MG'S/////////////////////////////////////////
/obj/item/weapon/gun/projectile/automatic/stationary/laser
	name = "激光机枪"
	desc = "不该看到这个"
	icon_state = "repeating_blaster"
	base_icon = "repeating_blaster"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blastere5sniper.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/repeating_blaster
	good_mags = list(/obj/item/ammo_magazine/tibannagas/repeating_blaster)
	firemodes = list(
		list(name = "automatic", burst=3, burst_delay=1.8, fire_delay=1.8)
		)
	ammo_type = /obj/item/ammo_casing/laser
/obj/item/weapon/gun/projectile/automatic/stationary/laser/update_icon()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_empty"
	update_held_icon()
	return
/obj/item/weapon/gun/projectile/automatic/stationary/laser/handle_post_fire()
	..()
	jamcheck = 0
	last_fire = world.time

/obj/item/weapon/gun/projectile/automatic/stationary/laser/repeating_laser
	name = "连发激光"
	desc = "一种固定式连发激光,一种发射提班纳气弹匣激光的炮塔."
	icon_state = "repeating_blaster"
	base_icon = "repeating_blaster"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blastere5sniper.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/repeating_blaster
	good_mags = list(/obj/item/ammo_magazine/tibannagas/repeating_blaster)
	firemodes = list(
		list(name = "automatic", burst=5, burst_delay=1.8, fire_delay=1.8)
		)
	ammo_type = /obj/item/ammo_casing/laser

/obj/item/weapon/gun/projectile/automatic/stationary/laser/eweb
	name = "E-WEB重型连发爆能枪"
	desc = "一种固定式连发爆能枪,架设在三脚架上,发射提班纳气弹匣激光."
	icon_state = "repeating_blaster"
	base_icon = "repeating_blaster"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blastere5sniper.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/repeating_blaster
	good_mags = list(/obj/item/ammo_magazine/tibannagas/repeating_blaster)
	firemodes = list(
		list(name = "automatic", burst=5, burst_delay=1.8, fire_delay=1.8)
		)
	ammo_type = /obj/item/ammo_casing/laser

/obj/item/weapon/gun/projectile/automatic/laser
	name = "激光转轮机枪"
	desc = "不该使用这个,兄弟"
	icon_state = "Z-6"
	item_state = "Z-6"
	base_icon = "Z-6"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/blasterimperial.ogg'
	ammo_type = /obj/item/ammo_casing/laser
	magazine_type = /obj/item/ammo_magazine/tibannagas/blaster_power_pack
	good_mags = list(/obj/item/ammo_magazine/tibannagas/blaster_power_pack, /obj/item/ammo_magazine/tibannagas/blaster_power_pack)
	weight = 9.12
	force = 20
	throwforce = 30
	attachment_slots = null
	slowdown = 0.2
	has_telescopic = FALSE
	slot_flags = SLOT_SHOULDER
	is_laser_mg = TRUE
	recoil = 1

/obj/item/weapon/gun/projectile/automatic/laser/update_icon()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_open"
	update_held_icon()
	return
/obj/item/weapon/gun/projectile/automatic/laser/handle_post_fire()
	..()
	jamcheck = 0
	last_fire = world.time

/obj/item/weapon/gun/projectile/automatic/laser/z6
	name = "Z-6爆能枪"
	desc = "共和国大军常用的标准Z-6重型旋转爆能枪."
	icon_state = "Z-6"
	item_state = "Z-6"
	base_icon = "Z-6"
	caliber = "laserb"
	fire_sound = 'sound/weapons/guns/fire/blasterdc1.ogg'
	ammo_type = /obj/item/ammo_casing/laser/b
	magazine_type = /obj/item/ammo_magazine/tibannagas/blaster_power_pack
	good_mags = list(/obj/item/ammo_magazine/tibannagas/blaster_power_pack)
	weight = 9.12
	force = 20
	throwforce = 30
	attachment_slots = null
	slowdown = 0.2
	has_telescopic = FALSE
	slot_flags = SLOT_SHOULDER
	is_laser_mg = TRUE

/obj/item/weapon/gun/projectile/automatic/laser/z6/update_icon()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = base_icon
	update_held_icon()
	return

/obj/item/weapon/gun/projectile/automatic/laser/z6/empire
	desc = "银河帝国风暴兵军团与义军同盟战斗人员同样常用的标准Z-6重型旋转爆能枪."

//////////other laser weapons//////////
/obj/item/weapon/gun/projectile/automatic/laser/qblz1
	name = "Qblz1等离子枪"
	desc = "中国使用的一种先进等离子步枪."
	icon = 'icons/obj/guns/wip.dmi'
	icon_state = "qblz1"
	item_state = "m16"
	base_icon = "qblz1"
	caliber = "laserb"
	fire_sound = 'sound/weapons/guns/fire/laserrifle.ogg'
	ammo_type = /obj/item/ammo_casing/laser/b
	magazine_type = /obj/item/ammo_magazine/tibannagas/qblz1
	good_mags = list(/obj/item/ammo_magazine/tibannagas/qblz1)
	weight = 6.4
	force = 20
	throwforce = 30
	attachment_slots = null
	slowdown = 0.2
	has_telescopic = FALSE
	slot_flags = SLOT_SHOULDER
	is_laser_mg = TRUE

/obj/item/weapon/gun/projectile/pistol/laser/dcb2
	name = "Dcb-2等离子手枪"
	desc = "中国使用的一种等离子手枪."
	icon_state = "dcb2"
	w_class = ITEM_SIZE_SMALL
	caliber = "laserb"
	fire_sound = 'sound/weapons/guns/fire/dcb2.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/dcb2
	good_mags = list(/obj/item/ammo_magazine/tibannagas/dcb2)
	weight = 0.6
	ammo_type = /obj/item/ammo_casing/laser/pistol/b

/obj/item/weapon/gun/projectile/pistol/laser/dcb2/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "dcb2"
	else
		icon_state = "dcb2_open"
	return

/obj/item/weapon/gun/projectile/automatic/laser/lasgun
	name = "激光枪"
	desc = "帝国卫队使用的标准激光枪."
	icon = 'icons/obj/guns/wip.dmi'
	icon_state = "lasgunm36"
	item_state = "lasgunm36"
	base_icon = "lasgunm36"
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/lasgun.ogg'
	ammo_type = /obj/item/ammo_casing/laser
	magazine_type = /obj/item/ammo_magazine/tibannagas/lasgun
	good_mags = list(/obj/item/ammo_magazine/tibannagas/lasgun)
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2, recoil=0, move_delay=2),
		list(name = "automatic",	burst=1, burst_delay=1.2, recoil=0, move_delay=4),
		)
	weight = 3.08
	force = 20
	throwforce = 30
	attachment_slots = ATTACH_BARREL
	slowdown = 0.2
	has_telescopic = FALSE
	slot_flags = SLOT_SHOULDER

/obj/item/weapon/gun/projectile/pistol/laser/laspistol
	name = "激光手枪"
	desc = "帝国卫队使用的一种激光手枪."
	icon_state = "laspistol"
	w_class = ITEM_SIZE_SMALL
	caliber = "laser"
	fire_sound = 'sound/weapons/guns/fire/lasgun.ogg'
	magazine_type = /obj/item/ammo_magazine/tibannagas/laspistol
	good_mags = list(/obj/item/ammo_magazine/tibannagas/laspistol)
	weight = 0.7
	ammo_type = /obj/item/ammo_casing/laser/pistol

/obj/item/weapon/gun/projectile/pistol/laser/laspistol/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "laspistol"
	else
		icon_state = "laspistol_open"
	return