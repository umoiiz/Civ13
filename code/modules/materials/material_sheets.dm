#define SHEET_MATERIAL_AMOUNT 2000
// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_NORMAL
	throw_speed = 3
	throw_range = 3
	max_amount = 50
	can_stack = TRUE
	var/default_type = DEFAULT_WALL_MATERIAL
	var/material/material
	var/apply_colour //temp pending icon rewrite
	icon = 'icons/obj/materials.dmi'

/obj/item/stack/material/New()
	..()
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	if (!default_type)
		default_type = DEFAULT_WALL_MATERIAL
	material = get_material_by_name("[default_type]")
	if (material)
		recipes = material.get_recipes_civs(forced=TRUE)
		stacktype = material.stack_type
		if (apply_colour)
			color = material.icon_colour
		/* // NEVER USED!
		if (material.conductive)
			flags |= CONDUCT
		*/
		matter = material.get_matter()
	update_strings()
	return TRUE

/obj/item/stack/material/get_material()
	return material

/obj/item/stack/material/update_strings()
	// Update from material datum.
	if (material)
		singular_name = material.sheet_singular_name
		if (amount>1)
			name = "[material.use_name] [material.sheet_plural_name]"
			desc = "A stack of [material.use_name] [material.sheet_plural_name]."
			gender = PLURAL
		else
			name = "[material.use_name] [material.sheet_singular_name]"
			desc = "A [material.sheet_singular_name] of [material.use_name]."
			gender = NEUTER

/obj/item/stack/material/use(var/used)
	. = ..()
	update_icon()
	update_strings()
	return

/obj/item/stack/material/transfer_to(obj/item/stack/S, var/tamount=null, var/type_verified)
	var/obj/item/stack/material/M = S
	if (!M || !istype(M, /obj/item/stack/material) || !M.material)
		return FALSE
	if (!istype(M) || material.name != M.material.name)
		return FALSE
	var/transfer = ..(S,tamount,1)
	if (src) update_strings()
	if (M) M.update_strings()
	return transfer

/obj/item/stack/material/attack_self(var/mob/user)
//	if (!material.build_windows(user, src))
	update_icon()
	..()

/obj/item/stack/material/attackby(var/obj/item/W, var/mob/user)
	if (istype(W, /obj/item/stack/rods))
		material.build_rod_product(user, W, src)
		update_icon()
		return
	..()

/obj/item/stack/material/iron
	name = "铁"
	icon_state = "sheet-iron"
	default_type = "iron"
	apply_colour = TRUE
	value = 3
	flags = CONDUCT

/obj/item/stack/material/iron/New()
	update_icon()
	return ..()

/obj/item/stack/material/iron/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-iron[icon_suffix]"

/obj/item/stack/material/iron/twentyfive
	amount = 25

/obj/item/stack/material/barbwire
	name = "铁丝网"
	icon_state = "barbwire_stack"
	default_type = "barbedwire"
	value = 2
	flags = CONDUCT

/obj/item/stack/material/barbwire/ten
	name = "铁丝网"
	icon_state = "barbwire_stack"
	default_type = "barbedwire"
	value = 2
	amount = 10

/obj/item/stack/material/barbwire/twnt
	amount = 20
/obj/item/stack/material/bronze
	name = "青铜"
	icon_state = "sheet-bronze"
	default_type = "bronze"
	apply_colour = TRUE
	value = 2
	flags = CONDUCT

/obj/item/stack/material/bronze/New()
	update_icon()
	return ..()

/obj/item/stack/material/bronze/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-bronze[icon_suffix]"

/obj/item/stack/material/copper
	name = "铜"
	icon_state = "sheet-copper"
	default_type = "copper"
	apply_colour = TRUE
	value = 1
	flags = CONDUCT

/obj/item/stack/material/copper/New()
	update_icon()
	return ..()

/obj/item/stack/material/copper/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-copper[icon_suffix]"

/obj/item/stack/material/tin
	name = "锡"
	icon_state = "sheet-tin"
	default_type = "tin"
	apply_colour = TRUE
	value = 3
	flags = CONDUCT

/obj/item/stack/material/tin/New()
	update_icon()
	return ..()

/obj/item/stack/material/tin/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-tin[icon_suffix]"

/obj/item/stack/material/plastic
	name = "塑料"
	icon_state = "sheet-plastic"
	default_type = "plastic"
	apply_colour = TRUE
	value = 3

/obj/item/stack/material/plastic/New()
	update_icon()
	return ..()

/obj/item/stack/material/plastic/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-plastic[icon_suffix]"

/obj/item/stack/material/lead
	name = "铅"
	icon_state = "sheet-lead"
	default_type = "lead"
	apply_colour = TRUE
	value = 3
	flags = CONDUCT

/obj/item/stack/material/lead/New()
	update_icon()
	return ..()

/obj/item/stack/material/lead/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-lead[icon_suffix]"

/obj/item/stack/material/sandstone
	name = "砂岩"
	icon_state = "sheet-sandstone"
	default_type = "sandstone"
	value = 2

/obj/item/stack/material/sandstone/New()
	update_icon()
	return ..()

/obj/item/stack/material/sandstone/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 32)
			icon_suffix = "_2"
		if (33 to INFINITY)
			icon_suffix = "_3"
	icon_state = "sheet-sandstone[icon_suffix]"

/obj/item/stack/material/stone
	name = "石块"
	icon_state = "sheet-stone"
	default_type = "stone"
	value = 2

/obj/item/stack/material/stonebrick
	name = "石砖"
	icon_state = "sheet-stonebrick"
	default_type = "stonebrick"
	value = 1

/obj/item/stack/material/stonebrick/New()
	update_icon()
	return ..()

/obj/item/stack/material/stonebrick/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 32)
			icon_suffix = "_2"
		if (33 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-stonebrick[icon_suffix]"

/obj/item/stack/material/clay
	name = "黏土块"
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "claylump"
	default_type = "clay"
	value = 2

/obj/item/stack/material/clay/New()
	update_icon()
	return ..()

/obj/item/stack/material/clay/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "claylump[icon_suffix]"

/obj/item/stack/material/clay/attackby(obj/item/W as obj, mob/user as mob)
	if (map.ID == MAP_GULAG13)
		if (!istype(W)) return//I really don't understand why this check is needed
		if (istype(W, /obj/item/weapon/key/soviet/guard))
			to_chat(user, "<span class='notice'>你将黏土制成钥匙的模具.</span>")
			new/obj/item/weapon/clay/mold/key(user.loc)
			qdel(src)
	if (istype(W, type))
		var/obj/item/stack/S = W
		merge(S)
		S.update_icon()
		src.update_icon()
		spawn(0) //give the stacks a chance to delete themselves if necessary
			if (S && usr.using_object == S)
				S.interact(usr)
			if (src && usr.using_object == src)
				interact(usr)

/obj/item/stack/material/electronics
	name = "电子电路"
	icon_state = "sheet-electronics"
	default_type = "electronic"
	value = 5
	flags = CONDUCT

/obj/item/stack/material/marble
	name = "大理石块"
	icon_state = "sheet-marble"
	default_type = "marble"
	value = 3

/obj/item/stack/material/marble/New()
	update_icon()
	return ..()

/obj/item/stack/material/marble/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 33)
			icon_suffix = "_2"
		if (34 to INFINITY)
			icon_suffix = "_3"
	icon_state = "sheet-marble[icon_suffix]"

/obj/item/stack/material/diamond
	name = "钻石"
	icon_state = "sheet-diamond"
	default_type = "diamond"
	value = 40
	w_class = ITEM_SIZE_TINY

/obj/item/stack/material/obsidian
	name = "黑曜石"
	icon_state = "sheet-obsidian"
	default_type = "obsidian"
	value = 7
	w_class = ITEM_SIZE_TINY

/obj/item/stack/material/rope
	name = "绳子"
	icon_state = "rope"
	default_type = "rope"
	value = 2
	flammable = TRUE

/obj/item/stack/material/hemp
	name = "大麻"
	icon_state = "hemp"
	default_type = "hemp"
	value = 2
	flammable = TRUE
	is_contraband = TRUE

/obj/item/stack/material/flax
	name = "亚麻"
	icon_state = "flax"
	default_type = "flax"
	value = 2
	flammable = TRUE

/obj/item/stack/material/leaf
	name = "叶子"
	icon = 'icons/obj/items.dmi'
	icon_state = "leaves1"
	default_type = "leaf"
	value = 0
	flammable = TRUE
	var/decay = 0
	var/decaytimer = 0
	decay = 80*600

/obj/item/stack/material/leaf/New()
	..()
	food_decay()

/obj/item/stack/material/leaf/proc/food_decay()
	spawn(600) // 1 minute
		if (decay == 0)
			return
		if (istype(loc, /obj/structure/vending))
			food_decay()
			return
		if (istype(loc, /obj/structure/closet/fridge))
			var/obj/structure/closet/fridge/F = loc
			if (F.powersource && F.powersource.powered)
				decaytimer += 100 //much slower
			else
				decaytimer += 300
		else if (isturf(loc) && !findtext(src.name, "canned")) //if on the floor (i.e. not stored inside something), decay faster
			decaytimer += 600
		else if (!istype(loc, /obj/item/weapon/can) && !findtext(src.name, "canned")) //if not canned, since canned food doesn't spoil
			decaytimer += 300
		if (istype(loc, /obj/item/weapon/can))
			var/obj/item/weapon/can/C = loc
			if (C.open)
				decaytimer += 300
		if (decaytimer >= decay)
			qdel(src)
			return
		else
			food_decay()
			return

/obj/item/stack/material/leaf/palm
	name = "棕榈"
	icon = 'icons/obj/items.dmi'
	icon_state = "palm_leaves"
	default_type = "palm"
	value = 0
	flammable = TRUE
	decay = 80*600

/obj/item/stack/material/leaf/fern
	name = "蕨类"
	icon = 'icons/obj/items.dmi'
	icon_state = "fernleaf1"
	default_type = "fern"
	value = 0
	flammable = TRUE

/obj/item/stack/material/leaves/fern/New()
		..()
		icon_state = pick("fernleaves1","fernleaves2")

/obj/item/stack/material/tobacco_green
	name = "新鲜烟叶"
	icon_state = "tobacco_green"
	default_type = "tobacco"
	value = 2
	w_class = ITEM_SIZE_TINY
	dried_type = /obj/item/stack/material/tobacco
	dry_size = 9

/obj/item/stack/material/tobacco_green/New()
	update_icon()
	return ..()

/obj/item/stack/material/tobacco_green/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 32)
			icon_suffix = "_2"
		if (33 to 50)
			icon_suffix = "_3"
	icon_state = "tobacco_green[icon_suffix]"

/obj/item/stack/material/tobacco
	name = "干燥烟叶"
	icon_state = "tobacco"
	default_type = "tobacco"
	value = 3
	w_class = ITEM_SIZE_TINY
	flammable = TRUE

/obj/item/stack/material/tobacco/New()
	update_icon()
	return ..()

/obj/item/stack/material/tobacco/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 32)
			icon_suffix = "_2"
		if (33 to 50)
			icon_suffix = "_3"
	icon_state = "tobacco[icon_suffix]"

/obj/item/stack/material/coca
	name = "古柯叶"
	desc = "可用于制作可卡因."
	icon_state = "coca"
	default_type = "coca"
	value = 2
	w_class = ITEM_SIZE_TINY
	flammable = TRUE

/obj/item/stack/material/poppy
	name = "罂粟"
	desc = "干燥的鸦片罂粟.可提取鸦片."
	icon_state = "poppy"
	default_type = "poppy"
	value = 5
	w_class = ITEM_SIZE_TINY
	flammable = TRUE

/obj/item/stack/material/straw
	name = "稻草"
	icon_state = "sheet-straw"
	default_type = "straw"
	value = 3
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/rope/attackby(var/obj/item/W, var/mob/M)
	if (anchored)
		return FALSE
	else
		return ..()

/obj/item/stack/material/rope/attack_hand(var/mob/M)
	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.hand && H.l_hand && H.l_hand.type == /obj/item/stack/material/rope)
			return
		else if (!H.hand && H.r_hand && H.r_hand.type == /obj/item/stack/material/rope)
			return
		var/obj/rope = new /obj/item/stack/material/rope
		rope.anchored = FALSE
		if (H.put_in_any_hand_if_possible(rope, prioritize_active_hand = TRUE))
			--amount
			visible_message("<span class = 'warning'>[H]从绳堆中取出一卷绳子.</span>")
			if (amount < 1)
				qdel(src)

/obj/item/stack/material/gold
	name = "金"
	icon_state = "sheet-gold"
	default_type = "gold"
	value = 40
	flags = CONDUCT

/obj/item/stack/material/gold/New()
	update_icon()
	return ..()

/obj/item/stack/material/gold/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-gold[icon_suffix]"

/obj/item/stack/material/silver
	name = "银"
	icon_state = "sheet-silver"
	default_type = "silver"
	value = 20
	flags = CONDUCT

/obj/item/stack/material/silver/New()
	update_icon()
	return ..()

/obj/item/stack/material/silver/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-silver[icon_suffix]"

/obj/item/stack/material/steel
	name = "钢"
	icon_state = "sheet-metal"
	default_type = "steel"
	value = 5
	max_amount = 2000
	flags = CONDUCT

/obj/item/stack/material/steel/New()
	update_icon()
	return ..()

/obj/item/stack/material/steel/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-metal[icon_suffix]"

/obj/item/stack/material/steel/twentyfive
	amount = 25

/obj/item/stack/material/wood
	name = "木板"
	icon_state = "logs"
	default_type = "wood"
	dropsound = 'sound/effects/drop_wood.ogg'
	value = 1
	flammable = TRUE
	var/onfire = FALSE
	var/ash_production = FALSE
	var/splitting_in_progress = FALSE
	
/obj/item/stack/material/wood/New()
	update_icon()
	return ..()

/obj/item/stack/material/wood/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "logs[icon_suffix]"

/obj/item/stack/material/wood/twentyfive
	amount = 25

/obj/item/stack/material/wood/proc/start_fire()
	var/burn_time = amount * 1
	var/old_amount = amount
	if (onfire)
		var/obj/effect/fire/NF = new/obj/effect/fire(src.loc)
		spawn(burn_time)
			for(var/i = 0, i < old_amount, i++)
				new/obj/item/wood_ash(src.loc)
			qdel(NF)
			qdel(src)

/obj/item/stack/material/wood/attackby(obj/item/T as obj, mob/living/human/user as mob)
	if (istype(T, /obj/item/flashlight/torch))
		var/obj/item/flashlight/torch/F = T
		if(user.a_intent == "harm" && F.on && !onfire)
			user.visible_message(SPAN_RED("[user.name] tries to set \the [src] on fire!"), SPAN_RED("You try to set \the [src] on fire!"))
			if(prob(30))
				ash_production = 1
				src.onfire = 1
				start_fire()
				user.visible_message(SPAN_RED("[user.name] sets \the [src] on fire!"), SPAN_RED("You set \the [src] on fire!"))
				return
	if (istype(T, /obj/item/weapon/material/hatchet))
		// var/obj/item/weapon/material/hatchet/SH = T
		// Check if there's enough material
		if (src.amount < 2)
			to_chat(user, "你没有足够的材料来尝试.")
			return
		// Check if splitting process is already in progress
		if (splitting_in_progress)
			to_chat(user, SPAN_WARNING("\The [src] are already being split."))
			return
		// Set splitting_in_progress to TRUE to indicate the process has started
		splitting_in_progress = TRUE

		// Start the splitting process
		user.visible_message("[user.name]开始用\the [T]将\the [src]雕刻成木板.", "你开始将\the [src]雕刻成木板.")
		playsound(loc, 'sound/effects/woodfile.ogg', 100, TRUE)
		
		// Set a delay for the splitting process
		if (!do_after(user, (80/(user.getStatCoeff("strength"))), src)) // Was originally dividing by SH.chopping_speed after getstatcoeff but the flint hatchet has a faster chopping_speed than an iron one. TODO: refactor the speeds.
			splitting_in_progress = FALSE // In case we abort mid-way.
			return
		// Finish the splitting process
		user.visible_message("[user.name]将\the [src]雕刻成了木板.", "你将\the [src]雕刻成了木板.")
		src.use(2)
		var/obj/item/stack/material/woodplank/dropwood = new /obj/item/stack/material/woodplank(get_turf(user)) 
		dropwood.amount = 1 // You might expect to obtain anywhere from 2 to 4 planks from a single log. TODO: skill-based plank output
		dropwood.update_strings() 
		splitting_in_progress = FALSE // Reset the variable to FALSE after the splitting process is complete
	if (istype(T, /obj/item/weapon/saw))
		// Check if there's enough material
		if (src.amount < 1)
			to_chat(user, "你没有足够的木板来锯.")
			return
		// Check if splititng process is already in progress
		if (splitting_in_progress)
			to_chat(user, SPAN_WARNING("\The [src] are already being sawed."))
			return
		// Set splitting_in_progress to TRUE to indicate the process has started
		splitting_in_progress = TRUE

		// Start the splitting process
		user.visible_message("[user.name]开始用\the [T]将\the [src]锯成木板.", "你开始将\the [src]锯成木板.")
		playsound(loc, 'sound/effects/woodfile.ogg', 100, TRUE)
		
		// Set a delay for the splitting process
		if (!do_after(user, (60/(user.getStatCoeff("strength"))), src))
			splitting_in_progress = FALSE // In case we abort mid-way.
			return
		// Finish the splitting process
		user.visible_message("[user.name]将\the [src]锯成了木板.", "你将\the [src]锯成了木板.")
		src.use(1)
		var/obj/item/stack/material/woodplank/dropwood = new /obj/item/stack/material/woodplank(get_turf(user)) 
		dropwood.amount = 4
		dropwood.update_strings() 
		splitting_in_progress = FALSE // Reset the variable to FALSE after the splitting process is complete
	return ..()

/obj/item/stack/material/woodplank
	name = "柔软"
	icon_state = "sheet-wood"
	default_type = "woodplank"
	dropsound = 'sound/effects/drop_wood.ogg'
	value = 2
	flammable = TRUE
	max_amount = 200
	var/base_icon = "sheet-wood"
	var/onfire = FALSE
	var/ash_production = FALSE

/obj/item/stack/material/woodplank/twentyfive
	amount = 25

/obj/item/stack/material/woodplank/proc/start_fire()
	var/burn_time = amount * 1
	var/old_amount = amount
	if (onfire)
		var/obj/effect/fire/NF = new/obj/effect/fire(src.loc)
		spawn(burn_time)
			for(var/i = 0, i < old_amount, i++)
				new/obj/item/wood_ash(src.loc)
			qdel(NF)
			qdel(src)

/obj/item/stack/material/woodplank/attackby(obj/item/T as obj, mob/user as mob)
	if (istype(T, /obj/item/flashlight/torch))
		var/obj/item/flashlight/torch/F = T
		if(user.a_intent == "harm" && F.on && !onfire)
			visible_message("<span class = 'red'>[user.name]试图点燃[src].</span>")
			if(prob(30))
				ash_production = 1
				src.onfire = 1
				start_fire()
				visible_message("<span class = 'red'>[user.name]点燃了[src].</span>")
				return
	return ..()

/obj/item/stack/material/woodplank/update_icon()
	if (amount >= 50)
		icon_state = "[base_icon]-50"
	else if (amount >= 100)
		icon_state = "[base_icon]-100"
	else if (amount >= 150)
		icon_state = "[base_icon]-150"
	else if (amount >= 200)
		icon_state = "[base_icon]-200"
	else
		icon_state = "[base_icon]"

/obj/item/stack/material/woodplank/New()
	..()
	update_icon()

/obj/item/stack/material/bamboo
	name = "竹捆"
	icon_state = "sheet-bamboo"
	default_type = "bamboo"
	dropsound = 'sound/effects/drop_wood.ogg'
	value = 1
	flammable = TRUE

/obj/item/stack/material/cotton
	name = "棉花堆"
	icon_state = "sheet-cotton"
	default_type = "cotton"
	value = 2
	flammable = TRUE

/obj/item/stack/material/cloth
	name = "布料"
	icon_state = "sheet-cloth"
	default_type = "cloth"
	value = 3
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/cloth/New()
	update_icon()
	return ..()

/obj/item/stack/material/cloth/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-cloth[icon_suffix]"

/obj/item/stack/material/rettedfabric
	name = "沤制织物"
	icon_state = "sheet-rettedfabric"
	default_type = "rettedfabric"
	value = 1
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/rawkevlar
	name = "生凯夫拉"
	icon_state = "sheet-rawkevlar"
	default_type = "rawkevlar"
	value = 1
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/preparedkevlar
	name = "加工凯夫拉"
	icon_state = "sheet-preparedkevlar"
	default_type = "preparedkevlar"
	value = 1
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/kevlar
	name = "凯夫拉片"
	icon_state = "sheet-kevlar"
	default_type = "kevlar"
	value = 15
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/rags
	name = "破布"
	icon = 'icons/obj/trash.dmi'
	icon_state = "rag"
	default_type = "rags"
	value = 0.5
	w_class = ITEM_SIZE_TINY
	flammable = TRUE

/obj/item/stack/material/wool
	name = "羊毛堆"
	icon_state = "woolpile"
	default_type = "wool"
	value = 2
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/woolcloth
	name = "羊毛布"
	icon_state = "wool_roll"
	default_type = "woolcloth"
	value = 3
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/leather
	name = "皮革"
	desc = "生物研磨的副产品."
	icon_state = "sheet-leather"
	default_type = "leather"
	value = 2
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	
/obj/item/stack/material/leather/New()
	update_icon()
	return ..()

/obj/item/stack/material/leather/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 16)
			icon_suffix = ""
		if (17 to 33)
			icon_suffix = "_2"
		if (34 to INFINITY)
			icon_suffix = "_3"
	icon_state = "sheet-leather[icon_suffix]"

/*
/obj/item/stack/material/scales/gator_scale  //placeholder for alternative scaly hide crafting
	name = "alligator scales"
	desc = "The fine scales of a alligator."
	icon_state = "sheet-scales"
	default_type = "alligator scales"
	value = 2
	w_class = ITEM_SIZE_SMALL
	flammable = FALSE
*/

/obj/item/stack/material/pelt
	name = "动物毛皮"
	desc = "从动物身上剥下的毛皮."
	icon_state = "sheet-bearpelt"
	default_type = "pelt"
	value = 3
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/pelt/bearpelt/black
	name = "黑熊皮"
	desc = "从熊身上剥下的毛皮."
	icon_state = "sheet-bearpelt"
	default_type = "bearpelt"
	value = 3
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/pelt/bearpelt/brown
	name = "棕熊皮"
	desc = "从熊身上剥下的毛皮."
	icon_state = "sheet-brownbearpelt"
	default_type = "brownbearpelt"
	value = 3

/obj/item/stack/material/pelt/bearpelt/white
	name = "白熊皮"
	desc = "从熊身上剥下的毛皮."
	icon_state = "sheet-whitebearpelt"
	default_type = "whitebearpelt"
	value = 3

/obj/item/stack/material/pelt/wolfpelt
	name = "狼皮"
	desc = "从狼身上剥下的毛皮."
	icon_state = "sheet-wolfpelt"
	default_type = "wolfpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/wolfpelt/white
	name = "白狼皮"
	desc = "从白狼身上剥下的毛皮."
	icon_state = "sheet-whitewolfpelt"
	default_type = "whitewolfpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/catpelt
	name = "猫皮"
	desc = "从猫身上剥下的毛皮."
	icon_state = "sheet-catpelt"
	default_type = "catpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3
/obj/item/stack/material/pelt/pantherpelt
	name = "黑豹皮"
	desc = "从黑豹身上剥下的毛皮."
	icon_state = "sheet-pantherpelt"
	default_type = "pantherpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/lionpelt
	name = "狮皮"
	desc = "从狮子身上剥下的毛皮."
	icon_state = "sheet-lionpelt"
	default_type = "lionpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/gatorpelt
	name = "鳄鱼皮"
	desc = "从短吻鳄身上剥下的毛皮."
	icon_state = "sheet-gatorpelt"
	default_type = "gatorpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = FALSE
	value = 3

/obj/item/stack/material/pelt/lizardpelt
	name = "蜥蜴皮"
	desc = "从蜥蜴身上剥下的毛皮."
	icon_state = "sheet-lizardpelt"
	default_type = "lizardpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = FALSE
	value = 3

/obj/item/stack/material/pelt/monkeypelt
	name = "猴皮"
	desc = "从猴子身上剥下的毛皮."
	icon_state = "sheet-monkeypelt"
	default_type = "monkeypelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/foxpelt
	name = "狐狸皮"
	desc = "从狐狸身上剥下的毛皮."
	icon_state = "sheet-foxpelt"
	default_type = "foxpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3
/obj/item/stack/material/pelt/foxpelt/white
	name = "白狐皮"
	desc = "从白狐身上剥下的毛皮."
	icon_state = "sheet-whitefoxpelt"
	default_type = "whitefoxpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 3

/obj/item/stack/material/pelt/sheeppelt
	name = "羊皮"
	desc = "从绵羊身上剥下的毛茸茸的毛皮."
	icon_state = "sheet-sheeppelt"
	default_type = "sheeppelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 2

/obj/item/stack/material/pelt/goatpelt
	name = "山羊皮"
	desc = "一张剥下的山羊皮."
	icon_state = "sheet-goatpelt"
	default_type = "goatpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 2

/obj/item/stack/material/pelt/cowpelt
	name = "牛皮"
	desc = "一张剥下的牛皮."
	icon_state = "sheet-cowpelt"
	default_type = "cowpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 5

/obj/item/stack/material/pelt/bisonpelt
	name = "野牛皮"
	desc = "一张剥下的野牛皮."
	icon_state = "sheet-bisonpelt"
	default_type = "bisonpelt"
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE
	value = 15

/obj/item/stack/material/pelt/orcpelt
	name = "兽人皮"
	desc = "兽人的皮肤"
	icon_state = "sheet-orcpelt"
	default_type = "orcpelt"
	value = 0
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/pelt/humanpelt
	name = "人皮"
	desc = "一张死人的皮."
	icon_state = "sheet-humanpelt"
	default_type = "humanpelt"
	value = 0
	w_class = ITEM_SIZE_SMALL
	flammable = TRUE

/obj/item/stack/material/pelt/humanpelt/New()
	..()
	if (map && !map.civilizations)
		qdel(src)

/obj/item/stack/material/pelt/antpelt
	name = "蚂蚁皮"
	desc = "一只死蚂蚁的皮."
	icon_state = "sheet-antpelt"
	default_type = "ant"
	flammable = TRUE
	value = 4
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/chitin
	name = "甲壳素"
	desc = "三叶虫...和蚂蚁的甲壳"
	icon_state = "chitin_material"
	default_type = "chitin"
	flammable = TRUE
	value = 4
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/pelt/orcpelt
	name = "兽人皮"
	desc = "粗糙的皮肤,像一块有弹性的石头..."
	icon_state = "sheet-orcpelt"
	default_type = "orcpelt"
	flammable = TRUE
	value = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/pelt/gorillapelt
	name = "大猩猩皮"
	desc = "一张死大猩猩的皮."
	icon_state = "sheet-gorillapelt"
	default_type = "gorillapelt"
	flammable = TRUE
	value = 3
	w_class = ITEM_SIZE_SMALL

/obj/item/stack/material/glass
	name = "玻璃"
	icon_state = "sheet-glass"
	default_type = "glass"
	dropsound = 'sound/effects/drop_glass.ogg'
	value = 3

/obj/item/stack/material/glass/New()
	update_icon()
	return ..()

/obj/item/stack/material/glass/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-glass[icon_suffix]"

/obj/item/stack/material/glass/reinforced
	name = "强化玻璃"
	icon_state = "sheet-rglass"
	default_type = "rglass"
	value = 6
	flags = CONDUCT

/obj/item/stack/material/glass/reinforced/New()
	update_icon()
	return ..()

/obj/item/stack/material/glass/reinforced/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (0 to 12)
			icon_suffix = ""
		if (13 to 25)
			icon_suffix = "_2"
		if (26 to 38)
			icon_suffix = "_3"
		if (39 to INFINITY)
			icon_suffix = "_4"
	icon_state = "sheet-rglass[icon_suffix]"

/obj/item/stack/material/bone
	name = "骨头"
	icon_state = "sheet-bone"
	default_type = "bone"
	dropsound = 'sound/effects/drop_wood.ogg'
	w_class = ITEM_SIZE_SMALL
	value = 0
	singular_name = "bone"

/obj/item/stack/material/bone/New()
	..()
	spawn(7200)
		if (isturf(loc))
			qdel(src)

/obj/item/stack/material/list_recipes(mob/user as mob, recipes_sublist)
	var/mob/living/human/U = user
	recipes = material.get_recipes_civs(U)
	..()

/obj/item/stack/material/fossil
	name = "化石"
	icon = 'icons/obj/materials.dmi'
	icon_state = "fossil_1"
	default_type = "stone"
	dropsound = 'sound/effects/drop_wood.ogg'
	w_class = ITEM_SIZE_NORMAL
	value = 10
	max_amount = 1
	singular_name = "fossil"
	New()
		icon_state = "fossil_[rand(1, 10)]"
		value = rand(10, 18)
		..()
