/obj/item/weapon/gun/launcher
	name = "发射器"
	desc = "一种发射物体的装置."
	w_class = ITEM_SIZE_HUGE
	flags =  CONDUCT
	slot_flags = SLOT_SHOULDER
	var/load_delay = 10
	var/release_force = 0
	var/firing_range = 18

//This normally uses a proc on projectiles and our ammo is not strictly speaking a projectile.
/obj/item/weapon/gun/launcher/can_hit(var/mob/living/target as mob, var/mob/living/user as mob)
	return TRUE

//Override this to avoid a runtime with suicide handling, called when directly aiming at the mouth.
/obj/item/weapon/gun/launcher/handle_suicide(mob/living/user)
	to_chat(user, SPAN_WARNING("You can't seem to manage this.")) // If we stated that "shooting ourselves with the [src] is pretty tricky.", we'd have to include checks to see if it is loaded in the first place, and this is really not worth the effort, so we concise it.
	return

//To prevent the launcher from unloading magically, without icon changing, or anything.... bug. - called when not aiming at the mouth but at a body-part.
/obj/item/weapon/gun/launcher/handle_shoot_self(mob/living/human/user)
	return

/obj/item/weapon/gun/launcher/secondary_attack_self(mob/living/human/user)
	if (gun_safety)
		if (safetyon)
			safetyon = FALSE
			to_chat(user, SPAN_NOTICE("You toggle \the [src]'s safety <b>OFF</b>."))
			return
		else
			safetyon = TRUE
			to_chat(user, SPAN_NOTICE("You toggle \the [src]'s safety <b>ON</b>."))
			return


/obj/item/weapon/gun/launcher/proc/update_release_force(obj/item/projectile)
	return FALSE

/obj/item/weapon/gun/launcher/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	projectile.loc = get_turf(user)
	var/shot_accuracy = rand(-accuracy, accuracy)
	var/dt_movement = world.time - user.last_movement
	if (dt_movement <= 6)
		shot_accuracy = rand(-20, 20)
	else if (dt_movement < 10)
		var/accuracy_range = 20 / sqrt(dt_movement - 6)
		shot_accuracy = rand(-accuracy_range, accuracy_range)
		if (abs(shot_accuracy) < 5) // even RNjesus won’t help you get there right away
			shot_accuracy += 5
		if(user.m_intent != "run")
			shot_accuracy *= 0.75
	if(istype(projectile, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/P = projectile
		P.dispersion = clamp(shot_accuracy, -40, 40)
		P.dir = SOUTH
		P.launch(target, user, src, 0, 0)
		playsound(get_turf(user), fire_sound, 100, TRUE,100)
		update_icon()
		return TRUE
	return FALSE

/obj/item/weapon/gun/launcher/special_check(mob/user)
	if (!user.has_empty_hand(both = FALSE))
		to_chat(user, SPAN_WARNING("You need both hands to fire \the [src]!"))
		return FALSE
	if (gun_safety && safetyon)
		to_chat(user, SPAN_WARNING("You can't fire \the [src] while the safety is on!"))
		return FALSE
	return TRUE

/obj/item/weapon/gun/launcher/rocket
	name = "火箭发射器"
	desc = "蛆虫."
	icon_state = "rocket"
	var/base_icon = "rocket"
	item_state = "rocket"
	w_class = ITEM_SIZE_HUGE
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	slot_flags = 0
	fire_sound = 'sound/effects/rpg_fire.ogg'
	var/max_rockets = 1
	var/list/rockets = new/list()
	var/caliber = "rocket"
	release_force = 15
	firing_range = 30
	fire_delay = 6
	equiptimer = 28
	load_delay = 18

/obj/item/weapon/gun/launcher/rocket/New()
	..()
	var/obj/item/weapon/attachment/A = new /obj/item/weapon/attachment/scope/iron_sights(src)
	spawn_add_attachment(A, src)

/obj/item/weapon/gun/launcher/rocket/update_icon()
	..()
	if(rockets.len > 0)
		icon_state = "[base_icon]"
		item_state = "[base_icon]"
	else
		icon_state = "[base_icon]_empty"
		item_state = "[base_icon]_empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/rocket/examine(mob/user)
	if(!..(user, 2))
		return
	if (rockets)
		to_chat(user, SPAN_NOTICE("<b>LOADED</B>"))
	else
		to_chat(user, SPAN_NOTICE("<b>UNLOADED</B>"))

/obj/item/weapon/gun/launcher/rocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		playsound(src.loc, 'sound/effects/rpgreload.ogg', 80, 0)
		if(rockets.len < max_rockets && do_after(user, load_delay, src, can_move = TRUE))
			user.drop_item()
			I.loc = src
			rockets += I
			to_chat(user, "你把[I]装入了[src].") // We don't include \the here as all of the rockets are proper-nouned, so it would output badly, e.g: "You put PG-7V rocket in RPG-7.".
			update_icon()
		else
			to_chat(usr, "\The [src]无法容纳更多火箭弹.")

/obj/item/weapon/gun/launcher/rocket/proc/unload(mob/user)
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/G = rockets[rockets.len]
		rockets.len--
		user.put_in_hands(G)
		user.visible_message("\The [user]从[src]中移除了\a [G].", SPAN_NOTICE("You remove \a [G] from \the [src]."))
		update_icon()
	else
		to_chat(user, SPAN_WARNING("\The [src] is empty."))

/obj/item/weapon/gun/launcher/rocket/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		unload(user)
	else
		..()

/obj/item/weapon/gun/launcher/rocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		var/obj/item/projectile/shell/missile/M = new I.projectile_type(src)
		if (ishuman(src.loc))
			M.dir = src.loc.dir
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].", key_name_admin(user))
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	update_icon()
	..()

//RPG-7
/obj/item/weapon/gun/launcher/rocket/rpg7
	name = "RPG-7"
	desc = "俄制多用途火箭."
	icon_state = "rpg7_empty"
	base_icon = "rpg7"
	item_state = "rpg7"
	slot_flags = SLOT_SHOULDER
	force = 10
	load_delay = 45

/obj/item/weapon/gun/launcher/rocket/rpg7/loaded/New()
	..()
	rockets += new /obj/item/ammo_casing/rocket/pg7v(src)
	update_icon()

/obj/item/weapon/gun/launcher/rocket/rpg7/makeshift
	name = "RPG-7"
	desc = "多用途火箭."
	icon_state = "rpg7_empty"
	item_state = "rpg7"
	slot_flags = null
	force = 10
	shake_strength = 2
	load_delay = 50

// Flare gun

/obj/item/weapon/gun/launcher/flaregun
	name = "信号枪"
	desc = "一把用于发射信号弹的信号枪."
	icon = 'icons/obj/guns/pistols.dmi'
	icon_state = "flaregun"
	item_state = "flaregun"
	fire_sound = 'sound/weapons/guns/fire/flaregun.ogg'
	secondary_action = TRUE

	load_delay = 20
	release_force = 0
	firing_range = 16

	var/open = FALSE
	var/recentpump = FALSE // to prevent spammage
	var/max_flares = 1
	var/list/flares = new/list()
	var/good_flare = /obj/item/flashlight/flare

/obj/item/weapon/gun/launcher/flaregun/update_icon()
	..()
	if (open)
		icon_state = "[initial(icon_state)]_open_empty"
		if (flares.len)
			icon_state = "[initial(icon_state)]_open"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/weapon/gun/launcher/flaregun/attack_self(mob/living/user as mob)
	if (world.time >= recentpump + 5)
		if (open)
			open = FALSE
			to_chat(user, SPAN_NOTICE("You close \the [src]."))
			update_icon()
		else
			open = TRUE
			to_chat(user, SPAN_NOTICE("You break open \the [src]."))
			update_icon()
		recentpump = world.time

/obj/item/weapon/gun/launcher/flaregun/attackby(obj/item/I, mob/user as mob)
	if (open)
		if(istype(I, good_flare))
			var/obj/item/flashlight/flare/F = I
			if(F.on)
				to_chat(user, SPAN_WARNING("You can't put a lit flare in [src]!"))
				return
			if(!F.fuel)
				to_chat(user, SPAN_WARNING("You can't put a burnt out flare in [src]!"))
				return
			if(flares.len < max_flares && do_after(user, load_delay, src, can_move = TRUE))
				user.remove_from_mob(I)
				I.loc = src
				flares += I
				playsound(user, 'sound/weapons/guns/interact/shotgun_insert.ogg', 25, TRUE)
				user.visible_message("[user]将\the [F]装入了\the [src].", SPAN_NOTICE("You load \the [F] into \the [src]."))
				update_icon()
			else
				to_chat(user, SPAN_WARNING("\The [src] is already loaded!"))
		else
			to_chat(user, SPAN_WARNING("That's not a flare!"))
	else
		to_chat(user, SPAN_WARNING("\The [src] is closed!"))

/obj/item/weapon/gun/launcher/flaregun/consume_next_projectile()
	if(flares.len)
		var/obj/item/flashlight/flare/I = flares[1]
		var/obj/item/flashlight/flare/on/M = new I.projectile_type(src)
		if (ishuman(src.loc))
			M.dir = src.loc.dir
		flares -= I
		return M
	return null

/obj/item/weapon/gun/launcher/flaregun/special_check(mob/user)
	if (open)
		to_chat(user, SPAN_WARNING("You can't fire \the [src] while it is breeched!"))
		return FALSE
	return TRUE

/obj/item/weapon/gun/launcher/flaregun/handle_post_fire(mob/user, atom/target)
	log_game("[key_name_admin(user)] used a flare gun ([src.name]) at [target].")
	update_icon()
	..()

/obj/item/weapon/gun/launcher/flaregun/secondary_attack_self(mob/living/human/user as mob)
	if (user && secondary_action)
		if (!open && flares.len > 0)
			user.visible_message(SPAN_WARNING("[user] aims their [src] into the air"),SPAN_WARNING("You aim your [src] into the air."))
			if (time_of_day == "Night" || time_of_day == "Evening")
				var/list/options = list()
				options["Ammunition"] = list(/obj/structure/closet/crate/ww2/russian/ammo)
				options["Medical supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/medical)
				options["Engineering supplies"] = list(/obj/structure/closet/crate/ww2/airdrops/engineering)
				options["Area denial"] = list(/obj/structure/closet/crate/ww2/airdrops/ap)
				var/choice = input(user,"What type of supply drop?") as null|anything in options
				if(src && choice)
					var/list/things_to_spawn = options[choice]
					for(var/new_type in things_to_spawn)
						if (do_after(user, 30, src, can_move = TRUE))
							var/fired_from = get_turf(src)

							var/obj/item/flashlight/flare/I = flares[1]
							flares -= I
							playsound(user, 'sound/weapons/guns/fire/flaregun.ogg', 90, TRUE)
							user.visible_message(SPAN_WARNING("[user] fires a flare into the air!"),SPAN_WARNING("You fire a flare into the air!"))
							spawn(40)
								new /obj/effect/flare/red(fired_from)
							fired_flare(user,fired_from)
							spawn(460)
								new new_type(fired_from)
			else
				if (do_after(user, 30, src, can_move = TRUE))
					var/obj/item/flashlight/flare/I = flares[1]
					flares -= I
					playsound(user, 'sound/weapons/guns/fire/flaregun.ogg', 90, TRUE)
					user.visible_message(SPAN_WARNING("[user] fires a flare into the air! Although it isn't night..."),SPAN_WARNING("You fire a flare into the air! And feel a little stupid for firing it while it's day..."))

/obj/item/weapon/gun/launcher/flaregun/proc/fired_flare(mob/living/human/user as mob,var/turf/fired_from)
	if (user)
		if (time_of_day == "Night" || time_of_day == "Evening")
			supplydrop_turfs += fired_from
			spawn(300)
				world << SPAN_NOTICE("<font size=3>The sound of a helicopter rotor can be heard in the distance.</font>")
				if (map.ID == "ROAD_TO_DAK_TO" || map.ID == "COMPOUND" || map.ID == "HUE" || map.ID == "ONG_THAHN")
					playsound(get_turf(src), 'sound/effects/aircraft/uh1.ogg', 100, TRUE, extrarange = 70)
					spawn(200)
						visible_message(SPAN_NOTICE("A US Army UH-1B helicopter flies by and drops off a crate at the smoke's location."))
				else if (user.faction_text == "RUSSIAN")
					playsound(get_turf(src), 'sound/effects/aircraft/mi8.ogg', 100, TRUE, extrarange = 70)
					spawn(200)
						visible_message(SPAN_NOTICE("A Russian Mil Mi-8 helicopter flies by and drops off a crate at the smoke's location."))
				else if (user.faction_text == "DUTCH")
					playsound(get_turf(src), 'sound/effects/aircraft/ch47.ogg', 100, TRUE, extrarange = 70)
					spawn(200)
						visible_message(SPAN_NOTICE("A Boeing CH-47 Chinook flies by and drops off a crate at the smoke's location."))
				else
					playsound(get_turf(src), 'sound/effects/aircraft/uh60.ogg', 100, TRUE, extrarange = 70)
					spawn(200)
						visible_message(SPAN_NOTICE("A UH-60 Blackhawk helicopter flies by and drops off a crate at the smoke's location."))
				spawn(600)
					supplydrop_turfs -= fired_from
				return

/obj/item/weapon/gun/launcher/flaregun/civilian
	name = "信号枪"
	desc = "一把配发给平民用于紧急情况的信号枪."
	icon_state = "flaregun_civ"
	item_state = "flaregun_civ"
	good_flare = /obj/item/ammo_casing/flare

/obj/item/weapon/gun/launcher/flaregun/civilian/attackby(obj/item/I, mob/user as mob)
	if (open)
		if(istype(I, good_flare))
			var/obj/item/ammo_casing/flare/F = I
			if(flares.len < max_flares && do_after(user, load_delay, src, can_move = TRUE))
				user.remove_from_mob(I)
				I.loc = src
				flares += I
				playsound(user, 'sound/weapons/guns/interact/shotgun_insert.ogg', 25, TRUE)
				user.visible_message("[user]将\the [F]装入了\the [src].",SPAN_NOTICE("You load \the [F] into \the [src]."))
				update_icon()
			else
				to_chat(user, SPAN_WARNING("\The [src] is already loaded!"))
		else
			to_chat(user, SPAN_WARNING("That's not a flare casing!"))
	else
		to_chat(user, SPAN_WARNING("\The [src] is closed!"))

/obj/item/weapon/gun/launcher/flaregun/civilian/consume_next_projectile()
	if(flares.len)
		var/obj/item/ammo_casing/flare/I = flares[1]
		var/obj/item/projectile/flare/M = new I.projectile_type(src)
		if (ishuman(src.loc))
			M.dir = src.loc.dir
		flares -= I
		return M
	return null

//MLAW
//Panzerfaust
/obj/item/weapon/gun/launcher/rocket/single_shot
	name = "单发发射器"
	desc = "不要使用这个!"
	icon_state = "panzerfaust"
	base_icon = "panzerfaust"
	item_state = "panzerfaust"
	slot_flags = SLOT_SHOULDER | SLOT_BACK
	force = 10
	shake_strength = 2
	fire_delay = 12
	release_force = 12
	firing_range = 10
	var/rocket_path

/obj/item/weapon/gun/launcher/rocket/single_shot/New()
	..()
	rockets += new rocket_path(src)
	update_icon()

/obj/item/weapon/gun/launcher/rocket/single_shot/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		to_chat(user, SPAN_WARNING("You can't reload a [src]!"))
		return

/obj/item/weapon/gun/launcher/rocket/single_shot/unload(mob/user)
	if(rockets.len)
		to_chat(user, SPAN_WARNING("You can't unload a [src]!"))
		return
	else
		to_chat(user, SPAN_WARNING("\The [src] is already used."))
		return

/obj/item/weapon/gun/launcher/rocket/single_shot/attack_hand(mob/user)
	..()

/obj/item/weapon/gun/launcher/rocket/single_shot/panzerfaust
	name = "铁拳60"
	desc = "德制单次使用火箭."
	icon_state = "panzerfaust"
	base_icon = "panzerfaust"
	item_state = "panzerfaust"
	force = 10
	shake_strength = 2
	fire_delay = 12
	release_force = 12
	firing_range = 10
	rocket_path = /obj/item/ammo_casing/rocket/panzerfaust

/obj/item/weapon/gun/launcher/rocket/single_shot/m72law
	name = "M72 LAW"
	desc = "一种轻便, 便携的一次性66毫米(2.6英寸)无制导反载具武器."
	icon_state = "m72law"
	base_icon = "m72law"
	item_state = "m72law"
	force = 15
	shake_strength = 2
	fire_delay = 10
	release_force = 15
	firing_range = 18
	rocket_path = /obj/item/ammo_casing/rocket/m72law

/obj/item/weapon/gun/launcher/rocket/single_shot/rpg22
	name = "RPG 22"
	desc = "一种轻便的俄制便携一次性72.5毫米(2.85英寸)无制导反载具武器."
	icon_state = "rpg22"
	base_icon = "rpg22"
	item_state = "rpg22"
	force = 15
	shake_strength = 2
	fire_delay = 10
	release_force = 15
	firing_range = 18
	rocket_path = /obj/item/ammo_casing/rocket/rpg22

//Bazooka
/obj/item/weapon/gun/launcher/rocket/bazooka
	name = "M1A1巴祖卡"
	desc = "一种美国火箭发射器, 用于击破防御工事和敌方装甲."
	icon_state = "bazooka_empty"
	base_icon = "bazooka"
	item_state = "bazooka"
	slot_flags = SLOT_SHOULDER
	force = 10
	caliber = "bazooka"

/obj/item/weapon/gun/launcher/rocket/rpb54
	name = "54型火箭反坦克枪"
	desc = "一种可重复使用的88毫米反载具火箭发射器, 由德国在第二次世界大战期间研发."
	icon_state = "rpb54_empty"
	base_icon = "rpb54"
	item_state = "rpb54"
	slot_flags = SLOT_SHOULDER
	force = 10
	caliber = "rpb54"
	fire_sound = 'sound/weapons/guns/fire/panzershreck.ogg'

//Fatman
/obj/item/weapon/gun/launcher/rocket/fatman
	name = "胖子"
	desc = "一种美国火箭发射器, 用于发射小型核弹头."
	icon_state = "fatman_empty"
	base_icon = "fatman"
	item_state = "bazooka"
	slot_flags = SLOT_SHOULDER
	force = 10
	caliber = "nuclear"

/obj/item/weapon/gun/launcher/rocket/fatman/loaded/New()
	..()
	rockets += new /obj/item/ammo_casing/rocket/nuclear(src)
	update_icon()

/obj/item/weapon/gun/launcher/rocket/piat
	name = "PIAT MK1"
	desc = "一种可重复使用的83毫米反载具武器, 由英国在第二次世界大战期间研发."
	icon_state = "piat_empty"
	base_icon = "piat"
	item_state = "piat_empty"
	slot_flags = SLOT_SHOULDER
	force = 10
	shake_strength = 4
	caliber = "piat"
	fire_sound = 'sound/weapons/guns/fire/piatfire.ogg'

////////////////////////////////////////AMMO///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Rocket items

/obj/item/ammo_casing/rocket
	name = "RPG火箭弹"
	desc = "一种高爆弹头与推进器, 设计用于从火箭发射器中发射."
	icon_state = "rocketshell"
	projectile_type = /obj/item/projectile/shell/missile/heat
	caliber = "rocket"
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BELT

/obj/item/ammo_casing/rocket/bazooka
	name = "M6A1破甲火箭弹"
	desc = "一种高爆反载具弹头与推进器, 设计用于从火箭发射器中发射."
	icon_state = "m6a1"
	projectile_type = /obj/item/projectile/shell/missile/heat/bazooka
	caliber = "bazooka"

/obj/item/ammo_casing/rocket/rpb54
	name = "RPzB. Gr. 4312"
	desc = "一种高爆反载具弹头与推进器, 设计用于从火箭反坦克枪中发射."
	icon_state = "rpb54"
	projectile_type = /obj/item/projectile/shell/missile/heat/rpb54
	caliber = "rpb54"

/obj/item/ammo_casing/rocket/panzerfaust
	name = "铁拳火箭弹"
	desc = "一种高爆弹头与推进器, 设计用于从铁拳发射器中发射."
	icon_state = "panzerfaust"
	projectile_type = /obj/item/projectile/shell/missile/heat/panzerfaust

/obj/item/ammo_casing/rocket/m72law
	name = "M72 LAW火箭弹"
	desc = "一种高爆弹头与推进器, 设计用于从M72-LAW发射器中发射."
	icon_state = "rocket"
	projectile_type = /obj/item/projectile/shell/missile/heat/m72law

/obj/item/ammo_casing/rocket/rpg22
	name = "RPG-22火箭弹"
	desc = "一种高爆弹头与推进器, 设计用于从RPG-22发射器中发射."
	icon_state = "rocket"
	projectile_type = /obj/item/projectile/shell/missile/heat/m72law

/obj/item/ammo_casing/rocket/pg7v
	name = "PG-7V火箭弹"
	desc = "一种高爆反载具(破甲)弹头与推进器, 设计用于从RPG-7发射器中发射."
	icon_state = "pg7v"
	projectile_type = /obj/item/projectile/shell/missile/heat/pg7v

/obj/item/ammo_casing/rocket/og7v
	name = "OG-7V火箭弹"
	desc = "一种破片弹头与推进器, 设计用于从RPG-7发射器中发射."
	icon_state = "og7v"
	projectile_type = /obj/item/projectile/shell/missile/og7v

/obj/item/ammo_casing/rocket/piat
	name = "SrB. 破甲 MK I"
	desc = "一种高爆反载具弹头, 设计用于瘫痪敌方载具并摧毁防御工事."
	icon_state = "piat"
	projectile_type = /obj/item/projectile/shell/missile/heat/piat
	caliber = "piat"

/obj/item/ammo_casing/rocket/piat/mk3
	name = "SrB. 破甲 MK III"
	desc = "一种现代化高爆反载具弹头, 设计用于瘫痪敌方载具并摧毁防御工事."
	icon_state = "piathe"
	projectile_type = /obj/item/projectile/shell/missile/piat44

/obj/item/ammo_casing/rocket/nuclear
	icon = 'icons/obj/cannon_ball.dmi'
	name = "核弹头"
	desc = "一枚他妈的核弹头, 你也许该往后退一点..."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "nuclear"
	projectile_type = /obj/item/projectile/shell/missile/nuclear
	caliber = "nuclear"
	w_class = ITEM_SIZE_LARGE

/obj/item/ammo_casing/rocket/atgm
	name = "破甲反坦克导弹火箭弹"
	desc = "一种高爆反载具(破甲)制导导弹弹头与推进器, 设计用于从反坦克导弹系统中发射."
	icon_state = "atgmAP"
	projectile_type = /obj/item/projectile/shell/missile/atgm/heat

/obj/item/ammo_casing/rocket/atgm/he
	name = "高爆反坦克导弹火箭弹"
	desc = "一种高爆(HE)制导导弹弹头与推进器, 设计用于从反坦克导弹系统中发射."
	icon_state = "atgmHE"
	projectile_type = /obj/item/projectile/shell/missile/atgm/he

//////////////////////////////////////////
/////////////GRENADE LAUNCHER/////////////

/obj/item/projectile/shell/missile
	icon_state = "missile"
	atype = "HE"
	heavy_armor_penetration = 10
	tracer_type = null
	caliber = 90

/obj/item/projectile/shell/missile/tracer_effect()
	if(permutated.len < 3)
		return
	for(var/i = 1, i <= 5, i++)
		var/obj/effect/projectile/tracer/missile/P = new/obj/effect/projectile/tracer/missile(loc)
		P.activate(get_angle(), pixel_x, pixel_y)

/obj/item/projectile/shell/missile/heat
	atype = "HEAT"
	heavy_armor_penetration = 80
	caliber = 90

/obj/item/projectile/shell/missile/heat/bazooka
	heavy_armor_penetration = 80
	caliber = 60

/obj/item/projectile/shell/missile/heat/pg7v
	heavy_armor_penetration = 300
	caliber = 85

/obj/item/projectile/shell/missile/heat/pg15v
	heavy_armor_penetration = 400
	caliber = 73

/obj/item/projectile/shell/missile/og7v
	heavy_armor_penetration = 10
	caliber = 40

/obj/item/projectile/shell/missile/heat/m72law
	heavy_armor_penetration = 350
	caliber = 66

/obj/item/projectile/shell/missile/heat/piat
	heavy_armor_penetration = 80
	caliber = 76

/obj/item/projectile/shell/missile/piat44
	heavy_armor_penetration = 10
	caliber = 76

/obj/item/projectile/shell/missile/nuclear
	atype = "NUCLEAR"

/obj/item/projectile/shell/missile/heat/panzerfaust
	icon_state = "panzerfaust_missile"
	heavy_armor_penetration = 200
	caliber = 150

/obj/item/projectile/shell/missile/heat/rpb54
	heavy_armor_penetration = 250
	caliber = 88

/obj/item/projectile/shell/missile/atgm
	atype = "HE"
	caliber = 120
	tracer_type = null
	New()
		..()
		icon_state = "atgm_missile"

/obj/item/projectile/shell/missile/atgm/process()
	if(permutated.len > 2 && firer && firer.client)
		var/client/C = firer.client
		var/mouse_x = C.mouse_x
		var/mouse_y = C.mouse_y
		var/mouse_turf = locate(mouse_x, mouse_y, z)
		var/mouse_angle = round(Atan2(mouse_x - starting.x, mouse_y - starting.y))

		if(get_dist(starting, loc) > get_dist(starting, mouse_turf))
			initiate(loc)
			return

		if (mouse_angle < 0)
			mouse_angle = 180 + (180 - abs(mouse_angle))

		if(get_angle() < 90 && mouse_angle > 270)
			mouse_angle -= 360
		else if(mouse_angle < 90 && get_angle() > 270)
			mouse_angle += 360

		var/delta_angle = mouse_angle - get_angle()

		var/new_angle = get_angle()
		if(abs(delta_angle) > 5)
			new_angle += 1.25 * (delta_angle) / abs(delta_angle)
		var/new_x = starting.x + ceil(cos(new_angle) * get_dist(starting, mouse_turf))
		var/new_y = starting.y + ceil(sin(new_angle) * get_dist(starting, mouse_turf))
		var/turf/new_target = locate(new_x, new_y, z)

		transform = matrix()
		trajectory = new()
		trajectory.setup(loc, new_target)
		trajectory.angle = new_angle
		transform = turn(transform, -(trajectory.angle + 90))
	..()

/obj/item/projectile/shell/missile/atgm/he
	atype = "HE"
	heavy_armor_penetration = 40
	caliber = 120

/obj/item/projectile/shell/missile/atgm/heat
	atype = "HEAT"
	heavy_armor_penetration = 800
	caliber = 120
