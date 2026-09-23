/obj/roof
	name = "wood roof"
	desc = "一个木制屋顶."
	icon = 'icons/turf/roofs.dmi'
	icon_state = "wood_dm"
	var/overlay_state = "wood"
	var/passable = TRUE
	var/origin_density = FALSE
	var/not_movable = TRUE //if it can be removed by wrenches
	var/health = 100
	is_cover = TRUE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	layer = 10.1
	level = 2
	var/amount = FALSE
	var/wall = FALSE
	var/wood = TRUE
	var/onfire = FALSE
//	invisibility = 101
	flammable = TRUE
	var/current_area_type = /area/caribbean
	var/switch_area = TRUE
	var/image/roof_overlay

/obj/roof/attackby(obj/item/weapon/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(src)
	playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
	if (flammable)
		if (istype(W, /obj/item/flashlight/torch))
			var/obj/item/flashlight/torch/T = W
			if (T.on)
				health -= 15
				if (prob(30))
					new/obj/effect/fire(loc)
					visible_message(SPAN_DANGER("The roof catches fire!"))
			return
	if (istype(W, /obj/item/weapon/hammer))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "你开始移除 \the [src]...")
		if (do_after(user, 60, src) && src)
			to_chat(user, "你移除了 \the [src].")
			qdel(src)
			return
	else
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		return
	..()

/obj/roof/canopy
	name = ""
	icon_state = ""
	overlay_state = ""

/obj/roof/wood
	name = "wood roof"
	icon_state = "wood_dm"
	overlay_state = "wood"

/obj/roof/clay
	name = "clay roof"
	desc = "一个黏土瓦屋顶."
	flammable = FALSE
	overlay_state = "clay"
	icon_state = "clay_dm"

/obj/roof/clay/blue
	name = "clay roof"
	desc = "一个黑色黏土瓦屋顶."
	flammable = FALSE
	overlay_state = "blueclay"
	icon_state = "blueclay_dm"

/obj/roof/clay/black
	name = "black clay roof"
	desc = "一个黑色黏土瓦屋顶."
	flammable = FALSE
	overlay_state = "blackclay"
	icon_state = "blackclay_dm"

/obj/roof/clay/kerawa
	name = "kerawa roof"
	desc = "一个黏土瓦屋顶."
	flammable = FALSE
	overlay_state = "black_slateroof"
	icon_state = "black_slateroof_dm"

/obj/roof/concrete
	name = "concrete roof"
	desc = "一个混凝土屋顶."
	flammable = FALSE
	overlay_state = "cement"
	icon_state = "cement_dm"

/obj/roof/glass
	name = "glass roof"
	desc = "一个玻璃板屋顶."
	flammable = FALSE
	overlay_state = "glass"
	icon_state = "glass_dm"

/obj/roof/thatch
	name = "thatch roof"
	desc = "一个茅草屋顶."
	overlay_state = "thatch"
	icon_state = "thatch_dm"

/obj/roof/palm
	name = "palm leaves roof"
	desc = "一个由层叠棕榈叶制成的屋顶."
	overlay_state = "palm"
	icon_state = "palm_dm"

/obj/roof/sandstone
	name = "sandstone roof"
	desc = "一个埃及风格的砂岩屋顶."
	overlay_state = "sandstone"
	flammable = FALSE
	icon_state = "sandstone_dm"

/obj/roof/mayan
	name = "mayan roof"
	desc = "一个玛雅风格的石头屋顶."
	overlay_state = "mayan"
	flammable = FALSE
	icon_state = "mayan_dm"

/obj/roof/proc/update_transparency(var/on = TRUE) //to see through windows and stuff
	roof_overlay.alpha = 255
	spawn(1)
		if (on)
			var/turf/T = get_turf(src)
			T.recalc_atom_opacity()
			if (T.has_opaque_atom)
				roof_overlay.alpha = 255
			else
				roof_overlay.alpha = 127
		else
			roof_overlay.alpha = 255
		/*
		var/area/AA = get_area(get_turf())
		if (AA.
		for(var/turf/T in range(1,src))
			T.recalc_atom_opacity()
			if (!T.has_opaque_atom)
				var/area/A = get_area(T)
				if (A.location == AREA_INSIDE)
					roof_overlay.alpha = 127
					return FALSE
		roof_overlay.alpha = 255
		return TRUE
		*/

/obj/roof/proc/recalculate_borders(var/recalculate_others = FALSE)
	var/founddir = 0
	for (var/drr in list(NORTH,SOUTH,EAST,WEST))
		for (var/obj/roof/RF in get_step(src, drr))
			founddir+=drr
	roof_overlay.icon_state = "[overlay_state]_[founddir]"
	if (recalculate_others)
		for (var/obj/roof/R in range(1,src))
			R.recalculate_borders(FALSE)

/obj/roof/New()
	..()
	icon_state = "roof"
	roof_overlay = image(icon='icons/turf/roofs.dmi', loc = src, icon_state=overlay_state,layer=11.1)
	recalculate_borders(TRUE)
	var/area/caribbean/CURRENTAREA = get_area(src)
	var/oldclimate = CURRENTAREA.climate

	if (CURRENTAREA.type && src.switch_area)
		current_area_type = CURRENTAREA.type
		switch(oldclimate)
			if ("tundra")
				new/area/caribbean/roofed/tundra(get_turf(src))
			if ("taiga")
				new/area/caribbean/roofed/taiga(get_turf(src))
			if ("temperate")
				new/area/caribbean/roofed/temperate(get_turf(src))
			if ("sea")
				new/area/caribbean/roofed/sea(get_turf(src))
			if ("semiarid")
				new/area/caribbean/roofed/semiarid(get_turf(src))
			if ("desert")
				new/area/caribbean/roofed/desert(get_turf(src))
			if ("savanna")
				new/area/caribbean/roofed/savanna(get_turf(src))
			if ("jungle")
				new/area/caribbean/roofed/jungle(get_turf(src))

	for (var/atom/movable/lighting_overlay/LO in get_turf(src))
		LO.update_overlay()
	collapse_check()
	/*
	for(var/obj/covers/CV in loc)
		CV.opacity = FALSE
	*/
	var/turf/T = loc
	T.recalc_atom_opacity()
	if (T.has_opaque_atom)
		update_transparency(0)
	else
		for(var/obj/structure/S in range(1,src))
			var/turf/TT = get_turf(S)
			TT.recalc_atom_opacity()
			if (TT.has_opaque_atom)
				update_transparency(0)
			else if (istype(S, /obj/structure/simple_door) || istype(S, /obj/structure/curtain))
				if (S.opacity)
					update_transparency(0)
				else
					update_transparency(1)
			else if ((istype(S, /obj/structure/window) && !(istype(S, /obj/structure/window/barrier) || istype(S, /obj/structure/window/barrier/snowwall)))  || istype(S, /obj/structure/window_frame))
				var/found = FALSE
				for(var/obj/structure/SS in S.loc)
					if (istype(SS, /obj/structure/simple_door) || istype(SS, /obj/structure/curtain))
						if (SS.opacity)
							update_transparency(0)
						else
							update_transparency(1)
						found = TRUE
				if (!found)
					update_transparency(1)


	roofs_list += roof_overlay

/obj/roof/Destroy()
	new current_area_type(get_turf(src))
	for (var/atom/movable/lighting_overlay/LO in get_turf(src))
		LO.update_overlay()
	for (var/obj/roof/R in range(1,src))
		R.recalculate_borders(FALSE)
	/*
	for(var/obj/covers/CV in loc)
		CV.opacity = CV.initial_opacity
	*/
	roofs_list -= roof_overlay
	..()

/obj/roof/proc/collapse_check()
	spawn(50)
		var/supportfound = FALSE
		if (istype(src, /obj/roof/canopy))
			for (var/obj/structure/tent/TT in loc)
				supportfound = TRUE
		for (var/obj/structure/roof_support/RS in range(3, src))
			supportfound = TRUE
		for (var/obj/structure/mine_support/stone/SS in range(2, src))
			supportfound = TRUE
		for (var/turf/wall/W in range(2, src))
			supportfound = TRUE
		for (var/obj/structure/simple_door/SD in loc)
			supportfound = TRUE
		for (var/obj/covers/C in range(1, src))
			if (C.wall == TRUE)
				supportfound = TRUE
	//if no support >> roof falls down
		if (!supportfound)
			playsound(src,'sound/effects/rocksfalling.ogg',100,0,6)
			for (var/mob/living/human/M in range(1, src))
				M.adjustBruteLoss(rand(17,27))
				M.Weaken(15)
				to_chat(M, "屋顶坍塌了!")
			Destroy()
			qdel(src)

/obj/item/weapon/roofbuilder
	name = "屋顶建造器"
	desc = "用它来建造屋顶."
	icon = 'icons/turf/roofs.dmi'
	icon_state = "roof_builder"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	var/done = FALSE
	var/target_type = /obj/roof/wood

/obj/item/weapon/roofbuilder/clay
	name = "黏土屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "clay_roof_builder"
	flammable = FALSE
	target_type = /obj/roof/clay

/obj/item/weapon/roofbuilder/clay/blue
	name = "蓝色黏土屋顶材料"
	icon_state = "blueclay_roof_builder"
	target_type = /obj/roof/clay/blue

/obj/item/weapon/roofbuilder/clay/black
	name = "黑色黏土屋顶材料"
	icon_state = "blackclay_roof_builder"
	target_type = /obj/roof/clay/black

/obj/item/weapon/roofbuilder/clay/kerawa
	name = "黑色黏土屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "black_slateroof_builder"
	flammable = FALSE
	target_type = /obj/roof/clay/kerawa

/obj/item/weapon/roofbuilder/leaves
	name = "茅草屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "thatch_roof_builder"
	flammable = TRUE
	target_type = /obj/roof/thatch

/obj/item/weapon/roofbuilder/palm
	name = "棕榈屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "palm_roof_builder"
	flammable = TRUE
	target_type = /obj/roof/palm

/obj/item/weapon/roofbuilder/concrete
	name = "混凝土屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "concrete_roof_builder"
	flammable = FALSE
	target_type = /obj/roof/concrete

/obj/item/weapon/roofbuilder/glass
	name = "玻璃板屋顶材料"
	icon_state = "glass_roof_builder"
	target_type = /obj/roof/glass

/obj/item/weapon/roofbuilder/sandstone
	name = "砂岩屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "sandstone_roof_builder"
	flammable = FALSE
	target_type = /obj/roof/sandstone

/obj/item/weapon/roofbuilder/mayan
	name = "玛雅屋顶材料"
	desc = "用它来建造屋顶."
	icon_state = "mayan_roof_builder"
	flammable = FALSE
	target_type = /obj/roof/mayan

/obj/item/weapon/roofbuilder/attack_self(mob/user)
	var/your_dir = "NORTH"

	switch (user.dir)
		if (NORTH)
			your_dir = "NORTH"
		if (SOUTH)
			your_dir = "SOUTH"
		if (EAST)
			your_dir = "EAST"
		if (WEST)
			your_dir = "WEST"

	var/covers_time = 80

	if (ishuman(user))
		var/mob/living/human/H = user
		covers_time /= H.getStatCoeff("strength")
		covers_time /= (H.getStatCoeff("crafting") * H.getStatCoeff("crafting"))
	var/area/currentarea = get_area(get_step(user, user.dir))
	if (istype(currentarea, /area/caribbean/no_mans_land/invisible_wall))
		to_chat(user, "你无法在这里建造屋顶.")
		return
	for (var/obj/roof/RF in get_step(user, user.dir))
		to_chat(user, "该区域已经有屋顶了!")
		return
	var/confirm = FALSE
	for(var/obj/structure/roof_support/RS in range(3, get_step(user, user.dir)))
		confirm = TRUE
	for(var/obj/structure/mine_support/stone/SS in range(2, get_step(user, user.dir)))
		confirm = TRUE
	for(var/obj/covers/CV in range(1, get_step(user, user.dir)))
		if (CV.wall)
			confirm = TRUE
	if (!confirm)
		to_chat(user, "该区域没有屋顶支撑! 请先建造一个!")
		return
	if (WWinput(user, "This will start building a roof [your_dir] of you.", "Roof Construction", "Continue", list("Continue", "Stop")) == "Continue")
		visible_message(SPAN_DANGER("[user] starts building the roof."))
		visible_message(user, SPAN_DANGER("You start building the roof."))
		if (do_after(user, covers_time, user.loc) && src && !done)
			for (var/obj/roof/RF in get_step(user, user.dir))
				to_chat(user, "该区域已经有屋顶了!")
				return
			done = TRUE
			new target_type(get_step(user, user.dir), user)
			visible_message(SPAN_DANGER("[user] finishes building the roof."))

			if (ishuman(user))
				var/mob/living/human/H = user
				H.adaptStat("crafting", 1)
			qdel(src)
		return

/obj/structure/roof_support
	name = "屋顶支撑"
	desc = "一根粗木梁, 用于支撑大型建筑的屋顶."
	icon_state = "support_h"
	flammable = TRUE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	var/health = 100
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/roof_support/admin
	name = "屋顶支撑"
	desc = ""
	icon = 'icons/turf/roofs.dmi'
	icon_state = "roof2"
	flammable = FALSE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

	New()
		..()
		icon_state = "roof"

/obj/structure/roof_support/nordic
	name = "北欧柱"
	desc = "一根北欧风格的粗木梁. 用于支撑大型建筑的屋顶."
	icon_state = "nordic_pillar"

/obj/structure/roof_support/bamboo
	name = "竹柱"
	desc = "一根北欧风格的粗竹梁. 用于支撑大型建筑的屋顶."
	icon_state = "bamboo_support"

/obj/structure/mine_support
	name = "矿用支撑"
	desc = "一组用于支撑矿井的木质支架. 可防止塌方."
	icon_state = "support_v"
	flammable = TRUE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	var/health = 100
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/mine_support/stone
	name = "石柱"
	desc = "一根可以支撑屋顶和矿井的石柱."
	icon_state = "support_st1"
	flammable = FALSE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	health = 180
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/mine_support/stone/concrete
	name = "混凝土柱"
	desc = "一根可以支撑屋顶和矿井的混凝土柱."
	icon_state = "concrete_pillar"
	flammable = FALSE
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	health = 220
	not_movable = TRUE
	not_disassemblable = TRUE

/* Stone Pillar Subtypes*/

/obj/structure/mine_support/stone/marble
	name = "大理石柱"
	desc = "一根可以支撑屋顶和矿井的大理石柱."
	icon_state = "marble_support_st1"

/obj/structure/mine_support/stone/sandstone
	name = "砂岩柱"
	desc = "一根可以支撑屋顶和矿井的砂岩柱."
	icon_state = "sandstone_support_st1"

/obj/structure/mine_support/stone/obsidian
	name = "黑曜石柱"
	desc = "一根可以支撑屋顶和矿井的黑曜石柱."
	icon_state = "obsidian_support_st1"

/* Ionic Pillars*/

/obj/structure/mine_support/stone/ionic
	name = "爱奥尼柱"
	desc = "一根可以支撑屋顶和矿井的大理石爱奥尼式柱."
	icon_state = "column_ionic"

/obj/structure/mine_support/stone/ionic/rock
	name = "石制爱奥尼柱"
	desc = "一根可以支撑屋顶和矿井的石制爱奥尼式柱."
	icon_state = "stone_column_ionic"

/obj/structure/mine_support/stone/ionic/sandstone
	name = "砂岩爱奥尼柱"
	desc = "一根可以支撑屋顶和矿井的砂岩爱奥尼式柱."
	icon_state = "sandstone_column_ionic"

/obj/structure/mine_support/stone/ionic/obsidian
	name = "黑曜石爱奥尼柱"
	desc = "一根可以支撑屋顶和矿井的黑曜石爱奥尼式柱."
	icon_state = "obsidian_column_ionic"

/* Solomonic Pillars*/

/obj/structure/mine_support/stone/solomonic
	name = "所罗门柱"
	desc = "一根可以支撑屋顶和矿井的所罗门式柱."
	icon_state = "column_solomonic1"

/obj/structure/mine_support/stone/solomonic/rock
	name = "石制所罗门柱"
	desc = "一根可以支撑屋顶和矿井的石制所罗门式柱."
	icon_state = "stone_column_solomonic1"

/obj/structure/mine_support/stone/solomonic/sandstone
	name = "砂岩所罗门柱"
	desc = "一根可以支撑屋顶和矿井的砂岩所罗门式柱."
	icon_state = "sandstone_column_solomonic1"

/obj/structure/mine_support/stone/solomonic/obsidian
	name = "黑曜石所罗门柱"
	desc = "一根可以支撑屋顶和矿井的黑曜石所罗门式柱."
	icon_state = "obsidian_column_solomonic1"

/obj/structure/mine_support/stone/solomonic/thick
	name = "所罗门柱"
	desc = "一根可以支撑屋顶和矿井的所罗门式柱."
	icon_state = "column_solomonic2"

/obj/structure/mine_support/stone/solomonic/thick/rock
	name = "石制所罗门柱"
	desc = "一根可以支撑屋顶和矿井的石制所罗门式柱."
	icon_state = "stone_column_solomonic2"

/obj/structure/mine_support/stone/solomonic/thick/sandstone
	name = "砂岩所罗门柱"
	desc = "一根可以支撑屋顶和矿井的砂岩所罗门式柱."
	icon_state = "sandstone_column_solomonic2"

/obj/structure/mine_support/stone/solomonic/thick/obsidian
	name = "黑曜石所罗门柱"
	desc = "一根可以支撑屋顶和矿井的黑曜石所罗门式柱."
	icon_state = "obsidian_column_solomonic2"

/* Cultural Pillars*/

/obj/structure/mine_support/stone/aztec
	name = "阿兹特克柱"
	desc = "一根可以支撑屋顶和矿井的阿兹特克式柱."
	icon_state = "aztec_pillar"

/obj/structure/mine_support/stone/aztec/marble
	name = "大理石阿兹特克柱"
	desc = "一根可以支撑屋顶和矿井的大理石阿兹特克式柱."
	icon_state = "marble_aztec_pillar"

/obj/structure/mine_support/stone/aztec/sandstone
	name = "砂岩阿兹特克柱"
	desc = "一根可以支撑屋顶和矿井的砂岩阿兹特克式柱."
	icon_state = "sandstone_aztec_pillar"

/obj/structure/mine_support/stone/aztec/obsidian
	name = "黑曜石阿兹特克柱"
	desc = "一根可以支撑屋顶和矿井的黑曜石阿兹特克式柱."
	icon_state = "obsidian_aztec_pillar"

/obj/structure/mine_support/stone/egyptian
	name = "埃及柱"
	desc = "一根可以支撑屋顶和矿井的埃及式柱."
	icon_state = "egyptian_pillar"

/obj/structure/mine_support/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
		user.do_attack_animation(src)
		try_destroy()
	..()

/obj/structure/mine_support/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>[src]碎成了碎片!</span>")
		Destroy()
		return

/obj/structure/roof_support/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		switch(W.damtype)
			if ("fire")
				health -= W.force * TRUE
			if ("brute")
				health -= W.force * 0.20
		playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100)
		user.do_attack_animation(src)
		try_destroy()
	..()

/obj/structure/roof_support/proc/try_destroy()
	if (health <= 0)
		visible_message("<span class='danger'>[src]碎成了碎片!</span>")
		Destroy()
		return

/obj/structure/roof_support/Destroy()
	for(var/obj/roof/R in range(3,get_turf(src)))
		R.collapse_check()
	..()

/obj/structure/mine_support/Destroy()
	if (istype(get_turf(src), /turf/floor))
		for(var/turf/floor/T in range(3,get_turf(src)))
			T.collapse_check()
	..()