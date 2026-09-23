/obj/item/weapon/material
	var/chopping_speed = 5
/obj/item/weapon/material/harpoon
	name = "鱼叉"
	sharp = TRUE
	edge = TRUE
	desc = "适合捕鲸."
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "harpoon"
	item_state = "harpoon"
	throw_speed = 3
	throw_range = 7
	allow_spin = FALSE
	default_material = "wood"
	force_divisor = 0.4 // 24 with hardness 60 (steel)
	thrown_force_divisor = 1.1 // 22 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 8
	block_chance = 12
	cooldownw = 7

/obj/item/weapon/material/harpoon/iron
	name = "铁鱼叉"
	default_material = "iron"

/obj/item/weapon/material/handle
	name = "手柄"
	sharp = FALSE
	edge = FALSE
	desc = "一根顶部带有插槽用于连接物品的基础棍子.可以制成各种武器和工具."
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "handle"
	item_state = "spear"
	default_material = "wood"
	throw_speed = 7
	throw_range = 7
	force_divisor = 0.2 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.4 // 8 with weight 20 (steel)
	attack_verb = list("jabbed","hit","bashed")
	value = 3
	block_chance = 10
	cooldownw = 7

/obj/item/weapon/material/trowel
	name = "种植铲"
	sharp = FALSE
	edge = FALSE
	desc = "一种用于园艺活动的短铲,例如清空或填充花盆."
	icon_state = "trowel"
	item_state = "trowel"
	default_material = "iron"
	throw_speed = 4
	throw_range = 4
	force_divisor = 0.2 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.2 // 8 with weight 20 (steel)
	attack_verb = list("jabbed","hit","bashed")
	cooldownw = 7


/obj/item/weapon/material/bust
	name = "半身像"
	sharp = FALSE
	edge = FALSE
	desc = "一尊人物石雕半身像"
	icon_state = "bust"
	item_state = "bust"
	default_material = "stone"
	throw_speed = 3
	throw_range = 3
	allow_spin = FALSE
	force_divisor = 0.35
	thrown_force_divisor = 0.35
	attack_verb = list("bludgeoned","hit","bashed")
	value = 15
	block_chance = 10
	cooldownw = 7

/obj/item/weapon/material/hippocratic
	name = "希波克拉底半身像"
	sharp = FALSE
	edge = FALSE
	desc = "一尊希波克拉底石雕半身像"
	icon_state = "hippocratic"
	item_state = "hippocratic"
	default_material = "stone"
	throw_speed = 3
	throw_range = 3
	allow_spin = FALSE
	force_divisor = 0.35
	thrown_force_divisor = 0.35
	attack_verb = list("bludgeoned","hit","bashed")
	value = 15
	block_chance = 10
	cooldownw = 7

/obj/item/weapon/material/marx
	name = "卡尔·马克思青铜半身像"
	sharp = FALSE
	edge = FALSE
	desc = "一尊卡尔·马克思青铜半身像"
	icon_state = "marx"
	item_state = "marx"
	default_material = "bronze"
	throw_speed = 3
	throw_range = 3
	allow_spin = FALSE
	force_divisor = 0.35
	thrown_force_divisor = 0.35
	attack_verb = list("bludgeoned","hit","bashed")
	value = 50
	block_chance = 10
	cooldownw = 7


/obj/item/weapon/material/pitchfork
	name = "干草叉"
	sharp = TRUE
	edge = FALSE
	desc = "用于除草或挠背."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "rake"
	item_state = "rake"
	default_material = "iron"
	force_divisor = 0.35 // 5 with weight 20 (steel)
	thrown_force_divisor = 0.35 // as above
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("slashed", "clawed", "forked")
	cooldownw = 9

/turf/floor/grass/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/weapon/material/pitchfork))
		user.visible_message(SPAN_NOTICE("[user] starts to remove the grass layer."), SPAN_NOTICE("[user] starts to remove the grass layer."), "你听到某物被连根拔起.")
		if (!do_after(user, (C.cooldownw * C.force)))
			return
		user.visible_message(SPAN_NOTICE("[user] removes the grass layer."), SPAN_NOTICE("[user] removes the grass layer."), "你听到某物被移除.")
		var/area/AREA = get_area(src)
		if(map.ID == MAP_NOMADS_DESERT)
			ChangeTurf(/turf/floor/dirt/dust)
		else if (AREA.climate == "jungle" || AREA.climate == "savanna")
			ChangeTurf(/turf/floor/dirt/jungledirt)
		else
			ChangeTurf(/turf/floor/dirt)
	..()
/obj/structure/wild/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(src, /obj/structure/wild/junglebush) || istype(src, /obj/structure/wild/smallbush/) || istype(src, /obj/structure/wild/burnedbush/) || istype(src, /obj/structure/wild/tallgrass2) || istype(src, /obj/structure/wild/tallgrass) || istype(src, /obj/structure/wild/flowers) || istype(src, /obj/structure/wild/bush/big) || istype(src, /obj/structure/wild/bush))
		if (istype(C, /obj/item/weapon/material/pitchfork))
			user.visible_message(SPAN_NOTICE("[user] starts to uproot the [src]."), SPAN_NOTICE("[user] starts to uproot the [src]."), "你听到某物被连根拔起.")
			if (!do_after(user, (C.cooldownw * C.force)))
				return
			user.visible_message(SPAN_NOTICE("[user] uproots the [src]."), SPAN_NOTICE("[user] uproots the [src]."), "你听到某物被连根拔起.")
			qdel(src)
	..()
/obj/item/weapon/material/spear
	name = "长矛"
	sharp = TRUE
	edge = TRUE
	desc = "一种粗糙但有效的武器."
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "spear"
	item_state = "spear"
	default_material = "wood"
	throw_speed = 6
	throw_range = 11
	allow_spin = FALSE
	force_divisor = 0.7 // 42 with hardness 60 (steel)
	thrown_force_divisor = 2 // 40 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 6
	block_chance = 15
	cooldownw = 9

/obj/item/weapon/material/spear/iron
	name = "铁长矛"
	default_material = "iron"
/obj/item/weapon/material/spear/attack(atom/A, mob/living/user, def_zone)
	..()
	if (isliving(A) && prob(33))
		var/mob/living/TARGETMOB = A
		visible_message("<span class = 'danger'>[TARGETMOB]被击退了!")
		for (var/obj/structure/noose/N in get_turf(TARGETMOB))
			if (N.hanging == TARGETMOB)
				return

		for (var/obj/structure/bed/B in get_turf(TARGETMOB))
			if (B.buckled_mob == TARGETMOB)
				return
		var/turf/behind = get_turf(get_step(TARGETMOB, user.dir))
		if (behind)
			if (behind.density || locate(/obj/structure) in behind)
				var/turf/slammed_into = behind
				if (!slammed_into.density)
					for (var/obj/structure/S in slammed_into.contents)
						if (S.density)
							slammed_into = S
							break
				if (slammed_into.density)
					visible_message("<span class = 'danger'>[TARGETMOB]被击退进了\the [slammed_into]!</span>")
					TARGETMOB.adjustBruteLoss(rand(3,6))
					for (var/obj/structure/window/W in get_turf(slammed_into))
						W.shatter()
			else
				if (!map || !map.check_caribbean_block(TARGETMOB, behind))
					TARGETMOB.forceMove(behind)
		for (var/obj/structure/ST in get_step(loc, user.dir))
			if (ST.density == TRUE)
				return
		for (var/obj/covers/CV in get_step(loc, user.dir))
			if (CV.density == TRUE)
				return
		for (var/turf/wall/TS in get_step(loc, user.dir))
			if (TS.density == TRUE)
				return
		for (var/obj/structure/noose/N in get_turf(TARGETMOB))
			if (N.hanging == TARGETMOB)
				return
		for (var/obj/structure/bed/B in get_turf(TARGETMOB))
			if (B.buckled_mob == TARGETMOB)
				return

/obj/item/weapon/material/spear/assagai
	name = "阿萨盖长矛"
	desc = "一柄长木杆长矛,配有精磨锋利的铁尖;因作为祖鲁战士的首选武器而闻名."
	icon_state = "assagai"
	item_state = "assagai"
	force_divisor = 0.8 // 32 with hardness 40 (wood)
	thrown_force_divisor = 1.6 // 29 with weight 18 (wood)

//New batons
/obj/item/weapon/material/classic_baton
	name = "警棍"
	desc = "一根用于殴打罪犯渣滓的木制短棍."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "baton"
	item_state = "classic_baton"
	block_chance = 27
	force_divisor = 1
	thrown_force_divisor = 3
	force = 1
	slot_flags = SLOT_BELT | SLOT_BACK
	value = 0
	cooldownw = 8
	flammable = TRUE
	attack_verb = list("thwacked", "hit", "clonked", "batted", "slammed", "smacked", "poked", "slapped")
	hitsound = 'sound/weapons/pierce.ogg'
	drawsound = 'sound/weapons/hiddenblade_deploy.ogg'
	sharp = FALSE
	edge = FALSE
	default_material = "softwood"



/obj/item/weapon/material/classic_baton/guard
	desc = "一根用于殴打罪犯渣滓的重型木制短棍,这根由更硬的木材制成."
	default_material = "hardwood"
	force_divisor = 1
	block_chance = 27
	cooldownw = 8

/obj/item/weapon/material/classic_baton/nightstick
	name = "夜棍"
	desc = "警员用来保持街道清洁的夜棍."
	default_material = "hardwood"
	icon_state = "nightbaton"
	item_state = "nightbaton"
	force_divisor = 1
	block_chance = 27
	cooldownw = 8

/obj/item/weapon/material/classic_baton/guard/metal
	desc = "一根用于殴打罪犯渣滓的重型金属短棍,这根由铁制成,很可能迅速致人受伤,瞄准除头部以外的任何地方!"
	default_material = "iron"
	force_divisor = 1
	block_chance = 27
	cooldownw = 10

/obj/item/weapon/material/classic_baton/blackjack
	name = "铅头棍"
	desc = "一根用厚重皮革包裹的短棍,尖端带有沉重的铅块,用于让渣滓服从."
	icon_state = "blackjack"
	item_state = "blackjack"
	default_material = "leather"
	force_divisor = 3
	block_chance = 19
	cooldownw = 10
	applies_material_colour = FALSE


/obj/item/weapon/material/quarterstaff
	name = "长棍"
	sharp = FALSE
	edge = FALSE
	desc = "一根简单的木棍,伤害不高,但格挡和打击速度很快"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "quarterstaff"
	item_state = "quarterstaff"
	default_material = "wood"
	throw_speed = 6
	throw_range = 10
	allow_spin = TRUE
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 16 with weight 20 (steel)
	attack_verb = list("bashed","poked","beaten")
	value = 6
	block_chance = 20
	cooldownw = 6

/obj/item/weapon/material/fancycane
	name = "黑色手杖"
	sharp = FALSE
	edge = FALSE
	desc = "一根用于行走的花哨手杖.这根看起来相当昂贵."
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "fancycane"
	item_state = "woodcane1"
	throw_speed = 6
	throw_range = 10
	allow_spin = TRUE
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 16 with weight 20 (steel)
	attack_verb = list("bashed","poked","beaten")
	value = 6
	block_chance = 27
	cooldownw = 6
	applies_material_colour = FALSE

/obj/item/weapon/material/naginata
	name = "薙刀"
	sharp = TRUE
	edge = TRUE
	desc = "一根末端带刃的木杆,适合刺穿那些侮辱你领主的人."
	slot_flags = SLOT_SHOULDER
	icon_state = "naginata"
	item_state = "naginata"
	default_material = "iron"
	throw_speed = 7
	throw_range = 11
	allow_spin = FALSE
	force_divisor = 0.85 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.95 // 16 with weight 20 (steel)
	attack_verb = list("bashed","impaled","beaten")
	value = 30
	block_chance = 36
	cooldownw = 6
	color = null

/obj/item/weapon/material/naginata/steel
	default_material = "steel"
	value = 35
	block_chance = 40
	cooldownw = 6

/obj/item/weapon/material/hatchet
	name = "短柄斧"
	desc = "一柄装在短木柄上的非常锋利的斧刃.它有着悠久的劈砍历史.这把用于劈柴."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	default_material = "iron"
	material = "iron"
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = TRUE
	value = 15
	slot_flags = SLOT_BELT
	block_chance = 15
	cooldownw = 5
	chopping_speed = 1.7
	health = 20
	maxhealth = 20

/obj/item/weapon/material/hatchet/steel
	chopping_speed = 1.55
	health = 40
	maxhealth = 40
	material = "steel"
	default_material = "steel"
	applies_material_colour = FALSE

/obj/item/weapon/material/hatchet/bronze
	chopping_speed = 1.65
	health = 12
	maxhealth = 12
	material = "bronze"
	default_material = "bronze"

/obj/item/weapon/material/machete
	name = "砍刀"
	desc = "一把伐木工使用的小型砍刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "machete"
	force_divisor = 0.7 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	material = "iron"
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = FALSE
	value = 15
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 15
	cooldownw = 5
	chopping_speed = 1.6
	health = 15
	maxhealth = 15

/obj/item/weapon/material/machete1
	name = "砍刀"
	desc = "一把伐木工使用的小型砍刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "machete1"
	force_divisor = 0.7 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	material = "iron"
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = FALSE
	value = 15
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 15
	cooldownw = 5
	chopping_speed = 1.6

/obj/item/weapon/material/hatchet/tribal
	name = "短柄斧"
	desc = "一把粗糙的短柄斧,由木头和石头制成."
	icon = 'icons/misc/tribal.dmi'
	icon_state = "tribalaxe"
	material = "stone"
	default_material = "stone"
	item_state = "stonehatchet"
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 13 with weight 20 (steel)
	value = 12
	block_chance = 15
	cooldownw = 5
	chopping_speed = 3.3
	health = 10
	maxhealth = 10
	applies_material_colour = FALSE

/obj/item/weapon/material/hatchet/tribal/bone
	material = "bone"
	default_material = "stone"
	desc = "一把粗糙的短柄斧,由木头和骨头制成."
	icon_state = "bonehatchet"
	item_state = "bonehatchet"
	chopping_speed = 4
	health = 7.5
	maxhealth = 7.5

/obj/item/weapon/material/hatchet/tribal/flint
	material = "flint"
	desc = "一把非常粗糙的短柄斧,由木头和燧石制成."
	icon = 'icons/obj/old_weapons.dmi'
	icon_state = "flint_axe"
	item_state = "flinthatchet"
	chopping_speed = 3.5

/obj/item/weapon/material/boarding_axe
	name = "登船斧"
	desc = "一把短斧,可用于劈开木头和登上敌船."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "combat_axe"
	default_material = "steel"
	force_divisor = 0.6 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut")
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE
	value = 20
	block_chance = 12
	cooldownw = 6
	chopping_speed = 2.7

/obj/item/weapon/material/minihoe // -- Numbers
	name = "小锄头"
	desc = "用于除草或挠背。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	force_divisor = 0.25 // 5 with weight 20 (steel)
	thrown_force_divisor = 0.25 // as above
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")
	cooldownw = 5

/obj/item/weapon/material/scythe
	icon_state = "scythe0"
	name = "镰刀"
	desc = "长纤维金属柄上的锋利弯刃,让你轻松收割所种之物。"
	force_divisor = 0.275 // 16 with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 with weight 20 (steel)
	sharp = TRUE
	edge = TRUE
	throw_speed = TRUE
	throw_range = 3
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_SHOULDER
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	cooldownw = 5

/obj/item/weapon/material/scythe/old
	icon_state = "scythe"
	name = "镰刀"
	desc = "长木柄上的锋利弯刃,让你轻松收割所种之物。"
	force_divisor = 0.275 // 16 with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 with weight 20 (steel)
	sharp = TRUE
	edge = TRUE
	throw_speed = TRUE
	throw_range = 3
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_SHOULDER
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	cooldownw = 5

/obj/item/weapon/material/pilum
	name = "重标枪"
	sharp = TRUE
	edge = TRUE
	desc = "一柄2米长、带铁尖的标枪,罗马军队使用。"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "pilum"
	item_state = "pilum"
	default_material = "wood"
	throw_speed = 6
	throw_range = 14
	allow_spin = FALSE
	force_divisor = 0.7 // 28 with hardness 40 (wood)
	thrown_force_divisor = 2.5 // 45 with weight 18 (wood)
	attack_verb = list("jabbed","impaled","ripped")
	value = 10
	block_chance = 10
	cooldownw = 7

/*/obj/item/weapon/material/javelin
	name = "javelin"
	sharp = TRUE
	edge = TRUE
	desc = "A meter long short spear that can be used as a hand launched missle or for close combat." */

/obj/item/weapon/material/roman_standard
	name = "罗马军旗"
	sharp = TRUE
	edge = TRUE
	desc = "罗马军团的军旗,顶端饰有鹰徽。"
	slot_flags = SLOT_SHOULDER
	icon_state = "roman_standard"
	item_state = "roman_standard"
	default_material = "wood"
	throw_speed = 3
	throw_range = 5
	allow_spin = FALSE
	force_divisor = 0.4 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 0
	block_chance = 15
	cooldownw = 10

/obj/item/weapon/material/roman_standard/New()
	..()
	name = "roman standard"

/obj/item/weapon/material/greek_standard
	name = "希腊军旗"
	sharp = TRUE
	edge = TRUE
	desc = "希腊军队的军旗。涂有红漆,饰有红色羽毛。"
	slot_flags = SLOT_SHOULDER
	icon_state = "greek_standard"
	item_state = "greek_standard"
	default_material = "wood"
	throw_speed = 3
	throw_range = 5
	allow_spin = FALSE
	force_divisor = 0.4 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 0
	block_chance = 15
	cooldownw = 10

/obj/item/weapon/material/greek_standard/New()
	..()
	name = "greek standard"

/obj/item/weapon/material/egyptian_standard
	name = "埃及军旗"
	sharp = TRUE
	edge = TRUE
	desc = "法老军队的军旗,上面附有一头威武的金狮。"
	slot_flags = SLOT_SHOULDER
	icon_state = "egyptian_standard"
	item_state = "egyptian_standard"
	default_material = "wood"
	throw_speed = 3
	throw_range = 5
	allow_spin = FALSE
	force_divisor = 0.4 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 0
	block_chance = 15
	cooldownw = 10

/obj/item/weapon/material/egyptian_standard/New()
	..()
	name = "egyptian standard"

/obj/item/weapon/material/spear/dory
	name = "长矛"
	sharp = TRUE
	edge = TRUE
	desc = "一柄2米长的矛,希腊文化士兵使用。"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "dory"
	item_state = "dory"
	default_material = "wood"
	throw_speed = 4
	throw_range = 8
	allow_spin = FALSE
	force_divisor = 0.85 // 42 with hardness 60 (steel)
	thrown_force_divisor = 1.5 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 10
	block_chance = 15
	cooldownw = 10

/obj/item/weapon/material/spear/dory/bronze
	name = "青铜矛"
	default_material = "bronze"

/obj/item/weapon/material/spear/sarissa
	name = "萨里沙长矛"
	sharp = TRUE
	edge = TRUE
	desc = "一柄5米长的矛,方阵士兵使用。"
	slot_flags = SLOT_SHOULDER
	icon_state = "sarissa"
	item_state = "sarissa"
	default_material = "wood"
	throw_speed = 1
	throw_range = 1
	nothrow = TRUE
	allow_spin = FALSE
	force_divisor = 0.85
	thrown_force_divisor = 0.1
	attack_verb = list("jabbed","impaled","ripped")
	value = 18
	var/image/standing
	var/ownerdir = NORTH
	var/deployed = FALSE
	block_chance = 5

/obj/item/weapon/material/spear/sarissa/attack_self(mob/user)
	if (do_after(user, 15, src, can_move = TRUE))
		if (deployed)
			deployed = FALSE
			to_chat(user, "<span class='notice'>你举起你的[name],脱离阵型。</span>")
			return
		else
			deployed = TRUE
			to_chat(user, "<span class='notice'>你放下你的[name],组成矛墙!</span>")
			update_icon()
			check_dmg()
			return

/obj/item/weapon/material/spear/sarissa/proc/check_dmg()
	if (deployed)
		spawn(3)
			check_dmg()
		if (ismob(loc))
			var/mob/living/H = loc
			if (H.stat == DEAD || H.stat == UNCONSCIOUS)
				deployed = FALSE
				return
			if (!H.item_is_in_hands(src))
				deployed = FALSE
				update_icon()
				return
		for (var/mob/living/TARGETMOB in get_step(loc, ownerdir))
			for (var/obj/structure/noose/N in get_turf(TARGETMOB))
				if (N.hanging == TARGETMOB)
					return

			for (var/obj/structure/bed/B in get_turf(TARGETMOB))
				if (B.buckled_mob == TARGETMOB)
					return
			if (prob(60))
				var/turf/behind = get_turf(get_step(TARGETMOB, ownerdir))
				if (behind)
					if (behind.density || locate(/obj/structure) in behind)
						var/turf/slammed_into = behind
						if (!slammed_into.density)
							for (var/obj/structure/S in slammed_into.contents)
								if (S.density)
									slammed_into = S
									break
						if (slammed_into.density)
							visible_message("<span class = 'danger'>[TARGETMOB]被推回\the [slammed_into]!</span>")
							TARGETMOB.adjustBruteLoss(rand(3,6))
							for (var/obj/structure/window/W in get_turf(slammed_into))
								W.shatter()
					else
						if (!map || !map.check_caribbean_block(TARGETMOB, behind))
							TARGETMOB.forceMove(behind)

		for (var/mob/living/TARGETMOB in get_step(get_step(loc, ownerdir),ownerdir))
			for (var/obj/structure/ST in get_step(loc, ownerdir))
				if (ST.density == TRUE)
					return
			for (var/obj/covers/CV in get_step(loc, ownerdir))
				if (CV.density == TRUE)
					return
			for (var/turf/wall/TS in get_step(loc, ownerdir))
				if (TS.density == TRUE)
					return
			for (var/obj/structure/noose/N in get_turf(TARGETMOB))
				if (N.hanging == TARGETMOB)
					return
			for (var/obj/structure/bed/B in get_turf(TARGETMOB))
				if (B.buckled_mob == TARGETMOB)
					return
			if (prob(80))
				var/turf/behind = get_turf(get_step(TARGETMOB, ownerdir))
				if (behind)
					if (behind.density || locate(/obj/structure) in behind)
						var/turf/slammed_into = behind
						if (!slammed_into.density)
							for (var/obj/structure/S in slammed_into.contents)
								if (S.density)
									slammed_into = S
									break
						if (slammed_into.density)
							visible_message("<span class = 'danger'>[TARGETMOB]被推回\the [slammed_into]!</span>")
							TARGETMOB.adjustBruteLoss(rand(3,6))
							for (var/obj/structure/window/W in get_turf(slammed_into))
								W.shatter()
					else
						if (!map || !map.check_caribbean_block(TARGETMOB, behind))
							TARGETMOB.forceMove(behind)
							TARGETMOB.adjustBruteLoss(rand(2,4))

/obj/item/weapon/material/spear/sarissa/update_icon()
// yes, i know this is horrible shitcode. Pls no bully
	if (!istype(loc, /mob/living/human))
		deployed = FALSE
		item_state = initial(item_state)
	else
		var/mob/living/human/US = loc
		if (deployed)
			item_state = ""
			var/img_state
			US.overlays -= standing
			if (US.dir == NORTH)
				img_state = 'icons/obj/weapons_2t_v.dmi'
				standing = image(icon = img_state, icon_state = "sarissa")
				standing.pixel_x = 0
				standing.pixel_y = 0
				ownerdir = NORTH
			else if (US.dir == SOUTH)
				img_state = 'icons/obj/weapons_2t_v.dmi'
				standing = image(icon = img_state, icon_state = "sarissa")
				standing.pixel_x = 0
				standing.pixel_y = -32
				ownerdir = SOUTH
			else if (US.dir == EAST)
				img_state = 'icons/obj/weapons_2t.dmi'
				standing = image(icon = img_state, icon_state = "sarissa")
				standing.pixel_x = 0
				standing.pixel_y = 0
				ownerdir = EAST
			else if (US.dir == WEST)
				img_state = 'icons/obj/weapons_2t.dmi'
				standing = image(icon = img_state, icon_state = "sarissa")
				standing.pixel_x = -32
				standing.pixel_y = 0
				ownerdir = WEST
			//apply img
			US.overlays += standing
		else if (!deployed)
			US.overlays -= standing
			item_state = initial(item_state)
		spawn(1)
			update_icon()

/obj/item/weapon/material/spear/sarissa/bronze
	name = "青铜矛"
	default_material = "bronze"

/obj/item/weapon/material/spear/sarissa/dja
	name = "青铜弯刀"
	default_material = "bronze"

/obj/item/weapon/material/spear/sarissa/pike
	name = "长枪"
	desc = "一柄长矛。"
	slot_flags = SLOT_SHOULDER
//	icon_state = "pike"
//	item_state = "pike"
	default_material = "iron"
	allow_spin = FALSE
	force_divisor = 0.85 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.1 // 20 with weight 20 (steel)
	value = 18
	cooldownw = 13
	block_chance = 18

/obj/item/weapon/material/spear/sarissa/pike/steel
	default_material = "steel"
	value = 38
	force_divisor = 0.87
	cooldownw = 11
	block_chance = 21

/obj/item/weapon/material/spear/naginata
	name = "薙刀"
	sharp = TRUE
	edge = TRUE
	desc = "木杆末端带刃,适合刺穿那些侮辱你领主的人。"
	slot_flags = SLOT_SHOULDER
	icon_state = "naginata"
	item_state = "naginata"
	default_material = "iron"
	throw_speed = 7
	throw_range = 11
	allow_spin = FALSE
	force_divisor = 0.85 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.95 // 16 with weight 20 (steel)
	attack_verb = list("bashed","impaled","beaten")
	value = 30
	block_chance = 36
	cooldownw = 6
	color = null

/obj/item/weapon/material/spear/naginata/steel
	default_material = "steel"
	value = 35
	block_chance = 40
	cooldownw = 6

/obj/item/weapon/material/halberd
	name = "戟"
	sharp = TRUE
	edge = TRUE
	desc = "顶端装有斧刃的长矛。"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "halberd"
	item_state = "halberd"
	default_material = "iron"
	throw_speed = 3
	throw_range = 4
	allow_spin = FALSE
	block_chance = 18
	force_divisor = 0.8 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 15
	cooldownw = 12

/obj/item/weapon/material/halberd/steel
	default_material = "steel"
	value = 20

/obj/item/weapon/material/spear/halberd
	name = "戟"
	sharp = TRUE
	edge = TRUE
	desc = "顶端装有斧刃的长矛。"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "halberd"
	item_state = "halberd"
	default_material = "iron"
	throw_speed = 3
	throw_range = 4
	allow_spin = FALSE
	block_chance = 18
	force_divisor = 0.8 // 42 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 24 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 15
	cooldownw = 12

/obj/item/weapon/material/spear/halberd/steel
	default_material = "steel"
	value = 20

/obj/item/weapon/material/pike
	name = "长枪"
	sharp = TRUE
	edge = TRUE
	desc = "一柄长矛。"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "pike"
	item_state = "pike"
	default_material = "iron"
	throw_speed = 4
	throw_range = 5
	allow_spin = FALSE
	block_chance = 12
	force_divisor = 0.85 // 42 with hardness 60 (steel)
	thrown_force_divisor = 1 // 20 with weight 20 (steel)
	attack_verb = list("jabbed","impaled","ripped")
	value = 18
	cooldownw = 13


/obj/item/weapon/material/pike/steel
	default_material = "steel"
	value = 23
	health = 30
	maxhealth = 30

/obj/item/weapon/material/hatchet/battleaxe
	name = "战斧"
	desc = "长木柄上非常锋利的斧刃。劈砍大多数东西都很在行。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "battleaxe"
	item_state = "battleaxe"
	default_material = "iron"
	material = "iron"
	force_divisor = 0.6 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.55 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_NORMAL
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = TRUE
	value = 20
	slot_flags = SLOT_BELT
	block_chance = 15
	cooldownw = 11
	chopping_speed = 1.4
	health = 25
	maxhealth = 25

/obj/item/weapon/material/hatchet/battleaxe/steel
	default_material = "steel"
	material = "steel"
	chopping_speed = 1.2
	health = 50
	maxhealth = 50
	applies_material_colour = FALSE

/obj/item/weapon/material/hatchet/battleaxe/bronze
	default_material = "bronze"
	material = "bronze"
	chopping_speed = 1.75
	health = 15
	maxhealth = 15
	applies_material_colour = TRUE

/obj/item/weapon/material/hatchet/bone_battleaxe
	name = "战斧"
	material = "bone"
	desc = "长木柄上非常锋利的骨斧刃。劈木头不太行,但砍肢体非常出色。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bone_battleaxe"
	item_state = "bone_battleaxe"
	default_material = "bone"
	material = "bone"
	force_divisor = 0.6 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.55 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_NORMAL
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = TRUE
	value = 20
	slot_flags = SLOT_BELT
	block_chance = 15
	cooldownw = 11
	health = 15
	maxhealth = 15
	chopping_speed = 2

/obj/item/weapon/material/hatchet/bone_battleaxe/stone
	default_material = "stone"
	material = "stone"
	chopping_speed = 1.9
	health = 25
	maxhealth = 25
	desc = "长木柄上非常锋利的石斧刃。劈木头不太行,但砍肢体非常出色。"

/obj/item/weapon/material/scepter
	name = "权杖" // corrects to gold scepter because of the default_material
	sharp = FALSE
	edge = FALSE
	desc = "一根古老的金杖,伤害不高,但格挡和打击速度很快"
	slot_flags = SLOT_SHOULDER | SLOT_BELT
	icon_state = "scepter"
	item_state = "scepter"
	default_material = "gold"
	throw_speed = 6
	throw_range = 10
	allow_spin = TRUE
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 16 with weight 20 (steel)
	attack_verb = list("bashed","poked","beaten")
	value = 6
	block_chance = 20
	cooldownw = 5

/obj/item/weapon/lungemine
	name = "刺雷"
	desc = "一根长杆末端装有反坦克地雷,使用后使用者会死亡。"
	slot_flags = SLOT_SHOULDER
	icon_state = "lungemine"
	item_state = "lungemine"
	throw_speed = 7
	throw_range = 11
	allow_spin = FALSE

/obj/structure/vehicleparts/frame/attackby(var/obj/item/I, var/mob/living/human/H)
	if (istype(I, /obj/item/weapon/lungemine))
		visible_message(SPAN_DANGER("<big>[H] jabs \the [src] with a [I] causing it to explode!</big>"))
		message_admins("[H] used a lunge mine on a vehicle at [x], [y], [z].")
		log_admin("[H] used a lunge mine on a vehicle at [x], [y], [z].")
		var/penloc = CheckPenLoc(get_turf(H))
		explosion(H.loc, 1, 3, 2, 0)

		for (var/mob/M in axis.transporting)
			shake_camera(M, 4, 4)

		switch(penloc)
			if ("left")
				if (w_left[5] > 0)
					w_left[5] -= heavy_armor_penetration
					visible_message("<span class = 'danger'><big>左侧船体受损!</big></span>")
			if ("right")
				if (w_right[5] > 0)
					w_right[5] -= heavy_armor_penetration
					visible_message("<span class = 'danger'><big>右侧船体受损!</big></span>")
			if ("front")
				if (w_front[5] > 0)
					w_front[5] -= heavy_armor_penetration
					visible_message("<span class = 'danger'><big>前部船体受损!</big></span>")
			if ("back")
				if (w_back[5] > 0)
					w_back[5] -= heavy_armor_penetration
					visible_message("<span class = 'danger'><big>后部船体受损!</big></span>")
			if ("frontleft")
				if (w_left[5] > 0 && w_front[5] > 0)
					if (w_left[4] > w_front[4] && w_left[5]>0)
						w_left[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>左侧船体受损!</big></span>")
					else
						w_front[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>前部船体受损!</big></span>")
			if ("frontright")
				if (w_right[5] > 0 && w_front[5] > 0)
					if (w_right[4] > w_front[4] && w_right[5]>0)
						w_right[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>右侧船体受损!</big></span>")
					else
						w_front[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>前部船体受损!</big></span>")
			if ("backleft")
				if (w_left[5] > 0 && w_back[5] > 0)
					if (w_left[4] > w_back[4] && w_left[5]>0)
						w_left[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>左侧船体受损!</big></span>")
					else
						w_back[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>后部船体受损!</big></span>")
			if ("backright")
				if (w_right[5] > 0 && w_back[5] > 0)
					if (w_right[4] > w_back[4] && w_right[5]>0)
						w_right[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>右侧船体受损!</big></span>")
					else
						w_back[5] -= heavy_armor_penetration
						visible_message("<span class = 'danger'><big>后部船体受损!</big></span>")
		if (H)
			H.awards["tank"]+=(heavy_armor_penetration/200)
	else
		..()

////////////////////////////////////////SKYRIM//////////////////////////////////////
/obj/item/weapon/material/tes13/mace
	name = "钉头锤"
	sharp = TRUE
	edge = FALSE
	desc = "一把钢制钉头锤,上面有5根大尖刺。"
	slot_flags = SLOT_BELT
	icon_state = "steel_mace"
	item_state = "mace"
	default_material = "steel"
	throw_speed = 7
	throw_range = 11
	allow_spin = FALSE
	force_divisor = 0.85 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.95 // 16 with weight 20 (steel)
	attack_verb = list("bashed","struck","beaten")
	value = 30
	block_chance = 15
	cooldownw = 6

/obj/item/weapon/material/hatchet/battleaxe/tes13
	name = "战斧"
	desc = "钢柄上非常锋利的斧刃。劈木头不实用,但砍肢体很实用。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "waraxe_tes13"
	item_state = "battleaxe"
	default_material = "steel"
	material = "steel"
	force_divisor = 0.5 // 30 with hardness 60 (steel)
	thrown_force_divisor = 0.55 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_NORMAL
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = FALSE
	value = 20
	slot_flags = SLOT_BELT
	block_chance = 15
	cooldownw = 7
	health = 35
	maxhealth = 35
	chopping_speed = 2.5

/obj/item/weapon/material/hatchet/battleaxe/tes13/battleaxe
	name = "战斧"
	desc = "双手钢柄上非常锋利的双刃斧。砍树不实用,但砍人也许可以。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "battleaxe_tes13"
	force_divisor = 0.8 // 30 with hardness 60 (steel)
	slot_flags = SLOT_SHOULDER | SLOT_BACK
	block_chance = 15
	cooldownw = 7
	health = 35
	maxhealth = 35
	chopping_speed = 2.3

/obj/item/weapon/material/hatchet/battleaxe/tes13/ulfric
	name = "乌弗瑞克战斧"
	desc = "钢柄上非常锋利的斧刃。劈木头不实用,但砍肢体很实用。这一把属于风盔城领主乌弗瑞克·风暴斗篷。"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "waraxe_tes13"
	item_state = "battleaxe"
	default_material = "steel"
	material = "steel"
	force = 100
	force_divisor = 1 // 30 with hardness 60 (steel)
	thrown_force_divisor = 1 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_NORMAL
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = FALSE
	value = 200
	slot_flags = SLOT_BELT
	block_chance = 20
	cooldownw = 4
	health = 200
	maxhealth = 200
	chopping_speed = 5