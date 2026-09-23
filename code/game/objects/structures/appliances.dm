/obj/structure/TV
	name = "电视机"
	desc = "一台用于观看广播节目的电视机. 它处于关闭状态."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "TV"
	anchored = TRUE
	var/destroyed = FALSE
	var/active = FALSE
	density = TRUE
	flammable = FALSE
	var/health = 100
	var/maxhealth = 100
	not_movable = TRUE
	not_disassemblable = TRUE
	var/mob/living/human/stored_unit = null

	var/protection_chance = 85 //odds of something hitting the TV

/obj/structure/TV/active //no television channels... yet.
	icon_state = "TV_wn"
	desc = "一台用于观看广播节目的电视机. 它处于开启状态."
	active = TRUE

/obj/structure/TV/active/examine(var/mob/living/L)
	to_chat(L, "目前电视上除了雪花点什么也没有. 真是典型.")
	return

/* Clocks*/

/obj/structure/TV/grandfather
	name = "落地钟"
	desc = "一座高大的木制落地钟. 随着时间流逝, 钟的指针和钟摆频繁摆动."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "grandfather_clock_a"
	anchored = TRUE
	destroyed = FALSE
	active = TRUE
	density = TRUE
	flammable = TRUE
	health = 100
	maxhealth = 100
	not_movable = FALSE
	not_disassemblable = FALSE
	protection_chance = 85

/obj/structure/TV/grandfather/inactive
	icon_state = "grandfather_clock"
	desc = "一座高大的木制落地钟. 钟的指针和钟摆已经静止不动, 毫无生气."
	active = FALSE

/obj/structure/TV/grandfather/inactive/examine(var/mob/living/L) //it would be fun to have nukes set clocks inactive or halt at a time.
	to_chat(L, "这座钟已经停止运行, 你无法判断当前时间.")
	return

/obj/structure/TV/grandfather/examine(var/mob/living/L)
	to_chat(L, "<big>现在是[clock_time()].</big>")
	return

/obj/structure/TV/television //in prep for actually interesting and watchable tv's
	name = "电视机"
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "TV"
	anchored = TRUE
	destroyed = FALSE
	active = FALSE
	density = TRUE
	flammable = FALSE
	health = 100
	maxhealth = 100
	not_movable = TRUE
	not_disassemblable = TRUE

	protection_chance = 85

/obj/structure/TV/television/active
	icon_state = "TV_wn"
	desc = "一台用于观看广播节目的电视机. 它处于开启状态."
	active = TRUE

/obj/structure/TV/television/active/examine(var/mob/living/L)
	to_chat(L, "目前电视上除了雪花点什么也没有. 真是典型.")
	return

/* TV Technical*/

/obj/structure/TV/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/structure/drone))
		var/obj/structure/drone/D = mover
		if (D.flying)
			return TRUE
	if (istype(mover, /obj/item/projectile))
		return prob(100-protection_chance)
	else
		return FALSE

/obj/structure/TV/bullet_act(var/obj/item/projectile/proj)
	health -= proj.damage * 0.01
	visible_message("<span class='warning'>\The [src]被\the [proj.name]击中!</span>")
	try_destroy()

/obj/structure/TV/fire_act(temperature)
	if (prob(35 * (temperature/500)))
		visible_message("<span class = 'warning'>\The [src]被火焰摧毁!</span>")
		qdel(src)

/obj/structure/TV/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	switch(W.damtype)
		if ("fire")
			health -= W.force * TRUE
		if ("brute")
			health -= W.force * 0.20
	playsound(get_turf(src), 'sound/weapons/smash.ogg', 100)
	user.do_attack_animation(src)
	try_destroy()
	..()

/obj/structure/TV/proc/try_destroy()
	if (health <= 0)
		if (stored_unit)
			release_stored()
		visible_message("<span class='danger'>[src]碎成了碎片!</span>")
		qdel(src)
		return

/obj/structure/TV/attack_hand(mob/user as mob)
	if (stored_unit)
		if (user == stored_unit)
			release_stored()
	else
		..()
/obj/structure/TV/proc/release_stored()
	if (stored_unit)
		if (stored_unit.client)
			stored_unit.client.eye = stored_unit.client.mob
			stored_unit.client.perspective = MOB_PERSPECTIVE
			stored_unit.forceMove(get_turf(src))
			stored_unit = null
			return

/* Television Technical (reserved)*/

/obj/structure/TV/television/attackby(obj/O as obj, mob/living/human/user as mob)
	if (istype(O,/obj/item/weapon/wrench))
		playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		to_chat(user, (anchored ? "<span class='notice'>You unfasten \the [src] from the floor.</span>" : "<span class='notice'>You secure \the [src] to the floor.</span>"))
		anchored = !anchored
	else if (istype(O,/obj/item/weapon/hammer))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始砸碎\the [src].</span>")
		if (do_after(user,30,src))
			to_chat(user, "<span class='notice'>你粗暴地砸碎了\the [src].</span>")
			new /obj/item/stack/material/iron(loc)
			new /obj/item/stack/material/iron(loc)
			new /obj/item/stack/material/electronics(loc)
			qdel(src)
	else if (istype(O,/obj/item/weapon/hammer/modern))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始拆解\the [src].</span>")
		if (do_after(user,20,src))
			to_chat(user, "<span class='notice'>你小心地拆解了\the [src].</span>") //scavenging, the new proceeds auto-stack.
			for (var/i=1, i<=4, i++)
				new /obj/item/stack/material/iron(loc)
			for (var/i=1, i<=3, i++)
				new /obj/item/stack/material/electronics(loc)
			qdel(src)


/* Clocks Technical (reserved)*/

/obj/structure/TV/grandfather/attackby(obj/O as obj, mob/living/human/user as mob)
	if (istype(O,/obj/item/weapon/wrench))
		playsound(loc, 'sound/items/Ratchet.ogg', 100, TRUE)
		to_chat(user, (anchored ? "<span class='notice'>You unfasten \the [src] from the floor.</span>" : "<span class='notice'>You secure \the [src] to the floor.</span>"))
		anchored = !anchored
	else if (istype(O,/obj/item/weapon/hammer))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始砸碎\the [src].</span>")
		if (do_after(user,30,src))
			to_chat(user, "<span class='notice'>你粗暴地砸碎了\the [src].</span>")
			for (var/i=1, i<=3, i++)
				new /obj/item/stack/material/wood(loc)
			qdel(src)
	else if (istype(O,/obj/item/weapon/hammer/modern))
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, TRUE)
		to_chat(user, "<span class='notice'>你开始拆解\the [src].</span>")
		if (do_after(user,20,src))
			to_chat(user, "<span class='notice'>你小心地拆解了\the [src].</span>")
			for (var/i=1, i<=6, i++)
				new /obj/item/stack/material/wood(loc)
			new /obj/item/stack/material/glass(loc)
			new /obj/item/stack/material/glass(loc)
			qdel(src)

/obj/structure/coolingfan
	name = "冷却风扇"
	desc = "一台旋转的冷却风扇. 它处于关闭状态."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "fan"
	anchored = TRUE
	density = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/on = FALSE

/obj/structure/coolingfan/attack_hand(mob/user as mob)
	if (on == FALSE)
		to_chat(usr, "你打开了冷却风扇.")
		icon_state = "fan_working"
		on = TRUE
	else
		to_chat(usr, "你关闭了冷却风扇.")
		icon_state = "fan"
		on = FALSE

