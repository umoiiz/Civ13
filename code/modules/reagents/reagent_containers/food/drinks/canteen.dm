/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen
	dropsound = 'sound/effects/drop_default.ogg'
	name = "水壶"
	icon_state = "canteen_german"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_ID|SLOT_BELT
	desc = "一个用于储水的超大号水壶."

/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/full/New()
	..()
	reagents.add_reagent("water", 200)

/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2
	dropsound = 'sound/effects/drop_default.ogg'
	name = "水壶"
	icon_state = "canteen_german"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_BELT|SLOT_ID
	desc = "一个用于储水的超大号水壶."
	isGlass = FALSE

/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/New()
	..()
	reagents.add_reagent("water", 200)

/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/german
	dropsound = 'sound/effects/drop_default.ogg'
	name = "德国水壶"
	icon_state = "canteen_german_ww2"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	desc = "一个用于储水的超大号水壶."
/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/jap
	dropsound = 'sound/effects/drop_default.ogg'
	name = "日本水壶"
	icon_state = "canteen_jap"
	item_state = "canteen_jap"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	desc = "一个非常大的水壶,用于储水."
	icon_override = 'icons/mob/pouch.dmi'
/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/jap/New()
	..()
	reagents.add_reagent("water", 200)
/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/us
	dropsound = 'sound/effects/drop_default.ogg'
	name = "美式水壶"
	icon_state = "canteen_us"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	desc = "一个非常大的水壶,用于储水."
/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/us/New()
	..()
	reagents.add_reagent("water", 200)

/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/rus
	dropsound = 'sound/effects/drop_default.ogg'
	name = "俄式水壶"
	icon_state = "canteen_german"
	volume = 200
	w_class = ITEM_SIZE_NORMAL // fits in webbing unlike w_class = ITEM_SIZE_LARGE
	desc = "一个非常大的水壶,用于储水."
/obj/item/weapon/reagent_containers/food/drinks/bottle/canteen/ww2/rus/New()
	..()
	reagents.add_reagent("water", 200)
