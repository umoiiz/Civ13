/***********************************
RUSSO-JAPANESE WAR WEAPONS MAGS N AMMO
***********************************/
/obj/item/ammo_magazine/mosin
	name = "弹夹 (7.62x54mm)"
	icon_state = "clip"
	caliber = "a762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 5
	weight = 0.04
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/mosinbox
	name = "弹匣箱 (7.62x54mm)"
	icon_state = "mosin_ammo"
	mag_type = MAGAZINE
	caliber = "a762x54"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/madsen
	name = "弹匣 (7.62x54mm)"
	icon_state = "madsen"
	attached_icon_state = "mad_mag"
	mag_type = MAGAZINE
	caliber = "a762x54"
	w_class = ITEM_SIZE_SMALL //most 30 round and 46 round mags have no wclass why give just madsen a wclass you cant fit it into a pouch anymore no reason anyways making it 2
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 25
	multiple_sprites = TRUE

/obj/item/ammo_magazine/madsen/box
	name = "弹匣箱 (7.62x54mm)"
	icon_state = "mhbox"
	mag_type = MAGAZINE
	caliber = "a762x54"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 65
	multiple_sprites = TRUE
	is_box = TRUE
/obj/item/ammo_magazine/b762
	name = "弹链 (7.62x51mm)"
	icon_state = "b762"
	attached_icon_state = "m60_mag"
	mag_type = MAGAZINE
	caliber = "a762x51_weak"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a762x51/weak
	max_ammo = 100
	multiple_sprites = TRUE

/obj/item/ammo_magazine/gewehr71
	name = "弹夹 (7.65x53mm)"
	icon_state = "kclip"
	caliber = "a765x53"
	ammo_type = /obj/item/ammo_casing/a765x53
	max_ammo = 5
	weight = 0.04
	multiple_sprites = TRUE
	clip = TRUE


/obj/item/ammo_magazine/gewehr71box
	name = "弹匣箱 (7.65x53mm)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a765x53"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a765x53
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/gewehr98
	name = "弹夹 (7.92x57mm)"
	icon_state = "kclip"
	caliber = "a792x57"
	ammo_type = /obj/item/ammo_casing/a792x57
	max_ammo = 5
	weight = 0.04
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/vgclip
	name = "弹夹 (7.92x33mm)"
	icon_state = "kclip"
	caliber = "a792x33"
	ammo_type = /obj/item/ammo_casing/a792x33
	max_ammo = 5
	weight = 0.06
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/mauser1893
	name = "弹夹 (7x53mm)"
	icon_state = "kclip"
	caliber = "a7x57"
	ammo_type = /obj/item/ammo_casing/a7x57
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/gewehr98box
	name = "弹匣箱 (7.92x57mm)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a792x57"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a792x57
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/mauser1893box
	name = "弹匣箱 (7x53mm)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a7x57"
	w_class = ITEM_SIZE_NORMAL
	ammo_type = /obj/item/ammo_casing/a7x57
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/sharps
	name = "弹药箱 (.45-70 Government)"
	icon_state = "oldbox"
	caliber = "a4570"
	w_class = ITEM_SIZE_SMALL

	ammo_type = /obj/item/ammo_casing/a4570
	max_ammo = 15
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/c577
	name = "弹药箱 (.577/450 Martini-Henry)"
	icon_state = "mhbox"
	caliber = "a577"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = /obj/item/ammo_casing/a577
	max_ammo = 12
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/arisaka
	name = "弹夹 (6.5x50mm)"
	icon_state = "kclip"
	caliber = "a65x50"

	ammo_type = /obj/item/ammo_casing/a65x50
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/arisakabox
	name = "弹匣箱 (6.5x50mm)"
	icon_state = "arisaka_ammo"
	mag_type = MAGAZINE
	caliber = "a65x50"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = /obj/item/ammo_casing/a65x50
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/carcano
	name = "弹夹 (6.5x52mm)"
	icon_state = "kclip"
	caliber = "a65x52"

	ammo_type = /obj/item/ammo_casing/a65x52
	max_ammo = 5
	weight = 0.038
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/carcano_box
	name = "弹匣箱 (6.5x52mm)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a65x52"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = /obj/item/ammo_casing/a65x52
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/maxim
	name = "马克沁弹链"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a762x54_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/mg08
	name = "MG08弹链"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a792x57_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/vickers
	name = "维克斯弹链"
	icon_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a303_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a303/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/vickers/box
	name = "弹匣箱 (.303 British)"
	icon_state = "wood_ammobox"
	mag_type = MAGAZINE
	caliber = "a303_weak"
	w_class = ITEM_SIZE_HUGE
	ammo_type = /obj/item/ammo_casing/a303/weak
	max_ammo = 650
	multiple_sprites = TRUE
	is_box = TRUE
	slowdown = 2.0

/obj/item/ammo_magazine/hotchkiss
	name = "哈奇开斯弹链"
	icon_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a8x50_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a8x50/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE


/obj/item/ammo_magazine/type3
	name = "三年式弹链"
	icon_state = "maximbelt"
	mag_type = MAGAZINE
	caliber = "a65x50_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a65x50/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/mg34belt
	name = "MG 34弹链"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a792x57_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	max_ammo = 250
	multiple_sprites = TRUE
	belt = TRUE

/obj/item/ammo_magazine/mg3belt
	name = "弹链 (7.62x51mm)"
	icon_state = "maximbelt"
	attached_icon_state = "belt_"
	mag_type = MAGAZINE
	caliber = "a762x51_weak"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_SHOULDER
	ammo_type = /obj/item/ammo_casing/a762x51/weak
	max_ammo = 100
	multiple_sprites = TRUE

/obj/item/ammo_magazine/c8mmnambu
	name = "南部弹匣"
	icon_state = "lugermag"
	mag_type = MAGAZINE
	caliber = "c8mmnambu"
	ammo_type = /obj/item/ammo_casing/c8mmnambu
	max_ammo = 8
	weight = 0.02
	multiple_sprites = TRUE

/obj/item/ammo_magazine/luger
	name = "鲁格弹匣"
	icon_state = "lugermag"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 8
	weight = 0.02
	multiple_sprites = TRUE

/obj/item/ammo_magazine/walther
	name = "瓦尔特弹匣"
	icon_state = "waltherp"
	mag_type = MAGAZINE
	caliber = "a9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 8
	weight = 0.02
	multiple_sprites = TRUE
/obj/item/ammo_magazine/walther/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/borchardt
	name = "博查特弹匣"
	icon_state = "borchardtmag"
	mag_type = MAGAZINE
	caliber = "a765x25"
	ammo_type = /obj/item/ammo_casing/a765x25
	max_ammo = 8
	weight = 0.02
	multiple_sprites = TRUE

/obj/item/ammo_magazine/luger/empty/New()
	..()
	stored_ammo.Cut()
/obj/item/ammo_magazine/c8mmnambu/empty/New()
	..()
	stored_ammo.Cut()
/obj/item/ammo_magazine/borchardt/empty/New()
	..()
	stored_ammo.Cut()

/obj/item/ammo_magazine/mauser
	name = "毛瑟弹夹 (7.63mm)"
	icon_state = "mauser"
	caliber = "a762x25"

	ammo_type = /obj/item/ammo_casing/a762x25
	max_ammo = 10
	weight = 0.06
	multiple_sprites = TRUE
	mag_type = SPEEDLOADER
	clip = TRUE


////////// NAGANT REVOLVER ///////////////
/obj/item/ammo_magazine/c762x38mmR
	name = "子弹袋 (7.62x38mmR)"
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a762x38
	caliber = "a762x38"
	max_ammo = 21
	weight = 0.4
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c8x27
	name = "子弹袋 (8x27mmR)"
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a8x27
	caliber = "a8x27"
	max_ammo = 24
	weight = 0.5
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c9mm_jap_revolver
	name = "子弹袋 (9mm)"
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/c9mm_jap_revolver
	caliber = "c9mm_jap_revolver"
	max_ammo = 18
	weight = 0.70

	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c32
	name = "子弹袋 (.32 S&W Long)"
	desc = "一袋26发.32子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a32
	caliber = "a32"
	max_ammo = 26
	weight = 0.9
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c32acp
	name = "子弹袋 (.32 ACP)"
	desc = "一袋26发.32 ACP子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a32acp
	caliber = "a32"
	max_ammo = 26
	weight = 0.9
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c9mm
	name = "子弹袋 (9x19mm)"
	desc = "一袋30发9x19mm帕拉贝鲁姆子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a9x19
	caliber = "a9x19"
	max_ammo = 30
	weight = 1.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c38
	name = "子弹袋 (.38 long)"
	desc = "一袋26发.38子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a38
	caliber = "a38"
	max_ammo = 26
	weight = 0.9
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c45
	name = "子弹袋 (.45 Colt)"
	desc = "一袋11.43xmmR子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a45
	caliber = "a45"
	max_ammo = 24
	weight = 0.9
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c455
	name = "子弹袋 (.455 Webley)"
	desc = "一袋.455韦伯利子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a455
	caliber = "a455"
	max_ammo = 24
	weight = 0.95
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c41
	name = "子弹袋 (.41 Short)"
	desc = "一袋.41-100子弹, 主要用于德林杰手枪."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a41
	caliber = "a41"
	max_ammo = 10
	weight = 0.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c43
	name = "子弹袋 (.43 Spanish)"
	desc = "一袋.43西班牙子弹, 主要用于西班牙滚动闭锁步枪."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a43
	caliber = "a43"
	max_ammo = 30
	weight = 0.1
	multiple_sprites = TRUE
	pouch = TRUE

/obj/item/ammo_magazine/webly445
	name = "子弹袋 (.445 webly)"
	desc = "一袋.445 webly."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/webly445
	caliber = "webly445"
	max_ammo = 10
	weight = 0.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c44
	name = "子弹袋 (.44-40 Winchester)"
	desc = "一袋.44-40子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a44
	caliber = "a44"
	max_ammo = 30
	weight = 1.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c44magnum
	name = "子弹袋 (.44 magnum)"
	desc = "一袋.44马格南子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a44magnum
	caliber = "a44magnum"
	max_ammo = 30
	weight = 1.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/c8x50
	name = "子弹袋 (8x50mmR Lebel)"
	desc = "一袋8x50mmR勒贝尔子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a8x50
	caliber = "a8x50"
	max_ammo = 24
	weight = 0.95
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/murata
	name = "弹夹 (8x53mm)"
	icon_state = "kclip"
	caliber = "a8x53"

	ammo_type = /obj/item/ammo_casing/a8x53
	max_ammo = 5
	weight = 0.048
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/murata_box
	name = "弹匣箱 (8x53mm)"
	icon_state = "arisaka_ammo"
	mag_type = MAGAZINE
	caliber = "a8x53"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = /obj/item/ammo_casing/a8x53
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE

/obj/item/ammo_magazine/enfield
	name = "弹夹 (.303)"
	icon_state = "clip"
	caliber = "a303"

	ammo_type = /obj/item/ammo_casing/a303
	max_ammo = 5
	weight = 0.048
	multiple_sprites = TRUE
	clip = TRUE

/obj/item/ammo_magazine/enfield_box
	name = "弹匣箱 (.303)"
	icon_state = "ammo"
	mag_type = MAGAZINE
	caliber = "a303"
	w_class = ITEM_SIZE_NORMAL

	ammo_type = /obj/item/ammo_casing/a303
	max_ammo = 50
	multiple_sprites = FALSE
	is_box = TRUE
/obj/item/ammo_magazine/c8x50_3clip
	name = "弹夹 (8x50mmR Lebel, 3u)"
	icon_state = "clip"

	ammo_type = /obj/item/ammo_casing/a8x50
	caliber = "a8x50"
	max_ammo = 3
	weight = 0.035
	multiple_sprites = TRUE
	clip = TRUE
/obj/item/ammo_magazine/c8x50_5clip
	name = "弹夹 (8x50mmR Lebel, 5u)"
	icon_state = "clip"

	ammo_type = /obj/item/ammo_casing/a8x50
	caliber = "a8x50"
	max_ammo = 5
	weight = 0.048
	multiple_sprites = TRUE
	clip = TRUE
/obj/item/ammo_magazine/c44p
	name = "子弹袋 (.44)"
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a44p
	caliber = "a44p"
	max_ammo = 18
	weight = 0.4
	multiple_sprites = TRUE

	desc = "一袋装有18发.44手枪弹."

/obj/item/ammo_magazine/c357
	name = "子弹袋 (.357 magnum)"
	desc = "一袋.357马格南子弹."
	icon_state = "pouch"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = "a357"
	max_ammo = 30
	weight = 1.1
	multiple_sprites = TRUE

	pouch = TRUE

/obj/item/ammo_magazine/shellbox
	name = "霰弹鹿弹盒 (.12 gauge)"
	icon_state = "shellbox"
	mag_type = MAGAZINE
	caliber = "12gauge"
	w_class = ITEM_SIZE_SMALL

	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	max_ammo = 12
	multiple_sprites = TRUE
	is_box = TRUE

/obj/item/ammo_magazine/shellbox/slug
	name = "霰弹枪独头弹盒 (.12号口径)"
	icon_state = "slugbox"
	ammo_type = /obj/item/ammo_casing/shotgun/slug

/obj/item/ammo_magazine/shellbox/beanbag
	name = "霰弹枪豆袋弹盒 (.12号口径)"
	icon_state = "beanbagbox"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/ammo_magazine/shellbox/rubber
	name = "霰弹枪橡胶弹盒 (.12号口径)"
	icon_state = "beanbagbox"
	ammo_type = /obj/item/ammo_casing/shotgun/rubber

/obj/item/ammo_magazine/shellbox/breaching
	name = "霰弹枪破门独头弹盒 (.12号口径)"
	icon_state = "slugbox"
	ammo_type = /obj/item/ammo_casing/shotgun/breaching
