/obj/item/weapon/gun/projectile/submachinegun
	force = 10
	throwforce = 20
	fire_sound = 'sound/weapons/guns/fire/smg.ogg'
	silencer_fire_sound = 'sound/weapons/guns/fire/Gyrza-SD.ogg'
	icon = 'icons/obj/guns/automatic.dmi'
	base_icon = "smg"
	// more accuracy than MGs, less than everything else
	load_method = MAGAZINE
	slot_flags = SLOT_SHOULDER|SLOT_BELT
	equiptimer = 12
	gun_safety = TRUE
	load_delay = 8
	gun_type = GUN_TYPE_RIFLE
	gtype = "smg"

	recoil = 8 // Compared to automatic machines, recoil is easier to control, but the spread is several times higher
	accuracy = 10

	KD_chance = KD_CHANCE_HIGH+3
	stat = "machinegun"
	w_class = ITEM_SIZE_NORMAL
	attachment_slots = ATTACH_IRONSIGHTS
	var/jammed_until = -1
	var/jamcheck = 0
	var/last_fire = -1
	var/one_handed = FALSE
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	can_tactical_reload = TRUE

/obj/item/weapon/gun/projectile/submachinegun/special_check(mob/user)
	if (gun_safety && safetyon)
		to_chat(user, "<span class='warning'>保险开启时你无法射击\the [src]!</span>")
		return FALSE
	if (!user.has_empty_hand(both = FALSE) && one_handed == FALSE)
		to_chat(user, "<span class='warning'>你需要双手才能射击\the [src]!</span>")
		return FALSE
	if (jammed_until > world.time)
		to_chat(user, "<span class = 'danger'>\The [src]卡壳了!在排除故障之前你无法射击.</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/submachinegun/stg
	name = "StG-44"
	desc = "德国突击步枪,使用7.92x33mm Kurz弹药,30发弹匣."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "stg"
	item_state = "stg"
	base_icon = "stg"
	load_method = MAGAZINE
	slot_flags = SLOT_SHOULDER|SLOT_BELT
	w_class = ITEM_SIZE_LARGE
	caliber = "a792x33"

	fire_sound = 'sound/weapons/guns/fire/stg.ogg'
	reload_sound = 'sound/weapons/guns/interact/stg_reload.ogg'
	magazine_type = /obj/item/ammo_magazine/stg
	good_mags = list(/obj/item/ammo_magazine/stg)
	weight = 4.6
	load_delay = 8
	equiptimer = 15
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.5),
		list(name = "automatic",	burst=1, burst_delay=1.4),
		)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL

	sel_mode = 1
	scope_mounts = list ("swept_back")

/obj/item/weapon/gun/projectile/submachinegun/handle_post_fire()
	..()
	var/reverse_health_percentage = (1-(health/maxhealth)+0.25)*100
	if (world.time - last_fire > 50)
		jamcheck = 0
	else
		jamcheck += 0.12

	if (prob(jamcheck*reverse_health_percentage))
		jammed_until = max(world.time + (jamcheck * 4), 45)
		jamcheck = 0

	last_fire = world.time

/obj/item/weapon/gun/projectile/submachinegun/spas
	name = "Spas-12"
	icon_state = "spas12"
	item_state = "spas12"
	base_icon = "spas12"
	desc = "一种由意大利弗兰基枪械公司设计的双模式霰弹枪,容量为8发."
	max_shells = 8 //match the ammo box capacity, also it can hold a round in the chamber anyways, for a total of 8.
	caliber = "12gauge"
	handle_casings = EJECT_CASINGS
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	force = 15
	throwforce = 30
	shake_strength = 1
	weight = 3.4
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	firemodes = list(
		list(name = "semiauto",    burst=1, burst_delay=1.2),
		list(name = "automatic",    burst=1, burst_delay=1.2),
		)

/obj/item/weapon/gun/projectile/submachinegun/spas/secondary_attack_self(mob/living/human/user)
	switch_firemodes(user)

/obj/item/weapon/gun/projectile/submachinegun/usas12
	name = "USAS-12"
	icon_state = "usas12"
	item_state = "usas12"
	base_icon = "usas12"
	desc = "一种由John Trevor, Jr.设计的韩国选射导气式霰弹枪,使用弹匣."
	caliber = "12gauge"
	slot_flags = SLOT_SHOULDER
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/usas12
	load_method = MAGAZINE
	good_mags = list(/obj/item/ammo_magazine/usas12, /obj/item/ammo_magazine/usas12/slug, /obj/item/ammo_magazine/usas12drum, /obj/item/ammo_magazine/usas12drum/slug)
	shake_strength = 1
	force = 15
	throwforce = 30
	weight = 3.5
	equiptimer = 15
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	firemodes = list(
		list(name = "semiauto",    burst=1, burst_delay=1.2),
		list(name = "automatic",    burst=1, burst_delay=1.2),
		)

/obj/item/weapon/gun/projectile/submachinegun/usas12/secondary_attack_self(mob/living/human/user)
	switch_firemodes(user)

/obj/item/weapon/gun/projectile/submachinegun/saiga12
	name = "Saiga-12K"
	icon_state = "saiga12"
	item_state = "saiga12"
	base_icon = "saiga12"
	desc = "一种12号口径半自动导气式战斗霰弹枪,被俄罗斯武装部队使用."
	magazine_type = /obj/item/ammo_magazine/saiga12
	weight = 3.5
	equiptimer = 11
	caliber = "12gauge"
	slot_flags = SLOT_SHOULDER
	handle_casings = EJECT_CASINGS
	load_method = MAGAZINE
	good_mags = list(/obj/item/ammo_magazine/saiga12, /obj/item/ammo_magazine/saiga12/slug)
	shake_strength = 1
	force = 15
	throwforce = 30
	weight = 3.4
	attachment_slots = ATTACH_UNDER|ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	firemodes = list(
		list(name = "semiauto",    burst=1, burst_delay=0.7),
		)
	recoil = 60
	accuracy = 5
	sel_mode = 1
	scope_x_offset = -2
	scope_y_offset = -3
	scope_mounts = list ("dovetail", "picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/saiga12/breacher/New()
	..()
	if (prob(50))
		var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
		SP.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/scope/adjustable/advanced/reddot/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/reddot(src)
		SP.attached(null,src,TRUE)

	if (prob(50))
		var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
		FP.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/under/laser/LS = new/obj/item/weapon/attachment/under/laser(src)
		LS.attached(null,src,TRUE)


/obj/item/weapon/gun/projectile/submachinegun/mp40
	name = "MP40"
	desc = "标志性的德国冲锋枪,带有下折叠枪托,使用9mm鲁格弹药."
	icon_state = "mp40"
	item_state = "mp40"
	base_icon = "mp40"
	weight = 3.97
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/mp40.ogg'
	magazine_type = /obj/item/ammo_magazine/mp40
	good_mags = list(/obj/item/ammo_magazine/mp40)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.1),
		)

	sel_mode = 1
	recoil = 25
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/mp40/mp38
	name = "MP38"
	desc = "早期德国冲锋枪,带有下折叠枪托,使用9mm鲁格弹药."
	weight = 4.10
	full_auto = TRUE
	equiptimer = 13
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.1),
		)

	sel_mode = 1
	recoil = 30
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/mp40/modello38
	name = "MAB 38"
	desc = "Moschetto Automatico Beretta Modello 1938是意大利皇家陆军于1938年采用的冲锋枪,使用9mm鲁格弹药."
	weight = 4.20
	magazine_type = /obj/item/ammo_magazine/mp40/modello38
	good_mags = list(/obj/item/ammo_magazine/mp40/modello38)
	full_auto = TRUE
	equiptimer = 13
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.1),
		)

	sel_mode = 1
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/ermaemp
	name = "Erma-Emp"
	desc = "一种由ERMA工厂生产的早期德国冲锋枪,带有木制枪托,使用9mm鲁格弹药."
	icon_state = "ermaemp"
	item_state = "ermaemp"
	base_icon = "ermaemp"
	weight = 4.25
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/mp40.ogg'
	magazine_type = /obj/item/ammo_magazine/mp40/erma
	good_mags = list(/obj/item/ammo_magazine/mp40,/obj/item/ammo_magazine/mp40/erma)
	full_auto = TRUE
	equiptimer = 14
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.1),
		)

	sel_mode = 1
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/mp40/blyskawica
	name = "Blyskawica"
	desc = "波兰地下国冲锋枪,使用9mm鲁格弹."
	icon_state = "blyskawica"
	item_state = "blyskawica"
	base_icon = "blyskawica"
	weight = 4.12
	equiptimer = 10
	firemodes = list(
		list(name = "automatic",    burst=1.2, burst_delay=1.4),
		)
	sel_mode = 1
	recoil = 25
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/mp40/blyskawica/update_icon()
	..()
	if (ammo_magazine)
		overlays -= mag_image
		mag_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = "blyskawica_mag", pixel_x = mag_x_offset, pixel_y = mag_y_offset)
		overlays += mag_image

/obj/item/weapon/gun/projectile/submachinegun/mp40/mp5
	name = "H&K MP5"
	desc = "德国冲锋枪,使用9mm帕拉贝鲁姆弹."
	icon_state = "mp5"
	item_state = "mp5"
	base_icon = "mp5"
	weight = 2.9
	equiptimer = 8
	fire_sound = 'sound/weapons/guns/fire/MP5.ogg'
	magazine_type = /obj/item/ammo_magazine/mp40/mp5
	good_mags = list(/obj/item/ammo_magazine/mp40/mp5)
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "automatic",	burst=1, burst_delay=1.0),
		)
	sel_mode = 1
	recoil = 20
	accuracy = 3
	scope_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/fg42
	name = "FG42"
	desc = "一款专为伞兵空降步兵研发的德国自动步枪,使用7.92x57毛瑟弹."
	icon_state = "fg42"
	item_state = "fg42"
	base_icon = "fg42"
	weight = 4.2
	caliber = "a792x57"
	fire_sound = 'sound/weapons/guns/fire/mg34.ogg'
	magazine_type = /obj/item/ammo_magazine/fg42
	good_mags = list(/obj/item/ammo_magazine/fg42,/obj/item/ammo_magazine/fg42/small)
	equiptimer = 12
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.4),
		list(name = "automatic",	burst=1, burst_delay=0.4),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE

	recoil = 40
	accuracy = 4

	scope_mounts = list ("swept_back")
	scope_x_offset = 2

/obj/item/weapon/gun/projectile/submachinegun/fg42/scope/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/zf4/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/zf4(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/uzi
	name = "Uzi"
	desc = "以色列冲锋枪,使用9mm帕拉贝鲁姆弹."
	icon_state = "uzi"
	item_state = "uzi"
	base_icon = "uzi"
	caliber = "a9x19"
	weight = 2.1
	equiptimer = 5
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/uzi
	good_mags = list(/obj/item/ammo_magazine/uzi)
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.9),
		list(name = "automatic",	burst=1, burst_delay=0.9),
		)
	sel_mode = 1
	one_handed = TRUE
	recoil = 35
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/mac10
	name = "MAC-10"
	desc = "美国紧凑型自由枪机式冲锋枪,使用9mm帕拉贝鲁姆弹."
	icon_state = "mac10"
	item_state = "mac10"
	base_icon = "mac10"
	weight = 1.7
	equiptimer = 7
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	magazine_type = /obj/item/ammo_magazine/mac10
	good_mags = list(/obj/item/ammo_magazine/mac10)
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.5),
		list(name = "automatic",	burst=1, burst_delay=0.5),
		)
	sel_mode = 1
	one_handed = TRUE
	recoil = 30
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/tec9
	name = "TEC-9"
	desc = "自由枪机式半自动手枪."
	icon = 'icons/obj/guns/automatic.dmi'
	icon_state = "tec-9"
	item_state = "tec-9"
	base_icon = "tec-9"
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/tec9.ogg'
	magazine_type = /obj/item/ammo_magazine/tec9
	good_mags = list(/obj/item/ammo_magazine/tec9)
	weight = 1.3
	equiptimer = 8
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.3),
		list(name = "automatic",	burst=1, burst_delay=0.3),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS
	one_handed = TRUE
	recoil = 25
	accuracy = 5

/obj/item/weapon/gun/projectile/submachinegun/skorpion
	name = "Skorpion"
	desc = "捷克斯洛伐克冲锋手枪,使用9mm帕拉贝鲁姆弹."
	icon_state = "skorpion"
	item_state = "skorpion"
	base_icon = "skorpion"
	caliber = "a9x19"
	weight = 1.1
	equiptimer = 6
	fire_sound = 'sound/weapons/guns/fire/9mm.ogg'
	magazine_type = /obj/item/ammo_magazine/skorpion
	good_mags = list(/obj/item/ammo_magazine/skorpion)
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.8),
		list(name = "automatic",	burst=1, burst_delay=0.8),
		)
	sel_mode = 1
	one_handed = TRUE
	recoil = 30
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/greasegun
	name = "M3A1 SMG"
	desc = "美国简易冲锋枪,使用.45 ACP弹."
	icon_state = "greasegun"
	item_state = "greasegun"
	base_icon = "greasegun"
	weight = 3.6
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/M3A1.ogg'
	magazine_type = /obj/item/ammo_magazine/greasegun
	good_mags = list(/obj/item/ammo_magazine/greasegun)
	full_auto = TRUE
	slot_flags = SLOT_BELT|SLOT_SHOULDER
	equiptimer = 7
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.4),
		)
	recoil = 10
	accuracy = 10

	sel_mode = 1
	recoil = 25
	accuracy = 5

/obj/item/weapon/gun/projectile/submachinegun/thompson
	name = "Thompson M1A1"
	desc = "美国冲锋枪,使用.45 ACP弹."
	icon_state = "thompson"
	item_state = "thompson"
	base_icon = "thompson"
	weight = 3.6
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/Thompson.ogg'
	magazine_type = /obj/item/ammo_magazine/thompson
	good_mags = list(/obj/item/ammo_magazine/thompson, /obj/item/ammo_magazine/tommy)
	full_auto = TRUE
	slot_flags = SLOT_BELT|SLOT_SHOULDER
	equiptimer = 8
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.2),
		)

	sel_mode = 1

/obj/item/weapon/gun/projectile/submachinegun/tommy
	name = "Thompson M1928"
	desc = "美国冲锋枪,使用.45 ACP弹."
	icon_state = "tommygun"
	item_state = "thompson"
	base_icon = "tommygun"
	weight = 3.6
	caliber = "a45acp"
	fire_sound = 'sound/weapons/guns/fire/Thompson.ogg'
	magazine_type = /obj/item/ammo_magazine/tommy
	good_mags = list(/obj/item/ammo_magazine/thompson, /obj/item/ammo_magazine/tommy)
	full_auto = TRUE
	slot_flags = SLOT_BELT|SLOT_SHOULDER
	equiptimer = 8
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.0),
		)

	sel_mode = 1

/obj/item/weapon/gun/projectile/submachinegun/type100
	name = "Type-100"
	desc = "日本冲锋枪,使用8x22mm南部弹."
	icon_state = "type100"
	item_state = "type100"
	base_icon = "type100"
	weight = 3.97
	attachment_slots = ATTACH_BARREL
	caliber = "c8mmnambu"
	fire_sound = 'sound/weapons/guns/fire/Type100.ogg'
	magazine_type = /obj/item/ammo_magazine/type100
	good_mags = list(/obj/item/ammo_magazine/type100)
	full_auto = TRUE
	equiptimer = 12
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.3),
		)

	sel_mode = 1
	recoil = 35
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/sten
	name = "Sten MK II"
	desc = "英国冲锋枪,使用9x19帕拉贝鲁姆弹."
	icon_state = "sten2"
	item_state = "sten2"
	base_icon = "sten2"
	weight = 3.2
	attachment_slots = ATTACH_BARREL
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/Thompson.ogg'
	magazine_type = /obj/item/ammo_magazine/sten2
	good_mags = list(/obj/item/ammo_magazine/sten2)
	full_auto = TRUE
	slot_flags = SLOT_SHOULDER
	equiptimer = 8
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.25),
		)

	sel_mode = 1
	recoil = 25
	accuracy = 5

/obj/item/weapon/gun/projectile/submachinegun/sten/stv
	name = "Sten MK V"
	desc = "英国冲锋枪,使用9x19帕拉贝鲁姆弹."
	icon_state = "sten2"
	item_state = "sten2"
	base_icon = "sten2"
	weight = 3.1
	attachment_slots = ATTACH_BARREL|ATTACH_UNDER
	equiptimer = 6
	recoil = 25
	accuracy = 4

/obj/item/weapon/gun/projectile/submachinegun/ppsh
	name = "PPSh-41"
	desc = "苏联冲锋枪,通常配备弹鼓.使用7.62x25mm托卡列夫弹."
	icon_state = "ppsh"
	item_state = "ppsh"
	base_icon = "ppsh"
	caliber = "a762x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/c762x25_ppsh
	good_mags = list(/obj/item/ammo_magazine/c762x25_ppsh, /obj/item/ammo_magazine/c762x25_pps)
	weight = 3.63
	equiptimer = 14
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "automatic",	burst=1, burst_delay=0.7),
		)
	sel_mode = 1
	recoil = 20
	accuracy = 4
	barrel_x_offset = 12
	barrel_y_offset = 14

	mag_x_offset = -1
	mag_y_offset = -1

/obj/item/weapon/gun/projectile/submachinegun/ppsh/chinese
	name = "Type 50"
	desc = "标志性苏联冲锋枪的中国仿制型.使用7.62x25mm托卡列夫弹."
	weight = 3.61
	equiptimer = 11

/obj/item/weapon/gun/projectile/submachinegun/pps
	name = "PPS-43"
	desc = "苏联简易冲锋枪.使用7.62x25mm托卡列夫弹."
	icon_state = "pps"
	item_state = "pps"
	base_icon = "pps"
	caliber = "a762x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	full_auto = TRUE
	magazine_type = /obj/item/ammo_magazine/c762x25_pps
	good_mags = list(/obj/item/ammo_magazine/c762x25_ppsh, /obj/item/ammo_magazine/c762x25_pps)
	weight = 3.04
	equiptimer = 10
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.0),
		)
	recoil = 25
	accuracy = 4
	sel_mode = 1
	mag_x_offset = 4
	mag_y_offset = -2
	barrel_y_offset = 15
	barrel_y_offset = 16

/obj/item/weapon/gun/projectile/submachinegun/ppd
	name = "PPD-40"
	desc = "苏联早期冲锋枪.使用7.62x25mm托卡列夫弹."
	icon_state = "ppd"
	item_state = "ppd"
	base_icon = "ppd"
	caliber = "a762x25"
	fire_sound = 'sound/weapons/guns/fire/762x25.ogg'
	magazine_type = /obj/item/ammo_magazine/c762x25_ppsh
	good_mags = list(/obj/item/ammo_magazine/c762x25_ppsh, /obj/item/ammo_magazine/c762x25_pps)
	weight = 3.7
	equiptimer = 15
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "automatic",	burst=1, burst_delay=1.0),
		)
	recoil = 20
	accuracy = 4
	sel_mode = 1

	barrel_x_offset = 14
	barrel_y_offset = 16

	mag_x_offset = 2
	mag_y_offset = -1

/obj/item/weapon/gun/projectile/submachinegun/ak47
	name = "AKM"
	desc = "标志性苏联突击步枪,使用7.62x39mm弹."
	icon_state = "ak47"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	item_state = "ak47"
	base_icon = "ak47"
	caliber = "a762x39"
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	magazine_type = /obj/item/ammo_magazine/ak47
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/drum, /obj/item/ammo_magazine/ak47/makeshift)
	weight = 3.47
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.3),
		list(name = "automatic",	burst=1, burst_delay=1.3),
		)
	stat = "rifle"
	sel_mode = 1
	attachment_slots = ATTACH_UNDER|ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	recoil = 40
	accuracy = 2
	scope_mounts = list ("dovetail")
	under_mounts = list ("gp25_mount")
	under_x_offset = 1
	under_y_offset = 1
	scope_x_offset = -2
	scope_y_offset = -2

/obj/item/weapon/gun/projectile/submachinegun/ak47/gold
	name = "gold-plated AKM"
	desc = "标志性苏联突击步枪,使用7.62x39mm弹.这一把镀了金.看起来非常昂贵."
	icon_state = "ak47gold"
	item_state = "ak47gold"
	base_icon = "ak47gold"

/obj/item/weapon/gun/projectile/submachinegun/ak47/chinese
	name = "Type 56 Assault Rifle"
	desc = "中国7.62x39mm步枪.它是苏联设计的AK-47的仿制型."
/obj/item/weapon/gun/projectile/submachinegun/ak47/akms
	name = "AKMS"
	desc = "标志性苏联突击步枪,使用7.62x39mm弹.这一把配有钢丝下折叠枪托."
	slot_flags = SLOT_SHOULDER
	icon_state = "akms"
	item_state = "akms"
	base_icon = "akms"
	var/folded = FALSE
	weight = 3

/obj/item/weapon/gun/projectile/submachinegun/ak47/akms/update_icon()
	..()
	if (folded)
		icon_state = "akms_folded"
	else
		icon_state = "akms"

/obj/item/weapon/gun/projectile/submachinegun/ak47/akms/verb/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		recoil *= 1.5
		icon_state = "[base_icon]_folded"
		to_chat(usr, "You extend the stock on \the [src].")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		recoil /= 1.5
		folded = TRUE
		icon_state = "[base_icon]"
		to_chat(usr, "You collapse the stock on \the [src].")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak47/akms/proc/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
	else
		slot_flags = SLOT_SHOULDER

/obj/item/weapon/gun/projectile/submachinegun/ak74
	name = "AK-74"
	desc = "苏联突击步枪,使用5.45x39mm弹."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "ak74"
	item_state = "ak74"
	base_icon = "ak74"
	caliber = "a545x39"
	fire_sound = 'sound/weapons/guns/fire/AK74.ogg'
	magazine_type = /obj/item/ammo_magazine/ak74
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak47/drum, /obj/item/ammo_magazine/ak74/ak74m)
	weight = 3.07
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	stat = "rifle"
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.5),
		list(name = "automatic",	burst=1, burst_delay=1.5),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	recoil = 30
	accuracy = 3
	scope_mounts = list ("dovetail")
	under_mounts = list ("gp25_mount")
	under_x_offset = 1
	under_y_offset = 1
	scope_x_offset = -2
	scope_y_offset = -2

/obj/item/weapon/gun/projectile/submachinegun/ak74/grenade_launcher/New()
	..()
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/GL = new/obj/item/weapon/gun/launcher/grenade/underslung/gp25/(src)
	GL.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/ak74/pso1/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74
	name = "AKS-74"
	desc = "苏联突击步枪,使用5.45x39mm弹,配有折叠枪托."
	slot_flags = SLOT_SHOULDER
	icon_state = "aks74"
	item_state = "aks74"
	base_icon = "aks74"
	var/folded = FALSE
	weight = 2.95

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/update_icon()
	..()
	if (folded)
		icon_state = "[base_icon]_folded"
	else
		icon_state = "[base_icon]"

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/verb/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		recoil *= 1.5
		icon_state = "[base_icon]_folded"
		to_chat(usr, "You extend the stock on \the [src].")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		recoil /= 1.5
		folded = TRUE
		icon_state = "[base_icon]"
		to_chat(usr, "You collapse the stock on \the [src].")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/proc/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
	else
		slot_flags = SLOT_SHOULDER

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u
	name = "AKS-74U"
	desc = "苏联紧凑型突击步枪,使用5.45x39mm弹,配有折叠枪托."
	slot_flags = SLOT_SHOULDER
	icon_state = "aks74u"
	item_state = "aks74u"
	base_icon = "aks74u"
	folded = FALSE
	weight = 2.7
	damage_modifier = 0.95
	equiptimer = 12
	recoil = 40
	accuracy = 4

	barrel_x_offset = 12
	barrel_y_offset = 12

	scope_x_offset = 1
	under_mounts = list ()

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/update_icon()
	..()
	if (folded)
		icon_state = "[base_icon]_folded"
	else
		icon_state = "[base_icon]"

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		recoil *= 1.5
		icon_state = "[base_icon]_folded"
		to_chat(usr, "You extend the stock on \the [src].")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		recoil /= 1.5
		folded = TRUE
		icon_state = "[base_icon]"
		to_chat(usr, "You collapse the stock on \the [src].")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
	else
		slot_flags = SLOT_SHOULDER

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso
	name = "AKS-74U SpecOps"
	desc = "AK-74的苏联突击卡宾枪版本,使用5.45x39mm弹,配有折叠枪托.这一把配有用于安装配件的皮卡汀尼导轨."
	slot_flags = SLOT_SHOULDER
	icon_state = "aks74uso"
	item_state = "aks74uso"
	base_icon = "aks74uso"
	folded = FALSE
	weight = 2.65
	damage_modifier = 0.95
	equiptimer = 12
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	scope_mounts = list ("dovetail", "picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso/update_icon()
	..()
	if (folded)
		icon_state = "[base_icon]_folded"
	else
		icon_state = "[base_icon]"

/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso/kgb
	folded = TRUE
	weight = 2.6
	damage_modifier = 0.98
	equiptimer = 10
	recoil = 30
	accuracy = 3


/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso/kgb/New()
	..()

	var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
	SP.attached(null,src,TRUE)


	var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
	FP.attached(null,src,TRUE)

	var/obj/item/weapon/attachment/silencer/SL = new/obj/item/weapon/attachment/silencer(src)
	SL.attached(null,src,TRUE)


/obj/item/weapon/gun/projectile/submachinegun/ak74/aks74/aks74u/aks74uso/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		recoil *= 1.5
		icon_state = "[base_icon]_folded"
		to_chat(usr, "You extend the stock on \the [src].")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		recoil /= 1.5
		folded = TRUE
		icon_state = "[base_icon]"
		to_chat(usr, "You collapse the stock on \the [src].")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/ak74m
	name = "AK-74M"
	desc = "俄罗斯突击步枪,使用5.45x39mm弹."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "ak74m"
	item_state = "ak74m"
	base_icon = "ak74m"
	caliber = "a545x39"
	fire_sound = 'sound/weapons/guns/fire/AK74.ogg'
	magazine_type = /obj/item/ammo_magazine/ak74/ak74m
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak74/drum, /obj/item/ammo_magazine/ak74/ak74m)
	weight = 3.07
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	stat = "rifle"
	recoil = 30
	accuracy = 3
	scope_mounts = list ("dovetail", "picatinny")
	under_mounts = list ("picatinny", "gp25_mount")
	under_x_offset = 1
	under_y_offset = 1
	scope_x_offset = -2
	scope_y_offset = -2

/obj/item/weapon/gun/projectile/submachinegun/ak74m/ak12
	name = "AK-12"
	desc = "第五代现代AK改进型,使用5.45x39mm弹."
	icon_state = "ak12"
	item_state = "ak12"
	base_icon = "ak12"
	caliber = "a545x39"
	weight = 3.05
	magazine_type = /obj/item/ammo_magazine/ak74
	good_mags = list(/obj/item/ammo_magazine/rpk74, /obj/item/ammo_magazine/rpk74/drum, /obj/item/ammo_magazine/ak74, /obj/item/ammo_magazine/ak74/drum, /obj/item/ammo_magazine/ak74/ak74m)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	equiptimer = 12
	sel_mode = 1
	recoil = 25
	accuracy = 2
	scope_x_offset = -2
	barrel_x_offset = 15
	barrel_y_offset = 17

/obj/item/weapon/gun/projectile/submachinegun/ak74m/ak12/ak15
	name = "AK-15"
	desc = "第五代现代AK改进型,使用7.62x39mm弹."
	icon_state = "ak12"
	item_state = "ak12"
	base_icon = "ak12"
	caliber = "a762x39"
	weight = 3.07
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	magazine_type = /obj/item/ammo_magazine/ak47
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/drum, /obj/item/ammo_magazine/ak47/makeshift)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	equiptimer = 12
	sel_mode = 1
	recoil = 30
	accuracy = 2

/obj/item/weapon/gun/projectile/submachinegun/m16
	name = "M16A1"
	desc = "美国突击步枪,使用5.56x45mm弹."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "m16"
	item_state = "m16"
	base_icon = "m16"
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	magazine_type = /obj/item/ammo_magazine/m16
	good_mags = list(/obj/item/ammo_magazine/m16, /obj/item/ammo_magazine/m16/mag5_60, /obj/item/ammo_magazine/ar15)
	weight = 3.07
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "automatic",	burst=1, burst_delay=1.1),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE
	recoil = 30
	accuracy = 3
	barrel_x_offset = 16
	barrel_y_offset = 16
	scope_x_offset = -3
	scope_mounts = list ("picatinny")
	under_mounts = list ("m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/m16/ar15
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	name = "AR-15"
	desc = "阿玛莱特AR-15的民用市场版本,仅支持单发.配有用于安装多种配件的导轨."
	base_icon = "ar15"
	icon_state = "ar15"
	item_state = "ar15"
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.8),
	)
	recoil = 30
	accuracy = 3
	scope_x_offset = 0
	scope_y_offset = -1
	mag_x_offset = 1
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/ar10
	name = "AR-10"
	desc = "阿玛莱特战斗步枪,使用7.62x51mm弹."
	icon_state = "ar10"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	item_state = "m16"
	base_icon = "ar10"
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/battle_rifle.ogg'
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	magazine_type = /obj/item/ammo_magazine/ar10
	good_mags = list(/obj/item/ammo_magazine/ar10)
	weight = 3.07
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	recoil = 40
	accuracy = 3
	barrel_x_offset = 16
	barrel_y_offset = 16
	under_mounts = list ("picatinny", "m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/m16/commando
	name = "XM177E2"
	desc = "AR-15/M16的卡宾枪版本,使用5.56x45mm弹."
	icon_state = "m4"
	item_state = "m4"
	base_icon = "m4"
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	magazine_type = /obj/item/ammo_magazine/m16
	weight = 3.07
	equiptimer = 9
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "automatic", burst=1, burst_delay=1.1),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	barrel_x_offset = 13
	barrel_y_offset = 15

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a2
	name = "M16A2"
	base_icon = "m16"
	icon_state = "m16"
	desc = "M16的现代化版本,以点射取代全自动."
	full_auto = FALSE
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "3-round-burst", burst=3, burst_delay=1.5),
	)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	recoil = 25
	under_mounts = list ("picatinny", "m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a2/grenade_launcher/New()
	..()
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/GL = new/obj/item/weapon/gun/launcher/grenade/underslung/m203(src)
	GL.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a2/att/New()
	..()
	var/scope_type = rand(1,2)
	switch(scope_type)
		if (1)
			var/obj/item/weapon/attachment/scope/adjustable/advanced/reddot/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
			SP.attached(null,src,TRUE)
		if (2)
			var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog(src)
			SP.attached(null,src,TRUE)
	if (prob(50))
		var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
		FP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a4
	name = "M16A4"
	base_icon = "m16a4"
	icon_state = "m16a4"
	desc = "M16的现代化版本,配有带导轨的上机匣和护木."
	full_auto = FALSE
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "3-round-burst",	burst=3, burst_delay=1.5),
	)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_UNDER
	recoil = 25
	scope_x_offset = 0
	scope_y_offset = 0
	under_mounts = list ("picatinny", "m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a4/grenade_launcher/New()
	..()
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/GL = new/obj/item/weapon/gun/launcher/grenade/underslung/m203(src)
	GL.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m16/m16a4/att/New()
	..()
	if (prob(50))
		var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
		SP.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog(src)
		SP.attached(null,src,TRUE)
		var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
		FP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4
	name = "M4卡宾枪"
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4mws
	name = "M4 MWS"
	base_icon = "m4mws"
	icon_state = "m4mws"
	desc = "适配模块化武器系统的M4卡宾枪版本."
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	under_mounts = list ("picatinny")
	scope_x_offset = 0
	scope_y_offset = 0

/obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4mws/att/New()
	..()
	if (prob(50))
		var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
		SP.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog(src)
		SP.attached(null,src,TRUE)
		var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
		FP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m16/commando/m4mws/fbi/New()
	..()

	var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/SP = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
	SP.attached(null,src,TRUE)


	var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
	FP.attached(null,src,TRUE)

	var/obj/item/weapon/attachment/silencer/SL = new/obj/item/weapon/attachment/silencer(src)
	SL.attached(null,src,TRUE)
	
/obj/item/weapon/gun/projectile/submachinegun/m14
	name = "M14"
	desc = "美国战斗步枪, 发射7.62x51mm弹药."
	icon = 'icons/obj/guns/rifles.dmi'
	icon_state = "m14"
	item_state = "m14"
	base_icon = "m14"
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/M14Alt.ogg'
	magazine_type = /obj/item/ammo_magazine/m14
	good_mags = list(/obj/item/ammo_magazine/m14)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	weight = 3.6
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	recoil = 40
	accuracy = 3
	scope_x_offset = 0
	scope_y_offset = -2
	barrel_x_offset = 14
	barrel_y_offset = 16
	scope_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/m14/sniper/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m14/sniper/m21
	name = "M21 SWS"
	desc = "美国狙击步枪, 发射7.62x51mm弹药."
	sel_mode = 1
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.6),
		)
	recoil = 40
	accuracy = 2

/obj/item/weapon/gun/projectile/submachinegun/g3
	name = "H&K G3"
	desc = "德国战斗步枪, 发射7.62x51mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "g3"
	item_state = "g3"
	base_icon = "g3"
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/battle_rifle.ogg'
	magazine_type = /obj/item/ammo_magazine/hk
	good_mags = list(/obj/item/ammo_magazine/hk)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	weight = 4.4
	equiptimer = 12
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	recoil = 45
	accuracy = 3

	mag_x_offset = 2
	mag_y_offset = 3

/obj/item/weapon/gun/projectile/submachinegun/fal
	name = "FN Fal"
	desc = "比利时战斗步枪, 发射7.62x51mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "fal"
	item_state = "fal"
	base_icon = "fal"
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/fnfal.ogg'
	magazine_type = /obj/item/ammo_magazine/fal
	good_mags = list(/obj/item/ammo_magazine/fal)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	weight = 3.8
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "automatic",	burst=1, burst_delay=1.0),
	)
	sel_mode = 1
	recoil = 45
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/scarl
	name = "FN SCAR-L"
	desc = "比利时突击步枪, 发射5.56x45mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "scar"
	item_state = "scar"
	base_icon = "scar"
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	magazine_type = /obj/item/ammo_magazine/m16
	good_mags = list(/obj/item/ammo_magazine/m16, /obj/item/ammo_magazine/m16/mag5_60, /obj/item/ammo_magazine/ar15)
	weight = 3
	equiptimer = 10
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.3),
		list(name = "automatic",	burst=1, burst_delay=1.3),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	recoil = 35
	accuracy = 3
	barrel_x_offset = 16
	barrel_y_offset = 16
	mag_x_offset = 2
	mag_y_offset = 3
	scope_mounts = list ("picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/scarh
	name = "FN SCAR-H"
	icon_state = "scar"
	item_state = "scar"
	base_icon = "scar"
	desc = "比利时设计的自动步枪, 发射7.62x51mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/M14.ogg'
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	magazine_type = /obj/item/ammo_magazine/scarh
	good_mags = list(/obj/item/ammo_magazine/scarh)
	weight = 3.5
	equiptimer = 11
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER|ATTACH_BARREL
	recoil = 45
	accuracy = 2
	barrel_x_offset = 16
	barrel_y_offset = 16
	scope_mounts = list ("picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/ar12
	name = "AR-12"
	icon_state = "ar12"
	item_state = "ar12"
	base_icon = "ar12"
	desc = "AR-15风格的弹匣供弹霰弹枪, 使用12号口径."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	caliber = "12gauge"
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	magazine_type = /obj/item/ammo_magazine/ar12
	good_mags = list(/obj/item/ammo_magazine/ar12)
	shake_strength = 1
	weight = 3.5
	equiptimer = 11
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "3-round-burst",	burst=3, burst_delay=1.5),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	recoil = 50
	accuracy = 2
	attachment_slots = ATTACH_BARREL|ATTACH_IRONSIGHTS|ATTACH_UNDER
	scope_mounts = list ("picatinny")
	barrel_y_offset = 17
	scope_x_offset = -1
	scope_y_offset = 1
	under_x_offset = 3
	under_y_offset = 3

/obj/item/weapon/gun/projectile/submachinegun/hk417
	name = "HK417"
	desc = "现代德国战斗步枪, 发射7.62x51mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "hk417"
	item_state = "hk417"
	base_icon = "hk417"
	caliber = "a762x51"
	fire_sound = 'sound/weapons/guns/fire/battle_rifle.ogg'
	magazine_type = /obj/item/ammo_magazine/scarh
	good_mags = list(/obj/item/ammo_magazine/scarh)
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	weight = 3.8
	equiptimer = 13
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "3-round-burst",	burst=3, burst_delay=1.5),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	recoil = 35
	accuracy = 3
	mag_x_offset = -2
	mag_y_offset = -3
	barrel_x_offset = 15
	scope_x_offset = 1
	scope_mounts = list ("picatinny")
	under_mounts = list ("picatinny", "m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/hk417/att/New()
	..()
	if (prob(50))
		var/obj/item/weapon/attachment/scope/adjustable/advanced/holographic/HL = new/obj/item/weapon/attachment/scope/adjustable/advanced/holographic(src)
		HL.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog/AC = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog(src)
		AC.attached(null,src,TRUE)
	if (prob(50))
		var/obj/item/weapon/attachment/under/laser/LS = new/obj/item/weapon/attachment/under/laser(src)
		LS.attached(null,src,TRUE)
	else
		var/obj/item/weapon/attachment/under/foregrip/FP = new/obj/item/weapon/attachment/under/foregrip(src)
		FP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/p90
	name = "P90"
	desc = "紧凑型高射速防御武器, 发射5.7x28mm弹药."
	icon_state = "p90"
	item_state = "p90"
	base_icon = "p90"
	caliber = "a57x28"
	fire_sound = 'sound/weapons/guns/fire/PDW.ogg'
	magazine_type = /obj/item/ammo_magazine/p90
	good_mags = list(/obj/item/ammo_magazine/p90)
	attachment_slots = ATTACH_BARREL|ATTACH_IRONSIGHTS|ATTACH_SCOPE
	weight = 2.3
	equiptimer = 8
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.8),
		list(name = "automatic",	burst=1, burst_delay=0.5),
	)
	sel_mode = 1
	recoil = 10
	accuracy = 2

	scope_mounts = list ("picatinny")

	scope_x_offset = 6
	scope_y_offset = 8

	barrel_x_offset = 12
	barrel_y_offset = 12

/obj/item/weapon/gun/projectile/submachinegun/vector
	name = "Kriss Vector"
	desc = "采用非常规延迟反冲系统结合直列设计的紧凑型枪械, 可减少感知后坐力和枪口上跳. 发射9mm弹药"
	icon_state = "victor"
	item_state = "victor"
	base_icon = "victor"
	caliber = "a9x19"
	fire_sound = 'sound/weapons/guns/fire/pistol.ogg'
	magazine_type = /obj/item/ammo_magazine/glock17
	good_mags = list(/obj/item/ammo_magazine/glock17, /obj/item/ammo_magazine/glock17/vector)
	attachment_slots = ATTACH_BARREL|ATTACH_IRONSIGHTS|ATTACH_UNDER|ATTACH_SCOPE
	weight = 3
	equiptimer = 4
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.0),
		list(name = "3-round-burst",	burst=3, burst_delay=0.8),
		list(name = "automatic",	burst=1, burst_delay=0.6),
	)
	sel_mode = 1
	recoil = 20
	accuracy = 2
	scope_x_offset = 6
	scope_y_offset = 5
	under_x_offset = 6
	under_y_offset = 4
	scope_mounts = list ("picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/qbz95
	name = "QBZ-95"
	icon_state = "qbz95"
	item_state = "qbz95"
	base_icon = "qbz95"
	desc = "中国设计的无托突击步枪, 发射5.8x42mm弹药."
	icon = 'icons/obj/guns/wip.dmi'
	caliber = "a58x42"
	fire_sound = 'sound/weapons/guns/fire/M14.ogg'
	reload_sound = 'sound/weapons/guns/interact/AR15Reload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AR15Unload.ogg'
	magazine_type = /obj/item/ammo_magazine/qbz95
	good_mags = list(/obj/item/ammo_magazine/qbz95)
	weight = 3.5
	equiptimer = 11
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.2),
		list(name = "automatic",	burst=1, burst_delay=1.2),
	)
	sel_mode = 1
	attachment_slots = ATTACH_BARREL|ATTACH_IRONSIGHTS|ATTACH_UNDER
	recoil = 25
	accuracy = 3
	scope_mounts = list ("picatinny")
	under_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/submachinegun/makeshiftak47
	name = "Makeshift AK-47"
	desc = "看起来有人在\"UpGRaDinG\"他们的AK时做得非常糟糕."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "makeshiftak"
	item_state = "makeshiftak"
	base_icon = "makeshiftak"
	caliber = "a762x39"
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	magazine_type = /obj/item/ammo_magazine/ak47/makeshift
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/drum, /obj/item/ammo_magazine/ak47/makeshift)
	weight = 3.8
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "automatic",	burst=1, burst_delay=1.7),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	recoil = 50
	accuracy = 5
	under_mounts = list ("gp25_mount")

/obj/item/weapon/gun/projectile/submachinegun/vz58
	name = "VZ-58"
	desc = "捷克斯洛伐克突击步枪, 发射7.62x39mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "vz58"
	item_state = "vz58"
	base_icon = "vz58"
	caliber = "a762x39"
	fire_sound = 'sound/weapons/guns/fire/AKM.ogg'
	reload_sound = 'sound/weapons/guns/interact/AKReload.ogg'
	unload_sound = 'sound/weapons/guns/interact/AKUnload.ogg'
	magazine_type = /obj/item/ammo_magazine/ak47
	good_mags = list(/obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/drum,, /obj/item/ammo_magazine/ak47/makeshift)
	weight = 2.93
	equiptimer = 12
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.3),
		list(name = "automatic",	burst=1, burst_delay=1.3),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	recoil = 40
	accuracy = 2
	mag_x_offset = 2
	under_mounts = list ("gp25_mount")

/obj/item/weapon/gun/projectile/submachinegun/vz58/white
	name = "White VZ-58"
	desc = "捷克斯洛伐克突击步枪, 发射7.62x39mm弹药. 此型号配有桦木枪托和护木."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "white_vz58"
	item_state = "white_vz58"
	base_icon = "white_vz58"

/obj/item/weapon/gun/projectile/submachinegun/vz58/black
	name = "Black VZ-58"
	desc = "捷克斯洛伐克突击步枪, 发射7.62x39mm弹药. 此型号配有黑色枪托和护木."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "black_vz58"
	item_state = "black_vz58"
	base_icon = "black_vz58"

/obj/item/weapon/gun/projectile/submachinegun/c7
	name = "C7"
	desc = "加拿大柯尔特C7突击步枪, 发射5.56x45mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "c7"
	item_state = "c7"
	base_icon = "c7"
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	magazine_type = /obj/item/ammo_magazine/m16
	good_mags = list(/obj/item/ammo_magazine/m16)
	weight = 2.98
	equiptimer = 13
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "automatic",	burst=1, burst_delay=1.1),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_UNDER
	recoil = 30
	accuracy = 2
	scope_mounts = list ("picatinny")
	under_mounts = list ("m203_mount")

/obj/item/weapon/gun/projectile/submachinegun/c7/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/c7/grenade_launcher/New()
	..()
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/GL = new/obj/item/weapon/gun/launcher/grenade/underslung/m203(src)
	GL.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/c7/c8
	name = "C8"
	desc = "加拿大柯尔特C8突击步枪, 发射5.56x45mm弹药."
	equiptimer = 11
	icon_state = "c8"
	item_state = "c8"
	base_icon = "c8"

/obj/item/weapon/gun/projectile/submachinegun/c7/arid
	icon_state = "c7_arid"
	item_state = "c7_arid"
	base_icon = "c7_arid"

/obj/item/weapon/gun/projectile/submachinegun/c7/arid/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan/arid/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan/arid(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/c7/winter
	icon_state = "c7_winter"
	item_state = "c7_winter"
	base_icon = "c7_winter"

/obj/item/weapon/gun/projectile/submachinegun/c7/winter/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan/winter/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/elcan/winter(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/m2carbine
	name = "M2 carbine"
	desc = "美国选射卡宾枪, 使用7.62x33mm (无缘.30卡宾) 弹药, 采用外置弹匣."
	icon_state = "mcar"
	item_state = "mcar"
	base_icon = "mcar"
	caliber = "a762x33"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	magazine_type = /obj/item/ammo_magazine/m1carbine
	good_mags = list(/obj/item/ammo_magazine/m1carbine, /obj/item/ammo_magazine/m1carbine/big)
	weight = 3.4
	equiptimer = 11
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=2.0),
		list(name = "automatic",	burst=1, burst_delay=2.0),
	)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	recoil = 35
	accuracy = 3

/obj/item/weapon/gun/projectile/submachinegun/srm
	name = "SR-3"
	desc = "俄罗斯紧凑型卡宾枪, 发射9x39mm弹药, 配有紧凑枪托."
	slot_flags = SLOT_SHOULDER
	icon_state = "srm"
	item_state = "srm"
	base_icon = "srm"
	icon = 'icons/obj/guns/assault_rifles.dmi'
	caliber = "a9x39"
	ammo_type = /obj/item/ammo_casing/a9x39
	magazine_type = /obj/item/ammo_magazine/srm
	good_mags = list(/obj/item/ammo_magazine/srm,/obj/item/ammo_magazine/srm/srms,/obj/item/ammo_magazine/vintorez)
	equiptimer = 12
	var/folded = FALSE
	weight = 2
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=2.0),
		list(name = "automatic", burst=1, burst_delay=2.0),
	)
	sel_mode = 1
	recoil = 30
	accuracy = 3
	barrel_x_offset = 10
	barrel_y_offset = 11
	scope_x_offset = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	scope_mounts = list ("dovetail")

/obj/item/weapon/gun/projectile/submachinegun/srm/New()
	..()
	var/obj/item/weapon/attachment/silencer/rifle/srm/SL = new/obj/item/weapon/attachment/silencer/rifle/srm(src)
	SL.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/submachinegun/srm/verb/fold()
	set name = "Toggle Stock"
	set category = null
	set src in usr
	set name = "Toggle Stock"
	set category = null
	set src in usr
	if (folded)
		folded = FALSE
		recoil *= 1.5
		icon_state = "[base_icon]_folded"
		to_chat(usr, "You extend the stock on \the [src].")
		equiptimer = 15
		set_stock()
		update_icon()
	else
		recoil /= 1.5
		folded = TRUE
		icon_state = "[base_icon]"
		to_chat(usr, "You collapse the stock on \the [src].")
		equiptimer = 7
		set_stock()
		update_icon()

/obj/item/weapon/gun/projectile/submachinegun/srm/proc/set_stock()
	if (folded)
		slot_flags = SLOT_SHOULDER|SLOT_BELT
	else
		slot_flags = SLOT_SHOULDER

/obj/item/weapon/gun/projectile/submachinegun/l85a2
	name = "L85A2"
	desc = "L85A2 (又称SA80) 步枪是英国自1987年起使用的制式步枪. 采用无托设计, 是一款非常紧凑的步枪, 同时仍拥有相对较长的枪管. 发射5.56x45mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "l85a2"
	item_state = "m16"
	base_icon = "m16"
	caliber = "l85a2"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	stat = "rifle"
	magazine_type = /obj/item/ammo_magazine/m16
	good_mags = list(/obj/item/ammo_magazine/m16)
	weight = 4.98
	equiptimer = 15
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "automatic", burst=1, burst_delay=1.1),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	mag_x_offset = -2
	mag_y_offset = -4

/obj/item/weapon/gun/projectile/submachinegun/aug
	name = "Steyr AUG"
	desc = "斯泰尔AUG是奥地利无托突击步枪, 由斯泰尔-戴姆勒-普赫于1960年代设计. 发射5.56×45mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "aug"
	item_state = "m16"
	base_icon = "aug"
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	stat = "rifle"
	magazine_type = /obj/item/ammo_magazine/m16
	good_mags = list(/obj/item/ammo_magazine/m16)
	weight = 3.6
	equiptimer = 14
	slot_flags = SLOT_SHOULDER
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=1.1),
		list(name = "automatic", burst=1, burst_delay=1.1),
		)
	sel_mode = 1
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	mag_x_offset = -5
	mag_y_offset = -3

/////////////////////////////////*FALLOUT*////////////////////////////////////////////

/obj/item/weapon/gun/projectile/submachinegun/m16/fallout/service_rifle
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	name = "Service Rifle"
	desc = "一种战前步枪设计, 被新加州共和国用作标准装备."
	icon_state = "service_rifle"
	item_state = "service_rifle"
	base_icon = "service_rifle"
	full_auto = FALSE
	firemodes = list(
		list(name = "semiauto",	burst=1, burst_delay=0.7),
		)
	magazine_type = /obj/item/ammo_magazine/service_rifle
	good_mags = list(/obj/item/ammo_magazine/service_rifle, /obj/item/ammo_magazine/m16)