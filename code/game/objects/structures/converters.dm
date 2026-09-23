/obj/structure/converter
	name = "贤者之石"
	desc = "不要使用这个!!! (铅变金)"
	icon = 'icons/obj/structures.dmi'
	icon_state = "wood_pole1"
	var/idlesprite = "wood_pole1" //Icon when not full.
	var/activesprite = "impaledskull" //Icon when full.
	density = FALSE
	anchored = TRUE
	var/delay = 10 //Time to wait for the conversion to complete.
	var/input = /obj/item/stack/material/lead //Input material
	var/input1 = /obj/item/stack/material/lead //Just for you fwoosh!
	var/inputamount = 1 //How much material is required
	var/output = /obj/item/stack/material/gold //Finished material
	var/outputamount = 1 //How much material is produced.
	var/actiontext = "magicify"
	var/activesound = null
	var/endsound = null
	var/filled = FALSE
	var/overlayed = FALSE //if it should display the item on the thing.
	not_movable = TRUE
	not_disassemblable = FALSE

/obj/structure/converter/attackby(obj/item/M as obj, mob/user as mob)
	if(!filled)
		if(istype(M, input) || istype(M, input1))
			if(M.amount >= inputamount)
				M.amount -= inputamount
				if(M.amount <= 0)
					qdel(M)
				to_chat(user, "<span class='notice'>你将[inputamount][M.name]插入[name]!</span>")
				visible_message("<span class='notice'>[M.name]开始[actiontext].</span>")
				icon_state = activesprite
				playsound(src,activesound,60,1)
				if(overlayed)
					load_overlay(M)
				filled = TRUE
				spawn(delay)
					visible_message("<span class='alert'>[name]完成了[actiontext].</span>")
					for(var/i=1,i<=outputamount,i++)
						new output(src.loc)
					icon_state = idlesprite
					if(overlayed)
						remove_overlay(M)
					playsound(src,endsound,60,1)
					filled = FALSE
			else
				to_chat(user, "<span class='alert'>你需要插入[inputamount][M.name]!</span>")
		else if (istype(M, /obj/item/weapon/hammer) || istype(M, /obj/item/weapon/wrench))
			..()
			return
		else
			to_chat(user, "<span class='alert'>那不是正确的资源!</span>")
			return
	/*else
		to_chat(user, "<span class='alert'> You empty the [name]. </span>")
		for(var/i=0,i<=inputamount,i++)
			new input(src.loc)
		icon_state = idlesprite
		if(overlayed)
			remove_overlay(M)
		filled = FALSE*/

/obj/structure/converter/proc/remove_overlay()
	src.overlays = null

/obj/structure/converter/proc/load_overlay(var/obj/item/stack/material/A as obj)
	//remove all overlays
	remove_overlay()
	//add overlay
	src.overlays += icon(A.icon,A.icon_state)

/obj/structure/converter/tanning
	name = "鞣制架"
	desc = "将兽皮制成皮革"
	icon = 'icons/obj/structures.dmi'
	icon_state = "drying_rack_empty"
	idlesprite = "drying_rack_empty"
	activesprite = "drying_rack_full"
	delay = 300
	input = /obj/item/stack/material/hairlesshide
	inputamount = 1
	output = /obj/item/stack/material/leather
	outputamount = 3
	actiontext = "tann"
	overlayed = FALSE

/obj/structure/converter/retting_trough
	name = "沤麻槽"
	desc = "随时间将纤维植物浸泡成沤制纤维.每次至少需要两份分开的大麻或亚麻."
	icon = 'icons/obj/structures.dmi'
	icon_state = "retting_trough"
	idlesprite = "retting_trough"
	activesprite = "retting_trough_full"
	delay = 250
	input = /obj/item/stack/material/hemp
	input1 = /obj/item/stack/material/flax
	inputamount = 2
	output = /obj/item/stack/material/rettedfabric
	outputamount = 1
	actiontext = "soak"
	overlayed = FALSE

/obj/structure/converter/acid_bath
	name = "工业酸浴槽"
	desc = "随时间将人造纤维浸泡成可用材料.它的尺寸和深度不足以装下比如...一具人体."
	icon = 'icons/obj/structures.dmi'
	icon_state = "kevlar_trough"
	idlesprite = "kevlar_trough"
	activesprite = "kevlar_trough_full"
	delay = 250
	input = /obj/item/stack/material/rawkevlar
	inputamount = 1
	output = /obj/item/stack/material/preparedkevlar
	outputamount = 1
	actiontext = "soak"
	overlayed = FALSE
