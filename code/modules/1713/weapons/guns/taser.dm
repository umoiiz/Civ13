/obj/item/weapon/gun/projectile/pistol/taser
	name = "泰瑟手枪"
	desc = "一种电击武器,利用电流扰乱肌肉控制并暂时使人丧失行动能力."
	icon = 'icons/obj/guns/wip.dmi'
	icon_state = "taser_new"
	item_state = "taser_new"
	base_icon = "taser_new"
	fire_sound = 'sound/weapons/taser.ogg'
	w_class = ITEM_SIZE_NORMAL
	load_method = MAGAZINE
	max_shells = 5
	caliber = "taser"
	ammo_type = /obj/item/ammo_casing/taser
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	magazine_type = /obj/item/ammo_magazine/taser
	good_mags = list(/obj/item/ammo_magazine/taser)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, move_delay=0, fire_delay=20)
		)
	gun_type = GUN_TYPE_PISTOL
	force = 10
	throwforce = 20
	attachment_slots = null
	handle_casings = REMOVE_CASINGS

/obj/item/weapon/gun/projectile/pistol/taser/update_icon()
	if (!ammo_magazine)
		icon_state = "[base_icon]_empty"
	else
		icon_state = "[base_icon]"
	update_held_icon()
	return

/obj/item/projectile/taser
	name = "泰瑟飞镖"
	icon_state = "dart"
	taser_effect = TRUE
	damage = 2
	damage_type = STUN
	nodamage = FALSE
	agony = 40
	stun = 40
	check_armor = "energy"
	embed = FALSE
	sharp = FALSE
	penetrating = 0
	kill_count = 5

	muzzle_type = null

/obj/item/ammo_casing/taser
	name = "泰瑟飞镖"
	desc = "一种小型投射物,可向目标释放电击."
	caliber = "taser"
	icon_state = "bdart"
	spent_icon = "bdart"
	projectile_type = /obj/item/projectile/taser
	leaves_residue = FALSE

/obj/item/ammo_magazine/taser
	name = "泰瑟弹匣"
	icon_state = "taser"
	caliber = "taser"
	ammo_type = /obj/item/ammo_casing/taser
	max_ammo = 5
	weight = 0.01
	mag_type = MAGAZINE
	multiple_sprites = FALSE
	clip = FALSE
