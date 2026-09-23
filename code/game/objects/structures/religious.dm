/obj/structure/religious
	name = "墓碑"
	desc = "一座用抛光石头制成的墓碑."
	icon = 'icons/obj/cross.dmi'
	icon_state = "gravestone"
	var/health = 100
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/religious/gravestone
	name = "墓碑"
	desc = "一座用抛光石头制成的墓碑."
	icon = 'icons/obj/cross.dmi'
	icon_state = "gravestone"
	density = FALSE
	anchored = TRUE

/obj/structure/religious/runestone
	name = "符文石"
	desc = "一块刻有符号的大石头."
	icon = 'icons/obj/statue.dmi'
	icon_state = "runestone"
	density = FALSE
	anchored = TRUE

/obj/structure/religious/runestone/runestone2
	icon_state = "runestone_2"

/obj/structure/religious/totem
	name = "石图腾"
	desc = "一座石像, 代表这个部落的灵兽."
	icon = 'icons/obj/cross.dmi'
	icon_state = "goose"
	density = TRUE
	anchored = TRUE
	var/tribe = "goose"
	var/religion = "none"
	layer = 3.2

/obj/structure/religious/olmec_head
	name = "大石头"
	desc = "一个巨大的石头头颅."
	icon = 'icons/obj/statue.dmi'
	icon_state = "olmec_head"
	density = TRUE
	anchored = TRUE
	layer = 3.2

/obj/structure/religious/moai
	name = "摩艾石像"
	desc = "一座大型石像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "moai2_bottom"
	density = TRUE
	anchored = TRUE
	layer = 6
	var/image/top = null

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "moai2_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/moai/long
	name = "长摩艾石像"
	icon_state = "moai1_bottom"

	New()
		..()
		top.icon_state = "moai1_top"
		update_icon()


obj/structure/religious/monument
	name = "monumental construction"
	desc = "ping a @contributor or sergeant on the discord if you can see this."
	icon = 'icons/obj/statue.dmi'
	icon_state = null
	density = TRUE
	anchored = TRUE
	health = 500
	layer = 6
	var/image/top = null

	New()
		..()
		if (top)
			top.icon_state = null
		update_icon()

/obj/structure/religious/monument/obelisk
	name = "纪念性砂岩方尖碑"
	desc = "一座大型砂岩方尖碑."
	icon_state = "obelisk_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "obelisk_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/megalith
	name = "纪念性巨石"
	desc = "一块巨大的粗糙巨石插入地面."
	icon_state = "megalith_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "megalith_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/pillar_monument
	name = "纪念性石柱"
	desc = "一根高耸的柱子, 傲然挺立且赏心悦目."
	icon_state = "monumental_pillar_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "monumental_pillar_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/crucero
	name = "巨型十字架纪念碑"
	desc = "一座巨大的十字架建筑,仿佛在宣告某种声明."
	icon_state = "crucero_bottom"
	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "crucero_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/venus
	name = "巨型维纳斯大理石雕像"
	desc = "一尊精雕细琢的古典女神维纳斯大理石雕像,她几乎衣不蔽体."
	icon_state = "venus_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "venus_top", layer= 6.0)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/liberty
	name = "自由女神像"
	desc = "一尊自由女神像."
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "liberty"
	bound_height = 64
	layer = 5.0

/obj/structure/religious/monument/karl_marx
	name = "巨型卡尔·马克思青铜雕像"
	desc = "共产主义之父本人,以青铜铸就."
	icon_state = "communist_santa_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "communist_santa_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/* Religious Monuments*/

/obj/structure/religious/monument/cultist
	name = "巨型邪教徒雕像"
	desc = "如果你能看到这个,请在discord上ping一个@contributor或中士."
	icon_state = null
	var/religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = null, layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/cthulu
	name = "巨型深潜者不祥雕像"
	desc = "一尊巨大的生物坐像,其面容令人不安,底座上的铭文由一组神秘的符号写成."
	icon_state = "cthulu_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "cthulu_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/moloch
	name = "巨型邪魔不祥雕像"
	desc = "一尊恶魔生物的雕像,其栩栩如生的翅膀和特征在石头上鲜明展现."
	icon_state = "moloch_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "moloch_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/outsider
	name = "巨型外神不祥雕像"
	desc = "一尊异次元生物的雕像,其奇异的外形结构令人费解,只为营造戏剧效果."
	icon_state = "outsider_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "outsider_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/sauron
	name = "巨型统治者不祥雕像"
	desc = "一尊高大装甲人物的雕像,手中紧握权杖,散发着不安与威严的气场."
	icon_state = "sauron_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "sauron_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/sauron/reverse //for mapping
	name = "巨型统治者不祥雕像"
	desc = "一尊高大装甲人物的雕像,手中紧握权杖,散发着不安与威严的气场."
	icon_state = "reverse_sauron_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "reverse_sauron_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/cultist/sauron/examine(var/mob/living/L)
	if (L.original_job_title == "Orc tribesman")
		name = "monumental ominous statue of morgoth"
		desc = "A statue of a the dark lord morgoth, sceptre clutched firmly in hand, it cuts a impressive fiugure of authority."
		return

/obj/structure/religious/monument/cultist/sauron/reverse/examine(var/mob/living/L)
	if (L.original_job_title == "Orc tribesman")
		name = "monumental ominous statue of morgoth"
		desc = "A statue of a the dark lord morgoth, sceptre clutched firmly in hand, it cuts a impressive fiugure of authority."
		return

/obj/structure/religious/monument/monk
	name = "巨型僧侣雕像"
	desc = "如果你能看到这个,请在discord上ping一个@contributor或中士."
	icon_state = null
	var/religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = null, layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/monk/quangshi
	name = "巨型石佛"
	desc = "这尊巨大的石佛雕像,散发着非凡的宁静与和谐之感."
	icon_state = "quangshi_bottom"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "quangshi_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/priesthood
	name = "巨型祭司雕像"
	desc = "如果你能看到这个,请在discord上ping一个@contributor或中士."
	icon_state = null
	var/religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = null, layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/priesthood/saint
	name = "巨型圣徒雕像"
	desc = "一尊巨大的天使圣徒石像,手中紧握一把剑."
	icon_state = "saint_bottom"
	religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "saint_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/shaman
	name = "巨型萨满雕像"
	desc = "如果你能看到这个,请在discord上ping一个@contributor或中士."
	icon_state = null
	var/religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = null, layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/shaman/ape
	name = "巨型巨猿雕像"
	desc = "一尊巨大的可怕猿猴石像,正狂怒地捶打着自己的胸膛."
	icon_state = "great_ape_bottom"
	religion = "none"

	New()
		..()
		top = image(icon='icons/obj/statue.dmi', icon_state = "great_ape_top", layer=3.2)
		top.pixel_y = 32
		update_icon()

	update_icon()
		..()
		overlays.Cut()
		overlays += top

/obj/structure/religious/monument/shaman/ape/examine(var/mob/living/L)
	if (L.original_job_title == "Gorilla tribesman")
		desc = "A enormous stone statue of a fearsome ape, it is a exemplar specimen of our kind, a real adonis."
		return

/*-Religious Monuments*/


/obj/structure/religious/aztec_statue
	name = "阿兹特克雕像"
	desc = "一尊阿兹特克风格的雕像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "aztec_statue"
	density = TRUE
	anchored = TRUE
	layer = 3.2

/obj/structure/religious/tiki_statue
	name = "提基雕像"
	desc = "一尊提基风格的雕像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "tikistatue1"
	density = TRUE
	anchored = TRUE
	layer = 3.2
	flammable = TRUE

/obj/structure/religious/tiki_statue/small
	name = "提基雕像"
	icon_state = "tikistatue2"

/obj/structure/religious/totem_pole
	name = "木制图腾柱"
	desc = "一根木制图腾柱,上面刻有数种动物."
	icon = 'icons/obj/obj32x64.dmi'
	icon_state = "totem_pole"
	density = TRUE
	anchored = TRUE
	layer = 3.2
	flammable = TRUE

/obj/structure/religious/gargoyle
	name = "石像鬼雕像"
	desc = "一尊警觉的石像鬼雕像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "gargoyle"
	density = TRUE
	anchored = TRUE
	layer = 3.2

/obj/structure/religious/angel
	name = "天使雕像"
	desc = "一尊警觉的天使雕像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "angel"
	density = TRUE
	anchored = TRUE
	layer = 3.2

/obj/structure/religious/totem/New()
	..()
	spawn(10)
		if (religion != "none")
			name = "[religion]'s stone totem"
			desc = "A stone totem dedicated to the [religion] religion."
			icon_state = pick("bear","mouse","goose","wolf","turkey","monkey")
			if (map.custom_religions[religion][7] == "Shamans")
				map.custom_religions[religion][3] += 25

/obj/structure/religious/totem/sandstone
	name = "砂岩图腾"
	desc = "一尊砂岩雕像,代表着该部落的灵兽."
	icon = 'icons/obj/cross.dmi'
	icon_state = "sandstone_snake"

/obj/structure/religious/totem/sandstone/New()
	..()
	spawn(10)
		if (religion != "none")
			name = "[religion]'s stone totem"
			desc = "A stone totem dedicated to the [religion] religion."
			icon_state = pick("sandstone_snake","sandstone_alligator","sandstone_ram","sandstone_eue")
			if (map.custom_religions[religion][7] == "Shamans")
				map.custom_religions[religion][3] += 25

/obj/structure/religious/animal_statue
	name = "雕像"
	desc = "一尊石制雕像."
	icon = 'icons/obj/cross.dmi'
	icon_state = "goose"
	density = TRUE
	anchored = TRUE
	layer = 3.2

/obj/structure/religious/animal_statue/New()
	..()
	var/randimg = pick("bear","mouse","goose","wolf","turkey","monkey")
	icon_state = randimg
	name = "[randimg] statue"

/obj/structure/religious/animal_statue/sandstone
	name = "砂岩雕像"
	desc = "一尊砂岩雕像."
	icon = 'icons/obj/cross.dmi'
	icon_state = "sandstone_snake"

/obj/structure/religious/animal_statue/sandstone/New()
	..()
	var/randimg = pick("sandstone_snake","sandstone_alligator","sandstone_ram","sandstone_eue")
	icon_state = randimg
	name = "[randimg] statue"

/obj/structure/religious/woodcross1
	name = "小型木制十字架"
	desc = "一个小型雕刻木制十字架."
	icon = 'icons/obj/cross.dmi'
	icon_state = "cross1"
	density = FALSE
	anchored = TRUE
	health = 50
	flammable = TRUE

/obj/structure/religious/woodcross2
	name = "木制十字架"
	desc = "一个雕刻木制十字架."
	icon = 'icons/obj/cross.dmi'
	icon_state = "cross2"
	density = FALSE
	anchored = TRUE
	health = 50
	flammable = TRUE

/obj/structure/religious/grave
	name = "敞开的坟墓"
	desc = "一座敞开的坟墓."
	icon = 'icons/obj/cross.dmi'
	icon_state = "grave_overlay"
	density = FALSE
	anchored = TRUE
	var/open = TRUE
	var/filled = 0
	not_disassemblable = TRUE
	not_movable = TRUE
/obj/structure/religious/grave/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/material/shovel) && open)
		visible_message("[user]开始填满\the [src]...","你开始填满\the [src]...")
		playsound(src,'sound/effects/shovelling.ogg',100,1)
		if (do_after(user, 100, src))
			if (open)
				to_chat(user, "你填满了\the [src].")
				open = FALSE
				icon_state = "grave_filled"
				name = "grave"
				desc = "A grave."
				for (var/obj/structure/religious/remains/RMN in src.loc)
					RMN.forceMove(src)
				for (var/obj/item/IT in src.loc)
					IT.forceMove(src)
				for (var/mob/living/ML in src.loc)
					if (ML.stat != 0)
						ML.forceMove(src)
					else
						if (istype(ML, /mob/living/human))
							var/mob/living/human/H = ML
							H.buriedalive = TRUE
							H.buried_proc()
							ML.anchored = TRUE
							if (H.client)
								H.client.perspective = EYE_PERSPECTIVE
								H.client.eye = src
						else
							ML.stat = DEAD
						ML.forceMove(src)
				for (var/obj/structure/closet/coffin/CF in src.loc)
					for (var/mob/living/human/HM in CF)
						HM.buriedalive = TRUE
						HM.buried_proc()
						if (HM.client)
							HM.client.perspective = EYE_PERSPECTIVE
							HM.client.eye = src
					CF.forceMove(src)
		else
			return
	else if (istype(W, /obj/item/weapon/material/shovel) && !open)
		user.visible_message("[user]开始挖开\the [src]...", "你开始挖开\the [src]...")
		playsound(src,'sound/effects/shovelling.ogg',100,1)
		if (do_after(user, 100, src))
			if (!open)
				to_chat(user, "你挖出了\the [src].")
				open = TRUE
				icon_state = "grave_overlay"
				name = "open grave"
				desc = "An opened grave."
				for (var/obj/structure/religious/remains/RMN in src)
					RMN.forceMove(src.loc)
				for (var/obj/item/IT in src)
					IT.forceMove(src.loc)
				for (var/obj/structure/closet/crate/CR in src)
					CR.forceMove(src.loc)
				for (var/mob/living/ML in src)
					if (ML.stat != 0)
						ML.forceMove(src.loc)
					else
						if (istype(ML, /mob/living/human))
							var/mob/living/human/H = ML
							H.buriedalive = FALSE
							ML.anchored = FALSE
							if (H.client)
								H.client.eye = H.client.mob
								H.client.perspective = MOB_PERSPECTIVE
						else
							ML.stat = DEAD
						ML.forceMove(src.loc)
				for (var/obj/structure/closet/coffin/CF in src)
					for (var/mob/living/human/HM in CF)
						HM.buriedalive = FALSE
						if (HM.client)
							HM.client.eye = HM.client.mob
							HM.client.perspective = MOB_PERSPECTIVE
					CF.forceMove(src.loc)
	if (istype(W, /obj/item/weapon/barrier) && open)
		user.visible_message("[user]把泥土扔进\the [src].", "你把泥土扔进\the [src].")
		filled++
		qdel(W)
		if (filled >= 2)
			visible_message("坟墓被覆盖了.")
			qdel(src)
			return
	else
		return

/obj/structure/religious/grave/initialize()
	..()
	if (!open)		// if closed, any item at the crate's loc is put in the contents
		var/obj/item/I
		icon_state = "grave_filled"
		for (I in loc)
			if (I.density || I.anchored || I == src) continue
			I.forceMove(src)
	update_icon()

/obj/structure/religious/impaledskull
	name = "穿刺的头骨"
	desc = "一个插在尖刺上的头骨."
	icon = 'icons/obj/structures.dmi'
	icon_state = "impaledskull"

/obj/structure/religious/tribalmask
	name = "原住民木制面具"
	desc = "一个装饰性木制面具."
	icon = 'icons/misc/tribal.dmi'
	icon_state = "tribalmask1"
	flammable = TRUE

/obj/structure/religious/remains
	name = "人类遗骸"
	desc = "一堆人类骨头.真吓人."
	icon = 'icons/misc/tribal.dmi'
	icon_state = "remains1"
	anchored = FALSE
	not_disassemblable = TRUE
	not_movable = TRUE
/obj/structure/religious/remains/New()
	..()
	icon_state = "remains[rand(1,6)]"

/obj/structure/religious/tribalmask/New()
	..()
	icon_state = "tribalmask[rand(1,2)]"

/obj/structure/religious/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	switch(W.damtype)
		if ("fire")
			health -= W.force * 0.3
		if ("brute")
			health -= W.force * 0.3

	playsound(get_turf(src), 'sound/weapons/smash.ogg', 100)
	user.do_attack_animation(src)
	try_destroy()
	..()

/obj/structure/religious/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>\The [src]碎成了碎片!</span>")
		qdel(src)
		return

/obj/structure/religious/totem/offerings
	icon = 'icons/misc/support.dmi'
	icon_state = "goose"
	bound_height = 64
	var/power = 175
	health = 100000000
	var/current_tribesmen = 0
	var/reltype = "tribal" //tribal or colony
	not_disassemblable = TRUE
	not_movable = TRUE
/obj/structure/religious/totem/offerings/proc/create_mobs()
	var/I = 0
	while(I < round(current_tribesmen/2))

		var/mob/living/simple_animal/hostile/human/skeleton/attacker_gods/newmob = new /mob/living/simple_animal/hostile/human/skeleton/attacker_gods(src.loc)
		newmob.target_loc = loc
		var/randdir = pick(1,2,3,4)
		if (randdir == 1)
			newmob.x=src.x+(rand(-15,15))
			newmob.y=src.y+(rand(12,25))
		else if (randdir == 2)
			newmob.x=src.x+(rand(-15,15))
			newmob.y=src.y+(rand(-12,-25))
		else if (randdir == 3)
			newmob.x=src.x+(rand(-12,-25))
			newmob.y=src.y+(rand(-15,15))
		else
			newmob.x=src.x+(rand(12,25))
			newmob.y=src.y+(rand(-15,15))
		if (istype(get_turf(newmob), /turf/wall) || istype (get_turf(newmob), /turf/floor/dirt/underground) || istype (get_turf(newmob), /turf/floor/beach/water/deep))
			while (istype(get_turf(newmob), /turf/wall) || istype (get_turf(newmob), /turf/floor/dirt/underground) || istype (get_turf(newmob), /turf/floor/beach/water/deep))
				if (randdir == 1)
					newmob.x=src.x+(rand(-15,15))
					newmob.y=src.y+(rand(12,25))
				else if (randdir == 2)
					newmob.x=src.x+(rand(-15,15))
					newmob.y=src.y+(rand(-12,-25))
				else if (randdir == 3)
					newmob.x=src.x+(rand(-12,-25))
					newmob.y=src.y+(rand(-15,15))
				else
					newmob.x=src.x+(rand(12,25))
					newmob.y=src.y+(rand(-15,15))
		I += 1

/obj/structure/religious/totem/offerings/proc/check_favours()
	spawn(1800)
		//very angry
		if (power < 50)
			if (weather == WEATHER_NONE)
				change_weather_somehow()
			visible_message("神明发怒了,降下暴雨!")
			if (prob(100-power))
				var/diseasedone = FALSE
				for (var/mob/living/human/HH in range(10,loc))
					if (diseasedone == FALSE)
						HH.disease = TRUE
						if (prob(99))
							HH.disease_type = "flu"
						else
							HH.disease_type = "plague"
						HH.disease_progression = 0
						diseasedone = TRUE
//				to_chat(world, "You feel a chill down your spine, something evil is close by...")
//				create_mobs()
		//angry
		else if (power >= 50 && power < 100)
			if (prob(100-power))
				visible_message("狂风暴雨摧毁了庄稼!")
				if (weather == WEATHER_NONE)
					change_weather_somehow()
				for (var/obj/structure/farming/plant/P in range(30,loc))
					P.icon_state = "[P.plant]-dead"
					P.desc = "A dead [P.plant] plant."
					P.name = "dead [P.plant] plant"
					P.stage = 11

		//neutral
		else if (power >= 100 && power < 150)
			//nothing
			to_chat(world, "")

		//pleased
		else if (power >= 150 && power < 250)
			if (prob(power/250))
				if (weather == WEATHER_WET)
					change_weather_somehow()
					visible_message("神明赐予了我们好天气!")
		//very pleased
		else if (power >= 250)
			if (weather == WEATHER_WET)
				change_weather_somehow()
			visible_message("神明赐予了我们好天气!")
			if (prob(50) && human_clients_mob_list.len>0)
				if (prob(30))
					visible_message("众神赐予我们祭品!")
					new /obj/item/weapon/reagent_containers/food/condiment/tealeaves(loc)
				else if (prob(20))
					visible_message("众神赐予我们祭品!")
					new /obj/item/weapon/reagent_containers/pill/opium(loc)
				else if (prob(20))
					visible_message("众神赐予我们祭品!")
					new /obj/item/stack/medical/splint(loc)
		if (power > 50)
			for (var/obj/effect/landmark/npctarget/TG in loc)
				qdel(TG)
		check_favours()
		return

/obj/structure/religious/totem/offerings/proc/check_power()
	spawn(600) // 1 minute
		if (reltype == "tribal")
			if (tribe == "goose")
				for (var/datum/job/indians/tribes/red/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			else if (tribe == "turkey")
				for (var/datum/job/indians/tribes/blue/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			else if (tribe == "bear")
				for (var/datum/job/indians/tribes/black/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			else if (tribe == "wolf")
				for (var/datum/job/indians/tribes/white/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			else if (tribe == "monkey")
				for (var/datum/job/indians/tribes/green/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			else if (tribe == "mouse")
				for (var/datum/job/indians/tribes/yellow/R in job_master.faction_organized_occupations)
					current_tribesmen = R.current_positions
			if (power > 0)
				power = (power-(current_tribesmen))
			var/pleasedval = "very angry!"
			if (power >= 50 && power < 100)
				pleasedval = "somewhat angry."
			if (power >= 100 && power < 150)
				pleasedval = "neutral."
			if (power >= 150 && power < 250)
				pleasedval = "somewhat pleased."
			if (power >= 250)
				pleasedval = "very pleased!"
			desc = "A [icon_state] stone totem. The gods seem to be [pleasedval]"
			check_power()
			return
		else
			current_tribesmen = human_clients_mob_list.len
			if (power > 0)
				power = (power-(2*current_tribesmen))
			var/pleasedval = "very angry!"
			if (power >= 50 && power < 100)
				pleasedval = "somewhat angry."
			if (power >= 100 && power < 150)
				pleasedval = "neutral."
			if (power >= 150 && power < 250)
				pleasedval = "somewhat pleased."
			if (power >= 250)
				pleasedval = "very pleased!"
			desc = "A big stone cross. God seem to be [pleasedval]"
			check_power()
			return

/obj/structure/religious/totem/offerings/New()
	..()
	if (reltype == "tribal")
		icon_state = tribe
		name = "[tribe] totem"
		desc = "A stone [tribe] totem."
		spawn(10)
			check_power()
			check_favours()
	else
		icon_state = "cross"
		name = "big stone cross"
		desc = "A stone cross."
		spawn(10)
			check_power()
			check_favours()

/obj/structure/religious/totem/offerings/attackby(obj/item/I as obj, mob/user as mob)
	if (power <= 1000)
		if (istype(I, /obj/item/organ/heart))
			power = (power + 75)
			if (reltype == "tribal")
				visible_message("众神接受了[user]献上的\the [I]! 他们非常满意!")
			else
				visible_message("神接受了[user]献上的\the [I]! 他非常满意!")
			new /obj/effect/effect/smoke/fast(loc)
			qdel(I)
			return
		else if (istype(I, /obj/item/stack/teeth) || istype(I, /obj/item/stack/material/tobacco_green) || istype(I, /obj/item/stack/material/tobacco))
			power = (power + (I.amount*12))
			if (reltype == "tribal")
				visible_message("众神接受了[user]献上的\the [I]! 他们很满意!")
			else
				visible_message("神接受了[user]献上的\the [I]! 他很满意!")
			new /obj/effect/effect/smoke/fast(loc)
			qdel(I)
			return
		else if (istype(I, /obj/item/weapon/reagent_containers/food/snacks))
			power = (power + 10)
			if (reltype == "tribal")
				visible_message("众神接受了[user]献上的\the [I]! 他们很满意!")
			else
				visible_message("神接受了[user]献上的\the [I]! 他很满意!")
			new /obj/effect/effect/smoke/fast(loc)
			qdel(I)
			return
	else
		if (reltype == "tribal")
			visible_message("众神拒绝了[user]献上的\the [I]. 他们暂时满足了.")
		else
			visible_message("神拒绝了[user]献上的\the [I]. 他暂时满足了.")
		return
	..()

/obj/structure/religious/totem/offerings/attack_hand(mob/user as mob)
	if (user.druggy > 10)
		var/list/display1 = list("Heal (150)", "Cancel")
		var/choice1 = WWinput(user, "Your tribe has [power] favour points. What power do you request?", "Communicating with the Gods", "Cancel", display1)
		if (choice1 == "Cancel")
			return
		if (choice1 == "Heal (150)")
			var/list/closemobs = list("Cancel")
			for (var/mob/living/M in range(3,loc))
				closemobs += M
			var/choice2 = WWinput(user, "Who to heal?", "Healing Power", "Cancel", closemobs)
			if (choice2 == "Cancel")
				return
			else
				if (power >= 150)
					var/mob/living/healed = choice2
					healed.revive()
					power = (power - 150)
					return
				else
					to_chat(user, "恩惠点数不足.")
					return
	else
		to_chat(user, "你未能与众神沟通. 你需要药物来连接星界位面.")
		return

////////////////////STATUES///////////////////////
/obj/structure/religious/statue
	name = "雕像"
	desc = "一尊人类雕像."
	icon = 'icons/obj/statue.dmi'
	icon_state = "human_male_base"
	density = TRUE
	anchored = TRUE
	layer = 3.2
	var/list/statue_layers = list()
	var/statue_material = "stone"
	New()
		..()
		spawn(1)
			if (name == "statue")
				name = "[statue_material]雕像"
				update_icon()

/obj/structure/religious/statue/update_icon()
	..()
	overlays.Cut()
	for (var/i in statue_layers)
		if (findtext(i, "cl_"))
			var/image/timg = image(icon, i)
			overlays += timg
	for (var/i in statue_layers)
		if (findtext(i, "obj_"))
			var/image/timg = image(icon, i)
			overlays += timg
	var/material/M = get_material_by_name(statue_material)
	if (M)
		color = M.icon_colour

/obj/structure/religious/statue/king
	statue_layers = list("cl_king", "obj_spear", "obj_shield2")
	statue_material = "stone"
	New()
		..()
		name = "国王"

/obj/structure/religious/statue/king/sandstone
	statue_layers = list("cl_king", "obj_spear", "obj_shield2")
	statue_material = "sandstone"
	New()
		..()
		name = "国王"
