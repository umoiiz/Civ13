/////////////////////////////////////////////////
////////////////////PEMMICAN/////////////////////
/////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/snacks/pemmican
	name = "肉糜饼"
	desc = "一种干肉与融化脂肪混合制成的糊状物."
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "pemmican"
	center_of_mass = list("x"=17, "y"=18)
	nutriment_amt = 6
	nutriment_desc = list("salt" = 3, "animal fat" = 2, "meat" = 2)
	non_vegetarian = TRUE
	decay = 180*900 //50% more than the dried meat
	satisfaction = 4 //double than the dried meat
	New()
		..()
		pixel_x = rand(-8, 8)
		pixel_y = rand(-8, 8)
		bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/driedmeat/minced_driedmeat //Dried meat, basically
	name = "切碎的干肉"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "minced_driedmeat"

/obj/item/weapon/reagent_containers/food/snacks/driedmeat/minced_driedmeat/attack_self(mob/user)
	if (istype(user.l_hand, /obj/item/weapon/reagent_containers/glass) || istype(user.r_hand, /obj/item/weapon/reagent_containers/glass))
		var/obj/item/weapon/reagent_containers/glass/G
		if(istype(user.l_hand, /obj/item/weapon/reagent_containers/glass))
			G  = user.l_hand
		else
			G  = user.r_hand
		if (G.reagents.get_reagent_amount("fat_oil") >= 5)
			if(do_after(user, 90))
				user.visible_message(SPAN_NOTICE("[user.name] pours the [src.name] into the [G.name], mixing it."), SPAN_NOTICE("You pour the [src.name] into \the [G.name], mixing it."))
				G.reagents.remove_reagent("fat_oil", 5)
				new/obj/item/weapon/reagent_containers/food/snacks/pemmican(user.loc)
				qdel(src)
				return
	else
		return ..()

/////////////////////////////////////////////////
                 ///PIGLEGS///
/////////////////////////////////////////////////

/obj/item/weapon/pigleg
	name = "生火腿"
	desc = "一条生的、带血猪腿."
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "bloody_ham"
	force = WEAPON_FORCE_WEAK+5
	flags = FALSE
	throw_range = 2
	w_class = ITEM_SIZE_LARGE
	flammable = TRUE
	var/bloody = TRUE
	var/ready = FALSE
	var/salted = FALSE
	var/slices = 5

/obj/item/weapon/pigleg/bloodless
	bloody = FALSE
	name = "无血生火腿"
	desc = "一条生的、无血猪腿."
	icon_state = "no_blood_ham"

/obj/item/weapon/pigleg/salted
	bloody = FALSE
	name = "腌火腿"
	desc = "一条腌制但未干燥的猪腿."
	icon_state = "salted_ham"
	salted = TRUE

/obj/item/weapon/pigleg/salted/dried
	name = "干火腿"
	desc = "一条干燥、即食的火腿. 美味!"
	icon_state = "dried_ham"
	ready = TRUE

/obj/item/weapon/pigleg/salted/dried/packaged
	name = "包装火腿"
	desc = "一条干燥、即食的火腿,包裹在保护壳中. 美味!"
	icon_state = "labeled_ham"

/obj/item/weapon/pigleg/attackby(var/obj/item/W as obj, var/mob/living/human/user as mob)
	if (slices<=0)
		qdel(src)
	if (istype(W, /obj/item/weapon/material/kitchen/utensil/knife) && slices>0 && ready)
		to_chat(user, SPAN_NOTICE("You carefully cut a thin ham slice from the ham."))
		slices--
		new/obj/item/weapon/reagent_containers/food/snacks/curedham(user.loc)
		if (slices<=0)
			qdel(src)
		return
	else if (istype(W, /obj/item/weapon/hammer) && bloody)
		to_chat(user, SPAN_NOTICE("You start beating the ham with the hammer..."))
		if (do_after(user, 100, src))
			to_chat(user, SPAN_NOTICE("You finish beating the ham with the hammer, removing the blood."))
			bloody = FALSE
			name = "bloodless raw ham"
			desc = "A raw, bloodless pork leg."
			icon_state = "no_blood_ham"
			return
	..()

/////////////////////////////////////////////////
           ///SALTING CONTAINER///
/////////////////////////////////////////////////

/obj/structure/salting_container
	name = "腌制容器"
	desc = "一个木制容器,用于腌制食物以保存。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "salting_container"
	flammable = TRUE
	anchored = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/producttype = null
	var/producttype_name = "ham"
	var/max_capacity = 3
	var/saltamount = 0
	var/salting = FALSE

/obj/item/weapon/reagent_containers/food/snacks/curedham
	name = "腌制火腿片"
	desc = "美味的伊比利亚风味火腿。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "ham_ready_to_eat"
	trash = null
	filling_color = null
	nutriment_desc = list("cured meat" = 4)
	satisfaction = 10
	nutriment_amt = 2
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 4)
		bitesize = 2

/obj/structure/salting_container/attackby(var/obj/item/W as obj, var/mob/living/human/user as mob)
	if (salting)
		to_chat(user, SPAN_WARNING("The salting container is full!"))
		return
	if (istype(W, /obj/item/weapon/reagent_containers/food/condiment/saltpile) && contents.len <= max_capacity)
		if(!contents.len)
			to_chat(user, SPAN_WARNING("Add some product first!"))
			return
		if (saltamount < 30)
			user.visible_message(SPAN_NOTICE("[user] adds salt to the container."), "你将[pick("drop", "throw", "lightly throw", "sprinkle")]\the [W]放入容器中。")
			saltamount += W.reagents.get_reagent_amount("sodiumchloride")
			qdel(W)
			if (saltamount >= 30)
				visible_message(SPAN_WARNING("The salting container is now full."))
				icon_state = "salting_container_processing"
				salting = TRUE
				salting()
			return
	if (!producttype && !contents.len)
		if (istype(W, /obj/item/weapon/pigleg))
			user.drop_from_inventory(W, src, FALSE)
			W.forceMove(src)
			max_capacity = 3
			producttype = W.type
			producttype_name = "ham"
			user.visible_message(SPAN_NOTICE("[user] adds \the [W] to the salting container"), SPAN_NOTICE("You add \the [W] to the salting container."))
			icon_state = "salting_container_[producttype_name]_[contents.len]"
			return
		else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawfish/cod))
			user.drop_from_inventory(W, src, FALSE)
			W.forceMove(src)
			max_capacity = 3
			producttype = W.type
			producttype_name = "cod"
			user.visible_message(SPAN_NOTICE("[user] adds \the [W] to the salting container"), SPAN_NOTICE("You add \the [W] to the salting container."))
			icon_state = "salting_container_[producttype_name]_[contents.len]"
			return
		else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/sausage))
			user.drop_from_inventory(W, src, FALSE)
			W.forceMove(src)
			max_capacity = 5
			producttype = W.type
			producttype_name = "sausage"
			user.visible_message(SPAN_NOTICE("[user] adds \the [W] to the salting container"), SPAN_NOTICE("You add \the [W] to the salting container."))
			icon_state = "salting_container_[producttype_name]_[contents.len]"
			return
	else if (producttype == W.type && contents.len < max_capacity && !salting)
		user.drop_from_inventory(W, src, FALSE)
		W.forceMove(src)
		user.visible_message(SPAN_NOTICE("[user] adds \the [W] to the salting container"), SPAN_NOTICE("You add \the [W] to the salting container."))
		icon_state = "salting_container_[producttype_name]_[contents.len]"
		return
	else if (producttype == W.type && contents.len >= max_capacity)
		to_chat(user, SPAN_WARNING("You can't add any more of \the [W] to the container."))
		return
	else if (producttype != W.type)
		to_chat(user, SPAN_WARNING("You can't add a different product!"))
		return
	else
		..()

/obj/structure/salting_container/proc/salting()
	spawn(rand(2900,3600))
		salting = FALSE
		icon_state = "salting_container"
		switch(contents.len)
			if(1)
				visible_message(SPAN_NOTICE("The product inside the salting container swells up and fully salts."))
			else
				visible_message(SPAN_NOTICE("The products in the salting container swell up and fully salt."))
		saltamount = 0 // TODO: RE-work the system to remove intervals of '10' depending on how much product is loaded, and then attack_hand() to begin the salting process, time to salt would depend by product.
		var/amt = contents.len
		for (var/obj/item/I in contents)
			qdel(I)	// Clear the contents list.
		for(var/i = 1 to amt)
			if(producttype_name == "ham")
				new /obj/item/weapon/pigleg/salted(loc)
			else if(producttype_name == "cod")
				new /obj/item/weapon/reagent_containers/food/snacks/rawfish/cod/salted(loc)
			else if(producttype_name == "sausage")
				new /obj/item/weapon/reagent_containers/food/snacks/sausage/salted(loc)
		producttype = null // Reset the product type variable to allow the next cycle of salting.

///////////////////////////////LARGE/DEHYDRATOR///////////////////////////////
/obj/structure/drying_rack
	name = "晾晒架"
	desc = "一个大型铁制晾晒架,用于晾晒火腿和其他食品。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "drying_rack"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/producttype = null
	var/producttype_name = "ham"
	var/filled = 0
	var/max_capacity = 3
	var/drying = FALSE

/obj/structure/drying_rack/attackby(var/obj/item/stack/W as obj, var/mob/living/human/H as mob)
	if (filled >= max_capacity)
		to_chat(H, SPAN_WARNING("\The [src] is full!"))
		return
	if (filled == 0 || istype(W, producttype))
		if (istype(W, /obj/item/weapon/pigleg) && filled < max_capacity)
			var/obj/item/weapon/pigleg/P = W
			if (P.salted && !P.bloody && !P.ready)
				max_capacity = 3
				H.visible_message(
					"<span class='notice'>你可以看到[H.name]挂在\the [W.name]上晾晒。</span>",
					"<span class='notice'>你将\the [W.name]挂起来晾晒。")
				producttype_name = "ham"
				producttype = /obj/item/weapon/pigleg
				filled += 1
				icon_state = "drying_rack_[producttype_name]_[filled]"
				qdel(W)
				dry_obj(producttype)
				return
		if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/sausage/salted))
			max_capacity = 5
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]挂在\the [W.name]上晾晒。</span>",
				"<span class='notice'>你将\the [W.name]挂起来晾晒。")
			producttype_name = "salami"
			producttype = /obj/item/weapon/reagent_containers/food/snacks/sausage/salted
			filled += 1
			icon_state = "drying_rack_[producttype_name]_[filled]"
			qdel(W)
			dry_obj(producttype)
			return
	else if (!istype(W, producttype) && filled > 0)
		to_chat(H, SPAN_WARNING("You can't dry this at the same time as \the [producttype_name]."))
		return
	else if (filled == 0)
		if (istype(W, /obj/item/weapon/pigleg))
			var/obj/item/weapon/pigleg/P = W
			if (P.salted && !P.bloody && !P.ready)
				max_capacity = 3
				H.visible_message(
					"<span class='notice'>你可以看到[H.name]挂在\the [W.name]上晾晒。</span>",
					"<span class='notice'>你将\the [W.name]挂起来晾晒。")
				producttype_name = "ham"
				producttype = /obj/item/weapon/pigleg
				filled += 1
				icon_state = "drying_rack_[producttype_name]_[filled]"
				qdel(W)
				dry_obj(producttype)
				return
		if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/sausage/salted))
			max_capacity = 5
			H.visible_message(
				"<span class='notice'>你可以看到[H.name]挂在\the [W.name]上晾晒。</span>",
				"<span class='notice'>你将\the [W.name]挂起来晾晒。")
			producttype_name = "salami"
			producttype = /obj/item/weapon/reagent_containers/food/snacks/sausage/salted
			filled += 1
			icon_state = "drying_rack_[producttype_name]_[filled]"
			qdel(W)
			dry_obj(producttype)
			return
/obj/structure/drying_rack/proc/dry_obj(var/obj_type = null)
	spawn(1500) //2.5 minutes or so.
		if (obj_type == /obj/item/weapon/reagent_containers/food/snacks/sausage/salted)
			if (isturf(src.loc))
				new/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami(src.loc)
			visible_message("[producttype_name]晾晒完成了。")
			filled -= 1
			if (filled)
				icon_state = "drying_rack_[producttype_name]_[filled]"
			else
				icon_state = "drying_rack"
			return
	spawn(12000) //20 minutes
		if (!src || !loc)
			return
		if (obj_type == /obj/item/weapon/pigleg)
			if (isturf(src.loc))
				new/obj/item/weapon/pigleg/salted/dried(src.loc)
			visible_message("[producttype_name]晾晒完成了。")
			filled -= 1
			if (filled)
				icon_state = "drying_rack_[producttype_name]_[filled]"
			else
				icon_state = "drying_rack"
			return
/////////////////////////////////////////////////
//////////////////////CHICKEN////////////////////
/////////////////////////////////////////////////

/obj/item/weapon/chicken_carcass
	name = "鸡胴体"
	desc = "一整只鸡。"
	icon = 'icons/obj/food/chicken.dmi'
	icon_state = "chicken_carcass"
	force = WEAPON_FORCE_WEAK
	throw_range = 2
	w_class = ITEM_SIZE_NORMAL
	flammable = TRUE
	var/rotten = FALSE
	flags = FALSE

/obj/item/weapon/chicken_carcass/New()
	..()
	spawn(3000) //5 minutes
		icon_state = "rotten_[icon_state]"
		name = "rotten [name]"
		rotten = TRUE
		spawn(1000)
			if (isturf(loc) && prob(30))
				var/scavengerspawn = rand(1,3)
				if(scavengerspawn ==  1)
					new/mob/living/simple_animal/mouse(get_turf(src))
				else if(scavengerspawn ==  2)
					new/mob/living/simple_animal/cockroach(get_turf(src))
				else
					new/mob/living/simple_animal/fly(get_turf(src))
		spawn(3600)
			qdel(src)

/obj/item/weapon/chicken_carcass/attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)
	if (istype(W, /obj/item/weapon/material/kitchen/utensil/knife) && !rotten)
		to_chat(user, "你开始分解鸡肉...")
		if (do_after(user, 75, src))
			to_chat(user, "你切好了鸡肉。")
			new/obj/item/weapon/reagent_containers/food/snacks/chicken/breast(loc)
			new/obj/item/weapon/reagent_containers/food/snacks/chicken/wing(loc)
			new/obj/item/weapon/reagent_containers/food/snacks/chicken/drumstick(loc)
			qdel(src)
		return
	..()
/obj/item/weapon/reagent_containers/food/snacks/chicken
	name = "鸡部位"
	icon = 'icons/obj/food/chicken.dmi'
	desc = "一块大鸡胸肉。"
	icon_state = "chicken_breast"
	health = 180
	filling_color = "#E7B7B4"
	raw = TRUE
	rotten_icon_state = "rotten_chicken_breast"
	rots = TRUE
	non_vegetarian = TRUE
	decay = 15*600
	New()
		..()
		reagents.add_reagent("protein", 3)
	bitesize = 3
	satisfaction = -3

/obj/item/weapon/reagent_containers/food/snacks/chicken/breast
	name = "鸡胸肉"
	desc = "一块大鸡胸肉。"
	icon_state = "chicken_breast"
	rotten_icon_state = "rotten_chicken_breast"

	attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)
		if (istype(W, /obj/item/weapon/hammer) && !findtext(icon_state, "flat") && !rotten)
			to_chat(user, "你开始拍平鸡胸肉...")
			if (do_after(user, 50, src))
				to_chat(user, "你拍平了鸡胸肉。")
				name = "拍平的鸡胸肉"
				icon_state = "chicken_breast_flat"
			return
		else if (istype(W, /obj/item/weapon/reagent_containers/food/condiment/flour) && !rotten && !findtext(icon_state, "crumbed") && findtext(icon_state, "flat"))
			var/obj/item/weapon/reagent_containers/food/condiment/flour/F = W
			if (F.reagents.has_reagent("flour", 5))
				F.reagents.remove_reagent("flour", 5)
			to_chat(user, "你将\the [src]裹上面粉。")
			satisfaction = -4
			icon_state = "[icon_state]_crumbed"
			name = "裹粉的[name]"
			return
		..()
/obj/item/weapon/reagent_containers/food/snacks/chicken/wing
	name = "鸡翅"
	desc = "一只鸡翅。"
	icon_state = "chicken_wing"
	bitesize = 2
	satisfaction = -2
	rotten_icon_state = "rotten_chicken_wing"

	New()
		..()
		reagents.remove_reagent("protein", 2)
	attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)

		if (istype(W, /obj/item/weapon/reagent_containers/food/condiment/flour) && !rotten && !findtext(icon_state, "crumbed"))
			var/obj/item/weapon/reagent_containers/food/condiment/flour/F = W
			if (F.reagents.has_reagent("flour", 5))
				F.reagents.remove_reagent("flour", 5)
			to_chat(user, "你将\the [src]裹上面粉。")
			icon_state = "[icon_state]_crumbed"
			name = "裹粉的[name]"
			satisfaction = -3
			return
		..()

/obj/item/weapon/reagent_containers/food/snacks/chicken/drumstick
	name = "鸡腿"
	desc = "一只鸡腿。"
	icon_state = "chicken_drumstick"
	bitesize = 2
	satisfaction = -2
	rotten_icon_state = "rotten_chicken_drumstick"
	New()
		..()
		reagents.remove_reagent("protein", 2)

	attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)
		if (istype(W, /obj/item/weapon/reagent_containers/food/condiment/flour) && !rotten && !findtext(icon_state, "crumbed"))
			var/obj/item/weapon/reagent_containers/food/condiment/flour/F = W
			if (F.reagents.has_reagent("flour", 5))
				F.reagents.remove_reagent("flour", 5)
			to_chat(user, "你将\the [src]裹上面粉。")
			satisfaction = -3
			icon_state = "[icon_state]_crumbed"
			name = "裹粉的[name]"
			return
		..()

/////////////////////////////////////////////////
////////////////////SALAMIMIMI///////////////////
/////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/snacks/cow
	icon = 'icons/obj/complex_foods.dmi'
/obj/item/weapon/reagent_containers/food/snacks/pig
	icon = 'icons/obj/complex_foods.dmi'

/obj/item/weapon/reagent_containers/food/snacks/cow/stomach
	name = "牛胃"
	desc = "一个牛胃。"
	icon_state = "cow_stomach"
	bitesize = 1
	satisfaction = -1
	rotten_icon_state = "cow_stomach_rotten"
	raw = TRUE
	rots = TRUE
	non_vegetarian = TRUE
	decay = 15*1000
	New()
		..()
		reagents.add_reagent("protein", 6)

/obj/item/weapon/reagent_containers/food/snacks/pig/stomach
	name = "猪胃"
	desc = "一个猪胃。"
	icon_state = "pig_stomach"
	bitesize = 1
	satisfaction = -1
	rotten_icon_state = "pig_stomach_rotten"
	raw = TRUE
	rots = TRUE
	non_vegetarian = TRUE
	decay = 15*1000
	New()
		..()
		reagents.add_reagent("protein", 4)

//I am just adding it to pig/stomach since it drops less the a big ol' cow/stomach.
/obj/item/weapon/reagent_containers/food/snacks/pig/stomach/goat
	name = "羊胃"
	desc = "一个羊胃。"

/obj/item/weapon/reagent_containers/food/snacks/pig/stomach/sheep
	name = "绵羊胃"
	desc = "一个绵羊胃。"

/obj/item/stack/sausagecasing
	name = "肠衣"
	desc = "由动物胃制成的肠衣,用于装肉。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "sausage_casing"
	force = 0
	throw_range = 1
	w_class = 0.0
	flammable = TRUE

/obj/item/weapon/reagent_containers/food/snacks/cow/stomach/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (!rotten && istype(W,/obj/item/weapon/material/kitchen/utensil/knife))
		new /obj/item/weapon/reagent_containers/food/snacks/tripe(src)
		new /obj/item/weapon/reagent_containers/food/snacks/tripe(src)
		to_chat(user, "你从胃上切下了内衬。")
		if(map.ordinal_age >= 1)
			var/obj/item/stack/sausagecasing/SC = new /obj/item/stack/sausagecasing(src)
			SC.amount = 3
		qdel(src)
	else
		..()
/obj/item/weapon/reagent_containers/food/snacks/pig/stomach/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (!rotten && istype(W,/obj/item/weapon/material/kitchen/utensil/knife))
		new /obj/item/weapon/reagent_containers/food/snacks/tripe(src)
		to_chat(user, "你从胃上切下了内衬。")
		if(map.ordinal_age >= 1)
			var/obj/item/stack/sausagecasing/SC = new /obj/item/stack/sausagecasing(src)
			SC.amount = 2
		qdel(src)
	else
		..()
/obj/item/weapon/reagent_containers/food/snacks/tripe
	name = "肚"
	desc = "胃内衬,美味!"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "tripe"
	bitesize = 1
	raw = FALSE
	rotten_icon_state = "tripe_rotten"
	rots = TRUE
	decay = 15*1200
	satisfaction = -1
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/item/weapon/reagent_containers/food/snacks/sausage
	name = "香肠"
	desc = "装在方便肠衣里的肉。"
	icon_state = "sausage"
	icon = 'icons/obj/complex_foods.dmi'
	bitesize = 4
	raw = TRUE
	rotten_icon_state = "sausage_rotten"
	rots = TRUE
	decay = 16*800
	satisfaction = -3
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/item/weapon/reagent_containers/food/snacks/sausage/bratwurst
	name = "德式香肠"
	desc = "装在稍大肠衣里的德国香肠。"
	icon_state = "bratwurst"
	icon = 'icons/obj/complex_foods.dmi'
	bitesize = 5
	raw = TRUE
	rotten_icon_state = "bratwurst_rotten"
	rots = TRUE
	decay = 16*800
	satisfaction = -2.5
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 4)

/obj/item/weapon/reagent_containers/food/snacks/sausage/salted
	name = "腌香肠"
	desc = "装在方便肠衣里的肉。腌制过的"
	icon_state = "sausage_salted"
	icon = 'icons/obj/complex_foods.dmi'
	bitesize = 4
	raw = TRUE
	rots = FALSE
	satisfaction = -4
	non_vegetarian = TRUE
	decay = 32*800
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/item/stack/sausagecasing/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W,/obj/item/weapon/reagent_containers/food/snacks/mince))
		to_chat(user, "你开始将肉馅灌入肠衣。")
		if (do_after(user, 10))
			to_chat(user, "你将肉馅灌入了肠衣。")
			new /obj/item/weapon/reagent_containers/food/snacks/sausage(user.loc)
			qdel(W)
			src.amount -= 1
			if (src.amount < 1)
				qdel(src)
	else
		..()

/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami
	name = "萨拉米香肠"
	desc = "装在方便肠衣里的肉,经过晾晒和腌制。"
	icon_state = "salami"
	icon = 'icons/obj/complex_foods.dmi'
	bitesize = 4
	raw = FALSE
	rots = FALSE
	satisfaction = 1
	non_vegetarian = TRUE
	decay = 0
	New()
		..()
		reagents.add_reagent("protein", 4)


/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/attackby(var/obj/item/W as obj, var/mob/living/human/user as mob)
	if (istype(W, /obj/item/weapon/material/kitchen/utensil/knife))
		to_chat(user, "你切开了萨拉米香肠。")
		new/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/slice(user.loc)
		new/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/slice(user.loc)
		new/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/slice(user.loc)
		new/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/slice(user.loc)
		qdel(src)
		return

/obj/item/weapon/reagent_containers/food/snacks/sausage/salted/salami/slice
	name = "萨拉米香肠片"
	desc = "装在方便肠衣里的肉,经过晾晒和腌制,切片。"
	icon_state = "salami_slice"
	icon = 'icons/obj/complex_foods.dmi'
	bitesize = 1
	raw = FALSE
	rots = FALSE
	satisfaction = 3
	non_vegetarian = TRUE
	w_class = ITEM_SIZE_TINY
	New()
		..()
		reagents.add_reagent("protein", 1)

/////////////////////////////////////////////////
////////////////////MINCER///////////////////////
/////////////////////////////////////////////////

//Todo: For salami, mincing, and all food in general, transfer reagents between stages.
//Make mincing work similar to how stew does, all ingredients described.

/obj/item/weapon/reagent_containers/food/snacks/mince
	name = "肉馅"
	desc = "混合的肉。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "minced_meat"
	filling_color = "#DB0000"
	bitesize = 2
	raw = TRUE
	rotten_icon_state = "minced_meat_rotten"
	rots = TRUE
	decay = 15*800
	satisfaction = -3
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/item/weapon/reagent_containers/food/snacks/meatball
	name = "肉丸"
	desc = "圆形的肉。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "meatball_raw"
	filling_color = "#DB0000"
	bitesize = 3
	raw = TRUE
	rotten_icon_state = "meatball_rotten"
	rots = TRUE
	decay = 15*800
	satisfaction = -4
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/item/weapon/reagent_containers/food/snacks/patty
	name = "肉饼"
	desc = "圆形的肉。"
	icon_state = "patty_raw"
	icon = 'icons/obj/complex_foods.dmi'
	filling_color = "#DB0000"
	bitesize = 3
	raw = TRUE
	rotten_icon_state = "patty_rotten"
	rots = TRUE
	decay = 15*800
	satisfaction = -4
	non_vegetarian = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)

/obj/structure/meat_grinder
	name = "绞肉机"
	desc = "用于绞肉的工具。"
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "meat_grinder_new"
	var/empty_state = "meat_grinder_new"
	var/full_state = "meat_grinder_new_full"
	var/active_state = "meat_grinder_new_grinding"
	flammable = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/input
	var/output_amount = 0

/obj/structure/meat_grinder/attack_hand(mob/living/human/user as mob)
	if (input != null)
		to_chat(user, "你开始转动摇杆。")
		icon_state = active_state
		if (do_after(user, 35))
			playsound(loc, 'sound/effects/rollermove.ogg', 35, TRUE)
			to_chat(user, "绞肉机挤出了一些肉馅!")
			for(var/i=1, i<=output_amount, i++)
				new /obj/item/weapon/reagent_containers/food/snacks/mince(get_turf(src))
			input = null
			icon_state = empty_state
		else
			icon_state = full_state

/obj/structure/meat_grinder/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(input==null)
		if (istype(W, /obj/item/weapon/pigleg) || istype(W, /obj/item/weapon/chicken_carcass))
			input = W
			output_amount = 4
			icon_state = full_state
			to_chat(user, "你把[W]塞进了[src]里.")
			qdel(W)
			return
		else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat) || istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawfish/) || istype(W, /obj/item/weapon/reagent_containers/food/snacks/chicken))
			input = W
			output_amount = 2
			icon_state = full_state
			to_chat(user, "你把[W]塞进了[src]里.")
			qdel(W)
			return
		else if (istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawcutlet) || istype(W, /obj/item/weapon/reagent_containers/food/snacks/fishfillet))
			input = W
			output_amount = 1
			icon_state = full_state
			to_chat(user, "你把[W]塞进了[src]里.")
			qdel(W)
			return
		else
			..()
	else
		..()

///////////////////////////////////////////
/////////////CUTTING BOARD/////////////////
///////////////////////////////////////////

/obj/structure/cutting_board
	name = "砧板"
	desc = "一块用来准备食物的木板."
	icon = 'icons/obj/complex_foods.dmi'
	icon_state = "cutting_board"
	flammable = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	var/input = null

/obj/structure/cutting_board/attack_hand(var/mob/living/human/H)
	if(input != null)
		if(do_after(H, 20))
			to_chat(H, "你刮掉了砧板上的东西")
			input = null
			icon_state = "cutting_board_dirty"
			return
		else
			to_chat(H, "你停止了刮砧板")
			return
	else if(input == null && icon_state == "cutting_board_dirty")
		if(do_after(H, 15))
			to_chat(H, "你把砧板上所有肮脏的污垢都清理干净")
			icon_state = "cutting_board"
			return
		else
			to_chat(H, "你停止了清理砧板")
			return

/obj/structure/cutting_board/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/kitchen/utensil/knife))
		if(input != null)
			if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/fishfillet) || istype(input, /obj/item/weapon/reagent_containers/food/snacks/rawcutlet))
				to_chat(user, "你开始切碎[input].")
				playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
				if(do_after(user, 180))
					playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
					input = null
					icon_state = "cutting_board_dirty"
					new /obj/item/weapon/reagent_containers/food/snacks/mince(src.loc)
					return
				else
					to_chat(user, "你停止了切碎.")
					return
			else if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/meat) || istype(input, /obj/item/weapon/reagent_containers/food/snacks/rawfish))
				to_chat(user, "你开始切碎[input].")
				playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
				if(do_after(user, 180))
					playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
					input = null
					icon_state = "cutting_board_dirty"
					new /obj/item/weapon/reagent_containers/food/snacks/mince(src.loc)
					new /obj/item/weapon/reagent_containers/food/snacks/mince(src.loc)
					return
				else
					to_chat(user, "你停止了切碎.")
					return
			else if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/mince))
				playsound(loc, 'sound/effects/squishy.ogg', 10, TRUE)
				if(do_after(user, 10))
					playsound(loc, 'sound/effects/squishy.ogg', 10, TRUE)
					to_chat(user, "你把[input]捏成了一个肉丸!")
					input = null
					icon_state = "cutting_board_dirty"
					new /obj/item/weapon/reagent_containers/food/snacks/meatball(src.loc)
					return
				else
					to_chat(user, "你停止了捏[input].")
					return
			else if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/meatball))
				to_chat(user, "你把[input]拍成了一个肉饼!")
				playsound(loc, 'sound/effects/squishy.ogg', 5, TRUE)
				input = null
				icon_state = "cutting_board_dirty"
				new /obj/item/weapon/reagent_containers/food/snacks/patty(src.loc)
				return
			else if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/driedmeat))
				to_chat(user, "你开始切碎[input].")
				playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
				if(do_after(user, 180))
					playsound(loc, 'sound/effects/chop.ogg', 60, TRUE)
					input = null
					icon_state = "cutting_board_dirty"
					new /obj/item/weapon/reagent_containers/food/snacks/driedmeat/minced_driedmeat(src.loc)
					return
			else
				to_chat(user, "你需要往砧板上放点东西!")
				return
	else if(input == null && istype(W, /obj/item/weapon/reagent_containers/food/snacks))
		if(istype(input, /obj/item/weapon/reagent_containers/food/snacks/fishfillet) || istype(input, /obj/item/weapon/reagent_containers/food/snacks/rawcutlet))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_cutlet"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/mince))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_mince"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/mince))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_mince"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meat))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_steak"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/rawfish))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_fish"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/meatball))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_meatball"
			qdel(W)
			return
		else if(istype(W, /obj/item/weapon/reagent_containers/food/snacks/driedmeat))
			input = W
			to_chat(user, "你把[W]放在了砧板上.")
			icon_state = "cutting_board_driedmeat"
			qdel(W)
			return
		else
			to_chat(user, "你不能把那个放在[src]上!")
	else
		..()
	..()
