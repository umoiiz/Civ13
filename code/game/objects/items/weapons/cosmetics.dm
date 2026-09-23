/obj/item/weapon/lipstick
	gender = PLURAL
	name = "红色口红"
	desc = "一个普通品牌的口红."
	icon = 'icons/obj/items.dmi'
	icon_state = "lipstick"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/colour = "red"
	var/open = FALSE


/obj/item/weapon/lipstick/purple
	name = "紫色口红"
	colour = "purple"
	flags = FALSE

/obj/item/weapon/lipstick/jade
	name = "玉色口红"
	colour = "jade"

/obj/item/weapon/lipstick/black
	name = "黑色口红"
	colour = "black"


/obj/item/weapon/lipstick/random
	name = "口红"

/obj/item/weapon/lipstick/random/New()
	colour = pick("red","purple","jade","black")
	name = "[colour] lipstick"


/obj/item/weapon/lipstick/attack_self(mob/user as mob)
	to_chat(user, "<span class='notice'>你旋出\the [src] [open ? "closed" : "open"].</span>")
	open = !open
	if (open)
		icon_state = "[initial(icon_state)]_[colour]"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/lipstick/attack(mob/M as mob, mob/user as mob)
	if (!open)	return

	if (!istype(M, /mob))	return

	if (ishuman(M))
		var/mob/living/human/H = M
		if (H.lip_style)	//if they already have lipstick on
			to_chat(user, "<span class='notice'>你需要先擦掉旧口红!</span>")
			return
		if (H == user)
			user.visible_message("<span class='notice'>[user]用\the [src]涂了嘴唇.</span>", \
								 "<span class='notice'>You take a moment to apply \the [src]. Perfect!</span>")
			H.lip_style = colour
			H.update_body()
		else
			user.visible_message("<span class='warning'>[user]开始用\the [src]给[H]涂嘴唇.</span>", \
								 "<span class='notice'>You begin to apply \the [src].</span>")
			if (do_after(user, 20, H) && do_after(H, 20, src))	//user needs to keep their active hand, H does not.
				user.visible_message("<span class='notice'>[user]用\the [src]给[H]涂了嘴唇.</span>", \
									 "<span class='notice'>You apply \the [src].</span>")
				H.lip_style = colour
				H.update_body()
	else
		to_chat(user, "<span class='notice'>那上面哪有嘴唇?</span>")

//you can wipe off lipstick with paper! see code/modules/paperwork/paper.dm, paper/attack()


/obj/item/weapon/haircomb //sparklysheep's comb
	name = "梳子"
	desc = "一把由柔性塑料制成的崭新梳子."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"
	item_state = "comb"
	flammable = TRUE
	flags = FALSE

/obj/item/weapon/haircomb/attack_self(mob/user)
	user.visible_message("<span class='notice'>[user]用[src]把头发整齐地梳了一个[user.gender == FEMALE ? "lady" : "guy"].</span>")