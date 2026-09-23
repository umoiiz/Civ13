/obj/item/weapon/cell
	name = "电池"
	desc = "一块可充电的电化学电池."
	icon = 'icons/obj/machines/power.dmi'
	icon_state = "cell"
	item_state = "cell"
	force = 5.0
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/charge // Current charge
	var/maxcharge = 1000 // Capacity in Wh
	var/overlay_state

/obj/item/weapon/cell/New()
	if(isnull(charge))
		charge = maxcharge
	..()

/obj/item/weapon/cell/initialize()
	. = ..()
	update_icon()

/obj/item/weapon/cell/drain_power(var/drain_check, var/surge, var/power = 0)

	if(drain_check)
		return 1

	if(charge <= 0)
		return 0

	var/cell_amt = power * (1/(3600/2))

	return use(cell_amt) / (1/(3600/2))

/obj/item/weapon/cell/update_icon()

	var/new_overlay_state = null
	if(percent() >= 95)
		new_overlay_state = "cell-o2"
	else if(charge >= 0.05)
		new_overlay_state = "cell-o1"

	if(new_overlay_state != overlay_state)
		overlay_state = new_overlay_state
		overlays.Cut()
		if(overlay_state)
			overlays += image('icons/obj/machines/power.dmi', overlay_state)

/obj/item/weapon/cell/proc/percent() // return % charge of cell
	return maxcharge && (100.0*charge/maxcharge)

/obj/item/weapon/cell/proc/fully_charged()
	return (charge == maxcharge)

// checks if the power cell is able to provide the specified amount of charge
/obj/item/weapon/cell/proc/check_charge(var/amount)
	return (charge >= amount)

// use power from a cell, returns the amount actually used
/obj/item/weapon/cell/proc/use(var/amount)
	var/used = min(charge, amount)
	charge -= used
	update_icon()
	return used

// Checks if the specified amount can be provided. If it can, it removes the amount
// from the cell and returns 1. Otherwise does nothing and returns 0.
/obj/item/weapon/cell/proc/checked_use(var/amount)
	if(!check_charge(amount))
		return 0
	use(amount)
	return 1

/obj/item/weapon/cell/proc/give(var/amount)
	if(maxcharge < amount)	return 0
	var/amount_used = min(maxcharge-charge,amount)
	charge += amount_used
	update_icon()
	return amount_used

/obj/item/weapon/cell/examine(mob/user)
	. = ..()
	to_chat(user, "标签上标明其容量为 [maxcharge] 瓦时")
	to_chat(user, "电量计显示 [round(src.percent(), 0.1)]%")

/obj/item/weapon/cell/standard
	name = "标准电池"
	desc = "一块标准且相对便宜的电池,十分常用."
	maxcharge = 300

/obj/item/weapon/cell/standard/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/high
	name = "高容量电池"
	desc = "一块具有扩展储能、可长时间使用的电池."
	icon_state = "hcell"
	maxcharge = 600

/obj/item/weapon/cell/high/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/super
	name = "超大容量电池"
	desc = "一块具有卓越容量、可提供持久可靠电力的电池."
	icon_state = "scell"
	maxcharge = 1200

/obj/item/weapon/cell/super/empty/New()
	..()
	charge = 0

/obj/item/weapon/cell/hyper
	name = "超能容量电池"
	desc = "终极电池,为最苛刻的任务提供无与伦比的能量储备."
	icon_state = "scell"
	maxcharge = 3000

/obj/item/weapon/cell/hyper/empty/New()
	..()
	charge = 0


// Cell charger

/obj/machinery/cell_charger
	name = "heavy-duty cell charger"
	desc = "一种比标准充电器强大得多的版本,专为电池充电而设计."
	icon = 'icons/obj/machines/power.dmi'
	icon_state = "ccharger0"
	anchored = TRUE
	density = FALSE
	var/obj/item/weapon/cell/charging = null
	var/chargelevel = -1
	var/charge_rate = 20 //This is the power drawn when charging, given in Watts (may need to be adjusted)

/obj/machinery/cell_charger/New()
	..()
	processing_objects += src

/obj/machinery/cell_charger/Del()
	processing_objects -= src
	..()

/obj/machinery/cell_charger/update_icon()
	icon_state = "ccharger[charging ? 1 : 0]"

	if(charging)
		var/newlevel = 	round(charging.percent() * 4.0 / 99)
		if(chargelevel != newlevel)

			overlays.Cut()
			overlays += "ccharger-o[newlevel]"

			chargelevel = newlevel
	else
		overlays.Cut()

/obj/machinery/cell_charger/examine(mob/user)
	if(!..(user, 5))
		return

	to_chat(user, "充电器中有 [charging ? "a" : "no"] 块电池.")
	if(charging)
		to_chat(user, "当前电量: [charging.charge]")

/obj/machinery/cell_charger/attackby(obj/item/weapon/W, mob/user)
	if(istype(W, /obj/item/weapon/cell) && anchored)
		if(charging)
			to_chat(user, "<span class='warning'>充电器中已经有一块电池了.</span>")
			return
		else
			/*var/area/a = loc.loc // Gets our locations location, like a dream within a dream
			if(!isarea(a))
				return
			if(a.power_equip == 0) // There's no APC in this area, don't try to cheat power!
				to_chat(user, "<span class='warning'>The [name] blinks red as you try to insert the cell!</span>")
				return*/

			user.drop_item()
			W.loc = src
			charging = W
			user.visible_message("[user] 将一块电池插入充电器.", "你将一块电池插入充电器.")
			chargelevel = -1
		update_icon()
	else if(istype(W, /obj/item/weapon/wrench))
		if(charging)
			to_chat(user, "<span class='warning'>请先取出电池!</span>")
			return

		anchored = !anchored
		to_chat(user, "你[anchored ? "attach" : "detach"]将电池充电器[anchored ? "to" : "from"]地面.")
		playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)

/obj/machinery/cell_charger/attack_hand(mob/user)
	if(charging)
		user.put_in_hands(charging)
		charging.add_fingerprint(user)
		charging.update_icon()

		src.charging = null
		user.visible_message("[user] 从充电器中取出了电池.", "你从充电器中取出了电池.")
		chargelevel = -1
		update_icon()

/obj/machinery/cell_charger/process()
	if(!anchored)
		return

	if (charging && !charging.fully_charged())
		charging.give(charge_rate)
		update_icon()