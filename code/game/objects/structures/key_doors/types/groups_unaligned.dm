// not locked at all - no key, of course
#define ANYONE_CODE 995 * 3
/datum/keyslot/anyone
	code = -1

/obj/structure/simple_door/key_door/anyone
	keyslot_type = /datum/keyslot/anyone

/obj/structure/simple_door/key_door/anyone/wood
	material = "wood"
	health = 150

/obj/structure/simple_door/key_door/anyone/shoji
	material = "paper"
	unique_door_name = "shoji"

/* See key_door.dm for relevant information about shoji ^, as the code is partitioned*/

/obj/structure/simple_door/key_door/anyone/rustic
	material = "log"
	unique_door_name = "rustic"
	health = 100

/obj/structure/simple_door/key_door/anyone/nordic
	material = "log"
	name = "北欧"
	unique_door_name = "nordic"
	icon_state = "nordic"
	override_material = TRUE
	health = 150

/obj/structure/simple_door/key_door/anyone/aztec
	material = "wood"
	name = "阿兹特克"
	unique_door_name = "aztec"
	icon_state = "aztec"
	override_material = TRUE
	health = 150

/obj/structure/simple_door/key_door/anyone/roman
	material = "stone"
	name = "罗马"
	unique_door_name = "roman"
	icon_state = "roman"
	override_material = TRUE
	health = 200

/obj/structure/simple_door/key_door/anyone/blast
	material = "steel"
	name = "防爆门"
	unique_door_name = "Blast door"
	icon_state = "blast"
	health = 500

/obj/structure/simple_door/key_door/anyone/doubledoor
	material = null
	name = "大型双开门"
	desc = "一组大型的不合规门. 如果你看到这个, 请向开发者报告."
	unique_door_name = "doubledoor"
	icon = 'icons/obj/doors/material_doors_fwoosh.dmi'
	health = 200

/obj/structure/simple_door/key_door/anyone/doubledoor/wood
	name = "大型木制双开门"
	material = "wood"
	desc = "一组大型木门. 只要用力足够, 很快就能打破."
	health = 150

/obj/structure/simple_door/key_door/anyone/doubledoor/bamboo
	name = "大型竹制双开门"
	material = "bamboo"
	desc = "一组大型竹门. 只要用力足够, 很快就能打破."
	health = 150

/obj/structure/simple_door/key_door/anyone/doubledoor/bone //for tribes
	name = "大型骨制双开门"
	material = "bone"
	desc = "一组大型骨门."

/obj/structure/simple_door/key_door/anyone/doubledoor/marble
	name = "大型大理石双开门"
	material = "marble"
	desc = "一组大型大理石石门."

/obj/structure/simple_door/key_door/anyone/doubledoor/stone
	name = "大型石制双开门"
	material = "stone"
	desc = "一组大型石门."

/obj/structure/simple_door/key_door/anyone/doubledoor/sandstone
	name = "大型石制双开门"
	material = "sandstone"
	desc = "一组大型砂岩门."

/obj/structure/simple_door/key_door/anyone/doubledoor/tin
	name = "大型锡制双开门"
	material = "tin"
	health = 150
	desc = "一组大型锡门. 只要用力足够, 很快就能打破."

/obj/structure/simple_door/key_door/anyone/doubledoor/lead
	name = "大型铅制双开门"
	material = "lead"
	desc = "一组大型铅门."

/obj/structure/simple_door/key_door/anyone/doubledoor/copper
	name = "大型铜制双开门"
	material = "copper"
	desc = "一组大型铜门."

/obj/structure/simple_door/key_door/anyone/doubledoor/bronze
	name = "大型青铜双开门"
	material = "bronze"
	health = 250
	desc = "一组建造精良且坚固的青铜门."

/obj/structure/simple_door/key_door/anyone/doubledoor/iron
	name = "大型铁制双开门"
	material = "iron"
	health = 300
	desc = "一组坚固的铁门."

/obj/structure/simple_door/key_door/anyone/doubledoor/steel
	name = "大型强化钢制双开门"
	material = "steel"
	health = 400
	desc = "一组强化钢门."

/obj/structure/simple_door/key_door/anyone/doubledoor/steel/store_door
	name = "双开商店门"
	desc = "一扇大型钢化玻璃双开门."
	health = 150
	icon = 'icons/obj/doors/material_doors.dmi'
	basic_icon = "storedoor"
	icon_state = "storedoor"
	override_material = TRUE
	override_opacity = TRUE
	opacity = 0
	initial_opacity = 0

/obj/structure/simple_door/key_door/anyone/doubledoor/silver
	name = "大型银制双开门"
	material = "silver"
	desc = "一组闪闪发光的银门."

/obj/structure/simple_door/key_door/anyone/doubledoor/gold
	name = "大型金制双开门"
	material = "gold"
	desc = "一组微微发光的金门."

/obj/structure/simple_door/key_door/anyone/singledoor/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "improper single door"
	desc = "If you can see this door please report it to a developer"
	health = 250

/obj/structure/simple_door/key_door/anyone/singledoor/privacy/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "wooden privacy door"
	icon = 'icons/obj/doors/material_doors_fwoosh.dmi'
	basic_icon = "private"
	icon_state = "private"
	desc = "A wood paneled privacy door."
	override_material = FALSE

/obj/structure/simple_door/key_door/anyone/singledoor/housedoor/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "wooden house door"
	icon = 'icons/obj/doors/material_doors_fwoosh.dmi'
	basic_icon = "housedoor"
	icon_state = "housedoor"
	desc = "A wood paneled house door with seethrough windows."
	override_material = FALSE
	override_opacity = TRUE
	opacity = FALSE

/obj/structure/simple_door/key_door/anyone/ship
	material = "log"
	health = 150
/obj/structure/simple_door/key_door/anyone/ship/New(var/newloc,var/material_name)
	..(newloc, "wood")
	name = "wooden ship door"
	icon = 'icons/obj/doors/material_doors_leonister.dmi'
	basic_icon = "ship"
	icon_state = "ship"
	desc = "A wood round ship door."
	override_material = TRUE

/obj/structure/simple_door/key_door/anyone/high_sec
	name = "安全门"
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	basic_icon = "secure"
	icon_state = "secure"
	desc = "一扇坚固的安全滑动门."
	material = "steel"
	override_material = TRUE
	
#undef ANYONE_CODE

