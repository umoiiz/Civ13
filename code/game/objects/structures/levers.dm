/obj/structure/functions
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/skeleton_activator
	name = "激活骷髅"
	desc = "激活骷髅。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/skeleton_activator/attack_hand(mob/living/user)
	for (var/obj/effect/spawner/mobspawner/skeletons/SK)
		SK.activated = 1
	for (var/obj/effect/spawner/mobspawner/attacker/SKA)
		SKA.activated = 1
	to_chat(user, "骷髅生成器现已启用。")
	return

/obj/structure/skeleton_deactivator
	name = "停用骷髅"
	desc = "停用骷髅。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/skeleton_deactivator/attack_hand(mob/living/user)
	for (var/obj/effect/spawner/mobspawner/skeletons/SK)
		SK.activated = 0
	for (var/obj/effect/spawner/mobspawner/attacker/SKA)
		SKA.activated = 0
	to_chat(user, "骷髅生成器现已禁用。")
	return

/obj/structure/skeleton_configurator
	name = "配置骷髅"
	desc = "配置骷髅的生成点。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/skeleton_configurator/attack_hand(mob/living/user)
	var/maxamount = input(user, "What is the maximum ammount of Skeletons that can be alive, per spawn point? 1 to 50. Default 5.") as num
	maxamount = Clamp(maxamount, 1, 50)
	var/timer = input(user, "What is the delay between spawnings, in seconds? The real value will vary between 100% and 150% of the value you put here. 5 to 300. Default 40.") as num
	timer = Clamp(timer, 5, 300)
	timer *= 10
	for (var/obj/effect/spawner/mobspawner/skeletons/SK)
		SK.max_number = maxamount
		SK.timer = timer
	for (var/obj/effect/spawner/mobspawner/attacker/SKA)
		SKA.max_number = maxamount
		SKA.timer = timer
	to_chat(user, "骷髅生成器已配置为[timer/10]秒,最大数量[maxamount]。")
	return

//BRITISH

/obj/structure/townmilitia_activator
	name = "激活城镇民兵"
	desc = "激活城镇民兵。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/townmilitia_activator/attack_hand(mob/living/user)
	for (var/obj/effect/spawner/mobspawner/townmilitia/RC)
		RC.activated = 1
	to_chat(user, "城镇民兵生成器现已启用。")
	return

/obj/structure/townmilitia_deactivator
	name = "停用城镇民兵"
	desc = "停用城镇民兵。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/townmilitia_deactivator/attack_hand(mob/living/user)
	for (var/obj/effect/spawner/mobspawner/townmilitia/RC)
		RC.activated = 0
	to_chat(user, "城镇民兵生成器现已禁用。")
	return

/obj/structure/townmilitia_configurator
	name = "配置城镇民兵"
	desc = "配置城镇民兵的生成点。"
	icon = 'icons/obj/decals.dmi'
	icon_state = "woodsign"
	anchored = TRUE
	density = TRUE

/obj/structure/townmilitia_configurator/attack_hand(mob/living/user)
	var/maxamount = input(user, "What is the maximum ammount of town militias that can be alive, per spawn point? 1 to 50. Default 5.") as num
	maxamount = Clamp(maxamount, 1, 50)
	var/timer = input(user, "What is the delay between spawnings, in seconds? The real value will vary between 100% and 150% of the value you put here. 5 to 300. Default 75.") as num
	timer = Clamp(timer, 5, 300)
	timer *= 10
	for (var/obj/effect/spawner/mobspawner/townmilitia/RC)
		RC.max_number = maxamount
		RC.timer = timer
	to_chat(user, "城镇民兵生成器已配置为[timer/10]秒,最大数量[maxamount]。")
	return