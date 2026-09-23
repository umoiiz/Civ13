/obj/item/weapon/storage/bible
	name = "圣经"
	desc = "反复往头上砸."
	icon_state ="bible"
	item_state = "bible"
	throw_speed = TRUE
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	var/mob/affecting = null

/obj/item/weapon/storage/bible/orthodox
	name = "圣经"
	icon_state ="orthodoxbible"
	item_state = "orthodoxbible"
	desc = "东正教圣经."
	flags = FALSE

/obj/item/weapon/storage/bible/quran
	name = "古兰经"
	icon_state ="koran"
	item_state = "koran"
	desc ="穆斯林圣书."

/obj/item/weapon/storage/bible/talmud
	name = "塔木德"
	icon_state ="talmud"
	item_state = "talmud"
	desc ="犹太教圣书."

/obj/item/weapon/storage/bible/booze
	name = "圣经"
	desc = "反复往头上砸."
	icon_state ="bible"

/obj/item/weapon/storage/bible/booze/New()
	..()
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer(src)
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer(src)