/obj/item/clothing/gloves/captain
	name = "队长手套"
	desc = "华丽的蓝色手套,带有漂亮的金色镶边.很时髦."
	icon_state = "captain"
	item_state = "egloves"

/obj/item/clothing/gloves/thick
	name = "黑色手套"
	desc = "这些工作手套厚实且防火."
	icon_state = "black"
	item_state = "bgloves"
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05

	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick/leather
	desc = "这些皮手套冰冷且防火."
	name = "皮手套"
	icon_state = "leather"
	item_state = "leather"

/obj/item/clothing/gloves/thick/leather/black
	name = "黑色毛皮手套"
	icon_state = "blackfur"
	item_state = "blackfur"

/obj/item/clothing/gloves/thick/leather/brown
	name = "棕色毛皮手套"
	icon_state = "brownfur"
	item_state = "brownfur"

/obj/item/clothing/gloves/thick/leather/white
	name = "白色毛皮手套"
	icon_state = "whitefur"
	item_state = "whitefur"

/obj/item/clothing/gloves/thick/leather/grey
	name = "灰色毛皮手套"
	icon_state = "greyfur"
	item_state = "greyfur"

/obj/item/clothing/gloves/thick/leather/pink
	name = "人皮手套"
	desc = "用人皮制成的手套.野蛮."
	icon_state = "pinkfur"
	item_state = "pinkfur"

/obj/item/clothing/gloves/thick/firefighter
	name = "防火手套"
	icon_state = "firefighter"
	item_state = "firefighter"
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE*4
	flammable = FALSE

//orc gloves relocated to apparel_tribes.dm

/obj/item/clothing/gloves/thick/combat //Combined effect of SWAT gloves and insulated gloves
	desc = "这些战术手套具有一定的防火和抗冲击能力."
	name = "战斗手套"
	icon_state = "black"
	item_state = "swat_gl"
	armor = list(melee = 80, arrow = 15, gun = 10, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	siemens_coefficient = FALSE

/obj/item/clothing/gloves/thick/swat //Combined effect of SWAT gloves and insulated gloves
	name = "特警手套"
	desc = "特警使用的战斗手套."
	icon_state = "swat"
	item_state = "swat"
	armor = list(melee = 80, arrow = 15, gun = 15, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	siemens_coefficient = FALSE

/obj/item/clothing/gloves/thick/swat/officer
	name = "警官手套"
	desc = "警官使用的闪亮黑色手套,用来保持双手干净."

/obj/item/clothing/gloves/thick/salamon //Combined effect of SWAT gloves and insulated gloves
	name = "镀金手套"
	desc = "镀金手套.这些看起来很昂贵."
	icon_state = "salamon"
	item_state = "salamon"
	armor = list(melee = 50, arrow = 15, gun = 10, energy = 25, bomb = 50, bio = 10, rad = FALSE)
	siemens_coefficient = FALSE

/obj/item/clothing/gloves/botanic_leather
	name = "植物学家的皮手套"
	desc = "这些皮革工作手套可以防止荆棘、倒刺、尖刺和其他植物来源的有害物体."
	icon_state = "leather"
	item_state = "ggloves"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves

/obj/item/clothing/gloves/oven
	name = "烤箱手套"
	desc = "用来保护双手免受高温取食物时烫伤的厚实衬垫手套."
	icon_state = "oven_mitts"
	item_state = "oven_mitts"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves

/obj/item/clothing/gloves/union_gloves
	name = "骑兵手套"
	desc = "联邦骑兵和其他军事人员佩戴的手套."
	icon_state = "union_gloves"
	item_state = "union_gloves"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves


/obj/item/clothing/gloves/boxing
	name = "拳击手套"
	desc = "因为你真的需要另一个借口来揍你的船员."
	icon_state = "boxing"
	item_state = "boxing"

/obj/item/clothing/gloves/boxing/green
	icon_state = "boxinggreen"
	item_state = "boxinggreen"

/obj/item/clothing/gloves/boxing/blue
	icon_state = "boxingblue"
	item_state = "boxingblue"

/obj/item/clothing/gloves/boxing/yellow
	icon_state = "boxingyellow"
	item_state = "boxingyellow"

/obj/item/clothing/gloves/sterile
	name = "乳胶手套"
	desc = "无菌手套."
	icon_state = "latex"
	item_state = "latex"
	germ_level = 0
	fingerprint_chance = 20
	armor = list(melee = 2, arrow = 1, gun = FALSE, energy = 25, bomb = 10, bio = 50, rad = FALSE)

/obj/item/clothing/gloves/sterile/nuclear
	name = "防化手套"
	desc = "无菌手套,同时还能保护你免受环境辐射."
	icon_state = "latex"
	item_state = "latex"
	germ_level = 0
	fingerprint_chance = 10
	armor = list(melee = 2, arrow = 1, gun = FALSE, energy = 25, bomb = 10, bio = 50, rad = 10)

/obj/item/clothing/gloves/sterile/nitrile
	name = "丁腈手套"
	desc = "无菌手套."
	icon_state = "blue"
	item_state = "bluegloves"

