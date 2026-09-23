/////////////////XVIII CENTURY STUFF/////////////////////////////
/obj/item/ammo_casing/musketball
	name = "火枪弹"
	icon_state = "musketball_gunpowder"
	spent_icon = null
	projectile_type = /obj/item/projectile/bullet/rifle/musketball
	weight = 0.02
	caliber = "musketball"
	value = 3

/obj/item/ammo_casing/stoneball
	name = "石球弹丸"
	desc = "一颗圆形石球."
	icon_state = "stoneball"
	spent_icon = null
	projectile_type = /obj/item/projectile/bullet/rifle/stoneball
	weight = 0.03
	caliber = "stoneball"
	value = 3

/obj/item/ammo_casing/musketball_pistol
	name = "手枪弹"
	icon_state = "musketball_pistol_gunpowder"
	spent_icon = null
	projectile_type = /obj/item/projectile/bullet/rifle/musketball_pistol
	weight = 0.015
	caliber = "musketball_pistol"
	value = 2

/obj/item/ammo_casing/blunderbuss
	name = "雷铳弹"
	icon_state = "blunderbuss_gunpowder"
	spent_icon = null
	projectile_type = /obj/item/projectile/bullet/rifle/blunderbuss
	weight = 0.035
	caliber = "blunderbuss"
	value = 3

//Arrows

/obj/item/ammo_casing/arrow
	name = "箭杆"
	desc = "一支无头箭,效果不太好."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "arrow"
	spent_icon = null
	projectile_type = /obj/item/projectile/arrow/arrow
	weight = 0.15
	caliber = "arrow"
	slot_flags = SLOT_BELT
	value = 2
	var/volume = 5

/obj/item/ammo_casing/arrow/gods
	name = "神之指"
	desc = "一支散发神圣怒火的箭."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "arrow_god"
	projectile_type = /obj/item/projectile/arrow/arrow/fire/gods
	weight = 0.18

/obj/item/ammo_casing/arrow/flint
	name = "燧石箭"
	desc = "一支带燧石箭头的箭."
	icon_state = "arrow_flint"
	projectile_type = /obj/item/projectile/arrow/arrow/flint
	weight = 0.14

/obj/item/ammo_casing/arrow/stone
	name = "石箭"
	desc = "一支带石制箭头的箭."
	icon_state = "arrow_stone"
	projectile_type = /obj/item/projectile/arrow/arrow/stone
	weight = 0.17

/obj/item/ammo_casing/arrow/sandstone
	name = "砂岩箭"
	desc = "一支带砂岩箭头的箭."
	icon_state = "arrow_sandstone"
	projectile_type = /obj/item/projectile/arrow/arrow/sandstone
	weight = 0.17

/obj/item/ammo_casing/arrow/copper
	name = "铜箭"
	desc = "一支带铜制箭头的箭."
	icon_state = "arrow_copper"
	projectile_type = /obj/item/projectile/arrow/arrow/copper
	weight = 0.16

/obj/item/ammo_casing/arrow/iron
	name = "铁箭"
	desc = "一支带铁制箭头的箭."
	icon_state = "arrow_iron"
	projectile_type = /obj/item/projectile/arrow/arrow/iron
	weight = 0.16

/obj/item/ammo_casing/arrow/bronze
	name = "青铜箭"
	desc = "一支带青铜箭头的箭."
	icon_state = "arrow_bronze"
	projectile_type = /obj/item/projectile/arrow/arrow/bronze
	weight = 0.16

/obj/item/ammo_casing/arrow/steel
	name = "钢箭"
	desc = "一支带钢制箭头的箭."
	icon_state = "arrow_steel"
	projectile_type = /obj/item/projectile/arrow/arrow/steel
	weight = 0.17

/obj/item/ammo_casing/arrow/modern
	name = "玻璃纤维箭"
	desc = "一支现代的高速箭."
	icon_state = "arrow_modern"
	projectile_type = /obj/item/projectile/arrow/arrow/modern
	weight = 0.15

/obj/item/ammo_casing/arrow/vial
	name = "药瓶箭"
	desc = "一支铁头箭,箭头绑着一个玻璃药瓶."
	icon_state = "arrow_vial"
	projectile_type = /obj/item/projectile/arrow/arrow/vial
	weight = 0.18
	volume = 15

/obj/item/ammo_casing/arrow/vial/poisonous
	name = "毒箭"
	desc = "带毒箭头的箭矢."
	icon_state = "arrow_vial"
	projectile_type = /obj/item/projectile/arrow/arrow/vial/poisonous

//Crossbow

/obj/item/ammo_casing/bolt
	name = "弩箭杆"
	desc = "无箭头的弩箭, 效果不佳."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bolt"
	spent_icon = null
	projectile_type = /obj/item/projectile/arrow/bolt
	weight = 0.17
	caliber = "bolt"
	slot_flags = SLOT_BELT
	value = 2
	var/volume = 5

/obj/item/ammo_casing/bolt/flint
	name = "燧石弩箭"
	desc = "带有燧石箭头的弩箭."
	icon_state = "bolt_flint"
	projectile_type = /obj/item/projectile/arrow/bolt/flint
	weight = 0.15

/obj/item/ammo_casing/bolt/stone
	name = "石制弩箭"
	desc = "带有石制箭头的弩箭."
	icon_state = "bolt_stone"
	projectile_type = /obj/item/projectile/arrow/bolt/stone
	weight = 0.17

/obj/item/ammo_casing/bolt/sandstone
	name = "砂岩弩箭"
	desc = "带有砂岩箭头的弩箭."
	icon_state = "bolt_sandstone"
	projectile_type = /obj/item/projectile/arrow/bolt/sandstone
	weight = 0.17

/obj/item/ammo_casing/bolt/copper
	name = "铜制弩箭"
	desc = "带有铜制箭头的弩箭."
	icon_state = "bolt_copper"
	projectile_type = /obj/item/projectile/arrow/bolt/copper
	weight = 0.16
/obj/item/ammo_casing/bolt/gods
	name = "神之指"
	desc = "散发着神圣愤怒的弩箭."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bolt_god"
	projectile_type = /obj/item/projectile/arrow/bolt/fire/gods
	weight = 0.18

/obj/item/ammo_casing/bolt/iron
	name = "铁制弩箭"
	desc = "带有铁制箭头的弩箭."
	icon_state = "bolt_iron"
	projectile_type = /obj/item/projectile/arrow/bolt/iron
	weight = 0.17

/obj/item/ammo_casing/bolt/bronze
	name = "青铜弩箭"
	desc = "带有青铜箭头的弩箭."
	icon_state = "bolt_bronze"
	projectile_type = /obj/item/projectile/arrow/bolt/bronze
	weight = 0.17

/obj/item/ammo_casing/bolt/steel
	name = "钢制弩箭"
	desc = "带有钢制箭头的弩箭."
	icon_state = "bolt_steel"
	projectile_type = /obj/item/projectile/arrow/bolt/steel
	weight = 0.18

/obj/item/ammo_casing/bolt/modern
	name = "玻璃纤维弩箭"
	desc = "现代高速弩箭."
	icon_state = "bolt_modern"
	projectile_type = /obj/item/projectile/arrow/bolt/modern
	weight = 0.16
/obj/item/ammo_casing/bolt/vial
	name = "药瓶箭"
	desc = "箭尖附有玻璃药瓶的铁头弩箭."
	icon_state = "bolt_vial"
	projectile_type = /obj/item/projectile/arrow/bolt/vial
	weight = 0.18
	volume = 15

//Sling

/obj/item/ammo_casing/stone
	name = "石块"
	desc = "使用投石索发射."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "rock"
	spent_icon = null
	projectile_type = /obj/item/projectile/arrow/stone
	weight = 0.22
	caliber = "stone"
	value = 1

//Arrowheads

/obj/item/ammo_casing/arrow/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/flint))
		var/obj/item/weapon/flint/F = W
		if (F.sharpened)
			new/obj/item/ammo_casing/arrow/flint(user.loc)
			qdel(F)
			playsound(loc, 'sound/machines/click.ogg', 25, TRUE)
			to_chat(user, "<span class = 'notice'>你将[F]安装到[src]</span>")
			qdel(src)

	if(istype(W, /obj/item/stack/arrowhead))
		var/obj/item/stack/arrowhead/AH = W
		if(istype(W, /obj/item/stack/arrowhead/stone))
			new/obj/item/ammo_casing/arrow/stone(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/copper))
			new/obj/item/ammo_casing/arrow/copper(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/iron))
			new/obj/item/ammo_casing/arrow/iron(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/bronze))
			new/obj/item/ammo_casing/arrow/bronze(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/steel))
			new/obj/item/ammo_casing/arrow/steel(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/vial))
			new/obj/item/ammo_casing/arrow/vial(user.loc)
		else
			new/obj/item/ammo_casing/arrow/gods(user.loc)
		AH.amount--
		if (AH.amount<1)
			qdel(AH)
		playsound(loc, 'sound/machines/click.ogg', 25, TRUE)
		to_chat(user, "<span class = 'notice'>你将[W]安装到[src]</span>")
		qdel(src)
	if (istype(W, /obj/item/weapon/reagent_containers))
		return //do nothing if not reagent container
	else
		if(volume < src.reagents)
			to_chat(user, "<span class = 'notice'>你将[W]浸入[src]</span>")
			W.reagents.trans_to_obj(src, volume - src.reagents)
	..()

/obj/item/ammo_casing/bolt/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/flint))
		var/obj/item/weapon/flint/F = W
		if (F.sharpened)
			new/obj/item/ammo_casing/bolt/flint(user.loc)
			qdel(F)
		playsound(loc, 'sound/machines/click.ogg', 25, TRUE)
		to_chat(user, "<span class = 'notice'>你将[W]安装到[src]</span>")
		qdel(src)

	if(istype(W, /obj/item/stack/arrowhead))
		var/obj/item/stack/arrowhead/AH = W
		if(istype(W, /obj/item/stack/arrowhead/stone))
			new/obj/item/ammo_casing/bolt/stone(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/copper))
			new/obj/item/ammo_casing/bolt/copper(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/iron))
			new/obj/item/ammo_casing/bolt/iron(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/bronze))
			new/obj/item/ammo_casing/bolt/bronze(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/steel))
			new/obj/item/ammo_casing/bolt/steel(user.loc)
		else if(istype(W, /obj/item/stack/arrowhead/vial))
			new/obj/item/ammo_casing/bolt/vial(user.loc)
		else
			new/obj/item/ammo_casing/bolt/gods(user.loc)
		AH.amount--
		if (AH.amount<1)
			qdel(AH)
		playsound(loc, 'sound/machines/click.ogg', 25, TRUE)
		to_chat(user, "<span class = 'notice'>你将[W]安装到[src]</span>")
		qdel(src)
	if (istype(W, /obj/item/weapon/reagent_containers))
		return //do nothing if not reagent container
	else
		if(volume < src.reagents)
			to_chat(user, "<span class = 'notice'>你将[W]浸入[src]</span>")
			W.reagents.trans_to_obj(src, volume - src.reagents)
	..()


/obj/item/stack/arrowhead
	name = "神之指"
	desc = "散发着神圣愤怒, 将其安装到箭杆上."
	icon = 'icons/obj/items.dmi'
	icon_state = "gods_arrowhead"

/obj/item/stack/arrowhead/stone
	name = "石制箭头"
	desc = "将其安装到箭杆上."
	icon_state = "stone_arrowhead"

/obj/item/stack/arrowhead/copper
	name = "铜制箭头"
	desc = "将其安装到箭杆上."
	icon_state = "copper_arrowhead"

/obj/item/stack/arrowhead/iron
	name = "铁制箭头"
	desc = "将其安装到箭杆上."
	icon_state = "iron_arrowhead"

/obj/item/stack/arrowhead/bronze
	name = "青铜箭头"
	desc = "将其安装到箭杆上."
	icon_state = "bronze_arrowhead"

/obj/item/stack/arrowhead/steel
	name = "钢制箭头"
	desc = "将其安装到箭杆上."
	icon_state = "steel_arrowhead"

/obj/item/stack/arrowhead/vial
	name = "药瓶箭头"
	desc = "将其安装到箭杆上."
	icon_state = "vial_arrowhead"

//Ammo with gunpoweder

/obj/item/stack/ammopart
	var/resultpath = /obj/item/ammo_casing/musketball
	amount = 1
	max_amount = 20
	singular_name = "projectile"
	value = 0
	flags = CONDUCT

/obj/item/stack/ammopart/stoneball
	name = "石制弹丸"
	desc = "圆形石球, 用于手炮, 火绳枪和火绳滑膛枪."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "stoneball"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_WEAK
	resultpath = null
	value = 1
	weight = 0.15
	max_amount = 5
	w_class = ITEM_SIZE_NORMAL
	flags = FALSE

/obj/item/stack/ammopart/musketball
	name = "火枪弹丸"
	desc = "圆形火枪弹丸, 用于燧发滑膛枪."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "musketball"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	resultpath = /obj/item/ammo_casing/musketball
	value = 2
	weight = 0.08

/obj/item/stack/ammopart/musketball_pistol
	name = "手枪弹丸"
	desc = "小型圆形火枪弹丸, 用于燧发手枪."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "musketball_pistol"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	resultpath = /obj/item/ammo_casing/musketball_pistol
	value = 1
	weight = 0.05

/obj/item/stack/ammopart/blunderbuss
	name = "雷铳弹丸"
	desc = "一堆小型铁制弹丸. 可装填雷铳."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "blunderbuss"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	resultpath = /obj/item/ammo_casing/blunderbuss
	value = 2
	weight = 0.1

/obj/item/stack/ammopart/casing
	max_amount = 40
	singular_name = "casing"
	value = 1
	weight = 0.05
	var/gunpowder = 0
	var/gunpowder_max = 2
	var/bulletn = FALSE

/obj/item/stack/ammopart/casing/rifle
	name = "空步枪弹壳"
	desc = "空黄铜弹壳."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "riflecasing_empty"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	resultpath = null
	gunpowder_max = 1.5
	var/inputbtype = "normal"

/obj/item/stack/ammopart/casing/pistol
	name = "空手枪弹壳"
	desc = "小型空黄铜弹壳."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "pistolcasing_empty"
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	resultpath = null
	gunpowder_max = 1

/obj/item/stack/ammopart/casing/tank
	name = "空火炮弹壳"
	desc = "大型空黄铜弹壳."
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "shell_tank_casing"
	force = WEAPON_FORCE_HARMLESS+1
	throwforce = WEAPON_FORCE_HARMLESS+2
	resultpath = null
	gunpowder_max = 5
	max_amount = 1
	value = 4
	var/caliber = 75

/obj/item/stack/ammopart/casing/artillery
	name = "空火炮炮弹壳"
	desc = "大型空黄铜弹壳."
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "casing"
	force = WEAPON_FORCE_HARMLESS+1
	throwforce = WEAPON_FORCE_HARMLESS+2
	resultpath = null
	gunpowder_max = 5
	max_amount = 1
	value = 4

/obj/item/stack/ammopart/casing/artillery/wired
	name = "接线空火炮炮弹壳"
	desc = "大型空黄铜弹壳. 粗糙地接了一些线"
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "casing_wired"
	force = WEAPON_FORCE_HARMLESS+1
	throwforce = WEAPON_FORCE_HARMLESS+2
	resultpath = null
	gunpowder_max = 5
	max_amount = 1
	value = 4

/obj/item/stack/ammopart/casing/artillery/wired/advanced
	name = "高级空火炮炮弹壳"
	desc = "大型空黄铜弹壳. 接了一些电子元件."
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "casing_advanced"
	force = WEAPON_FORCE_HARMLESS+1
	throwforce = WEAPON_FORCE_HARMLESS+2
	resultpath = null
	gunpowder_max = 5
	max_amount = 1
	value = 4

/obj/item/stack/ammopart/casing/artillery/wired/advanced/filled
	name = "铀装填火炮炮弹壳"
	desc = "大型黄铜弹壳. 接了一些铀和电子元件."
	icon = 'icons/obj/cannon_ball.dmi'
	icon_state = "casing"
	force = WEAPON_FORCE_HARMLESS+1
	throwforce = WEAPON_FORCE_HARMLESS+2
	resultpath = null
	gunpowder_max = 5
	max_amount = 1
	value = 4

/obj/item/stack/ammopart/casing/grenade
	name = "空手榴弹壳"
	desc = "空手榴弹壳."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "casing"
	force = WEAPON_FORCE_HARMLESS+4
	throwforce = WEAPON_FORCE_HARMLESS+7
	resultpath = null
	gunpowder_max = 2
	max_amount = 1
	value = 4
	var/finished = FALSE
	var/stype = "explosive"

/obj/item/stack/ammopart/casing/booster
	name = "空火箭助推器"
	desc = "大型空火箭助推器."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "rocketcasing_booster"
	force = WEAPON_FORCE_HARMLESS+5
	throwforce = WEAPON_FORCE_HARMLESS+7
	resultpath = null
	gunpowder_max = 15
	max_amount = 1
	value = 10

/obj/item/stack/ammopart/warhead
	name = "空火箭弹头"
	desc = "大型空火箭弹头."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "rocketcasing_warhead"
	force = WEAPON_FORCE_HARMLESS+3
	throwforce = WEAPON_FORCE_HARMLESS+6
	value = 20

/obj/item/ammo_casing/a65x50
	name = "6.5x50mm 有坂弹药"
	desc = "装有火药和铅弹头的黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a65x50
	caliber = "a65x50"
	value = 5

/obj/item/ammo_casing/a50cal
	name = ".50 BMG弹药"
	desc = "一种又大又重的黄铜弹壳,用于消灭无护甲目标."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a50cal
	caliber = "a50cal"
	value = 7

/obj/item/ammo_casing/a50cal/weak
	name = ".50 BMG弹药"
	desc = "一种又大又重的黄铜弹壳,用于消灭无护甲目标."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a50cal/weak
	caliber = "a50cal"
	value = 7

/obj/item/ammo_casing/a50cal_ap
	name = ".50 BMG穿甲弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a50cal_ap
	caliber = "a50cal"
	value = 7

/obj/item/ammo_casing/a50cal_he
	name = ".50 BMG高爆弹药"
	desc = "一种又大又重的黄铜弹壳,用于在撞击时爆炸."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a50cal_he
	caliber = "a50cal"
	value = 7

/obj/item/ammo_casing/a145
	name = "14.5x114弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a145
	caliber = "a145"
	value = 7

/obj/item/ammo_casing/a127
	name = "12.7x108弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.06
	projectile_type = /obj/item/projectile/bullet/rifle/a127
	caliber = "a127"
	value = 6

/obj/item/ammo_casing/a145_ap
	name = "14.5x114穿甲弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a145_ap
	caliber = "a145"
	value = 7

/obj/item/ammo_casing/a15115
	name = "15x115弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.10
	projectile_type = /obj/item/projectile/bullet/rifle/a15115
	caliber = "a15115"
	value = 25

/obj/item/ammo_casing/a15115_ap
	name = "15x115穿甲弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.10
	projectile_type = /obj/item/projectile/bullet/rifle/a15115_ap
	caliber = "a15115"
	value = 30

/obj/item/ammo_casing/a15115_aphe
	name = "15x115穿甲高爆弹药"
	desc = "一种又大又重的黄铜弹壳,用于在穿透护甲后爆炸."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.12
	projectile_type = /obj/item/projectile/bullet/rifle/a15115_aphe
	caliber = "a15115"
	value = 35

/obj/item/ammo_casing/a792x94
	name = "7.92x94mm弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a792x94
	caliber = "a792x94"
	value = 7

/obj/item/ammo_casing/a792x94_ap
	name = "7.92x94mm穿甲弹药"
	desc = "一种又大又重的黄铜弹壳,用于穿透护甲."
	icon_state = "big-bullet"
	spent_icon = "big-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a792x94_ap
	caliber = "a792x94"
	value = 12

/obj/item/ammo_casing/a65x50/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a65x50/weak
	caliber = "a65x50_weak"

/obj/item/ammo_casing/a65x52
	name = "6.5x52mm卡尔卡诺弹药"
	desc = "一种装有火药和铅弹头的黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a65x52
	caliber = "a65x52"
	value = 5

/obj/item/ammo_casing/a8x53
	name = "8x53mm村田弹药"
	desc = "一种装有火药和铅弹头的黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a8x53
	caliber = "a8x53"
	value = 5

/obj/item/ammo_casing/a8x50
	name = "8x50mmR勒贝尔弹药"
	desc = "一种装有火药和铅弹头的黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a8x50
	caliber = "a8x50"
	value = 5

/obj/item/ammo_casing/a8x50/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a8x50/weak
	caliber = "a8x50_weak"

/obj/item/ammo_casing/c9mm_jap_revolver
	name = "9x22mm二十六年式弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/c9mm_jap_revolver
	caliber = "c9mm_jap_revolver"
	value = 5

/obj/item/ammo_casing/a41
	name = ".41短弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/pistol/a41
	caliber = "a41"
	value = 7

/obj/item/ammo_casing/a43
	name = ".43西班牙弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/pistol/a43
	caliber = "a43"
	value = 7

/obj/item/ammo_casing/a32
	name = ".32 S&W弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/pistol/a32
	caliber = "a32"
	value = 5

/obj/item/ammo_casing/a38
	name = ".38弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/pistol/a38
	caliber = "a38"
	value = 5
/obj/item/ammo_casing/a380acp
    name = ".380 ACP弹药"
    desc = "一种短小但中等尺寸的手枪弹药."
    icon_state = "pistol-bullet"
    spent_icon = "pistol-casing"
    weight = 0.05
    projectile_type = /obj/item/projectile/bullet/pistol/a380acp
    caliber = "a380acp"
    value = 5

/obj/item/ammo_casing/a45
	name = ".45长柯尔特弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a45
	caliber = "a45"
	value = 7

/obj/item/ammo_casing/a45acp
	name = ".45 ACP弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a45
	caliber = "a45acp"
	value = 7

/obj/item/ammo_casing/a455
	name = ".455韦伯利弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a455
	caliber = "a455"
	value = 7

/obj/item/ammo_casing/a44
	name = ".44-40温彻斯特弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a44
	caliber = "a44"
	value = 8

/obj/item/ammo_casing/a44magnum
	name = ".44马格南弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a44magnum
	caliber = "a44magnum"
	value = 8

/obj/item/ammo_casing/a4570
	name = ".45-70政府弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a4570
	caliber = "a4570"
	value = 8

/obj/item/ammo_casing/a792x57
	name = "7.92x57mm毛瑟弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a792x57
	caliber = "a792x57"
	value = 8

/obj/item/ammo_casing/a792x57/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a792x57/weak
	caliber = "a792x57_weak"

/obj/item/ammo_casing/a765x53
	name = "7.65x53mm毛瑟弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a765x53
	caliber = "a765x53"
	value = 8

/obj/item/ammo_casing/a765x25
	name = "7.65x25mm博查特弹药"
	desc = "一种黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.08
	projectile_type = /obj/item/projectile/bullet/rifle/a765x25
	caliber = "a765x25"
	value = 8

/obj/item/ammo_casing/a7x57
	name = "7x57mm毛瑟弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.076
	projectile_type = /obj/item/projectile/bullet/rifle/a7x57
	caliber = "a7x57"
	value = 8

/obj/item/ammo_casing/a77x58
	name = "7.7x58mm有坂弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.076
	projectile_type = /obj/item/projectile/bullet/rifle/a77x58
	caliber = "a77x58"
	value = 8

/obj/item/ammo_casing/a77x58_wood
	name = "7.7x58mm子弹"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.076
	projectile_type = /obj/item/projectile/bullet/rifle/a77x58_wood
	caliber = "a77x58_wood"
	value = 6

/obj/item/ammo_casing/a577
	name = ".577/450马蒂尼-亨利弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.11
	projectile_type = /obj/item/projectile/bullet/rifle/a577
	caliber = "a577"
	value = 8

/obj/item/ammo_casing/a762x54
	name = "7.62x54mmR弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54
	caliber = "a762x54"
	value = 2

/obj/item/ammo_casing/a762x54/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a762x54/weak
	caliber = "a762x54_weak"

/obj/item/ammo_casing/a303
	name = ".303英国弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a303
	caliber = "a303"
	value = 2

/obj/item/ammo_casing/a303/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a303/weak
	caliber = "a303_weak"

/obj/item/ammo_casing/a3006
	name = ".30-06弹药"
	desc = "一种黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a3006
	caliber = "a3006"
	value = 2

/obj/item/ammo_casing/a3006/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a3006/weak
	caliber = "a3006_weak"

/obj/item/ammo_casing/a762x38
	name = "7.62x38mmR弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a762x38
	caliber = "a762x38"
	value = 5

/obj/item/ammo_casing/a8x27
	name = "8x27mmR 法国军用弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a8x27
	caliber = "a8x27"
	value = 5

/obj/item/ammo_casing/c8mmnambu
	name = "8x22mm 南部弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/c8mmnambu
	caliber = "c8mmnambu"
	value = 2

/obj/item/ammo_casing/a9x19
	name = "9x19mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a9x19
	caliber = "a9x19"
	value = 2

/obj/item/ammo_casing/a9x18
	name = "9x18mm 马卡洛夫弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a9x18
	caliber = "a9x18"
	value = 2

/obj/item/ammo_casing/a765x25
	name = "7.65x25 博查特弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a765x25
	caliber = "a765x25"
	value = 2

/obj/item/ammo_casing/a762x25
	name = "7.62x25mm 托卡列夫弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a762x25
	caliber = "a762x25"
	value = 2

/obj/item/ammo_casing/a762x25/rubber
	name = "7.62x25mm 橡胶弹药"
	desc = "一枚木质弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/a762x25
	caliber = "a762x25"
	value = 2

/obj/item/ammo_casing/a792x33
	name = "7.92x33mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a792x33
	caliber = "a792x33"
	value = 2

/obj/item/ammo_casing/a545x39
	name = "5.45x39mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/rifle/a545x39
	caliber = "a545x39"
	value = 2
/obj/item/ammo_casing/a545x39/rubber
	name = "5.45x39mm 橡胶弹药"
	desc = "一枚橡胶质黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/a54x39
	caliber = "a545x39"
	value = 2

/obj/item/ammo_casing/a32acp
	name = ".32 ACP 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.03
	projectile_type = /obj/item/projectile/bullet/pistol/a32acp
	caliber = "a32acp"
	value = 2

/obj/item/ammo_casing/webly445
	name = "故障子弹"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.03
	projectile_type = /obj/item/projectile/bullet/pistol/webly445
	caliber = "webly445"
	value = 2

/obj/item/ammo_casing/a556x45
	name = "5.56x45mm 北约弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/rifle/a556x45
	caliber = "a556x45"
	value = 2

/obj/item/ammo_casing/a762x51
	name = "7.62x51mm 北约弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.06
	projectile_type = /obj/item/projectile/bullet/rifle/a762x51
	caliber = "a762x51"
	value = 2

/obj/item/ammo_casing/a762x51/weak
	projectile_type = /obj/item/projectile/bullet/rifle/a762x51/weak
	caliber = "a762x51_weak"

/obj/item/ammo_casing/a762x39
	name = "7.62x39mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.06
	projectile_type = /obj/item/projectile/bullet/rifle/a762x39
	caliber = "a762x39"
	value = 2

/obj/item/ammo_casing/a762x33
	name = "7.62x33mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/rifle/a762x33
	caliber = "a762x33"
	value = 2

/obj/item/ammo_casing/a9x39
	name = "9x39mm 弹药"
	desc = "一枚苏联步枪黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.09
	projectile_type = /obj/item/projectile/bullet/rifle/a9x39
	caliber = "a9x39"
	value = 2

/obj/item/ammo_casing/a44p
	name = "故障子弹"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a44p
	caliber = "a44p"
	value = 2

/obj/item/ammo_casing/a57x28
	name = "57x28mm 弹药"
	desc = "一枚黄铜弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.05
	projectile_type = /obj/item/projectile/bullet/pistol/a57x28
	caliber = "a57x28"
	value = 2

/obj/item/ammo_casing/a58x42
	name = "5.8x42mm 弹药"
	desc = "一枚无底缘瓶颈式弹壳."
	icon_state = "pistol-bullet"
	spent_icon = "pistol-casing"
	weight = 0.04
	projectile_type = /obj/item/projectile/bullet/rifle/a58x42
	caliber = "a58x42"
	value = 2

/obj/item/ammo_casing/a20mm_aphe
	name = "20mm 穿甲高爆弹药"
	desc = "一枚穿甲高爆弹药."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 2
	projectile_type = /obj/item/projectile/shell/autocannon/a20_aphe
	caliber = "a20"
	value = 2

/obj/item/ammo_casing/a25mm_ap
	name = "25mm 穿甲弹药"
	desc = "一枚非常大的黄铜弹壳."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a25_ap
	caliber = "a25"
	value = 2

/obj/item/ammo_casing/a25mm_he
	name = "25mm 高爆弹药"
	desc = "一枚非常大的黄铜弹壳."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a25_he
	caliber = "a25"
	value = 2

/obj/item/ammo_casing/a30mm_ap
	name = "30mm 穿甲曳光弹药"
	desc = "一枚穿甲曳光弹药."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a30_ap
	caliber = "a30"
	value = 2

/obj/item/ammo_casing/frag/a30mm_he
	name = "30mm 高爆曳光弹药"
	desc = "一枚高爆曳光弹药."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a30_he
	caliber = "a30"
	value = 2

/obj/item/ammo_casing/a35mm_fap
	name = "30mm 易碎穿甲弹药"
	desc = "一枚易碎穿甲弹药."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a35_fap
	caliber = "a35"
	value = 2

/obj/item/ammo_casing/frag/a35mm_hei
	name = "30mm 高爆燃烧曳光弹药"
	desc = "一枚高爆燃烧曳光弹药."
	icon_state = "huge-bullet"
	spent_icon = "huge-casing"
	weight = 1
	projectile_type = /obj/item/projectile/shell/autocannon/a35_hei
	caliber = "a35"
	value = 2

/obj/item/ammo_casing/a357
	name = ".357 马格南弹药"
	desc = "一枚.357 马格南步枪黄铜弹壳."
	icon_state = "rifle-bullet"
	spent_icon = "rifle-casing"
	weight = 0.09
	projectile_type = /obj/item/projectile/bullet/rifle/a357
	caliber = "a357"
	value = 2


// Shotguns

/obj/item/ammo_casing/shotgun
	caliber = "12gauge"
	weight = 0.12
	value = 2
/obj/item/ammo_casing/shotgun/buckshot
	name = "鹿弹弹壳"
	desc = "一枚12号鹿弹."
	icon_state = "shell-shell"
	spent_icon = "shell-casing"
	projectile_type = /obj/item/projectile/bullet/pellet/buckshot

/obj/item/ammo_casing/shotgun/slug
	name = "霰弹块"
	desc = "一枚12号霰弹块."
	icon_state = "slug-shell"
	spent_icon = "slug-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/slug

/obj/item/ammo_casing/shotgun/beanbag
	name = "豆袋弹壳"
	desc = "一枚豆袋弹壳."
	icon_state = "beanbag-shell"
	spent_icon = "beanbag-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag

/obj/item/ammo_casing/shotgun/breaching
	name = "破门弹"
	desc = "一枚用于破坏门锁的12号破门弹."
	icon_state = "slug-shell"
	spent_icon = "slug-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/breaching

/obj/item/ammo_casing/shotgun/rubber
	name = "橡胶弹"
	desc = "一枚橡胶弹壳."
	icon_state = "rubbershot-shell"
	spent_icon = "rubbershot-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/rubber


/obj/item/ammo_casing/shotgun/incendiary
	name = "燃烧霰弹块"
	desc = "一枚12号燃烧霰弹块."
	icon_state = "dragons-breath-shell"
	spent_icon = "dragons-breath-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/incendiary

/obj/item/ammo_casing/flare
	name = "信号弹"
	desc = "一枚信号弹."
	icon_state = "flaregun-shell"
	spent_icon = "flaregun-spent"
	projectile_type = /obj/item/projectile/flare

// Lasers

/obj/item/ammo_casing/laser
	name = "激光弹"
	desc = "你不应该看到这个"
	caliber = "laser"
	icon_state = "darts"
	spent_icon = "darts-0"
	projectile_type = /obj/item/projectile/laser
	leaves_residue = FALSE

/obj/item/ammo_casing/laser/b
	projectile_type = /obj/item/projectile/laser/b
	caliber = "laserb"
/obj/item/ammo_casing/laser/g
	projectile_type = /obj/item/projectile/laser/g
	caliber = "laserg"
/obj/item/ammo_casing/laser/pistol
	name = "手枪激光弹"
	projectile_type = /obj/item/projectile/laser/pistol
	caliber = "laser_pistol"

/obj/item/ammo_casing/laser/pistol/b
	name = "手枪激光弹"
	projectile_type = /obj/item/projectile/laser/pistol/b
	caliber = "laser_pistolb"
/obj/item/ammo_casing/laser/pistol/g
	name = "手枪激光弹"
	projectile_type = /obj/item/projectile/laser/pistol/g
	caliber = "laser_pistolg"

/obj/item/ammo_casing/laser/repeating
	name = "激光弹"
	desc = "你不应该看到这个"
	caliber = "laser"
	icon_state = "darts"
	spent_icon = "darts-0"
	projectile_type = /obj/item/projectile/laser/repeating
	leaves_residue = FALSE