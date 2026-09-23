/obj/item/weapon/gun/projectile/pistol
	// less accurate than rifles against still targets, but better against moving targets
	// less accurate than semiautos but with the same ratios
	icon = 'icons/obj/guns/pistols.dmi'
	move_delay = 1
	fire_delay = 3
	item_state = "pistol"
	base_icon = "pistol"
	equiptimer = 5
	gun_safety = TRUE
	gun_type = GUN_TYPE_PISTOL
	handle_casings = EJECT_CASINGS
	silencer_fire_sound = 'sound/weapons/guns/fire/Glock17-SD.ogg'
	maxhealth = 45
	gtype = "pistol"
	KD_chance = KD_CHANCE_MEDIUM
	stat = "pistol"
	barrel_x_offset = 17
	barrel_y_offset = 0

/obj/item/weapon/gun/projectile/pistol/attackby(obj/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/attachment/bayonet))
		to_chat(user, "<span class = 'danger'>那个装不上去.</span>")
		return FALSE
	else
		return ..()

/obj/item/weapon/gun/projectile/pistol/update_icon()
	..()
	item_state = initial(item_state)
	if (silencer && (!silencer.fits || (silencer.fits && !silencer.fits.Find("pistol"))))
		overlays -= barrel_image
		var/part_icon_state = "pistol_[silencer.icon_state]"
		barrel_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = part_icon_state, pixel_x = barrel_x_offset, pixel_y = barrel_y_offset)
		overlays += barrel_image

/obj/item/weapon/gun/projectile/pistol/nambu
	name = "A 型南部手枪"
	desc = "日本制式手枪. 发射 8x22mm 南部弹."
	icon_state = "nambu"
	w_class = ITEM_SIZE_SMALL
	caliber = "c8mmnambu"
	fire_sound = 'sound/weapons/guns/fire/Nambu.ogg'
	magazine_type = /obj/item/ammo_magazine/c8mmnambu
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	good_mags = list(/obj/item/ammo_magazine/c8mmnambu, /obj/item/ammo_magazine/c8mmnambu/empty)
	bad_magazine_types = list(/obj/item/weapon/gun/projectile/submachinegun/type100)
/obj/item/weapon/gun/projectile/pistol/nambu/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "nambu"
	else
		icon_state = "nambu_open"
	return

/obj/item/weapon/gun/projectile/pistol/ww2/nambu
	name = "南部十四年式手枪"
	desc = "日本制式手枪. 发射 8x22mm 南部弹."
	icon_state = "nambu_ww2"
	w_class = ITEM_SIZE_SMALL
	caliber = "c8mmnambu"
	fire_sound = 'sound/weapons/guns/fire/Nambu.ogg'
	magazine_type = /obj/item/ammo_magazine/c8mmnambu
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	good_mags = list(/obj/item/ammo_magazine/c8mmnambu, /obj/item/ammo_magazine/c8mmnambu/empty)
	bad_magazine_types = list(/obj/item/weapon/gun/projectile/submachinegun/type100)

/obj/item/weapon/gun/projectile/pistol/ww2/nambu/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "nambu_ww2"
	else
		icon_state = "nambu_ww2_open"
	return

/obj/item/weapon/gun/projectile/pistol/luger
	name = "鲁格 P08"
	desc = "鲁格 P08, 德国设计, 发射 9x19mm 帕拉贝鲁姆弹."
	icon_state = "luger"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/luger
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	good_mags = list(/obj/item/ammo_magazine/luger, /obj/item/ammo_magazine/luger/empty)
	bad_magazine_types = list(/obj/item/ammo_magazine/mp40)
/obj/item/weapon/gun/projectile/pistol/luger/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "luger"
	else
		icon_state = "luger_open"
	return

/obj/item/weapon/gun/projectile/pistol/waltherp38
	name = "瓦尔特 P38"
	desc = "瓦尔特 P38, 德国设计, 发射 9x19mm 帕拉贝鲁姆弹."
	icon_state = "waltherp38"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/walther
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	good_mags = list(/obj/item/ammo_magazine/walther)
	bad_magazine_types = list(/obj/item/ammo_magazine/mp40)

/obj/item/weapon/gun/projectile/pistol/waltherp38/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "waltherp38"
	else
		icon_state = "waltherp38_open"
	return

/obj/item/weapon/gun/projectile/pistol/waltherp38/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/glock17
	name = "格洛克 17"
	desc = "一把现代手枪, 装填 9x19mm 弹药, 可靠且快速."
	icon_state = "glock17"
	fire_delay = 2.3
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/glock17
	weight = 0.594
	max_shells = 17 //Glock 17 real capacity
	ammo_type = /obj/item/ammo_casing/a9x19
	good_mags = list(/obj/item/ammo_magazine/glock17)
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 4

/obj/item/weapon/gun/projectile/pistol/glock17/update_icon()
	..()
	overlays -= mag_image

/obj/item/weapon/gun/projectile/pistol/glock17/standardized
	magazine_type = /obj/item/ammo_magazine/emptymagazine/pistol


/obj/item/weapon/gun/projectile/pistol/glock17/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/glock17/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "glock17"
	else
		icon_state = "glock17_open"
	return

/obj/item/weapon/gun/projectile/pistol/sig250
	name = "SIG 250"
	desc = "一把现代手枪, 装填 9x19mm 弹药, 可靠且快速."
	icon_state = "sig250"
	item_state = "sig250"
	fire_delay = 2.3
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/sig250
	weight = 0.594
	max_shells = 17
	ammo_type = /obj/item/ammo_casing/a9x19
	good_mags = list(/obj/item/ammo_magazine/sig250)
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS

/obj/item/weapon/gun/projectile/pistol/sig250/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "sig250"
	else
		icon_state = "sig250_open"
	return

/obj/item/weapon/gun/projectile/pistol/pl14
	name = "PL-14"
	desc = "卡拉什尼科夫制造的现代实验手枪 (发射 9x19mm 弹)."
	icon_state = "pl14"
	fire_delay = 1.8
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/pl14
	good_mags = list(/obj/item/ammo_magazine/pl14)
	weight = 0.594
	max_shells = 16
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS

/obj/item/weapon/gun/projectile/pistol/pl14/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "pl14"
	else
		icon_state = "pl14_open"
	return

/obj/item/weapon/gun/projectile/pistol/mp443
	name = "MP-443 乌鸦"
	desc = "一种俄罗斯制造的手枪, 使用 9x19mm 弹药."
	icon_state = "mp443"
	fire_delay = 3.15
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/mp443
	good_mags = list(/obj/item/ammo_magazine/mp443)
	weight = 0.594
	max_shells = 17
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
/obj/item/weapon/gun/projectile/pistol/mp443/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "mp443"
	else
		icon_state = "mp443_open"
	return

/obj/item/weapon/gun/projectile/pistol/tarus
	name = "Tarus G3"
	desc = "一把现代手枪, 装填 9x19mm 弹药, 可靠且快速."
	icon_state = "tarusg3"
	fire_delay = 2.3
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/glock17
	good_mags = list(/obj/item/ammo_magazine/glock17)
	weight = 0.594
	max_shells = 17
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS

/obj/item/weapon/gun/projectile/pistol/tarus/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "tarusg3"
	else
		icon_state = "tarusg3_open"
	return

/obj/item/weapon/gun/projectile/pistol/p220
	name = "SIG Sauer P220"
	desc = "SIG Sauer P220 是一种半自动手枪. 设计于 1975 年."
	icon_state = "p220"
	fire_delay = 3.7
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/p220
	good_mags = list(/obj/item/ammo_magazine/p220)
	weight = 0.594
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/a45
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS

/obj/item/weapon/gun/projectile/pistol/p220/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "p220"
	else
		icon_state = "p220_open"
	return

/obj/item/weapon/gun/projectile/pistol/p220/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/iogb7
	name = "IOQ B-72"
	desc = "Re1taz 发明的某种假货垃圾."
	icon_state = "iogb7"
	fire_delay = 1.1
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/glock17
	good_mags = list(/obj/item/ammo_magazine/glock17)
	weight = 0.594
	max_shells = 17
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
/obj/item/weapon/gun/projectile/pistol/iogb7/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "iogb7"
	else
		icon_state = "iogb7_open"
	return

/obj/item/weapon/gun/projectile/pistol/mauser
	name = "毛瑟 C96"
	desc = "一种早期德国手枪, 可发射 7.62x25mm TT 弹."
	icon_state = "mauser"
	w_class = ITEM_SIZE_SMALL
	caliber = "a762x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/mauser
	good_mags = list(/obj/item/ammo_magazine/mauser)
	weight = 0.794
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/a762x25
	damage_modifier = 0.98
	load_method = SINGLE_CASING | SPEEDLOADER
	handle_casings = EJECT_CASINGS
/obj/item/weapon/gun/projectile/pistol/mauser/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "mauser"
	else
		icon_state = "mauser_open"
	return

/obj/item/weapon/gun/projectile/pistol/borchardt
	name = "博查特 C93"
	desc = "一种德国半自动手枪, 发射 7.65x25mm 博查特弹."
	icon_state = "borchardt"
	w_class = ITEM_SIZE_SMALL
	caliber = "a765x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/borchardt
	good_mags = list(/obj/item/ammo_magazine/borchardt, /obj/item/ammo_magazine/borchardt/empty)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a765x25
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
/obj/item/weapon/gun/projectile/pistol/borchardt/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "borchardt"
	else
		icon_state = "borchardt_open"
	return

/obj/item/weapon/gun/projectile/pistol/colthammerless
	name = "柯尔特 M1903 无击锤袖珍手枪"
	desc = "一种早期紧凑型柯尔特手枪, 发射 .32 ACP 弹."
	icon_state = "coltpockethammerless"
	w_class = ITEM_SIZE_SMALL
	equiptimer = 4
	caliber = "a32acp"
	fire_sound = 'sound/weapons/guns/fire/32ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/colthammerless
	good_mags = list(/obj/item/ammo_magazine/colthammerless)
	weight = 0.680
	ammo_type = /obj/item/ammo_casing/a32acp
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	pocket = TRUE
	accuracy = 4

/obj/item/weapon/gun/projectile/pistol/colthammerless/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "coltpockethammerless"
	else
		icon_state = "coltpockethammerless_open"
	return

/obj/item/weapon/gun/projectile/pistol/colthammerless/m1908
	name = "柯尔特 M1908 无击锤袖珍手枪"
	desc = "紧凑型柯尔特手枪的后期版本, 发射 .380 ACP 弹."
	icon_state = "coltpockethammerless"
	w_class = ITEM_SIZE_SMALL
	caliber = "a380acp"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/colthammerless/a380acp
	good_mags = list(/obj/item/ammo_magazine/colthammerless/a380acp)
	weight = 0.720
	ammo_type = /obj/item/ammo_casing/a380acp
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS

/obj/item/weapon/gun/projectile/pistol/bergmann
	name = "伯格曼 2 号"
	desc = "一种外观特别独特的早期德国半自动手枪."
	icon_state = "bergmann"
	w_class = ITEM_SIZE_SMALL
	caliber = "c8mmnambu"
	fire_sound = 'sound/weapons/guns/fire/Nambu.ogg'
	magazine_type = /obj/item/ammo_magazine/bergmann
	good_mags = list(/obj/item/ammo_magazine/bergmann)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 4

/obj/item/weapon/gun/projectile/pistol/bergmann/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "bergmann"
	else
		icon_state = "bergmann"
	return

/obj/item/weapon/gun/projectile/pistol/m1911
	name = "M1911A1"
	desc = "1911 年至 1985 年美国武装部队的制式手枪. 发射 .45 ACP 弹."
	icon_state = "colt"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/m1911
	good_mags = list(/obj/item/ammo_magazine/m1911, /obj/item/ammo_magazine/m1911/empty)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a45acp
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/thompson)
	accuracy = 3

/obj/item/weapon/gun/projectile/pistol/m1911/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "colt"
	else
		icon_state = "colt_open"
	return

/obj/item/weapon/gun/projectile/pistol/blackm1911
	name = "柯尔特 Mark IV"
	desc = "M1911A1 的略微升级型号. 发射 .45 ACP 弹."
	icon_state = "colt"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/m1911
	good_mags = list(/obj/item/ammo_magazine/m1911)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a45acp
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 3

/obj/item/weapon/gun/projectile/pistol/blackm1911/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "colt"
	else
		icon_state = "colt_open"
	return


/obj/item/weapon/gun/projectile/pistol/blackm1911/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/tt30
	name = "TT-33"
	desc = "1950 年代前苏联的制式手枪. 发射 7.62x25mm 托卡列夫弹."
	icon_state = "tt30"
	w_class = ITEM_SIZE_SMALL
	caliber = "a762x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/tt30
	good_mags = list(/obj/item/ammo_magazine/tt30, /obj/item/ammo_magazine/tt30ll, /obj/item/ammo_magazine/tt30/empty,/obj/item/ammo_magazine/tt30ll/rubber)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a762x25
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/c762x25_ppsh, /obj/item/ammo_magazine/c762x25_pps)
	accuracy = 4
	barrel_x_offset = 19
	barrel_y_offset = 0

/obj/item/weapon/gun/projectile/pistol/tt30/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "tt30"
	else
		icon_state = "tt30_open"
	return

/obj/item/weapon/gun/projectile/pistol/tt30/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/tt30/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/makarov
	name = "马卡洛夫 PM"
	desc = "1950 年代后苏联和俄罗斯联邦的制式手枪. 发射 9x18mm 马卡洛夫弹."
	icon_state = "makarov"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x18"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/makarov
	good_mags = list(/obj/item/ammo_magazine/makarov, /obj/item/ammo_magazine/makarov/empty)
	weight = 0.704
	ammo_type = /obj/item/ammo_casing/a9x18
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/c762x25_ppsh, /obj/item/ammo_magazine/c762x25_pps)

/obj/item/weapon/gun/projectile/pistol/makarov/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "makarov"
	else
		icon_state = "makarov_open"
	return

/obj/item/weapon/gun/projectile/pistol/makarov/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/aps
	name = "斯捷奇金 APS"
	desc = "一种苏联选射冲锋手枪. 发射 9x18mm 马卡洛夫弹."
	icon_state = "aps"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x18"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/aps
	good_mags = list(/obj/item/ammo_magazine/aps, /obj/item/ammo_magazine/aps/empty)
	weight = 0.704
	ammo_type = /obj/item/ammo_casing/a9x18
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/makarov)
	recoil = 30
	accuracy = 2

/obj/item/weapon/gun/projectile/pistol/m9beretta
	name = "伯莱塔 M9"
	desc = "1985 年至 2017 年美国武装部队的制式手枪. 发射 9mm 鲁格弹."
	icon_state = "m9beretta"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/m9beretta
	good_mags = list(/obj/item/ammo_magazine/m9beretta)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 1

/obj/item/weapon/gun/projectile/pistol/m9beretta/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "m9beretta"
	else
		icon_state = "m9beretta_open"
	return

/obj/item/weapon/gun/projectile/pistol/m9beretta/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/pistol/m9beretta/tan
	name = "伯莱塔 M9"
	desc = "1985 年至 2017 年美国武装部队的制式手枪. 发射 9mm 鲁格弹. 这一把能与沙漠融为一体"
	icon_state = "tanm9"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/m9beretta
	good_mags = list(/obj/item/ammo_magazine/m9beretta)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 2

/obj/item/weapon/gun/projectile/pistol/m9beretta/tan/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "tanm9"
	else
		icon_state = "tanm9_open"

/obj/item/weapon/gun/projectile/pistol/jericho941
	name = "杰里科 941"
	desc = "20 世纪末以色列国防军的制式手枪. 发射 9mm 帕拉贝鲁姆弹."
	icon_state = "jericho941"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/jericho
	good_mags = list(/obj/item/ammo_magazine/jericho)
	weight = 0.85
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 2

/obj/item/weapon/gun/projectile/pistol/jericho941/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "jericho941"
	else
		icon_state = "jericho941_open"
	return
/obj/item/weapon/gun/projectile/pistol/deagle
	name = "沙漠之鹰"
	desc = "由 Magnum Research Inc. 设计并开发. 发射 .50 口径弹."
	icon_state = "deagle"
	w_class = ITEM_SIZE_SMALL
	caliber = "a50cal"
	fire_sound = 'sound/weapons/guns/fire/deagle.ogg'
	magazine_type = /obj/item/ammo_magazine/deagle
	good_mags = list(/obj/item/ammo_magazine/deagle)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a50cal
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	accuracy = 3
	bad_magazine_types = list(/obj/item/ammo_magazine/thompson)

/obj/item/weapon/gun/projectile/pistol/deagle/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "deagle"
	else
		icon_state = "deagle_open"
	return

/obj/item/weapon/gun/projectile/pistol/deaglemagnum
	name = "沙漠之鹰 (44.马格南)"
	desc = "由 Magnum Research Inc. 设计并开发. 发射 44 马格南弹."
	icon_state = "deagle"
	w_class = ITEM_SIZE_SMALL
	caliber = "a44magnum"
	fire_sound = 'sound/weapons/guns/fire/deagle.ogg'
	magazine_type = /obj/item/ammo_magazine/deagle
	good_mags = list(/obj/item/ammo_magazine/deaglemagnum)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a44magnum
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/thompson)
	accuracy = 3

/obj/item/weapon/gun/projectile/pistol/deaglemagnum/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "deagle"
	else
		icon_state = "deagle_open"
	return

/obj/item/weapon/gun/projectile/pistol/browninghp
	name = "勃朗宁大威力"
	desc = "由比利时 Fabrique Nationale 生产, 这种老式手枪发射 9mm 帕拉贝鲁姆弹."
	icon_state = "browning_hp"
	w_class = ITEM_SIZE_SMALL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/browninghp
	good_mags = list(/obj/item/ammo_magazine/browninghp)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a9x19
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/thompson)
	accuracy = 3

/obj/item/weapon/gun/projectile/pistol/browninghp/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "browning_hp"
	else
		icon_state = "browning_hp_open"
	return

/obj/item/weapon/gun/projectile/pistol/sti2011
	name = "STI 2011"
	desc = "一种应美国法警局要求制造的 M1911 高端特化版本, 发射 .45 S&W 弹."
	icon_state = "sti2011"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/sti2011
	good_mags = list(/obj/item/ammo_magazine/sti2011)
	weight = 0.794
	ammo_type = /obj/item/ammo_casing/a45acp
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	bad_magazine_types = list(/obj/item/ammo_magazine/thompson)
	accuracy = 2

/obj/item/weapon/gun/projectile/pistol/sti2011/update_icon()
	..()
	if (ammo_magazine)
		icon_state = "sti2011"
	else
		icon_state = "sti2011_open"
	return