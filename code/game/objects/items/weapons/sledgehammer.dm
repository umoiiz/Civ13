//Melee, two handed.
/obj/item/weapon/sledgehammer
	name = "通用大锤"
	desc = "一把普通的双手大锤,非常沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "sledgehammer"
	item_state = "sledgehammer"
	edge = FALSE
	sharp = FALSE
	equiptimer = 35
	force = 32

//Needs two hands to use.
/obj/item/weapon/sledgehammer/proc/special_check(mob/user)
		/*if(orc == 1 || gorillaman == 1)
			//Orcs and Apes can use it onehanded.
		else*/
	if (!(user.has_empty_hand(both = FALSE)))
		to_chat(user, "<span class='warning'>你需要双手才能挥动[src]!</span>")
		return FALSE

/obj/item/weapon/sledgehammer/stone/sledgehammer
	name = "石制大锤"
	desc = "一把石制大锤,非常沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stone_sledgehammer"
	item_state = "stone_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 32
	weight = 80
	force = 24
/obj/item/weapon/sledgehammer/lead/sledgehammer
	name = "铅制大锤"
	desc = "一把铅制大锤,极其沉重,几乎无法使用."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "lead_sledgehammer"
	item_state = "lead_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 35
	weight = 80
	force = 32

/obj/item/weapon/sledgehammer/bronze/sledgehammer
	name = "青铜大锤"
	desc = "一把青铜大锤,相当沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bronze_sledgehammer"
	item_state = "bronze_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 32
	weight = 80
	force = 40

/obj/item/weapon/sledgehammer/iron/sledgehammer
	name = "铁制大锤"
	desc = "一把铁制大锤,非常沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "iron_sledgehammer"
	item_state = "Iron_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 32
	weight = 80
	force = 52

/obj/item/weapon/sledgehammer/steel/sledgehammer
	name = "钢制大锤"
	desc = "一把钢制大锤,极其沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "steel_sledgehammer"
	item_state = "steel_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 35
	weight = 80
	force = 66
	slowdown = 5

/obj/item/weapon/sledgehammer/uranium/sledgehammer
	name = "铀制大锤"
	desc = "一把铀制大锤,有点沉重,但很适合砸碎东西."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "uranium_sledgehammer"
	item_state = "uranium_sledgehammer"
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_LARGE
	flammable = FALSE
	equiptimer = 30
	weight = 80
	force = 60

/obj/item/weapon/sledgehammer/uranium/attack()
	explosion(src.loc, 2, 2, 2, 2)
	radiation_pulse(src.loc, 4, 15, 300, TRUE)
	qdel(src)