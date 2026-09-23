/obj/item/weapon/material/sword
	name = "双刃大剑"
	desc = "你还站在这盯着它看什么?快去杀敌!"
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	sharp = TRUE
	edge = TRUE
	var/atk_mode = SLASH
	block_chance = 35
	attack_verb = list("slashed", "diced")
	hitsound = "slash_sound"
	drawsound = 'sound/items/unholster_sword01.ogg'
	sharpness = 25
	var/stat = "swords"
	cooldownw = DEFAULT_ATTACK_COOLDOWN //how long till you can attack again


/obj/item/weapon/material/sword/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	//Ok this if looks like a bit of a mess, and it is. Basically you need to have the sword in your active hand, and pass the default parry check
	//and also pass the prob which is your melee skill * the swords block chance. Complicated, I know, but hopefully it'll balance out.
	var/mob/living/human/H_user = user
	var/isdefend = 1 //the defend tactic modifier
	var/modif = 1
	if (H_user.religion_check() == "Combat")
		modif = 1.1
	if (user.tactic == "defend")
		isdefend = 1.2
	if(default_parry_check(user, attacker, damage_source) && prob(isdefend*(min(block_chance * (H_user.getStatCoeff("swords")*modif),92))) && (user.get_active_hand() == src))//You gotta be holding onto that sheesh bro.
		user.visible_message("<font color='#E55300'><big>\The [user]用\the [src]招架了[attack_text]的攻击!</big></font>")
		var/mob/living/human/H = user
		H.adaptStat("swords", 1*modif)
		playsound(user.loc, pick('sound/weapons/blade_parry1.ogg', 'sound/weapons/blade_parry2.ogg', 'sound/weapons/blade_parry3.ogg'), 50, 1)
		if (istype(damage_source, /obj/item/weapon/sledgehammer))
			health -= 10
			if(prob(35))
				user.visible_message("<font color='#E55300'><big>\The [src]从\the [user]手中飞了出去!</big></font>")
				user.drop_from_inventory(src)
				throw_at(get_edge_target_turf(src, pick(alldirs)), rand(1,3), throw_speed)//Throw that sheesh away

		else if (istype(damage_source, /obj/item/weapon/melee) || istype(damage_source, /obj/item/weapon/material/hatchet))
			health -= 5
			if(prob(15))
				user.visible_message("<font color='#E55300'><big>\The [src]从\the [user]手中飞了出去!</big></font>")
				user.drop_from_inventory(src)
				throw_at(get_edge_target_turf(src, pick(alldirs)), rand(1,3), throw_speed)//Throw that sheesh away
		else
			health-= 0.5
			if(prob(10))
				user.visible_message("<font color='#E55300'><big>\The [src]从\the [user]手中飞了出去!</big></font>")
				user.drop_from_inventory(src)
				throw_at(get_edge_target_turf(src, pick(alldirs)), rand(1,3), throw_speed)//Throw that sheesh away
		return 1
	return 0

/obj/item/weapon/material/sword/attack_self(mob/user)
	..()
	if(atk_mode == SLASH)
		atk_mode = STAB
		to_chat(user, "<span class='notice'>你现在将进行刺击.</span>")
		edge = FALSE
		sharp = TRUE
		attack_verb = list("stabbed")
		hitsound = "stab_sound"

	else if(atk_mode == STAB)
		atk_mode = BASH
		to_chat(user, "<span class='notice'>你现在将进行钝击.</span>")
		edge = FALSE
		sharp = FALSE
		attack_verb = list("bashed", "smacked")
		hitsound = "swing_hit"

	else if(atk_mode == BASH)
		atk_mode = SLASH
		to_chat(user, "<span class='notice'>你现在将进行斩击.</span>")
		edge = TRUE
		sharp = TRUE
		attack_verb = list("slashed", "diced")
		hitsound = "slash_sound"

/obj/item/weapon/material/sword/training
	name = "训练剑"
	desc = "一把用于非致命练习的木剑."
	icon_state = "wood_sword"
	item_state = "wood_sword"
	block_chance = 50
	force_divisor = 0.1
	thrown_force_divisor = 0.1
	force = 1
	slot_flags = SLOT_BELT | SLOT_BACK
	value = 0
	cooldownw = 8
	sharpness = 0
	flammable = TRUE
	attack_verb = list("thwacked", "hit", "clonked", "batted", "tapped", "smacked", "poked", "slapped")
	hitsound = 'sound/weapons/kick.ogg'
	drawsound = 'sound/items/unholster_sword01.ogg'
	sharp = FALSE
	edge = FALSE
	default_material = "wood"

/obj/item/weapon/material/sword/training/bamboo
	name = "木刀"
	desc = "一把用于非致命练习的竹剑."
	icon_state = "bokken_sword"
	item_state = "bokken_sword"
	default_material = "bamboo"

/obj/item/weapon/material/sword/training/attack_self(mob/user)
	..()
	edge = FALSE
	sharp = FALSE

/obj/item/weapon/material/sword/katana
	name = "武士刀"
	desc = "日本人使用了数个世纪的剑.用于切割和斩击,而非劈砍或锯切."
	icon_state = "katana"
	item_state = "katana"
	block_chance = 27
	force_divisor = 0.8 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	value = 60
	cooldownw = 7

obj/item/weapon/material/sword/wakazashi
	name = "wakazashi"
	desc = "A sword used by the japanese for centuries. Made to slice and slash, not chop or saw. Often paired with a katana."
	icon_state = "wakazashi"
	item_state = "wakazashi"
	block_chance = 19
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT
	value = 60
	cooldownw = 6

obj/item/weapon/material/sword/wakazashi/yakuza
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/weapon/material/sword/katana/iron
	default_material = "iron"

/obj/item/weapon/material/sword/smallsword
	name = "小型剑"
	desc = "一种常见的欧洲剑,长约一米."
	icon_state = "smallsword"
	item_state = "smallsword"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.6 // 36 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 25
	cooldownw = 6
	value = 35

obj/item/weapon/material/sword/smallsword/iron
	default_material = "iron"

obj/item/weapon/material/sword/smallsword/copper
	default_material = "copper"

obj/item/weapon/material/sword/smallsword/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/spadroon
	name = "军刀"
	desc = "一种直刃的中型剑.在军队中很常见."
	icon_state = "spadroon"
	item_state = "longsword2"
	throw_speed = 3
	throw_range = 3
	force_divisor = 0.8 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 40
	cooldownw = 9
	value = 50

obj/item/weapon/material/sword/spadroon/iron
	default_material = "iron"

obj/item/weapon/material/sword/spadroon/copper
	default_material = "copper"

obj/item/weapon/material/sword/spadroon/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/armingsword
	name = "武装剑"
	desc = "一种非常常见的中世纪中型剑."
	icon_state = "armingsword"
	item_state = "longsword2"
	throw_speed = 3
	throw_range = 3
	force_divisor = 0.9 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 37
	cooldownw = 11
	value = 50

obj/item/weapon/material/sword/armingsword/iron
	default_material = "iron"

obj/item/weapon/material/sword/armingsword/copper
	default_material = "copper"

obj/item/weapon/material/sword/armingsword/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/vikingsword
	name = "加洛林剑"
	desc = "一种圆头的中型剑,维京人使用."
	icon_state = "viking_sword"
	item_state = "longsword2"
	throw_speed = 3
	throw_range = 2
	force_divisor = 0.10 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 38
	cooldownw = 11
	value = 60

obj/item/weapon/material/sword/vikingsword/iron
	default_material = "iron"

obj/item/weapon/material/sword/vikingsword/copper
	default_material = "copper"

obj/item/weapon/material/sword/vikingsword/bronze
	default_material = "bronze"


/obj/item/weapon/material/sword/mersksword
	name = "梅尔斯克剑"
	desc = "一种非常常见的中世纪中型剑."
	icon_state = "mersksword"
	item_state = "longsword2"
	throw_speed = 3
	throw_range = 3
	force_divisor = 0.11 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 40
	cooldownw = 13
	value = 50

/obj/item/weapon/material/sword/vangar
	name = "范加之剑"
	desc = "一把特制的定制剑,剑柄上刻有'范加'."
	icon_state = "vangar"
	item_state = "longsword2"
	throw_speed = 4
	throw_range = 4
	force_divisor = 0.75 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 35
	cooldownw = 7

/obj/item/weapon/material/sword/bolo
	name = "博洛刀"
	desc = "一种非常常见的菲律宾砍刀式剑."
	icon_state = "bolo"
	item_state = "bolo"
	throw_speed = 3
	throw_range = 6
	force_divisor = 0.9 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 37
	cooldownw = 9
	value = 30
	chopping_speed = 1.9

/obj/item/weapon/material/sword/bolo/iron
	default_material = "iron"
	value = 25

/obj/item/weapon/material/sword/kukri
	name = "弯刀"
	desc = "一种形状非常独特的砍刀,起源于内陆,用于劈开茂密的灌木丛."
	icon_state = "kukri"
	item_state = "kukri"
	throw_speed = 3
	throw_range = 6
	force_divisor = 0.9 // 48 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 37
	cooldownw = 9
	value = 30
	chopping_speed = 1.9

/obj/item/weapon/material/sword/kukri/iron
	default_material = "iron"
	value = 25

/obj/item/weapon/material/sword/cutlass
	name = "短弯刀"
	desc = "一种中型弯剑,海盗偏爱使用."
	icon_state = "cutlass"
	item_state = "cutlass"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 28
	cooldownw = 8
	value = 40

obj/item/weapon/material/sword/cutlass/iron
	default_material = "iron"

/obj/item/weapon/material/sword/scimitar
	name = "弯刀"
	desc = "一种中型弯剑,阿拉伯人偏爱使用."
	icon_state = "scimitar"
	item_state = "sabre"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 30
	cooldownw = 8
	value = 45

obj/item/weapon/material/sword/scimitar/iron
	default_material = "iron"

/obj/item/weapon/material/sword/longquan
	name = "龙泉剑"
	desc = "一种中型东方剑;中国武士和士兵偏爱使用."
	icon_state = "longquan"
	item_state = "longquan"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 30
	cooldownw = 8
	value = 45

/obj/item/weapon/material/sword/longquan/iron
	default_material = "iron"
	value = 40

/obj/item/weapon/material/sword/plasmaquan
	name = "等离子龙泉剑"
	desc = "一种基于龙泉剑的剑."
	icon_state = "plasmaquan"
	item_state = "plasmaquan"
	throw_speed = 2
	throw_range = 4
	force_divisor = 1.2 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BACK
	block_chance = 40
	cooldownw = 7
	value = 100

/obj/item/weapon/material/sword/longquan/iron
	default_material = "iron"
	value = 40

/obj/item/weapon/material/sword/saif
	name = "赛义夫剑"
	desc = "一种中型剑,源自阿拉伯半岛."
	icon_state = "umar_sword"
	item_state = "umar_sword"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.8 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 34
	cooldownw = 9
	value = 60

obj/item/weapon/material/sword/saif/iron
	default_material = "iron"

/obj/item/weapon/material/sword/sabre
	name = "军刀"
	desc = "一种小型、略微弯曲的剑,骑兵和轻步兵部队偏爱使用."
	icon_state = "sabre"
	item_state = "sabre"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.75 // 45 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 32
	cooldownw = 9
	value = 50

obj/item/weapon/material/sword/sabre/iron
	default_material = "iron"

/obj/item/weapon/material/sword/longsword
	name = "长剑"
	desc = "一种长刃剑.中世纪时代常用."
	icon_state = "longsword"
	item_state = "longsword"
	throw_speed = 2
	throw_range = 2
	force_divisor = 1 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 47
	cooldownw = 15
	value = 60

obj/item/weapon/material/sword/longsword/iron
	default_material = "iron"

obj/item/weapon/material/sword/longsword/bronze
	default_material = "bronze"

obj/item/weapon/material/sword/longsword/diamond
	default_material = "diamond"

/obj/item/weapon/material/sword/zweihander
	name = "双手大剑"
	desc = "一种骑士使用的德国剑."
	icon_state = "zweihander"
	item_state = "longsword"
	throw_speed = 1
	throw_range = 2
	force_divisor = 1.90 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 60
	cooldownw = 30
	value = 60

/obj/item/weapon/material/sword/claymore
	name = "双刃大剑"
	desc = "一种苏格兰长剑."
	icon_state = "claymore"
	item_state = "longsword"
	throw_speed = 1
	throw_range = 2
	force_divisor = 1.80 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 65
	cooldownw = 20
	value = 60

obj/item/weapon/material/sword/claymore/iron
	default_material = "iron"


/obj/item/weapon/material/sword/rapier
	name = "刺剑"
	desc = "一种轻型剑,剑刃细而直.军官和贵族常用."
	icon_state = "rapier"
	item_state = "rapier"
	throw_speed = 4
	throw_range = 4
	force_divisor = 0.65 // 40 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 30
	cooldownw = 5
	value = 60

obj/item/weapon/material/sword/rapier/iron
	default_material = "iron"

/obj/item/weapon/material/sword/broadsword
	name = "阔剑"
	desc = "一种长而厚重的剑.中世纪时代常用."
	icon_state = "broadsword"
	item_state = "longsword"
	throw_speed = 2
	throw_range = 2
	force_divisor = 2.2 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 20
	cooldownw = 15
	value = 60

/* Ancient Multi Material Swords */
// Created as per template then subtypes for spawning into TDM & admin debug access.

/obj/item/weapon/material/sword/gladius
	name = "罗马短剑"
	desc = "一种相对较小的剑,罗马士兵使用."
	icon_state = "gladius"
	item_state = "gladius"
	throw_speed = 2
	throw_range = 6
	force_divisor = 0.6 // 36 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 25
	cooldownw = 6
	value = 35

/obj/item/weapon/material/sword/gladius/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/gladius/iron
	default_material = "iron"

/obj/item/weapon/material/sword/gaelic
	name = "盖尔短剑"
	desc = "一种相对较小的剑,带有夸张的剑柄,盖尔战士使用."
	icon_state = "gaelic_short"
	item_state = "gaelic_short"
	throw_speed = 2
	throw_range = 6
	force_divisor = 0.6 // 36 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 25
	cooldownw = 6
	value = 35

/obj/item/weapon/material/sword/gaelic/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/gaelic/iron
	default_material = "iron"

/obj/item/weapon/material/sword/khopesh //template for multi-material crafting
	name = "镰形剑"
	desc = "一种弯剑,埃及王朝的士兵和沙漠战士使用."
	icon_state = "khopesh"
	item_state = "khopesh"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.75 // 36 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 28
	cooldownw = 7
	value = 40

/obj/item/weapon/material/sword/khopesh/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/khopesh/iron
	default_material = "iron"

/obj/item/weapon/material/sword/xiphos //template for multi-material crafting
	name = "希腊短剑"
	desc = "一种小型剑,希腊士兵使用."
	icon_state = "xiphos"
	item_state = "gladius"
	throw_speed = 2
	throw_range = 4
	force_divisor = 0.75 // 36 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.7 // 10 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 28
	cooldownw = 7
	value = 40

/obj/item/weapon/material/sword/xiphos/bronze
	default_material = "bronze"

/obj/item/weapon/material/sword/xiphos/iron
	default_material = "iron"

//////////////////////////////////SKYRIM////////////////////////////////////////
/obj/item/weapon/material/sword/tes13/twohanded
	name = "双手钢剑"
	desc = "一种长刃长柄的剑,设计为双手使用."
	icon_state = "twohanded"
	item_state = "twohanded"
	throw_speed = 2
	throw_range = 2
	force_divisor = 1.1 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 50
	cooldownw = 15
	value = 60

/obj/item/weapon/material/sword/tes13/steel
	name = "帝国钢剑"
	desc = "一种钢刃剑,帝国常用."
	icon_state = "imperial"
	item_state = "longsword"
	throw_speed = 2
	throw_range = 2
	force_divisor = 0.80 //
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 20
	cooldownw = 8
	value = 60

/obj/item/weapon/material/sword/tes13/steel/balgruuf
	name = "巴尔古夫的帝国钢剑"
	desc = "一种钢刃剑,帝国常用.这一把是专为巴尔古夫锻造的."
	icon_state = "imperial"
	item_state = "longsword"
	throw_speed = 2
	throw_range = 2
	force_divisor = 1 //
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	force = 100
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 20
	cooldownw = 8
	value = 500

//////////////////////////////////GAME OF THRONES////////////////////////////////////////
/obj/item/weapon/material/sword/longclaw
	name = "长爪"
	desc = "长爪是来自莫尔蒙家族的祖传瓦雷利亚钢制杂种剑."
	icon_state = "longclaw"
	item_state = "longsword"
	throw_speed = 2
	throw_range = 2
	force_divisor = 1 // 60 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.6 // 12 when thrown with weight 20 (steel)
	slot_flags = SLOT_BELT | SLOT_BACK
	block_chance = 50
	cooldownw = 11
	value = 400
