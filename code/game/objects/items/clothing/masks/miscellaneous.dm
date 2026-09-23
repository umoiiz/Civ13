/obj/item/clothing/mask/sack //wip to make you blind people to kidnap.
	name = "布制头套"
	desc = "一个被强行或自愿戴在头上的布制袋子."
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHEADHAIR
	icon_state = "sack"
	item_state = "sack"
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/sack/attack_hand(mob/user as mob)
	if (user.wear_mask == src && !user.IsAdvancedToolUser())
		return FALSE
	..()

/obj/item/clothing/mask/sack/scarecrow
	name = "带眼孔的布制头套"
	desc = "一个被强行或自愿戴在头上的布制袋子.上面粗糙地剪出了眼孔"
	icon_state = "scarecrow_sack"
	item_state = "scarecrow_sack"
	flags_inv = HIDEEARS|HIDEFACE|BLOCKHEADHAIR
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/sack/scarecrow/attack_hand(mob/user as mob)
	if (user.wear_mask == src && !user.IsAdvancedToolUser())
		return TRUE //not as burdensome to take off, you can see what you're doing.
	..()

/obj/item/clothing/mask/rat
	name = "老鼠面具"
	desc = "一个老鼠形状的塑料面具."
	icon_state = "rat"
	item_state = "rat"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/raven
	name = "渡鸦面具"
	desc = "一个食腐渡鸦形状的塑料面具."
	icon_state = "raven"
	item_state = "raven"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/bat
	name = "蝙蝠面具"
	desc = "一个可怕蝙蝠形状的塑料面具." //nana-nananananana bat-mask!
	icon_state = "bat"
	item_state = "bat"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/bear
	name = "熊面具"
	desc = "一个不太可爱的熊形状的塑料面具."
	icon_state = "bear"
	item_state = "bear"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/owl
	name = "猫头鹰面具"
	desc = "一个全视猫头鹰形状的塑料面具."
	icon_state = "owl"
	item_state = "owl"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/*According to all known laws of aviation, there is no way a bee should be able to fly.
Its wings are too small to get its fat little body off the ground.
The bee, of course, flies anyway because bees don't care what humans think is impossible.*/

/obj/item/clothing/mask/bee
	name = "蜜蜂面具"
	desc = "一个嗡嗡蜜蜂形状的塑料面具."
	icon_state = "bee"
	item_state = "bee"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/jackal
	name = "胡狼面具"
	desc = "一个食腐胡狼形状的塑料面具."
	icon_state = "jackal"
	item_state = "jackal"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/fox
	name = "狐狸面具"
	desc = "一个狡猾狐狸形状的塑料面具."
	icon_state = "fox"
	item_state = "fox"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/frog
	name = "青蛙面具"
	desc = "一个黏滑青蛙形状的塑料面具.'呱呱!'" //unlike tg's version this one doesn't have a voicebox to scream.
	icon_state = "frog"
	item_state = "frog"
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/cow
	name = "奶牛面具"
	desc = "一个奶牛形状的塑料面具.'哞!'"
	icon_state = "cowmask"
	item_state = "cowmask"
	flags_inv = HIDEEARS|HIDEFACE|BLOCKHEADHAIR
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/pig
	name = "猪面具"
	desc = "一个猪形状的塑料面具.'哼哧!'"
	icon_state = "pig"
	item_state = "pig"
	flags_inv = HIDEEARS|HIDEFACE|BLOCKHEADHAIR
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/joy
	name = "喜悦"
	desc = "一个喜悦表情符号形状的塑料面具."
	icon_state = "joy"
	item_state = "joy"
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/gorilla
	name = "大猩猩面具"
	desc = "一个大猩猩形状的塑料面具.'呜吼呜吼!'"
	icon_state = "gorilla"
	item_state = "gorilla"
	flags_inv = HIDEEARS|HIDEFACE|BLOCKHEADHAIR
	body_parts_covered = FACE
	w_class = ITEM_SIZE_TINY
	blocks_scope = TRUE

/obj/item/clothing/mask/clown
	name = "小丑面具"
	desc = "一种全世界小丑都在使用的面具."
	icon_state = "clownmask"
	item_state = "clownmask"
	flags_inv = HIDEEARS
	body_parts_covered = FACE|EYES

/obj/item/clothing/mask/paydayclown
	name = "小丑面具"
	desc = "一个用来隐藏你身份的塑料面具,全世界的小丑都在使用."
	icon_state = "clownmask"
	item_state = "clownmask"
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 50, arrow = 10, gun = 50, energy = 0, bomb = 15, bio = 0, rad = FALSE)

/obj/item/clothing/mask/payday1
	name = "美国国旗面具"
	desc = "一个用来隐藏你身份的塑料面具.这个上面有一面美国国旗."
	icon_state = "payday1"
	item_state = "payday1"
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 50, arrow = 10, gun = 50, energy = 0, bomb = 15, bio = 0, rad = FALSE)

/obj/item/clothing/mask/payday2
	name = "小丑面具"
	desc = "一个用来隐藏你身份的塑料小丑面具."
	icon_state = "payday2"
	item_state = "payday2"
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 50, arrow = 10, gun = 50, energy = 0, bomb = 15, bio = 0, rad = FALSE)

/obj/item/clothing/mask/payday3
	name = "小丑面具"
	desc = "一个用来隐藏你身份的塑料小丑面具."
	icon_state = "payday3"
	item_state = "payday3"
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 50, arrow = 10, gun = 50, energy = 0, bomb = 15, bio = 0, rad = FALSE)

/obj/item/clothing/mask/payday4
	name = "小丑面具"
	desc = "一个用来隐藏你身份的塑料小丑面具."
	icon_state = "payday4"
	item_state = "payday4"
	flags_inv = HIDEEARS|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	w_class = ITEM_SIZE_TINY
	armor = list(melee = 50, arrow = 10, gun = 50, energy = 0, bomb = 15, bio = 0, rad = FALSE)