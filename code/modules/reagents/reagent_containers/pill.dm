////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "药丸"
	desc = "一颗药丸."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	possible_transfer_amounts = null
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	volume = 60

	New()
		..()
		if (!icon_state)
			icon_state = "pill[rand(1, 20)]"

	attack(mob/M as mob, mob/user as mob, def_zone)
		//TODO: replace with standard_feed_mob() call.

		if (M == user)
			if (!M.can_eat(src))
				return

			M.visible_message("<span class ='notice'>[M]吞下了\the [src].</span>", "<span class='notice'>你吞下了\the [src].</span>")
			M.drop_from_inventory(src) //icon update
			if (reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return TRUE

		else if (istype(M, /mob/living/human))
			if (!M.can_force_feed(user, src))
				return

			user.visible_message("<span class='warning'>[user]试图强迫[M]吞下\the [src]!</span>", "<span class='warning'>你试图强迫[M]吞下\the [src].")

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if (!do_mob(user, M))
				return

			user.drop_from_inventory(src) //icon update
			user.visible_message("<span class='warning'>[user]强迫[M]吞下\the [src].</span>!")

			var/contained = reagentlist()
			M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been fed [name] by [key_name(user)] Reagents: [contained]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [name] to [key_name(M)] Reagents: [contained]</font>")
			msg_admin_attack("[key_name_admin(user)] fed [key_name_admin(M)] with [name] Reagents: [contained] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)", key_name_admin(user), key_name_admin(M))

			if (reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)

			return TRUE

		return FALSE

	afterattack(obj/target, mob/user, proximity)
		if (!proximity) return

		if (target.is_open_container() && target.reagents)
			if (!target.reagents.total_volume)
				to_chat(user, "<span class='notice'>[target]是空的.无法溶解\the [src].</span>")
				return
			to_chat(user, "<span class='notice'>你将\the [src]溶解在[target]中.</span>")

			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Spiked \a [target] with a pill. Reagents: [reagentlist()]</font>")
			msg_admin_attack("[user.name] ([user.ckey]) spiked \a [target] with a pill. Reagents: [reagentlist()] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)", user.ckey, target) //Should target actually be target (key_name_admin(target)) ??

			reagents.trans_to(target, reagents.total_volume)
			for (var/mob/O in viewers(2, user))
				O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", TRUE)

			qdel(src)

		return

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "抗毒素药丸"
	desc = "中和许多常见的毒素."
	icon_state = "pill17"
	New()
		..()
		reagents.add_reagent("anti_toxin", 25)

/obj/item/weapon/reagent_containers/pill/tox
	name = "毒素药丸"
	desc = "剧毒."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("toxin", 50)

/obj/item/weapon/reagent_containers/pill/cyanide
	name = "氰化物药丸"
	desc = "别吞下这个."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("cyanide", 50)


/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "扑热息痛药丸"
	desc = "也称为对乙酰氨基酚.用于治疗发烧和轻度至中度疼痛."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("paracetamol", 15)

/obj/item/weapon/reagent_containers/pill/aspirin
	name = "阿司匹林药丸"
	desc = "也称为乙酰水杨酸.用于治疗发烧和轻度至中度疼痛."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("aspirin", 10)

/obj/item/weapon/reagent_containers/pill/sal_acid
	name = "水杨酸药丸"
	desc = "促进严重瘀伤愈合.极快地治愈严重瘀伤,缓慢治愈轻微瘀伤.过量服用会加重现有瘀伤."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("sal_acid", 10)

/obj/item/weapon/reagent_containers/pill/tramadol
	name = "曲马多药丸"
	desc = "一种中度止痛药."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("tramadol", 15)

/obj/item/weapon/reagent_containers/pill/opium
	name = "鸦片球"
	desc = "一团干燥的鸦片.一种强效止痛药."
	icon = 'icons/obj/materials.dmi'
	icon_state = "opium_extracted"
	value = 17
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("opium", 5)

/obj/item/weapon/reagent_containers/pill/cocaine
	name = "一堆可卡因"
	desc = "一堆非常纯净的可卡因."
	icon = 'icons/obj/drugs.dmi'
	icon_state = "cocaine_pile"
	var/vol = 1
	value = 20
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("cocaine", 25)
		desc = "一堆非常纯净的可卡因.含有[vol]克."

/obj/item/weapon/reagent_containers/pill/cocaine/attack_hand(mob/living/user)
	if (src == user.l_hand || src == user.r_hand)
		if (reagents.get_reagent_amount("cocaine") >= 10)
			to_chat(user, "你从[src]中分出一条.")
			reagents.remove_reagent("cocaine",5)
			var/obj/item/weapon/reagent_containers/pill/cocaine_line/coca = new/obj/item/weapon/reagent_containers/pill/cocaine_line(user)
			user.put_in_hands(coca)
			vol = reagents.get_reagent_amount("cocaine")/25
			desc = "A pile of very pure cocaine. Contains [vol] grams."
	else
		..()

/obj/item/weapon/reagent_containers/pill/cocaine/attackby(var/obj/item/I, var/mob/user)
	if (istype(I, /obj/item/weapon/reagent_containers/pill/cocaine_line))
		to_chat(user, "你将\the [I]放入\the [src].")
		reagents.add_reagent("cocaine",I.reagents.get_reagent_amount("cocaine"))
		vol = reagents.get_reagent_amount("cocaine")/25
		desc = "A pile of very pure cocaine. Contains [vol] grams."
		qdel(I)
	else
		..()
/obj/item/weapon/reagent_containers/pill/cocaine_line
	name = "一条可卡因"
	desc = "一条可卡因.准备好吸进你的鼻子了."
	icon = 'icons/obj/drugs.dmi'
	icon_state = "cocaine_line"
	value = 4
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("cocaine", 5)

/obj/item/weapon/reagent_containers/pill/crack
	name = "快克可卡因块"
	desc = "一块快克可卡因.准备好被吸食了."
	icon_state = "crack"
	value = 4
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("crack", 5)

/obj/item/weapon/reagent_containers/pill/methylphenidate
	name = "哌甲酯药丸"
	desc = "提高集中注意力的能力."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("methylphenidate", 15)

/obj/item/weapon/reagent_containers/pill/citalopram
	name = "西酞普兰药丸"
	desc = "温和的抗抑郁药."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("citalopram", 15)


/obj/item/weapon/reagent_containers/pill/adrenaline
	name = "肾上腺素药丸"
	desc = "用于稳定患者."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent("adrenaline", 30)


/obj/item/weapon/reagent_containers/pill/potassium_iodide
	name = "碘化钾药丸"
	desc = "用于帮助治疗辐射中毒."
	icon_state = "pill12"
	New()
		..()
		reagents.add_reagent("potassium_iodide", 10)


/obj/item/weapon/reagent_containers/pill/anti_toxin
	name = "地洛文药丸"
	desc = "一种广谱抗毒素."
	icon_state = "pill13"
	New()
		..()
		reagents.add_reagent("anti_toxin", 15)


/obj/item/weapon/reagent_containers/pill/happy
	name = "快乐药丸"
	desc = "快乐快乐,开心开心!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("peyote", 15)
		reagents.add_reagent("sugar", 15)


/obj/item/weapon/reagent_containers/pill/penicillin
	name = "青霉素药丸"
	desc = "含有抗菌剂."
	icon_state = "pill19"
	New()
		..()
		reagents.add_reagent("penicillin", 15)
quinine

/obj/item/weapon/reagent_containers/pill/antimalaria
	name = "抗疟疾药丸"
	desc = "抗疟疾剂."
	icon_state = "pill7"
	New()
		..()
		reagents.add_reagent("quinine", 1)


//WW2

/obj/item/weapon/reagent_containers/pill/pervitin
	name = "佩尔维汀药丸"
	desc = "含有强效兴奋剂的药丸. 别吃两片,一片就够你受的了."
	icon_state = "pill16"
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("methamphetamine", REAGENTS_OVERDOSE*0.45) // slightly less than an OD

/obj/item/weapon/reagent_containers/pill/ketamine
	name = "氯胺酮药丸"
	desc = "你不确定该不该吞下这个... 啊,为什么不呢."
	icon_state = "pill16"
	is_contraband = TRUE
	New()
		..()
		reagents.add_reagent("ketamine", REAGENTS_OVERDOSE*0.45) // slightly less than an OD

/obj/item/weapon/reagent_containers/pill/dragonpowder
	name = "龙粉药丸"
	desc = "一颗闪亮的紫色药丸."
	icon_state = "dragonpowder"
	New()
		..()
		reagents.add_reagent("dragon_powder", 10)

/obj/item/weapon/reagent_containers/pill/diclofenac
	name = "双氯芬酸药丸"
	desc = "双氯芬酸是一种减轻肿胀,疼痛并帮助恢复的药物. 过量服用会造成严重物理伤害."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("diclofenac", 15)

/obj/item/weapon/reagent_containers/pill/procrit
	name = "普罗克里特"
	desc = "普罗克里特是一种人造药物,能帮助身体产生红细胞. 过量服用会使人虚弱并引起幻觉."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("procrit", 10)
