/obj/structure/window
	name = "窗户"
	desc = "一扇窗户."
	icon = 'icons/obj/windows.dmi'
	density = TRUE
	w_class = ITEM_SIZE_NORMAL

	layer = 3.2//Just above doors
	anchored = 1.0
	flags = ON_BORDER
	var/maxhealth = 14.0
	var/maximal_heat = T0C + 100 		// Maximal heat before this window begins taking damage from fire
	var/damage_per_fire_tick = 2.0 		// Amount of damage per fire tick. Regular windows are not fireproof so they might as well break quickly.
	var/health
	var/ini_dir = null
	var/state = 2
	var/reinf = FALSE
	var/basestate
	var/glasstype = null // Set this in subtypes. Null is assumed strange or otherwise impossible to dismantle, such as for shuttle glass.
	var/silicate = FALSE // number of units of silicate
	not_movable = FALSE
	not_disassemblable = FALSE
	var/glassed = FALSE
/obj/structure/window/examine(mob/user)
	. = ..(user)
	if (istype(src, /obj/structure/window/barrier))
		return
	if (health == maxhealth)
		to_chat(user, "<span class='notice'>它看起来完好无损.</span>")
	else
		var/perc = health / maxhealth
		if (perc > 0.75)
			to_chat(user, "<span class='notice'>它有几道裂缝.</span>")
		else if (perc > 0.5)
			to_chat(user, "<span class='warning'>它看起来轻微受损.</span>")
		else if (perc > 0.25)
			to_chat(user, "<span class='warning'>它看起来中度受损.</span>")
		else
			to_chat(user, "<span class='danger'>它看起来严重受损.</span>")
	if (silicate)
		if (silicate < 30)
			to_chat(user, "<span class='notice'>它上面有一层薄薄的硅酸盐.</span>")
		else if (silicate < 70)
			to_chat(user, "<span class='notice'>它被硅酸盐覆盖.</span>")
		else
			to_chat(user, "<span class='notice'>上面覆盖着一层厚厚的硅酸盐.</span>")

/obj/structure/window/proc/take_damage(var/damage = 0,  var/sound_effect = TRUE)
	var/initialhealth = health

	if (silicate)
		damage = damage * (1 - silicate / 200)

	health = max(0, health - damage)

	if (health <= 0)
		shatter()
	else
		if (sound_effect)
			playsound(loc, 'sound/effects/Glasshit.ogg', 100, TRUE)
		if (health < maxhealth / 4 && initialhealth >= maxhealth / 4)
			visible_message("[src]看起来快要碎裂了!" )
		else if (health < maxhealth / 2 && initialhealth >= maxhealth / 2)
			visible_message("[src]看起来严重受损!" )
		else if (health < maxhealth * 3/4 && initialhealth >= maxhealth * 3/4)
			visible_message("[src]开始出现裂缝!" )
	return

/obj/structure/window/proc/apply_silicate(var/amount)
	if (health < maxhealth) // Mend the damage
		health = min(health + amount * 3, maxhealth)
		if (health == maxhealth)
			visible_message("[src]看起来已完全修复." )
	else // Reinforce
		silicate = min(silicate + amount, 100)
		updateSilicate()

/obj/structure/window/proc/updateSilicate()
	if (overlays)
		overlays.Cut()

	var/image/img = image(icon, icon_state)
	img.color = "#ffffff"
	img.alpha = silicate * 255 / 100
	overlays += img

/obj/structure/window/proc/shatter(var/display_message = TRUE)
	playsound(get_turf(src), "shatter", 70, TRUE)
	if (display_message)
		visible_message("<span class = 'warning'>[src]碎裂了!</span>")
		new/obj/item/weapon/material/shard/glass(loc)
	if (glassed)
		if (istype(src, /obj/structure/window/classic/shoji))
			new/obj/structure/window_frame/shoji(loc)
		else if (istype(src, /obj/structure/window/classic/metal))
			new/obj/structure/window_frame/metal(loc)
		else if (istype(src, /obj/structure/window/classic/portholefull))
			new/obj/structure/window_frame/portholefull(loc)
		else if (istype(src, /obj/structure/window/classic/medieval))
			new/obj/structure/window_frame/medieval(loc)
		else if (istype(src, /obj/structure/window/classic/oriental))
			new/obj/structure/window_frame/oriental(loc)
		else if (istype(src, /obj/structure/window/classic/bamboo))
			new/obj/structure/window_frame/bamboo(loc)
		else if (istype(src, /obj/structure/window/classic/clay))
			new/obj/structure/window_frame/clay(loc)
		else if (istype(src, /obj/structure/window/classic/redearth))
			new/obj/structure/window_frame/redearth(loc)
		else if (istype(src, /obj/structure/window/classic/villa))
			new/obj/structure/window_frame/villa(loc)
		else if (istype(src, /obj/structure/window/classic/villafull))
			new/obj/structure/window_frame/villafull(loc)
		else if (istype(src, /obj/structure/window/classic/brick))
			new/obj/structure/window_frame/brick(loc)
		else if (istype(src, /obj/structure/window/classic/brickfull))
			new/obj/structure/window_frame/brickfull(loc)
		else if (istype(src, /obj/structure/window/classic/stone))
			new/obj/structure/window_frame/stone(loc)
		else if (istype(src, /obj/structure/window/classic/stonefull))
			new/obj/structure/window_frame/stonefull(loc)
		else if (istype(src, /obj/structure/window/classic/marble))
			new/obj/structure/window_frame/marble(loc)
		else if (istype(src, /obj/structure/window/classic/marblefull))
			new/obj/structure/window_frame/marblefull(loc)
		else if (istype(src, /obj/structure/window/classic/sandstone))
			new/obj/structure/window_frame/sandstone(loc)
		else if (istype(src, /obj/structure/window/classic/sandstonefull))
			new/obj/structure/window_frame/sandstonefull(loc)
		else if (istype(src, /obj/structure/window/classic/redsandstone))
			new/obj/structure/window_frame/redsandstone(loc)
		else if (istype(src, /obj/structure/window/classic/redsandstonefull))
			new/obj/structure/window_frame/redsandstonefull(loc)
		else if (istype(src, /obj/structure/window/classic/sumerian))
			new/obj/structure/window_frame/sumerian(loc)
		else if (istype(src, /obj/structure/window/classic/abashiri))
			new/obj/structure/window_frame/abashiri(loc)
		else
			new/obj/structure/window_frame(loc)
	qdel(src)
	return

/obj/structure/window/bullet_act(var/obj/item/projectile/Proj)

	var/proj_damage = Proj.get_structure_damage()
	if (!proj_damage) return

	..()
	take_damage(proj_damage)
	return


/obj/structure/window/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			shatter(0)
			return
		if (3.0)
			if (prob(50))
				shatter(0)
				return

//TODO: Make full windows a separate type of window.
//Once a full window, it will always be a full window, so there's no point
//having the same type for both.
/obj/structure/window/proc/is_full_window()
	return (dir == SOUTHWEST || dir == SOUTHEAST || dir == NORTHWEST || dir == NORTHEAST)

/obj/structure/window/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover) && mover.checkpass(PASSGLASS))
		return TRUE
	if (is_full_window())
		return FALSE	//full tile window, you can't move into it!
	if (get_dir(loc, target) & dir)
		return !density
	else
		return TRUE

/obj/structure/window/CheckExit(atom/movable/O as mob|obj, target as turf)
	if (istype(O, /obj/structure/drone))
		var/obj/structure/drone/D = O
		if (D.flying)
			return TRUE
	for(var/obj/covers/repairedfloor/rope/R in loc)
		return TRUE
	if (istype(O) && O.checkpass(PASSGLASS))
		return TRUE
	if (get_dir(O.loc, target) == dir)
		return FALSE
	return TRUE

/obj/structure/window/hitby(AM as mob|obj)
	..()
	visible_message("<span class='danger'>[src]被[AM]击中了.</span>")
	var/tforce = FALSE
	if (ismob(AM))
		tforce = 40
	else if (isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	if (reinf) tforce *= 0.25
	if (health - tforce <= 7 && !reinf)
		set_anchored(FALSE)
		step(src, get_dir(AM, src))
	take_damage(tforce)

/obj/structure/window/attack_hand(mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

	if (usr.a_intent == I_HARM)

		playsound(loc, 'sound/effects/glassknock.ogg', 80, TRUE)
		user.do_attack_animation(src)
		user.visible_message("<span class='danger'>\The [usr]撞在\the [src]上!</span>",
							"<span class='danger'>你撞在\the [src]上!</span>",
							"你听到一声撞击声.")
	else
		playsound(loc, 'sound/effects/glassknock.ogg', 80, TRUE)
		user.visible_message("[usr.name]敲了敲\the [name].",
							"你敲了敲\the [name].",
							"你听到一声敲击声.")
	return

/obj/structure/window/attack_generic(var/mob/user, var/damage)
	if (istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
	if (!damage)
		return
	if (damage >= 10)
		user.visible_message("<span class='danger'>[user]猛撞在\the [src]上!</span>")
		take_damage(damage)
	else
		user.visible_message("<span class='notice'>\The [user]轻轻碰了一下\the [src],没有造成伤害.</span>")
	return TRUE


/obj/structure/window/kick_act(var/mob/living/human/user)
	if(!..())
		return
	user.stats["stamina"][1] = max(user.stats["stamina"][1] - rand(10,15), 0)
	visible_message("<span class='danger'>[user]踢了[src]!</span>")
	take_damage(rand(5,10))

/obj/structure/window/attackby(obj/item/W as obj, mob/user as mob)
	if (!istype(W)) return//I really wish I did not need this
	if (istype(W, /obj/item/weapon/grab) && get_dist(src,user)<2)
		var/obj/item/weapon/grab/G = W
		if (istype(G.affecting,/mob/living))
			var/mob/living/M = G.affecting
			var/state = G.state
			qdel(W)	//gotta delete it here because if window breaks, it won't get deleted
			switch (state)
				if (1)
					M.visible_message("<span class='warning'>[user]把[M]猛砸在\the [src]上!</span>")
					M.apply_damage(7)
					hit(10)
				if (2)
					M.visible_message("<span class='danger'>[user]把[M]猛击在\the [src]上!</span>")
					if (prob(50))
						M.Weaken(1)
					M.apply_damage(10)
					hit(25)
				if (3)
					M.visible_message("<span class='danger'><big>[user]把[M]碾碎在\the [src]上!</big></span>")
					M.Weaken(5)
					M.apply_damage(20)
					hit(50)
			return

	if (W.flags & NOBLUDGEON) return

	if (istype(W, /obj/item/weapon/wrench))
		if (reinf && state >= 1)
			state = 3 - state
			update_nearby_icons()
			playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
			to_chat(user, (state == TRUE ? "<span class='notice'>You have unfastened the window from the frame.</span>" : "<span class='notice'>You have fastened the window to the frame.</span>"))
		else if (reinf && state == FALSE)
			set_anchored(!anchored)
			playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
			to_chat(user, (anchored ? "<span class='notice'>You have fastened the frame to the floor.</span>" : "<span class='notice'>You have unfastened the frame from the floor.</span>"))
		else if (!reinf)
			set_anchored(!anchored)
			playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
			to_chat(user, (anchored ? "<span class='notice'>You have fastened the window to the floor.</span>" : "<span class='notice'>You have unfastened the window.</span>"))
	else if (istype(W, /obj/item/weapon/crowbar) && reinf && state <= 1)
		state = TRUE - state
		playsound(loc, 'sound/items/Crowbar.ogg', 75, TRUE)
		to_chat(user, (state ? "<span class='notice'>You have pried the window into the frame.</span>" : "<span class='notice'>You have pried the window out of the frame.</span>"))
	else if (istype(W, /obj/item/weapon/hammer) && !anchored && (!state || !reinf))
		if (!glasstype)
			to_chat(user, "<span class='notice'>你不确定如何正确拆解\the [src].</span>")
		else
			playsound(loc, 'sound/items/Ratchet.ogg', 75, TRUE)
			visible_message("<span class='notice'>[user]拆解了\the [src].</span>")
			if (dir == SOUTHWEST)
				var/obj/item/stack/material/mats = new glasstype(loc)
				mats.amount = is_fulltile() ? 4 : 2
			else
				new glasstype(loc)
			qdel(src)
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if (W.damtype == BRUTE || W.damtype == BURN)
			user.do_attack_animation(src)
			hit(W.force)
			if (health <= 7)
				set_anchored(FALSE)
				step(src, get_dir(user, src))
		else
			playsound(loc, 'sound/effects/Glasshit.ogg', 75, TRUE)
		..()
	return

/obj/structure/window/proc/hit(var/damage, var/sound_effect = TRUE)
	if (reinf) damage *= 0.5
	take_damage(damage)
	return


/obj/structure/window/proc/rotate_right()
	set name = "Rotate Right"
	set category = null
	set src in oview(1)

	if (usr.incapacitated())
		return FALSE

	if (anchored)
		to_chat(usr, "它被固定在地板上,因此你无法旋转它!")
		return FALSE

	set_dir(turn(dir, 90))
	updateSilicate()
	return

/obj/structure/window/proc/rotate_left()
	set name = "Rotate Left"
	set category = null
	set src in oview(1)

	if (usr.incapacitated())
		return FALSE

	if (anchored)
		to_chat(usr, "它被固定在地板上,因此你无法旋转它!")
		return FALSE


	set_dir(turn(dir, -90))
	updateSilicate()

	return

/obj/structure/window/New(Loc, start_dir=null, constructed=0)
	..()

	//player-constructed windows
	if (constructed)
		set_anchored(FALSE)

	if (start_dir)
		set_dir(start_dir)

	health = maxhealth

	ini_dir = dir


	update_nearby_icons()

/obj/structure/window/Destroy()
	density = FALSE
	loc = null
	..()


/obj/structure/window/Move()
	var/ini_dir = dir

	..()
	set_dir(ini_dir)


//checks if this window is a full-tile one
/obj/structure/window/proc/is_fulltile()
	if (dir & (dir - 1))
		return TRUE
	return FALSE

/obj/structure/window/proc/set_anchored(var/new_anchored)
	if (anchored == new_anchored)
		return
	anchored = new_anchored
	update_verbs()
	update_nearby_icons()

//This proc is used to update the icons of nearby windows.
/obj/structure/window/proc/update_nearby_icons()
	update_icon()
	for (var/obj/structure/window/W in orange(src, TRUE))
		W.update_icon()

//Updates the availabiliy of the rotation verbs
/obj/structure/window/proc/update_verbs()
	if (anchored)
		verbs -= /obj/structure/window/proc/rotate_left
		verbs -= /obj/structure/window/proc/rotate_right
	else
		verbs += /obj/structure/window/proc/rotate_left
		verbs += /obj/structure/window/proc/rotate_right

//merges adjacent full-tile windows into one (blatant ripoff from game/smoothwall.dm)
/obj/structure/window/update_icon()
	//A little cludge here, since I don't know how it will work with slim windows. Most likely VERY wrong.
	//this way it will only update full-tile ones
	overlays.Cut()
	if (!is_fulltile())
		icon_state = "[basestate]"
		return
	var/list/dirs = list()
	if (anchored)
		for (var/obj/structure/window/W in orange(src,1))
			if (W.anchored && W.density && W.type == type && W.is_fulltile()) //Only counts anchored, not-destroyed fill-tile windows.
				dirs += get_dir(src, W)

/*	var/list/connections = dirs_to_corner_states(dirs)

	icon_state = ""
	for (var/i = TRUE to 4)
		var/image/I = image(icon, "[basestate][connections[i]]", dir = TRUE<<(i-1))
		overlays += I
*/
	return

/obj/structure/window/fire_act(temperature)
	if (prob((temperature/500) * 70))
		shatter()

/obj/structure/window_frame
	desc = "一个窗框."
	icon_state = "windownew_frame"
	layer = MOB_LAYER + 0.01
	anchored = TRUE
	var/health = 20
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = FALSE
	var/stucco_window = TRUE
	icon = 'icons/obj/windows.dmi'
/obj/structure/window_frame/abashiri
	icon_state = "abashiri0"
	var/base_icon_state = "abashiri"
	var/adjusts = TRUE
	mergewith = list(/obj/structure/window/classic/abashiri,/obj/structure/window_frame/abashiri,/turf/wall/abashiri,/obj/covers/wood_wall/abashiri)
/obj/structure/window_frame/abashiri/check_relatives(var/update_self = FALSE, var/update_others = FALSE)
	if (!adjusts)
		return
	var/junction
	if (update_self)
		junction = FALSE
	for (var/checkdir in cardinal)
		var/turf/T = get_step(src, checkdir)
		for(var/atom/CV in T)
			if (!can_join_with(CV))
				continue
			if (update_self)
				if (can_join_with(CV))
					junction |= get_dir(src,CV)
			if (update_others)
				CV.check_relatives(1,0)
	if (!isnull(junction))
		icon_state = "[base_icon_state][junction]"
	return
/obj/structure/window_frame/abashiri/can_join_with(var/atom/W)
	if (istype(W,src))
		return TRUE
	for (var/i in mergewith)
		if (istype(W,i))
			return TRUE
/obj/structure/window_frame/abashiri/update_icon()
	..()
	check_relatives(1,1)
/obj/structure/window_frame/abashiri/New()
	..()
	check_relatives(1,1)

/obj/structure/window_frame/abashiri/Destroy()
	check_relatives(0,1)
	..()


/obj/structure/window_frame/medieval
	icon_state = "medieval0"
	var/base_icon_state = "medieval"
	var/adjusts = TRUE
	mergewith = list(/obj/structure/window/classic/medieval,/obj/structure/window_frame/medieval,/obj/covers/wood_wall/medieval)
/obj/structure/window_frame/medieval/check_relatives(var/update_self = FALSE, var/update_others = FALSE)
	if (!adjusts)
		return
	var/junction
	if (update_self)
		junction = FALSE
	for (var/checkdir in cardinal)
		var/turf/T = get_step(src, checkdir)
		for(var/atom/CV in T)
			if (!can_join_with(CV))
				continue
			if (update_self)
				if (can_join_with(CV))
					junction |= get_dir(src,CV)
			if (update_others)
				CV.check_relatives(1,0)
	if (!isnull(junction))
		icon_state = "[base_icon_state][junction]"
	return
/obj/structure/window_frame/medieval/can_join_with(var/atom/W)
	if (istype(W,src))
		return TRUE
	for (var/i in mergewith)
		if (istype(W,i))
			return TRUE
/obj/structure/window_frame/medieval/update_icon()
	..()
	check_relatives(1,1)
/obj/structure/window_frame/medieval/New()
	..()
	check_relatives(1,1)

/obj/structure/window_frame/medieval/Destroy()
	check_relatives(0,1)
	..()

/obj/structure/window_frame/shoji
	icon_state = "shoji_windownew_frame"
	name = "障子窗框"
	desc = "一个不错的老式窗框,只是日式风格的."
	stucco_window = FALSE

/obj/structure/window_frame/metal
	icon_state = "windowmetal_frame"
	health = 500
	flammable = FALSE
	stucco_window = FALSE

//obj/structure/window_frame/ruinedbars
//	icon_state = "ruinedbars"
//	health = 500
//	flammable = FALSE
//	stucco_window = FALSE

/obj/structure/window_frame/portholefull
	icon_state = "metal_porthole_fullframe"
	name = "全金属舷窗框"
	desc = "一个大型金属舷窗,留有放置玻璃的空位."
	health = 500
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/medieval_old
	icon_state = "medieval_windownew_frame"
	name = "中世纪窗框"
	desc = "一个黑暗时代的窗户,只是没有窗户."
	stucco_window = FALSE

/obj/structure/window_frame/oriental
	icon_state = "oriental_windownew_frame"
	name = "东方窗框"
	desc = "一个东方式窗户,只是没有窗户."
	stucco_window = FALSE

/obj/structure/window_frame/bamboo
	icon_state = "bamboo_windownew_frame"
	name = "竹制窗框"
	desc = "一个由竹子制成的窗框."
	stucco_window = FALSE

/obj/structure/window_frame/clay
	icon_state = "clay_windownew_frame"
	name = "黏土窗框"
	desc = "黏土墙上的一个没有玻璃的空洞."
	health = 80
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/redearth
	icon_state = "red_earthwindownew_frame"
	name = "红陶窗框"
	desc = "一个没有玻璃的三格红陶窗框."
	health = 120
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/villa
	icon_state = "villa_windownew_frame"
	name = "别墅窗框"
	desc = "一个优雅的罗马别墅窗框."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/villafull
	icon_state = "villa_windownew_fullframe"
	name = "别墅全窗框"
	desc = "一个优雅的大型罗马别墅窗框."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/brick
	icon_state = "brick_windownew_frame"
	name = "砖制窗框"
	desc = "一个由砖块制成的窗框."
	health = 200
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/brickfull
	icon_state = "brick_windownew_fullframe"
	name = "全砖窗框"
	desc = "一个由砖块制成的全窗窗框."
	health = 200
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/stone
	icon_state = "stone_windownew_frame"
	name = "石制窗框"
	desc = "雕刻石头以支撑几块玻璃窗格."
	health = 250
	flammable = FALSE
	stucco_window = TRUE

/obj/structure/window_frame/stonefull
	icon_state = "stone_windownew_fullframe"
	name = "全石窗框"
	desc = "雕刻石头以支撑一整扇大窗的玻璃."
	health = 250
	flammable = FALSE
	stucco_window = TRUE

/obj/structure/window_frame/marble
	icon_state = "marble_windownew_frame"
	name = "大理石窗框"
	desc = "雕刻大理石以支撑几块玻璃窗格."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/marblefull
	icon_state = "marble_windownew_fullframe"
	name = "全石窗框"
	desc = "雕刻大理石以支撑一整扇大窗的玻璃."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/sandstone
	icon_state = "sandstone_windownew_frame"
	name = "砂岩窗框"
	desc = "雕刻砂岩以支撑一些玻璃.."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/sandstonefull
	icon_state = "sandstone_windownew_fullframe"
	name = "砂岩窗框"
	desc = "雕刻砂岩以支撑一整扇大窗的玻璃.."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/redsandstone
	icon_state = "redsandstone_windownew_frame"
	name = "红砂岩窗框"
	desc = "雕刻红砂岩以支撑一些玻璃.."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/redsandstonefull
	icon_state = "redsandstone_windownew_fullframe"
	name = "红砂岩窗框"
	desc = "雕刻红砂岩以支撑一整扇大窗的玻璃.."
	health = 250
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/sumerian
	icon_state = "sumerian_windownew_frame"
	name = "苏美尔窗框"
	desc = "一个由黏土制成的苏美尔窗户,可以安装玻璃."
	health = 150
	flammable = FALSE
	stucco_window = FALSE

/obj/structure/window_frame/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/stucco/generic) && (stucco_window))
		if (!istype(src, /obj/structure/window_frame/stonefull) && !istype(src, /obj/structure/window_frame/stone))
			to_chat(user, "你开始往木制窗框上涂抹灰泥...")
			if (do_after(user, 20, src))
				to_chat(user, "你完成了往木制窗框上涂抹灰泥,并在其上进行了粉刷.")
				new /obj/structure/window_frame/redearth(loc)
				qdel(W)
				qdel(src)
	if (istype(W, /obj/item/weapon/stucco/roman) && (stucco_window))
		if (istype(src, /obj/structure/window_frame/stone))
			to_chat(user, "你开始往石制窗户上涂抹罗马灰泥...")
			if (do_after(user, 20, src))
				to_chat(user, "你完成了往石制窗户上涂抹罗马灰泥,并在其上进行了粉刷.")
				new /obj/structure/window_frame/villa(loc)
				qdel(W)
				qdel(src)
		if (istype(src, /obj/structure/window_frame/stonefull))
			to_chat(user, "你开始往全石窗户上涂抹罗马灰泥...")
			if (do_after(user, 20, src))
				to_chat(user, "你完成了往全石窗户上涂抹罗马灰泥,并在其上进行了粉刷.")
				new /obj/structure/window_frame/villafull(loc)
				qdel(W)
				qdel(src)
	if (istype(W, /obj/item/stack/material/glass))
		var/obj/item/stack/S = W
		if (S.amount >= 3)
			visible_message("<span class = 'notice'>[user]开始往窗框上安装玻璃...</span>")
			if (do_after(user, 50, src))
				if (istype(src, /obj/structure/window_frame/shoji))
					new/obj/structure/window/classic/shoji(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/metal))
					new/obj/structure/window/classic/metal(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/portholefull))
					new/obj/structure/window/classic/portholefull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/medieval))
					new/obj/structure/window/classic/medieval(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/oriental))
					new/obj/structure/window/classic/oriental(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/bamboo))
					new/obj/structure/window/classic/bamboo(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/clay))
					new/obj/structure/window/classic/clay(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/redearth))
					new/obj/structure/window/classic/redearth(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/villa))
					new/obj/structure/window/classic/villa(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/villafull))
					new/obj/structure/window/classic/villafull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/brick))
					new/obj/structure/window/classic/brick(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/brickfull))
					new/obj/structure/window/classic/brickfull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/stone))
					new/obj/structure/window/classic/stone(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/stonefull))
					new/obj/structure/window/classic/stonefull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/marble))
					new/obj/structure/window/classic/marble(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/marblefull))
					new/obj/structure/window/classic/marblefull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/sandstone))
					new/obj/structure/window/classic/sandstone(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/sandstonefull))
					new/obj/structure/window/classic/sandstonefull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/redsandstone))
					new/obj/structure/window/classic/redsandstone(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/redsandstonefull))
					new/obj/structure/window/classic/redsandstonefull(get_turf(src))
				else if (istype(src, /obj/structure/window_frame/sumerian))
					new/obj/structure/window/classic/sumerian(get_turf(src))
				else
					new/obj/structure/window/classic(get_turf(src))
				visible_message("<span class = 'notice'>[user]往窗框上安装了玻璃.</span>")
				S.use(3)
				qdel(src)
		else
			to_chat(user, "<span class = 'warning'>你至少需要3块玻璃板.</span>")
	else
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if (W.damtype == BRUTE || W.damtype == BURN)
			user.do_attack_animation(src)
			health -= (W.force * 0.2)
	if (health <= 0)
		visible_message("<span class = 'notice'>窗户被[user]打破了!</span>")
		qdel(src)
		return
/obj/structure/window/classic
	desc = "一个不错的老式窗户."
	icon_state = "windownew"
	basestate = "windownew"
	glasstype = /obj/item/stack/material/glass
	maximal_heat = T0C + 100
	damage_per_fire_tick = 5.0
	maxhealth = 20.0
	layer = MOB_LAYER + 0.02
	density = FALSE // so we can touch curtains from any direction
	flammable = TRUE
	glassed = TRUE

/obj/structure/window/clean
	desc = "一个不错的老式窗户."
	icon_state = "window_clear"
	basestate = "window_clear"
	glasstype = /obj/item/stack/material/glass
	maximal_heat = T0C + 100
	damage_per_fire_tick = 5.0
	maxhealth = 20.0
	layer = MOB_LAYER + 0.02
	density = FALSE // so we can touch curtains from any direction
	flammable = TRUE
	glassed = TRUE


/obj/structure/window/clean/reinforced
	flammable = FALSE
	reinf = TRUE
	maxhealth = 200.0
	not_movable = TRUE
	not_disassemblable = TRUE
	density = TRUE
/obj/structure/window/clean/reinforced/metal
	icon_state = "windowmetal"


/obj/structure/window/clean/reinforced/metal/indestructible
	name = "坚不可摧的玻璃"
	icon_state = "windowmetal"
	maxhealth = 6000

/obj/structure/window/clean/reinforced/bank_glass
	name = "强化玻璃"
	icon = 'icons/obj/structures.dmi'
	icon_state = "bank_glass"
	basestate = "bank_glass"
	maxhealth = 1000
	density = TRUE
	flammable = FALSE

/obj/structure/window/classic/shoji
	icon_state = "shoji_windownew"
	basestate = "shoji_windownew"
	name = "障子窗"
	desc = "一个不错的老式窗户,只是日式风格的."

/obj/structure/window/classic/metal
	icon_state = "windowmetal"
	basestate = "windowmetal"
	flammable = FALSE
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	maxhealth = 300.0

/obj/structure/window/classic/portholefull
	icon_state = "metal_porthole_full"
	name = "全金属舷窗"
	desc = "一个大型金属舷窗,带有一大片拉伸的玻璃."
	flammable = FALSE
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	maxhealth = 300.0

/obj/structure/window/classic/medieval_old
	icon_state = "medieval_windownew"
	basestate = "medieval_windownew"
	name = "中世纪窗户"
	desc = "一个黑暗时代的窗户."

/obj/structure/window/classic/oriental
	icon_state = "oriental_windownew"
	basestate = "oriental_windownew"
	name = "东方窗户"
	desc = "一个东方式窗户."

/obj/structure/window/classic/bamboo
	icon_state = "bamboo_windownew"
	basestate = "bamboo_windownew"
	name = "竹制窗户"
	desc = "一个由竹子制成的竹窗."

/obj/structure/window/classic/clay
	icon_state = "clay_windownew"
	icon_state = "clay_windownew"
	name = "黏土窗户"
	desc = "黏土墙上的一个带有玻璃的粗糙空洞."
	flammable = FALSE
	maximal_heat = T0C + 1400
	damage_per_fire_tick = 1.5
	maxhealth = 150.0

/obj/structure/window/classic/redearth
	icon_state = "red_earthwindownew"
	basestate = "red_earthwindownew"
	name = "红陶窗户"
	desc = "一个三格红陶窗户."
	flammable = FALSE
	maximal_heat = T0C + 1400
	damage_per_fire_tick = 1.0
	maxhealth = 200.0

/obj/structure/window/classic/villa
	icon_state = "villa_windownew"
	basestate = "villa_windownew"
	name = "别墅窗户"
	desc = "一个优雅的罗马别墅窗户."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE

/obj/structure/window/classic/villafull
	icon_state = "villa_windownew_full"
	basestate = "villa_windownew_full"
	name = "别墅全窗"
	desc = "一个优雅的大型罗马别墅全窗."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE

/obj/structure/window/classic/brick
	icon_state = "brick_windownew"
	name = "砖制窗户"
	desc = "一扇砖窗,由砖块砌成."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE

/obj/structure/window/classic/brickfull
	icon_state = "brick_windownew_full"
	name = "全砖窗"
	desc = "一扇全砖窗,由砖块砌成."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE

/obj/structure/window/classic/stone
	icon_state = "stone_windownew"
	name = "石窗"
	desc = "一扇石窗,带有玻璃覆盖的孔洞."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/stonefull
	icon_state = "stone_windownew_full"
	name = "全石窗"
	desc = "一扇全石窗,带有大块玻璃覆盖的孔洞."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/marble
	icon_state = "marble_windownew"
	name = "大理石窗"
	desc = "一扇大理石窗,带有玻璃覆盖的孔洞."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/marblefull
	icon_state = "marble_windownew_full"
	name = "全大理石窗"
	desc = "一扇全大理石窗,带有大块玻璃覆盖的孔洞."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/sandstone
	icon_state = "sandstone_windownew"
	name = "砂岩窗"
	desc = "砂岩墙带有玻璃窗."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/sandstonefull
	icon_state = "sandstone_windownew_full"
	name = "全砂岩窗"
	desc = "砂岩墙带有大块玻璃窗."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/redsandstone
	icon_state = "redsandstone_windownew"
	name = "红砂岩窗"
	desc = "红砂岩墙带有玻璃窗."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/redsandstonefull
	icon_state = "redsandstone_windownew_full"
	name = "全红砂岩窗"
	desc = "红砂岩墙带有大块玻璃窗."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 250
	flammable = FALSE

/obj/structure/window/classic/sumerian
	icon_state = "sumerian_windownew"
	name = "苏美尔窗"
	desc = "苏美尔泥墙,上面嵌有一些玻璃."
	flammable = FALSE
	maximal_heat = T0C + 1400
	damage_per_fire_tick = 1.0
	maxhealth = 200.0

/obj/structure/window/classic/abashiri
	icon_state = "abashiri0"
	name = "窗户"
	desc = "一扇嵌在墙内的窗户."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE
	var/base_icon_state = "abashiri"
	var/adjusts = TRUE
	mergewith = list(/obj/structure/window/classic/abashiri,/obj/structure/window_frame/abashiri,/turf/wall/abashiri,/obj/covers/wood_wall/abashiri)
/obj/structure/window/classic/abashiri/check_relatives(var/update_self = FALSE, var/update_others = FALSE)
	if (!adjusts)
		return
	var/junction
	if (update_self)
		junction = FALSE
	for (var/checkdir in cardinal)
		var/turf/T = get_step(src, checkdir)
		for(var/atom/CV in T)
			if (!can_join_with(CV))
				continue
			if (update_self)
				if (can_join_with(CV))
					junction |= get_dir(src,CV)
			if (update_others)
				CV.check_relatives(1,0)
	if (!isnull(junction))
		icon_state = "[base_icon_state][junction]"
	return

/obj/structure/window/classic/abashiri/can_join_with(var/atom/W)
	if (istype(W,src))
		return TRUE
	for (var/i in mergewith)
		if (istype(W,i))
			return TRUE
	return FALSE
/obj/structure/window/classic/abashiri/update_icon()
	..()
	check_relatives(1,1)
/obj/structure/window/classic/abashiri/New()
	..()
	check_relatives(1,1)

/obj/structure/window/classic/abashiri/Destroy()
	check_relatives(0,1)
	..()
/obj/structure/window/classic/reinforced
	reinf = TRUE

/obj/structure/window/classic/is_full_window()
	return TRUE

/obj/structure/window/classic/take_damage(damage)
	if (damage > 12 || (damage > 5 && prob(damage * 5)))
		if (!reinf || (reinf && prob(20)))
			shatter()
	else return

/obj/structure/window/classic/hitby(AM as mob|obj)
	..()
	visible_message("<span class='danger'>[src]被[AM]击中了.</span>")
	var/tforce = FALSE
	if (ismob(AM))
		tforce = 40
	else if (isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	if (reinf) tforce *= 0.25
	take_damage(tforce)

/obj/structure/window/classic/bullet_act(var/obj/item/projectile/P)
	if (!P || !P.nodamage)
		shatter()
		return PROJECTILE_CONTINUE


/obj/structure/window/classic/update_icon()
	return

/obj/structure/window/classic/update_nearby_icons()
	return

/obj/structure/window/classic/metal/shatter(var/display_message = TRUE)
	var/myturf = get_turf(src)
	spawn (1)
		new/obj/structure/window_frame/metal(myturf)
	..(display_message)

/obj/structure/window/New(Loc, constructed=0)
	..()

	//player-constructed windows
	if (constructed)
		state = FALSE


/obj/structure/window/classic/medieval
	icon_state = "medieval_glass0"
	name = "窗户"
	desc = "一扇嵌在墙内的窗户."
	maximal_heat = T0C + 1600
	damage_per_fire_tick = 1.0
	health = 200
	flammable = FALSE
	var/base_icon_state = "medieval_glass"
	var/adjusts = TRUE
	mergewith = list(/obj/structure/window/classic/medieval,/obj/structure/window_frame/medieval,/obj/covers/wood_wall/medieval)
/obj/structure/window/classic/medieval/check_relatives(var/update_self = FALSE, var/update_others = FALSE)
	if (!adjusts)
		return
	var/junction
	if (update_self)
		junction = FALSE
	for (var/checkdir in cardinal)
		var/turf/T = get_step(src, checkdir)
		for(var/atom/CV in T)
			if (!can_join_with(CV))
				continue
			if (update_self)
				if (can_join_with(CV))
					junction |= get_dir(src,CV)
			if (update_others)
				CV.check_relatives(1,0)
	if (!isnull(junction))
		icon_state = "[base_icon_state][junction]"
	return

/obj/structure/window/classic/medieval/can_join_with(var/atom/W)
	if (istype(W,src))
		return TRUE
	for (var/i in mergewith)
		if (istype(W,i))
			return TRUE
	return FALSE
/obj/structure/window/classic/medieval/update_icon()
	..()
	check_relatives(1,1)
/obj/structure/window/classic/medieval/New()
	..()
	check_relatives(1,1)

/obj/structure/window/classic/medieval/Destroy()
	check_relatives(0,1)
	..()