/obj/item/weapon/material/kitchen
	icon = 'icons/obj/kitchen.dmi'

/*
 * Utensils
 */
/obj/item/weapon/material/kitchen/utensil
	w_class = ITEM_SIZE_TINY
	thrown_force_divisor = TRUE
	attack_verb = list("attacked", "stabbed", "poked")
	sharp = TRUE
	edge = TRUE
	force_divisor = 0.1 // 6 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 when thrown with weight 20 (steel)
	var/loaded	  //Descriptive string for currently loaded food object.
	var/scoop_food = TRUE
	var/shiv = 0
	var/usespeed = 0.2


/obj/item/weapon/material/kitchen/utensil/New()
	..()
	if (prob(60))
		pixel_y = rand(0, 4)
	create_reagents(5)
	return

/obj/item/weapon/material/kitchen/utensil/attack(mob/living/human/M as mob, mob/living/human/user as mob)
	if (!istype(M))
		return ..()

	if (user.a_intent != I_HELP || !scoop_food)
		if (user.targeted_organ == "eyes")
			return eyestab(M,user)
		else if (user.targeted_organ == "head" && (sharp || edge) && ishuman(M))
			M.resolve_item_attack(src, user, user.targeted_organ)
		else
			return ..()

	if (reagents.total_volume > 0)
		reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
		if (M == user)
			if (!M.can_eat(loaded))
				return
			else if (M.get_fullness() > 580)
				to_chat(user, "<span class='danger'>你再也咽不下任何食物了.</span>")
				return
			M.visible_message("<span class='notice'>\The [user]从\the [src]中吃了一些[loaded].</span>")
		else
			user.visible_message("<span class='warning'>\The [user]开始喂\the [M]!</span>")
			if (!(M.can_force_feed(user, loaded) && do_mob(user, M, 5 SECONDS)))
				return
			else if (M.get_fullness() > 580)
				to_chat(user, "<span class='danger'>你再也无法往[M]的嘴里塞更多食物了.</span>")
				return
			M.visible_message("<span class='notice'>\The [user]用\the [src]喂了\the [M]一些[loaded].</span>")
		playsound(M.loc,"eat", rand(20,45), TRUE)
		overlays.Cut()
		return
	else
		to_chat(user, "<span class='warning'>你的\the [src]上什么都没有.</span>")	//if we have help intent and no food scooped up DON'T STAB OURSELVES WITH THE FORK
		return

/obj/item/weapon/material/kitchen/utensil/fork
	name = "叉子"
	desc = "这是一把叉子. 确实很尖."
	icon_state = "fork"

/obj/item/weapon/material/kitchen/utensil/chopsticks
	name = "筷子"
	desc = "这是一双筷子. 要来点米饭吗, 混蛋?"
	icon_state = "chopsticks"
	material = "wood"
	applies_material_colour = FALSE
/obj/item/weapon/material/kitchen/utensil/spoon
	name = "勺子"
	desc = "这是一把勺子. 你可以在里面看到自己倒过来的脸."
	icon_state = "spoon"
	attack_verb = list("attacked", "poked")
	edge = FALSE
	sharp = FALSE
	force_divisor = 0 //no dmg. no more memes
/*
 * Knives
 */
#define SLASH 1
#define STAB 2
#define BASH 3

/obj/item/weapon/material/kitchen/utensil/knife
	name = "餐刀"
	desc = "一把用来吃饭的刀. 可以切开任何食物."
	icon_state = "knife"
	force_divisor = 0.1 // 6 when wielded with hardness 60 (steel)
	scoop_food = FALSE
	slot_flags = SLOT_BELT|SLOT_POCKET//|SLOT_MASK
	edge = TRUE
	sharp = TRUE
	var/atk_mode = SLASH
	var/suicide = FALSE // for the hari kiri action

/obj/item/weapon/material/kitchen/utensil/knife/proc/handle_suicide(mob/living/user)
	if (!ishuman(user))
		return
	var/mob/living/human/M = user
	suicide = TRUE
	M.visible_message("<span class = 'red'>[user]把[M.gender == FEMALE ? "her" : "his"] [src]捅进了[M.gender == FEMALE ? "her" : "his"]的肚子.</span>")
	if (!do_after(user, 60))
		M.visible_message("<span class = 'notice'>[user]自杀失败了.</span>")
		suicide = FALSE
		return
	else
		to_chat(user, "<span class = 'notice'>噢...</span>")
		user.apply_effect(110,AGONY,0)
		user.apply_damage(src.sharpness*2.5, "brute", "groin")
		user.death()
		user.visible_message("<span class = 'warning'>[user]把自己割开了.</span>")
		M.attack_log += "\[[time_stamp()]\] [M]/[M.ckey]</b> disemboweled themselves."
		suicide = FALSE

/obj/item/weapon/material/kitchen/utensil/knife/attack(atom/A, mob/living/user, target_zone)
	if (A == user)
		if (target_zone == "groin" && !suicide)
			handle_suicide(user)
			return TRUE
	return ..(A, user, target_zone)

/obj/item/weapon/material/kitchen/utensil/knife/razorblade
	name = "剃须刀片"
	desc = "一把折叠刀片, 用于刮胡子和剃毛发."
	icon = 'icons/obj/items.dmi'
	icon_state = "razorblade"
	item_state = "knife"
	force_divisor = 0.2
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/material/kitchen/utensil/knife/attack_self(mob/user)
	..()
	if(atk_mode == SLASH)
		atk_mode = STAB
		to_chat(user, "<span class='notice'>你现在将进行刺击.</span>")
		edge = FALSE
		sharp = TRUE
		attack_verb = list("stabbed")
		hitsound = "stab_sound"
		return

	else if(atk_mode == STAB)
		atk_mode = SLASH
		to_chat(user, "<span class='notice'>你现在将进行劈砍.</span>")
		attack_verb = list("slashed", "diced")
		hitsound = "slash_sound"
		edge = TRUE
		sharp = TRUE
		return

/obj/item/weapon/material/kitchen/utensil/knife/razorblade/attack(mob/living/human/M as mob, mob/living/user as mob)
	if (user.a_intent == I_DISARM && user.targeted_organ == "head" && ((M in range(user,1)) || M == user) && ishuman(M) && ishuman(user))
		visible_message("[user]开始剪[M]的头发...","你开始剪[M]的头发...")
		if (do_after(user, 80, M))
			var/list/hairlist = M.generate_valid_hairstyles(1,1)
			var/new_hstyle = WWinput(usr, "Please select a hair style.", "Grooming", WWinput_first_choice(hairlist), WWinput_list_or_null(hairlist))
			if (new_hstyle)
				M.h_style = new_hstyle
				for (var/hairstyle in hair_styles_list)
					var/datum/sprite_accessory/S = hair_styles_list[hairstyle]
					if (S.name == M.h_style)
						M.h_growth = S.growth
			if (M.gender == MALE)
				var/list/fhairlist = M.generate_valid_facial_hairstyles(1,1)
				var/new_fstyle = WWinput(usr, "Please select a facial hair style.", "Grooming", WWinput_first_choice(fhairlist), WWinput_list_or_null(fhairlist))
				if (new_fstyle)
					M.f_style = new_fstyle
					for (var/hairstyle in facial_hair_styles_list)
						var/datum/sprite_accessory/S = facial_hair_styles_list[hairstyle]
						if (S.name == M.f_style)
							M.f_growth = S.growth
			M.update_hair()
			M.update_body()
			visible_message("[user]剪完了[M]的头发.","你剪完了[M]的头发.")
			return
	else
		return ..()

/obj/item/weapon/material/kitchen/utensil/knife/shank
	name = "短刀"
	desc = "一把自制的小刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "steelshank"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = FALSE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.4
	default_material = "steel"

/obj/item/weapon/material/kitchen/utensil/knife/shank/glass
	name = "短刀"
	icon_state = "glassshank"
	force_divisor = 0.45
	default_material = "glass"

/obj/item/weapon/material/kitchen/utensil/knife/shank/iron
	name = "短刀"
	icon_state = "ironshank"
	force_divisor = 0.4
	default_material = "iron"
/obj/item/weapon/material/kitchen/utensil/knife/shank/wood
	name = "短刀"
	icon_state = "woodshank"
	applies_material_colour = FALSE
	force_divisor = 0.35
	default_material = "wood"

/obj/item/weapon/material/kitchen/utensil/knife/bowie
	name = "博伊刀"
	desc = "一把相当大的博伊刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bowie_knife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.6

/obj/item/weapon/material/kitchen/utensil/knife/bowie/iron
	default_material = "iron"

/obj/item/weapon/material/kitchen/utensil/knife/dagger
	name = "匕首"
	desc = "一把双刃锋利、尖端极其尖锐的匕首."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "dagger"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.76

/obj/item/weapon/material/kitchen/utensil/knife/dagger/iron
	default_material = "iron"

/obj/item/weapon/material/kitchen/utensil/knife/switchblade
	name = "弹簧刀"
	desc = "一把锋利、便于隐藏、弹簧驱动的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "switchblade"
	item_state = null
	applies_material_colour = FALSE
	unbreakable = TRUE
	hitsound = null
	attack_verb = list("patted", "tapped")
	force_divisor = 0.05
	w_class = ITEM_SIZE_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 5
	secondary_action = TRUE
	drawsound = 'sound/weapons/hiddenblade_deploy.ogg'
	var/active = FALSE

/obj/item/weapon/material/kitchen/utensil/knife/switchblade/update_icon()
	if(active)
		icon_state = "switchblade_open"
		item_state = "knife"
	else
		icon_state = "switchblade"
		item_state = null

/obj/item/weapon/material/kitchen/utensil/knife/switchblade/update_force()
	..()
	if(active)
		edge = TRUE
		sharp = TRUE
		throwforce = 5
		hitsound = 'sound/weapons/bladeslice.ogg'
		w_class = ITEM_SIZE_NORMAL
		force_divisor = 0.7
		attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	else
		edge = FALSE
		sharp = FALSE
		hitsound = initial(hitsound)
		w_class = initial(w_class)
		force_divisor = initial(force_divisor)
		attack_verb = initial(attack_verb)

/obj/item/weapon/material/kitchen/utensil/knife/switchblade/secondary_attack_self(mob/living/human/user)
	if(!active)
		visible_message("<span class='warning'>轻轻一按,[user]弹出了弹簧刀的刀刃.</span>", 3)
		playsound(loc, 'sound/weapons/switchblade.ogg', 15, 1)
		active = TRUE
	else
		visible_message("<span class='notice'>\The [user]收回了弹簧刀的刀刃.</span>", 3)
		active = FALSE
	update_force()
	update_icon()
	add_fingerprint(user)

/obj/item/weapon/material/kitchen/utensil/knife/fancy
	name = "精致小刀"
	desc = "一把昂贵的小刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fancyknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.3

/obj/item/weapon/material/kitchen/utensil/knife/fancy/silver
	default_material = "silver"

/obj/item/weapon/material/kitchen/utensil/knife/trench
	name = "战壕刀"
	desc = "一把相当大的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "trenchknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.7

/obj/item/weapon/material/kitchen/utensil/knife/trench/iron
	default_material = "iron"

/obj/item/weapon/material/kitchen/utensil/knife/meat
	name = "切肉刀"
	desc = "一把中等大小的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "meatknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.4

/obj/item/weapon/material/kitchen/utensil/knife/shaggers
	name = "混混刀"
	desc = "一把由贫民区的人粗制滥造的简易刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "shagger"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.4

/obj/item/weapon/material/kitchen/utensil/knife/fish
	name = "鱼刀"
	desc = "一把中等大小的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fishknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.5

/obj/item/weapon/material/kitchen/utensil/knife/fish/silver
	default_material = "silver"

/obj/item/weapon/material/kitchen/utensil/knife/tacticalknife
	name = "战术刀"
	desc = "一把相当战术化的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacticalknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.6

/obj/item/weapon/material/kitchen/utensil/knife/blackknife
	name = "黑刀"
	desc = "一把相当大的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "blackknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.6

/obj/item/weapon/material/kitchen/utensil/knife/military
	name = "军刀"
	desc = "一把相当大的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "militaryknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.9

/obj/item/weapon/material/kitchen/utensil/knife/military/iron
	default_material = "iron"

/obj/item/weapon/material/kitchen/utensil/knife/shadowdagger
	name = "暗影匕首"
	desc = "一把战术刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "smolknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.6

/obj/item/weapon/material/kitchen/utensil/knife/shadowdaggersal
	name = "暗影匕首"
	desc = "一把战术刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "salamon"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.6

/obj/item/weapon/material/kitchen/utensil/knife/bread
	name = "面包刀"
	desc = "一把相当大的刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "breadknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.2

/obj/item/weapon/material/kitchen/utensil/knife/survival
	name = "生存刀"
	desc = "一把小巧紧凑的生存刀."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "survivalknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.4

/obj/item/weapon/material/kitchen/utensil/knife/bone
	name = "部落骨刀"
	desc = "一把骨制刀刃、带棱纹刀柄的小刀."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "boneknife"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.1
	default_material = "bone"

/obj/item/weapon/material/kitchen/utensil/knife/bone/New()
	..()
	name = "bone knife"

/obj/item/weapon/material/kitchen/utensil/knife/circumcision
	name = "割礼刀"
	desc = "一把骨柄小刀,用于施行割礼."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "circumcision"
	item_state = "knife"
	applies_material_colour = FALSE
	unbreakable = TRUE
	drawsound = 'sound/items/unholster_knife.ogg'
	force_divisor = 0.1

/obj/item/weapon/material/kitchen/utensil/knife/circumcision/New()
	..()
	name = "circumcision knife"

/obj/item/weapon/material/kitchen/utensil/knife/circumcision/attack(target as mob, mob/living/user as mob)
	if (istype(target, /mob/living/human))
		var/mob/living/human/H = target
		if (user.a_intent == I_HELP && H.gender == MALE)
			if (H.circumcised)
				to_chat(user, "<span class = 'notice'>[H]已经受过割礼了!</span>")
				return
			else
				visible_message("<span class = 'notice'>[user]开始给[H]施行割礼...</span>")
				if (do_after(user, 90, H) && !H.circumcised)
					visible_message("<span class = 'notice'>[user]成功给[H]施行了割礼.</span>")
					H.circumcised = TRUE
					return
				else
					return ..()
		else
			return ..()
	else
		return ..()

/obj/item/weapon/material/kitchen/utensil/knife/attack(target as mob, mob/living/user as mob)
	return ..()

/obj/item/weapon/material/kitchen/utensil/knife/iron
	default_material = "iron"

/obj/item/weapon/material/kitchen/utensil/knife/bronze
	default_material = "bronze"

/obj/item/weapon/material/kitchen/utensil/knife/steel
	default_material = "steel"

/obj/item/weapon/material/kitchen/utensil/knife/wood
	default_material = "wood"

/obj/item/weapon/material/kitchen/utensil/knife/hook
	name = "肉钩"
	desc = "一个锋利的金属钩,能刺进东西里."
	icon_state = "hook_knife"
	item_state = "hook_knife"

/obj/item/weapon/material/kitchen/utensil/knife/butcher
	name = "屠夫的切肉刀"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "butch"
	desc = "一把用于剁砍肉类的大刀."
	edge = FALSE
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("cleaved", "slashed", "sliced", "torn", "ripped", "diced", "cut")
	drawsound = 'sound/items/unholster_knife.ogg'
	unbreakable = TRUE

/obj/item/weapon/material/kitchen/utensil/knife/tanto
	name = "短刀"
	desc = "日本人使用了数个世纪的刀.用于切片和劈砍,而非剁砍或锯切.常是切腹自尽的工具首选."
	icon_state = "tanto"
	item_state = "tanto"
	block_chance = 10
	force_divisor = 0.4 // 42 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.8 // 10 when thrown with weight 20 (steel)
	value = 60
	cooldownw = 6



/*
 * Rolling Pins
 */

/obj/item/weapon/material/kitchen/rollingpin
	name = "擀面杖"
	desc = "用来打晕酒保."
	icon_state = "rolling_pin"
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")
	default_material = "wood"
	force_divisor = 0.7 // 10 when wielded with weight 15 (wood)
	thrown_force_divisor = TRUE // as above
	hitsound = "swing_hit"
	flammable = TRUE
/obj/item/weapon/material/kitchen/rollingpin/attack(mob/living/M as mob, mob/living/user as mob)
	return ..()
