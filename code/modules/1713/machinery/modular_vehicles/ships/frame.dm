/obj/structure/vehicleparts/frame/ship
	name = "木制船体"
	desc = "木制船舶船体。"
	icon = 'icons/obj/vehicles/vehicleparts_boats.dmi'
	icon_state = "boat_floor1"
	normal_icon = 'icons/obj/vehicles/vehicleparts_boats.dmi'
	broken_icon = 'icons/obj/vehicles/vehicleparts_boats.dmi'
	noroof = TRUE
	var/prefix = ""
	New()
		..()
		roof = image(icon=icon, loc=src, icon_state="boat2", layer=8)
		roof.override = TRUE
		spawn(1)
			update_icon()

/obj/structure/vehicleparts/frame/ship/steel
	name = "钢制船体"
	desc = "钢制船体框架."
	icon_state = "Mboat_floor1"
	prefix = "M"
	New()
		..()
		roof.icon_state = "Mboat2"