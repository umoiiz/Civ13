var/global/list/ashtray_cache = list()

/obj/item/weapon/material/ashtray
	name = "烟灰缸"
	icon = 'icons/obj/objects.dmi'
	icon_state = "ashtray"
	var/base_icon = "ashtray"
	force_divisor = 0.1
	thrown_force_divisor = 0.1
	var/image/base_image
	var/max_butts = 10

/obj/item/weapon/material/ashtray/New(var/newloc, var/material_name)
	..(newloc, material_name)
	if (!material)
		qdel(src)
		return
	max_butts = round(material.hardness/10) //This is arbitrary but whatever.
	pixel_y = rand(-5, 5)
	pixel_x = rand(-6, 6)
	update_icon()
	return

/obj/item/weapon/material/ashtray/update_icon()
	color = null
	overlays.Cut()
	var/cache_key = "base-[material.name]"
	if (!ashtray_cache[cache_key])
		var/image/I = image('icons/obj/objects.dmi',"ashtray")
		I.color = material.icon_colour
		ashtray_cache[cache_key] = I
	overlays |= ashtray_cache[cache_key]

	if (contents.len == max_butts)
		if (!ashtray_cache["full"])
			ashtray_cache["full"] = image('icons/obj/objects.dmi',"ashtray_full")
		overlays |= ashtray_cache["full"]
		desc = "It's stuffed full."
	else if (contents.len > max_butts/2)
		if (!ashtray_cache["half"])
			ashtray_cache["half"] = image('icons/obj/objects.dmi',"ashtray_half")
		overlays |= ashtray_cache["half"]
		desc = "It's half-filled."
	else
		desc = "An ashtray made of [material.display_name]."

/obj/item/weapon/material/ashtray/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (health <= 0)
		return
	if (istype(W,/obj/item/weapon/cigbutt) || istype(W,/obj/item/clothing/mask/smokable/cigarette) || istype(W, /obj/item/weapon/flame/match))
		if (contents.len >= max_butts)
			to_chat(user, "\The [src]已满.")
			return
		user.remove_from_mob(W)
		W.loc = src

		if (istype(W,/obj/item/clothing/mask/smokable/cigarette))
			var/obj/item/clothing/mask/smokable/cigarette/cig = W
			if (cig.lit == TRUE)
				visible_message("[user]在\the [src]中碾灭了[cig], 将其熄灭.")
				processing_objects.Remove(cig)
				var/obj/item/butt = new cig.type_butt(src)
				cig.transfer_fingerprints_to(butt)
				qdel(cig)
				W = butt
				//spawn(1)
				//	TemperatureAct(150)
			else if (cig.lit == FALSE)
				to_chat(user, "你甚至没有点燃就把[cig]放进了[src]. 你为什么要这么做?")

		visible_message("[user]将[W]放入了[src].")
		user.update_inv_l_hand()
		user.update_inv_r_hand()
		add_fingerprint(user)
		update_icon()
	else
		health = max(0,health - W.force)
		to_chat(user, "你用[W]击中了[src].")
		if (health < 1)
			shatter()
	return

/obj/item/weapon/material/ashtray/throw_impact(atom/hit_atom)
	if (health > 0)
		health = max(0,health - 3)
		if (contents.len)
			visible_message("<span class='danger'>\The [src]猛地撞上[hit_atom], 里面的东西洒了出来!</span>")
		for (var/obj/item/clothing/mask/smokable/cigarette/O in contents)
			O.loc = loc
		if (health < 1)
			shatter()
			return
		update_icon()
	return ..()

/obj/item/weapon/material/ashtray/bronze/New(var/newloc)
	..(newloc, "bronze")

/obj/item/weapon/material/ashtray/glass/New(var/newloc)
	..(newloc, "glass")

/obj/item/weapon/material/ashtray/stone/New(var/newloc)
	..(newloc, "stone")

/obj/item/weapon/material/ashtray/marble/New(var/newloc)
	..(newloc, "marble")