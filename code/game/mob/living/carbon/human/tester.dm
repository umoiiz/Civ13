/mob/living/human/proc/selfheal()
	set category = "Tester"
	set name = "Heal Self"
	to_chat(src, "<span class = 'good'>请等待<b>5</b>秒。</span>")
	if (do_after(src, 50, get_turf(src)))
		to_chat(src, "<span class = 'good'>你已被完全治愈。</span>")
		revive()

/mob/living/human/proc/selfrevive()
	set category = "Tester"
	set name = "Revive Self"
	to_chat(src, "<span class = 'good'>请等待<b>30</b>秒。</span>")
	spawn (300)
		if (src)
			to_chat(src, "<span class = 'good'>你已被完全治愈/复活。</span>")
			revive()