// COLOR SHOES
/obj/item/clothing/shoes/color
	name = "鞋子"
	desc = "一双鞋子."
	icon_state = "white"

/obj/item/clothing/shoes/color/white
	name = "白色鞋子"
	icon_state = "white"

/obj/item/clothing/shoes/color/blue
	name = "蓝色鞋子"
	icon_state = "blue"

/obj/item/clothing/shoes/color/green
	name = "绿色鞋子"
	icon_state = "green"

/obj/item/clothing/shoes/color/yellow
	name = "黄色鞋子"
	icon_state = "yellow"

/obj/item/clothing/shoes/color/purple
	name = "紫色鞋子"
	icon_state = "purple"

/obj/item/clothing/shoes/color/brown
	name = "棕色鞋子"
	icon_state = "brown"

/obj/item/clothing/shoes/color/red
	name = "红色鞋子"
	desc = "时尚的红色鞋子."
	icon_state = "red"

/obj/item/clothing/shoes/color/orange
	name = "橙色鞋子"
	icon_state = "orange"
	var/obj/item/weapon/handcuffs/chained = null

/obj/item/clothing/shoes/color/orange/proc/attach_cuffs(var/obj/item/weapon/handcuffs/cuffs, mob/user as mob)
	if (chained) return

	user.drop_item()
	cuffs.loc = src
	chained = cuffs
	slowdown = 15
	icon_state = "orange1"

/obj/item/clothing/shoes/color/orange/proc/remove_cuffs(mob/user as mob)
	if (!chained) return

	user.put_in_hands(chained)
	chained.add_fingerprint(user)

	slowdown = initial(slowdown)
	icon_state = "orange"
	chained = null

/obj/item/clothing/shoes/color/orange/attack_self(mob/user as mob)
	..()
	remove_cuffs(user)

/obj/item/clothing/shoes/color/orange/attackby(H as obj, mob/user as mob)
	..()
	if (istype(H, /obj/item/weapon/handcuffs))
		attach_cuffs(H, user)


