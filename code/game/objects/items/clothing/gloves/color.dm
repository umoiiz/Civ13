/obj/item/clothing/gloves
	heat_protection = HANDS


// COLOR GLOVES
/obj/item/clothing/gloves/color
	name = "手套"
	desc = "一双手套,看起来没什么特别的."
	icon_state = "latex"
	item_state = "latex"

/obj/item/clothing/gloves/color/white
	name = "白色手套"
	desc = "这些看起来相当花哨."
	icon_state = "latex"
	item_state = "latex"

/obj/item/clothing/gloves/watch
	name = "时间手套"
	desc = "假想中的时间手套.像手表一样工作.如果你找到了这些,请告诉管理员"

/obj/item/clothing/gloves/watch/examine(mob/user)
	..()
	to_chat(user, "<big>现在是[clock_time()].</big>")
/obj/item/clothing/gloves/watch/watch
	name = "手表"
	desc = "戴在手上的手表."
	icon_state = "watch"
	item_state = "watch"
	fingerprint_chance = 100

/obj/item/clothing/gloves/watch/specialwatch
	name = "昂贵的手表"
	desc = "戴在手上的手表.看起来相当昂贵."
	icon_state = "specialwatch"
	item_state = "watch"
	fingerprint_chance = 100

/obj/item/clothing/gloves/watch/goldwatch
	name = "金表"
	desc = "戴在手上的手表.这一块镀了金."
	icon_state = "goldwatch"
	item_state = "watch"
	fingerprint_chance = 100

/obj/item/clothing/gloves/color/yellow
	name = "黄色手套"
	desc = "一双手套,看起来没什么特别的,但似乎很眼熟."
	icon_state = "yellow"
	item_state = "ygloves"

/obj/item/clothing/gloves/color/orange
	name = "橙色手套"
	icon_state = "orange"
	item_state = "orangegloves"

/obj/item/clothing/gloves/color/red
	name = "红色手套"
	icon_state = "red"
	item_state = "redgloves"

/obj/item/clothing/gloves/color/blue
	name = "蓝色手套"
	icon_state = "blue"
	item_state = "bluegloves"

/obj/item/clothing/gloves/color/purple
	name = "紫色手套"
	icon_state = "purple"
	item_state = "purplegloves"

/obj/item/clothing/gloves/color/green
	name = "绿色手套"
	icon_state = "green"
	item_state = "greengloves"

/obj/item/clothing/gloves/color/grey
	name = "灰色手套"
	icon_state = "gray"
	item_state = "graygloves"

/obj/item/clothing/gloves/color/light_brown
	name = "浅棕色手套"
	icon_state = "lightbrown"
	item_state = "lightbrowngloves"

/obj/item/clothing/gloves/color/brown
	name = "棕色手套"
	icon_state = "brown"
	item_state = "browngloves"

/obj/item/clothing/gloves/color/luxglove
	name = "红色皮手套"
	desc = "一双手套,看起来花哨又昂贵."
	icon_state = "luxglove"
	item_state = "luxglove"

/obj/item/clothing/gloves/color/luxglovepurple
	name = "粉色手套"
	desc = "一双手套,看起来挺花哨."
	icon_state = "luxglove1"
	item_state = "luxglove1"

/obj/item/clothing/gloves/rings/silver
	name = "银戒指"
	desc = "一枚闪亮的银戒指.看起来很昂贵."
	icon_state = "silver_ring"
	item_state = "silver_ring"
	fingerprint_chance = 100
