
/mob/living/simple_animal/hostile/sabertooth
	name = "sabertooth"
	desc = "一种史前哺乳动物, 长着一对标志性的长而锋利的犬齿, 别被它逮到."
	icon = 'icons/mob/animal_64.dmi'
	icon_state = "sabertooth_brown"
	icon_living = "sabertooth_brown"
	icon_dead = "sabertooth_brown_dead"
	speak = list("GRRR!","rawrr","RAWR!","RRRRR!")
	speak_emote = list("growls", "roars")
	emote_hear = list("growls","roars","buffs")
	emote_see = list("stares ferociously", "sniffs the ground")
	speak_chance = TRUE
	move_to_delay = 3
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	stop_automated_movement_when_pulled = FALSE
	maxHealth = 75
	health = 75
	melee_damage_lower = 22
	melee_damage_upper = 44
	mob_size = MOB_MEDIUM
	predatory_carnivore = 1
	carnivore = 1

	faction = "hostile"

/mob/living/simple_animal/hostile/sabertooth/white
	name = "sabertooth"
	desc = "一种史前哺乳动物, 长着一对标志性的长而锋利的犬齿, 别被它逮到."
	icon_state = "sabertooth_white"
	icon_living = "sabertooth_white"
	icon_dead = "sabertooth_white_dead"

/mob/living/simple_animal/hostile/sabertooth/lion
	name = "lion"
	desc = "百兽之王, 它大概能不费多大力气就杀死一个人. 别被它逮到."
	icon = 'icons/mob/animal_big.dmi'
	icon_state = "lion"
	icon_living = "lion"
	icon_dead = "lion_dead"
	icon_gib = "panther_gib"
	maxHealth = 75
	health = 75
	melee_damage_lower = 25
	melee_damage_upper = 35

/mob/living/simple_animal/hostile/sabertooth/lion/gladiator
	name = "arena lion"
	desc = "百兽之王, 为角斗表演的娱乐而养大以供杀戮. 别被它逮到."
	icon = 'icons/mob/animal_big.dmi'
	maxHealth = 75
	health = 75
	melee_damage_lower = 22
	melee_damage_upper = 44