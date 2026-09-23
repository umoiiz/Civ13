/mob/living/simple_animal/hostile/gorilla
	name = "gorilla"
	desc =  "大型猿类中体型最大的成员, 它们凶猛的恶名掩盖了它们温和的本性, 除非被激怒."
	icon = 'icons/mob/animals_32x64.dmi'
	icon_state = "gorilla_crawling"
	icon_living = "gorilla_crawling"
	icon_dead = "gorilla_dead"
	speak = list("Uh uh ah","HOOOOH OOOH!","Ah uh uh!")
	speak_emote = list("growls","screams","howls")
	emote_hear = list("growls","screams","howls")
	emote_see = list("paces around", "beats its chest")
	health = 450
	maxHealth = 450
	move_to_delay = 5
	attacktext = "beats with fists"
	melee_damage_lower = 35
	melee_damage_upper = 50
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "punches"
	mob_size = MOB_LARGE
	granivore = 1
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	hostilesounds = list('sound/animals/gorilla/gorilla_roar.ogg')
	behaviour = "defends"

/mob/living/simple_animal/hostile/gorilla/gigantopithecus
	name = "giganthopithecus"
	desc =  "史上体型最大的猿类, 肌肉发达, 拥有非人的智慧."
	icon_state = "gigantopithecus"
	icon_living = "gigantopithecus"
	icon_dead = "gigantopithecus_dead"
	speak = list("Uh uh ah","HOOOOH OOOH!","Ah uh uh!")
	speak_emote = list("growls","screams","howls")
	emote_hear = list("growls","screams","howls")
	emote_see = list("paces around", "beats its chest")
	health = 750
	maxHealth = 750
	move_to_delay = 4
	attacktext = "beats with fists"
	melee_damage_lower = 45
	melee_damage_upper = 50
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "punches"
	mob_size = MOB_HUGE
	granivore = 1
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	behaviour = "defends"

/mob/living/simple_animal/hostile/gorilla/gigantopithecus/bigfoot
	name = "bigfoot"
	desc =  "神话中难以捉摸的生物, 长久以来被认为是某个濒危种族的幸存者."
	behaviour = "scared"

/mob/living/simple_animal/hostile/gorilla/gigantopithecus/yeti
	name = "yeti"
	desc =  "神话中难以捉摸的生物, 若你从未遭遇过它的掠食胃口, 那算是你走运."
	icon_state = "yeti"
	icon_living = "yeti"
	icon_dead = "yeti_dead"
	predatory_carnivore = 1
	carnivore = 1
	scavenger = 1
	granivore = 0
	behaviour = "hunt"