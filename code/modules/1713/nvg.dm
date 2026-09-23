/*
 * Contains
 * /obj/item/rig_module/vision
 * /obj/item/rig_module/vision/thermal
 * /obj/item/rig_module/vision/nvg
 */

/datum/rig_vision
	var/mode
	var/obj/item/clothing/glasses/glasses

/datum/rig_vision/nvg
	mode = "night vision"
/datum/rig_vision/nvg/New()
	glasses = new /obj/item/clothing/glasses/nvg

/datum/rig_vision/thermal
	mode = "thermal scanner"
/datum/rig_vision/thermal/New()
	glasses = new /obj/item/clothing/glasses/thermal


/obj/item/clothing/glasses/nvg
	name = "夜视仪"
	desc = "增强低光环境下的视力,让你在黑暗中也能看清."
	icon_state = "nvg_off"
	item_state = "nvg_off"
	darkness_view = 7
	toggleable = 1
	see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
	off_state = "nvg_off"
	on_state = "nvg"
	active = 0
	overtype = "nvg"
	blocks_scope = TRUE
	restricts_view = 0

/obj/item/clothing/glasses/nvg/New()
	..()
	overlay = global_hud.nvg


/obj/item/clothing/glasses/thermal
	name = "热成像仪"
	desc = "大幅增强对热源物体的视觉感知."
	icon_state = "thermal_off"
	item_state = "thermal_off"
	darkness_view = 7
	toggleable = 1
//	see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
	off_state = "thermal_off"
	on_state = "thermal"
	vision_flags = SEE_MOBS
	flash_protection = FLASH_PROTECTION_REDUCED
	active = 0
	overtype = "thermal"
	blocks_scope = TRUE
	restricts_view = 0

/obj/item/clothing/glasses/thermal/New()
	..()
	overlay = global_hud.thermal


/obj/item/clothing/glasses/thermal/modern
	name = "现代热成像仪"
	desc = "一套现代热成像仪,同时也能让你在黑暗中看清."
	icon_state = "thermal_off"
	item_state = "thermal_off"
	darkness_view = 7
	toggleable = 1
	see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
	off_state = "thermal_off"
	on_state = "thermal"
	vision_flags = SEE_MOBS
	flash_protection = FLASH_PROTECTION_REDUCED
	active = 0
	overtype = ""
	blocks_scope = FALSE
	restricts_view = 0