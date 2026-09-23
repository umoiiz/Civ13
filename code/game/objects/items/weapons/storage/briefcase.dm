/obj/item/weapon/storage/briefcase
	name = "公文包"
	desc = "它由正宗的人造皮革制成, 上面还挂着价格标签. 它的主人一定是个真正的专业人士."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = TRUE
	throw_range = 4
	w_class = ITEM_SIZE_LARGE
	max_w_class = 3
	max_storage_space = 16

/obj/item/weapon/storage/briefcase/kgb

/obj/item/weapon/storage/briefcase/kgb/New()
	..()
	new /obj/item/weapon/attachment/bayonet(src)
	new /obj/item/clothing/mask/gas/military(src)
	new /obj/item/clothing/mask/gas/military(src)
	new /obj/item/clothing/glasses/thermal(src)
	new /obj/item/weapon/grenade/chemical/white_phosphorus(src)
	new /obj/item/weapon/grenade/antitank/rpg40(src)
	new /obj/item/ammo_magazine/makarov(src)
	new /obj/item/stack/medical/advanced/bruise_pack(src)