//Look Sir, free crabs!
/mob/living/simple_animal/crab
	name = "crab"
	desc = "一种硬壳甲壳类动物。似乎很满足于整天懒洋洋地待着。"
	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"
	mob_size = MOB_SMALL
	speak_emote = list("clicks")
	emote_hear = list("clicks")
	emote_see = list("clacks")
	speak_chance = TRUE
	move_to_delay = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps"
	stop_automated_movement = TRUE
	friendly = "pinches"
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	possession_candidate = TRUE

/mob/living/simple_animal/crab/small
	name = "small crab"
	desc = "一种硬壳甲壳类动物。它似乎在四处寻找食物,想长成个大块头。"
	icon_state = "red_crab"
	icon_living = "red_crab"
	icon_dead = "red_crab_dead"
	mob_size = MOB_MINISCULE
	maxHealth = 10
	health = 10


/mob/living/simple_animal/crab/Life()
	..()
	//CRAB movement
	if (!ckey && !stat)
		if (isturf(loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if (turns_since_move >= move_to_delay)
				if (Move(get_step(src,pick(4,8))))
					turns_since_move = FALSE
	regenerate_icons()

/mob/living/simple_animal/crab/small/crab_san
	name = "crab-san"
	desc = "一种硬壳甲壳类士兵。它似乎在四处寻找可杀的敌人,毕竟它是帝国军队的士兵之类的。"
	icon_state = "crab_san"
	icon_living = "crab_san"
	icon_dead = "crab_san_dead"
	mob_size = MOB_MINISCULE
	maxHealth = 40
	health = 40

/mob/living/simple_animal/crab/small/trilobite
	name = "trilobite"
	desc = "一种硬壳节肢动物。它似乎在四处觅食。"
	icon_state = "trilobite_living"
	icon_living = "trilobite_living"
	icon_dead = "trilobite_dead"
	mob_size = MOB_MINISCULE
	maxHealth = 50
	health = 50

/mob/living/simple_animal/crab/small/dead
	New()
		..()
		death()