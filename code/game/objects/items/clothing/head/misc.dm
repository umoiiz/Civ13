
/obj/item/clothing/head/hairflower
	name = "发花发夹"
	icon_state = "hairflower"
	desc = "闻起来很香."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = FALSE
	heat_protection = 0

/obj/item/clothing/head/powdered_wig
	name = "扑粉假发"
	desc = "一顶扑粉假发."
	icon_state = "pwig"
	item_state = "pwig"

/obj/item/clothing/head/tophat
	name = "高顶礼帽"
	desc = "一顶看起来像阿米什人的帽子."
	icon_state = "tophat"
	item_state = "tophat"
	siemens_coefficient = 0.9
	body_parts_covered = FALSE

/obj/item/clothing/head/pimphat
	name = "皮条客帽"
	desc = "这是一顶黑帮帽."
	icon_state = "pimp_hat"
	item_state = "pimp_hat"
	siemens_coefficient = 0.9
	body_parts_covered = FALSE

/obj/item/clothing/head/peakyblinder
	name = "鸭舌帽"
	desc = "这是一顶普通的帽子."
	icon_state = "peakyblindercap"
	item_state = "peakyblindercap"
	siemens_coefficient = 2.0
	body_parts_covered = FALSE

/obj/item/clothing/head/peakyblinderblade
	name = "鸭舌帽"
	desc = "这是一顶普通的帽子. 里面装有剃须刀片."
	icon_state = "peakyblindercap"
	item_state = "peakyblindercap"
	siemens_coefficient = 2.0
	body_parts_covered = FALSE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT

/obj/item/clothing/head/pirate
	name = "海盗帽"
	desc = "呀哈."
	icon_state = "pirate"
	body_parts_covered = FALSE

/obj/item/clothing/head/bandana
	name = "海盗头巾"
	desc = "呀哈."
	icon_state = "bandana"

/obj/item/clothing/head/olivebandana
	name = "橄榄色头巾"
	desc = "一条橄榄色头巾."
	icon_state = "bandana_olive"
	item_state = "bandana_olive"

//stylish bs12 hats

/obj/item/clothing/head/beaverhat
	name = "海狸皮帽"
	icon_state = "beaver_hat"
	desc = "柔软的毛毡使这顶帽子既舒适又优雅."

/obj/item/clothing/head/feathertrilby
	name = "羽毛软呢帽"
	icon_state = "feathered_hat"
	desc = "一顶带羽毛的利落时尚帽子."

/obj/item/clothing/head/fez
	name = "土耳其毡帽"
	icon_state = "fez"
	desc = "你应该戴一顶土耳其毡帽. 土耳其毡帽很酷."

//end bs12 hats

/obj/item/clothing/head/bearpelt
	name = "熊皮帽"
	desc = "毛茸茸的."
	icon_state = "bearpelt"
	item_state = "bearpelt"
	flags_inv = BLOCKHAIR
	siemens_coefficient = 0.7
	ripable = FALSE

/obj/item/clothing/head/bearpelt/black
	name = "黑熊皮帽"
	icon_state = "bearpelt"
	item_state = "bearpelt"

/obj/item/clothing/head/bearpelt/brown
	name = "棕熊皮帽"
	icon_state = "brownbearpelt"
	item_state = "brownbearpelt"

/obj/item/clothing/head/bearpelt/white
	name = "北极熊皮帽"
	icon_state = "whitebearpelt"
	item_state = "whitebearpelt"

/obj/item/clothing/head/philosopher_wig
	name = "自然哲学家假发"
	desc = "一件从地球文艺复兴时期发掘出的时尚怪物. 戴上这顶最尊贵的假发, 你就准备好参加下一场社交晚会了!"
	icon_state = "philosopher_wig"
	item_state_slots = list(
		slot_l_hand_str = "pwig",
		slot_r_hand_str = "pwig",
		)
	flags_inv = BLOCKHAIR
	body_parts_covered = FALSE

/obj/item/clothing/head/orangebandana //themij: Taryn Kifer
	name = "橙色头巾"
	desc = "一块橙色的布, 戴在头上."
	icon_state = "orange_bandana"
	body_parts_covered = FALSE

/obj/item/clothing/head/dunce_cap
	name = "笨蛋帽"
	desc = "一顶尖顶白帽, 通常由应该感到羞耻的笨蛋佩戴."
	icon_state = "dunce_cap"
	item_state = "dunce_cap"
	body_parts_covered = HEAD
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/dunce_cap/attack_hand(mob/M)
	if (istype(M, /mob/living/human))
		var/mob/living/human/H = M
		if (H.head == src)
			to_chat(H, "你试图摘下你的笨蛋帽, 但失败了.")
			return
	..()