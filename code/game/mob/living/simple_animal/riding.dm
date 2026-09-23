/mob/living/simple_animal
	var/image/cover_overlay = null //riding (over mob)
	var/icon_riding = "" // to be applied to cover_overlay

	var/can_ride = FALSE
	var/ride = FALSE
	var/ride_pixel_x = 0
	var/ride_pixel_y = 0
	var/mob/living/human/rider = null

/mob/living/simple_animal/New()
	..()
	icon_riding = "[icon_living]_riding"
	if (can_ride)
		layer = MOB_LAYER - 0.01
	cover_overlay = image("icon" = icon, "icon_state" = icon_riding, "layer" = 4.15)
	overlays.Cut()
/mob/living/simple_animal/update_icons()
	..()
	overlays.Cut()
	if (stat == DEAD)
		icon_state = icon_dead
		layer = 3.3
	else
		if (can_ride && ride && !(cover_overlay in overlays))
			overlays += cover_overlay
		else
			overlays -= cover_overlay

/mob/living/simple_animal/MouseDrop_T(mob/living/M, mob/living/human/user)
	if (can_ride && isnull(rider) && M == user && !user.lying && !user.prone && (!user.werewolf || user.body_build.name == "Default"))
		var/mob/living/human/MM = M
		M.visible_message("<span class='notice'>[M]开始试图爬到\the [src]的背上...</span>","<span class='notice'>你开始试图爬到\the [src]的背上...</span>")
		if (do_after(MM, 40, src))
			M.plane = GAME_PLANE
			M.visible_message("<span class='notice'>[M]成功爬到了\the [src]的背上。</span>","<span class='notice'>你成功爬到了\the [src]的背上。</span>")
			ride = TRUE
			rider = MM
			MM.forceMove(src.loc)
			MM.riding = TRUE
			MM.riding_mob = src
			src.pixel_x = src.ride_pixel_x
			src.pixel_y = src.ride_pixel_y
			update_icons()
			stop_automated_movement = TRUE
			return
	else
		..()

/mob/living/simple_animal/attack_hand(mob/living/human/M as mob)
	if (can_ride && ride == TRUE && !isnull(rider))
		if (rider == M)
			M.visible_message("<span class='notice'>[M]开始从\the [src]身上下来...</span>","<span class='notice'>你开始从\the [src]身上下来...</span>")
			if (do_after(M, 40, src))
				M.visible_message("<span class='danger'>[M]从\the [src]身上下来了。</span>","<span class='danger'>你从\the [src]身上下来了。</span>")
				M.riding = FALSE
				M.riding_mob = null
				ride = FALSE
				rider = null
				M.pixel_x = 0
				M.pixel_y = 0
				update_icons()
				stop_automated_movement = FALSE
				return
		else
			M.visible_message("<span class='danger'>[M]试图把[rider]从\the [src]身上拉下来!</span>","<span class='danger'>你试图把[rider]从\the [src]身上拉下来!</span>")
			if (do_after(M, 40, src))
				M.visible_message("<span class='danger'>[M]把[rider]从\the [src]身上拉了下来!</span>","<span class='danger'>你把[rider]从\the [src]身上拉了下来!</span>")
				rider.riding = FALSE
				rider.riding_mob = null
				rider.forceMove(locate(x+1,y,z))
				rider.SpinAnimation(5,1)
				rider.Weaken(5)
				ride = FALSE
				rider.pixel_x = 0
				rider.pixel_y = 0
				rider = null
				update_icons()
				stop_automated_movement = FALSE
				return
	else
		..()

/mob/living/simple_animal/death()
	..()
	if (can_ride && !isnull(rider))
		rider.visible_message("<span class='danger'>[rider]从\the [src]身上掉了下来!</span>", "<span class='danger'>你从\the [src]身上掉了下来!</span>")
		rider.riding = FALSE
		rider.SpinAnimation(5,1)
		rider.forceMove(locate(x+1,y,z))
		rider.Weaken(5)
		ride = FALSE
		rider.pixel_x = 0
		rider.pixel_y = 0
		rider = null
		overlays.Cut()

/mob/living/simple_animal/proc/trample(var/mob/living/tmob)
	if (can_ride && tmob.stat != DEAD)
		visible_message("<span class='danger'>\The [src]踩踏[tmob]!</span>")
		playsound(tmob.loc, 'sound/effects/gore/fallsmash.ogg', 35, TRUE)
		tmob.adjustBruteLoss(rand(6,7))
		if (prob(35))
			tmob.Weaken(7)
		return