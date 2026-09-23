

























/////////////nuclear shit////////

/obj/item/weapon/reagent_containers/nuclear/fuelrod ////mid rad
	icon = 'icons/obj/items.dmi'
	name = "一根破裂的反应堆燃料棒"
	desc = "一根核燃料棒, 放射性极强."
	icon_state = "nrod"
	var/radioactive = TRUE
	var/radioactive_amt = 5
	flammable = FALSE
	var/vol = 10
	value = 200
	New()
		..()
		reagents.add_reagent("uranium", 10)

/obj/item/weapon/reagent_containers/nuclear/controlrod ////low rad
	icon = 'icons/obj/items.dmi'
	name = "一根反应堆控制棒"
	desc = "一根旧的反应堆控制棒. 现在它带有轻微放射性且已损坏."
	icon_state = "crod"
	var/radioactive = TRUE
	var/radioactive_amt = 1
	var/vol = FALSE
	flammable = FALSE
	value = 100

/obj/item/weapon/reagent_containers/nuclear/meltedsomething ////inside reactor (very dangerous)
	icon = 'icons/obj/items.dmi'
	name = "a melted radioactive mess"
	desc = "Its still hot to the touch, you can see a faint green glow around it, its probably highly radioactive."
	icon_state = "messrad"
	var/radioactive = TRUE
	var/radioactive_amt = 10
	flammable = FALSE
	var/vol = 50
	value = 300
	New()
		..()
		reagents.add_reagent("uranium", 50)

/obj/item/weapon/reagent_containers/nuclear/nuclearwastebarrel ///very low rad
	name = "黄色钢桶 (核废料)"
	desc = "一个黄色钢桶. 你可以将液体装入其中."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "barreln"
	//item_state = ???? TO DO TODO or check
	density = TRUE
	var/label_text = "Nuclear Waste"
	value = 50
	volume = 10
	New()
		..()
		flags &= ~OPENCONTAINER
		reagents.add_reagent("uranium",5)
		reagents.add_reagent("plutonium",5)

///////////////not radioactive
/obj/item/weapon/reagent_containers/nuclear/notnuclear/uraniumref
	name = "铀精炼厂"
	desc = "一座铀精炼厂."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "uranium_refinery"
	flammable = FALSE
	var/not_movable = TRUE
	var/not_disassemblable = TRUE
	density = TRUE
	opacity = FALSE
	anchored = TRUE
