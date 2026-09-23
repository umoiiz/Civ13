/datum/martial_art/krav_maga
	name = "Krav Maga"
	id = "kravmaga"
	var/datum/action/neck_chop/neckchop = new/datum/action/neck_chop()
	var/datum/action/leg_sweep/legsweep = new/datum/action/leg_sweep()
	var/datum/action/lung_punch/lungpunch = new/datum/action/lung_punch()

/datum/action/neck_chop
	name = "Neck Chop - Injures the neck, stopping the victim from speaking for a while."
	button_icon_state = "neckchop"

/datum/action/neck_chop/Trigger()
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>你在失去行动能力时无法使用[name].</span>")
		return
	if (owner.mind.martial_art.streak == "neck_chop")
		owner.visible_message("<span class='danger'>[owner]摆出中立架势.</span>", "<b><i>你的下一次攻击已取消.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message("<span class='danger'>[owner]摆出劈颈架势!</span>", "<b><i>你的下一次攻击将是劈颈.</i></b>")
		owner.mind.martial_art.streak = "neck_chop"

/datum/action/leg_sweep
	name = "Leg Sweep - Trips the victim, knocking them down for a brief moment."
	button_icon_state = "legsweep"

/datum/action/leg_sweep/Trigger()
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>你在失去行动能力时无法使用[name].</span>")
		return
	if (owner.mind.martial_art.streak == "leg_sweep")
		owner.visible_message("<span class='danger'>[owner]摆出中立架势.</span>", "<b><i>你的下一次攻击已取消.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message("<span class='danger'>[owner]摆出扫腿架势!</span>", "<b><i>你的下一次攻击将是扫腿.</i></b>")
		owner.mind.martial_art.streak = "leg_sweep"

/datum/action/lung_punch//referred to internally as 'quick choke'
	name = "Lung Punch - Delivers a strong punch just above the victim's abdomen, constraining the lungs. The victim will be unable to breathe for a short time."
	button_icon_state = "lungpunch"

/datum/action/lung_punch/Trigger()
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>你在失去行动能力时无法使用[name].</span>")
		return
	if (owner.mind.martial_art.streak == "quick_choke")
		owner.visible_message("<span class='danger'>[owner]摆出中立架势.</span>", "<b><i>你的下一次攻击已取消.</i></b>")
		owner.mind.martial_art.streak = ""
	else
		owner.visible_message("<span class='danger'>[owner]摆出冲肺拳架势!</span>", "<b><i>你的下一次攻击将是冲肺拳.</i></b>")
		owner.mind.martial_art.streak = "quick_choke"//internal name for lung punch

/datum/martial_art/krav_maga/teach(mob/living/owner, make_temporary=FALSE)
	if(..())
		to_chat(owner, "<span class='userdanger'>你掌握了[name]的技艺!</span>")
		to_chat(owner, "<span class='danger'>将光标悬停在屏幕顶部的招式上可查看其效果.</span>")
		neckchop.Grant(owner)
		legsweep.Grant(owner)
		lungpunch.Grant(owner)

/datum/martial_art/krav_maga/remove(mob/living/owner)
	neckchop.Remove(owner)
	legsweep.Remove(owner)
	lungpunch.Remove(owner)
	..()

/datum/martial_art/krav_maga/proc/check_streak(mob/living/human/A, mob/living/human/D)
	switch(streak)
		if("neck_chop")
			streak = ""
			neck_chop(A,D)
			return TRUE
		if("leg_sweep")
			streak = ""
			leg_sweep(A,D)
			return TRUE
		if("quick_choke")//is actually lung punch
			streak = ""
			quick_choke(A,D)
			return TRUE
	return FALSE

/datum/martial_art/krav_maga/proc/leg_sweep(mob/living/human/A, mob/living/human/D)
	if(D.stat || D.paralysis > 0)
		return FALSE
	D.visible_message("<span class='warning'>[A]扫腿攻击[D]!</span>", \
					"<span class='userdanger'>Your legs are sweeped by [A]!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>", null, A)
	to_chat(A, "<span class='danger'>你扫腿攻击[D]!</span>")
	playsound(get_turf(A), 'sound/weapons/kick.ogg', 50, TRUE, -1)
	D.stats["stamina"][1] = max(0, D.stats["stamina"][1] - rand(20,30))
	D.Weaken(60)
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>Leg sweeped by [A.name] ([A.ckey])</font>"
	return TRUE

/datum/martial_art/krav_maga/proc/quick_choke(mob/living/human/A, mob/living/human/D)//is actually lung punch
	D.visible_message("<span class='warning'>[A]捶击[D]的胸口!</span>", \
					"<span class='userdanger'>Your chest is slammed by [A]! You can't breathe!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>")
	to_chat(A, "<span class='danger'>你捶击[D]的胸口!</span>")
	playsound(get_turf(A), "punch_sound", 50, TRUE, -1)
	if(D.losebreath <= 10)
		D.losebreath = clamp(D.losebreath + 5, 0, 10)
	D.adjustOxyLoss(10)
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>Quickchoked by [A.name] ([A.ckey])</font>"
	return TRUE

/datum/martial_art/krav_maga/proc/neck_chop(mob/living/human/A, mob/living/human/D)
	D.visible_message("<span class='warning'>[A]空手劈向[D]的脖子!</span>", \
					"<span class='userdanger'>Your neck is karate chopped by [A], rendering you unable to speak!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>")
	to_chat(A, "<span class='danger'>你空手劈向[D]的脖子,使[D.gender == MALE ? "him" : "her"]无法说话!</span>")
	playsound(get_turf(A), 'sound/weapons/punch1.ogg', 50, TRUE, -1)
	D.apply_damage(5, BRUTE)
	if (ishuman(D))
		var/mob/living/human/human_defender = D
		if(human_defender.silent <= 10)
			human_defender.silent = clamp(human_defender.silent + 10, 0, 10)
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>Neck chopped by [A.name] ([A.ckey])</font>"
	return TRUE

/datum/martial_art/krav_maga/grab_act(mob/living/human/A, mob/living/human/D)
	if(check_streak(A,D))
		return TRUE
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>Grabbed (Krav Maga) by [A.name] ([A.ckey])</font>"
	..()

/datum/martial_art/krav_maga/harm_act(mob/living/human/A, mob/living/human/D)
	if(check_streak(A,D))
		return TRUE
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>Punched by [A.name] ([A.ckey])</font>"
	var/picked_hit_type = pick("punch", "kick")
	var/bonus_damage = 0
	if(D.lying)
		bonus_damage += 5
		picked_hit_type = "stomp"
	D.stats["stamina"][1] = max(0, D.stats["stamina"][1] - (rand(5,10) + bonus_damage))
	if(picked_hit_type == "kick" || picked_hit_type == "stomp")
		A.do_attack_animation(D)
		playsound(get_turf(D), 'sound/weapons/kick.ogg', 50, TRUE, -1)
	else
		A.do_attack_animation(D)
		playsound(get_turf(D), 'sound/weapons/punch1.ogg', 50, TRUE, -1)
	D.visible_message("<span class='danger'>[A][picked_hit_type]了[D]!</span>", \
					"<span class='userdanger'>You're [picked_hit_type]ed by [A]!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>")
	to_chat(A, "<span class='danger'>你[picked_hit_type]了[D]!</span>")
	D.attack_log += "\[[time_stamp()]\] <font color='orange'>[picked_hit_type] by [A.name] ([A.ckey])</font>"
	return TRUE

/datum/martial_art/krav_maga/disarm_act(mob/living/human/A, mob/living/human/D)
	if(check_streak(A,D))
		return TRUE
	if(!D.lying)
		D.visible_message("<span class='danger'>[A]斥责[D]!</span>", \
					"<span class='userdanger'>You're slapped by [A]!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>")
		to_chat(A, "<span class='danger'>你刺击[D]!</span>")
		A.do_attack_animation(D)
		playsound(D, 'sound/weapons/punch1.ogg', 50, TRUE, -1)
		D.stats["stamina"][1] = max(0, D.stats["stamina"][1] - rand(5,10))
		D.attack_log += "\[[time_stamp()]\] <font color='orange'>Punched nonlethally by [A.name] ([A.ckey])</font>"
	if(D.lying)
		D.visible_message("<span class='danger'>[A]斥责[D]!</span>", \
					"<span class='userdanger'>You're manhandled by [A]!</span>", "<span class='hear'>你听到一阵令人作呕的皮肉相击声!</span>")
		to_chat(A, "<span class='danger'>你踩踏[D]!</span>")
		A.do_attack_animation(D)
		playsound(D, 'sound/weapons/punch1.ogg', 50, TRUE, -1)
		D.stats["stamina"][1] = max(0, D.stats["stamina"][1] - rand(10,15))
		D.attack_log += "\[[time_stamp()]\] <font color='orange'>Stomped nonlethally by [A.name] ([A.ckey])</font>"
	if(prob(D.stats["stamina"][2] - D.stats["stamina"][1]))
		D.visible_message("<span class='warning'>[D]喷着气,痛苦地缩了回去!</span>", "<span class='userdanger'>你被戳中神经,痛苦地缩了回去!</span>")
		D.drop_l_hand()
		D.drop_r_hand()
	return TRUE
