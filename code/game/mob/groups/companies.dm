////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Companies////////////////////////////////
////////////////////////////////////////////////////////////////////////////

/mob/living/human/proc/create_company()
	set name = "Create Company"
	set category = "Faction"
	var/mob/living/human/U

	if (istype(src, /mob/living/human))
		U = src
	else
		return
	if (map.civilizations == TRUE || map.ID == MAP_TRIBES || map.ID == MAP_THREE_TRIBES || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_COLONY || map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CMP)
		var/choosename = input(U, "Choose a name for the company:") as text|null
		create_company_pr(choosename)
		return
	else
		to_chat(U, "<span class='danger'>你无法在此地图上创建公司.</span>")
		return

/mob/living/human/proc/create_company_pr(var/newname = "none")
	if (!ishuman(src))
		return
	var/mob/living/human/H = src
	for(var/i = 1, i <= map.custom_company_nr.len, i++)
		if (map.custom_company_nr[i] == newname || newname == "Global")
			to_chat(usr, SPAN_DANGER("That company already exists. Choose another name."))
			return
	if (newname != null && newname != "none")
		var/choosecolor1 = "#000000"
		var/choosecolor2 = "#FFFFFF"
		choosecolor1 = WWinput(H, "Choose the main/symbol color:", "Main Color" , "#000000", "color")
		if (choosecolor1 == null || choosecolor1 == "")
			return

		choosecolor2 = WWinput(H, "Choose the secondary/background color:", "Secondary Color" , "#FFFFFF", "color")
		if (choosecolor2 == null || choosecolor2 == "")
			return

		map.custom_company_nr += newname
		var/list/newnamev = list("[newname]" = list(list(H,100,0)))
		map.custom_company += newnamev
		map.custom_company_colors += list("[newname]" = list(choosecolor1,choosecolor2))
		to_chat(usr, "<big>你现在拥有新公司 [newname] 的 <b>100%</b> 股份.</big>")
		return
	else
		return

/mob/living/human/proc/transfer_company_stock()
	set name = "Transfer Company Stock"
	set category = "Faction"
	var/mob/living/human/H
	if (istype(src, /mob/living/human))
		H = src
	else
		return
	if (map.civilizations == TRUE || map.ID == MAP_TRIBES || map.ID == MAP_THREE_TRIBES || map.ID == MAP_FOUR_KINGDOMS || map.ID == MAP_COLONY || map.ID == MAP_NATIONSRP || map.ID == MAP_NATIONSRP_TRIPLE || map.ID == MAP_NATIONSRPMED || map.ID == MAP_NATIONSRP_WW2 || map.ID == MAP_NATIONSRP_COLDWAR || map.ID == MAP_NATIONSRP_COLDWAR_CMP)
		var/found = FALSE
		var/list/currlist = list()
		var/list/currlist_ind = list("Cancel")
		for (var/cname in map.custom_company_nr)
			for (var/i = 1, i <= map.custom_company[cname].len, i++)
				if (map.custom_company[cname][i][1] == H)
					currlist += list("[cname]" = list(map.custom_company[cname][i][2]))
					currlist_ind += cname
					found = TRUE
		if (!found)
			to_chat(usr, "你不拥有任何股份.")
			return
		else
			var/compchoice = WWinput(H, "Which company to transfer stock ownership?", "Stock Transfer", "Cancel", currlist_ind)
			if (compchoice == "Cancel")
				return
			else
				var/compchoice_amt = input(H, "You own [currlist[compchoice][1]]% of [compchoice]. How much do you want to transfer? (1 to [currlist[compchoice][1]])") as num|null
				compchoice_amt = round(compchoice_amt)
				if (compchoice_amt > currlist[compchoice][1])
					compchoice_amt = currlist[compchoice][1]
				else if (compchoice_amt <= 0)
					return
				var/list/closemobs = list("Cancel")
				for (var/mob/living/human/M in range(4,loc))
					if (M.stat != DEAD)
						closemobs += M
				var/choice2 = WWinput(usr, "Who to transfer the stocks to?", "Stock Transfer", "Cancel", closemobs)
				if (choice2 == "Cancel")
					return
				else
					var/mob/living/human/CM = choice2
					for(var/l=1, l <= map.custom_company[compchoice].len, l++)
						if (map.custom_company[compchoice][l][1] == H)
							var/currb = map.custom_company[compchoice][l][2]
							map.custom_company[compchoice][l][2] = currb-compchoice_amt

					for(var/l=1,  l <= map.custom_company[compchoice].len, l++)
						if (map.custom_company[compchoice][l][1] == CM)
							var/currb = map.custom_company[compchoice][l][2]
							map.custom_company[compchoice][l][2] = currb+compchoice_amt
							return
					map.custom_company[compchoice] += list(list(CM,compchoice_amt,0))
					to_chat(H, "<big>已将 [compchoice] 的 [compchoice_amt]% 转让给 [CM].</big>")
					to_chat(CM, "<big>你已从 [H] 收到 [compchoice] 的 [compchoice_amt]%.</big>")
					return
	else
		to_chat(usr, SPAN_DANGER("You cannot transfer company ownership on this map."))
		return

//searches company members for a player
/proc/find_company_member(var/mob/living/human/H, var/company)
	if (!map || !H || !company)
		return FALSE

	if (company == "Global")
		return FALSE

	var/list/company_list = map.custom_company[company]
	if (!istype(company_list) || !company_list.len)
		return FALSE

	for(var/i=1,i<=company_list.len,i++)
		var/list/member_data = company_list[i]
		if (member_data[1] == H && member_data[2] > 0)
			return TRUE

	return FALSE

//for automated transfers e.g. stock market
/mob/living/human/proc/transfer_stock_proc(var/companyname, var/stock, var/mob/living/human/target)
	if (!companyname || !stock || !target)
		return

	for(var/l=1, l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == src)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb-stock

	for(var/l=1,  l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == target)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb+stock
			return
	map.custom_company[companyname] += list(list(target,stock,0))
	to_chat(src, "<big>已将 [companyname] 的 [stock]% 转让给 [target].</big>")
	to_chat(target, "<big>你已从 [src] 收到 [companyname] 的 [stock]%.</big>")
	return

//to be used when the seller does not exist (normally if he died and theres no body)
//the stock is still for sale but "nobody" will receive the cost.
/proc/transfer_stock_nomob(var/companyname, var/stock, var/mob/living/human/target)
	if (!companyname || !stock || !target)
		return

	for(var/l=1, l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == null)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb-stock

	for(var/l=1,  l <= map.custom_company[companyname].len, l++)
		if (map.custom_company[companyname][l][1] == target)
			var/currb = map.custom_company[companyname][l][2]
			map.custom_company[companyname][l][2] = currb+stock
			return
	map.custom_company[companyname] += list(list(target,stock,0))
	to_chat(target, "<big>你已从股票市场收到 [companyname] 的 [stock]%.</big>")
	return