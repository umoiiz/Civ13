/obj/item/weapon/gavelhammer
	name = "法槌"
	desc = "肃静, 肃静! 我的法庭里不许有炸弹."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelhammer"
	force = 5
	throwforce = 6
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("bashed", "battered", "judged", "whacked")

/obj/item/weapon/gavelblock
	name = "法槌底座"
	desc = "当平民闹事时用槌子敲它."
	icon = 'icons/obj/items.dmi'
	icon_state = "gavelblock"
	force = 2
	throwforce = 2
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/gavelblock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/gavelhammer))
		playsound(loc, 'sound/effects/gavel.ogg', 90, 1)
		user.visible_message("<span class='warning'>[user]用\the [I]击打\the [src].</span>")
	else
		return