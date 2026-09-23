/mob/living/human/proc/togglerace(targetraceinput)
	to_chat(src, "<span> 你开始发生变化....</span>")
	spawn(4000)
		if (src && orc+goblin+ant+crab+wolfman+lizard+gorillaman<=0)
			switch(targetraceinput)
				if ("orc")
					orc = 0
				if ("goblin")
					goblin = 0
				if ("ant")
					ant = 0
				if ("crab")
					crab = 0
				if ("wolfman")
					wolfman = 0
				if ("lizard")
					lizard = 0
				if ("gorillaman")
					gorillaman = 0
				if ("droid")
					droid = 0
/mob/living/human/proc/checkrace()
	if(!orc && !goblin && !ant && !wolfman && !lizard && !gorillaman && !crab && !droid && can_mutate)
		return TRUE
	else
		return FALSE
/mob/living/human/rad_act()
	..()
	if (inducedSSD)
		return
	if(radiation >= 300 && checkrace()) //If you are super irradiated, and somehow still alive.
		if (prob(15))
			if (prob(15))
				to_chat(src, "<span> 你感到自己变得更强壮、更愤怒!</span>")
			else
				to_chat(src, "<span> 你的皮肤开始变成绿色调!</span>")
			togglerace("orc")
			radiation -= radiation/8 //Reduce radiation a little.
		else if (prob(10))
			if (prob(10))
				to_chat(src, "<span> 你感到自己变得更小、更快!</span>")
			else
				to_chat(src, "<span> 你的皮肤开始变绿!</span>")
			togglerace("goblin")
			radiation -= radiation/8 //Reduce radiation a little.
		else if (prob(15))
			if (prob(50))
				to_chat(src, "<span> 你的皮肤开始被外骨骼覆盖!</span>")
			else
				to_chat(src, "<span> 你感到有什么东西从你头上长出来!</span>")
			togglerace("ant")
			radiation -= radiation/8 //Reduce radiation a little.
		else if (prob(15))
			if (prob(50))
				to_chat(src, "<span> 你开始长出一个壳!</span>")
			else
				to_chat(src, "<span> 你的双手变成了爪子!</span>")
			togglerace("crab")
			radiation -= radiation/8 //Reduce radiation a little.
		else if (prob(10))
			if (prob(50))
				to_chat(src, "<span> 你开始全身长出毛发!</span>")
			else
				to_chat(src, "<span> 你突然感到想要嚎叫!</span>")
			togglerace("wolfman")
			radiation -= radiation/4 //Reduce radiation because you ain't resistant.
		else if (prob(10))
			if (prob(50))
				to_chat(src, "<span> 你的皮肤开始长出鳞片!</span>")
			else
				to_chat(src, "<span> 你的舌头变得分叉而修长!</span>")
			togglerace("lizard")
			radiation -= radiation/4 //Reduce radiation because you ain't resistant.
		else if (prob(10))
			if (prob(50))
				to_chat(src, "<span> 你感到自己渴望香蕉!</span>")
			else
				to_chat(src, "<span> 你注意到深色毛发正在你全身蔓延!</span>")
			togglerace("gorillaman")
			radiation -= radiation/4 //Reduce radiation because you ain't resistant.
	if(radiation >= 350) //Corpse gotta be pretty bad tbh.
		if(stat == DEAD) //if dead.
			if(!istype(get_area(src), /area/caribbean/admin)) //To prevent people from mutating into zombies in the sleepzone.
				if (prob(30)) //decent chance.
					var/i
					for(i=1,i<contents.len,i++)//dump all items on ground
						drop_item(contents[i])
					var/mob/living/simple_animal/hostile/human/zombie/playerzombie //make a var for the zombie
					playerzombie = new /mob/living/simple_animal/hostile/human/zombie/ //make a zombie!
					//transferring vars.
					playerzombie.loc = loc
					playerzombie.name = real_name
					playerzombie.desc = "A zombie... looks like they were once someone."
					playerzombie.harm_intent_damage = 14 * getStatCoeff("strength")
					playerzombie.melee_damage_lower = 8 * getStatCoeff("strength")
					playerzombie.melee_damage_upper = 14 * getStatCoeff("strength")
					playerzombie.move_to_delay = 12 / getStatCoeff("dexterity")
					playerzombie.maxHealth = maxHealth //set health
					playerzombie.health = maxHealth //heal
					if(prob(1))
						playerzombie.desc = "A zombie... looks like it still remembers its faction."
						playerzombie.faction = faction
					qdel(src) //bye bye old body!
	return