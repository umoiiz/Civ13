/obj/item/weapon/storage/box
	name = "盒子"
	desc = "它只是一个普通的盒子."
	icon_state = "box"
	item_state = "syringe_kit"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand.dmi',
		)

// BubbleWrap - A box can be folded up to make cardboard
/obj/item/weapon/storage/box/attack_self(mob/user as mob)
	if (..()) return

/obj/item/weapon/storage/box/drinkingglasses
	name = "饮水杯盒"
	desc = "上面有一张饮水杯的图片."
	New()
		..()
		for (var/i=1, i<= 12, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass(src)

/obj/item/weapon/storage/box/wineglasses
	name = "葡萄酒杯盒"
	desc = "上面有一张葡萄酒杯的图片."

	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/wine(src)

/obj/item/weapon/storage/box/beermug
	name = "啤酒杯盒"
	desc = "上面有一张啤酒杯的图片."

	New()
		..()
		for (var/i=1, i<= 10, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/beermug(src)

/obj/item/weapon/storage/box/sandbags
	name = "沙袋盒"
	desc = "这是一个非常重的盒子, 上面有一张沙袋的图片. 可以制作最多4个路障."
	can_hold = list(/obj/item/weapon/barrier/sandbag)
	New()
		..()
		for (var/i=1, i<= 12, i++)
			new /obj/item/weapon/barrier/sandbag(src)

/obj/item/weapon/storage/box/specialtyglass
	name = "特色玻璃杯盒"
	desc = "上面有一张不同饮水杯的图片."
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/lowball(src)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/flute(src)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/cocktail(src)

/obj/item/weapon/storage/box/shotglass
	name = "烈酒杯盒"
	desc = "上面有一张烈酒杯的图片."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass/shot(src)

/obj/item/weapon/storage/box/condimentbottles
	name = "调味瓶盒"
	desc = "上面有一大片番茄酱污渍."

	New()
		..()
		for (var/i=1, i<= 6, i++)
			new /obj/item/weapon/reagent_containers/food/condiment(src)

/obj/item/weapon/storage/box/cups
	name = "纸杯盒"
	desc = "正面有纸杯的图片."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/drinks/sillycup(src)

/obj/item/weapon/storage/box/cutlery
	name = "餐具盒"
	desc = "正面有各种扁平餐具的图片."
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new /obj/item/weapon/material/kitchen/utensil/fork(src)
			new /obj/item/weapon/material/kitchen/utensil/spoon(src)
			new /obj/item/weapon/material/kitchen/utensil/knife(src)

/obj/item/weapon/storage/box/handcuffs
	name = "备用 手铐盒"
	desc = "一个装满手铐的盒子."

	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/box/pillbottles
	name = "药瓶盒"
	desc = "正面有药瓶的图片."

	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/storage/pill_bottle(src)

/obj/item/weapon/storage/box/bowls
	name = "碗盒"
	desc = "上面有碗的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/kitchen/wood_bowl(src)

/obj/item/weapon/storage/box/nood
	name = "一盒面条"
	desc = "上面有干面条的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/snacks/noodles(src)

/obj/item/weapon/storage/box/waffle
	name = "一盒华夫饼"
	desc = "上面有华夫饼的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/snacks/waffles(src)

/obj/item/weapon/storage/box/canned
	name = "一盒罐头食品"
	desc = "上面有各种罐头食品品牌的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/can/filled(src)

/obj/item/weapon/storage/box/wheat
	name = "一盒未碾磨的小麦"
	desc = "上面有麦田的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/weapon/reagent_containers/food/snacks/grown/wheat(src)

/obj/item/weapon/storage/box/stermask
	name = "一盒无菌口罩"
	desc = "上面有蓝色无菌口罩的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/clothing/mask/sterile(src)

/obj/item/weapon/storage/box/sterglove
	name = "一盒无菌手套"
	desc = "上面有白色无菌手套的图案."
	New()
		..()
		for (var/i=1, i<= 8, i++)
			new /obj/item/clothing/gloves/color/white(src)

/obj/item/weapon/storage/box/ctail
	name = "一盒鸡尾酒装饰物"
	desc = "里面有芹菜, 鸡尾酒橄榄和黑樱桃."
	New()
		..()
		for (var/i=1, i<= 4, i++)
			new /obj/item/cocktail_stuff/celery(src)
			new /obj/item/cocktail_stuff/cocktail_olive(src)
			new /obj/item/cocktail_stuff/maraschino_cherry(src)

/obj/item/weapon/storage/box/occinn
	name = "一盒备用旅店钥匙"
	desc = "上面挂着一个钥匙链."
	New()
		..()
		new /obj/item/weapon/key/civ/inn(src)
		new /obj/item/weapon/key/civ/room1(src)
		new /obj/item/weapon/key/civ/room2(src)
		new /obj/item/weapon/key/civ/room3(src)
		new /obj/item/weapon/key/civ/room4(src)
		new /obj/item/weapon/storage/belt/keychain(src)

/obj/item/weapon/storage/box/nbcbox
	name = "防核生化保护箱"
	desc = "内含可能提高你在核生化攻击中生存几率的物品."
	icon_state = "boxnbc"
	item_state = "boxnbc"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_POCKET
	can_hold = list(
		/obj/item/clothing/accessory,
		/obj/item/clothing/suit/nbcponcho,
		/obj/item/weapon/pill_pack/potassium_iodide,
		/obj/item/weapon/pill_pack/adrenaline,
		/obj/item/clothing/mask/gas,
		/obj/item/stack/medical
		)
/obj/item/weapon/storage/box/nbcbox/sov/New()
	..()
	new /obj/item/clothing/mask/gas/soviet/gp5(src)
	new /obj/item/weapon/pill_pack/adrenaline(src)
	new /obj/item/weapon/pill_pack/potassium_iodide(src)
	new /obj/item/clothing/suit/nbcponcho(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)
	new /obj/item/stack/medical/advanced/sulfa/small(src)
	return
/obj/item/weapon/storage/box/nbcbox/ami/New()
	..()
	new /obj/item/clothing/mask/gas/modern2(src)
	new /obj/item/weapon/pill_pack/adrenaline(src)
	new /obj/item/weapon/pill_pack/potassium_iodide(src)
	new /obj/item/clothing/suit/nbcponcho/white(src)
	new /obj/item/stack/medical/bruise_pack/gauze(src)
	new /obj/item/stack/medical/advanced/sulfa/small(src)
	return
/obj/item/weapon/matchbox
	name = "火柴盒"
	desc = "一小盒高级火柴."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	item_state = "zippo"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT
	var/maxcap = 10
	var/currcap = 10
	flags = FALSE
	New()
		..()
		currcap = maxcap


/obj/item/weapon/matchbox/examine(mob/user)
	..(user)
	to_chat(user, "里面有[currcap]根火柴, 最多[maxcap]根.")

/obj/item/weapon/matchbox/attack_hand(mob/living/human/H)
	if (currcap>=1 && (src == H.l_hand || src == H.r_hand))
		to_chat(H, "你从火柴盒里取出一根火柴.")
		H.put_in_hands(new/obj/item/weapon/flame/match(H))
		currcap--
		return
	else if (currcap <= 0)
		to_chat(H, "<span class='notice'>火柴盒空了!</span>")
		currcap = 0
		return
	else
		..()

/obj/item/weapon/matchbox/attackby(obj/item/weapon/flame/match/W as obj, mob/user as mob)
	if (istype(W) && !W.lit && !W.burnt)
		if (prob(50))
			playsound(loc, 'sound/items/matchstick_lit.ogg', 25, FALSE, -1)
			W.lit = TRUE
			W.damtype = "burn"
			W.icon_state = "match_lit"
			processing_objects.Add(W)
		else
			playsound(loc, 'sound/items/matchstick_hit.ogg', 25, FALSE, -1)
	W.update_icon()
	return

/obj/item/weapon/storage/box/flare
	name = "一盒信号弹"
	desc = "内含10发红色信号弹."
	icon_state = "flare_box"
	can_hold = list(/obj/item/flashlight/flare)
	New()
		..()
		for (var/i=1, i<= 10, i++)
			new /obj/item/flashlight/flare(src)

/obj/item/weapon/storage/box/flare/attack_hand(mob/user as mob)
	..()
	update_icon()
/obj/item/weapon/storage/attack_self(mob/user as mob)
	..()
	update_icon()

/obj/item/weapon/storage/box/flare/update_icon()
	if (contents.len > 0)
		switch(contents.len)
			if (1 to 3)
				icon_state = "flare_box_33"
			if (4 to 7)
				icon_state = "flare_box_66"
			if (8 to INFINITY)
				icon_state = "flare_box_full"
	else
		icon_state = "flare_box_empty"
	
	
