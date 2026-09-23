/obj/structure/cannon/modern
	name = "野战炮"
	icon = 'icons/obj/cannon.dmi'
	icon_state = "modern_cannon"
	ammotype = /obj/item/cannon_ball/shell
	spritemod = FALSE
	pixel_x = 0
	pixel_y = 0

	firedelay = 1
	minrange = 20
	maxrange = 80
	w_class = ITEM_SIZE_GARGANTUAN

/obj/structure/cannon/modern/naval
	name = "舰炮"
	desc = "通常安装在舰船上的巨型火炮."
	icon = 'icons/obj/ship_cannon.dmi'
	icon_state = "naval_cannon"
	ammotype = /obj/item/cannon_ball/shell/naval
	spritemod = FALSE
	firedelay = 1
	minrange = 20
	maxrange = 200
	anchored = TRUE
	density = TRUE
	bound_height = 96
	bound_width = 64
	caliber = 204
	can_assemble = FALSE
	is_naval = TRUE
	naval_position = "middle"

/obj/structure/cannon/modern/naval/attack_hand(var/mob/user)
	if (ishuman(user) && (map.ID == MAP_BATTLE_SHIPS))
		var/mob/living/human/H = user
		if (findtext(H.original_job_title,"Marine"))
			to_chat(user, SPAN_WARNING("You do not know how to operate this gun!"))
			return
		else
			interact(user)
	else
		interact(user)

/obj/structure/cannon/modern/naval/n380
	name = "380毫米舰炮"
	ammotype = /obj/item/cannon_ball/shell/naval/HE380
	firedelay = 1
	maxrange = 150
	caliber = 380
	density = FALSE

/obj/structure/cannon/modern/naval/n380/left
	naval_position = "left"
/obj/structure/cannon/modern/naval/n380/right
	naval_position = "right"

/obj/structure/cannon/modern/naval/n150
	name = "150毫米舰炮"
	ammotype = /obj/item/cannon_ball/shell/naval/HE150
	firedelay = 1
	maxrange = 80
	caliber = 150
	density = FALSE

/obj/structure/cannon/modern/naval/n150/left
	naval_position = "left"
/obj/structure/cannon/modern/naval/n150/right
	naval_position = "right"

/obj/structure/naval_cannon_control
	name = "舰炮炮塔控制"
	desc = "控制舰炮炮塔的旋转."
	icon = 'icons/obj/structures.dmi'
	icon_state = "gate_control"
	anchored = TRUE
	var/cooldown = 3 SECONDS
	var/debounce = 0
	var/distance = 3
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE
	layer = 3.01

/obj/structure/naval_cannon_control/attack_hand(var/mob/user as mob)
	if (ishuman(user) && (map.ID == MAP_BATTLE_SHIPS))
		var/mob/living/human/H = user
		if (findtext(H.original_job_title,"Marine"))
			to_chat(user, SPAN_WARNING("You do not know how to operate this machinery!"))
			return
	if (debounce <= world.time)
		debounce = world.time + cooldown
		var/turning_side = WWinput(user, "What side are you turning the to turret?", "Cannon Battery Control", "Cancel", list("Left", "Right", "Cancel"))
		if (turning_side == "Cancel")
			return
		else
			if (do_after(user,50,src))
				playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
				for (var/obj/structure/cannon/modern/naval/C in range(distance, get_turf(src)))
					if (turning_side == "Left")
						C.rotate_left()
					if (turning_side == "Right")
						C.rotate_right()
			return
	else
		to_chat(user, SPAN_WARNING("The turret turned too recently. Try again in a bit"))

/obj/structure/cannon/modern/tank
	name = "坦克炮"
	desc = "一种供车辆搭载的简易火炮."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "tank_cannon"
	ammotype = /obj/item/cannon_ball/shell/tank
	layer = MOB_LAYER + 1 //just above mobs
	spritemod = FALSE
	firedelay = 1
	minrange = 5
	maxrange = 25
	anchored = TRUE
	bound_height = 32
	bound_width = 32
	density = TRUE
	caliber = 75
	New()
		..()
		w_class = caliber/2

/obj/structure/cannon/modern/tank/autoloader
	name = "带自动装弹机的坦克炮"
	desc = "一种供车辆搭载的简易火炮."
	autoloader = TRUE

/obj/structure/cannon/modern/voyage
	spritemod = TRUE
	w_class = ITEM_SIZE_HUGE
	maxrange = 35
	distance = 20
	caliber = 75
	name = "火炮"
	icon = 'icons/obj/cannon.dmi'
	density = TRUE
	icon_state = "cannon"
	bound_height = 64
	bound_width = 32
	pixel_x = -16
	pixel_y = 0
	anchored = TRUE
	ammotype = /obj/item/cannon_ball

/obj/structure/cannon/modern/voyage/autofire //npc cannon
	var/stopfiring = FALSE
	attack_hand(mob/user)
		return

	New()
		..()
		do_autofire_proc()

	proc/do_autofire_proc()
		spawn(120+rand(-12,26))
			do_autofire()
			if (!stopfiring)
				do_autofire_proc()

	proc/do_autofire()
		var/found = FALSE
		for(var/mob/living/simple_animal/hostile/human/HH in range(2,src))
			if(HH.stat != DEAD && HH.fire_cannons == TRUE)
				found = TRUE
				break
		if (!found)
			return
		if (!loaded)
			var/obj/item/cannon_ball/W
			if (src.z == world.maxz)
				if (prob(25))
					W = new/obj/item/cannon_ball/chainshot(src)
				else
					if (prob(50))
						W = new/obj/item/cannon_ball/grapeshot(src)
					else
						W = new/obj/item/cannon_ball(src)
			else
				W = new/obj/item/cannon_ball(src)
			loaded = W
			distance = 13+rand(-5,5)
			get_target_coords()
			target_x += rand(-5,5)
			var/turf/TF = locate(src.x + target_x, src.y + target_y)
			if (!TF)
				return FALSE

			var/obj/item/projectile/shell/S = new W.subtype(loc)
			S.damage = W.damage
			S.atype = W.atype
			S.caliber = W.caliber
			S.heavy_armor_penetration = W.heavy_armor_penetration
			S.name = W.name
			S.starting = get_turf(src)
			loaded = null
			if (S.atype == "grapeshot")
				var/tot = pick(3,4)
				for(var/i = 1, i<= tot,i++)
					var/obj/item/projectile/shell/S1 = new S.type(loc)
					S1.damage = S.damage
					S1.atype = S.atype
					S1.caliber = S.caliber
					S1.heavy_armor_penetration = S.heavy_armor_penetration
					S1.name = S.name
					S1.starting = get_turf(src)
					S1.launch(TF, null, src, rand(-2,2), 0)
			else
				S.launch(TF, null, src, 0, 0)
			// screen shake
			for (var/mob/m in player_list)
				if (m.client)
					var/abs_dist = abs(m.x - x) + abs(m.y - y)
					if (abs_dist <= 15)
						shake_camera(m, 3, (5 - (abs_dist/10)))
			// smoke
			spawn (rand(3,4))
				new/obj/effect/effect/smoke/chem(get_step(src, dir))
			spawn (rand(5,6))
				new/obj/effect/effect/smoke/chem(get_step(src, dir))
			// sound
			spawn (rand(1,2))
				var/turf/t1 = get_turf(src)
				playsound(t1, "artillery_out", 100, TRUE)
				playsound(t1, "artillery_out_distance", 100, TRUE)

/obj/structure/cannon/modern/tank/german75
	name = "7.5厘米 KwK 40"
	desc = "一门75毫米德国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 75

/obj/structure/cannon/modern/tank/american75
	name = "75毫米 M3 炮"
	desc = "一门75毫米美国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 75

/obj/structure/cannon/modern/tank/american76
	name = "76毫米 M32 炮"
	desc = "一门76.2毫米美国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 76.2

/obj/structure/cannon/modern/tank/russian76/americanfield
	name = "76.2毫米 M5 炮"
	desc = "一门76.2毫米美国反坦克炮."
	icon_state = "feldkanone18"
	icon = 'icons/obj/cannon.dmi'
	maxrange = 30
	assembled = FALSE
	can_assemble = TRUE
	New()
		..()
		loader_chair = new /obj/structure/bed/chair/loader(src)
		gunner_chair = new /obj/structure/bed/chair/gunner(src)

/obj/structure/cannon/modern/tank/american90
	name = "90毫米 M41 炮"
	desc = "一门90毫米美国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 90

/obj/structure/cannon/modern/tank/japanese57
	name = "97式炮"
	desc = "一门57毫米日本坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 57

/obj/structure/cannon/modern/tank/japanese37
	name = "94式炮"
	desc = "一门37毫米日本坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 37

/obj/structure/cannon/modern/tank/german88
	name = "8.8厘米 KwK 36"
	desc = "一门88毫米德国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 88

/obj/structure/cannon/modern/tank/omwtc10
	name = "OMW-TC 100毫米"
	desc = "一门100毫米雷德梅尼亚坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 100

/obj/structure/cannon/modern/tank/autoloader/omwtc10
	name = "OMW-TC 100毫米"
	desc = "一门100毫米雷德梅尼亚坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 100

/obj/structure/cannon/modern/tank/autoloader/t90a
	name = "2A46 125毫米"
	desc = "一门125毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 125

/obj/structure/cannon/modern/tank/leopard
	name = "莱茵金属 120毫米 L/55"
	desc = "一门120毫米德国坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 120

/obj/structure/cannon/modern/tank/challenger2
	name = "L30A1 120毫米"
	desc = "L30A1, 正式编号为 Gun 120mm Tk L30, 是一款英国设计的120毫米线膛坦克炮, 安装在挑战者2主战坦克的炮塔上."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 120

/obj/structure/cannon/modern/tank/m1a1_abrams
	name = "M256 120毫米"
	desc = "M256是一款美国120毫米滑膛坦克炮. 它使用德国设计的Rh-120 L44炮管和可燃药筒, 以及美国设计的炮架, 摇架和后坐装置."
	maxrange = 35
	caliber = 120

/obj/structure/cannon/modern/tank/baftkn75
	name = "BAF TKN 75毫米"
	desc = "一门75毫米布鲁戈斯拉夫坦克炮."
	icon_state = "tank_cannon"
	maxrange = 30
	caliber = 75

/obj/structure/cannon/modern/tank/german88/field
	name = "8.8厘米 Pak 43 炮"
	desc = "一门88毫米德国反坦克炮."
	icon_state = "feldkanone18"
	icon = 'icons/obj/cannon.dmi'
	maxrange = 38
	assembled = FALSE
	can_assemble = TRUE
	New()
		..()
		loader_chair = new /obj/structure/bed/chair/loader(src)
		gunner_chair = new /obj/structure/bed/chair/gunner(src)

/obj/structure/cannon/modern/tank/russian122
	name = "122毫米 M1943 D-25T"
	desc = "一门122毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 27
	caliber = 122

/obj/structure/cannon/modern/tank/russian76
	name = "76毫米 M1940 F-34"
	desc = "一门76.2毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 27
	caliber = 76.2

/obj/structure/cannon/modern/tank/russian45
	name = "45毫米 M1932 20-K"
	desc = "一门45毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 45
	anchored = TRUE

/obj/structure/cannon/modern/tank/russian45/field
	name = "45毫米 M1932 野战炮"
	desc = "一门45毫米速射反坦克炮."
	icon_state = "feldkanone18"
	icon = 'icons/obj/cannon.dmi'
	maxrange = 30
	firedelay = 1
	assembled = FALSE
	can_assemble = TRUE
	New()
		..()
		loader_chair = new /obj/structure/bed/chair/loader(src)
		gunner_chair = new /obj/structure/bed/chair/gunner(src)

/obj/structure/cannon/modern/tank/italian47
	name = "47毫米 47/32 mod.35"
	desc = "一门45毫米意大利坦克炮."
	icon_state = "tank_cannon"
	maxrange = 25
	caliber = 47
	anchored = TRUE

/obj/structure/cannon/modern/tank/russian85
	name = "85毫米 S-53"
	desc = "一门85毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 33
	caliber = 85
	anchored = TRUE

/obj/structure/cannon/modern/tank/russian85/su85
	desc = "一门85毫米SU-85俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 35
	caliber = 85
	anchored = TRUE

/obj/structure/cannon/modern/tank/russian85/kv1

/obj/structure/cannon/modern/tank/russian85/field
	name = "85毫米 M1939 52-K 炮"
	desc = "一门由85毫米俄罗斯高射炮改装而成的反坦克炮."
	icon_state = "feldkanone18"
	icon = 'icons/obj/cannon.dmi'
	maxrange = 38
	assembled = FALSE
	can_assemble = TRUE
	New()
		..()
		loader_chair = new /obj/structure/bed/chair/loader(src)
		gunner_chair = new /obj/structure/bed/chair/gunner(src)

/obj/structure/cannon/modern/tank/russian100
	name = "100毫米 D10S"
	desc = "一门100毫米俄罗斯坦克炮."
	icon_state = "tank_cannon"
	maxrange = 33
	caliber = 100
	anchored = TRUE

/obj/structure/cannon/modern/tank/russian115
	name = "115毫米 2A20"
	desc = "一门115毫米俄式坦克炮。"
	icon_state = "tank_cannon"
	maxrange = 33
	caliber = 115
	anchored = TRUE

/obj/structure/cannon/modern/tank/bmv75
	name = "BMV-TC 75毫米"
	desc = "一门75毫米雷德梅尼亚坦克炮。"
	icon_state = "tank_cannon"
	maxrange = 30
	caliber = 75

/obj/structure/cannon/modern/tank/smf75
	name = "SMF TKN 75毫米"
	desc = "一门75毫米布卢戈斯拉夫坦克炮。"
	icon_state = "tank_cannon"
	maxrange = 30
	caliber = 75

/obj/structure/cannon/mortar
	name = "迫击炮"
	icon = 'icons/obj/cannon_ball.dmi'
	layer = MOB_LAYER + 1 //just above mobs
	density = TRUE
	icon_state = "mortar"
	pixel_x = 0
	pixel_y = 0
	bound_height = 32
	bound_width = 32
	anchored = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	ammotype = /obj/item/cannon_ball/mortar_shell
	spritemod = FALSE //if true, uses 32x64
	explosion = TRUE
	reagent_payload = "none"
	minrange = 10
	maxrange = 40
	firedelay = 12
	w_class = ITEM_SIZE_HUGE

/obj/structure/cannon/mortar/foldable
	anchored = TRUE
	var/path

/obj/structure/cannon/mortar/foldable/type89
	name = "89式迫击炮"
	icon_state = "type89"
	anchored = TRUE
	ammotype = /obj/item/cannon_ball/mortar_shell/type89 || /obj/item/weapon/grenade/ww2/type91
	explosion = TRUE
	maxrange = 30
	firedelay = 8
	path = /obj/item/weapon/foldable/type89_mortar

/obj/structure/cannon/mortar/foldable/generic
	name = "折叠迫击炮"
	icon_state = "mortar"
	anchored = TRUE
	ammotype = /obj/item/cannon_ball/mortar_shell
	explosion = TRUE
	maxrange = 35
	firedelay = 12
	path = /obj/item/weapon/foldable/generic

/obj/structure/cannon/mortar/foldable/verb/retrieve()
	set category = null
	set name = "Retrieve"
	set src in range(1, usr)
	if (usr.l_hand && usr.r_hand)
		to_chat(usr, (SPAN_WARNING("You need to have a hand free to do this.")))
		return
	usr.face_atom(src)
	visible_message(SPAN_WARNING("[usr] starts to get \the [src] from the ground."))
	for (var/obj/item/cannon_ball/mortar_shell/I in loaded)
		I.loc = get_turf(src)
		loaded -= I
		visible_message(SPAN_WARNING("[usr] unloads \the [src]."))
	if (do_after(usr, 25, get_turf(usr)))
		qdel(src)
		usr.put_in_any_hand_if_possible(new path, prioritize_active_hand = TRUE)
		visible_message(SPAN_WARNING("[usr] retrieves \the [src] from the ground."))

/obj/structure/cannon/mortar/foldable/AltClick(mob/user)
	retrieve()
	return

/obj/structure/cannon/mortar/foldable/attackby(obj/item/I as obj, mob/M as mob)
	if (istype(I, ammotype))
		if (loaded.len)
			to_chat(M, "<span class = 'warning'>已经装填了[loaded[1]]。</span>")
			return
		// load first and only slot
		if (do_after(M, 45, src, can_move = TRUE))
			if (M && (locate(M) in range(1,src)))
				M.remove_from_mob(I)
				I.loc = src
				loaded += I

/obj/structure/cannon/davycrockett
	name = "M29戴维·克罗克特"
	icon = 'icons/obj/cannon.dmi'
	layer = MOB_LAYER + 1 //just above mobs
	density = TRUE
	icon_state = "m29_davy_crockett_empty"
	pixel_x = 0
	pixel_y = 0
	bound_height = 32
	bound_width = 32
	anchored = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	ammotype = /obj/item/cannon_ball/rocket/nuclear
	spritemod = TRUE //if true, uses 32x64
	explosion = TRUE
	nuclear = TRUE
	reagent_payload = "none"
	maxrange = 40
	firedelay = 24
	w_class = ITEM_SIZE_GARGANTUAN

/obj/structure/cannon/davycrockett/attackby(obj/item/W as obj, mob/M as mob)
	if (loaded)
		icon_state = "m29_davy_crockett_loaded"
	else
		icon_state = "m29_davy_crockett_empty"

/obj/structure/cannon/rocket
	name = "火箭炮"
	desc = "一种发射无制导火箭的火炮,精度极差但数量多时致命。"
	icon = 'icons/obj/cannon.dmi'
	icon_state = "modern_rocket"
	ammotype = /obj/item/cannon_ball/rocket
	spritemod = FALSE
	pixel_x = 0
	pixel_y = 0
	bound_height = 32
	bound_width = 32
	firedelay = 12
	minrange = 15
	maxrange = 60
	max_loaded = 12
	w_class = ITEM_SIZE_GARGANTUAN
	see_amount_loaded = TRUE

/obj/structure/cannon/rocket/nebelwerfer
	name = "内贝尔维尔弗"
	desc = "德国158毫米火箭炮。声音真大。"
	icon = 'icons/obj/cannon.dmi'
	icon_state = "nebelwerfer"
	ammotype = /obj/item/cannon_ball/rocket
	spritemod = FALSE
	pixel_x = 0
	pixel_y = 0
	bound_height = 32
	bound_width = 32
	firedelay = 10
	minrange = 15
	maxrange = 60
	max_loaded = 6
	w_class = ITEM_SIZE_GARGANTUAN
	see_amount_loaded = TRUE

/obj/structure/cannon/rocket/old
	icon_state = "old_rocket"
	max_loaded = 9

/obj/structure/cannon/rocket/loaded/New()
	..()
	for (var/i=1, i<=12, i++)
		loaded += new /obj/item/cannon_ball/rocket(src)