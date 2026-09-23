/obj/item/clothing/accessory/locket
	name = "银色吊坠"
	desc = "这个椭圆形、纯银材质的吊坠悬挂在一根极其精细、具有折射性的绳子上,绳子几乎细如发丝,由类似材料微编织而成,坚韧得出人意料.边缘以优雅的曲线设计精心雕刻,但整体表面无标记,触感光滑,既可以保持原样,也留有日后改动的空间.内部明显有一个放置照片或一绺头发之类物品的位置,但即便在那之后,还有一个非常薄的隔层,用拇指和食指一捏即可打开."
	icon_state = "locket"
	item_state = "locket"
	slot_flags = FALSE
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_ID|SLOT_ACCESSORY
	var/base_icon
	var/open
	var/obj/item/held //Item inside locket.
	ripable = FALSE
	flags = CONDUCT
/obj/item/clothing/accessory/locket/attack_self(mob/user as mob)
	if (!base_icon)
		base_icon = icon_state

	if (!("[base_icon]_open" in icon_states(icon)))
		to_chat(user, "\The [src]似乎打不开.")
		return

	open = !open
	to_chat(user, "你翻开\the [src][open?"open":"closed"].")
	if (open)
		icon_state = "[base_icon]_open"
		if (held)
			to_chat(user, "\The [held]掉了出来!")
			held.loc = get_turf(user)
			held = null
	else
		icon_state = "[base_icon]"

/obj/item/clothing/accessory/locket/attackby(var/obj/item/O as obj, mob/user as mob)
	if (!open)
		to_chat(user, "你必须先打开它.")
		return

	if (istype(O,/obj/item/weapon/paper))
		if (held)
			to_chat(usr, "\The [src]里面已经有东西了.")
		else
			to_chat(usr, "你将[O]塞入[src].")
			user.drop_item()
			O.loc = src
			held = O
		return
	..()
