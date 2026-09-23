/obj/structure/bed/chair	//YES, chairs are a type of bed, which are a type of stool. This works, believe me.	-Pete
	name = "椅子"
	desc = "你坐在这上面. 无论是自愿还是被迫."
	icon_state = "chair"
	base_icon = "chair"
	buckle_dir = FALSE
	buckle_lying = FALSE //force people to sit up in chairs when buckled
	var/propelled = FALSE // Check for fire-extinguisher-driven chairs

/obj/structure/bed/chair/New()
	..()
	update_layer()

/obj/structure/bed/chair/post_buckle_mob()
	update_icon()

/obj/structure/bed/chair/update_icon()
	..()

/*
	var/cache_key = "[base_icon]-[material.name]-over"
	if (isnull(stool_cache[cache_key]))
		var/image/I = image('icons/obj/furniture.dmi', "[base_icon]_over")
		I.color = material.icon_colour
		I.layer = FLY_LAYER
		stool_cache[cache_key] = I
	overlays |= stool_cache[cache_key]
*/
	// Padding overlay.
	if (padding_material)
		var/padding_cache_key = "[base_icon]-padding-[padding_material.name]-over"
		if (isnull(stool_cache[padding_cache_key]))
			var/image/I =  image(icon, "[base_icon]_padding_over")
			I.color = padding_material.icon_colour
			I.layer = FLY_LAYER
			stool_cache[padding_cache_key] = I
		overlays |= stool_cache[padding_cache_key]

	if (buckled_mob && padding_material)
		var/cache_key = "[base_icon]-armrest-[padding_material.name]"
		if (isnull(stool_cache[cache_key]))
			var/image/I = image(icon, "[base_icon]_armrest")
			I.layer = MOB_LAYER + 0.1
			I.color = padding_material.icon_colour
			stool_cache[cache_key] = I
		overlays |= stool_cache[cache_key]

/obj/structure/bed/chair/proc/update_layer()
	if (dir == NORTH)
		layer = FLY_LAYER
	else
		layer = OBJ_LAYER

/obj/structure/bed/chair/set_dir()
	..()
	update_layer()
	if (buckled_mob)
		buckled_mob.set_dir(dir)

/obj/structure/bed/chair/verb/rotate_right()
	set name = "Rotate Right"
	set category = null
	set src in oview(1)

	if (config.ghost_interaction)
		set_dir(turn(dir, -90))

		return

	else
		if (istype(usr,/mob/living/simple_animal/mouse))
			return
		if (!usr || !isturf(usr.loc))
			return
		if (usr.stat || usr.restrained())
			return

		set_dir(turn(dir, -90))

		return

/obj/structure/bed/chair/verb/rotate_left()
	set name = "Rotate Left"
	set category = null
	set src in oview(1)

	if (config.ghost_interaction)
		set_dir(turn(dir, 90))

		return

	else
		if (istype(usr,/mob/living/simple_animal/mouse))
			return
		if (!usr || !isturf(usr.loc))
			return
		if (usr.stat || usr.restrained())
			return

		set_dir(turn(dir, 90))

		return

// Leaving this in for the sake of compilation.
/obj/structure/bed/chair/comfy
	desc = "这是一把椅子. 看起来很舒服."
	icon_state = "chair_padding"

/obj/structure/bed/chair/comfy/brown/New(var/newloc,var/newmaterial)
	..(newloc,"steel","leather")

/obj/structure/bed/chair/comfy/red/New(var/newloc,var/newmaterial)
	..(newloc,"steel","carpet")

/obj/structure/bed/chair/comfy/teal/New(var/newloc,var/newmaterial)
	..(newloc,"steel","teal")

/obj/structure/bed/chair/comfy/black/New(var/newloc,var/newmaterial)
	..(newloc,"steel","black")

/obj/structure/bed/chair/comfy/green/New(var/newloc,var/newmaterial)
	..(newloc,"steel","green")

/obj/structure/bed/chair/comfy/purp/New(var/newloc,var/newmaterial)
	..(newloc,"steel","purple")

/obj/structure/bed/chair/comfy/blue/New(var/newloc,var/newmaterial)
	..(newloc,"steel","blue")

/obj/structure/bed/chair/comfy/beige/New(var/newloc,var/newmaterial)
	..(newloc,"steel","beige")

/obj/structure/bed/chair/comfy/lime/New(var/newloc,var/newmaterial)
	..(newloc,"steel","lime")

/obj/structure/bed/chair/comfy/fancy_sofa
	name = "豪华沙发"
	desc = "一张漂亮的皮沙发."
	base_icon = "fancysofa_middle"
	icon_state = "fancysofa_middle"
	applies_material_colour = FALSE
	material = "leather"
/obj/structure/bed/chair/comfy/fancy_sofa/l
	icon_state = "fancysofa_l"
	base_icon = "fancysofa_l"
/obj/structure/bed/chair/comfy/fancy_sofa/r
	icon_state = "fancysofa_r"
	base_icon = "fancysofa_r"

/obj/structure/bed/chair/comfy/diner_booth
	name = "餐厅卡座"
	desc = "一个舒适的红色餐厅卡座."
	base_icon = "diner_booth_right"
	icon_state = "diner_booth_right"
	applies_material_colour = FALSE
	material = "leather"
/obj/structure/bed/chair/comfy/diner_booth/l
	base_icon = "diner_booth_left"
	icon_state = "diner_booth_left"
	applies_material_colour = FALSE
/obj/structure/bed/chair/comfy/diner_booth/r
	base_icon = "diner_booth_right"
	icon_state = "diner_booth_right"
	applies_material_colour = FALSE

/obj/structure/bed/chair/office
	anchored = FALSE
	buckle_movable = TRUE

/obj/structure/bed/chair/office/update_icon()
	return

/obj/structure/bed/chair/office/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/stack) || istype(W, /obj/item/weapon/wirecutters))
		return
	..()

/obj/structure/bed/chair/office/Move()
	..()
	if (buckled_mob)
		var/mob/living/occupant = buckled_mob
		occupant.buckled = null
		occupant.Move(loc)
		occupant.buckled = src
		if (occupant && (loc != occupant.loc))
			if (propelled)
				for (var/mob/O in loc)
					if (O != occupant)
						Bump(O)
			else
				unbuckle_mob()

/obj/structure/bed/chair/office/Bump(atom/A)
	..()
	if (!buckled_mob)	return

	if (propelled)
		var/mob/living/occupant = unbuckle_mob()

		var/def_zone = ran_zone()
		var/blocked = occupant.run_armor_check(def_zone, "melee")
		occupant.throw_at(A, 3, propelled)
		occupant.apply_effect(6, STUN, blocked)
		occupant.apply_effect(6, WEAKEN, blocked)
		occupant.apply_effect(6, STUTTER, blocked)
		occupant.apply_damage(10, BRUTE, def_zone, blocked)
		playsound(loc, 'sound/weapons/punch1.ogg', 50, TRUE, -1)
		if (istype(A, /mob/living))
			var/mob/living/victim = A
			def_zone = ran_zone()
			blocked = victim.run_armor_check(def_zone, "melee")
			victim.apply_effect(6, STUN, blocked)
			victim.apply_effect(6, WEAKEN, blocked)
			victim.apply_effect(6, STUTTER, blocked)
			victim.apply_damage(10, BRUTE, def_zone, blocked)
		occupant.visible_message("<span class='danger'>[occupant]撞上了\the [A]!</span>")

/obj/structure/bed/chair/office/light
	icon_state = "officechair_white"

/obj/structure/bed/chair/office/dark
	icon_state = "officechair_dark"

/obj/structure/bed/chair/office/dark/anchored
	anchored = TRUE

/obj/structure/bed/chair/office/New()
	..()
	var/image/I = image(icon, "[icon_state]_over")
	I.layer = FLY_LAYER
	overlays += I


// Chair types
/obj/structure/bed/chair/wood
	name = "木椅"
	desc = "古老永远不会过时."
	icon_state = "wooden_chair"
	applies_material_colour = FALSE

/obj/structure/bed/chair/wood/another
	name = "木椅"
	desc = "经典永远不会过时."
	icon_state = "wooden_chair_alt"

/obj/structure/bed/chair/wood/bleacher
	name = "木制长椅"
	desc = "教堂里的长凳式座位."
	icon_state = "bleacher"
	applies_material_colour = FALSE

/obj/structure/bed/chair/wood/bleacher/r
	name = "木制长椅"
	desc = "教堂里的长凳式座位."
	icon_state = "bleacher_r"
	applies_material_colour = FALSE

/obj/structure/bed/chair/wood/bleacher/l
	name = "木制长椅"
	desc = "教堂里的长凳式座位."
	icon_state = "bleacher_l"
	applies_material_colour = FALSE

/obj/structure/bed/chair/stone
	name = "石椅"
	desc = "古老永远不会过时."
	icon_state = "chair"
	material = "stone"
	applies_material_colour = TRUE

/obj/structure/bed/chair/steel
	name = "钢椅"
	desc = "一把冰冷、无聊的椅子."
	icon_state = "steelchair"
	base_icon = "steelchair"
	material = "steel"
	applies_material_colour = FALSE

/obj/structure/bed/chair/steel/alt
	desc = "一把廉价的折叠金属椅."
	icon_state = "metalchair"
	base_icon = "metalchair"

/obj/structure/bed/chair/steel/alt/green
	icon_state = "metalchair_green"
	base_icon = "metalchair_green"
/obj/structure/bed/chair/steel/alt/blue
	icon_state = "metalchair_blue"
	base_icon = "metalchair_blue"
/obj/structure/bed/chair/steel/alt/yellow
	icon_state = "metalchair_yellow"
	base_icon = "metalchair_yellow"
/obj/structure/bed/chair/steel/alt/red
	icon_state = "metalchair_red"
	base_icon = "metalchair_red"

/obj/structure/bed/chair/throne
	name = "王座"
	desc = "彰显王室权威的华丽座椅."
	icon_state = "throne"
	base_icon = "throne"
	material = "gold"
	applies_material_colour = FALSE

/obj/structure/bed/chair/throne
	name = "王座"
	desc = "彰显王室权威的华丽座椅."
	icon_state = "throne"
	base_icon = "throne"
	material = "gold"
	applies_material_colour = FALSE

/obj/structure/bed/chair/luxury
	name = "豪华座椅"
	desc = "极致的舒适、优雅与奢华,尽在一椅之中."
	icon_state = "regalchair"
	base_icon = "regalchair"
	material = "gold"
	applies_material_colour = FALSE

/obj/structure/bed/chair/executive
	name = "行政椅"
	desc = "高背、可调节、符合人体工学的办公椅."
	icon_state = "bosschair"
	base_icon = "bosschair"
	material = "steel"
	applies_material_colour = FALSE

/obj/structure/bed/chair/wood/update_icon()
	return

/obj/structure/bed/chair/wood/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/stack) || istype(W, /obj/item/weapon/wirecutters))
		return
	..()

/obj/structure/bed/chair/wood/New(var/newloc)
	..(newloc, "wood")
	var/image/I = image(icon, "[icon_state]_over")
	I.layer = FLY_LAYER
	overlays += I

/obj/structure/bed/chair/wood/wings
	name = "翼背木椅"
	icon_state = "wooden_chair_wings"

/obj/structure/bed/chair/wood/red
	name = "软垫椅"
	desc = "内置软垫以增加舒适度."
	icon_state = "wooden_chair_red"

/obj/structure/bed/chair/wood/alt
	icon_state = "wooden_chair_alt"

/obj/structure/bed/chair/barber
	name = "理发椅"
	desc = "一把理发店的椅子."
	icon_state = "barberchair"
	base_icon = "barberchair"
	material = "steel"
	applies_material_colour = FALSE
