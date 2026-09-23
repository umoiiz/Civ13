//Rad stuff and special grown goes here.
//food.dmi
/obj/item/weapon/reagent_containers/food/snacks/grown/greenpotato
	name = "绿土豆"
	icon_state = "green_potato"
	desc = "在阳光下放太久了,看起来怪怪的."
	color = "#8b7355"
	nutriment_desc = list("potato" = TRUE)
	decay = 70*800
	satisfaction = -3
	New()
		..()
		reagents.add_reagent("solanine", 10)