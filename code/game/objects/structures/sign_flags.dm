/obj/structure/sign/flag
	var/ripped = FALSE
	icon = 'icons/obj/decals.dmi'
	flammable = TRUE

/obj/structure/sign/flag/attack_hand(mob/user as mob)
	if (!ripped)
		playsound(loc, 'sound/items/poster_ripped.ogg', 100, TRUE)
		for (var/i = FALSE to 3)
			if (!do_after(user, 10))
				return
			playsound(loc, 'sound/items/poster_ripped.ogg', 100, TRUE)
		visible_message(SPAN_WARNING("[user] rips [src]!"))
		qdel(src)
	not_movable = FALSE
	not_disassemblable = TRUE

/obj/structure/sign/flag/green
	name = "\improper 绿色旗帜"
	desc = "一面绿色亚麻旗帜."
	icon_state = "green_banner"
/obj/structure/sign/flag/red
	name = "\improper 红色旗帜"
	desc = "一面红色亚麻旗帜."
	icon_state = "red_banner"
/obj/structure/sign/flag/red2
	name = "\improper 红色旗帜"
	desc = "一面红色亚麻旗帜,带有金色镶边."
	icon_state = "red_banner2"

/obj/structure/sign/flag/blue
	name = "\improper 蓝色旗帜"
	desc = "一面蓝色亚麻旗帜."
	icon_state = "blue_banner"

/obj/structure/sign/flag/reich
	name = "帝国旗帜"
	desc = "一面象征荣耀的帝国旗帜."
	icon_state = "reich"

/obj/structure/sign/flag/gb/imperial
	name = "河外帝国旗帜"
	desc = "一面河外帝国的帝国旗帜."
	icon_state = "flag_galacticempire"

/obj/structure/sign/flag/russia/wagner
	name = "瓦格纳集团徽章"
	desc = "臭名昭著的PMC集团徽章."
	icon_state = "flag_wag"

/obj/structure/sign/flag/usa/delta_force
	name = "三角洲部队徽章"
	desc = "第一特种部队作战分遣队-三角洲的徽章."
	icon_state = "delta_force"

/obj/structure/sign/flag/usa/delta_force/two
	icon_state = "delta_force2"

/obj/structure/sign/flag/usa/delta_force/three
	icon_state = "delta_force3"

/obj/structure/sign/flag/gb/rebel
	name = "恢复民主联盟旗帜"
	desc = "一面联盟的叛乱旗帜."
	icon_state = "flag_rebelalliance"

/obj/structure/sign/flag/gb/pysker
	name = "灵能者教团旗帜"
	desc = "一面古老灵能者教团的蓝白旗帜."
	icon_state = "flag_pysker"

/obj/structure/sign/flag/gb/cis
	name = "孤立主义星系邦联旗帜"
	desc = "一面亮蓝色与白色、带有圆形徽章的旗帜."
	icon_state = "flag_cis"

/obj/structure/sign/flag/blue2
	name = "\improper 蓝色旗帜"
	desc = "一面蓝色亚麻旗帜,带有金色镶边."
	icon_state = "blue_banner2"

/obj/structure/sign/flag/templar1
	name = "\improper 圣殿骑士旗帜"
	desc = "一面白色旗帜,中间有圣殿骑士的红色十字."
	icon_state = "templar_banner1"

/obj/structure/sign/flag/templar2
	name = "\improper 圣殿骑士旗帜"
	desc = "一面白色旗帜,中间有圣殿骑士的红色十字."
	icon_state = "templar_banner2"

/obj/structure/sign/flag/jihad1
	name = "\improper 黑色伊斯兰旗帜"
	desc = "一面黑色旗帜,上面用阿拉伯文写着真主."
	icon_state = "jihad1"

/obj/structure/sign/flag/jihad2
	name = "\improper 绿色伊斯兰旗帜"
	desc = "一面绿色旗帜,上面用阿拉伯文写着真主."
	icon_state = "jihad2"

/obj/structure/sign/flag/jihad3
	name = "\improper 红色伊斯兰旗帜"
	desc = "一面红色旗帜,上面有三个月亮."
	icon_state = "jihad3"

/obj/structure/sign/flag/jihad4
	name = "\improper 绿色伊斯兰旗帜"
	desc = "一面绿色旗帜,上面有清真言."
	icon_state = "jihad4"

/obj/structure/sign/flag/taliban
	name = "\improper 塔利班旗帜"
	desc = "一面塔利班的白色旗帜."
	icon_state = "flag_taliban"

/obj/structure/sign/flag/isis
	name = "\improper ISIS旗帜"
	desc = "一面ISIS的黑色旗帜."
	icon_state = "flag_isis"

/obj/structure/sign/flag/chechen
	name = "\improper 车臣旗帜"
	desc = "车臣分离主义者的旗帜."
	icon_state = "flag_chechen"

/obj/structure/sign/flag/ireland
	name = "\improper 爱尔兰旗帜"
	desc = "爱尔兰共和国旗帜."
	icon_state = "flag_ireland"

/obj/structure/sign/flag/gadsen
	name = "\improper 加兹登旗帜"
	desc = "经典的加兹登旗帜."
	icon_state = "flag_gadsen"
/obj/structure/sign/clock
	name = "\improper 时钟"
	desc = "一个时钟."
	icon_state = "clock"
/obj/structure/sign/clock/examine(mob/user)
	..()
	to_chat(user, "<big>现在是[clock_time()].</big>")
/obj/structure/sign/wide
	icon = 'icons/obj/decals_wide.dmi'
	bound_x = 32

/obj/structure/sign/wide/carpet
	name = "\improper 地毯"
	desc = "一块用于覆盖地板的成型厚材料."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "carpet"
	layer = OBJ_LAYER - 0.1

/obj/structure/sign/wide/carpet/purple
	icon_state = "carpet2"
/obj/structure/sign/wide/carpet/red
	icon_state = "carpet3"
/obj/structure/sign/wide/carpet/green
	icon_state = "carpet4"

/obj/structure/sign/wide/stalingrad
	name = "斯大林格勒标牌"
	desc = "一块破旧的标牌,用西里尔字母写着斯大林格勒."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "stalingrad"

/obj/structure/sign/wide/kandahar
	name = "坎大哈标志"
	desc = "一块破旧的标志牌,上面写着坎大哈."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "kandahar"

/obj/structure/sign/wide/vadso
	name = "瓦德瑟标志"
	desc = "一块写着瓦德瑟的标志牌."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "grestin"

/obj/structure/sign/wide/grestin
	name = "东格雷斯廷标志"
	desc = "一块略显破旧的标志牌,上面写着东格雷斯廷边境检查站."
	icon = 'icons/obj/decals_wide.dmi'
	icon_state = "grestin"

/obj/structure/sign
	anchored = TRUE

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if (1.0)
			qdel(src)
			return
		if (2.0)
			if (prob(66))
				qdel(src)
			return
		if (3.0)
			if (prob(33))
				qdel(src)
			return
		else
	return
/obj/structure/sign/radiation
	name = "该区域有辐射!"
	icon_state = "radiation"

/obj/structure/sign/radiation2
	name = "危险:辐射!"
	icon_state = "radiation2"

/obj/structure/sign/electricity
	name = "危险:电力!"
	icon_state = "shock"

/obj/structure/sign/traffic
	name = "停止标志"
	desc = ""
	icon_state = "stop"
	crushable = FALSE // To preserve map decorations

/obj/structure/sign/traffic/stop

/obj/structure/sign/traffic/crossing
	name = "人行横道标志"
	icon_state = "zebracrossing"

/obj/structure/sign/traffic/noentry
	name = "禁止通行标志"
	icon_state = "donotenter"

/obj/structure/sign/traffic/yeld
	name = "让行标志"
	icon_state = "yeld"

/obj/structure/sign/traffic/gas
	name = "加油站标志"
	icon_state = "gasolinesign"

/obj/structure/sign/traffic/cafe
	name = "咖啡馆标志"
	icon_state = "cafesign"

/obj/structure/sign/traffic/parking
	name = "停车标志"
	icon_state = "parking"

/obj/structure/sign/traffic/waysign
	name = "十字路口标志"
	icon_state = "waysign"

/obj/structure/sign/traffic/zebracrossing
	name = "人行横道"
	icon_state = "zebra"
	layer = 2

/obj/structure/sign/traffic/central
	name = "白线"
	icon_state = "centralline"
	layer = 2

/obj/structure/sign/traffic/semicircle
	name = "白线"
	icon = 'icons/obj/decals_wider.dmi'
	icon_state = "circle"
	layer = 2

/obj/structure/sign/traffic/semicircle/largest
	name = "白线"
	icon = 'icons/obj/decals_widest.dmi'
	pixel_y = -6
	icon_state = "circle"
	layer = 2

/obj/structure/sign/traffic/side
	name = "黄线"
	icon_state = "sideline"
	layer = 2

/obj/item/weapon/trafficcone
	name = "交通锥"
	icon = 'icons/obj/decals.dmi'
	icon_state = "cone1"
	anchored = FALSE
	w_class = ITEM_SIZE_LARGE
	flags = FALSE

/obj/item/weapon/trafficcone/New()
	..()
	icon_state = pick("cone1","cone2")

/obj/structure/sign/flag/medical
	name = "医疗旗帜"
	desc = "一面带有国际公认医疗与人道援助标志的旗帜."
	icon_state = "medical_flag"

/obj/structure/sign/flag/medical/crescent
	name = "红新月旗帜"
	desc = "一面带有医疗与人道援助新月标志的旗帜."
	icon_state = "medical_flag_crescent"

/obj/structure/sign/flag/medical/crystal
	name = "医疗水晶旗帜"
	desc = "一面带有医疗与人道援助水晶标志的旗帜."
	icon_state = "medical_flag_crystal"

/obj/structure/sign/flag/japanese
	name = "大日本帝国旗帜"
	desc = "一面带有日本帝国旭日图案的旗帜."
	icon_state = "flag_japan_empire"

/obj/structure/sign/flag/japanese/modern
	name = "日本旗帜"
	desc = "一面带有日本旭日图案的旗帜."
	icon_state = "flag_japan"

/obj/structure/sign/flag/chinese
	name = "中华民国旗帜"
	desc = "一面带有中华民国图案的旗帜."
	icon_state = "flag_china"
/obj/structure/sign/flag/chinese/prc
	name = "中华人民共和国旗帜"
	desc = "一面带有中华人民共和国图案的旗帜."
	icon_state = "flag_chinacommie"

/obj/structure/sign/flag/mongolia
	name = "蒙古国旗帜"
	desc = "一面蒙古国的旗帜."
	icon_state = "flag_mongolia"

/obj/structure/sign/flag/mongolia/communist
	name = "蒙古人民共和国旗帜"
	desc = "一面蒙古人民共和国的旗帜."
	icon_state = "flag_mongolia_communist"

/obj/structure/sign/flag/french
	name = "法国旗帜"
	desc = "一面三色法国旗帜."
	icon_state = "flag_france"

/obj/structure/sign/flag/denmark
	name = "丹麦旗帜"
	desc = "一面红白相间的丹尼布洛旗帜."
	icon_state = "flag_denmark"

/obj/structure/sign/flag/german
	name = "德意志帝国旗帜"
	desc = "一面德意志帝国的横向三色旗."
	icon_state = "flag_germany"

/obj/structure/sign/flag/german/modern
	name = "德国旗帜"
	desc = "一面德意志共和国的横向三色旗."
	icon_state = "flag_germany_republic"

/obj/structure/sign/flag/german/east
	name = "东德旗帜"
	desc = "一面德意志民主共和国的横向三色旗."
	icon_state = "flag_germany_east"

/obj/structure/sign/flag/uk
	name = "英国旗帜"
	desc = "一面英国的旗帜."
	icon_state = "flag_uk"

/obj/structure/sign/flag/russia
	name = "俄罗斯旗帜"
	desc = "一面俄罗斯的旗帜."
	icon_state = "flag_russia"

/obj/structure/sign/flag/russia/empire
	name = "俄罗斯帝国旗帜"
	desc = "一面俄罗斯帝国的旗帜."
	icon_state = "flag_russia_empire"

/obj/structure/sign/flag/russia/kornilov
	name = "科尔尼洛夫突击团旗帜"
	desc = "一面志愿军臭名昭著团的旗帜."
	icon_state = "flag_russia_kornilov"

/obj/structure/sign/flag/russia/navy
	name = "俄罗斯海军旗帜"
	desc = "一面俄罗斯海军的旗帜."
	icon_state = "flag_russia_andreev"

/obj/structure/sign/flag/russia/rsfsr
	name = "俄罗斯苏维埃联邦社会主义共和国旗帜"
	desc = "一面俄罗斯苏维埃联邦社会主义共和国的旗帜."
	icon_state = "flag_rsfsr"

/obj/structure/sign/flag/ukraine
	name = "乌克兰旗帜"
	desc = "一面乌克兰的旗帜."
	icon_state = "flag_ukraine"

/obj/structure/sign/flag/ukraine/upa
	name = "乌克兰起义军旗帜"
	desc = "一面被称为UPA的乌克兰起义军的旗帜."
	icon_state ="flag_ukraine_upa"

/obj/structure/sign/flag/ukraine/makhno
	name = "马赫诺运动旗帜"
	desc = "一面乌克兰革命起义军的旗帜.也被称为黑军或马赫诺运动."
	icon_state = "flag_makhno"

/obj/structure/sign/flag/doncossack
	name = "顿河哥萨克军旗帜"
	desc = "一面顿河哥萨克的旗帜."
	icon_state = "flag_doncossack"

/obj/structure/sign/flag/terekcossack
	name = "捷列克哥萨克军旗帜"
	desc = "一面捷列克哥萨克的旗帜."
	icon_state = "flag_terekcossack"

/obj/structure/sign/flag/poland
	name = "波兰旗帜"
	desc = "一面波兰的旗帜."
	icon_state = "flag_poland"

/obj/structure/sign/flag/ukraine/azov
	name = "亚速团旗帜"
	desc = "乌克兰国民警卫队臭名昭著的亚速团旗帜."
	icon_state ="flag_ukraine_azov"

/obj/structure/sign/flag/ukraine/rightsector
	name = "右区旗帜"
	desc = "乌克兰极右翼准军事运动的旗帜."
	icon_state ="flag_ukraine_rightsector"

/obj/structure/sign/flag/ukraine/dnr
	name = "顿涅茨克人民共和国旗帜"
	desc = "自行宣布成立的顿涅茨克人民共和国旗帜"
	icon_state = "flag_ukraine_dnr"

/obj/structure/sign/flag/ukraine/lnr
	name = "卢甘斯克人民共和国旗帜"
	desc = "自行宣布成立的卢甘斯克人民共和国旗帜"
	icon_state = "flag_ukraine_lnr"

/obj/structure/sign/flag/ukraine/afu
	name = "乌克兰武装部队旗帜"
	desc = "乌克兰武装部队的旗帜."
	icon_state ="flag_ukraine_vsu"

/obj/structure/sign/flag/vietnam
	name = "北越旗帜"
	desc = "北越旗帜."
	icon_state = "flag_vietnam"

/obj/structure/sign/flag/vietcong
	name = "越共旗帜"
	desc = "越共部队的蓝红旗帜."
	icon_state = "flag_vietcong"

/obj/structure/sign/flag/usa
	name = "美国旗帜"
	desc = "星条旗."
	icon_state = "flag_usa"

/obj/structure/sign/flag/usa_union
	name = "联邦旗帜"
	desc = "飘扬在蓝衣军队上方的红白蓝旗帜."
	icon_state = "flag_union"

/obj/structure/sign/flag/usa_confed
	name = "邦联旗帜"
	desc = "邦联国的旗帜."
	icon_state = "flag_confederate"

/obj/structure/sign/flag/texas
	name = "德克萨斯旗帜"
	desc = "德克萨斯州的旗帜."
	icon_state = "flag_texas"

/obj/structure/sign/flag/sov
	name = "苏联旗帜"
	desc = "苏联的红旗."
	icon_state = "flag_sov"

/obj/structure/sign/flag/sov/navy
	name = "苏联海军旗帜"
	desc = "苏联武装力量海军军种的旗帜."
	icon_state = "flag_sovfleet"

/obj/structure/sign/flag/sov/vdv
	name = "苏联空降军旗帜"
	desc = "苏联空降军的旗帜."
	icon_state = "flag_vdv"

/obj/structure/sign/flag/sov/air
	name = "苏联空军旗帜"
	desc = "苏联空军的旗帜."
	icon_state = "flag_sovair"

/obj/structure/sign/flag/sov/border
	name = "苏联边防军旗帜"
	desc = "苏联边防军的旗帜."
	icon_state = "flag_sovborder"

/obj/structure/sign/flag/nazi
	name = "第三帝国旗帜"
	desc = "第三帝国的红白黑旗帜."
	icon_state = "flag_nazi"

/obj/structure/sign/flag/israel
	name = "以色列旗帜"
	desc = "以色列的白蓝旗帜, 中间有六角星."
	icon_state = "flag_israel"

/obj/structure/sign/flag/un
	name = "联合国旗帜"
	desc = "联合国的旗帜."
	icon_state = "flag_un"

/obj/structure/sign/flag/dutch
	name = "荷兰旗帜"
	desc = "荷兰的旗帜."
	icon_state = "flag_netherlands"

/obj/structure/sign/flag/dutch_old
	name = "亲王旗"
	desc = "荷兰旗帜."
	icon_state = "flag_netherlands_old"

/obj/structure/sign/flag/chetnik
	name = "切特尼克旗帜"
	desc = "切特尼克旗帜."
	icon_state = "flag_chetnik"

/obj/structure/sign/flag/yugoslavia
	name = "南斯拉夫旗帜"
	desc = "南斯拉夫的旗帜."
	icon_state = "flag_yugo"

/obj/structure/sign/flag/yugoslavia/partisan
	name = "南斯拉夫旗帜"
	desc = "南斯拉夫游击队的旗帜."
	icon_state = "flag_yugopart"

/obj/structure/sign/flag/gns
	name = "救国政府旗帜"
	desc = "救国政府的旗帜."
	icon_state = "flag_gns"

/obj/structure/sign/flag/ssg
	name = "塞尔维亚国家卫队旗帜"
	desc = "塞尔维亚国家卫队的旗帜."
	icon_state = "flag_ssg"

/obj/structure/sign/flag/australia
	name = "澳大利亚旗帜"
	desc = "澳大利亚的旗帜."
	icon_state = "flag_australia"

/obj/structure/sign/flag/canada
	name = "加拿大旗帜"
	desc = "加拿大的旗帜."
	icon_state = "flag_canada"

/obj/structure/sign/flag/hezbollah
	name = "真主党旗帜"
	desc = "什叶派真主党组织的黄绿旗帜."
	icon_state = "flag_hezbollah"

/obj/structure/sign/flag/philippine
	name = "菲律宾旗帜"
	desc = "菲律宾的旗帜."
	icon_state = "flag_fp"

/obj/structure/sign/flag/philippine_war
	name = "菲律宾旗帜"
	desc = "菲律宾的旗帜. 战时翻转."
	icon_state = "flag_fp_war"

/obj/structure/sign/flag/pirate
	name = "海盗旗"
	desc = "黑色海盗旗, 中间有骷髅."
	icon_state = "pirate"

/obj/structure/sign/flag/firstcav
	name = "第1骑兵师旗帜"
	desc = "美国陆军第1骑兵师的旗帜."
	icon_state = "flag_1stcav"

/obj/structure/sign/flag/cuba
	name = "古巴旗帜"
	desc = "古巴的旗帜."
	icon_state = "flag_cuba"

/obj/structure/sign/flag/colombia
	name = "哥伦比亚旗帜"
	desc = "哥伦比亚的旗帜."
	icon_state = "flag_colombia"

/obj/structure/sign/flag/colombia/farc
	name = "哥伦比亚革命武装力量旗帜"
	desc = "哥伦比亚革命武装力量的旗帜."
	icon_state = "flag_colombia_farc"

/obj/structure/sign/flag/mexico
	name = "墨西哥旗帜"
	desc = "墨西哥的旗帜."
	icon_state = "flag_mexico"

/obj/structure/sign/flag/brazil
	name = "巴西旗帜"
	desc = "巴西国旗."
	icon_state = "flag_brazil"

/obj/structure/sign/flag/brazil/empire
	name = "巴西帝国国旗"
	desc = "巴西帝国国旗."
	icon_state = "flag_brazil_empire"

/obj/structure/sign/flag/paraguay
	name = "巴拉圭国旗"
	desc = "巴拉圭国旗."
	icon_state = "flag_paraguay"

/obj/structure/sign/flag/argentina
	name = "阿根廷国旗"
	desc = "阿根廷国旗."
	icon_state = "flag_argentina"

/obj/structure/sign/flag/venezuela
	name = "委内瑞拉国旗"
	desc = "委内瑞拉国旗."
	icon_state = "flag_venezuela"

/obj/structure/sign/flag/peru
	name = "秘鲁国旗"
	desc = "秘鲁国旗."
	icon_state = "flag_peru"

/obj/structure/sign/flag/bolivia
	name = "玻利维亚国旗"
	desc = "玻利维亚国旗."
	icon_state = "flag_bolivia"

/obj/structure/sign/flag/chile
	name = "智利国旗"
	desc = "智利国旗."
	icon_state = "flag_chile"

/obj/structure/sign/flag/afghan/dra
	name = "阿富汗民主共和国国旗"
	desc = "阿富汗民主共和国国旗."
	icon_state = "flag_dra"

/obj/structure/sign/flag/iran
	name = "伊朗国旗"
	desc = "伊朗国旗."
	icon_state = "flag_iran"

/obj/structure/sign/flag/iraq
	name = "伊拉克国旗"
	desc = "伊拉克国旗."
	icon_state = "flag_iraq"

/obj/structure/sign/flag/syria
	name = "阿拉伯叙利亚共和国国旗"
	desc = "阿拉伯叙利亚共和国国旗."
	icon_state = "flag_syria"

/obj/structure/sign/flag/syria/fsa
	name = "自由叙利亚军国旗"
	desc = "自由叙利亚军国旗."
	icon_state = "flag_syria_fsa"

/obj/structure/sign/flag/syria/ssg
	name = "叙利亚救国政府国旗"
	desc = "叙利亚救国政府国旗."
	icon_state = "flag_syria_sal"

/obj/structure/sign/flag/fsa
	name = "自由叙利亚军国旗"
	desc = "自由叙利亚军国旗."
	icon_state = "flag_syria_fsa"

/obj/structure/sign/flag/turkey
	name = "土耳其国旗"
	desc = "土耳其国旗."
	icon_state = "flag_turkey"

/obj/structure/sign/flag/kurdistan
	name = "库尔德斯坦国旗"
	desc = "库尔德斯坦国旗."
	icon_state = "flag_kurdistan"

/obj/structure/sign/flag/georgia
	name = "格鲁吉亚国旗"
	desc = "格鲁吉亚国旗."
	icon_state = "flag_georgia"

/obj/structure/sign/flag/georgia/old
	name = "格鲁吉亚国旗"
	desc = "格鲁吉亚国旗. 1990年至2004年使用."
	icon_state = "flag_georgia_old"

/obj/structure/sign/flag/india
	name = "印度国旗"
	desc = "印度国旗."
	icon_state = "flag_india"

/obj/structure/sign/flag/pakistan
	name = "巴基斯坦国旗"
	desc = "巴基斯坦国旗."
	icon_state = "flag_pakistan"

/obj/structure/sign/flag/italy
	name = "意大利国旗"
	desc = "意大利国旗."
	icon_state = "flag_italy"

/obj/structure/sign/flag/finland
	name = "芬兰国旗"
	desc = "芬兰国旗."
	icon_state = "flag_finland"

/obj/structure/sign/flag/nigeria
	name = "尼日利亚国旗"
	desc = "尼日利亚国旗."
	icon_state = "flag_nigeria"

/obj/structure/sign/flag/ethiopia
	name = "埃塞俄比亚国旗"
	desc = "埃塞俄比亚国旗."
	icon_state = "flag_ethiopia"

/obj/structure/sign/flag/armenia
	name = "亚美尼亚国旗"
	desc = "亚美尼亚国旗."
	icon_state = "flag_armenia"

/obj/structure/sign/flag/azerbaijan
	name = "阿塞拜疆国旗"
	desc = "阿塞拜疆共和国国旗."
	icon_state = "flag_azerbaijan"

/obj/structure/sign/flag/bosnia
	name = "波斯尼亚国旗"
	desc = "波斯尼亚国旗."
	icon_state = "flag_bosnia"

/obj/structure/sign/flag/kosovo
	name = "科索沃国旗"
	desc = "科索沃国旗."
	icon_state = "flag_kosovo"

/obj/structure/sign/flag/albania
	name = "阿尔巴尼亚国旗"
	desc = "阿尔巴尼亚国旗."
	icon_state = "flag_albania"

/obj/structure/sign/flag/spain
	name = "西班牙国旗"
	desc = "西班牙国旗."
	icon_state = "flag_spain"

/obj/structure/sign/flag/spain/nationalist
	name = "西班牙民族主义国旗"
	desc = "西班牙民族主义国旗."
	icon_state = "flag_spainn"

/obj/structure/sign/flag/serbia
	name = "塞尔维亚国旗"
	desc = "塞尔维亚国旗."
	icon_state = "flag_serbia"

/obj/structure/sign/flag/romania
	name = "罗马尼亚国旗"
	desc = "罗马尼亚国旗."
	icon_state = "flag_romania"

/obj/structure/sign/flag/romania/socialist
	name = "罗马尼亚社会主义共和国国旗"
	desc = "罗马尼亚社会主义共和国国旗."
	icon_state = "flag_romania_soc"

/obj/structure/sign/flag/moldova
	name = "摩尔多瓦国旗"
	desc = "摩尔多瓦共和国国旗."
	icon_state = "flag_moldova"

/obj/structure/sign/flag/moldova/transnistria
	name = "德涅斯特河沿岸国旗"
	desc = "德涅斯特河沿岸摩尔达维亚共和国国旗."
	icon_state = "flag_transnistria"

/obj/structure/sign/flag/czech
	name = "捷克斯洛伐克国旗"
	desc = "捷克斯洛伐克国旗."
	icon_state = "flag_czech"

/obj/structure/sign/flag/hungary
	name = "匈牙利国旗"
	desc = "匈牙利国旗."
	icon_state = "flag_hungary"

/obj/structure/sign/flag/hungary/sov
	name = "匈牙利人民共和国国旗"
	desc = "匈牙利人民共和国国旗."
	icon_state = "flag_hungary_sov"

/obj/structure/sign/flag/hungary/old
	desc = "带有小国徽的匈牙利国旗."
	icon_state = "flag_hungary_kingdom"

/obj/structure/sign/flag/finland
	name = "芬兰国旗"
	desc = "芬兰国旗."
	icon_state = "flag_finland"

/obj/structure/sign/flag/wales
	name = "威尔士国旗"
	desc = "威尔士国旗."
	icon_state = "flag_wales"

/obj/structure/sign/flag/warpact
	name = "华约国旗"
	desc = "华沙条约组织国旗."
	icon_state = "flag_warpact"

/obj/structure/sign/flag/warpact/alt
	icon_state = "flag_warpact2"

/obj/structure/sign/flag/nato
	name = "北约国旗"
	desc = "北大西洋公约组织国旗."
	icon_state = "flag_nato"

/obj/structure/sign/flag/redmenia
	name = "雷德梅尼亚国旗"
	desc = "雷德梅尼亚帝国国旗."
	icon_state = "flag_redmenia"

/obj/structure/sign/flag/blugoslavia
	name = "布鲁戈斯拉维亚国旗"
	desc = "布鲁戈斯拉维亚共和国国旗."
	icon_state = "flag_blugoslavia"

/obj/structure/sign/flag/blugoslavia/old
	name = "旧布鲁戈斯拉维亚国旗"
	desc = "旧布鲁戈斯拉维亚共和国国旗."
	icon_state = "flag_blugoslavia-old"

/obj/structure/sign/flag/arstotzka
	name = "阿尔斯托兹卡国旗"
	desc = "阿尔斯托兹卡万岁!"
	icon_state = "flag_arstotzka"

/obj/structure/sign/flag/custom
	name = "旗帜"
	desc = "一面旗帜."
	icon_state = "f_white"

/obj/structure/sign/logo/red
	name = "雷德尼科夫工业标志"
	desc = "带有雷德尼科夫工业标志的标牌"
	icon_state = "red_logo"
/obj/structure/sign/logo/yellow
	name = "戈德斯坦解决方案"
	desc = "带有戈德斯坦解决方案标志的标牌"
	icon_state = "yellow_logo"
/obj/structure/sign/logo/blue
	name = "乔瓦尼·布鲁股票"
	desc = "带有乔瓦尼·布鲁股票标志的标牌"
	icon_state = "blue_logo"
/obj/structure/sign/logo/green
	name = "科加马工匠"
	desc = "带有科加马工匠贸易商标志的标牌"
	icon_state = "green_logo"

/obj/item/flagmaker
	name = "自定义旗帜制作器"
	desc = "一块白棉布和一些彩色墨水."
	icon = 'icons/obj/decals.dmi'
	icon_state = "flagmaker"
	var/new_icon_state = "White"

/obj/item/flagmaker/attack_self(mob/user)
	var/stop = FALSE

	var/list/display1 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "Cancel")
	var/choice1 = WWinput(user, "What background color do you want for the flag?", "Flag Maker", "Cancel", display1)
	switch (choice1)
		if ("Cancel")
			new_icon_state = "none"
			icon_state = "none"
			stop = TRUE
			return
		if ("White")
			new_icon_state = "f_white"
			icon_state = "f_white"
		if ("Black")
			new_icon_state = "f_black"
			icon_state = "f_black"
		if ("Yellow")
			new_icon_state = "f_yellow"
			icon_state = "f_yellow"
		if ("Blue")
			new_icon_state = "f_blue"
			icon_state = "f_blue"
		if ("Red")
			new_icon_state = "f_red"
			icon_state = "f_red"
		if ("Green")
			new_icon_state = "f_green"
			icon_state = "f_green"

	var/list/display2 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "No")
	var/choice2 = WWinput(user, "Add a left-half color?", "Flag Maker", "No", display2)
	switch (choice2)
		if ("No")
			icon_state = new_icon_state
		if ("White")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_white")
			overlays += flag_left
		if ("Black")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_black")
			overlays += flag_left
		if ("Yellow")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_yellow")
			overlays += flag_left
		if ("Blue")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_blue")
			overlays += flag_left
		if ("Red")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_red")
			overlays += flag_left
		if ("Green")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fl_green")
			overlays += flag_left

	var/list/display3 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "No")
	var/choice3 = WWinput(user, "Add a right-half color?", "Flag Maker", "No", display3)
	switch (choice3)
		if ("No")
			icon_state = new_icon_state
		if ("White")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_white")
			overlays += flag_left
		if ("Black")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_black")
			overlays += flag_left
		if ("Yellow")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_yellow")
			overlays += flag_left
		if ("Blue")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_blue")
			overlays += flag_left
		if ("Red")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_red")
			overlays += flag_left
		if ("Green")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "fr_green")
			overlays += flag_left

	var/list/display4 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "No")
	var/choice4 = WWinput(user, "Add a left-third color?", "Flag Maker", "No", display4)
	switch (choice4)
		if ("No")
			icon_state = new_icon_state
		if ("White")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_white")
			overlays += flag_left
		if ("Black")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_black")
			overlays += flag_left
		if ("Yellow")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_yellow")
			overlays += flag_left
		if ("Blue")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_blue")
			overlays += flag_left
		if ("Red")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_red")
			overlays += flag_left
		if ("Green")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f1_green")
			overlays += flag_left

	var/list/display5 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "No")
	var/choice5 = WWinput(user, "Add a center-third color?", "Flag Maker", "No", display5)
	switch (choice5)
		if ("No")
			icon_state = new_icon_state
		if ("White")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_white")
			overlays += flag_left
		if ("Black")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_black")
			overlays += flag_left
		if ("Yellow")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_yellow")
			overlays += flag_left
		if ("Blue")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_blue")
			overlays += flag_left
		if ("Red")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_red")
			overlays += flag_left
		if ("Green")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f2_green")
			overlays += flag_left

	var/list/display6 = list("White", "Black", "Yellow", "Blue", "Red", "Green", "No")
	var/choice6 = WWinput(user, "Add a right-third color?", "Flag Maker", "No", display6)
	switch (choice6)
		if ("No")
			icon_state = new_icon_state
		if ("White")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_white")
			overlays += flag_left
		if ("Black")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_black")
			overlays += flag_left
		if ("Yellow")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_yellow")
			overlays += flag_left
		if ("Blue")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_blue")
			overlays += flag_left
		if ("Red")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_red")
			overlays += flag_left
		if ("Green")
			var/image/flag_left = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "f3_green")
			overlays += flag_left

	var/list/display7 = list("White Cross", "Black Cross", "Blue Cross", "Red Cross", "Green Cross", "No")
	var/choice7 = WWinput(user, "Add a cross?", "Flag Maker", "No", display7)
	switch (choice7)
		if ("No")
			icon_state = new_icon_state
		if ("White Cross")
			var/image/cross = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_bigcross2")
			overlays += cross
		if ("Black Cross")
			var/image/cross = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_bigcross0")
			overlays += cross
		if ("Blue Cross")
			var/image/cross = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_bigcross3")
			overlays += cross
		if ("Red Cross")
			var/image/cross = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_bigcross1")
			overlays += cross
		if ("Green Cross")
			var/image/cross = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_bigcross4")
			overlays += cross

	var/list/display8 = list("White Saltire", "Black Saltire", "Blue Saltire", "Red Saltire", "Green Saltire", "No")
	var/choice8 = WWinput(user, "Add a saltire?", "Flag Maker", "No", display8)
	switch (choice8)
		if ("No")
			icon_state = new_icon_state
		if ("White Saltire")
			var/image/saltire = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_saltire2")
			overlays += saltire
		if ("Black Saltire")
			var/image/saltire = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_saltire0")
			overlays += saltire
		if ("Blue Saltire")
			var/image/saltire = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_saltire3")
			overlays += saltire
		if ("Red Saltire")
			var/image/saltire = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_saltire1")
			overlays += saltire
		if ("Green Saltire")
			var/image/saltire = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_saltire4")
			overlays += saltire

	var/list/display9 = list("White Star", "Golden Star", "Black Star", "White Moon", "Golden Moon", "Black Moon", "White Cross", "Golden Cross", "Black Cross", "Red Circle", "Thin Red Sun", "Thick Red Sun", "White Skull", "White Peace Sign", "Black Peace Sign", "No")
	var/choice9 = WWinput(user, "Add a symbol?", "Flag Maker", "No", display9)
	switch (choice9)
		if ("No")
			icon_state = new_icon_state
		if ("White Star")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_star0")
			overlays += flag_symbol
		if ("Golden Star")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_star1")
			overlays += flag_symbol
		if ("Black Star")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_star2")
			overlays += flag_symbol

		if ("White Moon")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_moon0")
			overlays += flag_symbol
		if ("Golden Moon")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_moon1")
			overlays += flag_symbol
		if ("Black Moon")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_moon2")
			overlays += flag_symbol

		if ("White Cross")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_cross0")
			overlays += flag_symbol
		if ("Golden Cross")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_cross1")
			overlays += flag_symbol
		if ("Black Cross")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_cross2")
			overlays += flag_symbol

		if ("Red Circle")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_circle0")
			overlays += flag_symbol
		if ("Thin Red Sun")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_sun0")
			overlays += flag_symbol
		if ("Thick Red Sun")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_sun1")
			overlays += flag_symbol

		if ("Black Peace Sign")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_peace0")
			overlays += flag_symbol
		if ("White Peace Sign")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_peace1")
			overlays += flag_symbol

		if ("White Skull")
			var/image/flag_symbol = image("icon" = 'icons/obj/decals.dmi', "icon_state" = "e_skull0")
			overlays += flag_symbol

	var/flag_name = input(usr, "Name the flag:") as text|null
	if (flag_name == "" || flag_name == null)
		name = "flag"
	else
		name = sanitize(flag_name, 50)

	var/obj/structure/sign/flag/custom/CF = new/obj/structure/sign/flag/custom(user.loc)
	CF.overlays = overlays
	CF.icon_state = new_icon_state
	CF.name = name
	if (stop)
		qdel(CF)
	else
		qdel(src)
	return