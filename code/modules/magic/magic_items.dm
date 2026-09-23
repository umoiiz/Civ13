// Magic Items and Potions

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/not_butter_beer
	name = "我简直不敢相信这不是黄油啤酒"
	desc = "等等,它真的是黄油啤酒吗?不,你简直不敢相信它不是!"
	icon_state = "oldstyle_beer"
	item_state = "beer"
	volume = 50
	New()
		..()
		reagents.add_reagent("not_butter_beer", 50)

/datum/reagent/drink/not_butter_beer
	name = "I-Can't-Believe-It's-Not-Butter-Beer"
	id = "not_butter_beer"
	description = "A buttery alcoholic beverage that feels magical."
	taste_description = "sweet buttery ale"
	color = "#c89d3c"

/datum/reagent/drink/not_butter_beer/affect_ingest(var/mob/living/human/M, var/alien, var/removed)
	..()
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.juice < H.max_juice)
			H.juice = min(H.max_juice, H.juice + 1.0 * removed)
		H.eye_blurry = max(H.eye_blurry, 3)
		if (H.dizziness < 108)
			H.make_dizzy(108 - H.dizziness)


/obj/item/weapon/reagent_containers/food/drinks/bottle/small/green_goop
	name = "斯尼普教授的绿色黏糊"
	desc = "一个稀有的药剂瓶,里面装着冒泡的绿色液体。"
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "potion_green"
	item_state = "beer"
	volume = 5
	slot_flags = SLOT_BELT | SLOT_POCKET
	New()
		..()
		reagents.add_reagent("green_goop", 5)

/datum/reagent/drink/green_goop
	name = "Professor Snip's Green Goop"
	id = "green_goop"
	description = "A rare, swirling green goop. Smells like trouble, but tastes like pure energy."
	taste_description = "sour chemicals and raw power"
	color = "#00FF00"

/datum/reagent/drink/green_goop/affect_ingest(var/mob/living/human/M, var/alien, var/removed)
	..()
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.juice < H.max_juice)
			H.juice = min(H.max_juice, H.juice + 20.0 * removed)
		H.stats["stamina"][1] = H.stats["stamina"][2]
	M.adjustToxLoss(1.0 * removed)

/obj/item/weapon/reagent_containers/food/snacks/chocotoad
	name = "巧克力蟾蜍"
	desc = "一只巧克力蟾蜍。吃下一只立刻恢复50点果汁。"
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "chocotoad"
	volume = 10
	bitesize = 10
	biteamount = 1
	nutriment_amt = 2
	nutriment_desc = list("chocolate" = 2)

/obj/item/weapon/reagent_containers/food/snacks/chocotoad/On_Consume(var/mob/M)
	..()
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.juice < H.max_juice)
			H.juice = min(H.max_juice, H.juice + 50)


/obj/item/wand_part
	icon = 'icons/obj/magic_items.dmi'
	slot_flags = SLOT_BELT | SLOT_POCKET

/obj/item/wand_part/badger_hair
	name = "獾毛"
	desc = "一簇注入武斗本能的獾毛。它形成一种擅长战斗的魔杖杖芯。"
	icon_state = "badger_hair"

/obj/item/wand_part/pigeon_feather
	name = "鸽子羽毛"
	desc = "一根光滑的羽毛,随移动魔法飘动。它帮助魔杖快速施法和闪现。"
	icon_state = "pigeon_feather"

/obj/item/wand_part/copper_wire
	name = "铜线"
	desc = "一根传导奥术力量的铜丝,同时会招致不稳定的过载施法。它以风险为代价降低果汁消耗。"
	icon_state = "copper_wire"

/obj/item/wand_part/pocket_lint
	name = "口袋绒毛"
	desc = "一把从口袋里捡来的柔软绒毛。它不可预测的能量让魔杖极度不稳定。"
	icon_state = "pocket_lint"

/obj/item/wand_part/asbestos
	name = "石棉纤维"
	desc = "耐火的纤维状石棉填料。它以有毒的代价让魔杖防火。"
	icon_state = "asbestos"

/obj/item/wand_part/fox_fur
	name = "狐狸毛"
	desc = "一条带有狡黠光泽的狐狸毛。它让魔杖的魔法无声,同时减慢其施法速度。"
	icon_state = "fox_fur"

/obj/item/wand_part/chewing_gum
	name = "用过的口香糖"
	desc = "从斯尼普教授桌子底下刮下来的。极不卫生且极其黏。"
	icon_state = "chewing_gum"

/obj/item/wand_part/cassette_tape
	name = "缠结的磁带"
	desc = "从一盘被没收的1980年代合成器流行混音带中扯出的磁带。它噼啪作响,带有不稳定、循环的能量。"
	icon_state = "cassette_tape"

/obj/item/wand_part/sheep_wool
	name = "潮湿的羊毛"
	desc = "挂在拖把球球场附近的铁丝网围栏上。闻起来有强烈的雨水和羊毛脂味。"
	icon_state = "sheep_wool"

/obj/item/wand_part/rat_tail
	name = "野鼠尾巴"
	desc = "在板岩派公共休息室的黑暗角落里找到的。一个真正幸存者的本质,但终究是个懦夫。"
	icon_state = "rat_tail"

/obj/item/wand_part/spark_plug
	name = "生锈的火花塞"
	desc = "从农夫埃文斯田里一台坏掉的拖拉机上拔下来的。沉重、金属感十足,并涌动着原始动能。"
	icon_state = "spark_plug"

/obj/item/wand_part/gnat_wing
	name = "金蚊翅膀"
	desc = "快得嗡嗡作响。它想飞走,即使被塞进一块木头里。"
	icon_state = "gnat_wing"

/obj/item/wand_part/gloom_thread
	name = "暗纹丝线"
	desc = "触感冰冷刺骨. 握着它就像握住了纯粹的绝望."
	icon_state = "gloom_thread"

/obj/item/wand_part/pine_wood
	name = "松木"
	desc = "一根容易劈裂的松木枝. 这是一种常见的魔杖基材, 具有均衡的魔法特性."
	icon_state = "pine_wood"

/obj/item/wand_part/mdf_board
	name = "中密度纤维板"
	desc = "一块致密的中密度纤维板, 遇水会吸收汁液并膨胀. 它能让魔杖变得便宜但脆弱."
	icon_state = "mdf_board"

/obj/item/wand_part/balsa_wood
	name = "轻木"
	desc = "一根轻如羽毛的轻木板条. 它迅捷而脆弱, 用它制成的魔杖在近战中很容易折断."
	icon_state = "balsa_wood"

/obj/item/wand_part/snooker_cue
	name = "斯诺克球杆"
	desc = "一根抛光过的斯诺克球杆杆身. 它赋予魔杖强大的近战威力, 但会牺牲施法速度."
	icon_state = "snooker_cue"

/obj/item/wand_part/fibreglass
	name = "玻璃纤维"
	desc = "一条富有弹性的玻璃纤维条. 它能让魔杖在过度施法时猛烈甩出, 并且施法速度极快."
	icon_state = "fibreglass"

/obj/item/wand_part/driftwood
	name = "浮木"
	desc = "一块带有元素共鸣的漂白浮木. 它散发着淡淡的海水气息, 能增强法术效率."
	icon_state = "driftwood"

/obj/item/wand_part/stale_chip
	name = "不新鲜的薯条"
	desc = "周二午餐服务时被食堂多丽丝大妈掉落, 经过数月硬化成了一种坚不可摧、岩石般的物质."
	icon_state = "stale_chip"

/obj/item/wand_part/shrub_root
	name = "尖啸灌木根"
	desc = "一根粗壮、不断振动的根须, 持续发出微弱的高频呜咽声. 它具有极强的魔法不稳定性."
	icon_state = "shrub_root"

/obj/item/wand_part/cap_truncheon
	name = "C.A.P. 警棍"
	desc = "魔法实践治安局的制式警棍. 由致密、抗魔法的红木雕刻而成, 并以铅加重."
	icon_state = "cap_truncheon"

/obj/effect/spawner/objspawner/wandpart
	max_number = 3
	max_range = 4

/obj/effect/spawner/objspawner/wandpart/pine_wood
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/pine_wood
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/mdf_board
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/mdf_board
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/balsa_wood
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/balsa_wood
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/fibreglass
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/fibreglass
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/driftwood
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/driftwood
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/snooker_cue
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/snooker_cue
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/badger_hair
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/badger_hair
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/pigeon_feather
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/pigeon_feather
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/copper_wire
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/copper_wire
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/pocket_lint
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/pocket_lint
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/asbestos
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/asbestos
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/fox_fur
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/fox_fur
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/stale_chip
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/stale_chip
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/shrub_root
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/shrub_root
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/cap_truncheon
	name = "wand part spawner"
	icon_state = "f2"
	create_path = /obj/item/wand_part/cap_truncheon
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/chewing_gum
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/chewing_gum
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/cassette_tape
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/cassette_tape
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/sheep_wool
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/sheep_wool
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/rat_tail
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/rat_tail
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/spark_plug
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/spark_plug
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/gnat_wing
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/gnat_wing
	timer = 1800

/obj/effect/spawner/objspawner/wandpart/gloom_thread
	name = "wand part spawner"
	icon_state = "f3"
	create_path = /obj/item/wand_part/gloom_thread
	timer = 1800

/obj/item/weapon/basketball/mopball
	name = "拖把球"
	desc = "用于玩拖把球的球. 它略有弹性, 而且非常脏."

// ============================================================
// BRENDA'S "SPECIAL RESERVE" WELSH RUM
// ============================================================

/obj/item/weapon/reagent_containers/food/drinks/bottle/welsh_rum
	name = "布伦达的\"特别珍藏\"威尔士朗姆酒"
	desc = "一个肮脏的瓶子, 上面有手写标签, 写着\"B. 布伦达的财产 - 碰这个我就打断你的魔杖胳膊.\""
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "rumbottle"
	item_state = "beer"
	volume = 60
	value = 50
	New()
		..()
		reagents.add_reagent("welsh_rum", 60)

/obj/item/weapon/reagent_containers/food/drinks/bottle/welsh_rum/empty
	name = "布伦达朗姆酒的空瓶"
	desc = "一个空瓶子. 廉价朗姆酒和绝望的气味依然萦绕不散."
	icon_state = "rumbottle"
	value = 1
	New()
		..()
		reagents.del_reagents()

/datum/reagent/drink/welsh_rum
	name = "Brenda's \"Special Reserve\" Welsh Rum"
	id = "welsh_rum"
	description = "Bathtub-brewed since 1982. Strips paint, but gets you through an exam."
	taste_description = "burning rubber and defiance"
	color = "#8B4513"
	metabolism = REM * 6

/datum/reagent/drink/welsh_rum/affect_ingest(var/mob/living/human/M, var/alien, var/removed)
	..()
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.juice < H.max_juice)
			H.juice = min(H.max_juice, H.juice + 1.0 * removed)
		H.add_chemical_effect(CE_PAINKILLER, 250)
		H.slurring = max(H.slurring, 45)
		M.mood += removed*25

// ============================================================
// THE "CHAMELEON" MAC (Bootleg Invisibility Cloak)
// ============================================================

/obj/item/clothing/suit/chameleon_mac
	name = "\"变色龙\"雨衣"
	desc = "一件有异味、半透明的1980年代塑料雨衣. 布伦达发誓它是用隐形兽编织的; 实际上它是高度反光的魔法部级塑料. 站着不动你就会消失."
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "mac_jacket"
	item_state = "mac_jacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(melee = 5, arrow = 0, gun = FALSE, energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING
	value = 200
	var/mob/living/human/wearer = null
	var/last_x = 0
	var/last_y = 0
	var/last_z = 0
	var/stand_still_time = 0
	var/hidden = FALSE
	var/normal_alpha = 101

/obj/item/clothing/suit/chameleon_mac/equipped(var/mob/user, var/slot)
	..()
	if (slot == slot_wear_suit && ishuman(user))
		wearer = user
		normal_alpha = wearer.alpha
		processing_objects |= src

/obj/item/clothing/suit/chameleon_mac/dropped(var/mob/user)
	if (wearer)
		wearer.alpha = normal_alpha
		wearer = null
	processing_objects -= src
	..()

/obj/item/clothing/suit/chameleon_mac/Destroy()
	if (wearer)
		wearer.alpha = normal_alpha
		wearer = null
	processing_objects -= src
	return ..()

/obj/item/clothing/suit/chameleon_mac/process()
	if (!wearer || wearer.stat || !isturf(wearer.loc))
		return
	if (loc != wearer)
		return

	if (wearer.x != last_x || wearer.y != last_y || wearer.z != last_z)
		last_x = wearer.x
		last_y = wearer.y
		last_z = wearer.z
		stand_still_time = world.time
		if (hidden)
			hidden = FALSE
			wearer.alpha = normal_alpha
		return

	if (world.time - stand_still_time >= 50 && !hidden)
		hidden = TRUE
		wearer.alpha = 0

// ============================================================
// CWM-PLWD DITCH-WEED (Bootleg Night-Vision)
// ============================================================

/obj/item/weapon/reagent_containers/food/snacks/ditch_weed
	name = "库姆-普卢德沟渠草"
	desc = "一种从魔药地牢后面的有毒排水管中采集的发光、看起来有放射性的杂草. 吃下它会剧烈地使你的眼睛发生变异."
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "ditch_weed"
	volume = 5
	bitesize = 5
	biteamount = 1
	nutriment_amt = 0
	value = 40

/obj/item/weapon/reagent_containers/food/snacks/ditch_weed/On_Consume(var/mob/M)
	..()
	if (ishuman(M))
		var/mob/living/human/H = M
		H.thermal = TRUE
		H.handle_vision()
		to_chat(H, SPAN_NOTICE("Your eyes burn and warp - the world shimmers in green and heat!"))
		spawn(2400)
			if (H && ishuman(H))
				H.thermal = FALSE
				H.handle_vision()
				to_chat(H, SPAN_NOTICE("The thermal shimmer fades from your vision."))

// ============================================================
// THE "BOTTOMLESS" TESCO CARRIER BAG
// ============================================================

/obj/item/weapon/storage/tesco_bag
	name = "\"无底\"乐购购物袋"
	desc = "一个来自非魔法超市的皱巴巴、略带黏性的塑料购物袋. 布伦达亲自在酒吧地窖里给它施了咒. 它能装下多得离谱的东西 - 但尖锐物品可能会把它划破."
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "tesco_bag"
	item_state = "plasticbag"
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_HUGE
	max_storage_space = 200
	storage_slots = null
	slot_flags = SLOT_BELT | SLOT_POCKET
	value = 80

/obj/item/weapon/storage/tesco_bag/handle_item_insertion(obj/item/W, prevent_warning = FALSE)
	. = ..()
	if (. && is_sharp(W) && prob(5))
		rip_bag()

/obj/item/weapon/storage/tesco_bag/proc/rip_bag()
	var/turf/center = get_turf(src)
	playsound(center, 'sound/effects/rip_pack.ogg', 100, TRUE)
	visible_message(SPAN_DANGER("[src] tears apart violently, scattering its contents everywhere!"))
	for (var/obj/item/I in contents)
		remove_from_storage(I, center)
		var/turf/target = locate(center.x + rand(-2, 2), center.y + rand(-2, 2), center.z)
		if (target && !target.density)
			I.loc = target
		else
			I.loc = center
	qdel(src)

// ============================================================
// THE "DEAD-ZONE" CAR BATTERY
// ============================================================

/obj/item/weapon/dead_zone_battery
	name = "\"死区\"汽车电池"
	desc = "一块从旧汽车上拆下的生锈铅酸电池. 外壳上粗糙地刻着反魔法铜符文. 激活时, 它会将大范围内所有奥术频率接地消除."
	icon = 'icons/obj/magic_items.dmi'
	icon_state = "car_battery"
	item_state = "car_battery"
	w_class = ITEM_SIZE_LARGE
	value = 120
	var/cooldown_time = 0
	var/active = FALSE

/obj/item/weapon/dead_zone_battery/attack_self(mob/user)
	if (!ishuman(user))
		return
	var/mob/living/human/H = user
	if (active)
		to_chat(H, SPAN_WARNING("The battery is already discharging!"))
		return
	if (world.time < cooldown_time)
		var/remaining = round((cooldown_time - world.time) / 10)
		to_chat(H, SPAN_WARNING("The battery needs to recharge. Wait [remaining] seconds."))
		return

	H.visible_message(SPAN_DANGER("[H] slams \the [src] onto the ground! A pulse of invisible energy expands outward!"))
	playsound(H.loc, 'sound/effects/spells/blockum.ogg', 80, TRUE)

	H.drop_from_inventory(src)
	loc = get_turf(H)

	new /obj/effect/null_zone(loc, H)

	active = TRUE
	cooldown_time = world.time + 900
	spawn(300)
		if (src)
			active = FALSE

/obj/effect/null_zone
	name = "null zone"
	desc = "这里的空气感觉死寂而沉重."
	invisibility = 101
	anchored = TRUE
	density = FALSE
	var/created_time = 0
	var/mob/living/human/owner = null
	var/list/affected_mobs = list()

/obj/effect/null_zone/New(loc, var/mob/living/human/setter)
	..()
	created_time = world.time
	owner = setter
	processing_objects |= src

/obj/effect/null_zone/Destroy()
	for (var/mob/living/human/H in affected_mobs)
		if (H)
			H.no_magic = FALSE
			to_chat(H, SPAN_NOTICE("The null zone dissipates. You can feel magic again."))
	affected_mobs.Cut()
	processing_objects -= src
	. = ..()

/obj/effect/null_zone/process()
	if (world.time - created_time >= 300)
		qdel(src)
		return

	for (var/mob/living/human/H in range(3, src))
		if (H.stat)
			continue
		if (H.faction == "Moldywart")
			continue
		if (!(H in affected_mobs))
			affected_mobs += H
			H.no_magic = TRUE
			to_chat(H, SPAN_DANGER("An oppressive numbness floods your body - the null zone suppresses all magic!"))

	var/i = 1
	while (i <= affected_mobs.len)
		var/mob/living/human/H = affected_mobs[i]
		if (!H)
			affected_mobs.Cut(i, i + 1)
		else if (H.stat || get_dist(H, src) > 3)
			H.no_magic = FALSE
			to_chat(H, SPAN_NOTICE("You step out of the null zone. Magic feels possible again."))
			affected_mobs.Cut(i, i + 1)
		else
			i++