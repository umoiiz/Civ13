/* File reserved for custom types other than the default metal door that starts locked on /obj/structure/simple_door/key_door/custom */

/obj/structure/simple_door/key_door/custom/doubledoor
	name = "大型双开门"
	material = "wood"
	desc = "一扇大型的劣质双开门, 带锁. 如果你能看到这个, 请向开发者报告."
	unique_door_name = "doubledoor"
	icon = 'icons/obj/doors/material_doors_fwoosh.dmi'
	health = 200

/obj/structure/simple_door/key_door/custom/doubledoor/bone //for tribes
	name = "大型骨制双开门"
	material = "bone"
	desc = "一扇大型的骨制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/marble //psuedo-material
	name = "大型大理石双开门"
	material = "marble"
	desc = "一扇大型的大理石双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/stone
	name = "大型石制双开门"
	material = "stone"
	desc = "一扇大型的石制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/sandstone
	name = "大型砂岩双开门"
	material = "sandstone"
	desc = "一扇大型的砂岩双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/tin
	name = "大型锡制双开门"
	material = "tin"
	health = 150
	desc = "一扇大型的锡制双开门, 带锁. 只要用力足够, 它们很快就能被打破."

/obj/structure/simple_door/key_door/custom/doubledoor/lead
	name = "大型铅制双开门"
	material = "lead"
	desc = "一扇大型的铅制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/copper
	name = "大型铜制双开门"
	material = "copper"
	desc = "一扇大型的铜制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/bronze
	name = "大型青铜双开门"
	material = "bronze"
	health = 250
	desc = "一扇大型的做工精良且坚固的青铜双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/iron
	name = "大型铁制双开门"
	material = "iron"
	health = 300
	desc = "一扇大型的坚固铁制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/doubledoor/steel
	name = "大型强化钢双开门"
	material = "steel"
	health = 400
	desc = "一扇大型的强化钢双开门, 带锁."
	breachable = FALSE

/obj/structure/simple_door/key_door/custom/doubledoor/silver
	name = "大型银制双开门"
	material = "silver"
	desc = "一扇大型的闪闪发光的银制双开门, 带锁."
	breachable = FALSE

/obj/structure/simple_door/key_door/custom/doubledoor/gold
	name = "大型金制双开门"
	material = "gold"
	desc = "一扇大型的微微发光的金制双开门, 带锁."

/obj/structure/simple_door/key_door/custom/singledoor/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "improper single door"
	icon = 'icons/obj/doors/material_doors_fwoosh.dmi'
	basic_icon = "private"
	icon_state = "private"
	desc = "If you can see this door please report it to a developer"
	override_material = TRUE

/obj/structure/simple_door/key_door/custom/singledoor/privacy/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "wooden privacy door"
	desc = "A wood paneled privacy door, it has a locking mechanism"
	health = 250
	override_material = FALSE
	override_opacity = TRUE
	opacity = FALSE
