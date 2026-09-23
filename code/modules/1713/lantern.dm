/obj/item/flashlight/lantern
	name = "提灯"
	icon_state = "lantern"
	desc = "一盏简单的提灯."
	brightness_on = 6			// luminosity when on
	light_color = rgb(200, 255, 200) // green tint
	on_state = "lantern-on"
	off_state = "lantern"
	value = 12
	fuel = 0 //starts empty
	unlimited = FALSE

/obj/item/flashlight/lantern/copper
	name = "铜灯"
	icon_state = "copperlamp"
	desc = "一盏简单的铜制提灯."
	brightness_on = 6			// luminosity when on
	light_color = rgb(200, 255, 200) // green tint
	on_state = "copperlamp-on"
	off_state = "copperlamp"
	value = 9
	fuel = 0 //starts empty
	unlimited = FALSE

/obj/item/flashlight/lantern/bronze
	name = "青铜埃齐灯"
	icon_state = "etsy"
	item_state = "etsy"
	desc = "一盏带有多根灯芯的青铜灯."
	brightness_on = 8			// luminosity when on
	light_color = rgb(200, 255, 200) // green tint
	on_state = "etsy-on"
	off_state = "etsy"
	value = 16
	fuel = 0 //starts empty
	unlimited = FALSE

/obj/item/flashlight/lantern/bronze/update_icon()
	..()
	if (on)
		item_state = "etsy-on"
	else
		item_state = "etsy"

/obj/item/flashlight/lantern/bronze/on
	icon_state = "torch-on"
	item_state = "torch-on"
	on = TRUE

/obj/item/flashlight/lantern/attack_self(mob/user)
	if (!isturf(user.loc))
		to_chat(user, "在此[user.loc]中你无法开灯.") //To prevent some lighting anomalities.)
		return FALSE
	if (fuel > 0)
		on = !on
		playsound(loc, turn_on_sound, 75, TRUE)
		update_icon()
		user.update_action_buttons()
		return TRUE
	else if (fuel <= 0)
		visible_message("<span class='warning'>\The [src]没有燃料了!</span>")

/obj/item/flashlight/lantern/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers))
		if (W.reagents.has_reagent("petroleum", 1))
			var/regamt = W.reagents.get_reagent_amount("petroleum")
			W.reagents.remove_reagent("petroleum", regamt)
			fuel += (regamt*120)
			to_chat(user, "你用石油给提灯补充了燃料.")
			return
		else if (W.reagents.has_reagent("olive_oil", 1))
			var/regamt = W.reagents.get_reagent_amount("olive_oil")
			W.reagents.remove_reagent("olive_oil", regamt)
			fuel += (regamt*120)
			to_chat(user, "你用橄榄油给提灯补充了燃料.")
			return
		else if (W.reagents.has_reagent("fat_oil", 1))
			var/regamt = W.reagents.get_reagent_amount("fat_oil")
			W.reagents.remove_reagent("fat_oil", regamt)
			fuel += (regamt*120)
			to_chat(user, "你用油脂给提灯补充燃料.")
			return
/obj/item/flashlight/lantern/attack_hand(mob/user as mob)
	if (loc != user && anchored)
		if (on)
			on = FALSE
			return
		else if (!on && fuel > 0)
			on = TRUE
			return
		else
			on = FALSE
			return
	..()

/obj/item/flashlight/lantern/on
	icon_state = "lantern-on"
	on = TRUE

/obj/item/flashlight/New()
	..()
	if (!unlimited)
		do_torch()

/obj/item/flashlight/lantern/anchored
	on_state = "lantern-on_a"
	off_state = "lantern_a"
	icon_state = "lantern_a"
	anchored = TRUE
	unlimited = TRUE
	fuel = 10

/obj/item/flashlight/lamp/oldlamp
	name = "台灯"
	on_state = "oldlamp-on"
	off_state = "oldlamp"
	icon_state = "oldlamp"
	anchored = FALSE
	unlimited = TRUE
	fuel = INFINITY

/obj/item/flashlight/lamp/littlelamp
	name = "小灯"
	on_state = "littlelamp-on"
	off_state = "littlelamp"
	icon_state = "littlelamp"
	unlimited = TRUE
	fuel = INFINITY

/obj/item/flashlight/lamp/littlelamp/desklamp
	name = "书桌灯"
	on_state = "lampdesk_on"
	off_state = "lampdesk"
	icon_state = "lampdesk"
	unlimited = TRUE
	fuel = INFINITY

/obj/item/flashlight/lantern/on/anchored
	on_state = "lantern-on"
	off_state = "lantern_on"
	icon_state = "lantern-on"
	anchored = TRUE
	unlimited = TRUE
	fuel = 10

/obj/item/flashlight/torch
	name = "火把"
	icon_state = "torch"
	desc = "一根顶端涂有动物油脂的简单木棍."
	brightness_on = 4			// luminosity when on
	light_color = rgb(254, 200, 200) // red tint
	on_state = "torch-on"
	off_state = "torch"
	item_state = "torch"
	value = 6
	fuel = 300 // 5 mins

/obj/item/flashlight/torch/update_icon()
	..()
	if (on)
		item_state = "torch-on"
	else
		item_state = "torch"

/obj/item/flashlight/torch/on
	icon_state = "torch-on"
	item_state = "torch-on"
	on = TRUE

/obj/item/flashlight/torch/on/unlimited
	unlimited = TRUE
	anchored = TRUE


/obj/item/flashlight/tiki_torch
	name = "提基火把"
	desc = "一支提基风格的火把."
	brightness_on = 8			// luminosity when on
	light_color = rgb(254, 200, 200) // red tint
	on_state = "tikitorch-on"
	off_state = "tikitorch"
	item_state = "torch"
	icon_state = "tikitorch"
	value = 10
	fuel = 600 // 10 mins
	anchored = FALSE
	flammable = TRUE

/obj/item/flashlight/tiki_torch/update_icon()
	..()
	if (on)
		item_state = "tikitorch-on"
	else
		item_state = "tikitorch"

/obj/item/flashlight/tiki_torch/attack_hand(var/mob/living/human/user)
	attack_self(user)

/obj/item/flashlight/tiki_torch/verb_pickup()
	set src in oview(1)
	set category = null
	set name = "Pick up"

	return

/obj/item/flashlight/proc/do_torch()
	spawn(10)
		if (fuel == 50 && on)
			visible_message("<span class='warning'>\The [src] 即将耗尽!</span>")
			fuel -= 1
			do_torch()
		else if (fuel > 0 && on)
			fuel -= 1
			do_torch()
		else if (fuel <= 0 && on)
			visible_message("\The [src] 熄灭了.")
			if (istype(src, /obj/item/flashlight/torch) || istype(src, /obj/item/flashlight/tiki_torch))
				qdel(src)
				return
			else
				on = FALSE
				update_icon()
				do_torch()
		else if (on == FALSE)
			do_torch()

/obj/item/flashlight/tiki_torch/on
	unlimited = TRUE
	icon_state = "tikitorch-on"
	item_state = "tikitorch-on"
	on = TRUE
/obj/item/flashlight/tiki_torch/on/anchor
	anchored = TRUE

/obj/item/flashlight/tiki_torch/on/anchor/unlimited
	unlimited = TRUE
/obj/item/flashlight/flashlight
	unlimited = TRUE
	name = "手电筒"
	desc = "一支电子手电筒."
	icon_state = "flashlight_off"
	item_state = "modern_flashlight"
	on_state = "flashlight_on"
	off_state = "flashlight_off"
	slot_flags = SLOT_BELT | SLOT_ID | SLOT_POCKET
	unlimited = TRUE

/obj/item/flashlight/modern
	unlimited = TRUE
	name = "手电筒"
	desc = "一支电子手电筒."
	icon_state = "modernlight_off"
	item_state = "modern_flashlight"
	on_state = "modernlight_on"
	off_state = "modernlight_off"
	slot_flags = SLOT_BELT | SLOT_ID | SLOT_POCKET

//"spooky" version of the flashlight, reduced range, red tint
/obj/item/flashlight/modern/darknight
	icon_state = "militarylight_off"
	item_state = "militarylight"
	on_state = "militarylight_on_red"
	off_state = "militarylight_off"
	light_range = 2.5
	brightness_on = 5
	light_color = "#ad2005"

/obj/item/flashlight/militarylight
	unlimited = TRUE
	name = "军用手电筒"
	desc = "一支电子军用手电筒. 配有可调节镜片."
	icon_state = "militarylight_off"
	item_state = "militarylight"
	on_state = "militarylight_on"
	off_state = "militarylight_off"
	slot_flags = SLOT_BELT | SLOT_ID | SLOT_POCKET
	var/lens = 3
	secondary_action = TRUE

/obj/item/flashlight/militarylight/secondary_attack_self(mob/living/human/user)

	lens +=1
	if (lens > 3)
		lens = 1

	switch (lens)
		if (1)
			light_range = 1.5
			brightness_on = 2.5
			light_color = "#ad2005"
			on_state = "militarylight_on_red"
			lens = 1
			to_chat(user, "<span class='notice'>你在手电筒上装上了<b><font color =#960000>红色</font color></b>镜片.</span>")
			update_icon()
			return
		if (2)
			light_range = 1.5
			brightness_on = 2.5
			light_color = "#17ad2a"
			on_state ="militarylight_on_green"
			lens = 2
			update_icon()
			to_chat(user, "<span class='notice'>你在手电筒上装上了<b><font color=#006400>绿色</font color></b>镜片.</span>")
			return
		if (3)
			light_range = 5
			brightness_on = 5
			light_color = "#fcffd6"
			on_state ="militarylight_on"
			lens = 3
			to_chat(user, "<span class='notice'>你<b>取下</b>了手电筒上的镜片.</span>")
			update_icon()
			return

/obj/item/flashlight/militarylight/alt
	unlimited = TRUE
	icon_state = "militarylightalt_off"
	item_state = "militarylightalt"
	on_state = "militarylightalt_on"
	off_state = "militarylightalt_off"

/obj/item/flashlight/militarylight/alt/secondary_attack_self(mob/living/human/user)

	lens +=1
	if (lens > 3)
		lens = 1

	switch (lens)
		if (1)
			light_range = 1.5
			brightness_on = 2.5
			light_color = "#ad2005"
			on_state = "militarylightalt_on_red"
			lens = 1
			to_chat(user, "<span class='notice'>你在手电筒上装上了<b><font color =#960000>红色</font color></b>镜片.</span>")
			update_icon()
			return
		if (2)
			light_range = 1.5
			brightness_on = 2.5
			light_color = "#17ad2a"
			on_state ="militarylightalt_on_green"
			lens = 2
			update_icon()
			to_chat(user, "<span class='notice'>你在手电筒上装上了<b><font color=#006400>绿色</font color></b>镜片.</span>")
			return
		if (3)
			light_range = 5
			brightness_on = 5
			light_color = "#fcffd6"
			on_state ="militarylightalt_on"
			lens = 3
			to_chat(user, "<span class='notice'>你<b>取下</b>了手电筒上的镜片.</span>")
			update_icon()
			return


/obj/item/flashlight/japflashlight
	unlimited = TRUE
	name = "日本手摇手电筒"
	desc = "一支带有手摇发电机构且亮度可调的日本手电筒."
	icon_state = "flashlightjap_off"
	item_state = "militarylight"
	on_state = "flashlightjap_on"
	off_state = "flashlightjap_off"
	slot_flags = SLOT_BELT | SLOT_ID | SLOT_POCKET
	var/intensity = 3
	secondary_action = TRUE

/obj/item/flashlight/japflashlight/secondary_attack_self(mob/living/human/user)

	intensity +=1
	if (intensity > 3)
		intensity = 1

	switch (intensity)
		if (1)
			light_range = 3
			brightness_on = 3
			intensity = 1
			to_chat(user, "<span class='notice'>你<b>调低</b>了手电筒的亮度.</span>")
			return
		if (2)
			light_range = 2
			brightness_on = 2
			intensity = 2
			to_chat(user, "<span class='notice'>你<b>进一步调低</b>了手电筒的亮度.</span>")
			return
		if (3)
			light_range = 5
			brightness_on = 5
			intensity = 3
			to_chat(user, "<span class='notice'>你将手电筒的亮度调回<b>正常</b>.</span>")
			return