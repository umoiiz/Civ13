/obj/item/weapon/gun/projectile/revolver
	move_delay = 1
	fire_delay = 3
	icon = 'icons/obj/guns/pistols.dmi'
	name = "左轮手枪"
	desc = "一把简单的左轮手枪."
	icon_state = "revolver"
	item_state = "revolver"
	caliber = "a45"
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/a45
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver.ogg'
	silencer_fire_sound = 'sound/weapons/guns/fire/Glock17-SD.ogg'
	var/chamber_offset = FALSE //how many empty chambers in the cylinder until you hit a round
	magazine_based = FALSE
	var/single_action = FALSE
	var/cocked = FALSE
	equiptimer = 5
	gun_type = GUN_TYPE_PISTOL
	maxhealth = 55
	gtype = "pistol"
	load_method = SINGLE_CASING|SPEEDLOADER
	accuracy = 10

	KD_chance = KD_CHANCE_MEDIUM
	stat = "pistol"
	load_delay = 6
	barrel_x_offset = 17
	barrel_y_offset = 0

/obj/item/weapon/gun/projectile/revolver/update_icon()
	..()
	item_state = initial(item_state)
	if (base_icon)
		if (cocked)
			icon_state = "[base_icon]_cocked"
		else
			icon_state = base_icon

	if (silencer && (!silencer.fits || (silencer.fits && !silencer.fits.Find("pistol"))))
		overlays -= barrel_image
		var/part_icon_state = "pistol_[silencer.icon_state]"
		barrel_image = image(icon = 'icons/obj/guns/parts.dmi', loc = src, icon_state = part_icon_state, pixel_x = barrel_x_offset, pixel_y = barrel_y_offset)
		overlays += barrel_image

/obj/item/weapon/gun/projectile/revolver/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set src in usr
	set category = null

	chamber_offset = FALSE
	usr.visible_message("<span class='warning'>\The [usr] 转动了 \the [src] 的弹巢!</span>", \
						"<span class='notice'>You spin the cylinder of \the [src].</span>", \
						"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(loc, 'sound/weapons/guns/interact/revolver_spin.ogg', 100, TRUE)
	loaded = shuffle(loaded)
	if (rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/revolver/consume_next_projectile()
	if (chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/revolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()


/obj/item/weapon/gun/projectile/revolver/attack_hand(mob/user as mob)
	if (user.get_inactive_hand() == src)
		unload_ammo(user, allow_dump=0)
	else
		return ..()
/obj/item/weapon/gun/projectile/revolver/attack_self(mob/user)
	if (single_action)
		if (!cocked)
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='warning'>[user] 扳起 \the [src] 的击锤!</span>","<span class='warning'>你扳起 \the [src] 的击锤!</span>")
			cocked = TRUE
			update_icon()
		else
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='notice'>[user] 放下 \the [src] 的击锤.</span>","<span class='notice'>你放下 \the [src] 的击锤.</span>")
			cocked = FALSE
			update_icon()

/obj/item/weapon/gun/projectile/revolver/special_check(mob/user)
//	var/mob/living/human/H = user
	if (gun_safety && safetyon)
		to_chat(user, "<span class='warning'>保险开启时你不能发射 \the [src]!</span>")
		return FALSE
	if (!cocked && single_action)
		to_chat(user, "<span class='warning'>武器未扳起击锤时你不能发射 \the [src]!</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/revolver/handle_post_fire()
	..()
	if (single_action)
		cocked = FALSE
	else
		cocked = TRUE
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))

/obj/item/weapon/gun/projectile/revolver/unload_ammo(var/mob/living/human/user, allow_dump=0)
	if (loaded.len)
		//presumably, if it can be speed-loaded, it can be speed-unloaded.
		if (allow_dump && (load_method & SPEEDLOADER))
			var/count = FALSE
			var/turf/T = get_turf(user)
			if (T)
				for (var/obj/item/ammo_casing/C in loaded)
					C.loc = T
					count++
				loaded.Cut()
			if (count)
				user.visible_message("[user] 卸下了 \the [src] 的弹药.", "<span class='notice'>你从 \the [src] 中卸下了 [count] 发弹药\s .</span>")
				if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
		else if (load_method & SINGLE_CASING)
			var/obj/item/ammo_casing/C = loaded[loaded.len]
			loaded.len--
			user.put_in_hands(C)
			user.visible_message("[user] 从 \the [src] 中取出了 \a [C].", "<span class='notice'>你从 \the [src] 中取出了 \a [C].</span>")
			if (istype(src, /obj/item/weapon/gun/projectile/boltaction))
				var/obj/item/weapon/gun/projectile/boltaction/B = src
				if (B.bolt_safety && !B.loaded.len)
					B.check_bolt_lock++
			if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
	else
		to_chat(user, "<span class='warning'>[src] 是空的.</span>")
	update_icon()


/obj/item/weapon/gun/projectile/revolver/nagant_revolver
	name = "纳甘 M1895"
	desc = "俄罗斯军官的左轮手枪."
	icon_state = "nagant"
	w_class = ITEM_SIZE_SMALL
	caliber = "a762x38"
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	magazine_type = /obj/item/ammo_magazine/c762x38mmR
	ammo_type = /obj/item/ammo_casing/a762x38
	weight = 1.45
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	load_delay = 5
	gun_safety = TRUE

/obj/item/weapon/gun/projectile/revolver/nagant_revolver/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/revolver/m1892
	name = "1892 型左轮手枪"
	desc = "法国军官的左轮手枪."
	icon_state = "m1892"
	w_class = ITEM_SIZE_SMALL
	caliber = "a8x27"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c8x27
	ammo_type = /obj/item/ammo_casing/a8x27
	weight = 1.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	load_delay = 5
	gun_safety = TRUE

/obj/item/weapon/gun/projectile/revolver/peacemaker
	name = "柯尔特和平缔造者"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪."
	icon_state = "coltsaa"
	base_icon = "peacemaker"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 2.3
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/peacemaker/ivory
	name = "柯尔特和事佬象牙版"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪, 配备象牙握把."
	icon_state = "coltsaa_ivory"
	base_icon = "peacemaker"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 2.4
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/peacemaker/storekeeper
	name = "柯尔特店主"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪的一种变体."
	icon_state = "coltsaa_storekeeper"
	base_icon = "peacemaker"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 1.6
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/peacemaker/ivory
	name = "柯尔特店主象牙版"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪的一种变体, 配备象牙握把."
	icon_state = "coltsaa_bankerspecial"
	base_icon = "peacemaker"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 1.6
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/peacemaker
	name = "柯尔特和事佬象牙版"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪的一种变体, 配备象牙握把."
	icon_state = "coltsaa_artillery"
	base_icon = "peacemaker"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 1.6
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/colt1892
	name = "柯尔特 M1892"
	desc = "官方名称 M1892 柯尔特单动陆军左轮手枪."
	icon_state = "colt1892"
	base_icon = "colt1892"
	w_class = ITEM_SIZE_SMALL
	caliber = "a38"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c38
	ammo_type = /obj/item/ammo_casing/a38
	weight = 2.3
	single_action = TRUE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/makeshift
	name = "简易左轮手枪"
	desc = "一把廉价的简易左轮手枪."
	icon_state = "makeshiftrevolver"
	base_icon = "makeshiftrevolver"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	ammo_type = /obj/item/ammo_casing/a45
	weight = 2.3
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	pocket = TRUE

/obj/item/weapon/gun/projectile/revolver/coltpolicepositive
	name = "柯尔特警用正版"
	desc = "警察常用的左轮手枪."
	icon_state = "coltnewpolice"
	w_class = ITEM_SIZE_SMALL
	caliber = "a32"
	fire_sound = 'sound/weapons/guns/fire/32ACP.ogg'
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	equiptimer = 4
	good_mags = list(/obj/item/ammo_magazine/emptyspeedloader)
	magazine_type = /obj/item/ammo_magazine/c32
	ammo_type = /obj/item/ammo_casing/a32
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	pocket = TRUE

/obj/item/weapon/gun/projectile/revolver/coltpolicepositive/standardized

/obj/item/weapon/gun/projectile/revolver/coltpolicepositive/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/revolver/enfieldno2
	name = "恩菲尔德 2 号"
	desc = "充满爱意制造的英国左轮手枪."
	icon_state = "enfield02"
	w_class = ITEM_SIZE_SMALL
	caliber = "a41"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c41
	ammo_type = /obj/item/ammo_casing/a41
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/webley4
	name = "韦伯利 Mk IV"
	desc = "英国左轮手枪, 口径为 (.455)."
	icon_state = "webley4"
	w_class = ITEM_SIZE_SMALL
	caliber = "a455"
	fire_sound = 'sound/weapons/guns/fire/45ACP.ogg'
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c455
	ammo_type = /obj/item/ammo_casing/a455
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/frontier
	name = "柯尔特边境"
	desc = "官方名称 M1873 柯尔特单动陆军左轮手枪. 这一把使用 .44 温彻斯特弹药."
	icon_state = "peacemaker2"
	base_icon = "peacemaker2"
	w_class = ITEM_SIZE_SMALL
	caliber = "a44"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c44
	ammo_type = /obj/item/ammo_magazine/c44
	weight = 2.3
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/graysonfito12
	name = "麦凯伦 M12"
	desc = "一把由麦凯伦制造的昂贵左轮手枪."
	icon_state = "graysonfito"
	base_icon = "graysonfito"
	w_class = ITEM_SIZE_SMALL
	caliber = "a44magnum"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c44magnum
	ammo_type = /obj/item/ammo_magazine/c44magnum
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/taurus
	name = "金牛座法官左轮手枪"
	desc = "金牛座法官是由金牛座国际设计和生产的五发左轮手枪, 口径为 (.45 柯尔特)."
	icon_state = "judge"
	base_icon = "judge"
	w_class = ITEM_SIZE_SMALL
	caliber = "a45"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c45
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/magnum44
	name = "马格南 44"
	desc = "一把重型左轮手枪, 口径为 (马格南 .44)."
	icon_state = "magnum58"
	base_icon = "magnum58"
	w_class = ITEM_SIZE_SMALL
	caliber = "a44magnum"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c44magnum

	good_mags = list(/obj/item/ammo_magazine/m44speedloader, /obj/item/ammo_magazine/emptyspeedloader)
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/magnum44/silenced/New()
	..()

	var/obj/item/weapon/attachment/silencer/pistol/SP = new/obj/item/weapon/attachment/silencer/pistol(src)
	SP.attached(null,src,TRUE)

/obj/item/weapon/gun/projectile/revolver/smithwesson
	name = "史密斯威森 30 型"
	desc = "一把史密斯威森左轮手枪, 口径为 .32 S&W."
	icon_state = "smithwesson32"
	base_icon = "smithwesson32"
	w_class = ITEM_SIZE_TINY
	caliber = "a32"
	fire_sound = 'sound/weapons/guns/fire/32ACP.ogg'
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c32
	ammo_type = /obj/item/ammo_casing/a32
	weight = 1.6
	equiptimer = 3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	pocket = TRUE

/obj/item/weapon/gun/projectile/revolver/sw3
	name = "奥贝亚兄弟"
	desc = "一把史密斯威森左轮手枪, 口径为 .32 S&W. 这一把是西班牙仿制品."
	icon_state = "snw3"
	base_icon = "snw3"
	w_class = ITEM_SIZE_TINY
	caliber = "a32"
	fire_sound = 'sound/weapons/guns/fire/32ACP.ogg'
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c32
	ammo_type = /obj/item/ammo_casing/a32
	weight = 1.6
	equiptimer = 3
	single_action = TRUE
	blackpowder = FALSE
	cocked = FALSE
	pocket = FALSE
	accuracy = 4

/obj/item/weapon/gun/projectile/revolver/snw10
	name = "史密斯威森 M.10"
	desc = "一把史密斯威森 10 型左轮手枪, 口径为 .38 S&W."
	icon_state = "snw10"
	base_icon = "snw10"
	w_class = ITEM_SIZE_TINY
	caliber = "a38"
	fire_sound = 'sound/weapons/guns/fire/32ACP.ogg'
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c38
	ammo_type = /obj/item/ammo_casing/a38
	weight = 1.6
	equiptimer = 3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	pocket = FALSE
	accuracy = 4

/obj/item/weapon/gun/projectile/revolver/t26_revolver
	name = "26 式左轮手枪"
	desc = "日本军官的左轮手枪."
	icon_state = "t26revolver"
	w_class = ITEM_SIZE_SMALL
	caliber = "c9mm_jap_revolver"
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	good_mags = list(/obj/item/ammo_magazine/emptyspeedloader)
	magazine_type = /obj/item/ammo_magazine/c9mm_jap_revolver
	ammo_type = /obj/item/ammo_casing/c9mm_jap_revolver
	weight = 2.3
	single_action = FALSE
	blackpowder = FALSE
	cocked = FALSE
	load_delay = 5

/obj/item/weapon/gun/projectile/revolver/panther
	name = "黑豹左轮手枪"
	desc = "一把 .44 口径左轮手枪."
	icon_state = "panther"
	item_state = "panther"
	w_class = ITEM_SIZE_SMALL
	fire_sound = 'sound/weapons/guns/fire/44Mag.ogg'
	caliber = "a44p"
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	magazine_type = /obj/item/ammo_magazine/c44p
	weight = 0.8
	load_delay = 6
	gun_safety = TRUE
	single_action = FALSE
	blackpowder = FALSE

/obj/item/weapon/gun/projectile/revolver/derringer
	name = "德林格 M95 手枪"
	desc = "官方名称 雷明顿 95 型, 这把小型手枪有两根枪管."
	icon_state = "derringer"
	item_state = "pistol"
	w_class = ITEM_SIZE_TINY
	caliber = "a41"
	fire_sound = 'sound/weapons/guns/fire/44Mag.ogg'
	magazine_type = /obj/item/ammo_magazine/c41
	ammo_type = /obj/item/ammo_casing/a41
	weight = 0.31
	load_method = SINGLE_CASING
	max_shells = 2
	force = 4
	slot_flags = SLOT_HOLSTER | SLOT_POCKET | SLOT_BELT
	handle_casings = HOLD_CASINGS
	move_delay = 1
	var/open = FALSE
	var/recentpump = FALSE // to prevent spammage
	load_delay = 6
	blackpowder = TRUE
	pocket = TRUE

/obj/item/weapon/gun/projectile/revolver/derringer/spin_cylinder()
	return
/obj/item/weapon/gun/projectile/revolver/derringer/consume_next_projectile()
	if (chambered)
		return chambered.BB
	return null
/obj/item/weapon/gun/projectile/revolver/derringer/update_icon()
	..()
	if (open)
		icon_state = "derringer_open"
	else
		icon_state = "derringer"

/obj/item/weapon/gun/projectile/revolver/derringer/attack_self(mob/living/user as mob)
	if (world.time >= recentpump + 10)
		if (open)
			open = FALSE
			to_chat(user, "<span class='notice'>你合上\the [src].</span>")
			icon_state = "derringer"
			if (loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC
		else
			open = TRUE
			to_chat(user, "<span class='notice'>你折开\the [src].</span>")
			icon_state = "derringer_open"
		recentpump = world.time

/obj/item/weapon/gun/projectile/revolver/derringer/load_ammo(var/obj/item/A, mob/user)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先打开\the [src]!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/revolver/derringer/unload_ammo(mob/user, var/allow_dump=1)
	if (!open)
		to_chat(user, "<span class='notice'>你需要先打开\the [src]!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/revolver/derringer/special_check(mob/user)
	if (open)
		to_chat(user, "<span class='warning'>当\the [src]处于折开状态时你无法开火!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/revolver/derringer/handle_post_fire()
	..()
	if (loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))


/////////Revolving Rifle///////////
/obj/item/weapon/gun/projectile/revolving
	move_delay = 1
	fire_delay = 3
	icon = 'icons/obj/guns/rifles.dmi'
	name = "转轮步枪"
	desc = "一把简单的转轮步枪."
	icon_state = "revolver"
	item_state = "revolver"
	caliber = "a45"
	slot_flags = SLOT_BELT|SLOT_POCKET
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/a45
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/revolver.ogg'
	var/chamber_offset = FALSE //how many empty chambers in the cylinder until you hit a round
	magazine_based = FALSE
	var/single_action = FALSE
	var/cocked = FALSE
	maxhealth = 45
	gtype = "rifle"

	KD_chance = KD_CHANCE_LOW
	stat = "rifle"
	load_delay = 7

/obj/item/weapon/gun/projectile/revolving/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set src in usr
	set category = null

	chamber_offset = FALSE
	usr.visible_message("<span class='warning'>\The [usr]转动了\the [src]的弹巢!</span>", \
						"<span class='notice'>You spin the cylinder of \the [src].</span>", \
						"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(loc, 'sound/weapons/guns/interact/revolver_spin.ogg', 100, TRUE)
	loaded = shuffle(loaded)
	if (rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/revolving/consume_next_projectile()
	if (chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/revolving/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()


/obj/item/weapon/gun/projectile/revolving/attack_hand(mob/user as mob)
	if (user.get_inactive_hand() == src)
		unload_ammo(user, allow_dump=0)
	else
		return ..()

/obj/item/weapon/gun/projectile/revolving/attack_self(mob/user)
	if (single_action)
		if (!cocked)
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='warning'>[user]扳起了\the [src]的击锤!</span>","<span class='warning'>你扳起了\the [src]的击锤!</span>")
			cocked = TRUE
		else
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='notice'>[user]放下了\the [src]的击锤.</span>","<span class='notice'>你放下了\the [src]的击锤.</span>")
			cocked = FALSE

/obj/item/weapon/gun/projectile/revolving/special_check(mob/user)
//	var/mob/living/human/H = user
	if (!cocked && single_action)
		to_chat(user, "<span class='warning'>当武器击锤未扳起时你无法开火\the [src]!</span>")
		return FALSE
	if (gun_safety && safetyon)
		to_chat(user, "<span class='warning'>当保险开启时你无法开火\the [src]!</span>")
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/revolving/handle_post_fire()
	..()
	if (single_action)
		cocked = FALSE
	else
		cocked = TRUE
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))

/obj/item/weapon/gun/projectile/revolving/unload_ammo(var/mob/living/human/user, allow_dump=0)
	if (loaded.len)
		//presumably, if it can be speed-loaded, it can be speed-unloaded.
		if (allow_dump && (load_method & SPEEDLOADER))
			var/count = FALSE
			var/turf/T = get_turf(user)
			if (T)
				for (var/obj/item/ammo_casing/C in loaded)
					C.loc = T
					count++
				loaded.Cut()
			if (count)
				user.visible_message("[user]卸下了[src]的弹药.", "<span class='notice'>你从[src]中卸下了[count]发\s 弹药.</span>")
				if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
		else if (load_method & SINGLE_CASING)
			var/obj/item/ammo_casing/C = loaded[loaded.len]
			loaded.len--
			user.put_in_hands(C)
			user.visible_message("[user]从[src]中取出了\a [C].", "<span class='notice'>你从[src]中取出了\a [C].</span>")
			if (istype(src, /obj/item/weapon/gun/projectile/boltaction))
				var/obj/item/weapon/gun/projectile/boltaction/B = src
				if (B.bolt_safety && !B.loaded.len)
					B.check_bolt_lock++
			if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
		to_chat(user, SPAN_WARNING("\The [src] is empty."))
	update_icon()

/obj/item/weapon/gun/projectile/revolving/colt
	name = "柯尔特转轮步枪"
	desc = "官方名称 M1855 柯尔特单动转轮卡宾枪."
	icon_state = "revolving"
	item_state = "revolving"
	w_class = ITEM_SIZE_SMALL
	caliber = "a44"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_magazine/c44
	weight = 5.0
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	accuracy = 3

///////////////////cap n ball revolvers/////////////////

/obj/item/weapon/gun/projectile/capnball
	move_delay = 1
	fire_delay = 3
	name = "左轮手枪"
	desc = "一把简单的左轮手枪."
	icon_state = "revolver"
	item_state = "revolver"
	caliber = "musketball_pistol"
	icon = 'icons/obj/guns/pistols.dmi'
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/musketball_pistol
	unload_sound 	= 'sound/weapons/guns/interact/rev_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rev_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rev_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/hpistol.ogg'
	var/chamber_offset = FALSE //how many empty chambers in the cylinder until you hit a round
	magazine_based = FALSE
	var/single_action = FALSE
	var/cocked = FALSE
	base_icon = null
	gtype = "pistol"

	KD_chance = KD_CHANCE_LOW
	stat = "pistol"
	load_delay = 6
	accuracy = 10

/obj/item/weapon/gun/projectile/capnball/update_icon()
	..()
	if (base_icon)
		if (cocked)
			icon_state = "[base_icon]_cocked"
		else
			icon_state = base_icon

/obj/item/weapon/gun/projectile/capnball/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set src in usr
	set category = null

	chamber_offset = FALSE
	usr.visible_message("<span class='warning'>\The [usr]转动了\the [src]的弹巢!</span>", \
						"<span class='notice'>You spin the cylinder of \the [src].</span>", \
						"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(loc, 'sound/weapons/guns/interact/revolver_spin.ogg', 100, TRUE)
	loaded = shuffle(loaded)
	if (rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/capnball/consume_next_projectile()
	if (chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/capnball/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()


/obj/item/weapon/gun/projectile/capnball/attack_hand(mob/user as mob)
	if (user.get_inactive_hand() == src)
		unload_ammo(user, allow_dump=0)
	else
		return ..()

/obj/item/weapon/gun/projectile/capnball/attack_self(mob/user)
	if (single_action)
		if (!cocked)
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='warning'>[user]扳起了\the [src]的击锤!</span>","<span class='warning'>你扳起了\the [src]的击锤!</span>")
			cocked = TRUE
			update_icon()
		else
			playsound(loc, cocked_sound, 50, TRUE)
			user.visible_message("<span class='notice'>[user]放下了\the [src]的击锤.</span>","<span class='notice'>你放下了\the [src]的击锤.</span>")
			cocked = FALSE
			update_icon()

/obj/item/weapon/gun/projectile/capnball/special_check(mob/user)
//	var/mob/living/human/H = user
	if (!cocked && single_action)
		to_chat(user, "<span class='warning'>当武器击锤未扳起时你无法开火\the [src]!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/capnball/handle_post_fire()
	..()
	if (single_action)
		cocked = FALSE
	else
		cocked = TRUE
	if (blackpowder)
		spawn (1)
			new/obj/effect/effect/smoke/chem(get_step(src, dir))

/obj/item/weapon/gun/projectile/capnball/unload_ammo(var/mob/living/human/user, allow_dump=0)
	if (loaded.len)
		//presumably, if it can be speed-loaded, it can be speed-unloaded.
		if (allow_dump && (load_method & SPEEDLOADER))
			var/count = FALSE
			var/turf/T = get_turf(user)
			if (T)
				for (var/obj/item/ammo_casing/C in loaded)
					C.loc = T
					count++
				loaded.Cut()
			if (count)
				visible_message("[user]卸下了[src]的弹药.", "<span class='notice'>你从[src]中卸下了[count]发\s 弹药.</span>")
				if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
		else if (load_method & SINGLE_CASING)
			var/obj/item/ammo_casing/C = loaded[loaded.len]
			loaded.len--
			user.put_in_hands(C)
			visible_message("[user]从[src]中取出了\a [C].", "<span class='notice'>你从[src]中取出了\a [C].</span>")
			if (istype(src, /obj/item/weapon/gun/projectile/boltaction))
				var/obj/item/weapon/gun/projectile/boltaction/B = src
				if (B.bolt_safety && !B.loaded.len)
					B.check_bolt_lock++
			if (bulletinsert_sound) playsound(loc, bulletinsert_sound, 75, TRUE)
	else
		to_chat(user, "<span class='warning'>[src]是空的.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/capnball/dragoon
	name = "柯尔特龙骑兵 M1848"
	desc = "官方名称 M1848 柯尔特火帽左轮手枪."
	icon_state = "colt_dragoon1848"
	base_icon = "dragoon"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 2.3
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 40
	accuracy = 3

/obj/item/weapon/gun/projectile/capnball/babydragoon
	name = "柯尔特小龙骑兵 M1848"
	desc = "官方名称是M1848柯尔特击发式左轮手枪."
	icon_state = "dragoon"
	base_icon = "colt_babydragoon1848"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 1.9
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 45
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/pocketpistol
	name = "柯尔特袖珍手枪M1849"
	desc = "官方名称是M1849柯尔特击发式袖珍手枪."
	icon_state = "dragoon"
	base_icon = "colt_pocketmodel1849"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 1.5
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 30
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/walker
	name = "柯尔特沃克M1846"
	desc = "官方名称是M1846柯尔特击发式沃克手枪."
	icon_state = "peacemaker2"
	base_icon = "colt_walker1846"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 2.2
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 40
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/pocketm1849
	name = "柯尔特警用袖珍手枪M1849"
	desc = "官方名称是M1849柯尔特击发式袖珍手枪, 被警方使用."
	icon_state = "peacemaker2"
	base_icon = "colt_pocketpolice1849"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 1.5
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 38
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/navym1851
	name = "柯尔特海军左轮手枪M1851"
	desc = "官方名称是M1851柯尔特海军击发式左轮手枪."
	icon_state = "peacemaker2"
	base_icon = "colt_navy1851"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 2.5
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 40
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/navym1861
	name = "柯尔特海军左轮手枪M1861"
	desc = "官方名称是M1861柯尔特海军击发式左轮手枪."
	icon_state = "peacemaker2"
	base_icon = "colt_navy1861"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 2.6
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 37
	accuracy = 4

/obj/item/weapon/gun/projectile/capnball/
	name = "柯尔特陆军左轮手枪M1860"
	desc = "官方名称是M1860柯尔特陆军击发式左轮手枪."
	icon_state = "peacemaker2"
	base_icon = "colt_army1860"
	w_class = ITEM_SIZE_SMALL
	caliber = "musketball_pistol"
	load_method = SINGLE_CASING
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	magazine_type = /obj/item/ammo_casing/musketball_pistol
	weight = 2.6
	single_action = TRUE
	blackpowder = TRUE
	cocked = FALSE
	load_delay = 37
