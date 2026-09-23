/obj/item/weapon/gun/projectile/automatic/stationary/maxim
	name = "Maxim 1895"
	desc = "原版马克沁机枪的俄罗斯版本, 安装在轮式枪架上. 使用俄罗斯7.62x54mm弹药."
	icon_state = "maxim"
	base_icon = "maxim"
	caliber = "a762x54_weak"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/maxim
	good_mags = list(/obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 10
	accuracy = 4

/obj/item/weapon/gun/projectile/automatic/stationary/maxim/ww2
	name = "Maxim"
	desc = "原版马克沁机枪的俄罗斯版本, 安装在轮式枪架上. 使用俄罗斯7.62x54mm弹药."
	icon_state = "maxim_ww2"
	base_icon = "maxim_ww2"
	hardness = 90
	caliber = "a762x54_weak"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/maxim
	good_mags = list(/obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 10
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/mg08
	name = "Maschinengewehr 08"
	desc = "德国重型马克沁机枪, 基于原版马克沁. 使用7.92x57mm毛瑟弹药."
	icon_state = "mg08"
	base_icon = "mg08"
	caliber = "a792x57_weak"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/mg08
	good_mags = list(/obj/item/ammo_magazine/mg08)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	recoil = 10
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/pkm
	name = "PKM machine gun"
	desc = "苏联重型PKM机枪. 使用7.62x54mm弹药."
	icon_state = "pkm"
	base_icon = "pkm"
	caliber = "a762x54_weak"
	magazine_type = /obj/item/ammo_magazine/pkm
	good_mags = list(/obj/item/ammo_magazine/pkm, /obj/item/ammo_magazine/pkm/c100, /obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.3, fire_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 10
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/dshk
	name = "DShK machine gun"
	desc = "苏联重型DShK机枪, 也可作为反载具枪对付一些轻装甲载具. 使用12.7x108mm弹药."
	icon_state = "dshk"
	base_icon = "dshk"
	caliber = "a127"
	magazine_type = /obj/item/ammo_magazine/ammo127
	good_mags = list(/obj/item/ammo_magazine/ammo127)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.2, fire_delay=1.2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a127
	recoil = 25
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/nsvt
	name = "NSVT machine gun"
	desc = "现代苏联重型NSVT机枪, 也可作为反载具枪对付一些轻装甲载具. 使用12.7x108mm弹药."
	icon_state = "nsvt"
	base_icon = "nsvt"
	caliber = "a127"
	magazine_type = /obj/item/ammo_magazine/ammo127
	good_mags = list(/obj/item/ammo_magazine/ammo127)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.1, fire_delay=1.1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a127
	recoil = 30
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/foldable
	anchored = TRUE
	var/path

/obj/item/weapon/gun/projectile/automatic/stationary/foldable/verb/retrieve()
	set category = null
	set name = "Retrieve"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		to_chat(usr, SPAN_WARNING("You need to have a hand free to do this."))
		return
	usr.face_atom(src)

	visible_message(SPAN_WARNING("[usr] starts to get the [src] from the ground."))
	if (do_after(usr, 40, get_turf(usr)))
		unload_ammo(usr)
		qdel(src)
		usr.put_in_any_hand_if_possible(new path, prioritize_active_hand = TRUE)
		visible_message(SPAN_WARNING("[usr] retrieves the [src] from the ground."))

/obj/item/weapon/gun/projectile/automatic/stationary/foldable/pkm
	name = "Foldable PKM machine gun"
	desc = "苏联重型可折叠PKM机枪. 发射7.62x54mm弹药."
	icon_state = "pkm_foldable"
	base_icon = "pkm_foldable"
	caliber = "a762x54_weak"
	fire_sound = 'sound/weapons/guns/fire/Maxim.ogg'
	magazine_type = /obj/item/ammo_magazine/pkm
	good_mags = list(/obj/item/ammo_magazine/pkm, /obj/item/ammo_magazine/pkm/c100, /obj/item/ammo_magazine/maxim)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.3, fire_delay=1.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54/weak
	recoil = 10
	accuracy = 3

	path = /obj/item/weapon/foldable/pkm

/obj/item/weapon/gun/projectile/automatic/stationary/vickers
	name = "Vickers machine gun"
	desc = "水冷式重型机枪. 发射.303英国弹药."
	icon_state = "vickers"
	base_icon = "vickers"
	caliber = "a303_weak"
	fire_sound = 'sound/weapons/guns/fire/Vickers.ogg'
	magazine_type = /obj/item/ammo_magazine/vickers
	good_mags = list(/obj/item/ammo_magazine/vickers)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a303/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/vickers/type24
	name = "Type 24 machine gun"
	desc = "水冷式重型机枪. 发射7.92x57mm毛瑟弹药."
	icon_state = "vickers"
	base_icon = "vickers"
	caliber = "a792x57_weak"
	fire_sound = 'sound/weapons/guns/fire/Vickers.ogg'
	magazine_type = /obj/item/ammo_magazine/mg08
	good_mags = list(/obj/item/ammo_magazine/mg08)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=2, fire_delay=2, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a792x57/weak

/obj/item/weapon/gun/projectile/automatic/stationary/hotchkiss1914
	name = "Hotchkiss M1914 machine gun"
	desc = "一挺法国重机枪. 使用8x50mm勒贝尔弹."
	icon_state = "hotchkiss1914"
	base_icon = "hotchkiss1914"
	caliber = "a8x50_weak"
	magazine_type = /obj/item/ammo_magazine/hotchkiss
	good_mags = list(/obj/item/ammo_magazine/hotchkiss)
	ammo_type = /obj/item/ammo_casing/a8x50/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/type3
	name = "三年式重机枪"
	desc = "一挺基于法国哈奇开斯设计的日本重机枪. 使用6.5x50mm有坂弹."
	icon_state = "type3"
	base_icon = "type3"
	caliber = "a65x50_weak"
	magazine_type = /obj/item/ammo_magazine/type3
	good_mags = list(/obj/item/ammo_magazine/type3)
	ammo_type = /obj/item/ammo_casing/a65x50/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/type98
	name = "九二式重机枪"
	desc = "一挺日本重机枪. 使用7.7x58mm有坂弹."
	icon_state = "type92hmg"
	base_icon = "type92hmg"
	caliber = "a77x58"
	fire_sound = 'sound/weapons/guns/fire/Type92.ogg'
	magazine_type = /obj/item/ammo_magazine/type92
	good_mags = list(/obj/item/ammo_magazine/type92)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.8, fire_delay=1.8, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a77x58
	attachment_slots = ATTACH_SCOPE
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/type98/update_icon()
	icon_state = "type92hmg[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 5) : "_empty"]"

/obj/structure/type92tripod
	name = "九二式三脚架"
	desc = "九二式重机枪的三脚架. 把枪架上去即可使用."
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "type92hmg_stand"
	anchored = FALSE
	not_disassemblable = TRUE
	density = TRUE

/obj/structure/type92tripod/attackby(var/obj/item/W as obj, var/mob/living/human/H as mob)
	if (istype(W, /obj/item/weapon/type92hmg))
		if (do_after(H, 20, H.loc) && src)
			new /obj/item/weapon/gun/projectile/automatic/stationary/type98(src.loc)
			qdel(src)
			qdel(W)
			visible_message("<span class='danger'>[H]开始组装九二式重机枪.</span>", "<span class='danger'>你开始组装九二式重机枪.</span>")
			return
	else
		to_chat(usr, SPAN_WARNING("You cant put that on the tripod!"))
		return

/obj/structure/type92tripod/attack_hand(var/mob/living/human/H as mob)
	if (H.l_hand && H.r_hand)
		to_chat(H, SPAN_WARNING("You need to have a hand free to do this."))
		return
	H.face_atom(src)
	visible_message(SPAN_WARNING("[H] starts to retrieve the [src]."))
	if (do_after(H, 20, H.loc) && src)
		H.put_in_any_hand_if_possible(new /obj/item/weapon/type92tripod, prioritize_active_hand = TRUE)
		qdel(src)
		visible_message(SPAN_WARNING("[H] grabs the [src]."))
		return

	visible_message(SPAN_WARNING("[usr] starts to disassemble the [src]."))

/obj/item/weapon/type92tripod
	name = "九二式重机枪三脚架"
	desc = "用于搭建机枪阵地"
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "tripod"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_NORMAL
	item_state = "tripod"
	w_class = ITEM_SIZE_HUGE
	slowdown = 0.3

	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/weapon/type92tripod/attack_self(mob/user)
	if (ishuman(user))
		var/turf/targetfloor = get_turf(get_step(user, user.dir))
		if (istype(targetfloor, /turf/wall) || istype(targetfloor, /turf/floor/beach/water/deep/saltwater))
			to_chat(usr, SPAN_WARNING("You cant place this here!."))
			return
		else
			var/mob/living/human/H = user
			visible_message("<span class='danger'>[H]开始放置九二式三脚架.</span>", "<span class='danger'>你开始放置九二式三脚架.</span>")
			if (do_after(H, 20, H.loc) && src)
				qdel(src)
				new/obj/structure/type92tripod(get_step(H, H.dir), H)
				visible_message("<span class='danger'>[user]完成了九二式三脚架的放置.</span>")
				return

/obj/item/weapon/type92hmg
	name = "拆卸的九二式重机枪"
	desc = "把它架到九二式三脚架上即可组装成武器. 否则毫无用处."
	icon = 'icons/obj/guns/mgs.dmi'
	icon_state = "type92hmg_item"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_NORMAL
	item_state = "type92hmg_item"
	w_class = ITEM_SIZE_HUGE
	slowdown = 0.6

	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/weapon/gun/projectile/automatic/stationary/type98/verb/disassemble()
	set category = null
	set name = "Disassemble"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		to_chat(usr, SPAN_WARNING("You need to have a hand free to do this."))
		return
	usr.face_atom(src)

	visible_message(SPAN_WARNING("[usr] starts to disassemble the [src]."))
	if (do_after(usr, 40, get_turf(usr)))
		if (src.ammo_magazine)
			unload_ammo(usr)
			new /obj/item/weapon/type92tripod(src.loc)
			new /obj/item/weapon/type92hmg(src.loc)
			qdel(src)
			return
		else
			usr.put_in_any_hand_if_possible(new /obj/item/weapon/type92hmg, prioritize_active_hand = TRUE)
			new /obj/item/weapon/type92tripod(src.loc)
			qdel(src)
			visible_message(SPAN_WARNING("[usr] disassembles the [src]."))
			return


/obj/item/weapon/gun/projectile/automatic/stationary/breda30
	name = "布雷达30轻机枪"
	desc = "菲亚特-米特拉利亚托雷-布雷达30型是一挺于1930年服役的意大利轻机枪. 该枪的设计相当不实用, 往往导致装填时间过长. 使用6.5x52mm卡尔卡诺弹."
	icon_state = "type92hmg"
	base_icon = "type92hmg"
	caliber = "a65x52"
	fire_sound = 'sound/weapons/guns/fire/Type92.ogg'
	reload_sound = 'sound/weapons/guns/interact/breda30_clip.ogg'
	magazine_type = /obj/item/ammo_magazine/breda30
	good_mags = list(/obj/item/ammo_magazine/breda30)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=3.0, fire_delay=1.0, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a65x52
	load_method = SINGLE_CASING | SPEEDLOADER
	max_shells = 20
	load_delay = 12
	recoil = 20
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/breda30/update_icon()
	icon_state = "type92hmg[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 5) : "_empty"]"

/obj/item/weapon/gun/projectile/automatic/stationary/breda30/hull
	name = "车载布雷达30轻机枪"
	anchored = TRUE
	density = FALSE
	can_turn = FALSE

/obj/item/weapon/gun/projectile/automatic/stationary/solothurn
	name = "索罗通S-18/1000"
	desc = "索罗通S18/1000 20mm是一支瑞士反坦克步枪. 它是S-18/100的后期型号, 经过改装以获得更高的枪口初速以及更大的弹药尺寸. 更强大的弹药带来了显著的后坐力, 对射手而言颇为棘手, 而其尺寸也使其难以携带."
	icon_state = "type92hmg"
	base_icon = "type92hmg"
	caliber = "a20"
	handle_casings = EJECT_CASINGS
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	reload_sound = 'sound/weapons/guns/interact/breda30_clip.ogg'
	magazine_type = /obj/item/ammo_magazine/a20mm_aphe
	good_mags = list(/obj/item/ammo_magazine/a20mm_aphe)
	firemodes = list(
		list(name = "semiauto", burst=1, burst_delay=1, fire_delay=6.0, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a20mm_aphe
	load_method = SINGLE_CASING | SPEEDLOADER
	max_shells = 10
	load_delay = 60
	recoil = 30
	accuracy = 2

/obj/item/weapon/gun/projectile/automatic/stationary/solothurn/update_icon()
	icon_state = "type92hmg[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 5) : "_empty"]"

/obj/item/weapon/gun/projectile/automatic/stationary/solothurn/italian
	name = "菲亚特反坦克步枪S Mod.39"
	desc = "瑞士索罗通S18/1000 20mm反坦克步枪的意大利型号. 它是S-18/100的后期型号, 经过改装以获得更高的枪口初速以及更大的弹药尺寸. 更强大的弹药带来了显著的后坐力, 对射手而言颇为棘手, 而其尺寸也使其难以携带."

/obj/item/weapon/gun/projectile/automatic/stationary/solothurn/italian/stationary
	name = "车载菲亚特反坦克步枪S Mod.39"
	anchored = TRUE
	density = FALSE
	can_turn = FALSE

/obj/item/weapon/gun/projectile/automatic/stationary/browning
	name = "M1919A1勃朗宁机枪"
	desc = "一挺美国重机枪. 使用30-06弹."
	icon_state = "browning"
	base_icon = "browning"
	caliber = "a3006"
	fire_sound = 'sound/weapons/guns/fire/M1919.ogg'
	magazine_type = /obj/item/ammo_magazine/browning
	good_mags = list(/obj/item/ammo_magazine/browning)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.8, fire_delay=1.1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a3006
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/browning/update_icon()
	icon_state = "browning[ammo_magazine ? round(ammo_magazine.stored_ammo.len, 50) : "_empty"]"

/obj/item/weapon/gun/projectile/automatic/stationary/m2browning
	name = "M2HB勃朗宁机枪"
	desc = "一挺美国重机枪. 使用.50口径弹."
	icon_state = "m2"
	base_icon = "m2"
	caliber = "a50cal"
	fire_sound = 'sound/weapons/guns/fire/M1919.ogg'
	magazine_type = /obj/item/ammo_magazine/a50cal_can
	good_mags = list(/obj/item/ammo_magazine/a50cal_can)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.8, fire_delay=1.1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a50cal/weak
	recoil = 30
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/mg34
	name = "MG 34机枪"
	desc = "一挺德国重机枪. 使用7.92x57毛瑟弹."
	icon_state = "mg34hmg"
	base_icon = "mg34hmg"
	caliber = "a792x57_weak"
	magazine_type = /obj/item/ammo_magazine/mg34belt
	good_mags = list(/obj/item/ammo_magazine/mg34belt, /obj/item/ammo_magazine/mg34)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1, fire_delay=1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a792x57/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/mg3
	name = "MG 3机枪"
	desc = "一挺德国重机枪. 使用7.62x51mm弹."
	icon_state = "mg3"
	base_icon = "mg3"
	caliber = "a792x57_weak"
	magazine_type = /obj/item/ammo_magazine/mg3belt
	good_mags = list(/obj/item/ammo_magazine/mg3belt)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1, fire_delay=1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x51/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/fnmag
	name = "FN MAG机枪"
	desc = "一挺比利时通用机枪, 由欧内斯特·韦尔维耶于20世纪50年代初设计. 它已被80多个国家使用, 并在多个国家获得授权生产."
	icon_state = "mg3"
	base_icon = "mg3"
	caliber = "a792x57_weak"
	magazine_type = /obj/item/ammo_magazine/mg3belt
	good_mags = list(/obj/item/ammo_magazine/mg3belt)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1, fire_delay=1, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x51/weak
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/blugoslavia
	name = "BHMG-21机枪"
	desc = "一挺布卢戈斯拉夫重机枪. 使用7.62x54mm弹."
	icon_state = "pkm"
	base_icon = "pkm"
	caliber = "a762x54"
	magazine_type = /obj/item/ammo_magazine/emptybelt/filled_762x54
	good_mags = list(/obj/item/ammo_magazine/emptybelt,/obj/item/ammo_magazine/emptybelt/filled_762x54)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=1.3, fire_delay=2.5, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54
	recoil = 25
	accuracy = 3

/obj/item/weapon/gun/projectile/automatic/stationary/redmenia
	name = "RK-42固定机枪"
	desc = "一挺雷德梅尼亚重机枪. 使用5.56x45mm弹."
	icon_state = "nsvt"
	base_icon = "nsvt"
	caliber = "a556x45"
	magazine_type = /obj/item/ammo_magazine/emptybelt/filled_556x45
	good_mags = list(/obj/item/ammo_magazine/emptybelt,/obj/item/ammo_magazine/emptybelt/filled_556x45)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=3, fire_delay=2.3, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a762x54
	recoil = 25
	accuracy = 3

// Autocannons

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon
	name = "30mm机炮"
	desc = "一门能在人身上打出相当大的窟窿的机炮."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a30mm_ap
	good_mags = list(/obj/item/ammo_magazine/a30mm_ap, /obj/item/ammo_magazine/a30mm_he)
	firemodes = list(
		list(name = "autocannon", burst=1, burst_delay=3, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	is_hmg = TRUE
	anchored = TRUE
	full_auto = FALSE
	recoil = 1
	accuracy = 1

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/process_projectile(obj/projectile, mob/user, atom/target, var/target_zone, var/params=null)
	var/obj/item/projectile/P = projectile
	P.loc = get_turf(user)
	P.dispersion = clamp(rand(-accuracy, accuracy), -30, 30)
	if(!P.launch(target, user, src))
		return FALSE
	return TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov2a42 // BMD-2
	name = "什普诺夫2A42 30mm机炮"
	desc = "30mm 2A42机炮是作为2A28格罗姆的替代品而研发的. 它发射30mm弹."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a30mm_ap
	good_mags = list(/obj/item/ammo_magazine/a30mm_ap, /obj/item/ammo_magazine/a30mm_he)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=3, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	full_auto = TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/shipunov2a72 // BTR-80
	name = "什普诺夫2A72 30mm机炮"
	desc = "2A42的轻型简化型号, 零件数量更少, 枪管更长, 枪口初速更高, 但射速也更低. 它发射30mm弹."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/2a72.ogg'
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a30mm_ap/btr80
	good_mags = list(/obj/item/ammo_magazine/a30mm_ap/btr80, /obj/item/ammo_magazine/a30mm_he/btr80)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=3, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	full_auto = TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/bushmaster // CV-90
	name = "大毒蛇III 35mm机炮"
	desc = "大毒蛇III是一门链式机炮, 与大毒蛇家族的其他成员一样, 这赋予了它极高的可靠性和防止弹药自燃的安全性, 尽管这确实导致了较低的射速."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a35"
	fire_sound = 'sound/weapons/guns/fire/2a72.ogg'
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a35mm_fap
	good_mags = list(/obj/item/ammo_magazine/a35mm_fap, /obj/item/ammo_magazine/a35mm_hei)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=5, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	full_auto = TRUE

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/bushmaster/bradley
	name = "M242\"大毒蛇\"25mm机炮"
	desc = "一门电力驱动, 弹链供弹的机炮, 用于打击各种目标."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a25"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a25mm_ap/bradley
	good_mags = list(/obj/item/ammo_magazine/a25mm_ap/bradley, /obj/item/ammo_magazine/a25mm_he/bradley)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=5, accuracy=list(2))
		)
	ammo_type = /obj/item/ammo_casing/a25mm_ap

/obj/item/weapon/gun/projectile/automatic/stationary/autocannon/red
	name = "30mm机炮"
	desc = "一门每分钟可发射20发弹的机炮."
	icon_state = "autocannon"
	base_icon = "autocannon"
	caliber = "a30"
	fire_sound = 'sound/weapons/guns/fire/30mm.ogg'
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	magazine_type = /obj/item/ammo_magazine/a30mm_ap
	good_mags = list(/obj/item/ammo_magazine/a30mm_ap, /obj/item/ammo_magazine/a30mm_ap/small, /obj/item/ammo_magazine/a30mm_he, /obj/item/ammo_magazine/a30mm_he/small)
	firemodes = list(
		list(name = "automatic", burst=1, burst_delay=3, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/a30mm_ap
	full_auto = FALSE

// ATGMs

/obj/item/weapon/gun/projectile/automatic/stationary/atgm
	name = "固定式反坦克导弹"
	desc = "一种能够摧毁装甲目标的反坦克导弹系统. 这一具被牢牢固定在地面上."
	icon_state = "atgm"
	base_icon = "atgm"
	caliber = "rocket"
	fire_sound = 'sound/weapons/guns/fire/rpg7.ogg'
	zoom_amount = ZOOM_CONSTANT*2+4
	load_method = SINGLE_CASING
	handle_casings = REMOVE_CASINGS
	magazine_type = /obj/item/ammo_magazine/mosin
	firemodes = list(
		list(name = "single shot", burst=1, accuracy=list(2)),
		)
	ammo_type = /obj/item/ammo_casing/rocket/atgm
	is_hmg = TRUE
	full_auto = FALSE
	anchored = TRUE

	var/atgm_ammo = /obj/item/ammo_casing/rocket/atgm
	var/max_rockets = 1
	var/list/rockets = new/list()
	var/release_force = 5
	var/firing_range = 30

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/attackby(obj/item/I as obj, mob/user as mob)
	if (istype(I, atgm_ammo))
		playsound(src.loc, 'sound/effects/rpgreload.ogg', 80, 0)
		if (rockets.len < max_rockets && do_after(user, load_delay, src, can_move = TRUE))
			user.remove_from_mob(I)
			I.loc = src
			rockets += I
			user.visible_message("[user]将[I]装入\the [src].", "你将[I]装入\the [src].")
			update_icon()
			return
		else
			to_chat(usr, SPAN_WARNING("\The [src] cannot hold any more rockets."))

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/unload_ammo(mob/user, var/allow_dump=1)
	if (rockets.len)
		for (var/obj/item/ammo_casing/rocket/I in rockets)
			I.loc = get_turf(src)
			rockets -= I
		update_icon()
	else
		to_chat(user, SPAN_WARNING("The ATGM is empty!"))


/obj/item/weapon/gun/projectile/automatic/stationary/atgm/handle_click_empty(mob/user)
	if (rockets.len <= 0)
		if (user)
			user.visible_message("*咔哒咔哒*", SPAN_DANGER("*click*"))
		else
			visible_message("*咔哒咔哒*")
		playsound(loc, 'sound/weapons/empty.ogg', 100, TRUE)

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/consume_next_projectile()
	if (rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/projectile/shell/missile/M = new I.projectile_type(src)
		playsound(get_turf(src), 'sound/weapons/guns/fire/rpg7.ogg', 100, TRUE)
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired an ATGM at [target].", key_name_admin(user))
	log_game("[key_name_admin(user)] used an ATGM at [target].")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null)
	projectile.loc = get_turf(user)
	if(istype(projectile, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/P = projectile
		P.dir = SOUTH
		P.launch(target, user, src)
		return TRUE

	return FALSE

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/update_icon()
	if (rockets.len > 0)
		icon_state = base_icon
	else
		icon_state = "[base_icon]_empty"

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/kornet
	name = "9K135短号"
	desc = "一种高精度, 俄罗斯激光制导反坦克导弹系统, 具备远程打击能力和先进穿甲能力, 专为现代战场交战而设计."
	icon_state = "kornet_atgm"
	base_icon = "kornet_atgm"

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/bgm_tow
	name = "BGM-71陶式"
	desc = "一种线导反坦克导弹, 以其在远距离上对装甲车辆的有效性而闻名."
	icon_state = "bgm71_tow_atgm"
	base_icon = "bgm71_tow_atgm"

// Foldable ATGMs

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable
	name = "可折叠反坦克导弹"
	desc = "一种能够摧毁装甲目标的反坦克导弹系统. 你可以通过右键点击它并按下\"取回\"来移动这一具."
	icon_state = "foldable_atgm"
	base_icon = "foldable_atgm"
	var/path = /obj/item/weapon/foldable/atgm

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable/AltClick(mob/living/human/user)
	if(!ishuman(user))
		return
	retrieve()

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable/verb/retrieve()
	set category = null
	set name = "Retrieve"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		to_chat(usr, SPAN_WARNING("You need to have a hand free to do this."))
		return
	usr.face_atom(src)
	visible_message(SPAN_WARNING("[usr] starts to get the [src] from the ground."))
	if (do_after(usr, 30, get_turf(usr)))
		for (var/obj/item/ammo_casing/rocket/I in rockets)
			I.loc = get_turf(src)
			rockets -= I
		qdel(src)
		usr.put_in_any_hand_if_possible(new path, prioritize_active_hand = TRUE)
		visible_message(SPAN_WARNING("[usr] retrieves the [src] from the ground."))

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable/kornet
	name = "9K135短号"
	desc = "一种高精度, 俄罗斯激光制导反坦克导弹系统, 具备远程打击能力和先进穿甲能力, 专为现代战场交战而设计."
	icon_state = "kornet_atgm"
	base_icon = "kornet_atgm"
	path = /obj/item/weapon/foldable/atgm/kornet

/obj/item/weapon/gun/projectile/automatic/stationary/atgm/foldable/bgm_tow
	name = "BGM-71陶式"
	desc = "一种线导反坦克导弹, 以其在远距离上对装甲车辆的有效性而闻名."
	icon_state = "bgm71_tow_atgm"
	base_icon = "bgm71_tow_atgm"
	path = /obj/item/weapon/foldable/atgm/bgm_tow