//weapon parts (arrowheads, spearheads, etc) that need to be finished with hood handles and others
/obj/item/weapon/material/part
	name = "武器部件"
	icon = 'icons/obj/metallurgy.dmi'
	icon_state = "crude_axehead"
	desc = "一个未完成的武器部件."
	flags = CONDUCT
	sharp = TRUE
	edge = TRUE
	force_divisor = 0.10 // 9 when wielded with hardness 60 (steel)
	attack_verb = list("slashed","sliced")
	unbreakable = TRUE
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT|SLOT_POCKET
	var/result = null
	var/result_name = ""
	material = "iron"

/obj/item/weapon/material/part/axehead
	name = "粗糙的斧头"
	icon_state = "crude_axehead"
	desc = "一个金属斧头.需要安装手柄才能使用."
	result = /obj/item/weapon/material/hatchet
	result_name = "axe"
	material = null

/obj/item/weapon/material/part/axehead/hatchet
	name = "短柄斧头"
	result = /obj/item/weapon/material/hatchet

/obj/item/weapon/material/part/axehead/battleaxe
	name = "战斧头"
	result = /obj/item/weapon/material/hatchet/battleaxe

/obj/item/weapon/material/part/axehead/throwing
	name = "投掷斧头"
	result = /obj/item/weapon/material/thrown/throwing_axe

/obj/item/weapon/material/part/shovel
	name = "粗糙的铲头"
	icon_state = "crude_shovel"
	desc = "一个金属铲头.需要安装手柄才能使用."
	result = /obj/item/weapon/material/shovel
	result_name = "shovel"
	material = null

/obj/item/weapon/material/part/pickaxe
	name = "粗糙的镐头"
	icon_state = "crude_pickaxe"
	desc = "一个金属镐头.需要安装手柄才能使用."
	result = /obj/item/weapon/material/pickaxe
	result_name = "pickaxe"
	material = null

/obj/item/weapon/material/part/spearhead
	name = "粗糙的矛头"
	icon_state = "crude_spearhead"
	desc = "一个金属矛头.需要安装手柄才能使用."
	result = /obj/item/weapon/material/spear
	result_name = "spear"
	material = null

/obj/item/weapon/material/part/attackby(obj/item/weapon/material/handle/HANDLE, mob/living/human/H)
	if (result && material && src && istype(HANDLE, /obj/item/weapon/material/handle))
		var/obj/item/weapon/material/M = new result(get_turf(H),material.name)
		M.loc = H.loc
		qdel(HANDLE)
		qdel(src)
		to_chat(H, "你完成了[result_name]的组装.")
		return