/obj/item/clothing/suit // why can't this be on a uniform suit dm?
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_suits.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_suits.dmi',
		)

/* Miscallaneous Suits */

/obj/item/clothing/suit/chef
	name = "一条经典厨师围裙。"
	desc = "一条基本、单调的白色厨师围裙。"
	icon_state = "apronchef"
	item_state = "apronchef"
	blood_overlay_type = "armor"
	body_parts_covered = FALSE
	permeability_coefficient = 0.50
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/chef/tfc
	name = "德克萨斯炸鸡围裙"
	desc = "一条布围裙。上面写着TFC。"
	icon_state = "aprontfc"
	item_state = "aprontfc"

/obj/item/clothing/suit/hawaiian
	name = "蓝色夏威夷衬衫。"
	desc = "一件图案鲜艳花哨的夏威夷衬衫。带有蓝色调"
	icon_state = "hawaiian_blue"
	item_state = "hawaiian_blue"
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/suit/hawaiian/orange
	name = "橙色夏威夷衬衫。"
	desc = "一件图案鲜艳花哨的夏威夷衬衫。带有橙色调"
	icon_state = "hawaiian_orange"
	item_state = "hawaiian_orange"

/obj/item/clothing/suit/hawaiian/purple
	name = "紫色夏威夷衬衫。"
	desc = "一件图案鲜艳花哨的夏威夷衬衫。带有紫色调"
	icon_state = "hawaiian_purple"
	item_state = "hawaiian_purple"

/obj/item/clothing/suit/hawaiian/green
	name = "绿色夏威夷衬衫。"
	desc = "一件图案鲜艳花哨的夏威夷衬衫。带有绿色调"
	icon_state = "hawaiian_green"
	item_state = "hawaiian_green"

/obj/item/clothing/suit/pimpsuit
	name = "紫色皮条客夹克。"
	desc = "一件为黑帮准备的色彩鲜艳的紫色纽扣外套。"
	icon_state = "pimpcoat"
	item_state = "pimpcoat"

/obj/item/clothing/suit/blugojacket
	name = "布卢戈斯拉夫夹克。"
	desc = "布卢戈军队的标准配发作战夹克。"
	icon_state = "bcj"
	item_state = "bcj"
	body_parts_covered = UPPER_TORSO|ARMS

/obj/item/clothing/suit/blugojacket/flak //only issued to the commander
	name = "布卢戈斯拉夫防弹夹克。"
	desc = "一件布卢戈夹克,感觉相当沉重,里面大概塞满了凯夫拉和帆布的混合物"
	icon_state = "bcj"
	item_state = "bcj"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 5, arrow = 2, gun = 2, energy = 15, bomb = 5, bio = 30, rad = 20)
	slowdown = 0.1

/obj/item/clothing/suit/gorillasuit
	name = "全身大猩猩套装"
	desc = "一件逼真的全身大猩猩套装,非常适合化装舞会和恶作剧者。"
	icon_state = "gorilla_suit"
	item_state = "gorilla_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	cold_protection = LOWER_TORSO|LEGS|ARMS|FEET
	var/adjusted = FALSE

/obj/item/clothing/suit/gorillasuit/verb/toggle_hood()
	set category = null
	set src in usr
	if (type != /obj/item/clothing/suit/gorillasuit)
		return
	else
		if (adjusted)
			item_state = "gorilla_suit"
			icon_state = "gorilla_suit"
			item_state_slots["slot_w_uniform"] = "gorilla_suit"
			to_chat(usr, "<span class = 'danger'>你放下了连体服的兜帽。</span>")
			adjusted = FALSE
		else if (!adjusted)
			item_state = "gorilla_suit_h"
			icon_state = "gorilla_suit_h"
			item_state_slots["slot_w_uniform"] = "gorilla_suit_h"
			to_chat(usr, "<span class = 'danger'>你拉起了连体服的兜帽。</span>")
			body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HEAD
			flags_inv = BLOCKHEADHAIR
			adjusted = TRUE
	update_clothing_icon()