// ores
/obj/item/stack/ore
	name = "矿石"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore2"
	w_class = ITEM_SIZE_SMALL
	amount = 1
	max_amount = 50
	can_stack = TRUE
	value = 1
	var/radioactive = FALSE
	var/radioactive_amt = 0

/obj/item/stack/ore/New()
	pixel_x = rand(0,16)-8
	pixel_y = rand(0,8)-8
	process_radioactivity()
	update_icon()
	..()

/obj/item/stack/ore/proc/process_radioactivity()
	if (!src || !radioactive || radioactive_amt <= 0)
		return
	if (!istype(loc, /obj/structure/closet/crate/lead)) //lead containers block radioactivity
		radiation_pulse(get_turf(src), 3, radioactive_amt, 10, FALSE) // 0.16 rads per second, should take 10 mins to reach 1 gray

	spawn(100)
		process_radioactivity()

/obj/item/stack/ore/update_icon()
	var/icon_suffix = ""
	switch(amount)
		if (1 to 12)
			icon_suffix = ""
		if (13 to 24)
			icon_suffix = "_2"
		if (25 to 36)
			icon_suffix = "_3"
		if (37 to INFINITY)
			icon_suffix = "_4"
	icon_state = "[initial(icon_state)][icon_suffix]"

/obj/item/stack/ore/iron
	name = "铁矿石"
	icon_state = "ore_iron"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET].</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始使用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始使用\the [W.name]提纯\the [src].</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("iron",5)
						ET.update_icon()
						qdel(src)
		else
			..()

/obj/item/stack/ore/iron_sponge //crude refined iron from a bloomery. Use on anvil for wrought iron
	name = "海绵铁"
	desc = "非常粗糙的铁,可以在铁砧中进一步精炼成熟铁."
	icon_state = "ore_sponge_iron"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("iron",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/iron_pig //slighly better iron from a blast furnace.
	name = "生铁"
	desc = "一种含碳量高的软铁。用于在铁砧上炼钢。"
	icon_state = "ore_pig_iron"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("iron",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/glass
	name = "沙子"
	icon_state = "ore_glass"
	slot_flags = SLOT_HOLSTER

/obj/item/stack/ore/silver
	name = "银矿石"
	icon_state = "ore_silver"
	value = 5
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("silver",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/gold
	name = "金矿石"
	value = 10
	icon_state = "ore_gold"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("gold",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/copper
	name = "铜矿石"
	icon_state = "ore_copper"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("copper",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/tin
	name = "锡矿石"
	icon_state = "ore_tin"
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("tin",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/diamond
	name = "钻石"
	icon_state = "ore_diamond"
	value = 10
/obj/item/stack/ore/obsidian
	name = "黑曜石"
	desc = "一种火山玻璃。"
	icon_state = "ore_obsidian"
	value = 3
	attackby(var/obj/W as obj, mob/user as mob)
		if (istype(W, /obj/item/weapon/chisel))
			var/mob/living/human/H = user
			if (!istype(H.l_hand, /obj/item/weapon/hammer) && !istype(H.r_hand, /obj/item/weapon/hammer))
				to_chat(user, "<span class = 'warning'>你需要一只手拿着锤子才能使用凿子。</span>")
			else
				visible_message("<span class='danger'>[user]开始切割黑曜石!</span>", "<span class='danger'>你开始切割黑曜石。</span>")
				if (do_after(H, min(src.amount*10, 200), H.loc))
					visible_message("<span class='danger'>[user]完成了切割黑曜石!</span>", "<span class='danger'>你完成了切割黑曜石。</span>")
					var/obj/item/stack/material/obsidian/cut_obsidian = new/obj/item/stack/material/obsidian(src.loc)
					cut_obsidian.amount = src.amount
					qdel(src)
		else
			..()
			return
/obj/item/stack/ore/uranium
	name = "铀矿石"
	icon_state = "ore_uranium"
	radioactive = TRUE
	radioactive_amt = 7
	flammable = FALSE
	value = 5
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("uranium",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/uranium/random
	New()
		..()
		amount = rand(1,25)
/obj/item/stack/ore/saltpeter
	name = "硝石岩"
	desc = "一种由硝酸钾组成的淡黄色晶体。许多爆炸物(包括火药)的常见前体。"
	icon_state = "ore_saltpeter"
	singular_name = "rock"
	flammable = TRUE
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("potassium",2.5)
						ET.reagents.add_reagent("nitrogen",2.5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/coal
	name = "矿物煤"
	desc = "一堆矿物煤。非常致密。"
	icon_state = "ore_coal"
	singular_name = "rock"
	flammable = TRUE
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("carbon",5)
						ET.update_icon()
						qdel(src)

		else
			..()
/obj/item/stack/ore/coal/twentyfive
	amount = 25

/obj/item/stack/ore/charcoal
	name = "木炭"
	desc = "复炸过的木头。"
	icon_state = "ore_charcoal"
	singular_name = "rock"
	flammable = FALSE
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始将\the [src]碾碎成\the [W.name]...</span>", "<span class = 'notice'>你开始将\the [src]碾碎成\the [W.name]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("charcoal",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/sulphur
	name = "硫磺岩"
	desc = "黄色且气味刺鼻。"
	icon_state = "ore_sulphur"
	singular_name = "rock"
	flammable = TRUE
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("sulfur",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/lead
	name = "铅矿石"
	desc = "一块密度极高的铅矿石。"
	icon_state = "ore_lead"
	singular_name = "rock"
	flags = CONDUCT
	flammable = FALSE
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("lead",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/mercury
	name = "朱砂矿石"
	desc = "一块棕红色的硫化汞矿石。"
	icon_state = "ore_mercury"
	singular_name = "rock"
	flammable = FALSE
	flags = CONDUCT
	attackby(var/obj/W as obj, var/mob/living/human/H as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/glass/extraction_kit))
			var/obj/item/weapon/reagent_containers/glass/extraction_kit/ET = W
			if (ET.reagents.total_volume > 0)
				to_chat(H, "<span class = 'notice'>请先清空\the [ET]。</span>")
				return
			if (istype(H))
				visible_message("<span class = 'notice'>[H]开始用\the [W.name]提纯\the [src]...</span>", "<span class = 'notice'>你开始用\the [W.name]提纯\the [src]。</span>")
				playsound(src,'sound/effects/pickaxe.ogg',100,1)
				var/timera = 110/(H.getStatCoeff("dexterity"))
				if (do_after(H, timera))
					if (ET.reagents.total_volume <= 0)
						ET.reagents.add_reagent("mercury",5)
						ET.update_icon()
						qdel(src)
		else
			..()
/obj/item/stack/ore/fossilskull1
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_skull1"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilskull2
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_skulll2"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilskull3
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_skull3"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilleaf1
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_leaf1"
	singular_name = "fossil"
	flammable = FALSE


/obj/item/stack/ore/fossilleaf2
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_leaf2"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilleaf3
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_leaf3"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilshell1
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_shell1"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilshell2
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_shell2"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilshell3
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_shell3"
	singular_name = "fossil"
	flammable = FALSE

/obj/item/stack/ore/fossilbone1
	name = "化石"
	desc = "一块古老的化石...一定是很久以前的!"
	icon_state = "fossil_bone1"
	singular_name = "fossil"
	flammable = FALSE
