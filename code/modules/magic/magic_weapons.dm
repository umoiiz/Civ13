//Staves and Special Weapons
/obj/item/weapon/material/sword/magic
	name = "假想魔法剑"
	desc = "这是代码的占位符,不要将其用作物品."
	icon = 'icons/obj/magic_weapons.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_magic.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_magic.dmi',
		)
	icon_state = "energy_blade"
	item_state = "energy_blade"
	var/base_icon = "energy_blade"
	force_divisor = 0.7 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	drawsound = 'sound/items/unholster_sword01.ogg'
	sharpness = 50
	default_material = "diamond"
	applies_material_colour = FALSE
	cooldownw = DEFAULT_ATTACK_COOLDOWN //how long till you can attack again
	//ability vars
	var/weakens = 0
	var/flames = 0
	var/ices = 0
	var/toxics = 0
	var/leechs = 0
	var/shocks = 0
	//other
	var/reagent1 = ""
	var/reagent2 = ""
	//potentialdamagevars
	var/weakenpower = 0
	var/flamepower = 0
	var/icepower = 0
	var/leechpower = 0
	var/shockpower = 0
	//cooloff
	var/reagent1amount = 0
	var/reagent2amount = 0
	var/cooloff = 0
	unbreakable = TRUE


/obj/item/weapon/material/sword/magic/attack(mob/living/human/M as mob, mob/living/user as mob)
	..()
	if (!M)
		return
	if(prob(weakens))
		M.Weaken(weakenpower)
	if(prob(flames))
		if (world.time > cooloff)
			//M.adjustBurnLoss(rand(2,10))
			if (prob(flamepower))
				M.fire_stacks += 1
			M.IgniteMob()
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 75, TRUE)
			cooloff = world.time+flamepower
	if(prob(ices))
		M.adjustBurnLoss(icepower)
		playsound(loc, 'sound/effects/bubbles.ogg', 75, TRUE)
		M.bodytemperature -= (icepower)
	if(prob(toxics))
		M.reagents.add_reagent(reagent1, reagent1amount)
		M.reagents.add_reagent(reagent2, reagent2amount)
		playsound(loc, 'sound/effects/Splash_Small_01_mono.ogg', 75, TRUE)
	if(prob(leechs))
		var/leech_amt = rand(1, leechpower)
		user.adjustBruteLoss(-leech_amt)
		user.updatehealth()
		M.adjustBruteLoss(leech_amt)
		M.updatehealth()
		playsound(loc, 'sound/effects/refill.ogg', 75, TRUE)
	if(prob(shocks))
		M.electrocute_act(shockpower, src, 1.0)
		if(prob(25))
			playsound(loc, 'sound/effects/sparks1.ogg', 75, TRUE)
		else if(prob(25))
			playsound(loc, 'sound/effects/sparks2.ogg', 75, TRUE)
		else if(prob(25))
			playsound(loc, 'sound/effects/sparks3.ogg', 75, TRUE)
		else
			playsound(loc, 'sound/effects/sparks4.ogg', 75, TRUE)
//Swords

/obj/item/weapon/material/sword/magic/New(var/newloc, var/material_key)
	material = null
	..()
	material = null

/obj/item/weapon/material/sword/magic/arkofdisease
	name = "疾病方舟"
	icon_state = "ark_of_disease"
	item_state = "ark_of_disease"
	base_icon = "ark_of_disease"
	desc = "它不祥地脉动着,光是看着它就让你感到恶心."
	force_divisor = 1.5 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.45 // 10 when thrown with weight 20 (steel)
	sharpness = 25
	block_chance = 35
	toxics = 100
	reagent1 = "lexorin"
	reagent2 = "plague"
	reagent1amount = 25
	reagent2amount = 5

/obj/item/weapon/material/sword/magic/arkofdisease/lesser
	name = "感染曲线"
	toxics = 40
	reagent1 = "cryptobiolin"
	reagent2 = "typhus"
	reagent1amount = 15
	reagent2amount = 5
	default_material = "iron"
	material = "iron"
	applies_material_colour = TRUE



/obj/item/weapon/material/sword/magic/crimsonedge
	name = "猩红之刃"
	icon_state = "crimson_edge"
	item_state = "crimson_edge"
	base_icon = "crimson_edge"
	desc = "它看起来像是在流血.."
	force_divisor = 1.5
	thrown_force_divisor = 0.60 // 10 when thrown with weight 20 (steel)
	sharpness = 35
	block_chance = 38
	leechs = 100
	leechpower = 100

/obj/item/weapon/material/sword/magic/crimsonedge/lesser
	name = "红色剃刀"
	leechs = 40
	leechpower = 15
	default_material = "iron"
	applies_material_colour = TRUE

/obj/item/weapon/material/sword/magic/swordsmansflame
	name = "剑士之焰"
	icon_state = "swordsmans_flame"
	item_state = "cultblade"
	base_icon = "cultblade"
	desc = "剑刃摸起来冰凉,但看起来像是烧红了."
	force_divisor = 1.5 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.60 // 10 when thrown with weight 20 (steel)
	sharpness = 40
	block_chance = 40
	flames = 100
	flamepower = 100
	light_color = "#da0205"
	light_range = 2


/obj/item/weapon/material/sword/magic/swordsmansflame/lesser
	name = "士兵之烬"
	default_material = "iron"
	flames = 40
	flamepower = 15
	applies_material_colour = TRUE

/obj/item/weapon/material/sword/magic/ice
	name = "强效冰柱"
	icon_state = "sord"
	item_state = "sord"
	base_icon = "sord"
	desc = "当它靠近剑刃时,你的呼吸会起雾."
	force_divisor = 1.5 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.60 // 10 when thrown with weight 20 (steel)
	sharpness = 40
	block_chance = 40
	ices = 100
	icepower = 60

/obj/item/weapon/material/sword/magic/ice/lesser
	name = "弱效冰柱"
	default_material = "iron"
	ices = 40
	icepower = 15
	applies_material_colour = TRUE

/obj/item/weapon/material/sword/magic/elec
	name = "片状闪电"
	icon_state = "elec"
	item_state = "elec"
	base_icon = "elec"
	desc = "握着这把剑刃让你的汗毛竖起."
	force_divisor = 1.5 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.60 // 10 when thrown with weight 20 (steel)
	sharpness = 40
	block_chance = 40
	shocks = 100
	shockpower = 150

/obj/item/weapon/material/sword/magic/elec/lesser
	name = "火花之刃"
	default_material = "iron"
	shocks = 45
	shockpower = 15
	applies_material_colour = TRUE

//blunt//
/obj/item/weapon/material/sword/magic/mjolnir
	name = "雷神之锤"
	default_material = "steel"
	icon_state = "mjolnir"
	item_state = "hammer"
	base_icon = "mjolnir"
	desc = "唯有配得上者方可持有."
	slot_flags = SLOT_BELT
	force_divisor = 1.6 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 1.2 // 10 when thrown with weight 20 (steel)
	attack_verb = list("bashed","struck","beaten")
	hitsound = 'sound/items/trayhit2.ogg'
	drawsound = 'sound/items/trayhit1.ogg'
	sharpness = 0
	block_chance = 10
	shocks = 100
	shockpower = 150
	cooldownw = 12
	unbreakable = TRUE

/obj/item/weapon/material/sword/magic/mjolnir/lesser
	name = "雷神之锤"
	shocks = 45
	shockpower = 15

