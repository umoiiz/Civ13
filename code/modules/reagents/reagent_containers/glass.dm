//TO DO TODO: global obj/item pickup_sound, drop_sound, pickup_volume, drop_volume
//TO DO TODO: unify all food/drinks act as /glass, all /glass act as food/drinks
//TO DO TODO: fix code\game\objects\items.dm , code\modules\lighting\lighting_atom.dm
//TO DO TODO: /obj/effect/flooding need to be fixed
//TO DO TODO: Painstaking checking and possibly redrawing icons of small versions of items. Checking for compliance with item_state and icons in them.
//TO DO TODO: Think about transfer accuracy. For example, there is no such thing as the exact amount that can be poured out of a bucket!
//TO DO TODO: CHECK:   /obj/item/weapon/reagent_containers/glass/small_pot/german_kit_lid it may have bugs
//TO DO TODO: Re-Check all /obj/item/weapon/reagent_containers/glass/ items, that not in this file
//TO DO TODO: Think about concept: all /glass objects are storage, with watertight vessel sides.
//             All storages are vessels with non-waterproof sides and will lose liquids differs with liquid viscosity and pore size of the vessel.
//             I.e. /glass items have pore_size = 0 on sides and pore_size=100(?) on top of it (for vaporing).
//             Lids have own pore_size. For example beakers lid must (may) have pore_size=0
//TO DO TODO: Why not all pots from 'icons/obj/claystuff.dmi' are /glass objects??? Need reworking to usual concept!
//TO DO TODO: Satisfaction of drinking from a glass
//TO DO TODO: resolve theese objects attackby procedures (they must return TRUE for interrupt attack chain):
var/list/not_resolved_in_attackby_objects = list(/obj/structure/chemical_dispenser, /obj/structure/lab_distillery,
		/obj/structure/table, /obj/structure/closet, /obj/structure/sink, /obj/structure/engine,
		/obj/item/weapon/storage, /mob/living/simple_animal/cattle/cow,
		/mob/living/simple_animal/goat/female, /mob/living/simple_animal/sheep/female,
		/mob/living/simple_animal/pig_gilt, /obj/structure/oil_spring,
		/obj/structure/refinery, /obj/structure/distillery, /obj/structure/oilwell,
		/obj/structure/heatsource, /obj/item/flashlight/lantern, /obj/item/stack/ammopart,
		/obj/structure/vehicle, /obj/structure/fuelpump, /obj/item/stack/ore, /obj/structure/pot
		)

////////////////////////////////////////////////////////////////////////////////
/// (Mixing)Glass.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/glass
	var/base_name // for labeling by pen items
	icon = 'icons/obj/chemical.dmi'
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60)
	volume = 60
	w_class = ITEM_SIZE_SMALL
	var/label_text = ""
	dropsound = 'sound/effects/drop_glass.ogg'

/obj/item/weapon/reagent_containers/glass/New()
	..()
	base_name = name
	flags |= OPENCONTAINER
	flags &= ~CONDUCT

/obj/item/weapon/reagent_containers/glass/examine(var/mob/user)
	if (!..(user, 2))
		return
	if (reagents && reagents.reagent_list.len)
		to_chat(user, SPAN_NOTICE("It contains [reagents.total_volume] units of liquid."))
	else
		to_chat(user, SPAN_NOTICE("It is empty."))
	if (!is_open_container())
		to_chat(user, SPAN_NOTICE("the airtight lid seals it completely!"))

/obj/item/weapon/reagent_containers/glass/self_feed_message(var/mob/user)
	user.visible_message("<span class='notice'>[src]从\the [src]中喝了一口.</span>", "<span class='notice'>你从\the [src]中吞下一大口.</span>") // Different perspectives from different point of views of the 	clients.

/obj/item/weapon/reagent_containers/glass/feed_sound(var/mob/user)
	playsound(user.loc, "drink", rand(10, 50), TRUE)

/obj/item/weapon/reagent_containers/glass/attack_self(mob/user as mob)
	..()
	if (!(istype(src,/obj/item/weapon/reagent_containers/glass/fire_extinguisher)))
		if (is_open_container())
			playsound(src,'sound/effects/Lid_Removal_Bottle_mono.ogg',50,1)
			user.visible_message("<span class = 'notice'>[usr]盖上了\the [src]的盖子.</span>", "<span class = 'notice'>你盖上了\the [src]的盖子.</span>")
			flags &= ~OPENCONTAINER
		else
			user.visible_message("<span class = 'notice'>[usr]打开了\the [src]的盖子.</span>", "<span class = 'notice'>你打开了\the [src]的盖子.</span>")
			flags |= OPENCONTAINER
	update_icon()

/obj/item/weapon/reagent_containers/glass/attack_turf(turf/attacked, mob/user, icon_x, icon_y)
	if (!(istype(src,/obj/item/weapon/reagent_containers/glass/fire_extinguisher)))
		if (is_open_container())
			if (reagents.total_volume)
				if (user.a_intent == I_HARM)
					user.visible_message("<span class='danger'>[user]把[src]中的东西泼到了[attacked]上!</span>", \
										"<span class='notice'>You splash the contents of [src] onto [attacked].</span>")
					proper_spill(attacked, reagents.total_volume)
					return TRUE
				else if (istype(attacked, /turf/floor/dirt))
					if (locate(/obj/structure/farming/plant) in attacked)
						user.visible_message("<span class='notice'>[user]把[src]中的东西倒到了[attacked]上!</span>", \
											"<span class='notice'>You pour the contents of [src] onto [attacked].</span>")
						proper_spill(attacked, amount_per_transfer_from_this)
					return TRUE
	return FALSE

/obj/item/weapon/reagent_containers/glass/attack(mob/living/M, mob/living/user, target_zone)
	if (!is_open_container())
		return ..(M, user, target_zone)
	if (user.a_intent == I_HARM)
		standard_splash_mob(user, M)
	else
		standard_feed_mob(user, M)
	return TRUE //open container attack will resolved anyway

/obj/item/weapon/reagent_containers/glass/attack_obj(obj/attacked, mob/user, icon_x, icon_y)
	for (var/type in not_resolved_in_attackby_objects) //Old code artefact. TO DO TODO: resolve theese objects attackby procedures (they must return TRUE for interrupt attack chain)
		if (istype(attacked, type))
			return FALSE
	if (istype(attacked, /obj/structure/pot))
		return FALSE //all in attackby in pot.dm //TO DO TODO: Rework pot code into a large stationary glass with the ability to cook.
	if (!is_open_container())
		return FALSE
	if (standard_pour_into(user, attacked)) //trying to put into other reagent_container
		return TRUE
	if (standard_dispenser_refill(user, attacked)) //trying to refill this container from dispenser
		return TRUE
	return FALSE //not resolved

/obj/item/weapon/reagent_containers/glass/attackby(obj/item/weapon/W as obj, mob/user as mob) //TO DO TODO: fix this mess to something normal
	if (istype(W, /obj/item/weapon/pen))
		update_name_label(user)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/grapes)) //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把葡萄在容器里捣碎.</span>", "<span class='notice'>你把葡萄在容器里捣碎成汁.</span>", "<span class='notice'>你听到某种研磨的声音.</span>")
		reagents.add_reagent("grapejuice", 5)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/cinchona)) //liquid transfer? solid??? (error sprite???)
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
		user.visible_message("<span class='warning'>[user]把金鸡纳树在容器里研磨.</span>", "<span class='notice'>你把金鸡纳树在容器里研磨成奎宁.</span>", "<span class='notice'>你听到某种研磨的声音.</span>")
		reagents.add_reagent("quinine", 10)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/olives))  //liquid transfer? solid???
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把橄榄在容器里研磨.</span>", "<span class='notice'>你把橄榄在容器里研磨成橄榄油混合物.</span>", "<span class='notice'>你听到某种研磨的声音.</span>")
		reagents.add_reagent("olive_oil", 6)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/juniper))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把杜松子在容器里碾碎.</span>", "<span class='notice'>你把杜松子在容器里碾碎以提取其汁液.</span>", "<span class='notice'>你听到某种碾碎的声音.</span>")
		reagents.add_reagent("juniper_juice", 6)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/animalfat))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把动物脂肪在容器里捣碎并研磨.</span>", "<span class='notice'>你把动物脂肪在容器里捣碎并研磨成猪油混合物.</span>", "<span class='notice'>你听到反复研磨和捣碎的声音.</span>")
		reagents.add_reagent("lard", 10)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/potato))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return

		user.visible_message("<span class='warning'>[user]把土豆在容器里捣碎.</span>", "<span class='notice'>你把土豆在容器里捣碎并提取其汁液.</span>", "<span class='notice'>你听到某种捣碎的声音.</span>")
		reagents.add_reagent("potato", 5)	
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/agave))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把龙舌兰叶在容器里撕碎.</span>", "<span class='notice'>你把龙舌兰叶在容器里撕碎并收集其花蜜.</span>", "<span class='notice'>你听到某种撕裂的声音.</span>")
		reagents.add_reagent("agave", 10)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/sapote))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把人心果在容器里碾碎.</span>", "<span class='notice'>你把人心果碾碎并让汁液渗入容器中.</span>", "<span class='notice'>你听到某种碾碎的声音.</span>")
		reagents.add_reagent("sapotejuice", 4)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/apple))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[src]把苹果在容器里捣碎.</span>", "<span class='notice'>你把苹果在容器里捣碎并让汁液渗入容器中.</span>", "<span class='notice'>你听到某种捣碎的声音.</span>")
		reagents.add_reagent("applejuice", 10)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/sapodilla))  //liquid transfer?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[src]把人心果在容器里捣碎.</span>", "<span class='notice'>你把人心果捣碎并让汁液渗入容器中.</span>", "<span class='notice'>你听到某种捣碎的声音.</span>")
		reagents.add_reagent("sapodillajuice", 10)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawfish/cod))  //item transfer? what?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]已关闭.</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]已满!</span>")
			return
		user.visible_message("<span class='warning'>[user]把鱼扔进了\the [src].</span>", "<span class='notice'>你把鱼扔进了\the [src]。</span>", "<span class='notice'>你把鱼扔进了\the [src]。</span>", "You hear the sound of something entering the container.")
		reagents.add_reagent("fish", 5)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawfish))  //item transfer? what is it?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]是关闭的。</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]满了!</span>")
			return
		user.visible_message("<span class='warning'>[user]把鱼扔进了\the [src]。</span>", "<span class='notice'>你把鱼扔进了\the [src]。</span>", "<span class='notice'>你把鱼扔进了\the [src]。</span>", "You hear the sound of something entering the container.")
		reagents.add_reagent("fish", 5)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/rice)) //item transfer? what is it?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]是关闭的。</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]满了!</span>")
			return
		user.visible_message("<span class='warning'>[user]把米捣碎在\the [src]的\the 内壁上。</span>", "<span class='notice'>你把米捣碎,在容器内制成了米糊。</span>", "<span class='notice'>你把米捣碎,在容器内制成了米糊。</span>", "You hear the sound of activity.")
		reagents.add_reagent("rice", 5)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/coffee)) //item transfer? what is it?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]是关闭的。</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]满了!</span>")
			return
		user.visible_message("<span class='warning'>[user]把咖啡研磨在\the [src]上。</span>", "<span class='notice'>你研磨咖啡,制成了咖啡饮品。</span>", "<span class='notice'>你研磨咖啡,制成了咖啡饮品。</span>", "You hear the sound of something grinding.")
		reagents.add_reagent("coffee", 15)
		qdel(W)
		return
	else if (istype(W, /obj/item/stack/material/cotton)) //item transfer? what is it?
		var/obj/item/stack/material/cotton/CT = W
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]是关闭的。</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]满了!</span>")
			return
		user.visible_message("<span class='warning'>[user]把棉花放进\the [src]里。</span>", "<span class='notice'>你把棉花放进\the [src]里。</span>", "<span class='notice'>你把棉花放进\the [src]里。</span>", "You hear the sound of activity.")
		reagents.add_reagent("cotton", CT.amount)
		qdel(W)
		return
	else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/grown/corn)) //item transfer? what is it?
		if (!is_open_container())
			to_chat(user, "<span class='notice'>\The [src]是关闭的。</span>")
			return
		if (!reagents.get_free_space())
			to_chat(user, "<span class='danger'>\The [src]满了!</span>")
			return
		user.visible_message("<span class='warning'>[user]把玉米研磨在\the [src]上。</span>", "<span class='notice'>你研磨玉米,制成了玉米油。</span>", "<span class='notice'>你研磨玉米,制成了玉米油。</span>", "You hear the sound of something grinding.")
		reagents.add_reagent("cornoil", 5)
		qdel(W)
		return
	else if(istype(W, /obj/item/stack/material/rope)) //Lard candle making
		if (reagents.get_reagent_amount("lard") >= 5)
			var/obj/item/stack/material/rope/R = W
			user.visible_message("<span class='warning'>[user]开始将<span class='notice'>[R.name]</span>浸入<span class='notice'>[src.name]</span>中,塑造成一根蜡烛。</span>", "<span class='notice'>你开始将<span class='notice'>[R.name]</span>浸入<span class='notice'>[src.name]</span>中,塑造成一根蜡烛。</span>", "<span class='notice'>你听到某种塑形的声音。</span>")
			if(do_after(user, 40, user))
				reagents.remove_reagent("lard", 5)
				new/obj/item/weapon/flame/candle/lard(user.loc)
				if(R.amount == 1)
					qdel(R)
				else
					R.amount -= 1
				return

/obj/item/weapon/reagent_containers/glass/barrel/attackby(var/obj/item/I, var/mob/user)
	if (reagents.total_volume+3 < volume)
		if (istype(I, /obj/item/stack/ore/sulphur))
			reagents.add_reagent("sulfur",3)
			if (I.amount>1)
				I.amount -= 1
			else
				qdel(I)
			return
		else if (istype(I, /obj/item/stack/ore/saltpeter))
			reagents.add_reagent("potassium",3)
			if (I.amount>1)
				I.amount -= 1
			else
				qdel(I)
			return
		else if (istype(I, /obj/item/stack/ore/coal))
			reagents.add_reagent("carbon",3)
			if (I.amount>1)
				I.amount -= 1
			else
				qdel(I)
			return
		else if (istype(I, /obj/item/stack/ore/charcoal))
			reagents.add_reagent("carbon",3)
			if (I.amount>1)
				I.amount -= 1
			else
				qdel(I)
			return
		else if (istype(I, /obj/item/weapon/reagent_containers/food/snacks/poo))
			var/obj/item/weapon/reagent_containers/food/snacks/poo/P = I
			P.reagents.trans_to(src, 10, 1, FALSE)
			qdel(I)
			return
	else
		to_chat(user, "[src]满了!")
	..()

/obj/item/weapon/reagent_containers/glass/proc/update_name_label(mob/user)
	var/tmp_label = sanitizeSafe(input(user, "Enter a label for [base_name]", "Label", label_text), MAX_NAME_LEN)
	if (length(tmp_label) > 15)
		to_chat(user, "<span class='notice'>标签最多只能有15个字符长。</span>")
	else
		to_chat(user, "<span class='notice'>你把标签设置为\"[tmp_label]\"。</span>")
		label_text = tmp_label
		playsound(src,'sound/effects/pen.ogg',40,1)
		if (label_text == "")
			name = base_name
		else
			name = "[base_name] ([label_text])"

/obj/item/weapon/reagent_containers/glass/proc/pierced_reagent_lost(var/lost_amount=10)
	//TO DO TODO: glass after piercing must lose max_volume??? and start lose liquids...
	visible_message("<span class = 'warning'>\The [src]被刺穿了!</span>")
	if (reagents)
		if (reagents.total_volume > 0)
			var/part = lost_amount / reagents.total_volume
			for (var/datum/reagent/current in reagents.reagent_list)
				var/amount_to_transfer = current.volume * part
				reagents.remove_reagent(current.id, amount_to_transfer, TRUE)
		if (lost_amount>9)
			new/obj/effect/decal/cleanable/blood/oil(src.loc) //TO DO TODO: After implemented differents types of oil do differents types there

/obj/item/weapon/reagent_containers/glass/bullet_act(var/obj/item/projectile/proj, def_zone)
	var/can_explode = FALSE
	if (!reagents)
		return ..(proj, def_zone)
	if (reagents.has_reagent("gasoline",10) || reagents.has_reagent("diesel",30) || reagents.has_reagent("biodiesel",30) || reagents.has_reagent("ethanol",10) || reagents.has_reagent("petroleum",40) || reagents.has_reagent("gunpowder",30))
		can_explode = TRUE
	if (!can_explode)
		if (prob(30))
			pierced_reagent_lost(15)
			return TRUE
		else
			return FALSE
	if (istype(proj, /obj/item/projectile/shell))
		var/obj/item/projectile/shell/S = proj
		if (S.atype == "HE")
			if (prob(90))
				visible_message("<span class = 'warning'>\The [src]爆炸了!</span>")
				explosion(loc, 2, 3, 2, 0)
				qdel(src)
			else
				pierced_reagent_lost(15)
		else
			if (prob(20))
				visible_message("<span class = 'warning'>\The [src]爆炸了!</span>")
				explosion(loc, 1, 1, 2, 0)
				qdel(src)
			else if (prob(75))
				pierced_reagent_lost(25)
	else
		if (prob(16))
			visible_message("<span class = 'warning'>\The [src]爆炸了!</span>")
			explosion(loc, 1, 2, 2, 0)
			qdel(src)
		else if (prob(30))
			pierced_reagent_lost(15)
	return TRUE

/obj/item/weapon/reagent_containers/glass/beaker
	name = "烧杯"
	desc = "一个烧杯。"
	icon = 'icons/obj/chemical.dmi'
	unacidable = TRUE
	icon_state = "beaker"
	item_state = "beaker"

/obj/item/weapon/reagent_containers/glass/beaker/New()
	..()
	desc += " Can hold up to [volume] units."

/obj/item/weapon/reagent_containers/glass/beaker/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/update_icon()
	overlays.Cut()
	if (reagents.total_volume)
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]100")
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 9)		filling.icon_state = "[icon_state]-10"
			if (10 to 24) 	filling.icon_state = "[icon_state]10"
			if (25 to 49)	filling.icon_state = "[icon_state]25"
			if (50 to 74)	filling.icon_state = "[icon_state]50"
			if (75 to 79)	filling.icon_state = "[icon_state]75"
			if (80 to 90)	filling.icon_state = "[icon_state]80"
			else			filling.icon_state = "[icon_state]100"
		filling.color = reagents.get_color()
		overlays += filling
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/weapon/reagent_containers/glass/beaker/large
	name = "大烧杯"
	desc = "一个大烧杯。"
	icon_state = "beakerlarge"
	volume = 120
	possible_transfer_amounts = list(5,10,15,25,30,60,120)

/obj/item/weapon/reagent_containers/glass/beaker/vial
	name = "小瓶"
	desc = "一个小玻璃瓶。"
	icon_state = "vial"
	volume = 30
	possible_transfer_amounts = list(5,10,15,25,30)

/obj/item/weapon/reagent_containers/glass/bucket
	name = "水桶"
	desc = "这是一个水桶。"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "bucket"
	item_state = "bucket"
	w_class = ITEM_SIZE_NORMAL
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(10,20,30,60,120)
	volume = 120
	flammable = TRUE

/obj/item/weapon/reagent_containers/glass/bucket/steel
	name = "钢桶"
	desc = "这是一个水桶。"
	icon_state = "steel_bucket"
	item_state = "steel_bucket"
	volume = 150
	flammable = FALSE

/obj/item/weapon/reagent_containers/glass/bucket/attackby(var/obj/D, mob/user as mob)
	if (istype(D, /obj/item/weapon/mop))
		if (reagents.total_volume < 1)
			to_chat(user, "<span class='warning'>\The [src]是空的!</span>")
		else
			reagents.trans_to_obj(D, 5)
			to_chat(user, "<span class='notice'>你把\the [D]浸湿在\the [src]中。</span>")
			playsound(loc, 'sound/effects/slosh.ogg', 25, TRUE)
		return
	..(D, user)

/obj/item/weapon/reagent_containers/glass/bucket/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/glass/bucket/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid
	else
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]100")
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 69)	filling.icon_state = "[icon_state]-70"
			if (69 to 77)	filling.icon_state = "[icon_state]75"
			if (77 to 90)	filling.icon_state = "[icon_state]85"
			else			filling.icon_state = "[icon_state]100"
		filling.color = reagents.get_color()
		overlays += filling

/obj/item/weapon/reagent_containers/glass/small_pot
	desc = "一个小锡壶。"
	name = "小锡壶"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "small_pot"
	item_state = "bucket" //TODO: need be checked
	w_class = ITEM_SIZE_NORMAL
	possible_transfer_amounts = list(10,20)
	volume = 80
	var/on_stove = FALSE
	New()
		..()
		flags |= CONDUCT

/obj/item/weapon/reagent_containers/glass/small_pot/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/glass/small_pot/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid
	else
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]100")
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 54)	filling.icon_state = "[icon_state]-55"
			if (54 to 64)	filling.icon_state = "[icon_state]60"
			if (64 to 74)	filling.icon_state = "[icon_state]70"
			if (74 to 83)	filling.icon_state = "[icon_state]80"
			if (83 to 92)	filling.icon_state = "[icon_state]90"
			else			filling.icon_state = "[icon_state]100"
		filling.color = reagents.get_color()
		overlays += filling

/obj/item/weapon/reagent_containers/glass/small_pot/hangou
	desc = "一种可追溯到明治时代、被军队使用的日式壶。"
	name = "饭盒"
	icon_state = "han_gou_open"
	item_state = "bucket" //TODO: need be checked
	possible_transfer_amounts = list(10,20,30,80)

/obj/item/weapon/reagent_containers/glass/small_pot/hangou/update_icon()
	if (!is_open_container())
		overlays.Cut()
		icon_state = "lid_han_gou"
	else
		icon_state = "han_gou_open"
		..()

/obj/item/weapon/reagent_containers/glass/small_pot/copper_small
	desc = "一个小铜壶。"
	name = "小铜壶"
	icon_state = "copperpot1"
	item_state = "bucket" //TODO: need be checked
	volume = 90

/obj/item/weapon/reagent_containers/glass/small_pot/copper_large
	desc = "一个大铜壶。"
	name = "大铜壶"
	icon_state = "copperpot2"
	item_state = "bucket" //TODO: need be checked
	w_class = ITEM_SIZE_LARGE
	volume = 160

/obj/item/weapon/reagent_containers/glass/small_pot/clay
	name = "陶土锅"
	desc = "一种原始的陶土锅,专门设计用于烧水和盛放液体。"
	icon = 'icons/obj/claystuff.dmi'
	icon_state = "cookingpot"
	item_state = "bucket" //TODO: need be checked
	volume = 40
	New()
		..()
		flags &= ~CONDUCT

/* //No entryes of it now. Is it need?
/obj/item/weapon/reagent_containers/glass/fermenterbarrel
	desc = "A fermenter barrel, use it to make alcoholic drinks like ale, beer and cider."
	name = "fermenter barrel"
	icon = 'icons/obj/barrel.dmi'
	icon_state = "wood_barrel1" //no sprite! re-check if reimplement back!!!
	item_state = "bucket"
	w_class = ITEM_SIZE_LARGE
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(10,20,30,60,120)
	volume = 150
	density = TRUE
*/

/obj/item/weapon/reagent_containers/glass/barrel
	name = "木桶"
	desc = "一个木桶。你可以把液体装进去。"
	icon = 'icons/obj/barrel.dmi'
	icon_state = "barrel_wood"
	//item_state = ???? TO DO TODO or check
	w_class = ITEM_SIZE_LARGE
	volume = 250
	throw_speed = 1
	throw_range = 1
	density = TRUE
	nothrow = TRUE

/obj/item/weapon/reagent_containers/glass/barrel/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/glass/barrel/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid
	else
		var/image/filling = image(icon, src, "[icon_state]100")
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 88.1)	filling.icon_state = "[icon_state]0"
			if (88.1 to 91.5)	filling.icon_state = "[icon_state]90"
			if (91.5 to 94.9)	filling.icon_state = "[icon_state]93"
			if (94.9 to 98.3)	filling.icon_state = "[icon_state]97"
			else			filling.icon_state = "[icon_state]100"
		filling.color = reagents.get_color()
		overlays += filling

/obj/item/weapon/reagent_containers/glass/barrel/water
	name = "木桶(饮用水)"
	label_text = "drinking water"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("water",250)

/obj/item/weapon/reagent_containers/glass/barrel/beer
	name = "木桶(啤酒)"
	label_text = "beer"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("beer",250)

/obj/item/weapon/reagent_containers/glass/barrel/ale
	name = "木桶(麦芽酒)"
	label_text = "ale"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("ale",250)

/obj/item/weapon/reagent_containers/glass/barrel/rum
	name = "木桶(朗姆酒)"
	label_text = "rum"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("rum",250)

/obj/item/weapon/reagent_containers/glass/barrel/whiskey
	name = "木桶(威士忌)"
	label_text = "whiskey"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("whiskey",250)

/obj/item/weapon/reagent_containers/glass/barrel/tequila
	name = "木桶(龙舌兰酒)"
	label_text = "tequila"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("tequila",250)

/obj/item/weapon/reagent_containers/glass/barrel/gin
	name = "木桶(金酒)"
	label_text = "gin"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("gin",250)

/obj/item/weapon/reagent_containers/glass/barrel/vodka
	name = "木桶(伏特加)"
	label_text = "vodka"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("vodka",250)

/obj/item/weapon/reagent_containers/glass/barrel/cognac
	name = "木桶(干邑)"
	label_text = "cognac"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("cognac",250)

/obj/item/weapon/reagent_containers/glass/barrel/wine
	name = "木桶(葡萄酒)"
	label_text = "wine"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("wine",250)

/obj/item/weapon/reagent_containers/glass/barrel/tea
	name = "木桶(茶)"
	label_text = "tea"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("tea",250)

/obj/item/weapon/reagent_containers/glass/barrel/oil
	name = "木桶(石油)"
	label_text = "petroleum"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("petroleum",250)

/obj/item/weapon/reagent_containers/glass/barrel/olive_oil
	name = "木桶(橄榄油)"
	label_text = "olive oil"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("olive_oil",250)

/obj/item/weapon/reagent_containers/glass/barrel/fat_oil
	name = "木桶(油脂)"
	label_text = "fat oil"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("fat_oil",250)

/obj/item/weapon/reagent_containers/glass/barrel/ethanol
	name = "木桶(乙醇)"
	label_text = "ethanol"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "wood barrel"
		reagents.add_reagent("pethanol",250)

/obj/item/weapon/reagent_containers/glass/barrel/modern
	name = "钢桶"
	desc = "一个钢桶.你可以把液体装进去."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "barrel"
	//item_state = ???? TO DO TODO or check
	volume = 350
	density = TRUE
	New()
		..()
		flags |= CONDUCT

/obj/item/weapon/reagent_containers/glass/barrel/modern/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid
	else
		var/image/filling = image(icon, src, "[icon_state]85")
		if (!reagents)
			return
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 85)	filling.icon_state = "[icon_state]-85"
			else			filling.icon_state = "[icon_state]85"
		filling.color = reagents.get_color()
		overlays += filling

/obj/item/weapon/reagent_containers/glass/barrel/modern/water
	name = "钢桶(饮用水)"
	label_text = "drinking water"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("water",350)

//////////yellow barrel/////////////////////////
/obj/item/weapon/reagent_containers/glass/barrel/modern/yellow
	name = "黄色钢桶"
	desc = "一个黄色钢桶.你可以把液体装进去."
	icon = 'icons/obj/modern_structures.dmi'
	icon_state = "barreln"
	//item_state = ???? TO DO TODO or check
	volume = 350
	density = TRUE

//////////Galactic Battles//////////////////////

/obj/item/weapon/reagent_containers/glass/barrel/modern/bmilk
	name = "钢桶(蓝色牛奶)"
	label_text = "blue milk"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("bmilk",350)

////////////////////////////////////////////////////////////////////////

/obj/item/weapon/reagent_containers/glass/barrel/modern/oil
	name = "钢桶(石油)"
	label_text = "petroleum"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("petroleum",350)

/obj/item/weapon/reagent_containers/glass/barrel/modern/gasoline
	name = "钢桶(汽油)"
	label_text = "gasoline"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("gasoline",350)

/obj/item/weapon/reagent_containers/glass/barrel/modern/diesel
	name = "钢桶(柴油)"
	label_text = "diesel"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("diesel",250)

/obj/item/weapon/reagent_containers/glass/barrel/modern/diesel/low
	name = "钢桶(柴油)"
	label_text = "diesel"
	New()
		..()
		base_name = "steel barrel"
		reagents.add_reagent("diesel",30)

/obj/item/weapon/reagent_containers/glass/barrel/modern/biodiesel
	name = "钢桶(生物柴油)"
	label_text = "biodiesel"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("biodiesel",350)

/obj/item/weapon/reagent_containers/glass/barrel/modern/sterilizine
	name = "钢桶(消毒剂)"
	label_text = "sterilizine"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("sterilizine", volume * 0.66)
		reagents.add_reagent("cleaner", volume * 0.34)

/obj/item/weapon/reagent_containers/glass/barrel/modern/ethanol
	name = "钢桶(乙醇)"
	label_text = "ethanol"
	New()
		..()
		flags &= ~OPENCONTAINER
		base_name = "steel barrel"
		reagents.add_reagent("pethanol",350)

/obj/item/weapon/reagent_containers/glass/barrel/jerrycan
	name = "油桶"
	desc = "一个钢制油桶.适合运输燃料."
	icon = 'icons/obj/barrel.dmi'
	icon_state = "jerrycan"
	amount_per_transfer_from_this = 30
	volume = 150
	density = FALSE
	New()
		..()
		flags &= ~OPENCONTAINER
		flags |= CONDUCT

/obj/item/weapon/reagent_containers/glass/barrel/jerrycan/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/weapon/reagent_containers/glass/barrel/jerrycan/gasoline/
	name = "油桶(汽油)"
	label_text = "gasoline"
	New()
		..()
		base_name = "jerrycan"
		reagents.add_reagent("gasoline",150)

/obj/item/weapon/reagent_containers/glass/barrel/jerrycan/diesel
	name = "油桶(柴油)"
	label_text = "diesel"
	New()
		..()
		base_name = "jerrycan"
		reagents.add_reagent("diesel",150)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank
	name = "大型燃料箱"
	desc = "一个金属燃料箱.用于连接到发动机并为其供应燃料."
	icon = 'icons/obj/vehicles/vehicleparts.dmi'
	icon_state = "fueltank_large"
	volume = 250
	density = TRUE

	New()
		..()
		flags |= OPENCONTAINER
		flags |= CONDUCT

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/update_icon()
	overlays.Cut()
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_fueltank")
		overlays += lid
	else
		var/image/filling = image(icon, src, "full_fueltank")
		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if (0 to 5)		filling.icon_state = "empty_fueltank"
			else			filling.icon_state = "full_fueltank"
		filling.color = reagents.get_color()
		overlays += filling

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/small
	name = "小型燃料箱"
	icon_state = "fueltank_small"
	volume = 120

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/bike25
	name = "25u摩托车燃料箱"
	icon_state = "fueltank_bike"
	volume = 25

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/bike
	name = "50u摩托车燃料箱"
	icon_state = "fueltank_bike"
	volume = 50

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/bike/full
	New()
		..()
		reagents.add_reagent("gasoline",50)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/bike75
	name = "75u摩托车燃料箱"
	icon_state = "fueltank_bike"
	volume = 75

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank
	name = "巨型燃料箱"
	icon_state = "fueltank_large_tank"
	volume = 450

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/highcap
	name = "高容量燃料箱"
	icon_state = "fueltank_large_tank"
	volume = 550

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/highcap/fueleddiesel
	density = 0
	New()
		..()
		reagents.add_reagent("diesel",550)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/highcap/fueledgasoline
	density = 0
	New()
		..()
		reagents.add_reagent("gasoline",550)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/fueleddiesel
	density = 0
	New()
		..()
		reagents.add_reagent("diesel",450)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/fueledgasoline
	density = 0
	New()
		..()
		reagents.add_reagent("gasoline",450)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/tank/fueledethanol
	density = 0
	New()
		..()
		reagents.add_reagent("pethanol",450)


/obj/item/weapon/reagent_containers/glass/barrel/fueltank/smalltank
	name = "中型燃料箱"
	icon_state = "fueltank_small_tank"
	volume = 180

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/smalltank/fueledgasoline
	density = 0
	New()
		..()
		reagents.add_reagent("gasoline",180)

/obj/item/weapon/reagent_containers/glass/barrel/fueltank/smalltank/fueleddiesel
	density = 0
	New()
		..()
		reagents.add_reagent("diesel",180)

/obj/item/weapon/reagent_containers/glass/barrel/gunpowder
	//TO DO TODO: REWORK IT'S BUGGY THING LATER!!!
	name = "火药桶"
	desc = "一桶火药.别把它点着了."
	icon_state = "barrel_wood_gunpowder"
	New()
		..()
		reagents.add_reagent("gunpowder",200)

/obj/item/weapon/reagent_containers/glass/barrel/gunpowder/bullet_act(var/obj/item/projectile/proj)
	if (proj && !proj.nodamage)
		if (prob(30))
			visible_message("<span class = 'danger'>\The [src]被\the [proj]击中并爆炸了!</span>")
			explode()
			return TRUE
	return FALSE

/obj/item/weapon/reagent_containers/glass/barrel/gunpowder/ex_act()
	explode()

/obj/item/weapon/reagent_containers/glass/barrel/gunpowder/proc/explode()
	if (reagents.total_volume > 500)
		explosion(loc,1,2,4,2)
	else if (reagents.total_volume > 100)
		explosion(loc,0,1,3,1)
	else if (reagents.total_volume > 50)
		explosion(loc,-1,1,2,1)
	if (src) qdel(src)

/obj/item/weapon/reagent_containers/glass/barrel/gunpowder/fire_act(temperature)
	if (temperature > T0C+500)
		explode()
	return ..()

/obj/item/weapon/reagent_containers/glass/extraction_kit
	//TO DO TO DO: Unify to one procedure all using of extraction kit
	//             Add restart process (by atack_self if not empty)
	name = "提取套件"
	desc = "一套用于从原矿中提取元素的专业套件."
	icon_state = "extraction_kit"
	amount_per_transfer_from_this = 5
	volume = 5
	possible_transfer_amounts = list(5)
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_WEAK
	New()
		..()
		flags |= CONDUCT

/obj/item/weapon/reagent_containers/glass/extraction_kit/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/glass/extraction_kit/update_icon()
	overlays.Cut()
	if (reagents.total_volume)
		var/image/filling = image(icon, src, "[icon_state]_full")
		filling.color = reagents.get_color()
		overlays += filling
	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/weapon/analyser
	name = "分析仪"
	desc = "一台电子分析仪,用于检查化学混合物的成分."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "spectrometer"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT|SLOT_ID|SLOT_POCKET
	flammable = TRUE
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_WEAK
	New()
		..()
		flags |= CONDUCT

/obj/item/weapon/analyser/afterattack(obj/M, mob/user)
	if (istype(M, /obj/item/weapon/reagent_containers))
		var/obj/item/weapon/reagent_containers/RG = M
		to_chat(user, "<font color='yellow'><big><b>检测到试剂:</b></big></font>")
		for(var/i=1 to RG.reagents.reagent_list.len)
			to_chat(user, "<font color='yellow'><i><b>[RG.reagents.reagent_list[i].name]: </b>[RG.reagents.reagent_list[i].volume]单位</i></font>")
