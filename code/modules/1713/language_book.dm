/obj/item/weapon/book/language_book
	name = "语言书"
	desc = "一本允许两种语言之间翻译的书.里面什么都没写."
	icon = 'icons/obj/library.dmi'
	icon_state = "book2" // temporary someone fix this aa
	throw_speed = TRUE
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("bashed", "whacked")
	flammable = TRUE
	var/written = FALSE // has this book been written in yet?
	var/datum/language/lang1 = null // 1st language of translation
	var/datum/language/lang2 = null // 2nd language of translation
	unique = TRUE
/obj/item/weapon/book/language_book/attack_self(var/mob/user as mob)
	var/mob/living/human/H = user
	if(src.written && lang1 && lang2)
		var/choice = WWinput(user, "Do you want to learn a language from [src]?", "Learn a Language", "Yes", list("Yes", "No"))
		if (choice == "No")
			return
		else
			var/known1 = FALSE
			var/known2 = FALSE
			for (var/datum/language/i in H.languages)
				if (i == lang1)
					known1 = TRUE
				if (i == lang2)
					known2 = TRUE
			if(!known1 && !known2)
				to_chat(user, "<span class = 'warning'>如果你不会其中一种语言,就无法阅读语言书!</span>")
				return
			if(known1 && known2)
				to_chat(user, "<span class = 'warning'>如果你已经会这两种语言,就无法阅读语言书!</span>")
				return
			var/datum/language/langtolearn = lang1
			if (known1)
				langtolearn = lang2
			H.visible_message("<span class='notice'>[user]开始阅读[src].</span>", "<span class='notice'>你开始阅读[src]中[langtolearn.name]的翻译.这大约需要80秒,并且你需要站立或坐着不动.</span>")
			if(do_after(user, 800, src))
				H.visible_message("<span class='notice'>[user]读完了[src].</span>", "<span class='notice'>你读完了[src]中的翻译.你现在能够理解并说[langtolearn.name]了!</span>")
				H.add_language(langtolearn.name, FALSE)
				H.add_note("Known Languages", "[langtolearn.name]")
	else
		to_chat(user, "<span class = 'warning'>你无法阅读一本空白的语言书!</span>")

/obj/item/weapon/book/language_book/attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)
	if(istype(W, /obj/item/weapon/pen))
		if(user.languages.len < 2)
			to_chat(user, "<span class = 'warning'>如果你只会一种语言,就无法书写语言书!</span>")
			return
		if(written)
			to_chat(user, "<span class = 'warning'>你无法在一本已经写过的语言书上书写!</span>")
			return
		var/list/langcopy = user.languages.Copy() + "Cancel"
		var/datum/language/language1 = WWinput(user, "What will your 1st language to translate be?", "Writing Translations", "text", langcopy)
		langcopy.Remove(language1)
		var/datum/language/language2 = WWinput(user, "What will your 2nd language to translate be?", "Writing Translations", "text", langcopy)
		user.visible_message("<span class='notice'>[user]开始在[src]中书写.</span>", "<span class='notice'>你开始在[src]中书写翻译.这大约需要2分钟,并且你需要站立或坐着不动.</span>")
		if(do_after(user, 1200, src))
			user.visible_message("<span class='notice'>[user]在[src]中写完了.</span>", "<span class='notice'>你在[src]中写完了翻译.</span>")
			src.name = "[language1.name] to [language2.name] language book"
			src.desc = "A book that allows translation between two languages. It looks like it translates between [language1] and [language2]."
			src.written = TRUE
			src.lang1 = language1
			src.lang2 = language2
	else
		..()
