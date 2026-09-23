/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	layer = 3.5
	w_class = ITEM_SIZE_NORMAL

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			qdel(src)
			return
		if (3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if (istype(tool, /obj/item/weapon/hammer))
		var/obj/item/sign/S = new(loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		to_chat(user, "你用你的[tool]解开了\the [S].")
		qdel(src)
	else ..()

/obj/item/sign
	name = "标牌"
	desc = "这个标牌松了,也许你可以把它固定到某个地方."
	icon = 'icons/obj/decals.dmi'
	w_class = ITEM_SIZE_NORMAL		//big
	var/sign_state = ""
	value = 0
/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if (istype(tool, /obj/item/weapon/hammer) && isturf(user.loc))
		var/direction = WWinput(user, "Fasten it to which direction?", "Select a direction.", "North", WWinput_list_or_null(list("North", "East", "South", "West")))
		if (direction)
			var/obj/structure/sign/S = new(user.loc)
			switch(direction)
				if ("North")
					S.pixel_y = 32
				if ("East")
					S.pixel_x = 32
				if ("South")
					S.pixel_y = -32
				if ("West")
					S.pixel_x = -32
				else return
			S.name = name
			S.desc = desc
			S.icon_state = sign_state
			to_chat(user, "你用你的[tool]固定了\the [S].")
			qdel(src)
	else ..()

/obj/structure/sign/securearea
	name = "\improper 安全区域"
	desc = "一块写着\"安全区域\"的警告标牌."
	icon_state = "securearea"

/obj/structure/sign/redcross
	name = "医疗舱"
	desc = "银河系医疗机构的标志.你可能会在这里得到帮助."
	icon_state = "redcross"

/obj/structure/sign/mcd
	name = "麦当劳"
	desc = "快餐巨头,保证让你的每一单都更加悲惨."
	icon_state = "mcd3"

/obj/structure/sign/mcd/menu
	name = "麦当劳菜单"
	desc = "助长肥胖流行病,一次一个巨无霸."
	icon_state = "mcd2"

/obj/structure/sign/mcd/pole
	name = "麦当劳"
	desc = "对人类加工食品和悔恨无尽食欲的巍峨致敬."
	icon_state = "mcd-pole"

/obj/structure/sign/mcd/pole/New()
	..()
	overlays.Cut()
	var/image/img = image(icon='icons/obj/decals.dmi', icon_state = "mcd")
	img.pixel_y = 32
	overlays += img

/obj/structure/sign/mcd/pole/Destroy()
	..()
	overlays.Cut()

/obj/structure/sign/tfc
	name = "德克萨斯炸鸡"
	desc = "德克萨斯人通常喜欢的标牌."
	icon_state = "tfc"

/obj/structure/sign/weedshop
	name = "大麻商店"
	desc = "瘾君子通常喜欢的标牌."
	icon_state = "weedshop"

/obj/structure/sign/mckellens
	name = "麦凯伦"
	desc = "麦凯伦连锁店的标牌."
	icon_state = "mckellens"

/obj/structure/sign/sheriff
	name = "治安官办公室"
	desc = "当地治安官办公室的标牌."
	icon_state = "sheriff"

/obj/structure/sign/bank
	name = "银行"
	desc = "当地银行的标牌."
	icon_state = "bank"

/obj/structure/sign/bar
	name = "酒吧"
	desc = "一块上面写着酒吧的标牌."
	icon_state = "barsign"

/obj/structure/sign/cafe_ru
	name = "咖啡馆"
	desc = "一块上面用西里尔字母写着咖啡馆的标牌."
	icon_state = "cafesign_ru"

/obj/structure/sign/barbershop
	name = "理发店"
	desc = "一个表示理发店的旋转物体."
	icon_state = "barber"

/obj/structure/sign/baily
	name = "贝利哨所"
	desc = "保护服务."
	icon_state = "bailypost"

/obj/structure/sign/baily2
	name = "贝利哨所"
	desc = "保护服务."
	icon_state = "bailypost2"

/obj/structure/sign/greencross
	name = "医疗舱"
	desc = "银河系医疗机构的标志.你可能会在这里得到帮助."
	icon_state = "greencross"

/obj/structure/sign/goldenplaque
	name = "最强壮男人强壮奖"
	desc = "强壮不是一种行为或生活方式,而是一种精神状态.只有那些意志力足够强大,能在危机中行动,从敌人手中拯救朋友的人,才是真正的强壮.保持强壮,我的朋友们."
	icon_state = "goldenplaque"

/obj/structure/sign/ogoldenplaque
	name = "银行"
	desc = "存放贵重物品."
	icon_state = "atmosplaque"

/obj/structure/sign/kiddieplaque
	name = "\improper AI开发者牌匾"
	desc = "在极长的名字和职位列表旁边,有一幅小孩的画.这个孩子看起来像是智障.在图像下方,有人刻上了\"PACKETS\"这个词"
	icon_state = "kiddieplaque"

/obj/structure/sign/armory
	name = "军械库"
	desc = "军械库在这边."
	icon_state = "armory1"

/obj/structure/sign/abashiri
	name = "设施"
	desc = "设施 (农业设施)."
	icon_state = "farming"
/obj/structure/sign/abashiri/wing1
	name = "一翼"
	desc = "一翼 (第一翼)."
	icon_state = "wing1"
/obj/structure/sign/abashiri/wing2
	name = "二翼"
	desc = "二翼 (第二翼)."
	icon_state = "wing2"
/obj/structure/sign/abashiri/wing3
	name = "三翼"
	desc = "三翼 (第三翼)."
	icon_state = "wing3"
/obj/structure/sign/abashiri/solitary
	name = "孤独"
	desc = "孤独 (禁闭室)."
	icon_state = "wing3"

/obj/structure/sign/japsign
	name = "路牌"
	desc = "一块日式路牌."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "japsign"
/obj/structure/sign/japsign/New()
	..()
	var/picksign = pick("japsign", "japsign2", "japsign3", "japsign4", "japsign5", "japsign6")
	icon_state = picksign

/obj/structure/sign/mugshot
	name = "警方指认屏"
	desc = "固定在墙上的一种测量标尺. 用于拍摄嫌疑犯照片."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "mugshot"

/obj/structure/sign/exit
	name = "出口"
	desc = "指向出口."
	icon_state = "exit"

/obj/structure/sign/galacticbattles/unite
	name = "UNITE海报"
	desc = "似乎是银河共和国对抗分离主义者的宣传海报."
	icon_state = "unite"

/obj/structure/sign/galacticbattles/care
	name = "CARE海报"
	desc = "似乎是银河共和国用于让公众警惕渗透者的宣传海报."
	icon_state = "care"

/obj/structure/sign/galacticbattles/repair
	name = "科雷利亚维修广告海报"
	desc = "似乎是科雷利亚的机器人维修广告."
	icon_state = "repair"


/obj/structure/sign/minefield
	name = "雷区"
	desc = "注意! 地雷."
	icon_state = "minefield"
	flammable = FALSE

/obj/structure/sign/exit/New()
	..()
	if (dir == WEST)
		desc = "Exit to the left."
	else if (dir == EAST)
		desc = "Exit to the right."
	else if (dir == NORTH)
		desc = "Exit to the north."
	else if (dir == SOUTH)
		desc = "Exit to the south."

/obj/structure/sign/custom
	name = "指示牌"
	desc = "标示着某些东西."
	icon_state = "woodsign2"

/obj/structure/sign/custom/plaque
	name = "指示牌"
	desc = "标示着某些东西."
	icon_state = "Colonial_Sign"

/obj/structure/sign/custom/golden
	name = "指示牌"
	desc = "标示着某些东西."
	icon_state = "customsign2"

/obj/structure/sign/custom/metallic
	name = "指示牌"
	desc = "标示着某些东西."
	icon_state = "customsign"
/obj/structure/sign/signpost
	name = "路标"
	desc = "标示着某些东西."
	icon_state = "signpost_pole"

/obj/structure/sign/signpost/New()
	..()
	spawn(1)
		if (findtext(desc, "<b>West:</b>"))
			overlays += icon(icon, "signpost_west")
		if (findtext(desc, "<b>North:</b>"))
			overlays += icon(icon, "signpost_north")
		if (findtext(desc, "<b>East:</b>"))
			overlays += icon(icon, "signpost_east")
		if (findtext(desc, "<b>South:</b>"))
			overlays += icon(icon, "signpost_south")
		update_icon()

/obj/structure/sign/signpost/update_icon()
	overlays.Cut()
	if (findtext(desc, "<b>West:</b>"))
		overlays += icon(icon, "signpost_west")
	if (findtext(desc, "<b>North:</b>"))
		overlays += icon(icon, "signpost_north")
	if (findtext(desc, "<b>East:</b>"))
		overlays += icon(icon, "signpost_east")
	if (findtext(desc, "<b>South:</b>"))
		overlays += icon(icon, "signpost_south")
/obj/structure/sign/signpost/everywhere/New()
	..()
	spawn(1)
		overlays += icon(icon, "signpost_west")
		overlays += icon(icon, "signpost_north")
		overlays += icon(icon, "signpost_east")
		overlays += icon(icon, "signpost_south")

//numbers
/obj/structure/sign/n1
	desc = "一块银色标牌, 上面写着 'I'."
	name = "一"
	icon_state = "n1"
/obj/structure/sign/n2
	desc = "一块银色标牌, 上面写着 'II'."
	name = "二"
	icon_state = "n2"
/obj/structure/sign/n3
	desc = "一块银色标牌, 上面写着 'III'."
	name = "三"
	icon_state = "n3"
/obj/structure/sign/n4
	desc = "一块银色标牌, 上面写着 'IV'."
	name = "四"
	icon_state = "n4"
/obj/structure/sign/n5
	desc = "一块银色标牌, 上面写着 'V'."
	name = "五"
	icon_state = "n5"
/obj/structure/sign/n6
	desc = "一块银色标牌, 上面写着 'VI'."
	name = "六"
	icon_state = "n6"

/obj/structure/sign/torii
	desc = "一座高大的红色门形建筑."
	name = "鸟居"
	icon_state = "torii"
	icon = 'icons/turf/64x64.dmi'

/obj/structure/sign/painting1
	desc = "一道巨大的泡沫浪花拍打在岩石海岸上. 些许阳光穿过云层, 在海面和湿润的巨石上闪闪发光."
	name = "画作"
	icon_state = "painting1"

/obj/structure/sign/painting2
	desc = "夏日里一条宁静的城市街道, 路上有几个人. 左右两侧矗立着两三层高的房屋, 中间隔着一条鹅卵石路. 远处可以看到一座带有尖塔的巨大建筑."
	name = "画作"
	icon_state = "painting2"

/obj/structure/sign/painting3
	desc = "从海面上方陡峭的悬崖望去, 是一片炽烈的日落."
	name = "画作"
	icon_state = "painting3"

/obj/structure/sign/painting4
	desc = "一处林木茂密的山谷, 空地上有一个小池塘, 可以看到一群骑手. 群山本身在更远处隐约耸立, 被一层薄雾遮蔽."
	name = "画作"
	icon_state = "painting4"

/obj/structure/sign/painting5
	desc = "一幅静物画, 描绘了一张桌子, 上面铺着一块白布, 摆着几个水果和一个人类头骨."
	name = "画作"
	icon_state = "painting5"

/obj/structure/sign/painting6
	desc = "一只长尾鸟栖息在树枝上, 羽毛呈黑色, 橄榄绿色和白色, 形似喜鹊, 周围环绕着白色樱花."
	name = "画作"
	icon_state = "painting6"

/obj/structure/sign/painting7
	desc = "一个孤独的身影肩挑扁担, 站在倾斜的岸边一棵高大的松树下, 凝望着海峡对岸的雪峰. 天空被落日染成深橙色."
	name = "画作"
	icon_state = "painting7"

/obj/structure/sign/painting8
	desc = "一片丘陵景观, 河岸上矗立着一座带有红色木梁和飞檐的大型寺庙."
	name = "画作"
	icon_state = "painting8"

/obj/structure/sign/painting9
	desc = "沙漠中的一处小营地, 有几顶帐篷, 几匹马和载着货物的骆驼. 一条遥远的河流横穿这片贫瘠的沙丘."
	name = "画作"
	icon_state = "painting9"

/obj/structure/sign/painting10
	desc = "一艘海上三桅帆船, 被满月照亮."
	name = "画作"
	icon_state = "painting10"

/obj/structure/sign/medal
	name = "出席认证"
	icon_state = "medal"
	desc = "一块直接来自准入部的认证牌! 这一块似乎是用于证明本人出席的, 多么了不起的奖励!"

/obj/structure/sign/painting11
	desc = "一幅著名的星空画作."
	name = "画作"
	icon_state = "painting11"

/obj/structure/sign/painting12
	desc = "一片干旱的沙漠, 中间有一些帐篷."
	name = "画作"
	icon_state = "painting12"

/obj/structure/sign/painting13
	desc = "一幅静物画."
	name = "画作"
	icon_state = "painting13"

////Restroom signs////

/obj/structure/sign/restroom
	desc = "一个指示洗手间位置的标志."
	name = "洗手间"
	icon_state = "restroom"

/obj/structure/sign/restroom/male
	desc = "一个指示男洗手间位置的标志."
	name = "洗手间"
	icon_state = "restroom_male"

/obj/structure/sign/restroom/female
	desc = "一个指示女洗手间位置的标志."
	name = "洗手间"
	icon_state = "restroom_female"

/obj/structure/sign/justice
	desc = "一个司法标志."
	name = "司法"
	icon_state = "justice"

/obj/structure/sign/court
	name = "法院"
	desc = "法院大楼."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "court"
	bound_width = 64

/obj/structure/sign/townhall
	name = "市政厅"
	desc = "市政厅."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "townhall"
	bound_width = 64

/obj/structure/sign/nosmoking
	desc = "此区域禁止吸烟."
	name = "禁止吸烟"
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking2
	desc = "此区域禁止吸烟."
	name = "禁止吸烟"
	icon_state = "nosmoking2"

/obj/structure/sign/anatomy
	desc = "一张详述人体复杂结构的海报."
	name = "解剖海报"
	icon_state = "anatomy"

/obj/structure/sign/xray
	desc = "一个用于查看X光片的医疗灯箱."
	name = "灯箱"
	icon_state = "xray_on"

/obj/structure/sign/periodic
	desc = "一张化学元素周期表."
	name = "元素周期表"
	icon_state = "periodic"

/obj/structure/sign/casino
	name = "赌场"
	desc = "一个闪烁的赌场标志."
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "casino"

/obj/structure/sign/open
	name = "营业中"
	desc = "一个闪烁的营业中标志."
	icon_state = "open"

/obj/structure/sign/guns
	name = "枪店"
	desc = "一个闪烁的枪店标志."
	icon_state = "gunshop"

/obj/structure/sign/gas
	name = "加油站"
	desc = "一个闪烁的加油站标志."
	icon_state = "gas"

/obj/structure/sign/sale
	name = "促销标志"
	desc = "一个指示促销的标志."
	icon_state = "sale"

/obj/structure/sign/rent
	name = "出租标志"
	desc = "一个指示某物出租的标志."
	icon_state = "rent"

/obj/structure/sign/donut_shop
	name = "兰迪甜甜圈"
	desc = "一家甜甜圈和糕点连锁店."
	icon_state = "donut_shop"

/obj/structure/sign/deer_trophy
	name = "猎鹿战利品"
	desc = "看来我们终于找到小鹿斑比了..."
	icon_state = "deer_trophy"

/obj/structure/sign/orthodox1
	name = "玛丽亚圣像"
	desc = "一幅描绘耶稣之母玛丽亚的圣像.常用于东正教文化中."
	icon_state = "orthodox1"

/obj/structure/sign/orthodox2
	name = "圣三一圣像"
	desc = "一幅描绘圣三一的圣像.常用于东正教文化中."
	icon_state = "orthodox2"

/obj/structure/sign/orthodox3
	name = "大天使米迦勒圣像"
	desc = "一幅描绘大天使米迦勒的圣像.常用于东正教文化中."
	icon_state = "orthodox3"

/obj/structure/sign/khalif_ali
	name = "哈里发阿里画像"
	desc = "一幅哈里发阿里的画像."
	icon_state = "khalif_ali1"

/obj/structure/sign/khalif_ali/alt
	icon_state = "khalif_ali2"

/obj/structure/sign/soviet_poster
	name = "军事海报"
	desc = "一张苏联军事海报,描绘了一名在苏联国旗前敬礼的士兵."
	icon_state = "soviet_poster"

/obj/structure/sign/sovafghan_poster
	name = "苏阿友谊海报"
	desc = "一张描绘一名苏联士兵和一名阿富汗民主共和国士兵手持步枪相视而笑的海报."
	icon_state = "sovafghan_poster_1"

/obj/structure/sign/sovafghan_poster/alt
	name = "苏阿友谊海报"
	desc = "一张描绘武装人员手持苏联和阿富汗民主共和国国旗的海报."
	icon_state = "sovafghan_poster_2"

//BILLBOARDS

/obj/structure/billboard
	name = "广告牌"
	desc = "天哪,他们这次又要卖给我们什么?"
	icon = 'icons/obj/billboards.dmi'
	icon_state = "billboard"
	light_range = 4
	light_power = 2
	light_color = "#fcf8f0"
	density = TRUE
	anchored = TRUE
	not_movable = TRUE
	layer = MOB_LAYER + 0.1
	bound_width = 64
	bound_height = 64
	crushable = FALSE
	var/adnumber

/obj/structure/billboard/Destroy()
	set_light(0)
	return ..()

/obj/structure/billboard/New()
	..()
	adnumber = rand(1,14)
	overlays += "ad[adnumber]"
	update_icon()


///CHRISTMAS

/obj/structure/sign/christmas/lights
	name = "圣诞灯饰"
	desc = "花哨."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "xmaslights"
	layer = 6.2

/obj/structure/sign/christmas/wreath
	name = "花环"
	desc = "扎人又过誉了."
	icon = 'icons/obj/christmas.dmi'
	icon_state = "doorwreath"
	layer = 6.3
