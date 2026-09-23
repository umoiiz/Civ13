/obj/structure/voting
	name = "投票箱"
	desc = "一个用于存储选举投票的箱子."
	icon = 'icons/obj/storage.dmi'
	icon_state = "bet_box"
	flammable = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

	var/nation = "none"

	var/list/votes = list()
	var/list/voted = list()
	var/in_election = FALSE
	var/election_desc = ""
	var/list/vote_options = list()
	var/total_votes = 0

	// Voyage Defines.
	var/special_election = FALSE
	var/found_captain = FALSE
	var/found_boatswain = FALSE
	var/found_quartermaster = FALSE
	var/mob/living/human/person = null
	var/person_role = ""

//
// Ballots; a (red) /// b (green) /// c (blue)
//

// ballot a
/obj/structure/voting/civa
	name = "投票箱"
	icon_state = "bet_box_red"
	New()
		..()
		spawn(10)
			nation = civname_a
			name = "[nation]投票箱"

	attack_hand(var/mob/living/human/user as mob)
		if (user.original_job_title == "Civilization A Citizen")
			..()
		else
			to_chat(user, SPAN_WARNING("You are not a part of this civilization to vote here."))
			return

// ballot b
/obj/structure/voting/civb
	name = "投票箱"
	icon_state = "bet_box_green"
	New()
		..()
		spawn(10)
			nation = civname_b
			name = "[nation]投票箱"

	attack_hand(var/mob/living/human/user as mob)
		if (user.original_job_title == "Civilization B Citizen")
			..()
		else
			to_chat(user, SPAN_WARNING("You are not a part of this civilization to vote here."))
			return

// ballot c
/obj/structure/voting/civc
	name = "投票箱"
	icon_state = "bet_box_blue"
	New()
		..()
		spawn(10)
			nation = civname_c
			name = "[nation]投票箱"

	attack_hand(var/mob/living/human/user as mob)
		if (user.original_job_title == "Civilization C Citizen")
			..()
		else
			to_chat(user, SPAN_WARNING("You are not a part of this civilization to vote here."))
			return

// General civilian ballot - ((blue))

/obj/structure/voting/civilain
	name = "投票箱"
	icon_state = "bet_box_blue"

	attack_hand(var/mob/living/human/user as mob)
		if (user.faction_text == CIVILIAN)
			..()
		else
			to_chat(user, SPAN_WARNING("You are not a part of this civilization to vote here."))
			return

// General pirate ballot - ((red))

/obj/structure/voting/pirates
	name = "投票箱"
	icon_state = "bet_box_red"

	attack_hand(var/mob/living/human/user as mob)
		if (user.faction_text == PIRATES)
			..()
		else
			to_chat(user, SPAN_WARNING("You are not a part of this civilization to vote here."))
			return

// Voyage defines find_roles [getter] proc.

/obj/structure/voting/proc/find_roles()
	// Initialize the roles to FALSE, we're about to get them.
	found_captain = FALSE
	found_boatswain = FALSE
	found_quartermaster = FALSE

	// Loop through each human in the mob list
	for(var/mob/living/human/H in living_mob_list)
		// We are iterating through the `List of all alive mobs, including clientless. Excludes /mob/new_player`. Safety check anyway;
		if(H.stat != DEAD)
			switch(H.original_job_title) // Switch job title.
				if("Pirate Captain")
					found_captain = TRUE
				if("Pirate Boatswain")
					found_boatswain = TRUE
				if("Pirate Quartermaster")
					found_quartermaster = TRUE

// General Procs 

/obj/structure/voting/examine(mob/user)
	..()
	if (in_election)
		to_chat(user, "当前投票给: <b>[election_desc]</b>")
		to_chat(user, "<b>共已投出[total_votes]票.</b>")
	else
		to_chat(user, "<b>当前没有投票.</b>")

/obj/structure/voting/attack_hand(var/mob/living/human/user as mob)
	if (in_election)
		if (!(user in voted))
			total_votes += 1
			var/choice = WWinput(user, "[election_desc]", "Electoral System","Null",vote_options+"Null")
			if (choice != "Null" && !(user in voted))
				votes[choice] += 1
				voted += user
				return

		else
			WWalert(user, "You already voted!", "Electoral System")
			return
		return
	else
		if (in_election)
			return
		if (user.original_job.title == "Pirate Surgeon")
			return
		var/previous_input = "Officer"
		if (user.title == "Captain" || user.title == "Boatswain" || user.title == "Quartermaster" || map.ID != MAP_VOYAGE)
			previous_input = "Custom Vote"
		if (previous_input == "Officer")
			find_roles()
			var/list/choicelist = list("Cancel")
			if(!found_captain)
				choicelist += "Captain"
			if(!found_boatswain)
				choicelist += "Boatswain"
			if(!found_quartermaster)
				choicelist += "Quartermaster"
			var/choose_officer = WWinput(user, "Which free position do you want to run for?","Electoral System","Cancel",choicelist)
			if(!choose_officer || choose_officer == "Cancel" || choose_officer == "")
				return
			if(choose_officer != "Captain" && choose_officer != "Quartermaster" && choose_officer != "Boatswain")
				return
			special_election = TRUE
			in_election = TRUE
			election_desc = "Shall [user] be the new [choose_officer]?"
			person = user
			person_role = choose_officer
			vote_options = list("Yes","No")
		else
			var/inpt = input(user, "What do you want the vote to be on? (Leave blank to cancel)", "Electoral System", "") as text
			if (!inpt || inpt == "" || in_election)
				return
			if (in_election)
				return
			var/inpt2 = input(user, "What options should the vote have? Separate them with ';'. (example: 'Yes;No') (Leave blank to cancel)", "Electoral System", "") as text
			if (!inpt || inpt == "" || in_election)
				return
			var/inpt2_parsed = splittext(inpt2,";")
			in_election = TRUE
			election_desc = inpt
			vote_options = inpt2_parsed
		voted = list()
		votes = list()
		total_votes = 0
		for(var/j in vote_options)
			votes += list("[j]" = 0)
		to_chat(world, "<big><font color='yellow'>投票已开始! 2分钟后出结果.</big></font>")
		to_chat(world, "<big><font color='yellow'><b><i>[election_desc]</i></b></big></font>")
		for(var/i in vote_options)
			to_chat(world, "<font color='yellow'><b><i>&nbsp;&nbsp;&nbsp;&nbsp;[i]</i></b></font>")
		log_admin("[user.ckey] triggered a ballot box vote.")
		message_admins("[user.ckey] triggered a ballot box vote.")
		start_timer(1200)

/obj/structure/voting/proc/start_timer(var/time = 1800)
	spawn(time)
		in_election = FALSE
		if (total_votes == 0)
			to_chat(world, "<big><font color='yellow'><b>选举结束, 无人投票!</b></big></font>")
		var/winner = "none"
		var/sum = 0
		for(var/j in votes)
			if (votes[j] > sum)
				sum = votes[j]
				winner = j
			else if (votes[j] == sum && sum != 0)
				winner = "tie"
		if (winner != "tie")
			to_chat(world, "<big><font color='yellow'><b><i>[winner]</i></b> 是得票最多的选项!</big></font>")
		else
			to_chat(world, "<big><font color='yellow'>投票以<b><i>平局</i></b>结束!</big></font>")
		if(total_votes > 0)
			to_chat(world, "<font color='yellow'><b>结果:</b></font>")
			for(var/i in votes)
				to_chat(world, "<font color='yellow'><b><i>[i]</i> - [(votes[i]/total_votes)*100]% ([votes[i]] 票)</b></font>")
			total_votes = 0
			if(special_election && winner == "Yes")
				to_chat(world, "<big><font color='yellow'>[person] 已被选为新的 [person_role].</font></big>")
				if(person)
					person.original_job_title = "Pirate [person_role]"
					person.name = replacetext(person.name,"[person.title] ","")
					person.title = person_role
					person.name = "[person.title] [person.name]"
					person.original_job = job_master.GetJob("Pirate [person_role]")
					if(person_role == "Boatswain")
						person.make_title_changer()
					person.make_commander()
					person.make_artillery_officer()
					WWalert(person, "You are the new [person_role]!","Election Winner")
			person = null // Reset variables.
			person_role = ""
	return
