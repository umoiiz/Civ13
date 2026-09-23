//ROBERTS FACTORY FRAMEWORK

/obj/structure/machinery/factory
	name = "熔炉"
	desc = "一座工业熔炉,用于熔炼矿物."
	icon = 'icons/obj/machines/coinsmelter.dmi'
	icon_state = "coinsmelter"
	layer = 2.9
	density = TRUE
	anchored = TRUE
	flags = OPENCONTAINER | NOREACT
	var/base_state = "coinsmelter"
	var/on = FALSE
	var/max_space = 6
	var/fuel = 0
	var/iron = 0
	var/copper = 0
	var/tin = 0
	var/gold = 0
	var/silver = 0
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/machinery/factory/update_icon()
	if (on)
		icon_state = "[base_state]_on"
		set_light(4)
	else
		icon_state = base_state
		set_light(0)

/obj/structure/machinery/factory/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench) || (istype(I, /obj/item/weapon/hammer)))
			if (istype(I, /obj/item/weapon/wrench))
				visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"] \the [src] [anchored ? "from" : "to"]地面.</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H] [anchored ? "unsecures" : "secures"] \the [src] [anchored ? "from" : "to"]地面.</span>")
					anchored = !anchored
					return
			else if (istype(I, /obj/item/weapon/hammer))
				visible_message("<span class='warning'>[H]开始拆解\the [src].</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H]拆解了\the [src].</span>")
					qdel(src)
					return
		if (istype(I, /obj/item/stack/))
			if (istype(I, /obj/item/stack/material/wood))	//FUEL NORMAL (without * multiplication or + addition, only input)
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/bamboo))
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/weapon/branch))	// FUEL +0.5 (adds a flat numerical addition ontop of the input reagent's baseline fuel, recommended for non stack objects)
				fuel += I.amount+0.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/leaf))
				fuel += I.amount+0.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/dung))	// FUEL +1
				fuel += I.amount+1
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/charcoal))	//FUEL *2.5 (multiplies it by 2 and a half)
				fuel += I.amount*2.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/coal))	//FUEL *3
				fuel += I.amount*3
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return

			else if (istype(I, /obj/item/stack/ore/iron) || istype(I, /obj/item/stack/material/iron))
				iron += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/copper) || istype(I, /obj/item/stack/material/copper))
				copper += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/tin) || istype(I, /obj/item/stack/material/tin))
				tin += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/woodplank))
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else
				to_chat(H, "<span class = 'warning'>你无法熔炼这个.</span>")
				return
		else if (istype(I, /obj/item/weapon/material))
			var/obj/item/weapon/material/MT = I
			if (MT.get_material_name() == "wood")
				fuel += 1
				to_chat(H, "你打碎了\the [MT]并将其放入[src],为其添加燃料.")
				qdel(I)
			else if (MT.get_material_name() == "bronze")
				to_chat(H, "你把\the [MT]熔炼成了青铜锭.")
				new/obj/item/stack/material/bronze(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "copper")
				to_chat(H, "你把\the [MT]熔炼成了铜锭.")
				new/obj/item/stack/material/copper(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "tin")
				to_chat(H, "你把\the [MT]熔炼成了锡锭.")
				new/obj/item/stack/material/tin(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "iron")
				to_chat(H, "你把\the [MT]熔炼成了铁锭.")
				new/obj/item/stack/material/iron(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "steel")
				to_chat(H, "你把\the [MT]熔炼成了钢板.")
				new/obj/item/stack/material/steel(src.loc)
				qdel(I)
		else if (istype(I, /obj/item) && I.basematerials.len)
			to_chat(H, "你把\the [I]放入了\the [src]以回收利用.")
			if (I.basematerials[1] == "tin")
				tin += I.basematerials[2]
			qdel(I)

		else
			..()
	else
		..()

/obj/structure/machinery/factory/attack_hand(var/mob/living/human/H)
	if (!on && fuel > 1)
		visible_message("<span class = 'notice'>[H]打开了[name].</span>")
		on = TRUE
		fuel -=2
		update_icon()
		spawn (110)
			on = FALSE
			update_icon()
			visible_message("<span class = 'notice'>[name]完成了熔炼.</span>")
			process()
	else
		to_chat(H, "<span class = 'warning'>[name]没有足够的燃料!请用木头或煤炭填充它.</span>")


/obj/structure/machinery/factory/process()
	if (iron > 0)
		var/obj/item/stack/material/steel/newsteel = new/obj/item/stack/material/steel(src.loc)
		newsteel.amount = iron
		iron = 0
	if (tin > 0 && copper > 0)
		var/obj/item/stack/material/bronze/newbronze = new/obj/item/stack/material/bronze(src.loc)
		var/amountconsumed = min(tin,copper)
		newbronze.amount = min(tin,copper)*3
		tin -= amountconsumed
		copper -= amountconsumed
	else if (tin == 0 && copper > 0)
		var/obj/item/stack/material/copper/newcopper = new/obj/item/stack/material/copper(src.loc)
		newcopper.amount = copper
		copper = 0
	else if (tin > 0 && copper == 0)
		var/obj/item/stack/material/tin/newtin = new/obj/item/stack/material/tin(src.loc)
		newtin.amount = tin
		tin = 0

		//EMTPY

/obj/structure/machinery/factory/verb/empty()
	set category = null
	set name = "Empty"
	set src in range(1, usr)
	if (iron > 0)
		var/obj/item/stack/ore/iron/emptyediron = new/obj/item/stack/ore/iron(src.loc)
		emptyediron.amount = iron
		iron = 0
	if (copper > 0)
		var/obj/item/stack/ore/copper/emptyedcopper = new/obj/item/stack/ore/copper(src.loc)
		emptyedcopper.amount = copper
		copper = 0
	if (tin > 0)
		var/obj/item/stack/ore/tin/emptyedtin = new/obj/item/stack/ore/tin(src.loc)
		emptyedtin.amount = tin
		tin = 0

//ROBERTS FACTORY FRAMEWORK

//COINSMELTER

/obj/structure/machinery/factory/coinsmelter
	name = "硬币熔炉"
	desc = "一座工业硬币熔炉,用于将硬币熔炼成锭."
	icon = 'icons/obj/machines/coinsmelter.dmi'
	icon_state = "coinsmelter"
	layer = 2.9
	density = TRUE
	anchored = TRUE
	flags = OPENCONTAINER | NOREACT
	base_state = "coinsmelter"
	on = FALSE
	max_space = 6
	fuel = 0
	gold = 0
	copper = 0
	silver = 0
	var/goldcoin = 0
	var/coppercoin = 0
	var/silvercoin = 0
	not_movable = TRUE
	not_disassemblable = FALSE


/obj/structure/machinery/factory/coinsmelter/update_icon()
	if (on)
		icon_state = "[base_state]_on"
		set_light(4)
	else
		icon_state = base_state
		set_light(0)

/obj/structure/machinery/factory/coinsmelter/attackby(var/obj/item/I, var/mob/living/human/H)
	if (!istype(H))
		return
	if (H.a_intent == I_HELP)
		if (istype(I, /obj/item/weapon/wrench) || (istype(I, /obj/item/weapon/hammer)))
			if (istype(I, /obj/item/weapon/wrench))
				visible_message("<span class='warning'>[H]开始[anchored ? "unsecure" : "secure"] \the [src] [anchored ? "from" : "to"]地面.</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H] [anchored ? "unsecures" : "secures"] \the [src] [anchored ? "from" : "to"]地面.</span>")
					anchored = !anchored
					return
			else if (istype(I, /obj/item/weapon/hammer))
				visible_message("<span class='warning'>[H]开始拆解\the [src].</span>")
				playsound(src, 'sound/items/Ratchet.ogg', 100, TRUE)
				if (do_after(H,50,src))
					visible_message("<span class='warning'>[H]拆解了\the [src].</span>")
					qdel(src)
					return
		if (istype(I, /obj/item/stack/))
			if (istype(I, /obj/item/stack/material/wood))
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/bamboo))
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/weapon/branch))
				fuel += I.amount+0.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/leaf))
				fuel += I.amount+0.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/dung))
				fuel += I.amount+1
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/charcoal))
				fuel += I.amount*2.5
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/ore/coal))
				fuel += I.amount*3
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return				  //INPUT 1

			else if (istype(I, /obj/item/stack/money/goldcoin))
				gold += I.amount/5
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/gold))
				gold += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return

			else if (istype(I, /obj/item/stack/money/coppercoin))
				copper += I.amount/5
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/copper))
				copper += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return

			else if (istype(I, /obj/item/stack/money/silvercoin))
				silver += I.amount/10
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/silver))
				silver += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],进行熔炼.")
				qdel(I)
				return
			else if (istype(I, /obj/item/stack/material/woodplank))
				fuel += I.amount
				to_chat(H, "你把\the [I]放入了\the [src],为其添加燃料.")
				qdel(I)
				return

			else
				to_chat(H, "<span class = 'warning'>你无法熔炼这个.</span>")
				return
		else if (istype(I, /obj/item/weapon/material))
			var/obj/item/weapon/material/MT = I
			if (MT.get_material_name() == "wood")
				fuel += 1
				to_chat(H, "你打碎了\the [MT]并将其放入[src],为其添加燃料.")
				qdel(I)
			else if (MT.get_material_name() == "copper")
				to_chat(H, "你把\the [MT]熔炼成了铜锭.")
				new/obj/item/stack/material/copper(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "silver")
				to_chat(H, "你把\the [MT]熔炼成了银锭.")
				new/obj/item/stack/material/silver(src.loc)
				qdel(I)
			else if (MT.get_material_name() == "gold")
				to_chat(H, "你把\the [MT]熔炼成了金锭.")
				new/obj/item/stack/material/gold(src.loc)
				qdel(I)
		else if (istype(I, /obj/item) && I.basematerials.len)
			to_chat(H, "你把\the [I]放入\the [src]以回收它.")
			if (I.basematerials[1] == "tin")
				tin += I.basematerials[2]
			qdel(I)

		else
			..()
	else
		..()

/obj/structure/machinery/factory/coinsmelter/attack_hand(var/mob/living/human/H)
	if (!on && fuel > 1)
		visible_message("<span class = 'notice'>[H]打开了[name].</span>")
		on = TRUE
		fuel -=2
		update_icon()
		spawn (110)
			on = FALSE
			update_icon()
			visible_message("<span class = 'notice'>[name]熔炼完成.</span>")
			process()
	else
		to_chat(H, "<span class = 'warning'>[name]没有足够的燃料! 用木头或煤炭填充它.</span>")


/obj/structure/machinery/factory/coinsmelter/process()
	if (gold > 0)
		var/obj/item/stack/money/goldcoin/newgoldcoin = new/obj/item/stack/material/gold(src.loc)
		newgoldcoin.amount = gold
		gold = 0
	if (copper > 0)
		var/obj/item/stack/money/coppercoin/newcoppercoin = new/obj/item/stack/material/copper(src.loc)
		newcoppercoin.amount = copper
		copper = 0
	else if (silver > 0)
		var/obj/item/stack/money/silvercoin/newsilvercoin = new/obj/item/stack/material/silver(src.loc)
		newsilvercoin.amount = silver
		silver = 0

		//EMTPY

/obj/structure/machinery/factory/coinsmelter/verb/emptycoin()
	set category = null
	set name = "Empty"
	set src in range(1, usr)
	if (goldcoin > 0)
		var/obj/item/stack/money/goldcoin/emptyedgoldcoin = new/obj/item/stack/money/goldcoin/(src.loc)
		emptyedgoldcoin.amount = goldcoin
		goldcoin = 0
	if (coppercoin > 0)
		var/obj/item/stack/money/coppercoin/emptyedcoppercoin = new/obj/item/stack/money/coppercoin(src.loc)
		emptyedcoppercoin.amount = coppercoin
		coppercoin = 0
	if (silvercoin > 0)
		var/obj/item/stack/money/silvercoin/emptyedsilvercoin = new/obj/item/stack/money/silvercoin(src.loc)
		emptyedsilvercoin.amount = silvercoin
		silvercoin = 0


		//COINSMELTER
