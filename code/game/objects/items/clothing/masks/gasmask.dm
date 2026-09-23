/obj/item/clothing/mask/gas
	name = "防毒面具"
	desc = "一种覆盖面部的面具, 可以过滤空气中的有害气体."
	icon_state = "gas_alt"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_SMALL
	item_state = "gas_alt"
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = TRUE			//For gas mask filters
	var/list/filtered_gases = list("plasma", "sleeping_agent, xylyl_bromide", "mustard_gas", "white_phosphorus_gas", "chlorine", "zyklon_b", "phosgene_gas")
	slot_flags = SLOT_BELT|SLOT_MASK
	blocks_scope = TRUE
	restricts_view = 1
	flags = CONDUCT
	armor = list(melee = 10, arrow = FALSE, gun = FALSE, energy = 35, bomb = 15, bio = 100, rad = 80)

/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for (var/g in filtered_gases)
		if (air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered

/obj/item/clothing/mask/gas/german
	icon_state = "german_gasmask"
	item_state = "german_gasmask"

/obj/item/clothing/mask/gas/british
	icon_state = "british_gasmask"
	item_state = "british_gasmask"

/obj/item/clothing/mask/gas/french
	icon_state = "french_gasmask"
	item_state = "french_gasmask"

/obj/item/clothing/mask/gas/modern
	icon_state = "modern_gasmask"
	item_state = "modern_gasmask"

/obj/item/clothing/mask/gas/military
	icon_state = "military_gasmask"
	item_state = "military_gasmask"

/obj/item/clothing/mask/gas/modern2
	icon_state = "moderngasmask"
	item_state = "moderngasmask"

/obj/item/clothing/mask/gas/halfmask
	blocks_scope = FALSE
	name = "半面罩"
	restricts_view = 1
	icon_state = "halfmask"
	item_state = "halfmask"
	flags_inv = FALSE
	armor = list(melee = 5, arrow = FALSE, gun = FALSE, energy = 15, bomb = 5, bio = 100, rad = 70)
	body_parts_covered = FACE

/obj/item/clothing/mask/gas/japanese
	icon_state = "t99"
	item_state = "t99"

/obj/item/clothing/mask/gas/russia
	icon_state = "russiamask"
	item_state = "russiamask"
	name = "GP-9防毒面具"
	desc = "一款面向民用和民防的全景防毒面具."

/obj/item/clothing/mask/gas/soviet
	name = "ShM-1防毒面具"
	desc = "一款二战前夕推出的苏联头盔式橡胶面具."
	icon_state = "shm1"
	item_state = "shm1"

/obj/item/clothing/mask/gas/soviet/gp5
	name = "GP-5防毒面具"
	desc = "一款苏联头盔式橡胶面具."
	icon_state = "gp5"
	item_state = "gp5"

/obj/item/clothing/mask/gas/soviet/pmk1
	icon_state = "pmk1"
	item_state = "pmk1"
	name = "PMK-1防毒面具"
	desc = "一款20世纪70年代末设计的紧凑型组合面具, 供苏联和俄罗斯武装部队使用."

/obj/item/clothing/mask/gas/american
	icon_state = "m2"
	item_state = "m2"
	name = "M2防毒面具"
	desc = "一款1939年设计的紧凑型组合面具, 供美国陆军使用."

/obj/item/clothing/mask/gas/swat
	icon_state = "swatmask"
	item_state = "swatmask"

/obj/item/clothing/mask/gas/swat_new
	icon_state = "swat_new"
	item_state = "swat_new"