/obj/item/clothing/accessory/storage/sheath
	name = "短剑剑鞘"
	desc = "一个用于较短长度剑的皮革剑鞘."
	var/base_icon = "short_sheath"
	icon_state = "short_sheath"
	item_state = "short_sheath"
	slots = 1
	slot = "utility"
	ripable = FALSE
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/smallsword,
		/obj/item/weapon/material/sword/gladius,
		/obj/item/weapon/material/sword/xiphos,
		/obj/item/weapon/material/sword/gaelic,
		/obj/item/weapon/material/sword/khopesh,
		/obj/item/weapon/material/sword/kukri,
		/obj/item/weapon/material/sword/bolo)



/obj/item/clothing/accessory/storage/sheath/on_attached(obj/item/clothing/under/S, mob/user as mob)
	..()
	has_suit.verbs += /obj/item/clothing/accessory/storage/sheath/verb/sheathe_verb

/obj/item/clothing/accessory/storage/sheath/on_removed(mob/user as mob)
	has_suit.verbs -= /obj/item/clothing/accessory/storage/sheath/verb/sheathe_verb
	..()


/obj/item/clothing/accessory/storage/sheath/verb/sheathe_verb()
	set name = "Holster"
	set category = null
	set src in usr
	if (!istype(usr, /mob/living)) return
	if (usr.stat) return

	//can't we just use src here?
	var/obj/item/clothing/accessory/storage/sheath/H = null
	if (istype(src, /obj/item/clothing/accessory/storage/sheath))
		H = src
	else if (istype(src, /obj/item/clothing/under))
		var/obj/item/clothing/under/S = src
		if (S.accessories.len)
			H = locate() in S.accessories

	if (!H)
		to_chat(usr, SPAN_WARNING("Something is very wrong."))
		return

	var/obj/item/weapon/currsword = null
	for(var/obj/item/weapon/W in H.hold)
		currsword = W

	if (!currsword)
		var/obj/item/W = usr.get_active_hand()
		attackby(W, usr)
		if (H.hold.contents.len >= 1)
			usr.visible_message("<span class = 'notice'>[usr]收起\the [W].</span>", "<span class = 'notice'>你收起\the [W].</span>")
//			update_icon()
			playsound(usr, 'sound/items/unholster_sword01.ogg', 50, 1)
			return TRUE
		else
			to_chat(usr, SPAN_WARNING("That is not going to fit there."))
			return FALSE

	else
		if (istype(usr.get_active_hand(),/obj) && istype(usr.get_inactive_hand(),/obj))
			to_chat(usr, SPAN_WARNING("You need an empty hand to draw \the [currsword]!"))
			return FALSE
		else
			usr.put_in_hands(currsword)
			usr.visible_message("<span class='danger'>[usr]拔出\the [currsword]!</span>", "<span class='notice'>你拔出\the [currsword].</span>")
//			update_icon()
			playsound(usr, 'sound/items/unholster_sword02.ogg', 80, 1)
			return TRUE

/*obj/item/clothing/accessory/storage/sheath/update_icon()
	if (hold.contents.len > 0)
		icon_state = "[base_icon]"
		item_state = "[base_icon]"
	else
		icon_state = "[base_icon]_empty"
		item_state = "[base_icon]_empty"
*/
/obj/item/clothing/accessory/storage/sheath/longsword
	name = "长剑剑鞘"
	desc = "一个大号皮革剑鞘.看起来足够长,能容纳大多数剑."
	base_icon = "longsword_sheath"
	icon_state = "longsword_sheath"
	item_state = "longsword_sheath"
	slots = 1
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/arabsword,
		/obj/item/weapon/material/sword/arabsword2,
		/obj/item/weapon/material/sword/armingsword,
		/obj/item/weapon/material/sword/bolo,
		/obj/item/weapon/material/sword/broadsword,
		/obj/item/weapon/material/sword/cutlass,
		/obj/item/weapon/material/sword/gaelic,
		/obj/item/weapon/material/sword/gladius,
		/obj/item/weapon/material/sword/khopesh,
		/obj/item/weapon/material/sword/kukri,
		/obj/item/weapon/material/sword/longquan,
		/obj/item/weapon/material/sword/longsword,
		/obj/item/weapon/material/sword/magic,
		/obj/item/weapon/material/sword/mersksword,
		/obj/item/weapon/material/sword/rapier,
		/obj/item/weapon/material/sword/sabre,
		/obj/item/weapon/material/sword/saif,
		/obj/item/weapon/material/sword/scimitar,
		/obj/item/weapon/material/sword/shashka,
		/obj/item/weapon/material/sword/smallsword,
		/obj/item/weapon/material/sword/spadroon,
		/obj/item/weapon/material/sword/tes13,
		/obj/item/weapon/material/sword/training,
		/obj/item/weapon/material/sword/urukhaiscimitar,
		/obj/item/weapon/material/sword/xiphos,
		/obj/item/weapon/material/sword/zweihander,
		/obj/item/weapon/material/machete,
		/obj/item/weapon/material/machete1)

/obj/item/clothing/accessory/storage/sheath/katana
	name = "武士刀刀鞘"
	desc = "一个用于武士刀的皮革刀鞘."
	base_icon = "katana_sheath"
	icon_state = "katana_sheath"
	item_state = "katana_sheath"
	slots = 1
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/katana,
		/obj/item/weapon/material/sword/wakazashi,
		/obj/item/weapon/material/sword/training/bamboo,
		/obj/item/weapon/material/kitchen/utensil/knife/tanto)

/obj/item/clothing/accessory/storage/sheath/katana/full
	slots = 1
/obj/item/clothing/accessory/storage/sheath/katana/full/New()
	..()
	new/obj/item/weapon/material/sword/katana(src)


/obj/item/clothing/accessory/storage/sheath/daisho
	name = "大小刀鞘"
	desc = "一对用于配套武器的皮革刀鞘."
	base_icon = "daisho_sheath"
	icon_state = "daisho_sheath"
	item_state = "daisho_sheath"
	slots = 2
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/katana,
		/obj/item/weapon/material/sword/wakazashi,
		/obj/item/weapon/material/sword/training/bamboo,
		/obj/item/weapon/material/kitchen/utensil/knife/tanto)

/obj/item/clothing/accessory/storage/sheath/longer
	name = "剑鞘"
	desc = "一个用于装剑的皮革剑鞘,长度适中."
	base_icon = "longer_sheath"
	icon_state = "longer_sheath"
	item_state = "longer_sheath"
	slots = 1
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/arabsword,
		/obj/item/weapon/material/sword/arabsword2,
		/obj/item/weapon/material/sword/armingsword,
		/obj/item/weapon/material/sword/bolo,
		/obj/item/weapon/material/sword/cutlass,
		/obj/item/weapon/material/sword/gaelic,
		/obj/item/weapon/material/sword/gladius,
		/obj/item/weapon/material/sword/khopesh,
		/obj/item/weapon/material/sword/kukri,
		/obj/item/weapon/material/sword/longquan,
		/obj/item/weapon/material/sword/magic,
		/obj/item/weapon/material/sword/mersksword,
		/obj/item/weapon/material/sword/rapier,
		/obj/item/weapon/material/sword/sabre,
		/obj/item/weapon/material/sword/saif,
		/obj/item/weapon/material/sword/scimitar,
		/obj/item/weapon/material/sword/shashka,
		/obj/item/weapon/material/sword/smallsword,
		/obj/item/weapon/material/sword/spadroon,
		/obj/item/weapon/material/sword/tes13/steel,
		/obj/item/weapon/material/sword/training,
		/obj/item/weapon/material/sword/urukhaiscimitar,
		/obj/item/weapon/material/sword/xiphos,
		/obj/item/weapon/material/machete,
		/obj/item/weapon/material/machete1)

/obj/item/clothing/accessory/storage/sheath/longer/officer
	name = "军官装备带"
	desc = "一对用于装军官随身武器的枪套.可以装手枪、左轮手枪和大多数剑."
	base_icon = "longer_sheath"
	icon_state = "longer_sheath"
	item_state = "longer_sheath"
	slots = 2
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/sword/arabsword,
		/obj/item/weapon/material/sword/arabsword2,
		/obj/item/weapon/material/sword/armingsword,
		/obj/item/weapon/material/sword/bolo,
		/obj/item/weapon/material/sword/cutlass,
		/obj/item/weapon/material/sword/gaelic,
		/obj/item/weapon/material/sword/gladius,
		/obj/item/weapon/material/sword/khopesh,
		/obj/item/weapon/material/sword/kukri,
		/obj/item/weapon/material/sword/longquan,
		/obj/item/weapon/material/sword/magic,
		/obj/item/weapon/material/sword/mersksword,
		/obj/item/weapon/material/sword/rapier,
		/obj/item/weapon/material/sword/sabre,
		/obj/item/weapon/material/sword/saif,
		/obj/item/weapon/material/sword/scimitar,
		/obj/item/weapon/material/sword/shashka,
		/obj/item/weapon/material/sword/smallsword,
		/obj/item/weapon/material/sword/spadroon,
		/obj/item/weapon/material/sword/tes13/steel,
		/obj/item/weapon/material/sword/urukhaiscimitar,
		/obj/item/weapon/material/sword/xiphos,
		/obj/item/weapon/material/machete,
		/obj/item/weapon/material/machete1,
		/obj/item/weapon/gun/projectile/flintlock/pistol,
		/obj/item/weapon/gun/projectile/flintlock/pistoletmodelean1733,
		/obj/item/weapon/gun/projectile/flintlock/pistoletmodeleanxiii,
		/obj/item/weapon/gun/projectile/flintlock/blunderbuss/pistol,
		/obj/item/weapon/gun/projectile/flintlock/duellingpistol,
		/obj/item/weapon/material/sword/katana,
		/obj/item/weapon/material/sword/wakazashi,
		/obj/item/weapon/gun/projectile/capnball,
		/obj/item/weapon/gun/projectile/pistol,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/whistle,
		/obj/item/weapon/horn,
		/obj/item/weapon/melee)

/obj/item/clothing/accessory/storage/sheath/knife
	name = "刀鞘"
	desc = "一个用于装刀的皮革刀鞘."
	base_icon = "knifeholster"
	icon_state = "knifeholster"
	item_state = "knifeholster"
	slots = 1
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/kitchen/utensil,
		/obj/item/weapon/surgery/scalpel,
		/obj/item/weapon/attachment/bayonet,
		/obj/item/weapon/material/thrown/kunai_normal,
		/obj/item/weapon/material/thrown/throwing_knife,
		/obj/item/weapon/material/thrown/throwing_knife1,
		/obj/item/weapon/material/kitchen/utensil/knife/tanto)

/obj/item/clothing/accessory/storage/sheath/baton
	name = "腰带环"
	desc = "一个用于你腰带的环.你大概可以在那里放些使人丧失行动能力的东西."
	base_icon = "knifeholster"
	icon_state = "knifeholster"
	item_state = "knifeholster"
	slots = 1
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/melee)


/obj/item/clothing/accessory/storage/sheath/baton/enforcement
	name = "执勤装备带"
	desc = "一条腰带上的环和枪套组合.你大概可以在那里放些执法工具."
	base_icon = "tacholster"
	icon_state = "tacholster"
	item_state = "tacholster"
	slots = 2
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/melee/classic_baton/guard,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/handcuffs,
		/obj/item/clothing/mask/muzzle,
		/obj/item/weapon/melee/nightbaton,
		/obj/item/weapon/whistle,
		/obj/item/weapon/horn,
		/obj/item/weapon/melee/telebaton)


/obj/item/clothing/accessory/storage/sheath/baton/enslavement
	name = "松散小包"
	desc = "一对松散的小包,非常适合快速取出一些安抚工具."
	base_icon = "tan_pouches"
	icon_state = "tan_pouches"
	item_state = "tan_pouches"
	slots = 2
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/melee,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/reagent_containers/syringe/ld50_syringe/choral,
		/obj/item/clothing/mask/muzzle,
		/obj/item/weapon/gun/projectile/dartgun/blowgun)

/obj/item/clothing/accessory/storage/sheath/thrown
	name = "投掷武器弹带"
	desc = "一组腰带上的皮革枪套,用于快速存放和取用投掷武器."
	base_icon = "bandolier"
	icon_state = "bandolier"
	item_state = "bandolier"
	slots = 4
	slot = "utility"
	New()
		..()
		hold.can_hold = list(/obj/item/weapon/material/thrown)