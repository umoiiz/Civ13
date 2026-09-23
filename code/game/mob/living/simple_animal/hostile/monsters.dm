
// ============================================================
// MONSTERS
// Mythical and sci-fi hostile creatures
// ============================================================

// --------------------------------
// WENDIGO
// A powerful but slow supernatural predator from native legend.
// High health, very high damage, slower movement.
// Icons: wendigo / wendigo_Dead in animal_64.dmi
// --------------------------------

/mob/living/simple_animal/hostile/wendigo
	name = "wendigo"
	desc = "一个消瘦高耸的身影, 代表着饥饿与寒冬. 趁还能跑就快跑吧."
	icon = 'icons/mob/animal_64.dmi'
	icon_state = "wendigo"
	icon_living = "wendigo"
	icon_dead = "wendigo_Dead"
	icon_gib = "wendigo_Dead"
	speak = list("*inhuman screech*", "*bone-cracking howl*", "FLESH...", "HUNGRY...")
	speak_emote = list("shrieks", "wails")
	emote_hear = list("shrieks", "wails", "growls")
	emote_see = list("stares with empty black eyes", "sniffs the frozen air", "clicks its bones")
	speak_chance = TRUE
	// Slow but relentless hunter
	move_to_delay = 9
	see_in_dark = 8
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "prods"
	response_disarm = "shoves away"
	response_harm   = "strikes"
	stop_automated_movement_when_pulled = FALSE
	// Tanky and hits very hard - balanced by slow speed
	maxHealth = 220
	health = 220
	melee_damage_lower = 30
	melee_damage_upper = 45
	mob_size = MOB_LARGE
	can_bite_limbs_off = TRUE
	predatory_carnivore = 1
	carnivore = 1
	fat_penalty = 1
	break_stuff_probability = 30
	attacktext = "mauls"
	attack_sound = 'sound/weapons/demon_attack1.ogg'
	faction = "neutral"

/mob/living/simple_animal/hostile/wendigo/New()
	..()
	custom_emote(1, "lets out a bone-chilling wail as it materialises from the cold.")

/mob/living/simple_animal/hostile/wendigo/death()
	visible_message("\The [src]发出一声刺耳的尖啸倒下, 其形体消散于冰霜与阴影之中.")
	..()
// --------------------------------
// LIGHTSEEKER
// A fast but fragile eldritch hunter. Hunts light sources.
// Only targets mobs carrying an active light, or anyone within 1 tile.
// Icons: faithless / faithless_dead in monsters/monsters.dmi
// --------------------------------

/mob/living/simple_animal/hostile/lightseeker
	name = "lightseeker"
	desc = "一种可悲的, 没有眼睛的东西, 以令人作呕的速度移动. 它猎捕光亮, 所以待在黑暗中!"
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "faithless"
	icon_living = "faithless"
	icon_dead = "faithless_dead"
	icon_gib = "faithless_dead"
	speak = list("*skittering hiss*", "*wet clicking*", "*guttural screech*")
	speak_emote = list("hisses", "shrieks", "clicks")
	emote_hear = list("hisses", "clicks", "skitters")
	emote_see = list("cocks its head toward the light", "twitches violently", "sniffs the air")
	speak_chance = TRUE
	move_to_delay = 2
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "prods"
	response_disarm = "shoves away"
	response_harm   = "strikes"
	stop_automated_movement_when_pulled = FALSE
	maxHealth = 55
	health = 55
	melee_damage_lower = 10
	melee_damage_upper = 18
	mob_size = MOB_MEDIUM
	predatory_carnivore = 1
	carnivore = 1
	attacktext = "slashes"
	attack_sound = 'sound/weapons/demon_attack1.ogg'
	faction = "neutral"
	behaviour = "hunt" // use standard hunt engine; we gate targets via FindTarget()
	idle_vision_range = 9
	light_power = 1
	light_range = 1
	light_color = "#FF0000"
	can_bite_limbs_off = TRUE

/mob/living/simple_animal/hostile/lightseeker/New()
	..()
	custom_emote(1, "slinks out of the darkness, twitching erratically.")

/mob/living/simple_animal/hostile/lightseeker/death()
	visible_message("\The [src]发出最后一声湿漉漉的尖啸, 然后静止不动了.")
	set_light(0)
	..()

// Returns TRUE if M is carrying an active (lit) light source.
// Checks hands (base mob), and belt + ID slot (human-only).
/mob/living/simple_animal/hostile/lightseeker/proc/is_carrying_light(var/mob/living/M)
	// Hands - defined on base /mob, works for all mobs
	for (var/obj/item/flashlight/FL in list(M.r_hand, M.l_hand))
		if (FL && FL.on)
			return TRUE
	// Belt and ID slot - human-only vars
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.phosphor_dye_timer > 0)
			return TRUE
		for (var/obj/item/flashlight/FL in list(H.belt, H.wear_id))
			if (FL && FL.on)
				return TRUE
	return FALSE

// Override FindTarget() - the standard hunt AI calls this to pick a target.
// We only allow mobs carrying an active light, or anyone already adjacent (1 tile).
/mob/living/simple_animal/hostile/lightseeker/FindTarget()
	stop_automated_movement = FALSE
	var/mob/living/best = null
	var/best_priority = 0 // 2 = light carrier (chase across room), 1 = adjacent (bumped into)

	for (var/mob/living/L in view(idle_vision_range, src))
		if (L == src || L.stat == DEAD)
			continue
		if (!ishuman(L) && (L.faction == faction || (L in friends)))
			continue
		var/priority = 0
		if (is_carrying_light(L))
			priority = 2
		else if (get_dist(src, L) <= 1)
			priority = 1
		if (priority > best_priority)
			best_priority = priority
			best = L

	if (best)
		custom_emote(1, "snaps its head toward [best].")
		stance = HOSTILE_STANCE_ATTACK
	return best

// Drop the current target if they extinguish their light and step away.
/mob/living/simple_animal/hostile/lightseeker/Life()
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		return
	if (target_mob && stance == HOSTILE_STANCE_ATTACK)
		if (!is_carrying_light(target_mob) && get_dist(src, target_mob) > 1)
			LoseTarget()

	switch(stance)
		if (HOSTILE_STANCE_TIRED)
			stance = HOSTILE_STANCE_IDLE

		if (HOSTILE_STANCE_IDLE)
			if (prob(10))
				var/snd = 'sound/animals/monsters/drool1.ogg'
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ALERT)
			if (prob(10))
				var/snd = 'sound/animals/monsters/predalien_hiss.ogg'
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ATTACK)
			if (prob(10))
				var/snd = 'sound/animals/monsters/predalien_growl.ogg'
				playsound(src.loc, snd, 100, TRUE)
// --------------------------------
// ALIEN XENOMORPH
// Based on the Alien franchise. A deadly, calculating hunter.
// High health, high damage, fast. The apex predator.
// Icons: alienh / alienh_dead in monsters/alien.dmi
// --------------------------------

/mob/living/simple_animal/hostile/alien
	name = "xenomorph"
	desc = "一种光滑的, 甲壳质的梦魇. 酸性血液, 剃刀般的利爪, 而且绝对毫不留情."
	icon = 'icons/mob/monsters/alien.dmi'
	icon_state = "alienh"
	icon_living = "alienh"
	icon_dead = "alienh_dead"
	icon_gib = "alienh_dead"
	speak = list("*sharp hiss*", "*inner jaw clicks*")
	speak_emote = list("hisses", "snarls")
	emote_hear = list("hisses", "snarls", "skitters overhead")
	emote_see = list("tilts its elongated head", "coils its tail", "drools acid")
	speak_chance = TRUE
	// Fast, aggressive apex predator
	move_to_delay = 3
	see_in_dark = 10
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "prods"
	response_disarm = "shoves away"
	response_harm   = "strikes"
	stop_automated_movement_when_pulled = FALSE
	// Strong all-rounder - high HP, high damage, solid speed
	maxHealth = 175
	health = 175
	melee_damage_lower = 20
	melee_damage_upper = 35
	mob_size = MOB_LARGE
	can_bite_limbs_off = TRUE
	predatory_carnivore = 1
	carnivore = 1
	break_stuff_probability = 20
	attacktext = "claws"
	attack_sound = 'sound/weapons/alien_claw_flesh1.ogg'
	faction = "neutral"

/mob/living/simple_animal/hostile/alien/New()
	..()
	custom_emote(1, "emerges from the shadows, drooling acid onto the floor.")

/mob/living/simple_animal/hostile/alien/death()
	visible_message("\The [src]发出最后一声尖叫, 酸性血液在其身下汇聚.")
	..()

/mob/living/simple_animal/hostile/alien/Life()
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		return
	switch(stance)
		if (HOSTILE_STANCE_TIRED)
			stance = HOSTILE_STANCE_IDLE

		if (HOSTILE_STANCE_IDLE)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/growl1.ogg', 'sound/animals/monsters/growl2.ogg')
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ALERT)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/hiss1.ogg', 'sound/animals/monsters/hiss2.ogg')
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ATTACK)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/roar1.ogg', 'sound/animals/monsters/roar2.ogg')
				playsound(src.loc, snd, 100, TRUE)

// Drone subtype - lighter, faster scout variant
/mob/living/simple_animal/hostile/alien/drone
	name = "alien drone"
	desc = "异形中体型更小, 速度更快的变体. 依然绝对致命."
	move_to_delay = 2
	maxHealth = 90
	health = 90
	melee_damage_lower = 15
	melee_damage_upper = 25
	mob_size = MOB_MEDIUM
	can_bite_limbs_off = FALSE
	icon_state = "Drone Front Half"
	icon_living = "Drone Front Half"
	icon_dead = "alienh_dead"
	icon_gib = "alienh_dead"

// ============================================================
// NEW MONSTERS & VARIABLES
// ============================================================

/mob/living/var/mob/living/simple_animal/hostile/canopy_strangler/choked_by = null

/mob/living/human/var/cold_protection_disabled_timer = 0
/mob/living/human/var/phosphor_dye_timer = 0
/mob/living/human/var/blizzard_time = 0

// --------------------------------
// FATA MORGANA (Blizzard Mirage)
// --------------------------------
/mob/living/simple_animal/hostile/fata_morgana
	name = "fata morgana"
	desc = "一个由冰诞生的, 不断变幻的半透明形体."
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "fata_morgana"
	icon_living = "fata_morgana"
	icon_dead = "fata_morgana"
	icon_gib = "fata_morgana"
	maxHealth = 1
	health = 1
	faction = "neutral"
	stop_automated_movement = TRUE
	stance = HOSTILE_STANCE_IDLE
	behaviour = "none"
	var/mob/living/human/creator_player = null
	var/disguise_type = "crate"

/mob/living/simple_animal/hostile/fata_morgana/New()
	..()
	disguise_type = pick("crate", "loot")
	switch(disguise_type)
		if ("crate")
			name = "wooden crate"
			desc = "A wooden crate."
			icon = 'icons/obj/storage.dmi'
			icon_state = "wood_crate"
		if ("loot")
			name = "wooden plank"
			icon_state = "logs"
			icon = 'icons/obj/materials.dmi'
	icon_living = icon_state
	icon_dead = icon_state
	icon_gib = icon_state

/mob/living/simple_animal/hostile/fata_morgana/Life()
	..()

/mob/living/simple_animal/hostile/fata_morgana/death()
	..()
	qdel(src)

/mob/living/simple_animal/hostile/fata_morgana/attack_hand(mob/user as mob)
	if (istype(user, /mob/living/human))
		var/mob/living/human/H = user
		visible_message("<span class='warning'>\The [src]在一阵冰冷的狂风爆发中消失了!</span>")
		playsound(src, 'sound/effects/extinguish.ogg', 70, TRUE)
		H.bodytemperature = 100
		H.cold_protection_disabled_timer = 60 // 2 minutes (60 ticks of Life)
		qdel(src)
		return

// --------------------------------
// BOREAS (Hearth-Eater)
// --------------------------------
/mob/living/simple_animal/hostile/boreas
	name = "boreas"
	desc = "一头由深蓝色冰川冰构成的巨大元素野兽. 会被火焰吸引. 只能被火焰伤害."
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "ice_demon"
	icon_living = "ice_demon"
	icon_dead = "ice_demon_dead"
	maxHealth = 300
	health = 300
	melee_damage_lower = 20
	melee_damage_upper = 35
	move_to_delay = 12
	faction = "neutral"
	behaviour = "hunt"	
	var/obj/structure/oven/closest_oven = null

/mob/living/simple_animal/hostile/boreas/bullet_act(var/obj/item/projectile/P)
	return FALSE

/mob/living/simple_animal/hostile/boreas/apply_damage(var/damage = 0, var/damagetype = BRUTE, var/def_zone = null, var/blocked = FALSE, var/used_weapon = null, var/sharp = FALSE, var/edge = FALSE)
	if (damagetype == BURN)
		return ..(damage * 1.5, damagetype, def_zone, blocked, used_weapon, sharp, edge)
	else if (damagetype == BRUTE)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/boreas/FindTarget()
	return null

/mob/living/simple_animal/hostile/boreas/Bump(atom/A)
	if (istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/D = A
		D.Bumped()
	..()

/mob/living/simple_animal/hostile/boreas/Life()
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		return

	// Open nearby doors so we can reach fire sources inside
	for (var/obj/structure/simple_door/D in range(1, src))
		D.Bumped()

	for (var/obj/structure/oven/O in range(3, src))
		if (O.on && O.fuel > 0 && prob(50))
			O.fuel = max(0, O.fuel - 1)
			if (O.fuel <= 0)
				O.on = FALSE
				O.set_light(0)
				O.update_icon()
				visible_message("<span class='danger'>\The [O]的火焰正被[src]的冰冻存在所吸走!</span>")

	if (!target_mob)
		if (!closest_oven && map && map.ID == MAP_ANTARCTICA)
			var/obj/map_metadata/antarctica/AN = map
			if (AN.furnace)
				closest_oven = AN.furnace
		else
			if (!closest_oven || closest_oven.fuel <= 0)
				var/closest_dist = 999
				for (var/obj/structure/oven/O in range(9, src))
					if (O.on && O.fuel > 0)
						var/d = get_dist(src, O)
						if (d < closest_dist)
							closest_dist = d
							closest_oven = O
		if (closest_oven)
			walk_to(src, closest_oven, 1, move_to_delay)
		else
			walk(src, 0)

// --------------------------------
// ECHOFIEND (Jungle Sound Hunter)
// --------------------------------
/mob/living/simple_animal/hostile/echofiend
	name = "echofiend"
	desc = "一种蝙蝠般的怪物, 长着巨大的耳朵. 它对最轻微的声音都有反应."
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "echofiend"
	icon_living = "echofiend"
	icon_dead = "echofiend_dead"
	icon_gib = "echofiend_dead"
	maxHealth = 120
	health = 120
	melee_damage_lower = 15
	melee_damage_upper = 25
	move_to_delay = 3
	faction = "neutral"
	flying = TRUE
	var/turf/investigate_turf = null
	var/sound_spam_timer = 0

/mob/living/simple_animal/hostile/echofiend/FindTarget()
	return null

/mob/living/simple_animal/hostile/echofiend/Life()
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		return

	switch(stance)
		if (HOSTILE_STANCE_TIRED)
			stance = HOSTILE_STANCE_IDLE

		if (HOSTILE_STANCE_IDLE)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/growl1.ogg', 'sound/animals/monsters/growl2.ogg')
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ALERT)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/predator_click1.ogg', 'sound/animals/monsters/predator_click2.ogg')
				playsound(src.loc, snd, 100, TRUE)

		if (HOSTILE_STANCE_ATTACK)
			if (prob(10))
				var/snd = pick('sound/animals/monsters/roar1.ogg', 'sound/animals/monsters/roar2.ogg')
				playsound(src.loc, snd, 100, TRUE)
				
	if (!target_mob)
		for (var/mob/living/human/H in range(1, src))
			if (H.stat != DEAD)
				target_mob = H
				stance = HOSTILE_STANCE_ATTACK
				walk_to(src, H, TRUE, move_to_delay)
				break

	if (target_mob)
		if (target_mob.stat == DEAD || get_dist(src, target_mob) > 6)
			target_mob = null
			stance = HOSTILE_STANCE_IDLE
			walk(src, 0)
		return

	if (investigate_turf)
		if (get_turf(src) == investigate_turf)
			investigate_turf = null
			walk(src, 0)
		else
			walk_to(src, investigate_turf, TRUE, move_to_delay)

/mob/living/simple_animal/hostile/echofiend/proc/hear_sound(var/turf/T)
	if (stat != CONSCIOUS || target_mob)
		return
	investigate_turf = T
	if (sound_spam_timer <= 10)
		sound_spam_timer++
		return
	custom_emote(1, "twitches its ears and turns toward the sound.")
	sound_spam_timer = 0

/mob/living/simple_animal/hostile/echofiend/hear_say(var/message, var/verb, var/datum/language/speaking, var/alt_name, var/italics, var/mob/speaker, var/sound/speech_sound, var/sound_vol, var/alt_message, var/animal, var/original_message)
	hear_sound(get_turf(speaker))
	..()

// --------------------------------
// CANOPY STRANGLER (Ambush Vine)
// --------------------------------
/mob/living/simple_animal/hostile/canopy_strangler
	name = "canopy strangler"
	desc = "一条从树上垂下的多叶垂直藤蔓. 小心你的头."
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "vine_strangler_static"
	icon_living = "vine_strangler_static"
	icon_dead = "vine_strangler_static"
	icon_gib = "vine_strangler_static"
	maxHealth = 80
	health = 80
	layer = 6 // above mobs
	density = FALSE
	anchored = TRUE
	faction = "neutral"
	stop_automated_movement = TRUE
	stance = HOSTILE_STANCE_IDLE
	var/mob/living/human/choking_mob = null

/mob/living/simple_animal/hostile/canopy_strangler/Crossed(atom/movable/AM)
	..()
	if (choking_mob || stat == DEAD || stat == UNCONSCIOUS)
		return
	if (ishuman(AM))
		var/mob/living/human/H = AM
		if (H.stat == DEAD)
			return
		choking_mob = H
		H.choked_by = src
		H.update_canmove()
		icon_state = "vine_strangler"
		visible_message("<span class='danger'>一圈粗藤蔓套住了[H]的脖子, 将其微微吊起!</span>")
		to_chat(H, "<span class='danger'>一条绞杀藤蔓勒紧了你的脖子! 你无法动弹!</span>")

/mob/living/simple_animal/hostile/canopy_strangler/Life()
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		if (choking_mob)
			release_mob()
			qdel(src)
		return

	var/turf/T = get_turf(src)
	if (T)
		if (choking_mob)
			alpha = 255
		else if (T.get_lumcount() < 0.5)
			alpha = 60
		else
			alpha = 255

	if (choking_mob)
		if (choking_mob.stat == DEAD || get_turf(choking_mob) != T)
			release_mob()
			return
		choking_mob.apply_damage(5, OXY, "head")
		choking_mob.apply_damage(5, BRUTE, pick("l_leg","r_leg","chest","groin","l_arm","r_arm"))

/mob/living/simple_animal/hostile/canopy_strangler/death()
	release_mob()
	..()
	qdel(src)

/mob/living/simple_animal/hostile/canopy_strangler/proc/release_mob()
	if (choking_mob)
		var/mob/living/M = choking_mob
		choking_mob.choked_by = null
		choking_mob.anchored = FALSE
		choking_mob = null
		M.update_canmove()
	icon_state = "vine_strangler_static"

/mob/living/simple_animal/hostile/canopy_strangler/attack_hand(mob/living/human/M as mob)
	if (M.a_intent == I_DISARM)
		if (choking_mob == M)
			M.setClickCooldown(20)
			M.resist_grab()
			return TRUE
		else if (choking_mob)
			M.setClickCooldown(20)
			M.visible_message("<span class='warning'>[M]试图把[choking_mob]从[src]中拉出来!</span>", "<span class='warning'>你试图把[choking_mob]从[src]中拉出来!</span>")
			if (prob(30))
				visible_message("<span class='warning'>[M]成功地把[choking_mob]从[src]中拉了出来!</span>")
				release_mob()
			return TRUE
	return ..()

// --------------------------------
// PHOSPHOR BEETLE (Jungle Light Dye)
// --------------------------------
/mob/living/simple_animal/hostile/phosphor_beetle
	name = "phosphor beetle"
	desc = "一只发光的绿色甲虫, 以飞快的速度爬行."
	icon = 'icons/mob/monsters/monsters.dmi'
	icon_state = "glowing_beetle"
	icon_living = "glowing_beetle"
	icon_dead = "glowing_beetle_dead"
	icon_gib = "glowing_beetle_dead"
	maxHealth = 40
	health = 40
	melee_damage_lower = 2
	melee_damage_upper = 5
	move_to_delay = 2
	faction = "neutral"
	density = FALSE

/mob/living/simple_animal/hostile/phosphor_beetle/magic
	faction = "Moldywart" //so npcs dont attack each other

/mob/living/simple_animal/hostile/phosphor_beetle/Crossed(atom/movable/AM)
	..()
	if (stat == DEAD || stat == UNCONSCIOUS)
		return
	if (ishuman(AM))
		explode_dye(AM)

/mob/living/simple_animal/hostile/phosphor_beetle/AttackTarget()
	. = ..()
	if (.)
		explode_dye(target_mob)

/mob/living/simple_animal/hostile/phosphor_beetle/proc/explode_dye(var/mob/living/human/H)
	if (!istype(H) || H.stat == DEAD)
		return
	visible_message("<span class='warning'>\The [src]在一溅发光的绿色染料中爆炸了!</span>")
	playsound(src, 'sound/effects/extinguish.ogg', 60, TRUE)
	H.phosphor_dye_timer = 60
	H.set_light(3, 1, "#00FF00")
	H.apply_damage(7, BURN, "chest")
	H.acid_damage(world.time+600)
	death()

/mob/living/human/proc/acid_damage(end_timer = 0)
	spawn(70)
		if (end_timer > world.time && src.stat != DEAD)
			src.apply_damage(7, BURN, pick("chest","groin", "l_hand", "r_hand", "l_foot", "r_foot", "l_arm", "r_arm", "l_leg", "r_leg"))
			to_chat(src, "<span class='danger'>酸液继续灼烧着你!</span>")
			src.acid_damage(end_timer)