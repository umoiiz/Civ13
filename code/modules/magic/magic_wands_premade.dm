
// ============================================================
//  PRE-MADE WAND VARIANTS
//  Ready-to-spawn named wand combinations. Add to loot tables,
//  shop inventories, or wizard spawns as desired.
// ============================================================

// Intermediate type to prevent component-based name/desc overrides for presets
/obj/item/weapon/material/magic/wand/crafted/premade
	parent_type = /obj/item/weapon/material/magic/wand/crafted
	update_name_and_desc()
		return

// ----- The Regulation Wand -----
// Pine + no core + Standard length: solid all-rounder with panic escape
/obj/item/weapon/material/magic/wand/crafted/standard
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "标准巫师魔杖"
	desc = "学校统一发放的标准魔杖.闻起来有松脂和地板蜡的味道.可靠,但缺乏灵感."
	icon_state  = "wand_pinewood_long"
	wand_wood   = WAND_WOOD_PINE
	wand_core   = WAND_CORE_NONE
	wand_length = WAND_LENGTH_STANDARD

// ----- The Sniper -----
// Fibreglass + Copper Wire + Overcompensator: blazing fast, long-range, cheap - but violent on overcast
/obj/item/weapon/material/magic/wand/crafted/sniper
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "狙击手"
	desc = "一根长得离谱的亮绿色玻璃纤维杆,缠绕着偷来的铜线.它就像一把魔法狙击步枪,但一步走错你就会把自己电死."
	icon_state  = "wand_fibreglass_longest"
	wand_wood   = WAND_WOOD_FIBREGLASS
	wand_core   = WAND_CORE_COPPER
	wand_length = WAND_LENGTH_OVERCOMP

// ----- The Mugger -----
// Snooker Cue + Badger Hair + Stubby: fast-draw, awful cast speed, exceptional bludgeoning
/obj/item/weapon/material/magic/wand/crafted/mugger
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "劫匪"
	desc = "一截锯短的酒吧斯诺克球杆,塞满了愤怒的獾毛.施法需要很久,但它能塞进你的靴子里,非常适合砸碎别人的脑袋."
	icon_state  = "wand_snooker_short"
	wand_wood   = WAND_WOOD_SNOOKER
	wand_core   = WAND_CORE_BADGER
	wand_length = WAND_LENGTH_STUBBY

// ----- The Ghost -----
// Balsa + Fox Fur + Stubby: pocket-sized, invisible lightning casts - but snaps if you sneeze on it
/obj/item/weapon/material/magic/wand/crafted/ghost
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "幽灵"
	desc = "一根可怕地脆弱的轻木碎片,包裹着臭烘烘的狐狸毛.它能施放完全隐形的法术,前提是它不会先在你手里折断."
	icon_state  = "wand_balsa_short"
	wand_wood   = WAND_WOOD_BALSA
	wand_core   = WAND_CORE_FOX
	wand_length = WAND_LENGTH_STUBBY

// ----- The Gambler -----
// MDF + Pocket Lint + Telescopic: chaotic, cheap, and likely to kill you in the rain
/obj/item/weapon/material/magic/wand/crafted/gambler
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "赌徒"
	desc = "一根改装过的电视天线,粘在廉价的中密度纤维板手柄上,由棉絮驱动.你完全不知道一个法术会付出什么代价,而且如果下雨,它就会变成湿透的、没用的纸板."
	icon_state  = "wand_mdf_long"
	wand_wood   = WAND_WOOD_MDF
	wand_core   = WAND_CORE_LINT
	wand_length = WAND_LENGTH_TELESCOPIC

// ----- The Swamp Thing -----
// Driftwood + Asbestos Fibre + Overcompensator: long-range elemental supremacy at personal cost
/obj/item/weapon/material/magic/wand/crafted/swamp_thing
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "沼泽怪"
	desc = "一根巨大的、腐烂的浮木树枝,塞满了高度非法的石棉.它闻起来像死鱼,但它能让你从一英里外投掷巨大的火球...同时慢慢毒害你."
	icon_state  = "wand_driftwood_longest"
	wand_wood   = WAND_WOOD_DRIFTWOOD
	wand_core   = WAND_CORE_ASBESTOS
	wand_length = WAND_LENGTH_OVERCOMP

// ----- The Chaos Stick -----
// MDF + Asbestos Fibre + Stubby: fire-immune, toxin-dripping, swells in rain - pocket chaos
/obj/item/weapon/material/magic/wand/crafted/chaos_stick
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "混沌棍"
	desc = "一块粗短的廉价纤维板,塞满了有毒的绝缘材料.它能塞进你的口袋,让你完全防火,但它本身就是一个局部健康危害."
	icon_state  = "wand_mdf_short"
	wand_wood   = WAND_WOOD_MDF
	wand_core   = WAND_CORE_ASBESTOS
	wand_length = WAND_LENGTH_STUBBY

// ----- The Coward's Out -----
// Fibreglass + Pigeon Feather + Standard: fastest movement spells in the game, at the cost of pain
/obj/item/weapon/material/magic/wand/crafted/cowards_out
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "懦夫的退路"
	desc = "一根柔韧的玻璃纤维杆,由一根紧张的鸽子羽毛驱动.非常适合惊慌失措地传送逃离麻烦,尽管阴天的反冲可能会把你的手臂划开."
	icon_state  = "wand_fibreglass_long"
	wand_wood   = WAND_WOOD_FIBREGLASS
	wand_core   = WAND_CORE_PIGEON
	wand_length = WAND_LENGTH_STANDARD

// ----- Headmaster Tumbledoor's Wand -----
// The legendary bootleg Elder Wand.
/obj/item/weapon/material/magic/wand/crafted/elderly_wand
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "长者魔杖"
	desc = "一根极其古老、多节的拐杖.传说邓布利少在一场高赌注的钓鱼游戏中从死神手里赢来的."
	icon_state = "elderly_wand"
	wand_wood   = WAND_WOOD_DRIFTWOOD      // Ancient and slightly damp
	wand_core   = WAND_CORE_BADGER      // Extremely powerful combat casts
	wand_length = WAND_LENGTH_OVERCOMP  // Huge range

// ----- Lord Moldywart's Wand -----
// The villain's weapon. Toxic, fast, and silent.
/obj/item/weapon/material/magic/wand/crafted/the_pale_stick
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "苍白之杖"
	desc = "一根雕刻自尖啸灌木木料的、 chillingly 光滑的魔杖.它嗡鸣着黑魔法,闻起来有淡淡的发胶味."
	icon_state = "moldy_wand"
	wand_wood   = WAND_WOOD_SHRUB  // Lethally fast cast speed
	wand_core   = WAND_CORE_FOX         // Completely silent/invisible casts (terrifying for Deadum!)
	wand_length = WAND_LENGTH_STANDARD

// ----- The Moldy Men Standard Issue -----
// Pine + Pigeon Feather + Standard: Unreliable, panic-prone, splinters easily.
/obj/item/weapon/material/magic/wand/crafted/henchman_twig
	parent_type = /obj/item/weapon/material/magic/wand/crafted/premade
	name = "喽啰的树枝"
	desc = "一根批量生产、打磨粗糙的松木棍,发放给所有霉男.鸽子羽毛核心使其在使用者害怕时极易走火."
	icon_state = "wand4"
	wand_wood   = WAND_WOOD_PINE
	wand_core   = WAND_CORE_PIGEON
	wand_length = WAND_LENGTH_STANDARD
