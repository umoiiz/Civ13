/* Surgery Tools
 * Contains:
 *		Retractor
 *		Hemostat
 *		Cautery
 *		Scalpel
 *		Bone Saw
 */


/obj/item/weapon/surgery
	name = "手术工具(请勿使用)"
	desc = "此物品不应出现在这里.请联系开发者."
	icon = 'icons/obj/surgery.dmi'
	flags = CONDUCT
	w_class = ITEM_SIZE_SMALL

/obj/item/weapon/surgery/attack(mob/M as mob, mob/living/user as mob)
	if	(user.a_intent == I_HELP)	//A tad messy, but this should stop people from smacking their patients in surgery
		return FALSE
	..()
/*
 * Retractor
 */
/obj/item/weapon/surgery/retractor
	name = "牵开器"
	desc = "牵开组织."
	icon_state = "retractor"

/obj/item/weapon/surgery/retractor/bronze
	name = "青铜牵开器"
	icon_state = "bronze_retractor"

/*
 * Hemostat
 */
/obj/item/weapon/surgery/hemostat
	name = "止血钳"
	desc = "夹住血管.防止出血."
	icon_state = "hemostat"
	attack_verb = list("attacked", "pinched")

/obj/item/weapon/surgery/hemostat/bronze
	name = "青铜止血钳"
	icon_state = "bronze_hemostat"
	attack_verb = list("attacked", "pinched")
/*
 * Cautery
 */
/obj/item/weapon/surgery/cautery
	name = "烧灼器"
	desc = "一块灼热的铁.闭合伤口并止血."
	icon_state = "cautery"
	attack_verb = list("burnt")

/obj/item/weapon/surgery/cautery/bronze
	name = "青铜烧灼器"
	desc = "一把灼热的青铜钳.闭合伤口并止血."
	icon_state = "bronze_cautery"
	attack_verb = list("burnt")
/*
 * Scalpel
 */
/obj/item/weapon/surgery/scalpel
	name = "手术刀"
	desc = "切,切,再切."
	icon_state = "scalpel"
	force = WEAPON_FORCE_DANGEROUS
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	throwforce = 5.0
	throw_speed = WEAPON_FORCE_WEAK
	throw_range = 5
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/surgery/scalpel/bronze
	name = "青铜手术刀"
	icon_state = "bronze_scalpel"
/*
 * Circular Saw
 */
/obj/item/weapon/surgery/bone_saw
	name = "骨锯"
	desc = "用于重型切割."
	icon_state = "saw"
	hitsound = 'sound/weapons/circsawhit.ogg'
	force = WEAPON_FORCE_ROBUST
	w_class = ITEM_SIZE_NORMAL
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharp = TRUE
	edge = TRUE

/obj/item/weapon/surgery/bone_saw/bronze
	name = "青铜骨锯"
	icon_state = "bronze_bonesaw"

//misc, formerly from code/defines/weapons.dm

/obj/item/weapon/surgery/surgicaldrill
	name = "手术钻"
	desc = "你可以用此物品钻孔.懂?"
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	force = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("drilled")

/obj/item/weapon/surgery/bonesetter
	name = "接骨器"
	desc = "用于将骨骼复位."
	icon_state = "bone setter"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "hit", "bludgeoned")

/obj/item/weapon/surgery/bonesetter/bronze
	name = "青铜接骨器"
	icon_state = "bronze_bonesetter"
