#define DYNAMIC_AMT -1

// increase or decrease the amount of items in a crate
/*/obj/structure/closet/crate/proc/resize(decimal)
	if (decimal > 1.0)
		var/add_crates = max(1, ceil((decimal - 1.0) * contents.len))
		for (var/v in 1 to add_crates)
			if (!contents.len)
				break
			var/atom/object = pick(contents)
			if (object)
				var/object_type = object.type
				new object_type(src)

	else if (decimal < 1.0)
		var/remove_crates = ceil((1.0 - decimal) * contents.len)
		for (var/v in 1 to remove_crates)
			if (!contents.len)
				break
			contents -= pick(contents)
	update_capacity(contents.len)
	*/
/obj/structure/closet/crate/var/list/paths = list() // typepath = amount

/obj/structure/closet/crate/New()
	..()
	crate_list += src
	for (var/typepath in paths)
		var/limit = paths[typepath]
		if (limit == DYNAMIC_AMT)
			var/atom/ref = new typepath (null)
			limit = max(3, min(ceil(75/round(ref.contents.len/2)), 12))
			if (ref.contents.len < 100)
				limit += pick(2,3)
			qdel(ref)
		for (var/v in 1 to limit)
			new typepath (src)
	update_capacity(contents.len)

/obj/structure/closet/crate/Destroy()
	crate_list -= src
	..()

// new crate icons from F13 - most are unused

/* todo: turn some crates into CARTS and re-enable this
/obj/structure/closet/crate
	icon = 'icons/obj/crate.dmi'*/

/obj/structure/closet/crate/urn
	name = "骨灰瓮"
	desc = "也许里面藏着什么宝贝? 大概只是某个可怜虫的骨灰罢了"
	icon_state = "urn"
	icon_opened = "urn_open"
	icon_closed = "urn"
	health = 10
	storage_capacity = 12

/obj/structure/closet/crate/urn/stand
	icon_state = "urn2"
	icon_opened = "urn2_open"
	icon_closed = "urn2"

obj/structure/closet/crate/chest
	name = "wood chest"
	desc = "Maybe there's a treasure inside?"
	icon_state = "wood_chest"
	icon_opened = "wood_chest_opened"
	icon_closed = "wood_chest"
	health = 2000
	storage_capacity = 5 * MOB_MEDIUM

obj/structure/closet/crate/treasurechest
	name = "treasure chest"
	desc = "There's probably treasure inside."
	icon_state = "treasure_chest"
	icon_opened = "treasure_chest_opened"
	icon_closed = "treasure_chest"
	storage_capacity = 5 * MOB_MEDIUM

obj/structure/closet/crate/loottreasurechest
	name = "wood chest"
	desc = "There's probably treasure inside."
	icon_state = "treasure_chest"
	icon_opened = "treasure_chest_opened"
	icon_closed = "treasure_chest"
	storage_capacity = 5 * MOB_MEDIUM

obj/structure/closet/crate/loottreasurechest/New()
	..()
	var/rarity = rand(0,10)
	if(rarity <= 2)
		paths = list(/obj/item/stack/ore/tin = rand(0, 2),
				/obj/item/stack/ore/copper = rand(0, 2),
				/obj/item/stack/ore/coal = rand(0, 2),
				/obj/item/stack/ore/lead = rand(0, 2),
				/obj/item/stack/material/bone = rand(0, 2),
				/obj/item/stack/material/stone = rand(0, 2),
				/obj/item/stack/material/leather = rand(0, 2),
				/obj/item/stack/material/cotton = rand(0, 2),
				/obj/item/stack/material/cloth = rand(0, 2),
				/obj/item/stack/material/wool = rand(0, 2),
				/obj/item/stack/material/woolcloth = rand(0, 2),
				/obj/item/stack/material/rope = rand(0, 2),
				/obj/item/stack/money/coppercoin = rand(2, 4),
				/obj/item/stack/money/silvercoin = rand(2, 4),
				/obj/item/stack/money/goldnugget = rand(1, 2))
	else if(rarity > 2 && rarity <= 4)
		paths = list(/obj/item/stack/ore/iron = rand(0, 3),
				/obj/item/stack/ore/tin = rand(0, 3),
				/obj/item/stack/ore/copper = rand(0, 3),
				/obj/item/stack/ore/lead = rand(0, 3),
				/obj/item/stack/ore/gold = rand(0, 3),
				/obj/item/stack/ore/silver = rand(0, 3),
				/obj/item/stack/material/iron = rand(0, 3),
				/obj/item/stack/material/bronze = rand(0, 3),
				/obj/item/stack/material/copper = rand(0, 3),
				/obj/item/stack/material/tin = rand(0, 3),
				/obj/item/stack/material/stone = rand(0, 3),
				/obj/item/stack/material/gold = rand(0, 3),
				/obj/item/stack/material/silver = rand(0, 3),
				/obj/item/stack/money/coppercoin = rand(2, 4),
				/obj/item/stack/money/silvercoin = rand(2, 4),
				/obj/item/stack/money/goldcoin = rand(2, 4),
				/obj/item/stack/money/gems = rand(1, 2),
				/obj/item/stack/money/goldnugget = rand(2, 3),)

	else if(rarity > 4 && rarity <= 8)
		paths = list(/obj/item/stack/ore/iron = rand(0, 4),
				/obj/item/stack/ore/tin = rand(0, 4),
				/obj/item/stack/ore/copper = rand(0, 4),
				/obj/item/stack/ore/lead = rand(0, 4),
				/obj/item/stack/ore/gold = rand(0, 4),
				/obj/item/stack/ore/silver = rand(0, 4),
				/obj/item/stack/material/iron = rand(0, 4),
				/obj/item/stack/material/bronze = rand(0, 4),
				/obj/item/stack/material/copper = rand(0, 4),
				/obj/item/stack/material/tin = rand(0, 4),
				/obj/item/stack/material/stone = rand(0, 4),
				/obj/item/stack/material/gold = rand(0, 4),
				/obj/item/stack/material/silver = rand(0, 4),
				/obj/item/stack/money/coppercoin = rand(3, 4),
				/obj/item/stack/money/silvercoin = rand(3, 4),
				/obj/item/stack/money/goldcoin = rand(3, 4),
				/obj/item/stack/money/gems = rand(2, 3),
				/obj/item/stack/money/goldnugget = rand(2, 3),
				/obj/item/stack/money/goldvaluables = rand(2, 3),
				/obj/item/stack/money/pearls = rand(2, 3),)
	else
		paths = list(/obj/item/stack/ore/iron = rand(0, 4),
				/obj/item/stack/ore/tin = rand(0, 4),
				/obj/item/stack/ore/copper = rand(0, 4),
				/obj/item/stack/ore/lead = rand(0, 4),
				/obj/item/stack/ore/gold = rand(0, 4),
				/obj/item/stack/ore/silver = rand(0, 4),
				/obj/item/stack/material/iron = rand(0, 4),
				/obj/item/stack/material/bronze = rand(0, 4),
				/obj/item/stack/material/copper = rand(0, 4),
				/obj/item/stack/material/tin = rand(0, 4),
				/obj/item/stack/material/stone = rand(0, 4),
				/obj/item/stack/material/gold = rand(0, 4),
				/obj/item/stack/material/silver = rand(0, 4),
				/obj/item/stack/money/coppercoin = rand(3, 4),
				/obj/item/stack/money/silvercoin = rand(3, 4),
				/obj/item/stack/money/goldcoin = rand(3, 4),
				/obj/item/stack/money/gems = rand(2, 3),
				/obj/item/stack/money/goldnugget = rand(2, 3),
				/obj/item/stack/money/goldvaluables = rand(2, 3),
				/obj/item/stack/money/pearls = rand(2, 3),
				/obj/item/cursedtreasure = rand(0, 1),
				/obj/item/weapon/material/sword/longsword/diamond = 1,)
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = rand(1+rarity,(rarity+1)*2)

/obj/structure/closet/crate/chest/treasury
	name = "殖民地金库"
	desc = "存放殖民地金库的地方."
	icon_state = "treasure_chest"
	icon_opened = "treasure_chest_opened"
	icon_closed = "treasure_chest"
	anchored = TRUE
	var/faction = "civilian"

/obj/structure/closet/crate/empty
	name = "木箱"
	desc = "一个木箱."
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"

/obj/structure/closet/crate/empty/large
	name = "大木箱"
	desc = "一个沉重的大木箱."
	icon = 'icons/obj/storage.dmi'
	icon_state = "densecrate"
	icon_opened = "densecrate_open"
	icon_closed = "densecrate"
	storagecap = 20

/obj/structure/closet/crate/barrel
	name = "木桶"
	desc = "一个木桶."
	icon = 'icons/obj/barrel.dmi'
	icon_state = "barrel_wood1"
	icon_opened = "barrel_wood_open1"
	icon_closed = "barrel_wood1"

/obj/structure/closet/crate/cash_register
	name = "收银机"
	desc = "商店里用来存放钱的东西."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "cash_register"
	icon_opened = "cash_register_opened"
	icon_closed = "cash_register"
	flammable = FALSE
	not_disassemblable = TRUE
	opacity = FALSE
	density = FALSE
	storagecap = 6
	anchored = TRUE
	health = 5000

/obj/structure/closet/crate/bayonets
	name = "刺刀箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/attachment/bayonet = 10)
	cratevalue = 132//100 base value from 100 planks of wood

/obj/structure/closet/crate/sandbags
	name = "沙袋箱"
	icon_state = "sandbag_crate_full"
	icon_opened = "sandbag_crate_empty"
	icon_closed = "sandbag_crate_full"
	paths = list(/obj/item/weapon/barrier/sandbag = 20)
	cratevalue = 90
	storagecap = 20

/obj/structure/closet/crate/sandbags/close() //Shitcode workaround before the sandbag overhaul
	if (!opened)
		return FALSE
	if (!can_close())
		return FALSE

	playsound(loc, 'sound/effects/rustle1.ogg', 15, TRUE, -3)
	for (var/obj/item/weapon/barrier/sandbag/O in get_turf(src))
		O.forceMove(src)
	update_icon()
	opened = FALSE
	return TRUE

/obj/structure/closet/crate/sandbags/open() // Shitcode workaround
	if (opened)
		return FALSE
	if (!can_open())
		return FALSE

	playsound(loc, 'sound/effects/rustle1.ogg', 15, TRUE, -3)
	for (var/obj/O in src)
		O.forceMove(get_turf(src))
	icon_state = icon_opened
	opened = TRUE

	if (climbable)
		structure_shaken()
	return TRUE

/obj/structure/closet/crate/sandbags/update_icon() // More shitcode workaround
	if (contents.len == 0)
		icon_state = "sandbag_crate_empty"
	else if (contents.len <= Floor(storagecap/3))
		icon_state = "sandbag_crate_33"
	else if (contents.len == storagecap)
		icon_state = "sandbag_crate_full"
	else
		icon_state = "sandbag_crate_50"

/obj/structure/closet/crate/wood
	name = "木板箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/stack/material/wood = 5)
	cratevalue = 120 //100 base value from 100 planks of wood

/obj/structure/closet/crate/wood/New()
	..()
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = 20

/obj/structure/closet/crate/steel
	name = "钢板箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/stack/material/steel = 5)
	cratevalue = 550 //500 base value from 100 steel sheets

/obj/structure/closet/crate/steel/New()
	..()
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = 20

/obj/structure/closet/crate/iron
	name = "铁锭箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/stack/material/iron = 5)
	cratevalue = 330 //300 base value from 100 iron sheets

/obj/structure/closet/crate/iron/New()
	..()
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = 20

/obj/structure/closet/crate/stone
	name = "石块箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/stack/material/stone = 5)
	cratevalue = 130 //100 base value from 100 stone blocks

/obj/structure/closet/crate/stone/New()
	..()
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = 20


/obj/structure/closet/crate/glass
	name = "玻璃板箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/stack/material/glass = 5)
	cratevalue = 330 //300 base value from 100 glass sheets

/obj/structure/closet/crate/glass/New()
	..()
	for (var/stack in contents)
		var/obj/item/stack/S = stack
		S.amount = 20

/obj/structure/closet/crate/rations/
	name = "口粮"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"

/obj/structure/closet/crate/rations/vegetables
	name = "口粮: 蔬菜"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/grown/potato = 4,
				/obj/item/weapon/reagent_containers/food/snacks/grown/beans = 4,
				/obj/item/weapon/reagent_containers/food/snacks/grown/cabbage = 4,
				/obj/item/weapon/reagent_containers/food/snacks/grown/carrot = 4,)
	cratevalue = 60 //48 base, 16 grown stuff x 3

/obj/structure/closet/crate/rations/fruits
	name = "口粮: 水果"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/grown/lemon = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/lime = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/apple = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/orange = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/banana = 3,
				/obj/item/weapon/reagent_containers/food/snacks/grown/coconut = 3,)
	cratevalue = 66 //54, 18 x 3

/obj/structure/closet/crate/rations/biscuits
	name = "口粮: 饼干"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/hardtack = 20,)
	cratevalue = 50 //Nutrient amt = 2, 2 x 2 for value so 20 x 2 = 40 base

/obj/structure/closet/crate/rations/beer
	name = "口粮: 啤酒"
	paths = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer = 10,)
	cratevalue = 60 //50 base

/obj/structure/closet/crate/rations/sake
	name = "口粮: 清酒"
	paths = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/small/sake = 10,)
	cratevalue = 60 //50 base

/obj/structure/closet/crate/rations/ale
	name = "口粮: 麦酒"
	paths = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale = 10,)
	cratevalue = 70 //60 base

/obj/structure/closet/crate/rations/meat
	name = "口粮: 肉类"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/meat = 7,)
	cratevalue = 70 //just putting this here

/obj/structure/closet/crate/rations/seeds/trees
	name = "种子: 树木"
	paths = list(/obj/item/stack/farming/seeds/apple = 4,
				/obj/item/stack/farming/seeds/tree = 4,
				/obj/item/stack/farming/seeds/orange = 4,)
	cratevalue = 30 //seeds don't have a value, effort into farming harvesting and exporting is already lots of work

/obj/structure/closet/crate/rations/seeds/cereals
	name = "种子: 谷物 (+酵母)"
	paths = list(/obj/item/stack/farming/seeds/wheat = 6,
				/obj/item/stack/farming/seeds/corn = 6,
				/obj/item/weapon/reagent_containers/food/condiment/enzyme = 1,
				/obj/item/weapon/reagent_containers/food/condiment/enzyme = 1)
	cratevalue = 50

/obj/structure/closet/crate/rations/seeds/vegetables
	name = "种子: 蔬菜"
	paths = list(/obj/item/stack/farming/seeds/tomato = 4,
				/obj/item/stack/farming/seeds/potato = 4,
				/obj/item/stack/farming/seeds/cabbage = 4,)
	cratevalue = 30

/obj/structure/closet/crate/rations/seeds/cashcrops
	name = "种子: 经济作物"
	paths = list(/obj/item/stack/farming/seeds/tobacco = 3,
				/obj/item/stack/farming/seeds/sugarcane = 3,
				/obj/item/stack/farming/seeds/hemp = 3,
				/obj/item/stack/farming/seeds/flax = 3,
				/obj/item/stack/farming/seeds/cotton = 3,)
	cratevalue = 60

/obj/structure/closet/crate/rations/seeds/medicinal
	name = "种子: 药用植物"
	paths = list(/obj/item/stack/farming/seeds/poppy = 3,
				/obj/item/stack/farming/seeds/tea = 3,
				/obj/item/stack/farming/seeds/coffee = 3,
				/obj/item/stack/farming/seeds/peyote = 3,)
	cratevalue = 50

/obj/structure/closet/crate/brick
	name = "砖块箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/clay/advclaybricks/fired = 70)
	cratevalue = 120 //100 base value from 100 planks of wood
///WEAPONS///

/obj/structure/closet/crate/grenades
	name = "手榴弹箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/grenade/old_grenade = 10)
	cratevalue = 110 //assuming value = 10 as no value yet

/obj/structure/closet/crate/musketball
	name = "火枪弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/musketball = 25)
	cratevalue = 100 //base 75, 25 x 3
/obj/structure/closet/crate/muskets
	name = "火枪箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/flintlock/musket = 5)
	cratevalue = 550 //100*5
/obj/structure/closet/crate/musketoons
	name = "短铳箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/flintlock/musketoon = 5)
	cratevalue = 440 //80*5
/obj/structure/closet/crate/pistols
	name = "手枪箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/flintlock/pistol = 5)
	cratevalue = 385 //70*5
/obj/structure/closet/crate/blunderbusses
	name = "喇叭铳箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/flintlock/blunderbuss = 5)
	cratevalue = 495 //90*5
/obj/structure/closet/crate/musketball_pistol
	name = "手枪弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/musketball_pistol = 25)
	cratevalue = 60 //base value 50

/obj/structure/closet/crate/blunderbuss_ammo
	name = "喇叭铳弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/blunderbuss = 15)
	cratevalue = 60 //base value 45

/obj/structure/closet/crate/cannonball
	name = "炮弹箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/cannon_ball = 15)
	cratevalue = 175 //assuming 10 value

/obj/structure/closet/crate/cannonball/chainshot
	name = "炮弹箱 (链弹)"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/cannon_ball/chainshot = 15)
	cratevalue = 175 //assuming 10 value

/obj/structure/closet/crate/cannonball/grapeshot
	name = "炮弹箱 (霰弹)"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/cannon_ball/grapeshot = 15)
	cratevalue = 175 //assuming 10 value

/obj/structure/closet/crate/webbings
	name = "弹药带箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/clothing/accessory/storage/webbing = 10)
	cratevalue = 110 //assuming 10 value
/////////////ABASHIRI////////////////////
/obj/structure/closet/crate/abashiri/ammo
	name = "有坂弹药"
	paths = list(/obj/item/ammo_magazine/arisaka = 15,)
	cratevalue = 60 //50 base
/obj/structure/closet/crate/abashiri/ammo/type26
	name = "二六式弹药"
	paths = list(/obj/item/ammo_magazine/c9mm_jap_revolver = 10,)
	cratevalue = 60 //50 base
/obj/structure/closet/crate/abashiri/guns
	name = "有坂步枪"
	paths = list(/obj/item/weapon/gun/projectile/boltaction/arisaka30 = 5,)
	cratevalue = 60 //50 base
/obj/structure/closet/crate/abashiri/guns/type26
	name = "二六式左轮手枪"
	paths = list(/obj/item/weapon/gun/projectile/revolver/t26_revolver = 5,)
	cratevalue = 60 //50 base
/obj/structure/closet/crate/abashiri/batons
	name = "警棍"
	paths = list(/obj/item/weapon/gun/projectile/revolver/t26_revolver = 10,)
	cratevalue = 60 //50 base
////WW1////////
/obj/structure/closet/crate/ww1/grenades_french
	name = "F1手榴弹箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/grenade/modern/f1 = 10)

/obj/structure/closet/crate/ww1/grenades_german
	name = "stg 1915手榴弹箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/grenade/modern/stg1915 = 10)

/obj/structure/closet/crate/ww1/grenades_british
	name = "米尔斯手榴弹箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/grenade/modern/mills = 10)


/obj/structure/closet/crate/ww1/ammo_hotchkiss
	name = "哈奇开斯弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/hotchkiss = 10)

/obj/structure/closet/crate/ww1/ammo_type3
	name = "三年式弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/type3 = 10)

/obj/structure/closet/crate/ww1/ammo_vickers
	name = "维克斯弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/vickers = 10)

/obj/structure/closet/crate/ww1/ammo_mg08
	name = "MG08弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/mg08 = 10)
/obj/structure/closet/crate/ww1/ammo_maxim
	name = "马克沁弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/maxim = 10)

/obj/structure/closet/crate/ww2
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	name = "军用物资箱"

/obj/structure/closet/crate/ww2/mk2
	name = "Mk2手榴弹箱"
	paths = list(/obj/item/weapon/grenade/ww2/mk2 = 10)

/obj/structure/closet/crate/ww2/rgd33
	name = "RGD33手榴弹箱"
	paths = list(/obj/item/weapon/grenade/ww2/rgd33 = 10)

/obj/structure/closet/crate/ww2/stg1924
	name = "stg 1924手榴弹箱"
	paths = list(/obj/item/weapon/grenade/ww2/stg1924 = 10)

/obj/structure/closet/crate/ww2/ammo_mg34
	name = "MG34弹链箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/mg34belt = 10)
/obj/structure/closet/crate/ww2/panzerfaust
	name = "铁拳火箭筒箱"
	paths = list(/obj/item/weapon/gun/launcher/rocket/single_shot/panzerfaust = 6)

/obj/structure/closet/crate/ww2/atmines
	name = "反坦克地雷箱"
	paths = list(/obj/item/mine/at = 5)

/obj/structure/closet/crate/ww2/rpg40
	name = "RPG-40反坦克手榴弹箱"
	paths = list(/obj/item/weapon/grenade/antitank/rpg40 = 6)

/obj/structure/closet/crate/ww2/g43
	name = "G43弹药箱"
	paths = list(/obj/item/ammo_magazine/g43 = 10)

/obj/structure/closet/crate/ww2/mp40
	name = "MP40弹药箱"
	paths = list(/obj/item/ammo_magazine/mp40 = 8)

/obj/structure/closet/crate/ww2/mosin_ammo
	name = "莫辛弹药箱"
	paths = list(/obj/item/ammo_magazine/mosin = 25)

/obj/structure/closet/crate/ww2/mosin
	name = "莫辛1891/30步枪箱"
	paths = list(/obj/item/weapon/gun/projectile/boltaction/mosin/m30 = 20)

/obj/structure/closet/crate/ww2/mosin_old
	name = "莫辛1891步枪箱"
	paths = list(/obj/item/weapon/gun/projectile/boltaction/mosin = 20)

/obj/structure/closet/crate/ww2/stg
	name = "StG44弹药箱"
	paths = list(/obj/item/ammo_magazine/stg = 8)

/obj/structure/closet/crate/ww2/svt
	name = "SVT-40弹药箱"
	paths = list(/obj/item/ammo_magazine/svt = 10)

/obj/structure/closet/crate/ww2/ppsh
	name = "波波沙弹药箱"
	paths = list(/obj/item/ammo_magazine/c762x25_ppsh = 8)

/obj/structure/closet/crate/ww2/pps
	name = "波波斯弹药箱"
	paths = list(/obj/item/ammo_magazine/c762x25_pps = 8)

/obj/structure/closet/crate/coldwar/m26
	name = "M26手榴弹箱"
	paths = list(/obj/item/weapon/grenade/coldwar/m26 = 10)

/obj/structure/closet/crate/coldwar/m18
	name = "M18烟雾弹箱"
	paths = list(/obj/item/weapon/grenade/smokebomb/m18smoke = 10)

/obj/structure/closet/crate/ww2/vietnam/us_ammo
	name = "美军弹药"
	paths = list(/obj/item/ammo_magazine/m16 = 16,
				/obj/item/ammo_magazine/b762 = 4,
				/obj/item/ammo_magazine/greasegun = 4,
				/obj/item/ammo_magazine/m14 = 4,
				)

/obj/structure/closet/crate/ww2/vietnam/us_medical
	name = "美军医疗物资"
	paths = list(/obj/item/weapon/storage/firstaid/combat/modern = 1,
				/obj/item/weapon/storage/firstaid/adv = 1,
				/obj/structure/iv_drip = 1,
				/obj/item/weapon/reagent_containers/blood/OMinus = 1,
				)

/obj/structure/closet/crate/ww2/vietnam/us_explosives
	name = "美军炸药"
	paths = list(/obj/item/weapon/grenade/coldwar/m67 = 4,
				/obj/item/weapon/grenade/incendiary/anm14 = 2,
				/obj/item/weapon/plastique/c4 = 2,
				/obj/item/weapon/grenade/dynamite/ready = 2,
				/obj/item/weapon/grenade/coldwar/nonfrag/m26 = 2,
				)

/obj/structure/closet/crate/ww2/vietnam/us_engineering
	name = "美军工程物资"
	paths = list(/obj/item/weapon/barrier/sandbag = 30,
				/obj/item/stack/material/barbwire/ten = 2,
				/obj/item/weapon/material/shovel/trench = 2,
				/obj/item/weapon/material/shovel/steel = 1,
				/obj/item/weapon/material/hatchet/steel = 1,
				/obj/item/weapon/wirecutters/boltcutters = 1,
				)

/obj/structure/closet/crate/ww2/vietnam/us_ap_mines
	name = "美军反步兵地雷"
	paths = list(/obj/item/mine/ap = 15,
				/obj/item/weapon/wirecutters/boltcutters = 2,
				/obj/item/weapon/material/shovel/trench = 2,
				)

/obj/structure/closet/crate/ww2/vietnam/sks
	name = "SKS步枪箱"
	paths = list(/obj/item/ammo_magazine/sks = 30,
				/obj/item/weapon/gun/projectile/semiautomatic/sks = 6,
				)
/obj/structure/closet/crate/ww2/vietnam/akm
	name = "AKM步枪箱"
	paths = list(/obj/item/ammo_magazine/ak47 = 30,
				/obj/item/weapon/gun/projectile/submachinegun/ak47 = 6,
				)
/obj/structure/closet/crate/ww2/vietnam/viet_grenades
	name = "手榴弹箱"
	paths = list(/obj/item/weapon/grenade/modern/f1 = 8,
				/obj/item/weapon/grenade/smokebomb/rdg1 = 4,
				/obj/item/weapon/grenade/smokebomb/rdg2 = 4,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/molotov/vodka = 2,
				/obj/item/weapon/matchbox = 2,
				)

/obj/structure/closet/crate/ww2
	storagecap = 15

/obj/structure/closet/crate/ww2/un/ammo
	name = "联合国维和弹药"
	paths = list(/obj/item/ammo_magazine/fal = 16,
				/obj/item/ammo_magazine/m1911 = 8,
				/obj/item/ammo_magazine/greasegun = 4,
				/obj/item/ammo_magazine/m14 = 4,
				)

/obj/structure/closet/crate/ww2/un/ap
	name = "联合国维和区域封锁装备"
	paths = list(/obj/item/mine/ap = 10,
				/obj/item/stack/material/barbwire/ten = 3,
				/obj/item/weapon/material/shovel/trench = 2,
				/obj/item/weapon/wirecutters/boltcutters = 1,
				)

/obj/structure/closet/crate/ww2/un/explosives
	name = "联合国维和手榴弹"
	paths = list(/obj/item/weapon/grenade/coldwar/m67 = 8,
				/obj/item/weapon/grenade/incendiary/anm14 = 4,
				/obj/item/weapon/grenade/smokebomb/m18smoke = 4,
				)

/obj/structure/closet/crate/ww2/un/m16ammo
	name = "散装5.56x45毫米弹匣"
	paths = list(/obj/item/ammo_magazine/m16 = 10)
/obj/structure/closet/crate/ww2/un/m16ammoboxes
	name = "散装5.56x45毫米弹药"
	paths = list(/obj/item/ammo_magazine/m16/box = 10)

/obj/structure/closet/crate/ww2/un/falammoboxes
	name = "散装7.62x51毫米弹药"
	paths = list(/obj/item/ammo_magazine/box_762x51 = 10)

/obj/structure/closet/crate/ww2/un/ammoboxes
	name = "散装特种弹药"
	paths = list(/obj/item/ammo_magazine/a45acpbox = 4,
				/obj/item/ammo_magazine/madsen/box = 3,
				/obj/item/ammo_magazine/box_762x51 = 3,
				/obj/item/ammo_magazine/greasegun/box = 2,
				/obj/item/ammo_magazine/c455 = 2,
				)

/obj/structure/closet/crate/ww2/un/vickersboxes
	name = "散装.303英式弹药"
	paths = list(/obj/item/ammo_magazine/vickers/box = 6)

/obj/structure/closet/crate/ww2/un/meals
	name = "联合国维和口粮"
	paths = list(/obj/item/weapon/storage/ww2/unmeal = 10)

/obj/structure/closet/crate/ww2/airdrops/medical
	name = "医疗物资"
	paths = list(/obj/item/weapon/storage/firstaid/combat/modern = 2,
				/obj/item/weapon/storage/firstaid/adv = 2,
				)

/obj/structure/closet/crate/ww2/airdrops/ap
	name = "区域封锁装备"
	paths = list(/obj/item/mine/ap = 10,
				/obj/item/stack/material/barbwire/ten = 3,
				/obj/item/weapon/wirecutters/boltcutters = 1,
				)

/obj/structure/closet/crate/ww2/airdrops/engineering
	name = "工程物资"
	storagecap = 23
	paths = list(/obj/item/weapon/barrier/sandbag = 20,
				/obj/item/weapon/material/shovel/trench/foldable = 2,
				/obj/item/weapon/material/shovel/steel = 1,
				)

/obj/structure/closet/crate/ww2/russian/ammo
	name = "散装5.45x39毫米弹匣"
	paths = list(/obj/item/ammo_magazine/ak74/ak74m = 10)
/obj/structure/closet/crate/ww2/russian/ammo
	name = "散装5.45x39毫米弹药"
	paths = list(/obj/item/ammo_magazine/ak74/box = 10)

/obj/structure/closet/crate/ww2/mortar_shells
	name = "迫击炮弹"
	paths = list(/obj/item/cannon_ball/mortar_shell = 20)

/obj/structure/closet/crate/ww2/artillery_shells
	name = "高爆炮弹"
	paths = list(/obj/item/cannon_ball/shell = 10)

obj/structure/closet/crate/ww2/artillery_shells/HE57
	name = "57 mm HE shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/HE57 = 10)

obj/structure/closet/crate/ww2/artillery_shells/AP57
	name = "57 mm AP shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/AP57 = 10)

obj/structure/closet/crate/ww2/artillery_shells/APCR57
	name = "57 mm APCR shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/APCR57 = 10)

obj/structure/closet/crate/ww2/artillery_shells/HE75
	name = "75 mm HE shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/HE75 = 10)

obj/structure/closet/crate/ww2/artillery_shells/AP75
	name = "75 mm AP shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/AP75 = 10)

obj/structure/closet/crate/ww2/artillery_shells/APCR75
	name = "75 mm APCR shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/APCR75 = 10)

obj/structure/closet/crate/ww2/artillery_shells/HE76
	name = "76.2 mm HE shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/HE76 = 10)

obj/structure/closet/crate/ww2/artillery_shells/AP76
	name = "76.2 mm AP shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/AP76 = 10)

obj/structure/closet/crate/ww2/artillery_shells/APCR76
	name = "76.2 mm APCR shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/APCR76 = 10)

obj/structure/closet/crate/ww2/artillery_shells/HE88
	name = "88 mm HE shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/HE88 = 10)

obj/structure/closet/crate/ww2/artillery_shells/AP88
	name = "88 mm AP shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/AP88 = 10)

obj/structure/closet/crate/ww2/artillery_shells/APCR88
	name = "88 mm APCR shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/APCR88 = 10)

obj/structure/closet/crate/ww2/artillery_shells/HE85
	name = "85 mm HE shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/HE85 = 10)

obj/structure/closet/crate/ww2/artillery_shells/AP85
	name = "85 mm AP shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/AP85 = 10)

obj/structure/closet/crate/ww2/artillery_shells/APCR85
	name = "85 mm APCR shells crate"
	paths = list(/obj/item/cannon_ball/shell/tank/APCR85 = 10)

/obj/structure/closet/crate/airdrops
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	name = "军用物资箱"

/obj/structure/closet/crate/airdrops/supplies
	name = "补给箱"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/MRE/generic = 3,
				/obj/item/stack/medical/advanced/bruise_pack = 1,
				/obj/item/stack/medical/advanced/ointment = 1,
				/obj/item/stack/material/steel/twentyfive = 1,
				/obj/item/weapon/material/hatchet/steel = 1,
				/obj/item/weapon/pill_pack/potassium_iodide = 1)

/obj/structure/closet/crate/airdrops/food
	name = "食物箱"
	paths = list(/obj/item/weapon/reagent_containers/food/snacks/MRE/generic = 10,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2 = 1)

obj/structure/closet/crate/airdrops/weapons
	name = "weapons crate"
	paths = list(/obj/item/weapon/gun/projectile/submachinegun/makeshiftak47 = 1,
				/obj/item/weapon/gun/projectile/boltaction/singleshot/makeshiftbolt = 1,
				/obj/item/ammo_magazine/ak47/makeshift = 2,
				/obj/item/ammo_magazine/mosin = 2,
				/obj/item/weapon/attachment/bayonet = 1)

/obj/structure/closet/crate/airdrops/military
	name = "军用物资箱"
	paths = list(/obj/item/weapon/gun/projectile/pistol/m9beretta = 1,
				/obj/item/ammo_magazine/m9beretta = 2,
				/obj/item/clothing/mask/gas/military = 1,
				/obj/item/clothing/accessory/armor/nomads/thickcarrier = 1,
				/obj/item/weapon/grenade/modern/f1 = 1,
				/obj/item/clothing/head/helmet/modern/lwh = 1,
				/obj/item/weapon/reagent_containers/food/snacks/MRE/generic/american = 1,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/us = 1)

/obj/structure/closet/crate/airdrops/medicine
	name = "药品箱"
	paths = list(/obj/item/weapon/storage/firstaid/combat/modern = 1,
				/obj/item/weapon/storage/firstaid/adv = 1,
				/obj/item/weapon/storage/pill_bottle/potassium_iodide = 1,)

/obj/structure/closet/crate/airdrops/cold
	name = "防寒装备箱"
	paths = list(/obj/item/clothing/gloves/thick/leather/grey = 1,
				/obj/item/clothing/suit/storage/coat/winter_coat = 1,
				/obj/item/clothing/shoes/winterboots = 1,
				/obj/item/clothing/head/ww2/sov_ushanka/nomads = 1)

/obj/structure/closet/crate/airdrops/rads
	name = "防辐射装备箱"
	paths = list(/obj/item/clothing/suit/nbc = 1,
				/obj/item/clothing/head/nbc = 1,
				/obj/item/clothing/mask/gas/modern = 1,
				/obj/item/weapon/pill_pack/potassium_iodide = 1)

/////soviet resupplies

/obj/structure/closet/crate/airdrops/soviet/ammo
	name = "弹药箱"
	paths = list(/obj/item/ammo_magazine/ak74 = 8,
				/obj/item/ammo_magazine/vintorez = 2,
				/obj/item/ammo_magazine/svd = 2,
				/obj/item/ammo_magazine/pkm/c100 = 2)

/obj/structure/closet/crate/airdrops/soviet/pkm
	name = "PKM机枪箱"
	paths = list(/obj/item/weapon/gun/projectile/automatic/pkm = 1,
				/obj/item/ammo_magazine/pkm/c100 = 5,
				/obj/item/weapon/gun_cleaning_kit = 1)

/obj/structure/closet/crate/airdrops/soviet/defense
	name = "防御物资箱"
	paths = list(/obj/item/mine/ap = 5,
				/obj/item/weapon/wirecutters/boltcutters = 2,
				/obj/item/weapon/storage/box/sandbags = 2,
				/obj/item/weapon/material/shovel/trench = 1,
				/obj/item/weapon/material/shovel/steel = 1)

/obj/structure/closet/crate/airdrops/soviet/medical
	name = "医疗物资箱"
	paths = list(/obj/item/stack/medical/bruise_pack/gauze = 5,
				/obj/item/weapon/pill_pack/tramadol = 1,
				/obj/item/weapon/pill_pack/adrenaline = 1,
				/obj/item/roller = 1,
				/obj/item/stack/medical/advanced/sulfa = 1)

/obj/structure/closet/crate/airdrops/soviet/explo
	name = "防御炸药箱"
	paths = list(/obj/item/weapon/grenade/coldwar/rgd5 = 5,
				/obj/item/weapon/grenade/incendiary = 5,
				/obj/item/weapon/gun/launcher/rocket/single_shot/rpg22 = 1)

/obj/structure/closet/crate/arrows
	name = "箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow = 20)

/obj/structure/closet/crate/arrows/bronze
	name = "青铜箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/bronze = 20)

/obj/structure/closet/crate/arrows/copper
	name = "铜箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/copper = 20)

/obj/structure/closet/crate/arrows/iron
	name = "铁箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/iron = 20)

/obj/structure/closet/crate/arrows/modern
	name = "现代箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/modern = 20)

/obj/structure/closet/crate/arrows/steel
	name = "钢箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/steel = 20)

/obj/structure/closet/crate/arrows/stone
	name = "石箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow/stone = 20)

/obj/structure/closet/crate/bolts
	name = "弩矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/arrow = 20)

/obj/structure/closet/crate/bolts/iron
	name = "铁箭矢箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_casing/bolt/iron = 20)

/obj/structure/closet/crate/pepelsibirsk/surplus_ww2
	name = "红军剩余军服箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/clothing/under/ww2/soviet = 5,
				/obj/item/clothing/shoes/heavyboots/wrappedboots = 5,
				/obj/item/clothing/suit/storage/coat/ww2/sovcoat = 5,
				/obj/item/clothing/head/helmet/ww2/soviet = 5)

/obj/structure/closet/crate/pepelsibirsk/sov_uniforms
	name = "阿富汗卡军服箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/clothing/under/afghanka = 5,
				/obj/item/clothing/shoes/jackboots/soviet = 5,
				/obj/item/clothing/suit/storage/jacket/afghanka = 5,
				/obj/item/clothing/head/helmet/modern/ssh_68 = 5)

/obj/structure/closet/crate/pepelsibirsk/sks
	name = "SKS 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/gun/projectile/semiautomatic/sks = 5,
				/obj/item/ammo_magazine/sks = 20)

/obj/structure/closet/crate/pepelsibirsk/akm
	name = "AKM 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/gun/projectile/submachinegun/ak47 = 5,
				/obj/item/ammo_magazine/ak47 = 10)

/obj/structure/closet/crate/pepelsibirsk/ak74
	name = "AK-74 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/gun/projectile/submachinegun/ak74 = 5,
				/obj/item/ammo_magazine/ak74 = 10)

/obj/structure/closet/crate/pepelsibirsk/svd
	name = "SVD 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/gun/projectile/semiautomatic/svd = 2,
				/obj/item/ammo_magazine/svd = 8)

/obj/structure/closet/crate/pepelsibirsk/mosin
	name = "莫辛-纳甘 弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/boltaction/mosin/m30 = 10,
				/obj/item/ammo_magazine/mosin = 40,
				/obj/item/ammo_magazine/mosinbox = 10)

/obj/structure/closet/crate/pepelsibirsk/ppsh
	name = "波波沙 弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/weapon/gun/projectile/submachinegun/ppsh = 2,
				/obj/item/ammo_magazine/c762x25_ppsh = 8)

/obj/structure/closet/crate/pepelsibirsk/makarov
	name = "马卡洛夫 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/gun/projectile/pistol/makarov = 5,
				/obj/item/ammo_magazine/makarov = 15)

/obj/structure/closet/crate/pepelsibirsk/ninex18mm
	name = "9x18mm 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/ammo_magazine/makarov/box = 4)

/obj/structure/closet/crate/pepelsibirsk/seven62x39mm
	name = "7.62x39mm 弹药箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/ammo_magazine/ak47 = 10)

/obj/structure/closet/crate/pepelsibirsk/seven62x54mmr
	name = "7.62x54mmR 弹药箱"
	icon_state = "wood_crate"
	icon_opened = "wood_crate_opened"
	icon_closed = "wood_crate"
	paths = list(/obj/item/ammo_magazine/mosinbox = 4)

/obj/structure/closet/crate/pepelsibirsk/rgd5
	name = "破片手榴弹箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/grenade/coldwar/rgd5 = 12)

/obj/structure/closet/crate/pepelsibirsk/sixb1
	name = "6B1 防弹背心箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/clothing/accessory/armor/coldwar/flakjacket/b1 = 5)

/obj/structure/closet/crate/pepelsibirsk/sixb2
	name = "6B2 防弹背心箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/clothing/accessory/armor/coldwar/plates/b2 = 5)

/obj/structure/closet/crate/scopes
	name = "狙击镜箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/attachment/scope/adjustable/sniper_scope = 5)

/obj/structure/closet/crate/scopes/pu
	name = "莫辛/SVT 瞄准镜箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pu = 5)

/obj/structure/closet/crate/scopes/pso1
	name = "PSO-1 瞄准镜箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/attachment/scope/adjustable/sniper_scope/pso1 = 5)

/obj/structure/closet/crate/suicidevests
	name = "自杀式背心箱"
	icon_state = "mil_crate_closed"
	icon_opened = "mil_crate_opened"
	icon_closed = "mil_crate_closed"
	paths = list(/obj/item/weapon/grenade/suicide_vest = 4)

/obj/structure/closet/crate/rublecrate
	name = "卢布箱"
	icon_state = "crate"
	icon_opened = "crateopen"
	icon_closed = "crate"
	color = "#bcc625"
	paths = list(/obj/item/stack/money/rubles/fivehundred = 3)

#undef DYNAMIC_AMT
