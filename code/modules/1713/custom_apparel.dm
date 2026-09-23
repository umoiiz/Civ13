/obj/item/clothing/under/custom
	var/uncolored = FALSE
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/custom/attack_self(mob/user as mob)
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

/obj/item/clothing/head/custom
	var/uncolored1 = FALSE
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored1 = TRUE


/obj/item/clothing/head/custom/attack_self(mob/user as mob)
	if (uncolored1)
		var/input = WWinput(user, "Choose the color:", "Color" , "#FFFFFF", "color")
		if (input == null || input == "")
			return
		else

			color = input
//			to_chat(user, "Color: [color]")
			uncolored1 = FALSE
			return
	else
		..()

/obj/item/clothing/suit/storage/jacket/custom
	var/uncolored = FALSE

/obj/item/clothing/suit/storage/jacket/custom/attack_self(mob/user as mob)
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
///////////////ANCIENT//////////////////////////////////////
/obj/item/clothing/under/custom/toga
	name = "托加长袍"
	desc = "一块简单的布制托加长袍."
	icon_state = "customtoga"
	item_state = "customtoga"

/obj/item/clothing/under/custom/stola
	name = "斯托拉"
	desc = "一块简单的布制斯托拉, 古罗马女性服饰."
	icon_state = "fem_roman"
	item_state = "fem_roman"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

/obj/item/clothing/under/custom/roman
	name = "长款束腰外衣"
	desc = "一件简单的布制束腰外衣, 配有黄铜和皮革腰带."
	icon_state = "customroman"
	item_state = "customroman"

/obj/item/clothing/under/custom/spartan
	name = "短款缠腰布"
	desc = "一块简单的小缠腰布."
	icon_state = "customspartan"
	item_state = "customspartan"

/obj/item/clothing/under/custom/shendyt
	name = "申迪特"
	desc = "一种围在腰间的裙状布料."
	icon_state = "customshendyt"
	item_state = "customshendyt"
	heat_protection = LOWER_TORSO

/obj/item/clothing/under/custom/celtic
	name = "凯尔特长裤"
	desc = "厚布制凯尔特长裤."
	icon_state = "customceltic"
	item_state = "customceltic"
	heat_protection = LOWER_TORSO|LEGS

/obj/item/clothing/under/custom/toga/purple
	name = "紫色托加长袍"
	desc = "一件华丽的布制托加长袍."
	icon_state = "customtoga"
	item_state = "customtoga"
	uncolored = FALSE
	color = "#66023C"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO

///////////////MEDIEVAL//////////////////////////////////////
/obj/item/clothing/under/custom/tunic
	name = "束腰外衣"
	desc = "一件简单的布制束腰外衣, 配有皮革腰带."
	icon_state = "customtunic"
	item_state = "customtunic"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS

/obj/item/clothing/under/custom/haori
	name = "羽织"
	desc = "一件轻便宽松的衣物, 在日本穿着."
	icon_state = "haori_custom"
	item_state = "haori_custom"
	uncolored = TRUE
/obj/item/clothing/suit/storage/jacket/custom/haori_jacket
	name = "羽织外套"
	desc = "一件穿在羽织套装外面的简单外套."
	icon_state = "haori_jacket_custom"
	item_state = "haori_jacket_custom"
	uncolored = TRUE
/obj/item/clothing/under/custom/arabictunic
	name = "阿拉伯束腰外衣"
	desc = "一件轻便的布制束腰外衣, 阿拉伯风格."
	icon_state = "customarabictunic"
	item_state = "customarabictunic"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS

/obj/item/clothing/suit/storage/jacket/custom/poncho
	name = "斗篷"
	desc = "一件简单的布制斗篷."
	icon_state = "customponcho"
	item_state = "customponcho"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	uncolored = TRUE

/obj/item/clothing/under/customren
	name = "文艺复兴套装"
	desc = "一套文艺复兴风格的套装."
	var/uncolored = FALSE
	var/topcolor = 0
	var/undercolor = 0
	item_state = "customren"
	icon_state = "customren"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customren/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Top - Choose a color:", "Top Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input

		if (!undercolor)
			var/input = WWinput(user, "Lining - Choose a color:", "Lining Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				undercolor = input

		if (topcolor && undercolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customren_top")
			top.color = topcolor
			var/image/under = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customren_lining")
			under.color = undercolor
			overlays += top
			overlays += under
			return
	else
		..()

/obj/item/clothing/under/custompontifical
	name = "文艺复兴套装"
	desc = "一套文艺复兴风格的教皇套装."
	var/uncolored = FALSE
	var/topcolor = 0
	var/undercolor = 0
	var/linescolor = 0
	var/handcolor = 0
	item_state = "custom_pontifical"
	icon_state = "custom_pontifical"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/custompontifical/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Top Decore - Choose a color:", "Top Decore Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input

		if (!undercolor)
			var/input = WWinput(user, "Leggings - Choose a color:", "Leggings Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				undercolor = input
		if (!linescolor)
			var/input = WWinput(user, "Top Lines - Choose a color:", "Top Lines Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				linescolor = input
		if (!handcolor)
			var/input = WWinput(user, "Hand Decore - Choose a color:", "Hand Decore Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				handcolor = input

		if (topcolor && undercolor && linescolor && handcolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompont_decore")
			top.color = topcolor
			var/image/under = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompont_leggings")
			under.color = undercolor
			var/image/lines = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompont_mclines")
			lines.color = linescolor
			var/image/hand = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompont_handdecore")
			hand.color = handcolor
			overlays += top
			overlays += under
			overlays += lines
			overlays += hand
			return
	else
		..()
///////////////IMPERIAL//////////////////////////////////////
/obj/item/clothing/under/customdress
	name = "连衣裙"
	desc = "一条女性连衣裙."
	var/uncolored = FALSE
	var/topcolor = 0
	var/undercolor = 0
	var/overcolor = 0
	item_state = "customdress"
	icon_state = "customdress"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customdress/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Top - Choose a color:", "Top Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input

		if (!undercolor)
			var/input = WWinput(user, "Under Bottom - Choose a color:", "Under Bottom Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				undercolor = input
		if (!overcolor)
			var/input = WWinput(user, "Over Bottom - Choose a color:", "Over Bottom Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				overcolor = input
		if (topcolor && undercolor && overcolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customdress_top")
			top.color = topcolor
			var/image/under = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customdress_under")
			under.color = undercolor
			var/image/over = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customdress_over")
			over.color = overcolor
			overlays += top
			overlays += under
			overlays += over
			return
	else
		..()

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
/obj/item/clothing/under/customdress2
	name = "连衣裙"
	desc = "一条女性连衣裙."
	var/uncolored = FALSE
	var/topcolor = 0
	var/undercolor = 0
	item_state = "custombuttonup_full"
	icon_state = "custombuttonup_full"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customdress2/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Top - Choose a color:", "Sleeves/Skirt Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input

		if (!undercolor)
			var/input = WWinput(user, "Under Bottom - Choose a color:", "Vest/Skirt Line Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				undercolor = input
		if (topcolor && undercolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custombuttonup_lines")
			top.color = topcolor
			var/image/under = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custombuttonup_bottom")
			under.color = undercolor
			overlays += top
			overlays += under
			return
	else
		..()

/////////////////COLONIAL COAT////////////////////////////////////
/obj/item/clothing/suit/storage/jacket/customcolonialcoat
	name = "殖民时期大衣"
	desc = "一件十八世纪的殖民时期大衣."
	var/uncolored = FALSE
	var/topcolor = 0
	var/deccolor = 0
	var/linescolor = 0
	item_state = "customcolonialcoat_full"
	icon_state = "customcolonialcoat_full"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/suit/storage/jacket/customcolonialcoat/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Main - Choose a color:", "Main Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input
	//			to_chat(user, "Color: [color]")
		if (!deccolor)
			var/input = WWinput(user, "Decorations - Choose a color:", "Decorations Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				deccolor = input
		if (!linescolor)
			var/input = WWinput(user, "Lines - Choose a color:", "Lines Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				linescolor = input
		if (topcolor && deccolor && linescolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonialcoat_top")
			top.color = topcolor
			var/image/dec = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonialcoat_dec")
			dec.color = deccolor
			var/image/lines = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonialcoat_lines")
			lines.color = linescolor
			overlays += top
			overlays += dec
			overlays += lines
			return
	else
		..()


/obj/item/clothing/suit/storage/jacket/customcolonial
	name = "殖民时期夹克"
	desc = "一件十八世纪的殖民时期夹克."
	var/uncolored = FALSE
	var/jacketcolor = 0
	var/crosscolor = 0
	item_state = "customcolonial_full"
	icon_state = "customcolonial_full"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/suit/storage/jacket/customcolonial/attack_self(mob/user as mob)
	if (uncolored)
		if (!jacketcolor)
			var/input = WWinput(user, "Jacket - Choose a color:", "Jacket Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				jacketcolor = input
	//			to_chat(user, "Color: [color]")
		if (!crosscolor)
			var/input = WWinput(user, "Bandolier - Choose a cross bandolier color:", "Bandolier Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				crosscolor = input
		if (jacketcolor && crosscolor)
			uncolored = FALSE
			var/image/jacket = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonial_jacket")
			jacket.color = jacketcolor
			var/image/cross = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonial_cross")
			cross.color = crosscolor
			var/image/plain = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customcolonial_plain")
			overlays += jacket
			overlays += cross
			overlays += plain
			return
	else
		..()

/////////////////CUSTOM TRIBAL////////////////////////////////////
/obj/item/clothing/under/customtribalrobe
	name = "部落长袍"
	desc = "一件部落长袍."
	var/uncolored = FALSE
	var/shirtcolor = 0
	var/pantscolor = 0
	item_state = "tribalrobe"
	icon_state = "tribalrobe"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customtribalrobe/attack_self(mob/user as mob)
	if (uncolored)
		if (!shirtcolor)
			var/input = WWinput(user, "Robe - Choose a color:", "Robe Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				shirtcolor = input
	//			to_chat(user, "Color: [color]")
		if (!pantscolor)
			var/input = WWinput(user, "Decoration - Choose a color:", "Decoration Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				pantscolor = input

		if (shirtcolor && pantscolor)
			uncolored = FALSE
			var/image/pants = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "tribalrobe_decoration")
			pants.color = pantscolor
			var/image/shirt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "tribalrobe_robe")
			shirt.color = shirtcolor
			var/image/belt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "tribalrobe_robebelt")
			overlays += pants
			overlays += shirt
			overlays += belt
			return
	else
		..()

/////////////////UNIFORMS////////////////////////////////////
/obj/item/clothing/under/customvicuniform
	name = "制服"
	desc = "一套维多利亚时代制服."
	var/uncolored = FALSE
	var/shirtcolor = 0
	var/buttonscolor = 0
	var/beltcolor = 0
	var/bucklecolor = 0
	var/pantscolor = 0
	item_state = "customuni"
	icon_state = "customuni"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customvicuniform/attack_self(mob/user as mob)
	if (uncolored)
		if (!shirtcolor)
			var/input = WWinput(user, "Shirt - Choose a color:", "Shirt Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				shirtcolor = input
	//			to_chat(user, "Color: [color]")
		if (!buttonscolor)
			var/input = WWinput(user, "Buttons - Choose a color:", "Buttons Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				buttonscolor = input
		if (!beltcolor)
			var/input = WWinput(user, "Belt - Choose a color:", "Belt Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				beltcolor = input
		if (!bucklecolor)
			var/input = WWinput(user, "Buckle - Choose a color:", "Buckle Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				bucklecolor = input
		if (!pantscolor)
			var/input = WWinput(user, "Pants - Choose a color:", "Pants Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				pantscolor = input
		if (shirtcolor && buttonscolor && beltcolor && bucklecolor && pantscolor)
			uncolored = FALSE
			var/image/shirt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customuni_shirt")
			shirt.color = shirtcolor
			var/image/buttons = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customuni_buttons")
			buttons.color = buttonscolor
			var/image/belt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customuni_belt")
			belt.color = beltcolor
			var/image/buckle = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customuni_buckle")
			buckle.color = bucklecolor
			var/image/pants = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "customuni_pants")
			pants.color = pantscolor
			overlays += shirt
			overlays += buttons
			overlays += belt
			overlays += buckle
			overlays += pants
			return
	else
		..()


///////////////WW2-MODERN//////////////////////////////////////

/obj/item/clothing/head/custom_off_cap
	name = "军官帽"
	desc = "一顶军官帽."
	var/uncolored1 = FALSE
	var/capcolor = 0
	var/bandcolor = 0
	var/symbolcolor = 0
	item_state = "customcap"
	icon_state = "customcap"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored1 = TRUE


/obj/item/clothing/head/custom_off_cap/attack_self(mob/user as mob)
	if (uncolored1)
		if (!capcolor)
			var/input = WWinput(user, "Cap - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				capcolor = input
	//			to_chat(user, "Color: [color]")
		if (!bandcolor)
			var/input = WWinput(user, "Band - Choose a color:", "Band Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				bandcolor = input
		if (!symbolcolor)
			var/input = WWinput(user, "Symbol - Choose a color:", "Symbol Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				symbolcolor = input
		if (bandcolor && capcolor && symbolcolor)
			uncolored1 = FALSE
			var/image/band = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "customcap_l2")
			band.color = bandcolor
			var/image/cap = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "customcap_l1")
			cap.color = capcolor
			var/image/symbol = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "customcap_l3")
			symbol.color = symbolcolor
			overlays += band
			overlays += cap
			overlays += symbol
			return
	else
		..()

/obj/item/clothing/head/custom/fieldcap
	name = "野战帽"
	desc = "一顶军人常戴的帽子."
	icon_state = "fieldcap_custom"
	item_state = "fieldcap_custom"
	var/capcolor = 0

/obj/item/clothing/head/custom/fieldcap/attack_self(mob/user as mob)
	if (uncolored1)
		if (!capcolor)
			var/input = WWinput(user, "Cap - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				capcolor = input
	//			to_chat(user, "Color: [color]")
		if (capcolor)
			uncolored1 = FALSE
			var/image/cap = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "fieldcap_custom")
			cap.color = capcolor
			overlays += cap
			return
	else
		..()

/////////////////UNIFORMS////////////////////////////////////
/obj/item/clothing/under/customuniform_modern
	name = "迷彩制服"
	desc = "一套现代迷彩制服."
	var/uncolored = FALSE
	var/browncolor = 0
	var/greencolor = 0
	var/blackcolor = 0
	item_state = "modern_camo_custom"
	icon_state = "modern_camo_custom"
	color = "#FFFFFF"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customuniform_modern/attack_self(mob/user as mob)
	if (uncolored)
		if (!browncolor)
			var/input = WWinput(user, "First Camo Color - Choose a color (default is brown):", "First Camo Color" , "#58493d", "color")
			if (input == null || input == "")
				return
			else
				browncolor = input
		if (!greencolor)
			var/input = WWinput(user, "Second Camo Color - Choose a color (default is green):", "Second Camo Color" , "#5b6142", "color")
			if (input == null || input == "")
				return
			else
				greencolor = input
		if (!blackcolor)
			var/input = WWinput(user, "Third Camo Color - Choose a color (default is dark grey):", "First Camo Color" , "#2f323b", "color")
			if (input == null || input == "")
				return
			else
				blackcolor = input
		if (greencolor && browncolor && blackcolor)
			uncolored = FALSE
			var/image/brown = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "modern_camo_custom_l1")
			brown.color = browncolor
			var/image/green = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "modern_camo_custom_l2")
			green.color = greencolor
			var/image/black = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "modern_camo_custom_l3")
			black.color = blackcolor
			var/image/belt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "modern_camo_custom_objs")
			overlays += brown
			overlays += green
			overlays += black
			overlays += belt
			return
	else
		..()

//////////////////CIVILIAN STUFF////////////////////////////
/obj/item/clothing/under/custompyjamas
	name = "睡衣"
	desc = "基本的条纹睡衣."
	icon_state = "custompyjamas"
	item_state = "custompyjamas"
	var/stripescolor = 0
	var/uncolored = TRUE

/obj/item/clothing/under/custompyjamas/attack_self(mob/user as mob)
	if (uncolored)
		if (!stripescolor)
			var/input = WWinput(user, "Stripes - Choose a color:", "Stripes Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				stripescolor = input

		if (stripescolor)
			uncolored = FALSE
			var/image/base = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompyjamas_base")
			var/image/stripes = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custompyjamas_stripes")
			stripes.color = stripescolor
			overlays += base
			overlays += stripes
			return
	else
		..()


/////////////////////HATS////////////////////
/obj/item/clothing/head/custom/customberet
	name = "贝雷帽"
	desc = "一顶简单的布制贝雷帽."
	icon_state = "customberet_hat"
	item_state = "customberet_hat"

/obj/item/clothing/head/custom/custombandana
	name = "头巾"
	desc = "一块简单的布制头巾."
	icon_state = "custombandana_hat"
	item_state = "custombandana_hat"

/obj/item/clothing/head/custom/customnoblehat
	name = "贵族帽"
	desc = "一顶华丽的贵族帽."
	icon_state = "customnoblehat_hat"
	item_state = "customnoblehat_hat"

/obj/item/clothing/head/custom/customhood
	name = "羊毛兜帽"
	desc = "一顶羊毛兜帽."
	icon_state = "wool_hood"
	item_state = "wool_hood"
	cold_protection = HEAD

/obj/item/clothing/head/custom/custom_beanie
	name = "毛线帽"
	desc = "一顶温暖的冬季毛线帽."
	icon_state = "custom_beanie"
	item_state = "custom_beanie"
	cold_protection = HEAD

/obj/item/clothing/head/custom/drill_hat
    name = "训练帽"
    desc = "训练军士的帽子,长官,是的,长官!!"
    icon_state = "drill_hat"
    item_state = "drill_hat"
    heat_protection = HEAD

/obj/item/clothing/head/custom/taqiyah
	name = "塔基亚帽"
	desc = "一种短而圆的小帽,通常用于宗教目的."
	icon_state = "taqiyah"
	item_state = "taqiyah"

/obj/item/clothing/head/custom/hijab
	name = "希贾布"
	desc = "一种包裹头部和胸部的面纱."
	icon_state = "hijab"
	item_state = "hijab"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

/obj/item/clothing/head/custom/kippa
	name = "基帕帽"
	desc = "一种无帽檐的小帽."
	icon_state = "kippa"
	item_state = "kippa"

/obj/item/clothing/head/custom_keffiyeh
	name = "阿拉伯头巾"
	desc = "一种由方格图案围巾制成的头饰."
	icon_state = "keffiyeh_custom"
	item_state = "keffiyeh_custom"
	heat_protection = HEAD
	var/uncolored1 = TRUE
	var/patterncolor = 0

/obj/item/clothing/head/custom_keffiyeh/attack_self(mob/user as mob)
	if (uncolored1)
		if (!patterncolor)
			var/input = WWinput(user, "Pattern - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				patterncolor = input
	//			to_chat(user, "Color: [color]")

		if (patterncolor)
			uncolored1 = FALSE
			var/image/pattern = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "keffiyeh_custom_color")
			pattern.color = patterncolor
			overlays += pattern
			return
	else
		..()

//Helmets

/obj/item/clothing/head/helmet/montefortino
	name = "青铜蒙特福尔蒂诺头盔"
	desc = "一种带有护颊的锥形青铜头盔."
	icon_override = "icons/obj/clothing/head.dmi"
	icon_state = "montefortino"
	item_state = "montefortino"
	body_parts_covered = HEAD
	armor = list(melee = 38, arrow = 25, gun = FALSE, energy = 15, bomb = 30, bio = 20, rad = FALSE)
	health = 30
	var/uncolored1 = TRUE
	var/patterncolor = 0

/obj/item/clothing/head/helmet/montefortino/attack_self(mob/user as mob)
	if (uncolored1)
		if (!patterncolor)
			var/input = WWinput(user, "Pattern - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				patterncolor = input
	//			to_chat(user, "Color: [color]")

		if (patterncolor)
			uncolored1 = FALSE
			var/image/pattern = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "montefortino_color")
			pattern.color = patterncolor
			overlays += pattern
			return
	else
		..()


/obj/item/clothing/head/helmet/roman_decurion/nomads
	name = "罗马十夫长头盔"
	desc = "一种铁制头盔,由十夫长使用.罗马军队骑兵中的军官."
	icon_override = "icons/obj/clothing/head.dmi"
	icon_state = "roman_d"
	item_state = "roman_d"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40
	var/uncolored1 = TRUE
	var/patterncolor = 0

/obj/item/clothing/head/helmet/roman_decurion/nomads/attack_self(mob/user as mob)
	if (uncolored1)
		if (!patterncolor)
			var/input = WWinput(user, "Pattern - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				patterncolor = input
	//			to_chat(user, "Color: [color]")

		if (patterncolor)
			uncolored1 = FALSE
			var/image/pattern = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "roman_d_color")
			pattern.color = patterncolor
			overlays += pattern
			return
	else
		..()

/obj/item/clothing/head/helmet/roman_centurion/nomads
	name = "罗马百夫长头盔"
	desc = "一种铁制头盔,由百夫长使用.罗马军队步兵中的军官."
	icon_override = "icons/obj/clothing/head.dmi"
	icon_state = "roman_c"
	item_state = "roman_c"
	body_parts_covered = HEAD|FACE
	flags_inv = BLOCKHEADHAIR
	armor = list(melee = 50, arrow = 40, gun = 5, energy = 15, bomb = 50, bio = 20, rad = FALSE)
	health = 40
	var/uncolored1 = TRUE
	var/patterncolor = 0

/obj/item/clothing/head/helmet/roman_centurion/nomads/attack_self(mob/user as mob)
	if (uncolored1)
		if (!patterncolor)
			var/input = WWinput(user, "Pattern - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				patterncolor = input
	//			to_chat(user, "Color: [color]")

		if (patterncolor)
			uncolored1 = FALSE
			var/image/pattern = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "roman_c_color")
			pattern.color = patterncolor
			overlays += pattern
			return
	else
		..()

/obj/item/clothing/head/custom_feathered_hat
	name = "羽毛帽"
	desc = "一顶羽毛帽."
	var/uncolored1 = FALSE
	var/capcolor = 0
	var/bandcolor = 0
	item_state = "custfeathercap_hat"
	icon_state = "custfeathercap_hat"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored1 = TRUE


/obj/item/clothing/head/custom_feathered_hat/attack_self(mob/user as mob)
	if (uncolored1)
		if (!capcolor)
			var/input = WWinput(user, "Cap - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				capcolor = input
	//			to_chat(user, "Color: [color]")
		if (!bandcolor)
			var/input = WWinput(user, "Feather - Choose a color:", "Feather Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				bandcolor = input
		if (bandcolor && capcolor)
			uncolored1 = FALSE
			var/image/band = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "custfeathercap_f_hat")
			band.color = bandcolor
			var/image/cap = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "customcap_b_hat")
			cap.color = capcolor
			overlays += band
			overlays += cap
			return
	else
		..()

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/under/crinoline_dress
	name = "克里诺林裙"
	desc = "一条系带连衣裙."
	var/uncolored = FALSE
	var/topcolor = 0
	var/undercolor = 0
	item_state = "crinoline_dress"
	icon_state = "crinoline_dress"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/crinoline_dress/attack_self(mob/user as mob)
	if (uncolored)
		if (!topcolor)
			var/input = WWinput(user, "Top - Choose a color:", "Dress Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				topcolor = input

		if (!undercolor)
			var/input = WWinput(user, "Under Bottom - Choose a color:", "Vest/Skirt Line Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				undercolor = input
		if (topcolor && undercolor)
			uncolored = FALSE
			var/image/top = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "crinoline_dress_dress")
			top.color = topcolor
			var/image/under = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "crinoline_dress_under")
			under.color = undercolor
			var/image/lining = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "crinoline_dress_lining")
			overlays += top
			overlays += under
			overlays += lining
			return
	else
		..()
///////////////////////////////////////////////////////////////////////////////////////
/obj/item/clothing/head/custom_hennin
	name = "汉宁帽"
	desc = "一种由布料制成的头饰,带有漂亮的内衬."
	icon_state = "custom_hennin"
	item_state = "custom_hennin"
	heat_protection = HEAD
	var/uncolored1 = TRUE
	var/patterncolor = 0

/obj/item/clothing/head/custom_hennin/attack_self(mob/user as mob)
	if (uncolored1)
		if (!patterncolor)
			var/input = WWinput(user, "Pattern - Choose a color:", "Cap Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				patterncolor = input
	//			to_chat(user, "Color: [color]")

		if (patterncolor)
			uncolored1 = FALSE
			var/image/pattern = image("icon" = 'icons/obj/clothing/hats.dmi', "icon_state" = "custom_hennin_point")
			pattern.color = patterncolor
			overlays += pattern
			return
	else
		..()

/////////////////CUSTOM GENERIC UNIFORMS////////////////////////////////////
/obj/item/clothing/under/customuniform
	name = "现代服装"
	desc = "一套普通服装."
	var/uncolored = FALSE
	var/shirtcolor = 0
	var/pantscolor = 0
	item_state = "custom_mod_full"
	icon_state = "custom_mod_full"
	var/base_icon = "custom_mod"
	heat_protection = LOWER_TORSO|LEGS|UPPER_TORSO|ARMS
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customuniform/attack_self(mob/user as mob)
	if (uncolored)
		if (!shirtcolor)
			var/input = WWinput(user, "Shirt - Choose a color:", "Shirt Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				shirtcolor = input
	//			to_chat(user, "Color: [color]")
		if (!pantscolor)
			var/input = WWinput(user, "Pants - Choose a color:", "Pants Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				pantscolor = input

		if (shirtcolor && pantscolor)
			uncolored = FALSE
			var/image/pants = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "[base_icon]_pants")
			pants.color = pantscolor
			var/image/shirt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "[base_icon]_shirt")
			shirt.color = shirtcolor
			var/image/belt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "custom_belt")
			overlays += pants
			overlays += shirt
			overlays += belt
			return
	else
		..()

/obj/item/clothing/under/customuniform/facilityg
	name = "设施制服"
	desc = "一套无菌白色制服."
	shirtcolor = "#FFFFFF"
	pantscolor = "#FFFFFF"
	color = "#FFFFFF"

/obj/item/clothing/under/customuniform/baggy
	name = "宽松现代服装"
	item_state = "custom_modbaggy_full"
	icon_state = "custom_modbaggy_full"
	base_icon = "custom_modbaggy"

/obj/item/clothing/under/customuniform/short
	name = "短款现代服装"
	item_state = "custom_modshort_full"
	icon_state = "custom_modshort_full"
	base_icon = "custom_modshort"

/obj/item/clothing/under/customuniform/colonial
	name = "殖民时期服装"
	item_state = "custom_col_full"
	icon_state = "custom_col_full"
	base_icon = "custom_col"

/obj/item/clothing/under/customuniform/colonial/short
	name = "短款殖民时期服装"
	item_state = "custom_col_short_full"
	icon_state = "custom_col_short_full"
	base_icon = "custom_col_short"

/obj/item/clothing/suit/storage/jacket/custom/hoodie
	name = "连帽衫"
	desc = "一件简单舒适的布质连帽衫."
	icon_state = "customhoodie"
	item_state = "customhoodie"
	uncolored = TRUE

/obj/item/clothing/suit/storage/jacket/custom/cloth_jacket
	name = "布夹克"
	desc = "一件简单的布夹克."
	icon_state = "customjacket"
	item_state = "customjacket"
	uncolored = TRUE

/obj/item/clothing/suit/storage/jacket/custom/blazer
	name = "西装外套"
	desc = "一件简单的布质西装外套."
	icon_state = "customblazer"
	item_state = "customblazer"
	uncolored = TRUE

////////////Track suit////////////////

/obj/item/clothing/under/customtrackpants
	name = "运动裤"
	desc = "一件衬衫搭配运动裤."
	var/uncolored = FALSE
	var/pantscolor = 0
	var/sidescolor = 0
	var/shirtcolor = 0
	item_state = "trackpants_custom"
	icon_state = "trackpants_custom"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/under/customtrackpants/attack_self(mob/user as mob)
	if (uncolored)
		if (!pantscolor)
			var/input = WWinput(user, "Pants - Choose a base color:", "Pants Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				pantscolor = input
		if (!sidescolor)
			var/input = WWinput(user, "Pants Stripes - Choose a color:", "Pants Stripes Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				sidescolor = input
		if (!shirtcolor)
			var/input = WWinput(user, "Shirt - Choose a color:", "Shirt Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				shirtcolor = input
		if (pantscolor && sidescolor && shirtcolor)
			uncolored = FALSE
			var/image/pants = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "trackpants_custom_pants")
			pants.color = pantscolor
			var/image/sides = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "trackpants_custom_sides")
			sides.color = sidescolor
			var/image/shirt = image("icon" = 'icons/obj/clothing/uniforms.dmi', "icon_state" = "trackpants_custom_shirt")
			shirt.color = shirtcolor
			overlays += pants
			overlays += sides
			overlays += shirt
			return
	else
		..()

/obj/item/clothing/suit/storage/jacket/customtracksuit
	name = "运动套装"
	desc = "一套运动型运动套装."
	var/uncolored = FALSE
	var/basecolor = 0
	var/linescolor = 0
	item_state = "customtracksuit"
	icon_state = "customtracksuit"
	color = "#FFFFFF"
	New()
		..()
		spawn(5)
			uncolored = TRUE


/obj/item/clothing/suit/storage/jacket/customtracksuit/attack_self(mob/user as mob)
	if (uncolored)
		if (!basecolor)
			var/input = WWinput(user, "Jacket - Choose a base color:", "Jacket Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				basecolor = input
		if (!linescolor)
			var/input = WWinput(user, "Jacket Lines - Choose a color:", "Jacket Lines Color" , "#FFFFFF", "color")
			if (input == null || input == "")
				return
			else
				linescolor = input
		if (basecolor && linescolor)
			uncolored = FALSE
			var/image/base = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customtracksuit_base")
			base.color = basecolor
			var/image/lines = image("icon" = 'icons/obj/clothing/suits.dmi', "icon_state" = "customtracksuit_lines")
			lines.color = linescolor
			overlays += base
			overlays += lines
			return
	else
		..()