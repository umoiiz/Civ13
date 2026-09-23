/datum/currency_list //A list of all the custom fiat currencies in the world, structured as a list of lists.
	var/list/list/currency_list = list()

/* an example of what the list looks like
/datum/currency_list
	var/list/currency_list = list(
		"civ13d" = list("Civ13 Dollar", "Civ13 Dollar", "The official currency of Civilization 13", "5dollar", 1, 0),
		"dciv13" = list("Dollar Civ13", "Dollar Civ13", "The unofficial currency of 13 Civilizations", "ruble_alt", 0, 0)
	)
*/

var/global/datum/currency_list/fiat = new()

/obj/item/stack/money/fiat
	name = "法定货币"
	desc = "法定货币."
	singular_name = "money"
	amount = 1
	max_amount = 1000000
	value = 0
	var/fiat_id
	flags = CONDUCT

/** Constructor for fiat currency stacks. Initializes name, description, and icon_state based on the global fiat registry. */
/obj/item/stack/money/fiat/New(loc, _amount, _fiat_id)
	..()
	if(_fiat_id)
		fiat_id = _fiat_id
	if (_amount)
		amount = _amount
	if(fiat_id && (fiat_id in fiat.currency_list))
		name = fiat.currency_list[fiat_id][1]
		singular_name = fiat.currency_list[fiat_id][2]
		desc = "[fiat.currency_list[fiat_id][3]]. The ID number of this currency is [fiat_id]."
		icon_state = fiat.currency_list[fiat_id][4]
		if (fiat.currency_list[fiat_id].len >= 6)
			value = fiat.currency_list[fiat_id][6]
	else
		name = "This is broken, contact an admin."
		singular_name = "This is broken, contact an admin."
		desc = "This is broken, contact an admin."
		message_admins("Fiat currency was created without a valid fiat_id var!")

/** Handles merging this fiat stack with another stack of the same currency type. */
/obj/item/stack/money/fiat/attackby(obj/item/stack/money/fiat/W as obj, mob/user as mob)
	if (istype(W, type) && W.fiat_id == src.fiat_id)
		var/obj/item/stack/S = W
		merge(S)
		S.update_icon()
		S.update_strings()
		src.update_icon()
		src.update_strings()
		spawn(0) //give the stacks a chance to delete themselves if necessary
			if (S && usr.using_object == S)
				S.interact(usr)
			if (src && usr.using_object == src)
				interact(usr)
	else
		return

/** Creates a new stack with a specified amount, subtracting it from the current stack's total. */
/obj/item/stack/money/fiat/split(var/_amount)
	if (!amount)
		return null
	if (_amount)
		_amount = min(_amount, amount)
		if (_amount <= 0)
			return FALSE
		var/obj/item/stack/money/fiat/S = new(null, _amount, src.fiat_id)
		S.color = color
		if (prob(_amount/amount * 100))
			transfer_fingerprints_to(S)
			if (blood_DNA)
				S.blood_DNA |= blood_DNA
		amount -= _amount
		if (amount <= 0)
			qdel(src)
		return S
	else
		return FALSE

/obj/structure/money_printer
	name = "印钞机"
	desc = "这能印钱.它当前含有0布料."
	icon = 'icons/obj/structures.dmi'
	icon_state = "printingpress0"
	anchored = TRUE
	density = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/fiat_id
	var/cloth = 0
	var/real_money_inside = 0
	var/exchange_rate = 1

/** Prompts the user for an amount to print and converts stored cloth into new fiat currency banknotes. */
/obj/structure/money_printer/proc/print_money(user)
	var/nm
	var/num = input(user, "How much money do you want to print?","Printing", nm) as num
	num = round(num)
	if (num <= 0)
		return
	else
		var/cloth_remaining = (cloth - num*0.01)
		if (fiat_id && (fiat_id in fiat.currency_list) && cloth_remaining >= 0)
			cloth = cloth_remaining
			desc = "This prints money. It currently contains [cloth] cloth."
			new/obj/item/stack/money/fiat(loc, num, fiat_id)
			playsound(loc, 'sound/machines/vending_drop.ogg', 100, TRUE)
			return
		else if (cloth_remaining < 0)
			to_chat(user, "机器中没有足够的布料来生产那么多货币!你当前最多可以生产[cloth*100]")
			return
		else
			to_chat(user, "该货币不存在或印钞机未配置.")
			return

/** Spawns physical currency (gold, silver, or dollars/rubles) equivalent to the provided value based on map and era. */
/obj/structure/money_printer/proc/dispense_real_money(dispense_value)
	if (dispense_value <= 0)
		return
	if (map.ID == MAP_THE_ART_OF_THE_DEAL || map.ID == MAP_KANDAHAR)
		var/obj/item/stack/money/dollar/D = new/obj/item/stack/money/dollar(loc)
		D.amount = round(dispense_value/D.value)
		if (D.amount <= 0)
			qdel(D)
	else if (map.ID == MAP_GULAG13 || map.ID == MAP_PEPELSIBIRSK)
		var/obj/item/stack/money/rubles/D = new/obj/item/stack/money/rubles(loc)
		D.amount = round(dispense_value/D.value)
		if (D.amount <= 0)
			qdel(D)
	else
		if (dispense_value <= 3)
			var/obj/item/stack/money/coppercoin/NM = new/obj/item/stack/money/coppercoin(loc)
			NM.amount = round(dispense_value/NM.value)
			if (NM.amount <= 0)
				qdel(NM)
		else if (dispense_value <= 40)
			var/obj/item/stack/money/silvercoin/NM = new/obj/item/stack/money/silvercoin(loc)
			NM.amount = round(dispense_value/NM.value)
			if (NM.amount <= 0)
				qdel(NM)
		else
			var/obj/item/stack/money/goldcoin/NM = new/obj/item/stack/money/goldcoin(loc)
			NM.amount = round(dispense_value/NM.value)
			if (NM.amount <= 0)
				qdel(NM)

/** Renders the management menu for money printers, allowing for printing, withdrawals, and rate adjustment. */
/obj/structure/money_printer/proc/display_ui(user)
	var/list/choices = list("Cancel", "Print money", "Change Exchange Rate")
	if (real_money_inside > 0)
		choices += "Withdraw real money"
	var/choice = WWinput(user, "Pick an option", "Money Printer", "Cancel", choices)
	if (choice == "Cancel")
		return
	else if (choice == "Print money")
		print_money(user)
		return
	else if (choice == "Withdraw real money")
		if (real_money_inside > 0)
			dispense_real_money(real_money_inside)
			real_money_inside = 0
			to_chat(user, "你取出了支撑这台印钞机的真钱.")
		return
	else if (choice == "Change Exchange Rate")
		var/new_rate = input(user, "What should the exchange rate be? This determines how much real money value (e.g. silver coins) is dispensed per 1 banknote inserted into this printer.", "Exchange Rate", exchange_rate) as num
		if (new_rate >= 0)
			exchange_rate = new_rate
			to_chat(user, "汇率现在设定为[exchange_rate].")
		return

/** Configures a new currency for an uninitialized printer or opens the management menu for configured ones. */
/obj/structure/money_printer/attack_hand(var/mob/living/human/user as mob)
	if(fiat_id)
		display_ui(user)
	else
		var/cd
		var/currency_code = sanitize(input(user, "Input the ID for your currency. You can use any text.","Currency Creation", cd) as text)
		if (!currency_code || currency_code == "")
			return
		var/currency_exists = 0
		var/currency_revival = 0
		for(var/codes in fiat.currency_list)
			if(codes == currency_code)
				if (fiat.currency_list[codes][5] == 1)
					to_chat(user, "该货币已存在.")
					currency_exists = 1
					break
				else
					currency_revival = 1
					break

		if(currency_exists == 0)
			fiat_id = currency_code
			if (currency_revival == 1)
				fiat.currency_list[fiat_id][5] = 1
				name = "[fiat.currency_list[fiat_id][1]] printer"
				to_chat(user, "你为[fiat.currency_list[fiat_id][1]]重建了印钞机.")
				return
			else
				var/list/currency_icons = list(
					list("Spanish Real", "dollar"),
					list("Spanish Dollar", "5dollar"),
					list("Escudo", "20dollar"),
					list("Doubloon", "50dollar"),
					list("Soviet Ruble", "ruble"),
					list("Ruble (alt)", "ruble_alt"),
				)

				var/currencyname
				var/currency_name = sanitize(input(user, "Please provide the name of your currency.","Currency Creation", currencyname) as text)

				var/currencysingular
				var/currency_singular = sanitize(input(user, "Please provide the singular form of your currency's name (e.g. 'dollar', 'pound', 'peso', or 'ruble').","Currency Creation", currencysingular) as text)

				var/currencydesc
				var/currency_desc = sanitize(input(user, "Please provide your currency's description (without a period at the end).","Currency Creation", currencydesc) as text)

				var/list/display = list()
				for (var/list/i in currency_icons)
					display += "[i[1]]"
				var/currency_icon = WWinput(user, "What should our currency look like?", "Currency Creation", "U.S. Dollar", display)
				for(var/list/i2 in currency_icons)
					if (i2[1]== currency_icon)
						currency_icon = i2

				var/list/currency_to_add = list(currency_name, currency_singular, currency_desc, currency_icon[2], 1, 0)
				fiat.currency_list[fiat_id] = currency_to_add
				name = "[fiat.currency_list[fiat_id][1]] printer"
				return
		return

/** Handles inserting cloth for printing, fiat for exchange, or real money (gold/silver) to serve as reserves. */
/obj/structure/money_printer/attackby(var/obj/item/stack/I as obj, var/mob/living/human/user as mob)
	if (I.amount && istype(I, /obj/item/stack/material/cloth))
		cloth += I.amount
		playsound(user, 'sound/machines/button.ogg', 100, TRUE)
		to_chat(user, "你将[I.amount]布料插入机器.它现在含有[cloth]布料.")
		qdel(I)
		desc = "This prints money. It currently contains [cloth] cloth."
		return
	else if (I.amount && istype(I, /obj/item/stack/money/fiat))
		var/obj/item/stack/money/fiat/F = I
		if (F.fiat_id == fiat_id)
			if (exchange_rate <= 0)
				to_chat(user, "这台印钞机的汇率当前设定为0.它不会将法定货币兑换为真钱.")
				return
			var/fiat_value = F.amount * exchange_rate
			if (real_money_inside >= fiat_value)
				real_money_inside -= fiat_value
				dispense_real_money(fiat_value)
				to_chat(user, "你插入法定货币并收到其真钱支撑.")
				qdel(F)
				return
			else
				to_chat(user, "储备不足,无法接受兑换.印钞机需要[fiat_value]真钱价值来支撑,但只有[real_money_inside].")
				return
		else
			to_chat(user, "这台印钞机不接受这种类型的法定货币.")
			return
	else if (I.amount && istype(I, /obj/item/stack/money))
		var/obj/item/stack/money/M = I
		real_money_inside += M.amount * M.value
		to_chat(user, "你插入真钱来支撑法定货币.印钞机现在持有[real_money_inside]真钱价值.")
		qdel(M)
		return
	else
		to_chat(user, "纸币是由布料制成的,不是[I.name].")
		return

/obj/structure/money_printer/Destroy()
	if(fiat_id)
		if (fiat_id in fiat.currency_list)
			fiat.currency_list[fiat_id][5] = 0
	return ..()