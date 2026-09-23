/obj/item/weapon/gun/projectile/semiautomatic
	maxhealth = 60
	fire_sound = 'sound/weapons/guns/fire/rifle.ogg'
	icon = 'icons/obj/guns/rifles.dmi'
	// pistol accuracy, rifle skill & decent KD chance
	KD_chance = KD_CHANCE_MEDIUM
	stat = "rifle"
	load_delay = 5
	recoil = 60
	accuracy = 2


	gtype = "rifle"

	var/jammed_until = -1
	var/jamcheck = 0
	var/last_fire = -1
	base_icon = "semiautomatic"
	equiptimer = 12
	gun_safety = TRUE
	reload_sound = 'sound/weapons/guns/interact/semiauto_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/semiauto_magout.ogg'

/obj/item/weapon/gun/projectile/semiautomatic/special_check(mob/user)
	if (gun_safety && safetyon)
		to_chat(user, "<span class='warning'>保险开启时你无法发射\the [src]!</span>")
		return FALSE
	if (!user.has_empty_hand(both = FALSE))
		to_chat(user, "<span class='warning'>你需要双手才能发射\the [src]!</span>")
		return FALSE
	if (jammed_until > world.time)
		to_chat(user, "<span class = 'danger'>\The [src]卡壳了! 在排除故障前你无法发射它.</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/semiautomatic/handle_post_fire()
	..()
	var/reverse_health_percentage = (1-(health/maxhealth)+0.25)*100
	if (world.time - last_fire > 50)
		jamcheck = 0
	else
		jamcheck += 0.4

	if (prob(jamcheck*reverse_health_percentage))
		jammed_until = max(world.time + (jamcheck * 4), 40)
		jamcheck = 0

	last_fire = world.time

/obj/item/weapon/gun/projectile/semiautomatic/svt
	name = "SVT-40"
	desc = "苏联半自动步枪,发射7.62x54mmR弹药."
	icon_state = "svt"
	item_state = "svt"
	base_icon = "svt"
	cliploader = TRUE
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	max_shells = 10
	caliber = "a762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/svt
	good_mags = list(/obj/item/ammo_magazine/svt, /obj/item/ammo_magazine/mosin)
	weight = 3.85
	load_delay = 8
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	scope_mounts = list("kochetov")
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/svt/update_icon()
	..()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_open"
	if (scope)
		overlays -= scope_image
		scope_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = "pu_svt", pixel_x = scope_x_offset, pixel_y = scope_y_offset)
		overlays += scope_image

/obj/item/weapon/gun/projectile/semiautomatic/ptrs
	name = "PTRS-41"
	desc = "苏联半自动反器材步枪,发射14.5x114mm弹药."
	icon_state = "ptrs"
	item_state = "ptrs"
	base_icon = "ptrs"
	shake_strength = 2
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE
	max_shells = 5
	caliber = "a145"
	ammo_type = /obj/item/ammo_casing/a145
	damage_modifier = 1.2
	slot_flags = SLOT_BACK
	magazine_type = /obj/item/ammo_magazine/ptrs
	good_mags = list(/obj/item/ammo_magazine/ptrs)
	weight = 8
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
	)
	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'
	accuracy = 1
	recoil = 120
	scope_x_offset = -1
	scope_mounts = list("kochetov")

/obj/item/weapon/gun/projectile/semiautomatic/avtomat
	name = "费德洛夫自动步枪"
	desc = "俄国自动步枪,曾在第一次世界大战中使用."
	icon_state = "avtomat"
	item_state = "svt"
	base_icon = "avtomat"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	max_shells = 25
	caliber = "a65x50"
	ammo_type = /obj/item/ammo_casing/a65x50
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/avtomat
	good_mags = list(/obj/item/ammo_magazine/avtomat)
	weight = 3.85
	load_delay = 8
	firemodes = list(
		list(name = "single shot",	burst=1, burst_delay=0.8),
		list(name = "automatic",	burst=1, burst_delay=0.8),
		)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	accuracy = 3

/obj/item/weapon/gun/projectile/semiautomatic/remington11
	name = "雷明顿11"
	desc = "一款美国半自动霰弹枪."
	icon_state = "remington11"
	item_state = "remington11"
	base_icon = "remington11"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING
	max_shells = 5
	caliber = "12gauge"
	ammo_type = /obj/item/ammo_casing/shotgun
	slot_flags = SLOT_SHOULDER
	weight = 3.85
	load_delay = 4
	accuracy = 2

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20

/obj/item/weapon/gun/projectile/semiautomatic/sks
	name = "SKS"
	desc = "一款苏联半自动步枪,发射7.62x39mm弹药."
	icon_state = "sks"
	item_state = "mosin"
	base_icon = "sks"
	fire_sound = 'sound/weapons/guns/fire/SKS.ogg'
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	caliber = "a762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	damage_modifier = 1.2
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/sks
	good_mags = list(/obj/item/ammo_magazine/sks)
	weight = 3.85
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
	)
	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	scope_mounts = list("kochetov", "dovetail")
	barrel_x_offset = 15
	scope_y_offset = -1
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/sks/update_icon()
	..()
	if (istype(scope, /obj/item/weapon/attachment/scope/adjustable/sniper_scope/pu))
		overlays -= scope_image
		scope_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = "pu_sks", pixel_x = mag_x_offset, pixel_y = mag_y_offset)
		overlays += scope_image

/obj/item/weapon/gun/projectile/semiautomatic/sks/chinese
	name = "56式半自动步枪"
	desc = "苏联半自动步枪的中国仿制型,发射7.62x39mm弹药."
	weight = 3.86
	barrel_x_offset = 15

/obj/item/weapon/gun/projectile/semiautomatic/sks/sksm
	name = "SKS-M"
	desc = "一款苏联半自动步枪,发射7.62x39mm弹药.这是基于63式改进、可兼容AK-47弹匣的版本."
	icon_state = "sksm"
	item_state = "sks"
	base_icon = "sksm"
	weight = 3.8
	max_shells = 0
	magazine_type = /obj/item/ammo_magazine/sksm
	good_mags = list(/obj/item/ammo_magazine/sks, /obj/item/ammo_magazine/sksm, /obj/item/ammo_magazine/rpk47, /obj/item/ammo_magazine/rpk47/drum, /obj/item/ammo_magazine/ak47, /obj/item/ammo_magazine/ak47/makeshift)
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	cliploader = TRUE

/obj/item/weapon/gun/projectile/semiautomatic/svd
	name = "SVD"
	desc = "一款苏联精确射手步枪,使用可拆卸的10发弹匣供弹.发射7.62x54mmR弹药."
	icon_state = "svd"
	item_state = "svd"
	base_icon = "svd"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	max_shells = 10
	caliber = "a762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	damage_modifier = 1.2
	fire_sound = 'sound/weapons/guns/fire/SVD.ogg'
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/svd
	good_mags = list(/obj/item/ammo_magazine/svd)
	weight = 3.85
	cliploader = TRUE
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
	)

	gun_type = GUN_TYPE_RIFLE
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	accuracy = 1
	scope_mounts = list ("dovetail")
	scope_y_offset = -3

/obj/item/weapon/gun/projectile/semiautomatic/svd/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/semiautomatic/svd/acog/New()
	..()
	scope_mounts = list ("dovetail", "picatinny")
	for(var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/SC in attachments)
		attachments -= SC
		actions -= SC.actions
		verbs -= SC.verbs
		attachment_slots += SC.attachment_type
		shake_strength = initial(shake_strength)
		qdel(SC)
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/acog(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/semiautomatic/g41
	name = "Gewehr 41"
	desc = "一款德国半自动步枪,使用7.92x57mm毛瑟弹药,配备10发固定弹匣."
	icon_state = "g41"
	item_state = "g41"
	base_icon = "g41"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	caliber = "a792x57"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a792x57
	magazine_type = /obj/item/ammo_magazine/gewehr98
	good_mags = list(/obj/item/ammo_magazine/gewehr98)
	weight = 4.9
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_SCOPE|ATTACH_IRONSIGHTS|ATTACH_BARREL
	scope_mounts = list ("swept_back")
	barrel_x_offset = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/g41/update_icon()
	..()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_open"

/obj/item/weapon/gun/projectile/semiautomatic/g43
	name = "Gewehr 43"
	desc = "一款德国半自动步枪,Gewehr 43使用7.92x57mm毛瑟弹药,配备10发可拆卸弹匣."
	icon_state = "g43"
	item_state = "g43"
	base_icon = "g43"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER|MAGAZINE
	cliploader = TRUE
	max_shells = 10
	load_delay = 8
	caliber = "a792x57"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a792x57
	magazine_type = /obj/item/ammo_magazine/g43
	good_mags = list(/obj/item/ammo_magazine/g43, /obj/item/ammo_magazine/gewehr98)
	weight = 4.9
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	scope_mounts = list ("swept_back")
	barrel_x_offset = 15
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/g43/update_icon()
	..()
	if (ammo_magazine)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_open"

/obj/item/weapon/gun/projectile/semiautomatic/vg5
	name = "Volkssturmkarabiner 98"
	desc = "一款非常简易的德国半自动步枪,发射7.92x33mm Kurz弹药."
	icon_state = "vg5"
	item_state = "vg5"
	base_icon = "vg5"
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	max_shells = 30
	load_delay = 10
	caliber = "a792x33"
	fire_sound = 'sound/weapons/guns/fire/stg.ogg'
	reload_sound = 'sound/weapons/guns/interact/stg_reload.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a792x33
	magazine_type = /obj/item/ammo_magazine/stg
	good_mags = list(/obj/item/ammo_magazine/stg, /obj/item/ammo_magazine/vgclip)
	cliploader = TRUE
	weight = 4.6
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 15
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_BARREL
	equiptimer = 16
	mag_x_offset = -2

	scope_mounts = list ("swept_back")

	scope_x_offset = -1
	scope_y_offset = -1

	accuracy = 3

/obj/item/weapon/gun/projectile/semiautomatic/m1garand
	name = "M1加兰德"
	desc = "一款美国半自动步枪,M1加兰德使用.30-06弹药,配备8发内置弹匣."
	icon_state = "m1garand"
	item_state = "m1garand"
	base_icon = "m1garand"
	w_class = ITEM_SIZE_LARGE
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 8
	caliber = "a3006"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a3006
	magazine_type = /obj/item/ammo_magazine/garand
	good_mags = list(/obj/item/ammo_magazine/springfield,/obj/item/ammo_magazine/garand)
	reload_sound = 'sound/weapons/guns/interact/GarandLoad.ogg'
	unload_sound = 'sound/weapons/guns/interact/GarandUnload.ogg'
	weight = 4.3
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/m1garand/match //Match grade weapons are built to a higher standard than service grade weapons.
	name = "M1加兰德竞赛型"
	desc = "一款美国半自动步枪,使用.30-06弹药,配备8发内置弹匣,这一款在质量控制上更为优良."
	w_class = ITEM_SIZE_LARGE
	weight = 4.8
	force = 15
	throwforce = 25

/obj/item/weapon/gun/projectile/semiautomatic/ar15
	name = "Bushmaster XM-15"
	desc = "一款民用半自动步枪,发射5.56x45mm弹药."
	icon = 'icons/obj/guns/assault_rifles.dmi'
	icon_state = "m4"
	item_state = "m4"
	base_icon = "m4"
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	load_delay = 5
	caliber = "a556x45"
	fire_sound = 'sound/weapons/guns/fire/M4A1.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a556x45
	magazine_type = /obj/item/ammo_magazine/ar15
	good_mags = list(/obj/item/ammo_magazine/m16, /obj/item/ammo_magazine/ar15)
	weight = 4.9
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_BARREL|ATTACH_SCOPE|ATTACH_UNDER
	recoil = 30
	accuracy = 3

/obj/item/weapon/gun/projectile/semiautomatic/m1carbine
	name = "M1卡宾枪"
	desc = "一款美国轻型半自动步枪,使用7.62×33mm(无缘式.30卡宾枪)弹药,采用外置弹匣供弹."
	icon_state = "mcar"
	item_state = "mcar"
	base_icon = "mcar"
	w_class = ITEM_SIZE_LARGE
	load_method = MAGAZINE
	caliber = "a762x33"
	fire_sound = 'sound/weapons/guns/fire/Garand.ogg'
	slot_flags = SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a762x33
	magazine_type = /obj/item/ammo_magazine/m1carbine
	good_mags = list(/obj/item/ammo_magazine/m1carbine,/obj/item/ammo_magazine/m1carbine/big)
	reload_sound = 'sound/weapons/guns/interact/GarandLoad.ogg'
	weight = 3.9
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	force = 10
	throwforce = 20
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_BARREL|ATTACH_SCOPE
	accuracy = 2

/obj/item/weapon/gun/projectile/semiautomatic/vintorez
	name = "VSS Vintorez"
	desc = "一款源自苏联的精确射手步枪,配备一体式消音器.使用可拆卸的10发弹匣供弹.发射9x39mm弹药."
	icon_state = "vintorez"
	item_state = "vintorez"
	base_icon = "vintorez"
	load_method = MAGAZINE
	caliber = "a9x39"
	ammo_type = /obj/item/ammo_casing/a9x39
	damage_modifier = 1.2
	w_class = ITEM_SIZE_LARGE
	fire_sound = 'sound/weapons/guns/fire/silenced_pistol.ogg'
	slot_flags = SLOT_SHOULDER
	magazine_type = /obj/item/ammo_magazine/vintorez
	good_mags = list(/obj/item/ammo_magazine/vintorez)
	weight = 1.90
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=2)
		)
	gun_type = GUN_TYPE_RIFLE
	equiptimer = 8
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE|ATTACH_UNDER
	accuracy = 2
	scope_mounts = list ("dovetail")
	scope_x_offset = 2
	scope_y_offset = -1
	under_x_offset = 3
	under_y_offset = 2

/obj/item/weapon/gun/projectile/semiautomatic/vintorez/New()
	..()
	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/semiautomatic/barrett
	name = "巴雷特M82"
	desc = "巴雷特M82是由美国巴雷特枪械制造公司研发的一款后坐式半自动反器材步枪.发射.50 BMG弹药."
	icon_state = "m82"
	item_state = "m82"
	base_icon = "m82"
	attachment_slots = ATTACH_IRONSIGHTS|ATTACH_SCOPE
	w_class = ITEM_SIZE_HUGE
	KD_chance = KD_CHANCE_HIGH
	slot_flags = null
	caliber = "a50cal"
	load_method = MAGAZINE
	ammo_type = list (/obj/item/ammo_casing/a50cal, /obj/item/ammo_casing/a50cal_ap, /obj/item/ammo_casing/a50cal_he)
	fire_sound = 'sound/weapons/guns/fire/BarrettM99.ogg'
	reload_sound = 'sound/weapons/guns/interact/barrett_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/barrett_magout.ogg'
	magazine_type = /obj/item/ammo_magazine/barrett
	good_mags = list(/obj/item/ammo_magazine/barrett)
	weight = 14.8
	shake_strength = 3
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=25)
		)
	gun_type = GUN_TYPE_RIFLE
	equiptimer = 15
	shake_strength = 2
	accuracy = 1
	scope_mounts = list ("picatinny")

/obj/item/weapon/gun/projectile/semiautomatic/barrett/sniper/New()
	..()

	var/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper/SP = new/obj/item/weapon/attachment/scope/adjustable/sniper_scope/vortex_viper(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/semiautomatic/bamr
	name = "BAMR"
	desc = "一款老旧的黑斯拉夫半自动反坦克步枪,发射15x115弹药.得益于巧妙的设计,其后坐力并没有想象中那么糟糕."
	icon_state = "bam"
	item_state = "bam"
	base_icon = "bam"
	attachment_slots = ATTACH_IRONSIGHTS
	w_class = ITEM_SIZE_HUGE
	force = 10
	throwforce = 5
	KD_chance = KD_CHANCE_HIGH
	slot_flags = null
	caliber = "a15115"
	weight = 9
	shake_strength = 2
	load_method = MAGAZINE
	ammo_type = list (/obj/item/ammo_casing/a15115, /obj/item/ammo_casing/a15115_ap, /obj/item/ammo_casing/a15115_aphe)
	magazine_type = /obj/item/ammo_magazine/bamr
	good_mags = list(/obj/item/ammo_magazine/bamr, /obj/item/ammo_magazine/bamr_aphe, /obj/item/ammo_magazine/bamr_ap)
	firemodes = list(
		list(name = "single shot",burst=1, fire_delay=15)
		)
	reload_sound = 'sound/weapons/guns/interact/barrett_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/barrett_magout.ogg'
	fire_sound = 'sound/weapons/guns/fire/ptrd.ogg'
	fire_delay = 5
	equiptimer = 12
	gun_safety = FALSE
	load_delay = 20

/obj/item/weapon/gun/projectile/semiautomatic/bamr/telescope
	name = "BAMR-T"
	desc = "一款老旧的黑斯拉夫半自动反坦克步枪,发射15x115弹药.这一款配备了一体式瞄准镜."
	icon_state = "bamt"
	has_telescopic = TRUE
	equiptimer = 14
	weight = 10