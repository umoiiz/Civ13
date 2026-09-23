// Odis' Beamblade collection

/obj/item/weapon/material/sword/magic/onoff
	name = "白色光束刃"
	icon_state = "beamblade_off"
	item_state = "beamblade_off"
	base_icon = "beamblade_off"
	cooldownw = DEFAULT_QUICK_COOLDOWN
	desc = "由一种奇异力量约束的纯光构成的刀刃."
	atk_mode = BASH
	force_divisor = 0.10
	thrown_force_divisor = 0.10
	sharpness = 0
	block_chance = 25

	var/overlay = 'icons/obj/magic_overlay.dmi'
	var/overlay_icon = 'icons/obj/magic_overlay.dmi'
	var/old_force_divisor = 0.10
	var/old_thrown_force_divisor = 0.10
	var/old_sharpness = 0
	var/old_block_chance = 25

	var/new_force_divisor = 10
	var/new_thrown_force_divisor = 0.25 // 10 when thrown with weight 20 (steel)
	var/new_block_chance = 95
	var/new_sharpness = 100

	var/hitsound_off = 'sound/weapons/punch1.ogg' //default
	var/drawsound_off = 'sound/weapons/punch1.ogg' //temp

	var/hitsound_on = 'sound/weapons/magic/LS_Hit_1.ogg'
	var/drawsound_on = 'sound/weapons/magic/LS_On.ogg'

	var/onsound = 'sound/weapons/magic/LS_On.ogg'
	var/offsound = 'sound/weapons/magic/LS_Off.ogg'

	var/state = "OFF"
	var/on_state = "beamblade"
	var/on_state_item = "beamblade"
	var/off_state = "beamblade_off"
	var/off_state_item = ""
	light_color = "#FFFFFF"

/obj/item/weapon/material/sword/magic/onoff/attack_self()
	if(state == "OFF")
		icon_state = on_state
		item_state = on_state_item
		force_divisor = new_force_divisor
		thrown_force_divisor = new_thrown_force_divisor
		sharpness = new_sharpness
		block_chance = new_block_chance
		playsound(loc, onsound, 100, TRUE)
		hitsound = hitsound_on
		drawsound = drawsound_on
		state = "ON"
		sharp = TRUE
		edge = TRUE
		atk_mode = SLASH
		set_light(2, 0.25, light_color)
		update_force()
		update_icon()
	else
		icon_state = off_state
		item_state = off_state_item
		force_divisor = old_force_divisor
		thrown_force_divisor = old_thrown_force_divisor
		sharpness = old_sharpness
		block_chance = old_block_chance
		playsound(loc, offsound, 100, TRUE)
		hitsound = hitsound_off
		drawsound = drawsound_off
		state = "OFF"
		sharp = FALSE
		edge = FALSE
		atk_mode = BASH
		set_light(0)
		update_force()
		update_icon()
	..()

/obj/item/weapon/material/sword/magic/onoff/blue
	name = "蓝色光束刃"
	desc = "由一种奇异力量约束的蓝光构成的刀刃."
	light_color = "#0000FF"
	on_state = "bluebeamblade"
	on_state_item = "bluebeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/red
	name = "红色光束刃"
	desc = "由一种奇异力量约束的红光构成的刀刃."
	light_color = "#FF0000"
	on_state = "redbeamblade"
	on_state_item = "redbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/green
	name = "绿色光束刃"
	desc = "由一种奇异力量约束的绿光构成的刀刃."
	light_color = "#00FF00"
	on_state = "greenbeamblade"
	on_state_item = "greenbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/lightgreen
	name = "浅绿色光束刃"
	desc = "由一种奇异力量约束的浅绿光构成的刀刃."
	light_color = "#90EE90"
	on_state = "lightgreenbeamblade"
	on_state_item = "lightgreenbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/darkgreen
	name = "深绿色光束刃"
	desc = "由一种奇异力量约束的深绿光构成的刀刃."
	light_color = "#013220"
	on_state = "darkgreenbeamblade"
	on_state_item = "darkgreenbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/purple
	name = "紫色光束刃"
	desc = "由一种奇异力量约束的紫光构成的刀刃."
	light_color = "#800080"
	on_state = "purplebeamblade"
	on_state_item = "purplebeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/teal
	name = "青绿色光束刃"
	desc = "由一种奇异力量约束的青绿光构成的刀刃."
	light_color = "#008080"
	on_state = "tealbeamblade"
	on_state_item = "tealbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/cyan
	name = "青色光束刃"
	desc = "由一种奇异力量约束的青光构成的刀刃."
	light_color = "#00FFFF"
	on_state = "cyanbeamblade"
	on_state_item = "cyanbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/magenta
	name = "品红色光束刃"
	desc = "由一种奇异力量约束的品红光构成的刀刃."
	light_color = "#FF00FF"
	on_state = "magentabeamblade"
	on_state_item = "magentabeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/redpink
	name = "淡粉光束刃"
	desc = "由一种奇异力量束缚的淡粉色光束构成的刀刃."
	light_color = "#ffc0cb"
	on_state = "redpinkbeamblade"
	on_state_item = "redpinkbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/yellow
	name = "黄色光束刃"
	desc = "由一种奇异力量束缚的黄色光束构成的刀刃."
	light_color = "#FFFF00"
	on_state = "yellowbeamblade"
	on_state_item = "yellowbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/gold
	name = "金色光束刃"
	desc = "由一种奇异力量束缚的金色光束构成的刀刃."
	light_color = "#FFD700"
	on_state = "goldbeamblade"
	on_state_item = "goldbeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/orange
	name = "橙色光束刃"
	desc = "由一种奇异力量束缚的橙色光束构成的刀刃."
	light_color = "#FFA500"
	on_state = "orangebeamblade"
	on_state_item = "orangebeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/darkorange
	name = "深橙色光束刃"
	desc = "由一种奇异力量束缚的深橙色光束构成的刀刃."
	light_color = "#ff8c00"
	on_state = "darkorangebeamblade"
	on_state_item = "darkorangebeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100

/obj/item/weapon/material/sword/magic/onoff/bronze
	name = "青铜光束刃"
	desc = "由一种奇异力量束缚的青铜色光束构成的刀刃."
	light_color = "#CD7F32"
	on_state = "bronzebeamblade"
	on_state_item = "bronzebeamblade"
	new_force_divisor = 10
	new_thrown_force_divisor = 0.25
	new_block_chance = 95
	new_sharpness = 100