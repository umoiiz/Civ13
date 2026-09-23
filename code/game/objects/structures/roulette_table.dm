/////////////////Roulette//////////////////

/obj/item/weapon/roulette/chip
	name = "蓝色轮盘筹码"
	icon = 'icons/obj/items.dmi'
	icon_state = "chip_blue"

/obj/item/weapon/roulette/chip/red
	name = "红色轮盘筹码"
	icon_state = "chip_red"
	value = 5

/obj/item/weapon/roulette/chip/green
	name = "绿色轮盘筹码"
	icon_state = "chip_green"
	value = 25

/obj/item/weapon/roulette/chip/black
	name = "黑色轮盘筹码"
	icon_state = "chip_black"
	value = 100

/obj/item/weapon/roulette/chip/examine(mob/user, distance)
	. = ..()
	to_chat(user, "价值为<b>[value]</b>.")

/obj/structure/roulette
	name = "轮盘赌桌"
	desc = "一张带有转盘的大型绿色桌子. 如果你选一个数字并且它停在那个数字上, 你就会赢得筹码. 或者别的什么."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "roulette"
	density = 1
	anchored = 1
	bound_width = 64
	var/highest_number = 36
	var/win_number
	var/win_color
	var/win_3rd
	var/win_half
	var/win_odd_even
	var/spinning = 0
	var/can_bet = 1
	var/win
	var/list/current_bets = list()

/obj/structure/roulette/examine(mob/user, distance)
	. = ..()
	if(win_number && !can_bet)
		to_chat(user, "上一个数字是<b>[win_number]</b>.")
	if(spinning)
		to_chat(user, "<b>轮盘正在旋转!</b>")
	for(var/list/L in current_bets)
		to_chat(user, "<b>[L[1]]</b>在<b>[L[2]]</b>上下了<b>[L[3]]</b>的赌注.")
/obj/structure/roulette/initialize()
	reset_wheel()
	..()

/obj/structure/roulette/proc/reset_wheel()
	spinning = 0

/obj/structure/roulette/proc/process_wins()
	can_bet = FALSE
	for(var/list/L in current_bets)
		if(win_color == L[2] || win_half == L[2] || win_3rd == L[2] || win_odd_even == L[2] || win_color == L[2])
			L[3] = L[3]*2
			L[2] = "won"
		else if(win_3rd == L[2])
			L[3] = L[3]*3
			L[2] = "won"
		else if(num2text(win_number) == L[2])
			L[3] = L[3]*36
			L[2] = "won"
		else
			L[2] = "lost"
	if (!current_bets.len)
		can_bet = TRUE

/obj/structure/roulette/proc/do_outcome()
	spinning = 0
	win_color = "green"
	win_number = rand(0, highest_number)
	if (win_number == 0)
		win_color = "green"
		win_odd_even = null
		win_3rd = null
		win_half = null
	else if ((win_number % 2) == 0)
		win_color = "red"
		win_odd_even = "even"
	else
		win_color = "black"
		win_odd_even = "odd"
	if(win_number >= 1 && win_number <= 18)
		win_half = "1 to 18"
	else if(win_number >= 19 && win_number <= 36)
		win_half = "19 to 36"
	else
		win_half = null
	if(win_number >= 1 && win_number <= 12)
		win_3rd = "1st 12"
	else if(win_number >= 13 && win_number <= 24)
		win_3rd = "2nd 12"
	else if(win_number >= 25 && win_number <= 36)
		win_3rd = "3rd 12"
	else
		win_3rd = null
	src.visible_message("\The [src]的球咔嗒一声停在了<font color=[win_color]><span><b>[win_color] [win_number]</b></span></font>上.","你听到一阵咔嗒声, 然后慢慢停了下来.")
	src.visible_message("<big><b>请领取你的奖金!</b></big>")

	process_wins()
/obj/structure/roulette/update_icon()
	if(spinning)
		icon_state = "[initial(icon_state)]_spin"
	else
		icon_state = initial(icon_state)

/obj/structure/roulette/attack_hand(mob/living/human/H)
	var/list/newlist = list()
	for(var/list/L in current_bets)
		if(L[1] == H && L[2] == "won")
			to_chat(H, "你从桌上取回了你的赌注.")
			var/obj/item/weapon/roulette/chip/newchips = new/obj/item/weapon/roulette/chip(loc)
			newchips.value = L[3]
			H.put_in_any_hand_if_possible(newchips,FALSE,TRUE,TRUE,TRUE)
		else
			newlist.Add(L)
	current_bets = newlist
	if (!current_bets.len)
		can_bet = TRUE

/obj/structure/roulette/attackby(obj/item/I,mob/living/human/user)
	if(spinning)
		to_chat(user, "[src]还在旋转!")
		return
	if(!can_bet)
		to_chat(user, "请先移除之前的赌注!")
		return
	if(istype(I, /obj/item/weapon/roulette/chip))
		var/obj/item/weapon/roulette/chip/CHIP = I
		var/betchoice = null
		var/choice = WWinput(user, "Where do you want to place your bet?", "Roulette", "Cancel",list("Cancel","Select Number","Zero","Red","Black",/*"Even","Odd",*/"1 to 18","19 to 36","1st 12","2nd 12","3rd 12"))
		switch(choice)
			if("Cancel")
				return
			if("Select Number")
				var/nr_choice = WWinput(user, "Which number? 1 to 36", "Roulette", "Cancel",list("Cancel","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"))
				betchoice = nr_choice
			if("Zero")
				betchoice = "0"
			if("Red")
				betchoice = "red"
			if("Black")
				betchoice = "black"
			if("Even")
				betchoice = "even"
			if("Odd")
				betchoice = "odd"
			if("1 to 18")
				betchoice = "1 to 18"
			if("19 to 36")
				betchoice = "19 to 36"
			if("1st 12")
				betchoice = "1st 12"
			if("2nd 12")
				betchoice = "2nd 12"
			if("3rd 12")
				betchoice = "3rd 12"
		if (betchoice)
			if (I)
				visible_message("<big>[user]在<b>[betchoice]</b>上下了<b>[CHIP.value]</b>的赌注!</big>")
				current_bets += list(list(user,betchoice,CHIP.value))
				qdel(I)

/obj/structure/roulette/verb/spin(mob/user as mob)
	set name = "Spin Roulette Table"
	set category = null
	set src in oview(1)

	if (spinning)
		to_chat(user,"[src]已经在旋转了!")
		return
	else if (!can_bet)
		to_chat(user, "你需要先清空桌面!")
		return
	else
		playsound(src, 'sound/effects/roulettespin.ogg', 50, 1)
		src.visible_message("<big><b>轮盘旋转中! 停止下注!</b></big>")
		spinning = 1
		can_bet = FALSE
		update_icon()
		sleep(60)
		//Win or lose?
		do_outcome()
		reset_wheel()
		update_icon()

