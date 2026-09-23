////Furnaces////
/obj/structure/furnace
	name = "锻铁炉"
	desc = "一座工业锻铁炉,用于将铁冶炼成海绵铁.也可用于回收材料."
	icon = 'icons/obj/metallurgy.dmi'
	icon_state = "bloomery"
	layer = 2.9
	density = TRUE
	anchored = TRUE
	flags = OPENCONTAINER | NOREACT
	var/base_state = "bloomery"
	var/on = FALSE
	var/fuel = 0
	var/iron = 0
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/furnace/update_icon()
	if (on)
		icon_state = "[base_state]_on"
		set_light(4)
	else
		icon_state = base_state
		set_light(0)

/obj/structure/furnace/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench) || (istype(I, /obj/item/weapon/hammer)))
			if (istype(I, /obj/item/weapon/wrench))
				visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"]\the [src][anchored ? "from" : "to"]地面.</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H][anchored ? "unsecures" : "secures"]\the [src][anchored ? "from" : "to"]地面.</span>")
					anchored = !anchored
					return
			else if (istype(I, /obj/item/weapon/hammer))
				visible_message("<span class='warning'>[H]开始拆除\the [src].</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H]拆除了\the [src].</span>")
					empty()
					qdel(src)
					return

		if (istype(I, /obj/item/stack/))
			if (istype(I, /obj/item/stack/material/wood))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],进行冶炼.")

			else if (istype(I, /obj/item/stack/material/bamboo))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/weapon/branch))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/material/leaf))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/dung))
				fuel += I.amount+1
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/ore/charcoal))
				fuel += I.amount*2.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/ore/coal))
				fuel += I.amount*3
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/material/woodplank))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/ore/iron))
				iron += I.amount
				to_chat(H, "你将\the [I]放入\the [src].")

			else
				to_chat(H, "<span class = 'warning'>你无法冶炼这个.</span>")
				return

			H.remove_from_mob(I)
			I.loc = src
			visible_message("<span class = 'notice'>[H]将[I]放入\the [name].</span>")
			qdel(I)
			return
		else if (istype(I, /obj/item/weapon/material))
			var/obj/item/weapon/material/MT = I
			if (MT.get_material_name() == "wood")
				fuel += 1
				to_chat(H, "你打碎\the [MT]并将其放入[src],为其添加燃料.")
				qdel(I)
			else if (MT.get_material_name() == "bronze")
				to_chat(H, "你将\the [MT]冶炼成青铜锭.")
				new/obj/item/stack/material/bronze(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "copper")
				to_chat(H, "你将\the [MT]冶炼成铜锭.")
				new/obj/item/stack/material/copper(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "tin")
				to_chat(H, "你将\the [MT]冶炼成锡锭.")
				new/obj/item/stack/material/tin(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "iron")
				to_chat(H, "你将\the [MT]冶炼成铁锭.")
				new/obj/item/stack/material/iron(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "steel")
				to_chat(H, "你将\the [MT]冶炼成钢板.")
				new/obj/item/stack/material/steel(src.loc)
				qdel(I)
		else if (istype(I, /obj/item) && I.basematerials.len)
			to_chat(H, "你将\the [I]放入\the [src]进行回收.")
			if (I.basematerials[1] == "tin")
				new/obj/item/stack/material/tin(src.loc)
			qdel(I)

		else
			..()
	else
		..()

/obj/structure/furnace/attack_hand(var/mob/living/human/H)
	if (!on && fuel > 1)
		visible_message("<span class = 'notice'>[H]打开了[name].</span>")
		on = TRUE
		fuel -=2
		update_icon()
		spawn (250)
			on = FALSE
			update_icon()
			visible_message("<span class = 'notice'>[name]完成了冶炼.</span>")
			process()
	else
		to_chat(H, "<span class = 'warning'>[name]没有足够的燃料!请用木头或煤炭填充.</span>")


/obj/structure/furnace/process()
	if (iron > 0)
		var/obj/item/stack/ore/iron_sponge/result = new/obj/item/stack/ore/iron_sponge(src.loc)
		result.amount = iron
		iron = 0
		return
/obj/structure/furnace/verb/empty()
	set category = null
	set name = "Empty"
	set src in range(1, usr)
	if (iron > 0)
		var/obj/item/stack/ore/iron/emptyediron = new/obj/item/stack/ore/iron(src.loc)
		emptyediron.amount = iron
		iron = 0


////////ADVANCED METALLURGY STUFF/////////
/obj/structure/furnace/blast_furnace
	name = "高炉"
	desc = "一座工业高炉,用于制造高级合金."
	icon = 'icons/obj/metallurgy.dmi'
	icon_state = "blast_furnace"
	base_state = "blast_furnace"

/obj/structure/furnace/blast_furnace/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench) || (istype(I, /obj/item/weapon/hammer)))
			if (istype(I, /obj/item/weapon/wrench))
				visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"]\the [src][anchored ? "from" : "to"]地面.</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H][anchored ? "unsecures" : "secures"]\the [src][anchored ? "from" : "to"]地面.</span>")
					anchored = !anchored
					return
			else if (istype(I, /obj/item/weapon/hammer))
				visible_message("<span class='warning'>[H]开始拆除\the [src].</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H]拆除了\the [src].</span>")
					empty()
					qdel(src)
					return

		if (istype(I, /obj/item/stack/))
			if (istype(I, /obj/item/stack/material/wood))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],进行冶炼.")

			else if (istype(I, /obj/item/stack/material/bamboo))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/weapon/branch))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/material/leaf))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/dung))
				fuel += I.amount+1
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/ore/charcoal))
				fuel += I.amount*2.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/ore/coal))
				fuel += I.amount*3
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			else if (istype(I, /obj/item/stack/material/woodplank))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")

			if (istype(I, /obj/item/stack/ore/iron))
				iron += I.amount
				to_chat(H, "你将\the [I]放入\the [src].")
			else
				to_chat(H, "<span class = 'warning'>你无法冶炼这个.</span>")
				return

			H.remove_from_mob(I)
			I.loc = src
			visible_message("<span class = 'notice'>[H]将[I]放入\the [name].</span>")
			qdel(I)
			return
		else if (istype(I, /obj/item/weapon/material))
			var/obj/item/weapon/material/MT = I
			if (MT.get_material_name() == "wood")
				fuel += 1
				to_chat(H, "你打碎\the [MT]并将其放入[src],为其添加燃料.")
				qdel(I)
	else
		..()

/obj/structure/furnace/blast_furnace/process()
	if (iron > 0)
		var/obj/item/stack/ore/iron_pig/result = new/obj/item/stack/ore/iron_pig(src.loc)
		result.amount = iron
		iron = 0
		return

////////ADVANCED METALLURGY STUFF/////////
/obj/structure/furnace/kiln
	name = "黏土窑"
	desc = "一座黏土砖窑,用于冶金."
	icon = 'icons/obj/metallurgy.dmi'
	icon_state = "clay_kiln"
	base_state = "clay_kiln"

/obj/structure/furnace/kiln/stone
	name = "石窑"
	desc = "一座石窑,用于冶金."
	icon_state = "stone_kiln"
	base_state = "stone_kiln"

/obj/structure/furnace/kiln/sandstone
	name = "砂岩窑"
	desc = "一座砂岩窑,用于冶金."
	icon_state = "sandstone_kiln"
	base_state = "sandstone_kiln"

/obj/structure/furnace/kiln/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench) || (istype(I, /obj/item/weapon/hammer)))
			if (istype(I, /obj/item/weapon/wrench))
				visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"]\the [src][anchored ? "from" : "to"]地面.</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H][anchored ? "unsecures" : "secures"]\the [src][anchored ? "from" : "to"]地面.</span>")
					anchored = !anchored
					return
			else if (istype(I, /obj/item/weapon/hammer))
				visible_message("<span class='warning'>[H]开始拆除\the [src].</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H]拆除了\the [src].</span>")
					empty()
					qdel(src)
					return

		if (istype(I, /obj/item/stack/))
			if (istype(I, /obj/item/stack/material/wood))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],进行冶炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/bamboo))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/weapon/branch))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/leaf))
				fuel += I.amount+0.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/dung))
				fuel += I.amount+1
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/charcoal))
				fuel += I.amount*2.5
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/coal))
				fuel += I.amount*3
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/woodplank))
				fuel += I.amount
				to_chat(H, "你将\the [I]放入\the [src],为其添加燃料.")
				qdel(I)
				return

			for (var/obj/item/weapon/clay/mold/MCC in contents)
				to_chat(H, "<span class = 'warning'>\The [name] 已满。</span>")
				return

		else if (istype(I, /obj/item/weapon/material))
			var/obj/item/weapon/material/MT = I
			if (MT.get_material_name() == "wood")
				fuel += 1
				to_chat(H, "你打破 \the [MT] 并将其放入 [src],为其补充燃料。")
				qdel(I)
		if (istype(I, /obj/item/weapon/clay/mold))
			var/obj/item/weapon/clay/mold/MC = I
			if (MC.fired && MC.capacity == 0 && MC.max_capacity > 0 && MC.contents_materials.len)
				H.remove_from_mob(I)
				I.loc = src
				visible_message("<span class = 'notice'>[H] 将 [I] 放入 \the [name]。</span>")
				return

/obj/structure/furnace/kiln/process()
	for (var/obj/item/weapon/clay/mold/MCC in contents)
		if (MCC.fired && MCC.capacity == 0 && MCC.max_capacity > 0 && MCC.contents_materials.len)
			if (("copper" in MCC.contents_materials) && ("tin" in MCC.contents_materials))
				MCC.capacity = min(MCC.contents_materials["copper"],MCC.contents_materials["tin"])
				MCC.contents_materials["copper"] -= MCC.capacity
				MCC.contents_materials["tin"] -= MCC.capacity
				MCC.current_material = "bronze"
			else
				for(var/i in MCC.contents_materials)
					MCC.capacity = MCC.contents_materials[i]
					MCC.current_material = i
			MCC.contents_materials = list()
			MCC.loc = src.loc
			MCC.update_icon()