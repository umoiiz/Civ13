////////////////////////////////////////////////////////////////////////////////
/// Drinks.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/drinks
	name = "饮料"
	desc = "美味"
	icon = 'icons/obj/drinks.dmi'
	icon_state = null
	flags = OPENCONTAINER
	amount_per_transfer_from_this = 5
	volume = 50
	var/label_text = ""
	var/base_name = " "

	on_reagent_change()
		return

	attack_self(mob/user as mob)
		if (!is_open_container())
			open(user)

	proc/open(mob/user)
		playsound(loc,'sound/effects/canopen.ogg', rand(10,50), TRUE)
		to_chat(user, "<span class='notice'>你砰的一声打开了[src]!</span>")
		flags |= OPENCONTAINER

	attack(mob/M as mob, mob/user as mob, def_zone)
		if (force && !(flags & NOBLUDGEON) && user.a_intent == I_HARM)
			return ..()
		if (istype(M) && standard_feed_mob(user, M))
			return TRUE
		return FALSE

	afterattack(obj/target, mob/user, proximity)
		if (!proximity) return

		if (istype(target, /obj/structure/pot))
			return

		if (standard_dispenser_refill(user, target))
			return
		if (standard_pour_into(user, target))
			return

		return ..()
	attackby(obj/item/weapon/W as obj, mob/user as mob)
		if (istype(W, /obj/item/weapon/pen))
			var/tmp_label = sanitizeSafe(input(user, "Enter a label for [name]", "Label", label_text), MAX_NAME_LEN)
			if (length(tmp_label) > 15)
				to_chat(user, "<span class='notice'>标签最多只能有15个字符长。</span>")
			else
				to_chat(user, "<span class='notice'>你将标签设置为\"[tmp_label]\"。</span>")
				label_text = tmp_label
				update_name_label()
		else
			..()

	proc/update_name_label()
		playsound(src,'sound/effects/pen.ogg',40,1)
		if (label_text == "")
			name = base_name
		else
			name = "[base_name] ([label_text])"

	standard_feed_mob(var/mob/user, var/mob/target)
		if (!is_open_container())
			if (istype(target))
				to_chat(user, "<span class='notice'>你需要打开[src]!</span>")
			return TRUE
		return ..()

	standard_dispenser_refill(var/mob/user, var/obj/structure/reagent_dispensers/target)
		if (!is_open_container())
			if (istype(target))
				to_chat(user, "<span class='notice'>你需要打开[src]!</span>")
			return TRUE
		return ..()

	standard_pour_into(var/mob/user, var/atom/target)
		if (!is_open_container())
			if (istype(target) && !istype(target, /obj/structure/table)) // setting on a table
				to_chat(user, "<span class='notice'>你需要打开[src]!</span>")
			return TRUE
		return ..()

	self_feed_message(var/mob/user)
		to_chat(user, "<span class='notice'>你从\the [src]中吞下一大口。</span>")

	feed_sound(var/mob/user)
		playsound(user.loc, "drink", rand(10, 50), TRUE)

	examine(mob/user)
		if (!..(user, TRUE))
			return
		if (!reagents || reagents.total_volume == FALSE)
			to_chat(user, "<span class='notice'>\The [src]是空的!</span>")
		else if (reagents.total_volume <= volume * 0.25)
			to_chat(user, "<span class='notice'>\The [src]几乎空了!</span>")
		else if (reagents.total_volume <= volume * 0.66)
			to_chat(user, "<span class='notice'>\The [src]是半满的!</span>")
		else if (reagents.total_volume <= volume * 0.90)
			to_chat(user, "<span class='notice'>\The [src]几乎满了!</span>")
		else
			to_chat(user, "<span class='notice'>\The [src]是满的!</span>")

	New()
		..()
		base_name = name
		spawn (1)
			if (reagents && !istype(src, /obj/item/weapon/reagent_containers/food/drinks/bottle))
				amount_per_transfer_from_this = max(amount_per_transfer_from_this, ceil(reagents.total_volume/5))


////////////////////////////////////////////////////////////////////////////////
/// Drinks. END
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/drinks/gunpowder
	name = "火药袋"
	desc = "一个小袋子,用于携带火药。"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "gunpowder"
	volume = 10
	center_of_mass = list("x"=16, "y"=14)
	value = 5
	slot_flags = SLOT_ID

/obj/item/weapon/reagent_containers/food/drinks/gunpowder/full
	value = 5

	New()
		..()
		reagents.add_reagent("gunpowder", 10)

/obj/item/weapon/reagent_containers/food/drinks/golden_cup
	desc = "一个金杯"
	name = "金杯"
	icon_state = "golden_cup"
	item_state = "" //nope :(
	w_class = ITEM_SIZE_LARGE
	force = WEAPON_FORCE_PAINFUL
	throwforce = 10
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = null
	volume = 150
	flags = CONDUCT | OPENCONTAINER

///////////////////////////////////////////////Drinks
//Notes by Darem: Drinks are simply containers that start preloaded. Unlike condiments, the contents can be ingested directly
//	rather then having to add it to something else first. They should only contain liquids. They have a default container size of 50.
//	Formatting is the same as food.

/obj/item/weapon/reagent_containers/food/drinks/coffee
	name = "咖啡"
	desc = "小心,你即将享用的饮料非常烫。"
	icon_state = "coffee"
	center_of_mass = list("x"=15, "y"=10)
	New()
		..()
		reagents.add_reagent("coffee", 30)

/obj/item/weapon/reagent_containers/food/drinks/tea
	name = "茶杯"
	desc = "一个茶杯。温暖。"
	icon_state = "teacup"
	item_state = "coffee"
	center_of_mass = list("x"=16, "y"=14)
	New()
		..()
		reagents.add_reagent("tea", 15)
/obj/item/weapon/reagent_containers/food/drinks/tea/empty
	name = "茶杯"
	desc = "一个茶杯。温暖。"
	icon_state = "teacup"
	item_state = "coffee"
	center_of_mass = list("x"=16, "y"=14)
	New()
		..()
		reagents.del_reagents()

/obj/item/weapon/reagent_containers/food/drinks/ice
	name = "冰杯"
	desc = "小心,冰冷的冰,不要咀嚼。"
	icon_state = "coffee"
	center_of_mass = list("x"=15, "y"=10)
	New()
		..()
		reagents.add_reagent("ice", 30)

/obj/item/weapon/reagent_containers/food/drinks/h_chocolate
	name = "荷兰热可可"
	desc = "南美制造。"
	icon_state = "hot_coco"
	item_state = "coffee"
	center_of_mass = list("x"=15, "y"=13)
	New()
		..()
		reagents.add_reagent("hot_coco", 30)


/obj/item/weapon/reagent_containers/food/drinks/sillycup
	name = "纸杯"
	desc = "一个纸水杯。"
	icon_state = "water_cup_e"
	possible_transfer_amounts = null
	w_class = ITEM_SIZE_TINY
	volume = 10
	center_of_mass = list("x"=16, "y"=12)
	New()
		..()
	on_reagent_change()
		if (reagents.total_volume)
			icon_state = "water_cup"
		else
			icon_state = "water_cup_e"


//////////////////////////drinkingglass and shaker//
//Note by Darem: This code handles the mixing of drinks. New drinks go in three places: In Chemistry-Reagents.dm (for the drink
//	itself), in Chemistry-Recipes.dm (for the reaction that changes the components into the drink), and here (for the drinking glass
//	icon states.

/obj/item/weapon/reagent_containers/food/drinks/shaker
	name = "调酒壶"
	desc = "一个用于混合饮料的金属调酒壶。"
	icon_state = "shaker"
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=10)

/obj/item/weapon/reagent_containers/food/drinks/teapot
	name = "茶壶"
	desc = "一个优雅的茶壶。它简直散发着格调。"
	icon_state = "teapot"
	item_state = "teapot"
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/teapot/filled
	New()
		..()
		reagents.add_reagent("tea", 100)

/obj/item/weapon/reagent_containers/food/drinks/flask
	name = "军官的随身酒壶"
	desc = "一个军官使用的漂亮金属随身酒壶"
	icon_state = "flask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/flask/officer/schnapps
/obj/item/weapon/reagent_containers/food/drinks/flask/officer/schnapps/New()
	..()
	reagents.add_reagent("goldschlager", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka
/obj/item/weapon/reagent_containers/food/drinks/flask/officer/vodka/New()
	..()
	reagents.add_reagent("vodka", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/officer/whiskey
/obj/item/weapon/reagent_containers/food/drinks/flask/officer/whiskey/New()
	..()
	reagents.add_reagent("whiskey", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/officer/tea
/obj/item/weapon/reagent_containers/food/drinks/flask/officer/tea/New()
	..()
	reagents.add_reagent("tea", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/officer/wine
/obj/item/weapon/reagent_containers/food/drinks/flask/officer/wine/New()
	..()
	reagents.add_reagent("wine", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/shiny
	name = "闪亮的随身酒壶"
	desc = "一个闪亮的金属随身酒壶。上面似乎刻有一个希腊符号。"
	icon_state = "shinyflask"

/obj/item/weapon/reagent_containers/food/drinks/flask/lithium
	name = "锂随身酒壶"
	desc = "一个上面有锂原子符号的随身酒壶。"
	icon_state = "lithiumflask"

/obj/item/weapon/reagent_containers/food/drinks/flask/detflask
	name = "督察的随身酒壶"
	desc = "一个带有皮带和金色徽章的金属随身酒壶,属于督察。"
	icon_state = "detflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=8)

/obj/item/weapon/reagent_containers/food/drinks/flask/barflask
	name = "随身酒壶"
	desc = "给那些懒得去酒吧喝酒的人。"
	icon_state = "barflask"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

/obj/item/weapon/reagent_containers/food/drinks/flask/barflask/vodka
/obj/item/weapon/reagent_containers/food/drinks/flask/barflask/vodka/New()
	..()
	reagents.add_reagent("vodka", 60)

/obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask
	name = "保温瓶"
	desc = "自1892年以来让你的饮料保持在完美温度。"
	icon_state = "vacuumflask"
	volume = 60
	center_of_mass = list("x"=15, "y"=4)

/obj/item/weapon/reagent_containers/food/drinks/britmug
	name = "咖啡杯"
	desc = "一个陶瓷杯,上面印着一个明亮的军旗。"
	icon_state = "britcup"
	volume = 30
	center_of_mass = list("x"=15, "y"=13)

/obj/item/cocktail_stuff
	name = "零食鸡尾酒"
	desc = "这东西有点不对劲."
	icon = 'icons/obj/drinks.dmi'
	var/is_edible = FALSE
	w_class = ITEM_SIZE_TINY

/obj/item/cocktail_stuff/attack(mob/M as mob, mob/user as mob)
	if (!is_edible)
		return
	if (user == M)
		to_chat(user, "<span class='notice'>你吃下了[src]. 好吃!</span>")
		user.visible_message("<b>[user]</b>吃下了[src].")
	else
		to_chat(M, "<span class='notice'>你吃下了[src]. 好吃!</span>")
		user.visible_message("<span class='warning'><b>[user]</b>把[src]塞进了<b>[M]</b>的嘴里.</span>")
	playsound(usr.loc,"eat", rand(20,45), TRUE)
	qdel(src)
	..()

/obj/item/cocktail_stuff/maraschino_cherry
	name = "马拉斯奇诺樱桃"
	desc = "马拉斯奇诺樱桃,或称鸡尾酒樱桃,是一种经过腌制、人工染色并加糖的樱桃. 在许多鸡尾酒中非常常见."
	icon_state = "highball-cherry"
	is_edible = TRUE

/obj/item/cocktail_stuff/cocktail_olive
	name = "鸡尾酒橄榄"
	desc = "牙签上的一颗橄榄. 这对饮品的风味毫无作用,但嘿,免费的橄榄!"
	icon_state = "highball-olive"
	is_edible = TRUE

/obj/item/cocktail_stuff/celery
	name = "芹菜杆"
	desc = "一根芹菜. 不含蚂蚁."
	icon_state = "highball-celery"
	is_edible = TRUE
