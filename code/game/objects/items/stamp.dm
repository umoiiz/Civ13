/obj/item/weapon/stamp
	name = "火漆印章"
	desc = "用于标记重要文件的印章。"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-rn"
	item_state = "stamp"
	throwforce = FALSE
	w_class = ITEM_SIZE_TINY
	throw_speed = 7
	throw_range = 15
	attack_verb = list("stamped")
	var/mob/living/human/owner = null

/obj/item/weapon/stamp/rn
	name = "英国总督印章"
	icon_state = "stamp-rn"

/obj/item/weapon/stamp/fr
	name = "法国总督印章"
	icon_state = "stamp-fr"

/obj/item/weapon/stamp/pt
	name = "葡萄牙总督印章"
	icon_state = "stamp-pt"

/obj/item/weapon/stamp/es
	name = "西班牙总督印章"
	icon_state = "stamp-es"

/obj/item/weapon/stamp/nl
	name = "荷兰总督印章"
	icon_state = "stamp-nl"

/obj/item/weapon/stamp/baily
	name = "贝利批准章"
	icon_state = "stamp-fr"

/obj/item/weapon/stamp/mail
	name = "信封印章"
	icon_state = "stamp-blank"
	desc = "用于密封重要信封的印章。"


//INKSTAMPS FOLLOW -siro
//NEW STAMPS - goldenfreddycl
/obj/item/weapon/stamp/fna
	name = "fna墨水印章"
	icon_state = "stamp-fna"

/obj/item/weapon/stamp/mail/fna
	name = "fna印章"
	icon_state = "seal-fna"

/obj/item/weapon/stamp/cccp
	name = "红色cccp印章"
	icon_state = "stamp-cccp"

/obj/item/weapon/stamp/mail/cccp
	name = "红色cccp封蜡印章"
	icon_state = "seal-cccp"

/obj/item/weapon/stamp/nkvdseal
	name = "nkvd封蜡印章"
	icon_state = "stamp-nkvd"

/obj/item/weapon/stamp/denied
	name = "拒绝墨水印章"
	icon_state = "stamp-deny"

/obj/item/weapon/stamp/approved
	name = "批准墨水印章"
	icon_state = "stamp-approved"

/obj/item/weapon/stamp/stamplatin
	name = "拉丁文墨水印章"
	icon_state = "stamp-latin"

/obj/item/weapon/stamp/stampgerman
	name = "德文墨水印章"
	icon_state = "stamp-german"

/obj/item/weapon/stamp/stampgaul
	name = "盖尔文墨水印章"
	icon_state = "stamp-gaul"

/obj/item/weapon/stamp/mail/latin
	name = "拉丁文封蜡印章"
	icon_state = "seal-latin"

/obj/item/weapon/stamp/mail/german
	name = "德文封蜡印章"
	icon_state = "seal-german"

/obj/item/weapon/stamp/mail/gaul
	name = "盖尔文封蜡印章"
	icon_state = "seal-gaul"

/obj/item/weapon/stamp/mail/berlin
	name = "柏林封蜡印章"
	icon_state = "steal-berlin"

/obj/item/weapon/stamp/mail/berlin/censored
	icon_state = "seal-berlin-cens"

/obj/item/weapon/stamp/mail/admin
	name = "civ13管理员印章"
	icon_state = "seal-admin"

/obj/item/weapon/stamp/mail/court
	name = "法庭印章"
	icon_state = "seal-court"

// "Syndicate stamp to forge documents." Was the orrigional comments for the orrigional item. Its a fancy adujustable stamp now, nothing sinister yet. - siro
/obj/item/weapon/stamp/chameleon/attack_self(mob/user as mob)

	var/list/stamp_types = typesof((/obj/item/weapon/stamp) && !(/obj/item/weapon/stamp/mail)) - type // Get all stamp types except our own
	var/list/stamps = list()

	// Generate them into a list
	for (var/stamp_type in stamp_types)
		var/obj/item/weapon/stamp/S = new stamp_type
		stamps[capitalize(S.name)] = S

	var/list/show_stamps = list("EXIT" = null) + sortList(stamps) // the list that will be shown to the user to pick from

	var/input_stamp = WWinput(user, "Choose a stamp to change to.", "Choose a stamp.", show_stamps[1], show_stamps)

	if (user && (src in user.contents))

		var/obj/item/weapon/stamp/chosen_stamp = stamps[capitalize(input_stamp)]

		if (chosen_stamp)
			name = chosen_stamp.name
			icon_state = chosen_stamp.icon_state
