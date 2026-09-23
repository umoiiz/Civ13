/mob/living/simple_animal/hostile/human/barbarian
	name = "Barbarian"
	desc = "一个凶猛的野蛮人!"
	icon_state = "barbarian"
	icon_dead = "barbarian_dead"
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speak = list("Bar bar bar!", "Töten!", "Grrr!")
	speak_emote = list("grumbles", "screams")
	emote_hear = list("curses","grumbles","screams")
	emote_see = list("stares ferociously", "stomps")
	attack_verb = "stabs"
	maxHealth = 100
	health = 100
	faction = GERMAN
	harm_intent_damage = 15
	melee_damage_lower = 25
	melee_damage_upper = 35
	attacktext = "stabbed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	behaviour = "hostile"
	role = "soldier"
	language = new/datum/language/german
	weapon = /obj/item/weapon/material/spear/dory
	targeting = TRUE

/mob/living/simple_animal/hostile/human/barbarian/death()
	if (stat == DEAD)
		return ..()
	new /obj/item/stack/money/silvercoin(src.loc)
	return ..()

/mob/living/simple_animal/hostile/human/barbarian/friendly
	name = "Foederati"
	desc = "一个来自与罗马结盟部落的雇佣野蛮人."
	maxHealth = 200
	health = 200
	faction = CIVILIAN