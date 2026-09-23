#define STICKER_COMMON    1
#define STICKER_UNCOMMON  2
#define STICKER_RARE      3
#define STICKER_LEGENDARY 4

#define STICKER_AGE_STONE      "Stone Age"
#define STICKER_AGE_CLASSICAL  "Classical Age"
#define STICKER_AGE_MEDIEVAL   "Medieval Age"
#define STICKER_AGE_IMPERIAL   "Imperial Age"
#define STICKER_AGE_INDUSTRIAL "Industrial Age"
#define STICKER_AGE_WW1        "WW1"
#define STICKER_AGE_WW2        "WW2"
#define STICKER_AGE_COLDWAR    "Cold War"
#define STICKER_AGE_MODERN     "Modern Age"

#define STICKER_CAT_WONDERS  "Wonders"
#define STICKER_CAT_NATURAL  "Natural Wonders"
#define STICKER_CAT_TECH     "Technology"
#define STICKER_CAT_WEAPONS  "Weapons"
#define STICKER_CAT_ANIMALS  "Animals"
#define STICKER_CAT_CROPS    "Crops"
#define STICKER_CAT_MINERALS "Minerals"

/datum/sticker
	var/id
	var/index = 0
	var/name = "sticker"
	var/desc = "A collectible sticker."
	var/rarity = STICKER_COMMON
	var/category = STICKER_CAT_TECH
	var/age = STICKER_AGE_STONE
	var/icon = 'icons/obj/collectibles.dmi'
	var/icon_state = "collectible_card"

/datum/sticker/proc/rarity_name()
	switch(src.rarity)
		if(STICKER_COMMON)    return "Common"
		if(STICKER_UNCOMMON)  return "Uncommon"
		if(STICKER_RARE)      return "Rare"
		if(STICKER_LEGENDARY) return "Legendary"
	return "Unknown"

/datum/sticker/proc/rarity_color()
	switch(src.rarity)
		if(STICKER_COMMON)    return "#583d07"
		if(STICKER_UNCOMMON)  return "#CE8946"
		if(STICKER_RARE)      return "#C0C0C0"
		if(STICKER_LEGENDARY) return "#D4AF37"
	return "#ffffff"

// ======================= COMMON =======================

/datum/sticker/spear
	id = "spear"
	index = 1
	name = "Spear"
	desc = "一根削尖的木棍,顶端镶着石头——人类的第一件远程武器。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_1"

/datum/sticker/flint_hatchet
	id = "flint_hatchet"
	index = 2
	name = "Flint Hatchet"
	desc = "打制的燧石绑在木柄上。锋利得足以砍倒一棵树。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_1"

/datum/sticker/club
	id = "club"
	index = 3
	name = "Wooden Club"
	desc = "最简单的武器。大头朝对面那家伙招呼。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_1"

/datum/sticker/sling
	id = "sling"
	index = 4
	name = "Sling"
	desc = "一条皮带,让鹅卵石变成致命投射物。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_1"

/datum/sticker/bow
	id = "bow"
	index = 5
	name = "Short Bow"
	desc = "弯曲的木材和筋腱——千年的征服引擎。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_1"

/datum/sticker/pottery
	id = "pottery"
	index = 6
	name = "Clay Pot"
	desc = "手工塑形的烧制黏土——第一个耐用的容器。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/plough
	id = "plough"
	index = 7
	name = "Wooden Plough"
	desc = "翻耕土地,让文明得以定居并养活自己。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/drying_rack
	id = "drying_rack"
	index = 8
	name = "Drying Rack"
	desc = "肉和鱼悬挂风干——最古老的食物保存方式。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/loom
	id = "loom"
	index = 9
	name = "Loom"
	desc = "线被拉紧织成布——从纤维中编织温暖。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/fire
	id = "fire"
	index = 10
	name = "Fire"
	desc = "第一个伟大的发现——温暖、熟食,以及野兽眼中的恐惧。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/basket
	id = "basket"
	index = 11
	name = "Basket"
	desc = "编织的芦苇和草——第一个便携容器。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/fishing_net
	id = "fishing_net"
	index = 12
	name = "Fishing Net"
	desc = "绳索打结成网,从河中养活整个村庄。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/rope
	id = "rope"
	index = 13
	name = "Rope"
	desc = "扭曲的纤维,维系文明的隐形之线。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/hammer
	id = "hammer"
	index = 14
	name = "Hammer"
	desc = "石头或青铜,万能的建造者工具。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/axe
	id = "axe"
	index = 15
	name = "Axe"
	desc = "伐木和加工木材——伐木工最好的朋友。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/mortar_pestle
	id = "mortar_pestle"
	index = 16
	name = "Mortar and Pestle"
	desc = "将谷物、草药和颜料磨成细粉。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/papyrus
	id = "papyrus"
	index = 17
	name = "Papyrus"
	desc = "书写和记录的诞生——思想得以永存。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/torch
	id = "torch"
	index = 18
	name = "Torch"
	desc = "照亮黑暗的光,被带入洞穴和新土地。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/leather_hide
	id = "leather_hide"
	index = 19
	name = "Leather Hide"
	desc = "鞣制的兽皮,最早的衣物和庇护材料。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/irrigation
	id = "irrigation"
	index = 20
	name = "Irrigation"
	desc = "沟渠将水引向田地——造就城市的盈余。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/sails
	id = "sails"
	index = 21
	name = "Sails"
	desc = "帆布捕捉风——人类的第一个引擎。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/cement
	id = "cement"
	index = 22
	name = "Cement"
	desc = "化为石头的粉末——将古代世界黏合在一起。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/fermentation
	id = "fermentation"
	index = 23
	name = "Fermentation"
	desc = "酵母与时间将谷物变成啤酒,将葡萄变成葡萄酒——最早的化学。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_3"

/datum/sticker/chicken
	id = "chicken"
	index = 24
	name = "Chicken"
	desc = "分布最广的家禽——蛋、肉和羽毛。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/cow
	id = "cow"
	index = 25
	name = "Cow"
	desc = "奶、肉、皮革和劳力——农业的支柱。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/deer
	id = "deer"
	index = 26
	name = "Deer"
	desc = "迅捷而警觉,自最早的时代起便因肉和鹿角而被猎杀。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/sheep
	id = "sheep"
	index = 27
	name = "Sheep"
	desc = "羊毛、奶和羊肉——为万民提供衣物的羊群。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/bear
	id = "bear"
	index = 28
	name = "Bear"
	desc = "北方森林的顶级掠食者——令人畏惧与崇敬。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/horse
	id = "horse"
	index = 29
	name = "Horse"
	desc = "让世界变小的动物——骑兵、贸易和运输。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_2"

/datum/sticker/dog
	id = "dog"
	index = 30
	name = "Dog"
	desc = "人类最好的朋友——第一只与我们并肩而行的动物。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/wheel
	id = "wheel"
	index = 31
	name = "Wheel"
	desc = "圆而简单,却彻底改变了每一个转动它的文明。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

/datum/sticker/pickaxe
	id = "pickaxe"
	index = 32
	name = "Pickaxe"
	desc = "用于破岩的尖头工具——矿工形影不离的伙伴。"
	rarity = STICKER_COMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_3"

// ======================= UNCOMMON =======================

/datum/sticker/sword
	id = "sword"
	index = 33
	name = "Iron Sword"
	desc = "一把锻造精良的铁刃,历经无数战斗。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_1"

/datum/sticker/compass
	id = "compass"
	index = 34
	name = "Navigation Compass"
	desc = "引导探险者穿越未知海洋抵达新世界。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_3"

/datum/sticker/cannon
	id = "cannon"
	index = 35
	name = "Iron Cannon"
	desc = "粉碎城堡时代的黑火药火力。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_1"

/datum/sticker/arquebus
	id = "arquebus"
	index = 36
	name = "Arquebus"
	desc = "第一件手持火药武器——装填缓慢,面对它令人恐惧。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_1"

/datum/sticker/musket
	id = "musket"
	index = 37
	name = "Musket"
	desc = "滑膛、前装,齐射时毁灭性十足。帝国缔造者。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_1"

/datum/sticker/forge
	id = "forge"
	index = 38
	name = "Forge"
	desc = "金属加工的核心——矿石在此化为铁。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_3"

/datum/sticker/bloomery
	id = "bloomery"
	index = 39
	name = "Bloomery"
	desc = "将铁与石分离的熔炉,产出海绵状铁块以供锤打。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_3"

/datum/sticker/furnace
	id = "furnace"
	index = 40
	name = "Blast Furnace"
	desc = "过热空气将矿石熔成液态金属,为战争机器提供动力。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_3"

/datum/sticker/steam_engine
	id = "steam_engine"
	index = 41
	name = "Steam Engine"
	desc = "工业革命跳动的心脏。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_3"

/datum/sticker/petrol_engine
	id = "petrol_engine"
	index = 42
	name = "Petrol Engine"
	desc = "内燃机——紧凑、便携的动力,让世界变小。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_3"

/datum/sticker/electricity
	id = "electricity"
	index = 43
	name = "Electricity"
	desc = "驾驭闪电——为第二次工业革命提供动力。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_3"

/datum/sticker/flight
	id = "flight"
	index = 44
	name = "Flight"
	desc = "人类飞上天空,从此再不回头。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_3"

/datum/sticker/cars
	id = "cars"
	index = 45
	name = "Cars"
	desc = "四轮个人交通工具——开阔道路在召唤。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_3"

/datum/sticker/computers
	id = "computers"
	index = 46
	name = "Computers"
	desc = "比任何人脑都思考得更快的逻辑机器——数字革命。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_COLDWAR
	icon_state = "collectible_card_3"

/datum/sticker/printing_press
	id = "printing_press"
	index = 47
	name = "Printing Press"
	desc = "活字与墨水——知识逃离修道院,抵达大众。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_TECH
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_3"

// ======================= RARE =======================

/datum/sticker/hanging_gardens
	id = "hanging_gardens"
	index = 48
	name = "Hanging Gardens of Babylon"
	desc = "梯田绿意倾泻在沙漠城市的城墙上——一座由爱建成的奇迹。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/statue_zeus
	id = "statue_zeus"
	index = 49
	name = "Statue of Zeus"
	desc = "奥林匹亚一尊高耸的黄金象牙坐像,端坐于王座之上。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/temple_artemis
	id = "temple_artemis"
	index = 50
	name = "Temple of Artemis"
	desc = "一座有127根柱子的大理石神庙,被一个追求名声的疯子烧毁。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/mausoleum
	id = "mausoleum"
	index = 51
	name = "Mausoleum at Halicarnassus"
	desc = "摩索拉斯国王的陵墓——宏伟到给了我们“陵墓”这个词。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/colossus_rhodes
	id = "colossus_rhodes"
	index = 52
	name = "Colossus of Rhodes"
	desc = "一尊跨立港口入口的青铜巨像,56年后毁于地震。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/lighthouse
	id = "lighthouse"
	index = 53
	name = "Lighthouse of Alexandria"
	desc = "火光与镜子引导水手从100英里外的海上归家。"
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/bolt_action_rifle
	id = "bolt_action_rifle"
	index = 54
	name = "Bolt Action Rifle"
	desc = "枪机循环,子弹上膛——定义了一战的步枪。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_WW1
	icon_state = "collectible_card_1"

/datum/sticker/machine_gun
	id = "machine_gun"
	index = 55
	name = "Machine Gun"
	desc = "弹链供弹,水冷死亡。将冲锋变成屠杀的武器。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_WW1
	icon_state = "collectible_card_1"

/datum/sticker/submachine_gun
	id = "submachine_gun"
	index = 56
	name = "Submachine Gun"
	desc = "全自动手枪弹——近距离毁灭。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_WW1
	icon_state = "collectible_card_1"

/datum/sticker/assault_rifle
	id = "assault_rifle"
	index = 57
	name = "Assault Rifle"
	desc = "通用步兵武器——在中口径弹药中实现可控自动射击。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_WW2
	icon_state = "collectible_card_1"

/datum/sticker/crossbow
	id = "crossbow"
	index = 58
	name = "Crossbow"
	desc = "以机械力释放的弩箭——以极少的技巧在远距离击穿盔甲。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_WEAPONS
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_1"

/datum/sticker/alligator
	id = "alligator"
	index = 59
	name = "Alligator"
	desc = "自恐龙时代起便潜伏在水道中的装甲伏击掠食者。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/sabertooth
	id = "sabertooth"
	index = 60
	name = "Sabertooth Tiger"
	desc = "为猎杀而生的军刀般长犬齿——已灭绝但从未被遗忘。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_2"

/datum/sticker/piranha
	id = "piranha"
	index = 61
	name = "Piranha"
	desc = "长着剃刀般牙齿、名声可怕的小型淡水鱼。"
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_ANIMALS
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/mount_fuji
	id = "mount_fuji"
	index = 62
	name = "Mount Fuji"
	desc = "一座披雪的完美火山锥——神圣于众神,被千百位画家描绘。"
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/great_barrier_reef
	id = "great_barrier_reef"
	index = 63
	name = "Great Barrier Reef"
	desc = "地球上最大的生物结构,从太空可见。"
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/grand_canyon
	id = "grand_canyon"
	index = 64
	name = "Grand Canyon"
	desc = "大地上一道深达一英里的裂口,由二十亿年耐心的流水雕琢而成."
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/everest
	id = "everest"
	index = 65
	name = "Mount Everest"
	desc = "世界之巅 - 人类所能站立的最高点."
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/victoria_falls
	id = "victoria_falls"
	index = 66
	name = "Victoria Falls"
	desc = "雷鸣之烟 - 一英里宽的水幕坠入深渊."
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/sahara
	id = "sahara"
	index = 67
	name = "Sahara Desert"
	desc = "地球上最大的热带沙漠 - 横跨大陆的沙海."
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/amazon
	id = "amazon"
	index = 68
	name = "Amazon Rainforest"
	desc = "地球之肺 - 地球上百分之十物种的家园."
	rarity = STICKER_RARE
	category = STICKER_CAT_NATURAL
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_2"

/datum/sticker/internet
	id = "internet"
	index = 69
	name = "Internet"
	desc = "连接地球上每一个心灵的网 - 有史以来最大的图书馆."
	rarity = STICKER_RARE
	category = STICKER_CAT_TECH
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_3"

/datum/sticker/nuclear_energy
	id = "nuclear_energy"
	index = 70
	name = "Nuclear Energy"
	desc = "分裂原子,释放出以千吨计的能量."
	rarity = STICKER_RARE
	category = STICKER_CAT_TECH
	age = STICKER_AGE_COLDWAR
	icon_state = "collectible_card_3"

// ======================= LEGENDARY =======================

/datum/sticker/great_wall
	id = "great_wall"
	index = 71
	name = "Great Wall of China"
	desc = "绵延数千英里的石墙蜿蜒于群山之上 - 人类双手建造的最长建筑."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/petra
	id = "petra"
	index = 72
	name = "Petra"
	desc = "一座玫瑰红的城市,历史有半个永恒之久,雕刻在沙漠峡谷的活岩之中."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/christ_redeemer
	id = "christ_redeemer"
	index = 73
	name = "Christ the Redeemer"
	desc = "双臂伸展于科尔科瓦多山顶,俯瞰里约热内卢."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_5"

/datum/sticker/machu_picchu
	id = "machu_picchu"
	index = 74
	name = "Machu Picchu"
	desc = "云端中的印加城堡,数百年间与世隔绝."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/chichen_itza
	id = "chichen_itza"
	index = 75
	name = "Chichen Itza"
	desc = "一座金字塔,春分时蛇形光影沿阶梯而降."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/taj_mahal
	id = "taj_mahal"
	index = 76
	name = "Taj Mahal"
	desc = "一位皇帝为其爱妻建造的白色大理石纪念碑."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_5"

/datum/sticker/colosseum
	id = "colosseum"
	index = 77
	name = "Colosseum"
	desc = "容纳五万名狂呼的罗马人和十万加仑鲜血的竞技场."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

/datum/sticker/angkor_wat
	id = "angkor_wat"
	index = 78
	name = "Angkor Wat"
	desc = "有史以来最大的宗教纪念碑 - 从丛林中崛起的寺庙之城."
	rarity = STICKER_LEGENDARY
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_5"

/datum/sticker/pyramid
	id = "pyramid"
	index = 79
	name = "Great Pyramid"
	desc = "古代世界七大奇迹的最后一处 - 也是唯一仍然屹立的."
	rarity = STICKER_RARE
	category = STICKER_CAT_WONDERS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_5"

// == Crops: Common ==

/datum/sticker/wheat
	id = "wheat"
	index = 80
	name = "Wheat"
	desc = "滋养文明的黄金谷物 - 自新月沃地以来的生命之粮."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_4"

/datum/sticker/corn
	id = "corn"
	index = 81
	name = "Corn"
	desc = "玉米 - 美洲的馈赠,养育新旧大陆数十亿人."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_4"

/datum/sticker/cotton
	id = "cotton"
	index = 82
	name = "Cotton"
	desc = "柔软的白色棉铃为世界提供衣装 - 也推动了工业与劳工的革命."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_4"

/datum/sticker/hemp
	id = "hemp"
	index = 83
	name = "Hemp"
	desc = "坚韧的纤维茎秆编织成绳索,船帆和纸张 - 劳动者的植物."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_4"

/datum/sticker/rice
	id = "rice"
	index = 84
	name = "Rice"
	desc = "半个世界的主食谷物 - 稻田延伸至地平线."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_4"

/datum/sticker/tomato
	id = "tomato"
	index = 85
	name = "Tomato"
	desc = "来自新大陆的鲜红果实,征服了旧大陆的每一间厨房."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_4"

/datum/sticker/potato
	id = "potato"
	index = 86
	name = "Potato"
	desc = "一种不起眼的块茎,养活了军队,度过了饥荒,改变了国家的命运."
	rarity = STICKER_COMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_4"

// == Crops: Uncommon ==

/datum/sticker/tobacco
	id = "tobacco"
	index = 87
	name = "Tobacco"
	desc = "一种备受争议的经济作物,塑造了帝国,经济和殖民地的命运."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_4"

/datum/sticker/opium
	id = "opium"
	index = 88
	name = "Opium"
	desc = "一种强效的麻醉树脂,引发了战争,成瘾危机和外交事件."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_4"

/datum/sticker/tea
	id = "tea"
	index = 89
	name = "Tea"
	desc = "浸泡在热水中的叶子 - 皇帝,哲学家和革命者的饮品."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_MEDIEVAL
	icon_state = "collectible_card_4"

/datum/sticker/coffee
	id = "coffee"
	index = 90
	name = "Coffee"
	desc = "深色苦涩的豆子酿成的饮料,推动了启蒙运动和现代世界."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_CROPS
	age = STICKER_AGE_IMPERIAL
	icon_state = "collectible_card_4"

// == Minerals: Common ==

/datum/sticker/rock
	id = "rock"
	index = 91
	name = "Rock"
	desc = "一块普通的石头.无聊,但不可或缺."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_6"

/datum/sticker/iron_ore
	id = "iron_ore"
	index = 92
	name = "Iron Ore"
	desc = "工业的支柱 - 从犁头到刀剑再到摩天大楼."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_6"

/datum/sticker/coal
	id = "coal"
	index = 93
	name = "Coal"
	desc = "推动工业革命,点燃帝国熔炉的黑色岩石."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_INDUSTRIAL
	icon_state = "collectible_card_6"

/datum/sticker/copper_ore
	id = "copper_ore"
	index = 94
	name = "Copper Ore"
	desc = "人类塑造的第一种金属 - 硬币,工具和管道."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_6"

/datum/sticker/tin_ore
	id = "tin_ore"
	index = 95
	name = "Tin Ore"
	desc = "与铜混合制成青铜 - 定义一个时代的合金."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_6"

/datum/sticker/salt
	id = "salt"
	index = 96
	name = "Salt"
	desc = "古代世界的白色黄金 - 保存食物,为每一餐调味."
	rarity = STICKER_COMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_6"

// == Minerals: Uncommon ==

/datum/sticker/silver_ore
	id = "silver_ore"
	index = 97
	name = "Silver Ore"
	desc = "一种闪亮的白色金属 - 国王的货币,神庙的装饰."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_6"

/datum/sticker/gold_ore
	id = "gold_ore"
	index = 98
	name = "Gold Ore"
	desc = "永恒的金属 - 不朽,美丽,无数探索的根源."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_STONE
	icon_state = "collectible_card_6"

/datum/sticker/uranium_ore
	id = "uranium_ore"
	index = 99
	name = "Uranium Ore"
	desc = "一种为反应堆提供动力,也萦绕战场的放射性元素."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_MODERN
	icon_state = "collectible_card_6"

/datum/sticker/lead_ore
	id = "lead_ore"
	index = 100
	name = "Lead Ore"
	desc = "一种沉重,暗淡的金属 - 子弹,管道和抵御辐射的屏障."
	rarity = STICKER_UNCOMMON
	category = STICKER_CAT_MINERALS
	age = STICKER_AGE_CLASSICAL
	icon_state = "collectible_card_6"

GLOBAL_LIST_EMPTY(sticker_registry)

/proc/init_sticker_registry()
	if(length(GLOB.sticker_registry))
		return
	var/list/paths = subtypesof(/datum/sticker)
	for(var/path in paths)
		var/datum/sticker/S = new path()
		if(!S.id)
			qdel(S)
			continue
		if(GLOB.sticker_registry[S.id])
			qdel(S)
			continue
		GLOB.sticker_registry[S.id] = S

/proc/sticker_weight(rarity)
	switch(rarity)
		if(STICKER_COMMON)    return 50
		if(STICKER_UNCOMMON)  return 30
		if(STICKER_RARE)      return 15
		if(STICKER_LEGENDARY) return 5
	return 1

/obj/item/sticker
	name = "贴纸"
	desc = "一张散落的收藏贴纸."
	icon = 'icons/obj/collectibles.dmi'
	icon_state = "collectible_card"
	w_class = ITEM_SIZE_TINY
	var/sticker_id

/obj/item/sticker/New(loc, _sticker_id)
	..(loc)
	if(_sticker_id)
		sticker_id = _sticker_id
	update_appearance()

/obj/item/sticker/proc/get_sticker_datum()
	if(sticker_id)
		return GLOB.sticker_registry[sticker_id]

/obj/item/sticker/proc/update_appearance()
	var/datum/sticker/S = get_sticker_datum()
	if(S)
		name = S.name
		desc = S.desc
		icon = S.icon
		icon_state = S.icon_state
	else
		name = "unknown sticker"
		desc = "This sticker seems blank or corrupted."
		icon = 'icons/obj/collectibles.dmi'
		icon_state = "collectible_card"

/obj/item/sticker/attack_self(mob/user)
	..()
	examine(user)

/obj/item/sticker/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/sticker))
		var/obj/item/sticker/S = W
		var/list/new_ids = list(sticker_id, S.sticker_id)
		new /obj/item/sticker_pile(get_turf(src), new_ids)
		to_chat(user, "<span class='notice'>你将两张贴纸叠成一堆.</span>")
		qdel(W)
		qdel(src)
		return
	if(istype(W, /obj/item/sticker_pile))
		var/obj/item/sticker_pile/P = W
		P.add_sticker(src)
		return
	..()

/obj/item/sticker/examine(mob/user)
	..()
	var/datum/sticker/S = get_sticker_datum()
	if(S)
		to_chat(user, "<span class='notice'>编号: #[S.index]</span>")
		to_chat(user, "<span class='notice'>稀有度: <font color='[S.rarity_color()]'>[S.rarity_name()]</font></span>")
		to_chat(user, "<span class='notice'>类别: [S.category] | 时代: [S.age]</span>")
		user << browse("<!DOCTYPE html><html><head><meta http-equiv='X-UA-Compatible' content='IE=edge'><style>body,html{margin:0;padding:0;width:100%;height:100%;overflow:hidden;}iframe{width:100%;height:100%;border:none;}</style></head><body><iframe src='https://civ13.com/card/[S.index]'></iframe></body></html>", "window=sticker_card;size=400x650")

/obj/item/sticker_pile
	name = "贴纸堆"
	desc = "一堆凌乱的收藏贴纸."
	icon = 'icons/obj/collectibles.dmi'
	icon_state = "collectible_card"
	w_class = ITEM_SIZE_TINY
	var/list/stickers = list()

/obj/item/sticker_pile/New(loc, list/initial_ids)
	..(loc)
	if(initial_ids)
		stickers = initial_ids.Copy()
	update_pile()

/obj/item/sticker_pile/proc/update_pile()
	if(!length(stickers))
		qdel(src)
		return
	if(length(stickers) == 1)
		new /obj/item/sticker(get_turf(src), stickers[1])
		qdel(src)
		return
	name = "pile of [length(stickers)] stickers"
	desc = "A messy stack of [length(stickers)] collectible stickers. Use it to pull one out."

/obj/item/sticker_pile/proc/add_sticker(obj/item/sticker/S)
	if(!istype(S) || !S.sticker_id) return
	stickers += S.sticker_id
	update_pile()
	qdel(S)

/obj/item/sticker_pile/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/sticker))
		to_chat(user, "<span class='notice'>你将\the [W]加入堆中.</span>")
		add_sticker(W)
		return
	..()

/obj/item/sticker_pile/attack_self(mob/user)
	remove_sticker_prompt(user)

/obj/item/sticker_pile/attack_hand(mob/user)
	if(user.get_active_hand() == src)
		return remove_sticker_prompt(user)
	return ..()

/obj/item/sticker_pile/proc/remove_sticker_prompt(mob/user)
	if(!length(stickers)) return
	
	var/list/options = list()
	var/list/option_to_index = list()
	
	for(var/i = 1 to length(stickers))
		var/id = stickers[i]
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(S)
			var/display = "[S.name] (#[S.index])"
			if(display in option_to_index)
				display += " - copy [i]"
			options += display
			option_to_index[display] = i

	var/choice = WWinput(user, "Which sticker do you want to remove from the pile?", "Sticker Pile", options[1], options)
	if(choice && (choice in option_to_index))
		var/target_index = option_to_index[choice]
		var/target_id = stickers[target_index]
		stickers.Cut(target_index, target_index + 1)
		var/obj/item/sticker/S = new /obj/item/sticker(get_turf(user), target_id)
		user.put_in_hands(S)
		to_chat(user, "<span class='notice'>你从堆中取出[choice].</span>")
		update_pile()

/obj/item/sticker_pack
	name = "文明卡牌贴纸包"
	desc = "一个闪亮的箔纸包,内含随机贴纸.与你的朋友交换吧!"
	icon = 'icons/obj/collectibles.dmi'
	icon_state = "cardpack_civ"
	w_class = ITEM_SIZE_TINY
	var/pack_size = 5

/obj/item/sticker_pack/attack_self(mob/user)
	if(!length(GLOB.sticker_registry))
		to_chat(user, "<span class='warning'>贴纸注册表为空!出问题了.</span>")
		return
	user.visible_message("<span class='notice'>[user]撕开了\the [src]!</span>")
	playsound(user, 'sound/effects/rip_pack.ogg', 100, TRUE)

	var/list/weighted = list()
	for(var/id in GLOB.sticker_registry)
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(!S)
			continue
		weighted[id] = sticker_weight(S.rarity)

	var/list/picked_ids = list()
	for(var/i = 1 to pack_size)
		if(!length(weighted))
			break
		var/picked = pickweight(weighted)
		if(picked)
			picked_ids += picked

	if(length(picked_ids))
		var/obj/item/sticker_pile/P = new /obj/item/sticker_pile(get_turf(user), picked_ids)
		user.put_in_hands(P)

	user.drop_from_inventory(src)
	qdel(src)

/obj/item/sticker/attack(mob/M, mob/user)
	if(user == M)
		var/datum/sticker/S = get_sticker_datum()
		if(S)
			to_chat(user, "<span class='notice'>你看着[S.name].[S.desc]</span>")
		return
	if(ismob(M) && M.ckey && user.ckey != M.ckey)
		user.visible_message("<span class='notice'>[user]将\the [src]提供给[M].</span>")
		var/response = alert(M, "[user] wants to give you \a [name]. Accept?", "Sticker Trade", "Accept", "Decline")
		if(response == "Accept" && isturf(user.loc) && isturf(M.loc) && get_dist(user, M) <= 1)
			if(!istype(src) || qdeleted(src) || src.loc != user)
				return
			user.visible_message("<span class='notice'>[user]将\the [src]递给[M].</span>")
			user.drop_from_inventory(src)
			forceMove(get_turf(M))
			M.put_in_active_hand(src)
			return
		else
			to_chat(user, "<span class='notice'>[M]拒绝了这张贴纸.</span>")
			return
	..()

/obj/item/sticker_pack/special
	name = "文明卡牌高级贴纸包"
	desc = "一个闪耀的金箔包,保证内含稀有贴纸.两张普通,两张罕见,以及一张高级抽取!"
	icon_state = "cardpack_civ_special"

/obj/item/sticker_pack/special/attack_self(mob/user)
	if(!length(GLOB.sticker_registry))
		to_chat(user, "<span class='warning'>贴纸注册表为空!出问题了.</span>")
		return
	user.visible_message("<span class='notice'>[user]小心地打开了\the [src]!</span>")
	playsound(user, 'sound/effects/rip_pack.ogg', 100, TRUE)

	var/list/common_pool = list()
	var/list/uncommon_pool = list()
	var/list/rare_pool = list()
	var/list/legendary_pool = list()

	for(var/id in GLOB.sticker_registry)
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(!S)
			continue
		switch(S.rarity)
			if(STICKER_COMMON)    common_pool += id
			if(STICKER_UNCOMMON)  uncommon_pool += id
			if(STICKER_RARE)      rare_pool += id
			if(STICKER_LEGENDARY) legendary_pool += id

	var/list/picked_ids = list()
	// 2 commons
	for(var/i in 1 to 2)
		if(length(common_pool))
			picked_ids += pick(common_pool)
	// 2 uncommons
	for(var/i in 1 to 2)
		if(length(uncommon_pool))
			picked_ids += pick(uncommon_pool)
	// 1 premium: 70% rare, 30% legendary
	if(length(legendary_pool) && prob(30))
		picked_ids += pick(legendary_pool)
	else if(length(rare_pool))
		picked_ids += pick(rare_pool)
	else if(length(legendary_pool))
		picked_ids += pick(legendary_pool)

	if(length(picked_ids))
		var/obj/item/sticker_pile/P = new /obj/item/sticker_pile(get_turf(user), picked_ids)
		user.put_in_hands(P)

	user.drop_from_inventory(src)
	qdel(src)

/obj/effect/spawner/sticker_single
	name = "sticker spawner"
	icon = 'icons/obj/collectibles.dmi'
	icon_state = "cardpack_civ"

/obj/effect/spawner/sticker_single/New()
	..()
	if(!length(GLOB.sticker_registry))
		qdel(src)
		return
	var/list/pool = build_pool()
	if(length(pool))
		new /obj/item/sticker(get_turf(src), pick(pool))
	qdel(src)

/obj/effect/spawner/sticker_single/proc/build_pool()
	var/list/pool = list()
	for(var/id in GLOB.sticker_registry)
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(!S)
			continue
		var/w = sticker_weight(S.rarity)
		for(var/i in 1 to w)
			pool += id
	return pool

/obj/effect/spawner/sticker_single/common
	name = "common sticker spawner"

/obj/effect/spawner/sticker_single/common/build_pool()
	var/list/pool = list()
	for(var/id in GLOB.sticker_registry)
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(!S)
			continue
		if(S.rarity == STICKER_COMMON)
			pool += id
	return pool

/obj/effect/spawner/sticker_single/rare
	name = "rare+ sticker spawner"

/obj/effect/spawner/sticker_single/rare/build_pool()
	var/list/pool = list()
	for(var/id in GLOB.sticker_registry)
		var/datum/sticker/S = GLOB.sticker_registry[id]
		if(!S)
			continue
		if(S.rarity == STICKER_RARE || S.rarity == STICKER_LEGENDARY)
			pool += id
	return pool
