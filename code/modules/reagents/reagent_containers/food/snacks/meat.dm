#define SEAFOOD_DRY_MODIFIER 19 //temporary it placed here. TO DO - move after categorising snacks to snacks.dm
#define MEAT_DRY_MODIFIER 17 //temporary it placed here. TO DO - move after categorising snacks to snacks.dm
#define SALT_MODIFIER 10 //temporary it placed here. TO DO - move after categorising snacks and reworking salting to snacks.dm
#define DRY_MODIFIER 15 //temporary it placed here. TO DO - move after categorising snacks to snacks.dm
#define GROWN_DRY_MODIFIER 21 //temporary it placed here. TO DO - move after categorising snacks to snacks.dm

/obj/item/weapon/reagent_containers/food/snacks/meat
	name = "肉"
	desc = "一块肉."
	icon_state = "meat"
	health = 180
	filling_color = "#FF1C1C"
	center_of_mass = list("x"=16, "y"=14)
	raw = TRUE
	rotten_icon_state = "rottenmeat"
	rots = TRUE
	non_vegetarian = TRUE
	decay = 15*600
	New()
		..()
		reagents.add_reagent("protein", 5)
		bitesize = 3
	satisfaction = -4
/obj/item/weapon/reagent_containers/food/snacks/meat/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (!roasted && !rotten && (istype(W,/obj/item/weapon/attachment/bayonet)  || istype(W, /obj/item/weapon/material/hatchet) || istype(W,/obj/item/weapon/material/kitchen/utensil/knife)))
		new /obj/item/weapon/reagent_containers/food/snacks/rawcutlet(src)
		new /obj/item/weapon/reagent_containers/food/snacks/rawcutlet(src)
		to_chat(user, "你将肉切成细条.")
		qdel(src)
	else
		..()

// Seperate definitions because some food likes to know if it's human.
// TODO: rewrite kitchen code to check a var on the meat item so we can remove
// all these sybtypes.
/obj/item/weapon/reagent_containers/food/snacks/meat/human
	name = "人肉"
	desc = "尝起来有点像火腿..."
	disgusting = TRUE

/obj/item/weapon/reagent_containers/food/snacks/meat/monkey
	name = "猴肉"
	desc = "尝起来像人肉."

/obj/item/weapon/reagent_containers/food/snacks/meat/turtle
	name = "海龟肉"
	desc = "尝起来像...某种东西."

/obj/item/weapon/reagent_containers/food/snacks/meat/poisonfrog
	name = "毒蛙肉"
	desc = "把它放进炖菜里可能不是个好主意."
	disgusting = TRUE
	var/uses = 4
	New()
		..()
		reagents.add_reagent("food_poisoning", 15)
		reagents.add_reagent("cyanide", 25)

/obj/item/weapon/reagent_containers/food/snacks/meat/poisonfrog/attack_self(mob/user as mob)

	var/obj/item/ammo_casing/CURRENT = null
	if (user.l_hand == src && istype(user.r_hand, /obj/item/ammo_casing/arrow) && uses >= 1)
		CURRENT = user.r_hand
	else if (user.r_hand == src && istype(user.l_hand, /obj/item/ammo_casing/arrow) && uses >= 1)
		CURRENT = user.l_hand
	if (CURRENT)
		if (istype(CURRENT, /obj/item/ammo_casing/arrow))
			to_chat(user, "你将箭浸入毒蛙的皮肤.")
			CURRENT.name = "poisoned arrow"
			CURRENT.icon_state = "arrowp"
			CURRENT.projectile_type = /obj/item/projectile/arrow/arrow/vial
			CURRENT.damtype = TOX
			CURRENT.BB = new/obj/item/projectile/arrow/arrow/vial/poisonous(CURRENT)
			CURRENT.contents = list(CURRENT.BB)
			uses = (uses - 1)
		else if (istype(CURRENT, /obj/item/ammo_casing/bolt))
			to_chat(user, "你将弩箭浸入毒蛙的皮肤.")
			CURRENT.name = "poisoned bolt"
			CURRENT.icon_state = "boltp"
			CURRENT.projectile_type = /obj/item/projectile/arrow/bolt/vial
			CURRENT.damtype = TOX
			CURRENT.BB = new/obj/item/projectile/arrow/bolt/vial/poisonous(CURRENT)
			CURRENT.contents = list(CURRENT.BB)
			uses = (uses - 1)
		return
	else
		return
/obj/item/weapon/reagent_containers/food/snacks/rawfish
	name = "生鱼"
	desc = "一条新鲜的鱼.应该先煮熟."
	icon_state = "rawfish"
	health = 180
	filling_color = "#606060"
	center_of_mass = list("x"=16, "y"=14)
	raw = TRUE
	rotten_icon_state = "rottenfish"
	rots = TRUE
	non_vegetarian = TRUE
	decay = 15*600
	New()
		..()
		reagents.add_reagent("protein", 4)
		reagents.add_reagent("food_poisoning", 1)
		bitesize = 3
	satisfaction = -4

/obj/item/weapon/reagent_containers/food/snacks/rawfish/salmon
	name = "生鲑鱼"
	desc = "一条新鲜的鲑鱼.应该先煮熟."
	icon_state = "salmon"

/obj/item/weapon/reagent_containers/food/snacks/rawfish/cod
	name = "生鳕鱼"
	desc = "一条新鲜的鳕鱼。大概应该先煮熟。"
	icon_state = "cod"
	rotten_icon_state = "rotten_cod"
	rots = TRUE
	New()
		..()
		reagents.add_reagent("protein", 2)
	satisfaction = -6
/obj/item/weapon/reagent_containers/food/snacks/rawfish/cod/salted
	name = "腌鳕鱼"
	desc = "一块腌鳕鱼。"
	icon_state = "salted_cod"
	rotten_icon_state = "salted_cod"
	rots = FALSE
	rotten = FALSE
	decay = 0
	New()
		..()
		reagents.remove_reagent("food_poisoning",1)
	satisfaction = 4
/obj/item/weapon/reagent_containers/food/snacks/rawfish/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (!roasted && !istype(src,/obj/item/weapon/reagent_containers/food/snacks/rawfish/cod) && !rotten && (istype(W,/obj/item/weapon/attachment/bayonet) || istype(W,/obj/item/weapon/material/kitchen/utensil/knife) || istype(W, /obj/item/weapon/material/hatchet)))
		for (var/i=1, i<=3, i++)
			new /obj/item/weapon/reagent_containers/food/snacks/fishfillet(src)
		to_chat(user, "你把鱼切成薄鱼片。")
		qdel(src)
	else
		..()

/obj/item/weapon/reagent_containers/food/snacks/rawfish/salmon/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (!roasted && !rotten && (istype(W,/obj/item/weapon/attachment/bayonet) || istype(W,/obj/item/weapon/material/kitchen/utensil/knife) || istype(W, /obj/item/weapon/material/hatchet)))
		for (var/i=1, i<=3, i++)
			new /obj/item/weapon/reagent_containers/food/snacks/salmonfillet(src)
		to_chat(user, "你把鲑鱼切成薄鱼片。")
		qdel(src)
	else
		..()

/obj/item/weapon/reagent_containers/food/snacks/rawcrab
	name = "蟹肉"
	desc = "新鲜的蟹肉。看起来很好吃。"
	icon_state = "raw_crabmeat"
	health = 180
	filling_color = "#7F0000"
	center_of_mass = list("x"=16, "y"=14)
	raw = TRUE
	rotten_icon_state = "rotraw_crabmeat"
	rots = TRUE
	non_vegetarian = TRUE
	satisfaction = -10
	New()
		..()
		reagents.add_reagent("protein", 4)
		reagents.add_reagent("food_poisoning", 1)
		bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/rawlobster
	name = "龙虾"
	desc = "一只新鲜的龙虾。真美味!"
	icon_state = "lobster_raw"
	health = 180
	filling_color = "#7F0000"
	center_of_mass = list("x"=16, "y"=14)
	raw = TRUE
	rotten_icon_state = "lobster_rottenraw"
	rots = TRUE
	non_vegetarian = TRUE
	satisfaction = -10
	New()
		..()
		reagents.add_reagent("protein", 4)
		reagents.add_reagent("food_poisoning", 1)
		bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/rawlobster/boiled
	name = "煮龙虾"
	desc = "一只煮熟的龙虾。看起来非常美味。"
	icon_state = "lobster_boiled"
	health = 180
	filling_color = "#7F0000"
	center_of_mass = list("x"=16, "y"=14)
	raw = FALSE
	rotten_icon_state = "lobster_rottenboiled"
	rots = TRUE
	non_vegetarian = TRUE
	satisfaction = 25
	New()
		..()
		reagents.remove_reagent("food_poisoning")

/obj/item/weapon/reagent_containers/food/snacks/cockroach
	name = "蟑螂"
	desc = "一只死蟑螂。不,请别让我吃它..."
	icon_state = "cockroach"
	rotten_icon_state = "rotten_cockroach"
	filling_color = "#773B00"
	raw = TRUE
	disgusting = TRUE
	non_vegetarian = TRUE
	satisfaction = -20
	rots = TRUE
	New()
		..()
		reagents.add_reagent("protein", 1)
		reagents.add_reagent("food_poisoning", 1)
		bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/octopus
	name = "章鱼"
	desc = "一只新鲜的章鱼。真美味!"
	icon_state = "purple_octopus"
	filling_color = "#7F0000"
	center_of_mass = list("x"=16, "y"=14)
	raw = TRUE
	rotten_icon_state = "octopus_rotten"
	rots = TRUE
	non_vegetarian = TRUE
	satisfaction = -10
	dried_type = /obj/item/weapon/reagent_containers/food/snacks/octopus/dried
	dry_size = 7
	New()
		..()
		icon_state = pick("purple_octopus", "red_octopus")
		reagents.add_reagent("protein", 1)
		reagents.add_reagent("nutriment", 5, list("seafood"=3))
		reagents.add_reagent("food_poisoning", pick(0,1,1,2)) //25% chance not poison, 50% poison, 25% double poison

/obj/item/weapon/reagent_containers/food/snacks/octopus/dried
	icon = 'icons/obj/food/dryed.dmi'
	name = "干章鱼圈"
	desc = "好零食,去哪儿弄杯啤酒?"
	filling_color = "#9b5a1d"
	center_of_mass = list("x"=16, "y"=16)
	rots = FALSE
	raw = FALSE
	dried_type = null
	satisfaction = 9
	biteamount = 6
	New()
		..()
		icon_state = "octopus_rings"
		reagents.del_reagent("food_poisoning")
		decay *= SEAFOOD_DRY_MODIFIER

/obj/item/weapon/reagent_containers/food/snacks/cracked_shellfish
	name = "敲开的贝类"
	desc = "新鲜的贝类,用刀敲开了。"
	icon_state = "cracked_shellfish"
	health = 30
	filling_color = "#7F0000"
	raw = TRUE
	rotten_icon_state = "cracked_shellfish_rotten"
	rots = TRUE
	non_vegetarian = TRUE
	satisfaction = -4
	decay = 5*600
	New()
		..()
		reagents.add_reagent("protein", 1)
		reagents.add_reagent("food_poisoning", 1)
		bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/animalfat
	name = "动物"
	desc = "这是一块新鲜的生动物脂肪。"
	icon_state = "animalfat"
	health = 100
	filling_color = "#FFF783"
	raw = TRUE
	rotten_icon_state = "rottenanimalfat"
	rots = TRUE
	non_vegetarian = TRUE
	disgusting = TRUE
	decay = 5*600
	New()
		..()
		reagents.add_reagent("lard", 10)
		bitesize = 3
	satisfaction = -7 //Its disgusting raw,

/obj/item/shellfish
	name = "贝类"
	desc = "一只新鲜的、闭合的贝类。你需要一把刀才能打开它。"
	icon_state = "shellfish"
	icon = 'icons/obj/food/food.dmi'

	attackby(obj/item/I, mob/user)
		if (istype(I, /obj/item/weapon/attachment/bayonet) || istype(I, /obj/item/weapon/material/kitchen/utensil/knife) || istype(I, /obj/item/weapon/material/hatchet))
			to_chat(user, "你敲开了\the [src]。")
			new /obj/item/weapon/reagent_containers/food/snacks/cracked_shellfish(user.loc)
			qdel(src)
			return