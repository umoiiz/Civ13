// Practice target/dummy for training character skills.
/obj/structure/practice_dummy
	name = "训练假人"
	desc = "一个覆盖着稻草的木制平台.用于训练近战和远程武器."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy"
	var/target_type = "dummy"
	density = TRUE
	w_class = ITEM_SIZE_HUGE
	var/health = 100
	not_movable = FALSE
	not_disassemblable = FALSE
	var/ranged = TRUE
	var/melee = TRUE
	var/humanoid = TRUE


/obj/structure/practice_dummy/New()
	..()
	name = "practice dummy"
	desc = "A wood platform, covered in straw. Used for training both melee and ranged weapons."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy"


//As the name says, indestructible version of the dummy.
/obj/structure/practice_dummy/indestructible

/obj/structure/practice_dummy/indestructible/check_health()
	return

/obj/structure/practice_dummy/indestructible/ex_act()
	return

/obj/structure/practice_dummy/attackby(obj/item/W as obj, mob/living/human/user as mob)
	//If the user is holding dummy armor, equips the dummy(not target) with it and increases it's health.
	if (istype(W, /obj/item/weapon/dummy_armor))
		if(src.humanoid)
			visible_message("<span class='notice'>[user]把[W]放到了\the [src]上!</span>","<span class='notice'>你把[W]放到了\the [src]上!</span>")
			src.icon_state = icon_state + "_armor"
			src.health += 200
			qdel(W)
		else
			to_chat(user, "<span class='notice'>那个放不到[src]上</span>")
	//Flavor text when hitting the dummy with weapons.
	if (istype(W, /obj/item/weapon/material))
		user.setClickCooldown(W.cooldownw)
		if (W.attack_verb.len)
			visible_message("<span class='notice'>[user][pick(W.attack_verb)]\the [src]用\the [W]!</span>","<span class='notice'>你用\the [W][pick(W.attack_verb)]\the [src]了!</span>")
		else
			visible_message("<span class='notice'>[user]用\the [W]击中了\the [src]!</span>","<span class='notice'>你用\the [W]击中了\the [src]!</span>")

		playsound(get_turf(src), W.hitsound, 100)
		user.do_attack_animation(src)
		health -= 5
		check_health()
		if (prob(20))
			if (prob(80))
				if(melee)
					user.adaptStat("swords", 1)
			else
				if(melee)
					user.adaptStat("strength", 1)
			return
		else
			return
	else
		..()

//Similar to the above, but with bare hands.
/obj/structure/practice_dummy/attack_hand(mob/living/human/user as mob)
	if (user.a_intent == I_HARM)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if (prob(67))
			visible_message("<span class='notice'>[user]用拳头打了\the [src]!</span>","<span class='notice'>你用拳头打了\the [src]!</span>")
		else
			visible_message("<span class='notice'>[user]踢了\the [src]!</span>","<span class='notice'>你踢了\the [src]!</span>")
		playsound(get_turf(src), pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg'), 100)
		user.do_attack_animation(src)
		health -= 2
		check_health()
		if (prob(20))
			if (prob(60))
				if(melee)
					user.adaptStat("strength", 1)
			else
				if(melee)
					user.adaptStat("dexterity", 1)
			return
		else
			return
	else
		..()

//Training ranged skills
/obj/structure/practice_dummy/bullet_act(var/obj/item/projectile/proj)
	if (proj.firer && ishuman(proj.firer) && proj.firedfrom)
		var/mob/living/human/H = proj.firer
		health -= 8
		check_health()
		if (prob(40))
			if (istype(proj.firedfrom, /obj/item/weapon/gun))
				var/obj/item/weapon/gun/G = proj.firedfrom
				switch (G.gun_type)
					if (GUN_TYPE_RIFLE)
						if(ranged)
							H.adaptStat("rifle", 1)
					if (GUN_TYPE_PISTOL)
						if(ranged)
							H.adaptStat("pistol", 1)
					if (GUN_TYPE_BOW)
						if(ranged)
							H.adaptStat("bows", 1)
		visible_message("<span class='notice'>[H]用\the [proj]击中了\the [src]!</span>","<span class='notice'>你用\the [proj]击中了\the [src]!</span>")
		to_chat(H, "<font size=4><b>你击中了目标!</b></font>")
		//If the user shoots at a target, check if it's an arrow or a bolt and have a chance of dropping the arrow/bolt.
		if(istype(src, /obj/structure/practice_dummy/target))
			if (istype(proj, /obj/item/projectile/arrow/arrow))
				if(prob(75))
					if(istype(proj, /obj/item/projectile/arrow/arrow/stone))
						new/obj/item/ammo_casing/arrow/stone(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/flint))
						new/obj/item/ammo_casing/arrow/flint(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/sandstone))
						new/obj/item/ammo_casing/arrow/sandstone(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/copper))
						new/obj/item/ammo_casing/arrow/copper(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/iron))
						new/obj/item/ammo_casing/arrow/iron(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/bronze))
						new/obj/item/ammo_casing/arrow/bronze(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/steel))
						new/obj/item/ammo_casing/arrow/steel(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/arrow/modern))
						new/obj/item/ammo_casing/arrow/modern(src.loc)
					else
						new/obj/item/ammo_casing/arrow(src.loc)
					visible_message("<span class = 'warning'>箭矢掉到了地上!</span>")
				else
					visible_message("<span class = 'warning'>箭矢碎裂了!</span>")
			else if (istype(proj, /obj/item/projectile/arrow/bolt))
				if(prob(75))
					if(istype(proj, /obj/item/projectile/arrow/bolt/stone))
						new/obj/item/ammo_casing/bolt/stone(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/flint))
						new/obj/item/ammo_casing/bolt/flint(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/sandstone))
						new/obj/item/ammo_casing/bolt/sandstone(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/copper))
						new/obj/item/ammo_casing/bolt/copper(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/iron))
						new/obj/item/ammo_casing/bolt/iron(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/bronze))
						new/obj/item/ammo_casing/bolt/bronze(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/steel))
						new/obj/item/ammo_casing/bolt/steel(src.loc)
					else if(istype(proj, /obj/item/projectile/arrow/bolt/modern))
						new/obj/item/ammo_casing/bolt/modern(src.loc)
					else
						new/obj/item/ammo_casing/bolt(src.loc)
					visible_message("<span class = 'warning'>弩矢掉到了地上!</span>")
				else
					visible_message("<span class = 'warning'>弩矢碎裂了!</span>")
	else
		spawn (0.01)
		qdel(proj)
	return

//Checks the dummy health, if it drops to 0 or below, turns it into a wreckage.
/obj/structure/practice_dummy/proc/check_health()
	if (health <= 0)
		visible_message("<span class='notice'>训练用[target_type]被击碎了!</span>")
		var/obj/structure/practice_dummy/wreckage/JUNK = new /obj/structure/practice_dummy/wreckage(src.loc)
		JUNK.target_type = src.target_type //Determines what it was before turning into wreckage and stores it in the variable.
		JUNK.name = "[target_type] wreckage"
		JUNK.desc = "The wreckage of a training [target_type]. Can be fixed with wood."
		qdel(src)
		return
	else
		return

//Explosion result!
/obj/structure/practice_dummy/ex_act()
	visible_message("\The [src]爆炸了!")
	qdel(src)
	return

//Dummy armor that can be equipped on the training dummy to increase health.
/obj/item/weapon/dummy_armor
	name = "假人护甲"
	desc = "一套预先调整好的廉价护甲,用于延长训练假人的使用寿命."
	icon = 'icons/obj/objects.dmi'
	icon_state = "dummy_armor"
	w_class = ITEM_SIZE_NORMAL
	throwforce = FALSE
	throw_speed = 1
	throw_range = 3

//Wreckage object created when a dummy/target is destroyed.
/obj/structure/practice_dummy/wreckage/
	name = "假人残骸"
	desc = "训练假人的残骸.可以用木材修复."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy_wreckage"
	target_type = "dummy"
	density = TRUE
	w_class = ITEM_SIZE_HUGE
	health = 10
	not_movable = FALSE
	not_disassemblable = FALSE

/obj/structure/practice_dummy/wreckage/New()
	..()
	name = "dummy wreckage"
	desc = "The wreckage of a training dummy. Can be fixed with wood."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy_wreckage"

//Check if the object being used on it is wood, if it is and there is enough of it, repair the wreckage back into dummy/target.
/obj/structure/practice_dummy/wreckage/attackby(obj/item/W as obj, mob/living/human/user as mob)
	var/mob/living/human/H = user
	if(istype(W, /obj/item/stack/material/wood))
		if(W.amount >= 3)
			visible_message("<span class='danger'>[user]开始修理假人..</span>")
			if(do_after(H, (60 / H.getStatCoeff("crafting")), H.loc))
				visible_message("<span class='danger'>[user]完成了假人的修理.</span>")
				W.amount -= 3
				if(W.amount <= 0)
					qdel(W)
				if(src.target_type == "dummy")
					new /obj/structure/practice_dummy(src.loc)
				else if (src.target_type == "target")
					new /obj/structure/practice_dummy/target(src.loc)
				qdel(src)
				if (ishuman(user))
					H.adaptStat("crafting", 1)

//Works like a practice dummy, but only for ranged training, cannot improve health.
/obj/structure/practice_dummy/target
	name = "训练靶"
	desc = "一个木制靶子,上面覆盖着稻草.用于训练远程武器."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy_target"
	target_type = "target"
	density = TRUE
	w_class = ITEM_SIZE_HUGE
	health = 100
	not_movable = FALSE
	not_disassemblable = FALSE
	ranged = TRUE
	melee = FALSE
	humanoid = FALSE

/obj/structure/practice_dummy/target/New()
	..()
	name = "practice target"
	desc = "A wood target, covered in straw. Used for training ranged weapons."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_dummy_target"

/obj/structure/practice_dummy/target/human
	name = "练习靶"
	desc = "一个纸板靶子.用于训练远程武器."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_h"
/obj/structure/practice_dummy/target/human/New()
	..()
	name = "practice target"
	desc = "A cardboard target. Used for training ranged weapons."
	icon_state = "target_h"

/obj/structure/practice_dummy/target/human/indestructible

/obj/structure/practice_dummy/target/human/indestructible/check_health()
	return
/obj/structure/practice_dummy/target/human/indestructible/ex_act()
	return