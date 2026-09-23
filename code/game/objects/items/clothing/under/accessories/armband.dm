/obj/item/clothing/accessory/armband
	name = "红色臂章"
	desc = "一个花哨的红色臂章!"
	icon_state = "red"
	slot = "armband"

/obj/item/clothing/accessory/armband/get_mob_overlay()
	if (!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if (icon_override)
			if ("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]", layer = 4.1)
		else
			mob_overlay = image("icon" = INV_ACCESSORIES_DEF_ICON, "icon_state" = "[tmp_icon_state]", layer = 4.1)
	return mob_overlay

/obj/item/clothing/accessory/armband/british
	name = "红色臂章"
	desc = "一个花哨的红色臂章!"
	icon_state = "british"
	slot = "armband"

/obj/item/clothing/accessory/armband/spanish
	name = "黄色臂章"
	desc = "一个花哨的黄色臂章!"
	icon_state = "spanish"
	slot = "armband"

/obj/item/clothing/accessory/armband/spanish/republican
	name = "西班牙共和派臂章"
	desc = "一个花哨的西班牙共和派臂章!"
	icon_state = "spanishrep"
	slot = "armband"

/obj/item/clothing/accessory/armband/french
	name = "蓝色臂章"
	desc = "一个花哨的蓝色臂章!"
	icon_state = "french"
	slot = "armband"

/obj/item/clothing/accessory/armband/un
	name = "联合国臂章"
	desc = "一个蓝色的联合国臂章。"
	icon_state = "un"
	slot = "armband"

/obj/item/clothing/accessory/armband/portuguese
	name = "绿色臂章"
	desc = "一个花哨的绿色臂章!"
	icon_state = "portuguese"
	slot = "armband"

/obj/item/clothing/accessory/armband/dutch
	name = "橙色臂章"
	desc = "一个花哨的橙色臂章!"
	icon_state = "dutch"
	slot = "armband"

/obj/item/clothing/accessory/armband/japanese
	name = "日本臂章"
	desc = "带有日本国旗的臂章!"
	icon_state = "jap"
	slot = "armband"

/obj/item/clothing/accessory/armband/poland
	name = "波兰臂章"
	desc = "一个波兰臂章!"
	icon_state = "polisharmband"
	slot = "armband"

/obj/item/clothing/accessory/armband/wagner
	name = "红色瓦格纳臂章"
	desc = "一个PMC集团臂章"
	icon_state = "wagred"
	slot = "armband"

//jewelry

/obj/item/clothing/accessory/armband/armbangle
	name = "铁手镯"
	desc = "戴在手臂上的铁手镯."
	icon_state = "iron_arm"
	icon_state = "iron_arm"
	slot = "decor"

/obj/item/clothing/accessory/armband/armbangle/gold
	name = "金手镯"
	desc = "戴在手臂上的金手镯."
	icon_state = "gold_arm"
	icon_state = "gold_arm"
	slot = "decor"

/obj/item/clothing/accessory/armband/armbangle/silver
	name = "银手镯"
	desc = "戴在手臂上的银手镯."
	icon_state = "silver_arm"
	icon_state = "silver_arm"
	slot = "decor"

/obj/item/clothing/accessory/armband/armbangle/copper
	name = "铜手镯"
	desc = "戴在手臂上的铜手镯."
	icon_state = "copper_arm"
	icon_state = "copper_arm"
	slot = "decor"

/obj/item/clothing/accessory/armband/armbangle/bronze
	name = "青铜手镯"
	desc = "戴在手臂上的青铜手镯."
	icon_state = "bronze_arm"
	icon_state = "bronze_arm"
	slot = "decor"

/obj/item/clothing/accessory/armband/sheriff
	name = "警长之星"
	desc = "镇警长的金色之星."
	icon_state = "sheriff"
	icon_state = "sheriff"
	slot = "armband"

/obj/item/clothing/accessory/armband/deputy
	name = "副警长臂章"
	desc = "一条黄色臂章,用于识别警长的副手."
	icon_state = "spanish"
	slot = "armband"
//catears
/obj/item/clothing/accessory/catears
	name = "猫尾和猫耳"
	desc = "有趣"
	icon_state = "kitty"
	item_state = "kitty"
	body_parts_covered = FALSE
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	slot = "decor"
	ripable = FALSE

//customizable
/obj/item/clothing/accessory/custom
	var/uncolored = FALSE
	var/icon/customoverlay = null
	color = "#FFFFFF"
	var/setd = FALSE
	New()
		..()
		spawn(5)
			if (!setd)
				uncolored = TRUE

/obj/item/clothing/accessory/custom/attack_self(mob/user as mob)
	if (uncolored)
		var/input = WWinput(user, "Choose the color:", "Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else
			color = input
			uncolored = FALSE
			return
	else
		..()

/obj/item/clothing/accessory/custom/get_mob_overlay()
	if (!mob_overlay)
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		if (icon_override)
			if ("[tmp_icon_state]_mob" in icon_states(icon_override))
				tmp_icon_state = "[tmp_icon_state]_mob"
			mob_overlay = image("icon" = icon_override, "icon_state" = "[tmp_icon_state]", layer = 4.11)
		else
			mob_overlay = image("icon" = INV_ACCESSORIES_DEF_ICON, "icon_state" = "[tmp_icon_state]", layer = 4.11)

		var/image/NI =  mob_overlay
		NI.color = color
		return NI
	return mob_overlay

/obj/item/clothing/accessory/custom/get_inv_overlay()
	if (!inv_overlay)
		if (!mob_overlay)
			get_mob_overlay()
		var/tmp_icon_state = "[overlay_state? "[overlay_state]" : "[icon_state]"]"
		inv_overlay = image(icon = mob_overlay.icon, icon_state = tmp_icon_state, dir = SOUTH)
		var/image/NI =  inv_overlay
		NI.color = color
		return NI
	return inv_overlay

/obj/item/clothing/accessory/custom/scarf
	name = "围巾"
	desc = "一条布围巾."
	icon_state = "customscarf"
	item_state = "customscarf"
	slot = "decor"

/obj/item/clothing/accessory/custom/armband
	name = "臂章"
	desc = "一条布臂章."
	icon_state = "customarmband"
	item_state = "customarmband"
	slot = "armband"

/obj/item/clothing/accessory/custom/sash
	name = "腰带"
	desc = "一条布腰带."
	icon_state = "customsash"
	item_state = "customsash"
	slot = "sash"

/obj/item/clothing/accessory/custom/tabard
	name = "罩袍"
	desc = "一件布罩袍."
	icon_state = "customtabard"
	item_state = "customtabard"
	slot = "overcloth"

/obj/item/clothing/accessory/custom/apron
	name = "围裙"
	desc = "一条布围裙."
	icon_state = "apron"
	item_state = "apron"
	slot = "overcloth"

/obj/item/clothing/accessory/custom/priest_band
	name = "牧师带"
	desc = "一条牧师带."
	icon_state = "customizable_priest_band"
	item_state = "customizable_priest_band"
	slot = "decor"

/obj/item/clothing/accessory/custom/cape
	name = "斗篷"
	desc = "一件布斗篷."
	icon_state = "customcape"
	item_state = "customcape"
	slot = "cape"

/obj/item/clothing/accessory/custom/tie
	name = "领带"
	desc = "一条布领带."
	icon_state = "custom_tie"
	item_state = "custom_tie"
	slot = "tie"

/obj/item/clothing/accessory/custom/bowtie
	name = "领结"
	desc = "一个布领结."
	icon_state = "custom_bowtie"
	item_state = "custom_bowtie"
	slot = "tie"

/obj/item/clothing/accessory/patch/marksman
	name = "射手徽章"
	desc = "带有射手标志的徽章.通常由熟练的射手佩戴."
	icon_state = "patch_marksman"
	item_state = "patch_marksman"
	slot = "armband"

/obj/item/clothing/accessory/patch/russia
	name = "俄罗斯徽章"
	desc = "带有俄罗斯国旗的徽章."
	icon_state = "patch_russia"
	item_state = "patch_russia"
	slot = "armband"

/obj/item/clothing/accessory/patch/spetsgruppaa
	name = "A队特种部队徽章"
	desc = "一枚特种部队徽章,这枚是斯佩茨纳兹的."
	icon_state = "patch_spets"
	item_state = "patch_marksman"
	slot = "armband"

/obj/item/clothing/accessory/patch/swat
	name = "特警徽章"
	desc = "一个特警标签."
	icon_state = "swat"
	item_state = "swat"
	slot = "armband"

/obj/item/clothing/accessory/patch/specialforce
	name = "特种部队徽章"
	desc = "特种部队使用的徽章."
	icon_state = "patch_specialforces"
	item_state = "patch_specialforces"
	slot = "armband"

/obj/item/clothing/accessory/patch/police
	name = "警察"
	desc = "警察使用的标签."
	icon_state = "policetag"
	item_state = "policetag"
	slot = "armband"

/obj/item/clothing/accessory/patch/security
	name = "安保"
	desc = "安保部队使用的标签."
	icon_state = "policetag"
	item_state = "policetag"
	slot = "armband"

/obj/item/clothing/accessory/pauldronsingle
	name = "标准单肩甲"
	desc = "一个塑料装甲肩罩."
	icon_state = "pauldron_s"
	item_state = "pauldron_s"
	slot = "decor"

/obj/item/clothing/accessory/pauldronsingle/green
	name = "标准绿色单肩甲"
	desc = "一个绿色塑料装甲肩罩."
	icon_state = "pauldron_sg"
	item_state = "pauldron_sg"
	slot = "decor"

/obj/item/clothing/accessory/pauldronsingle/blue
	name = "标准蓝色单肩甲"
	desc = "一个蓝色塑料装甲肩罩."
	icon_state = "pauldron_sb"
	item_state = "pauldron_sb"
	slot = "decor"

/obj/item/clothing/accessory/pauldronsingle/red
	name = "标准红色单肩甲"
	desc = "一个红色塑料装甲肩罩."
	icon_state = "pauldron_sr"
	item_state = "pauldron_sr"
	slot = "decor"

/obj/item/clothing/accessory/pauldronsingle/gold
	name = "标准金色单肩甲"
	desc = "一个金色塑料装甲肩罩."
	icon_state = "pauldron_sy"
	item_state = "pauldron_sy"
	slot = "decor"

/obj/item/clothing/accessory/pauldrondouble
	name = "标准双肩甲"
	desc = "双塑料肩罩."
	icon_state = "pauldron_d"
	item_state = "pauldron_d"
	slot = "decor"

/obj/item/clothing/accessory/pauldrondouble/green
	name = "标准绿色双肩甲"
	desc = "双绿色塑料肩罩."
	icon_state = "pauldron_dg"
	item_state = "pauldron_dg"
	slot = "decor"

/obj/item/clothing/accessory/pauldrondouble/blue
	name = "标准蓝色双肩甲"
	desc = "双蓝色塑料肩罩."
	icon_state = "pauldron_db"
	item_state = "pauldron_db"
	slot = "decor"

/obj/item/clothing/accessory/pauldrondouble/red
	name = "标准红色双肩甲"
	desc = "双红色塑料肩罩."
	icon_state = "pauldron_dr"
	item_state = "pauldron_dr"
	slot = "decor"

/obj/item/clothing/accessory/pauldrondouble/gold
	name = "标准金色双肩甲"
	desc = "双红色塑料肩罩."
	icon_state = "pauldron_dy"
	item_state = "pauldron_dy"
	slot = "decor"

/obj/item/clothing/accessory/wearable_sign
	name = "可穿戴标牌"
	desc = "一个带绳子的木制标牌,可穿戴在衣物外."
	icon_state = "wearable_sign"
	item_state = "wearable_sign"
	slot = "overcloth"

/obj/item/clothing/accessory/wearable_sign/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/pen))
		var/newtext = input("What do you want to write on the sign? (Up to 30 characters)","Sign", "") as text
		if (newtext == null)
			newtext = ""
		newtext = sanitize(newtext, 30, FALSE)
		name = "wooden sign: [newtext]"
		return
	else
		..()