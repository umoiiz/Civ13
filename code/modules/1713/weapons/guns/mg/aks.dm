/obj/item/weapon/gun/projectile/submachinegun/ak101
	name = "AK-101"
	desc = "一款现代俄罗斯AK衍生型,发射北约5.56x45mm弹药."
	icon_state = "ak101"
	item_state = "ak101"
	base_icon = "ak101"
	weight = 3.6
	var/folded = FALSE
	caliber = "a556x45"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	magazine_type = /obj/item/ammo_magazine/ak101
	good_mags = list(/obj/item/ammo_magazine/ak101, /obj/item/ammo_magazine/ak101/drum)
	equiptimer = 15
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2, recoil=0, move_delay=2),
		list(name = "automatic",	burst=1, burst_delay=1.2, recoil=0, move_delay=4),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	accuracy = 2
	recoil = 30
	scope_mounts = list ("dovetail", "picatinny")
	under_mounts = list ("picatinny", "gp25_mount")

/obj/item/weapon/gun/projectile/submachinegun/ak101/update_icon()
	..()
	if (folded)
		icon_state = "[base_icon]_folded"
	else
		icon_state = "[base_icon]"

/obj/item/weapon/gun/projectile/submachinegun/ak101/verb/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		to_chat(usr, "你展开了\the [src]的枪托.")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		folded = TRUE
		to_chat(usr, "你折叠了\the [src]的枪托.")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak101/proc/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
	else
		slot_flags = SLOT_SHOULDER


/obj/item/weapon/gun/projectile/submachinegun/ak101/ak102
	name = "AK-102"
	desc = "一款现代俄罗斯AK衍生型,发射北约5.56x45mm弹药.这是AK-101的卡宾版本."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	weight = 3
	magazine_type = /obj/item/ammo_magazine/ak101
	good_mags = list(/obj/item/ammo_magazine/ak101, /obj/item/ammo_magazine/ak101/drum)
	equiptimer = 12
	accuracy = 3
	recoil = 35

/obj/item/weapon/gun/projectile/submachinegun/ak101/ak103
	name = "AK-103"
	desc = "一款现代俄罗斯AK衍生型,发射7.62x39mm弹药."
	icon_state = "ak101"
	item_state = "ak101"
	base_icon = "ak101"
	weight = 3.6
	caliber = "a762x39"
	magazine_type = /obj/item/ammo_magazine/ak47
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/drum,, /obj/item/ammo_magazine/ak47/makeshift)
	equiptimer = 15
	accuracy = 2
	recoil = 40

/obj/item/weapon/gun/projectile/submachinegun/ak101/ak103/ak104
	name = "AK-104"
	desc = "现代俄罗斯AK变体,使用7.62x39mm弹药.这是AK-103的卡宾枪版本."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	weight = 3.2
	equiptimer = 12
	accuracy = 3
	recoil = 45

/obj/item/weapon/gun/projectile/submachinegun/ak101/ak105
	name = "AK-105"
	desc = "现代俄罗斯AK变体,使用5.45x39mm弹药.这是AK-74M的卡宾枪版本."
	icon_state = "ak101"
	item_state = "ak74m"
	base_icon = "ak101"
	caliber = "a545x39"
	weight = 3.2
	equiptimer = 12
	magazine_type = /obj/item/ammo_magazine/ak74
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak74/drum, /obj/item/ammo_magazine/ak74/ak74m)
	accuracy = 2
	recoil = 25
