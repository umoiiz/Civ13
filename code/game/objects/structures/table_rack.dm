/obj/structure/table/rack
	name = "架子"
	desc = "和中世纪版本不同."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	flipped = FALSE
	low = TRUE
	fixedsprite = TRUE

/obj/structure/table/rack/New()
	..()
//	verbs -= /obj/structure/table/verb/do_flip
//	verbs -= /obj/structure/table/proc/do_put
/*
/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return*/

/obj/structure/table/rack/update_icon()
	return

/obj/structure/table/fancy
	name = "桌子"
	desc = "一张古老而昂贵的桌子."
	icon = 'icons/obj/objects.dmi'
	icon_state = "fancytable"
	flipped = FALSE
	low = TRUE
	fixedsprite = TRUE

/obj/structure/table/nightstand
	name = "床头柜"
	desc = "一个床头柜."
	icon = 'icons/obj/structures.dmi'
	icon_state = "nightstand"
	flipped = FALSE
	low = TRUE
	fixedsprite = TRUE

/obj/structure/table/nightstand/small
	desc = "一个深色小木床头柜."
	icon = 'icons/obj/structures.dmi'
	icon_state = "nightstand_small"

/obj/structure/table/nightstand/alt
	icon = 'icons/obj/structures.dmi'
	icon_state = "nightstand_alt"

/obj/structure/table/rack/shelf
	name = "货架"
	desc = "一个商店货架."
	icon = 'icons/obj/junk.dmi'
	icon_state = "shelf0"

/obj/structure/table/rack/shelf/wooden
	name = "架子"
	desc = "一个木制架子."
	icon = 'icons/obj/structures.dmi'
	icon_state = "shelfwood"

/obj/structure/table/rack/shelf/store
	icon = 'icons/obj/structures.dmi'
	icon_state = "storeshelf"

/obj/structure/table/rack/coatrack
	name = "衣帽架"
	desc = "一个方便挂帽子的地方."
	icon = 'icons/obj/junk.dmi'
	icon_state = "coatrack"
	flammable = TRUE
	not_movable = FALSE