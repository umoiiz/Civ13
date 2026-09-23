/*Index*/
/*  * - Stone-Age Uniforms
    * - Stone-Age Pelt Coats
    * - Indian-Carib Cultural Clothing
    * - Indian-Carib Cultural Accessories
    * - Bone Clothing, Armor & Accessories
    * - Stone-Age Masks
    * - Zulu
    * - Miscallaneous */

/* Stone-Age Uniforms*/

/obj/item/clothing/under/loinleather
	name = "皮革缠腰布"
	desc = "一条缠绕在腰间的皮革布."
	icon_state = "leatherloincloth1"
	item_state = "leatherloincloth1"

/obj/item/clothing/under/loinleather/New()
	..()
	var/randcloth = pick(1,2,3,4)
	icon_state = "leatherloincloth[randcloth]"
	item_state = "leatherloincloth[randcloth]"

/obj/item/clothing/under/loincotton
	name = "棉质缠腰布"
	desc = "一条缠绕在腰间的棉质缠腰布."
	icon_state = "loincloth1"
	item_state = "loincloth1"

/obj/item/clothing/under/leaves_skirt
	name = "树叶裙"
	desc = "一条缠绕在腰间的树叶."
	icon_state = "leaves_skirt"
	item_state = "leaves_skirt"

/obj/item/clothing/under/leaves_skirt/long
	name = "长树叶裙"
	icon_state = "leaves_skirt_long"
	item_state = "leaves_skirt_long"

/* Stone-Age Pelt Coats*/

/obj/item/clothing/suit/prehistoricfurcoat
	name = "原始毛皮外套"
	icon_state = "prehistoric_fur1"
	item_state = "prehistoric_fur1"
	desc = "一件由兽皮制成的简易毛皮外套,用于保护早期人类免受恶劣环境侵袭."
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEG_LEFT|LEG_RIGHT|ARM_LEFT|ARM_RIGHT
	armor = list(melee = 10, arrow = 15, gun = FALSE, energy = 15, bomb = 5, bio = 30, rad = 25)
	var/specific = FALSE
	var/colorn = 2

/obj/item/clothing/suit/prehistoricfurcoat/brown
	name = "棕色原始毛皮外套"
	desc = "一件由兽皮制成的简易棕色毛皮外套,用于保护早期人类免受恶劣环境侵袭."
	specific = TRUE
	colorn = 1

/obj/item/clothing/suit/prehistoricfurcoat/black
	name = "黑色原始毛皮外套"
	desc = "一件由兽皮制成的简易黑色毛皮外套,用于保护早期人类免受恶劣环境侵袭."
	icon_state = "prehistoric_fur2"
	item_state = "prehistoric_fur2"
	specific = TRUE
	colorn = 2

/obj/item/clothing/suit/prehistoricfurcoat/white
	name = "白色原始毛皮外套"
	desc = "一件由兽皮制成的简易白色毛皮外套,用于保护早期人类免受恶劣环境侵袭."
	icon_state = "prehistoric_fur3"
	item_state = "prehistoric_fur3"
	specific = TRUE
	colorn = 3

/obj/item/clothing/suit/prehistoricfurcoat/grey
	name = "灰色原始毛皮外套"
	desc = "一件由兽皮制成的简易灰色毛皮外套,用于保护早期人类免受恶劣环境侵袭."
	icon_state = "prehistoric_fur4"
	item_state = "prehistoric_fur4"
	specific = TRUE
	colorn = 4

/obj/item/clothing/suit/prehistoricfurcoat/New()
	..()
	if (!specific)
		colorn = pick(1,2,3,4)
		icon_state = "prehistoric_fur[colorn]"
		item_state = "prehistoric_fur[colorn]"

/* Indian-Carib Cultural Clothing*/

/obj/item/clothing/under/indian1
	name = "短皮革缠腰布"
	desc = "一条缠绕在腰间的皮革布."
	icon_state = "indian1"
	item_state = "indian1"

/obj/item/clothing/under/indian2
	name = "长皮革缠腰布"
	desc = "一条缠绕在腰间的皮革布."
	icon_state = "indian2"
	item_state = "indian2"

/obj/item/clothing/under/indian3
	name = "遮胸皮革缠腰布"
	desc = "一条缠绕在腰间和胸前的皮革布."
	icon_state = "indian3"
	item_state = "indian3"

/obj/item/clothing/under/indianchief
	name = "印第安酋长服饰"
	desc = "一条由部落酋长穿着的精美皮革布."
	icon_state = "indianchef"
	item_state = "indianchef"

/obj/item/clothing/under/indianshaman
	name = "印第安萨满服饰"
	desc = "一条缠绕在腰间的白布,绘有宗教符号."
	icon_state = "indianshaman"
	item_state = "indianshaman"

/obj/item/clothing/under/indianhuge
	name = "大豹皮"
	desc = "一张巨大的豹皮."
	icon_state = "giant_leopard_pelt"
	item_state = "giant_leopard_pelt"

	/* Indian-Carib Cultural Accessories*/

/obj/item/clothing/accessory/armband/indian1
	name = "印第安配饰"
	desc = "红色面部彩绘和印第安项链."
	icon_state = "indian1"
	item_state = "indian1"

/obj/item/clothing/accessory/armband/indian2
	name = "印第安配饰"
	desc = "金色印第安项链."
	icon_state = "indian2"
	item_state = "indian2"

/obj/item/clothing/accessory/armband/indianshaman
	name = "印第安萨满身体彩绘"
	desc = "原住民萨满穿着的红白身体彩绘."
	icon_state = "indianshaman"
	item_state = "indianshaman"

/obj/item/clothing/accessory/armband/indianr
	name = "红色印第安配饰"
	desc = "红色面部彩绘和印第安项链."
	icon_state = "indianr"
	item_state = "indianr"

/obj/item/clothing/accessory/armband/indiang
	name = "绿色印第安配饰"
	desc = "绿色面部彩绘和印第安项链."
	icon_state = "indiang"
	item_state = "indiang"

/obj/item/clothing/accessory/armband/indianb
	name = "蓝色印第安配饰"
	desc = "蓝色面部彩绘和印第安项链."
	icon_state = "indianb"
	item_state = "indianb"

/obj/item/clothing/accessory/armband/indiany
	name = "黄色印第安配饰"
	desc = "黄色面部彩绘和印第安项链."
	icon_state = "indiany"
	item_state = "indiany"

/obj/item/clothing/accessory/armband/indianw
	name = "白色印第安配饰"
	desc = "白色面部彩绘和印第安项链."
	icon_state = "indianw"
	item_state = "indianw"

/obj/item/clothing/accessory/armband/indianbl
	name = "黑色印第安配饰"
	desc = "黑色面部彩绘和印第安项链."
	icon_state = "indianbl"
	item_state = "indianbl"

/* Bone Clothing, Armor & Accessories*/

/obj/item/clothing/suit/storage/jacket/bonearmor
	name = "骨甲"
	desc = "一套由各种骨头制成的阴森盔甲."
	icon_state = "bonearmor"
	item_state = "bonearmor"
	armor = list(melee = 50, arrow = 15, gun = 0, energy = 0, bomb = 10, bio = 0, rad = FALSE)

/obj/item/clothing/head/helmet/bone
	name = "骨头盔"
	desc = "一顶由骨头制成的头盔."
	icon_state = "bone_helmet"
	item_state = "bone_helmet"
	armor = list(melee = 25, arrow = 15, gun = 10, energy = 16, bomb = 16, bio = 16, rad = FALSE)

/obj/item/clothing/suit/woodarmor
	name = "原始木甲"
	desc = "一套由植物纤维绳绑在一起的小木板制成的木制盔甲."
	icon_state = "wooden_chestarmor"
	item_state = "wooden_chestarmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 15, arrow = 18, gun = FALSE, energy = 10, bomb = 4, bio = 20, rad = 15)

/obj/item/clothing/suit/hairbonearmor
	name = "原始骨管甲"
	desc = "一套由植物纤维绳绑在一起的紧密排列的小骨头制成的骨制胸甲."
	icon_state = "native_bonearmor"
	item_state = "native_bonearmor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 21, arrow = 13, gun = FALSE, energy = 8, bomb = 6, bio = 10, rad = 18)

/obj/item/clothing/accessory/armband/talisman
	name = "骨护身符"
	desc = "一个骨制护身符."
	icon_state = "talisman"
	item_state = "talisman"
	slot = "decor"
	var/religion = "none"

/* Stone-Age Masks*/

/obj/item/clothing/mask/skullmask
	name = "骷髅面具"
	desc = "萨满使用的骷髅面具."
	icon_state = "skull_mask"
	item_state = "skull_mask"
	body_parts_covered = FACE|EYES
	armor = list(melee = 25, arrow = 10, gun = 0, energy = 0, bomb = 15, bio = 0, rad = FALSE)

/obj/item/clothing/mask/wooden
	name = "木制面具"
	desc = "一个部落木制面具."
	icon_state = "woodenmask"
	item_state = "woodenmask"
	body_parts_covered = FACE|EYES
	armor = list(melee = 15, arrow = 10, gun = 0, energy = 0, bomb = 10, bio = 0, rad = FALSE)
	flags_inv = BLOCKHAIR

/obj/item/clothing/mask/wooden/expressive
	name = "表情木制面具"
	desc = "一个部落木制面具.这个面具上固定着一个咧嘴笑的表情"
	icon_state = "bumba"
	item_state = "bumba"

/* Zulu*/

/obj/item/clothing/under/zulu_slene
	name = "塞莱内牛毛缠腰布"
	desc = "一条由牛毛流苏制成的缠腰布,常由祖鲁人穿着."
	icon_state = "zulu_slene"
	item_state = "zulu_slene"

/obj/item/clothing/suit/zulu_mbata
	name = "姆巴塔兽皮背心"
	desc = "一件由大型猫科动物皮毛制成的肩部背心,由祖鲁人在仪式和军装中穿着."
	icon_state = "zulu_mbata"
	item_state = "zulu_mbata"

/obj/item/clothing/head/zulu_umghele
	name = "乌姆盖勒头带"
	desc = "一条由大型猫科动物皮毛制成的头带,由祖鲁人在仪式和军装中穿着."
	icon_state = "zulu_umghele"
	item_state = "zulu_umghele"

/* Pygmy */

/obj/item/clothing/under/indianchief/pygmy
	name = "侏儒酋长服饰"
	desc = "一件由皮革布料制成的精致裹布,由部落酋长穿着."
	icon_state = "indianchef"
	item_state = "indianchef"

/obj/item/clothing/under/indianshaman/pygmy
	name = "侏儒萨满服饰"
	desc = "一块白色布料,缠绕在腰间,绘有宗教符号."
	icon_state = "indianshaman"
	item_state = "indianshaman"

/obj/item/clothing/accessory/armband/indian2/pygmy
	name = "印第安饰品"
	desc = "金色印第安项链."
	icon_state = "indian2"
	item_state = "indian2"

/obj/item/clothing/head/leaves
	name = "树叶头罩"
	desc = "一束简单的树叶,压制成简易头饰."
	icon_state = "leaf_hat"
	item_state = "leaf_hat"

/obj/item/clothing/head/leaves/crown
	name = "树叶王冠"
	desc = "一顶由树叶组装而成的王冠,用皮带固定."
	icon_state = "leaf_crown"
	item_state = "leaf_crown"

/obj/item/clothing/head/leaves/star_platinum // jojo meme
	name = "星辰白金头带"
	desc = "一条注入灵性的头带,让你的头发在风中狂野飘扬,你感觉自己可以无尽地出拳."
	icon_state = "star_platinum"
	item_state = "star_platinum"

/obj/item/clothing/mask/wooden/african
	name = "黑色非洲木面具"
	desc = "一个非洲部落木制面具.常用于仪式目的"
	icon_state = "african1"
	item_state = "african1"
	flags_inv = BLOCKHAIR|BLOCKHEADHAIR

/* Miscallaneous*/

// These three seem misplaced, someone ought to revise the implementation & placement later.
/obj/item/clothing/mask/iogplate
	name = "防弹面罩"
	desc = "一个防弹面罩.用于保护你漂亮的脸蛋."
	icon_state = "iogplate"
	item_state = "iogplate"
	body_parts_covered = FACE|EYES
	flags = CONDUCT
	armor = list(melee = 80, arrow = 70, gun = 90, energy = 20, bomb = 40, bio = 25, rad = FALSE)

/obj/item/clothing/mask/salamon
	name = "镀金面具"
	desc = "一个镀金的面具.看起来很昂贵."
	icon_state = "salamon"
	item_state = "salamon"
	flags = CONDUCT
	body_parts_covered = FACE|EYES
	armor = list(melee = 5, arrow = 14, gun = 10, energy = 20, bomb = 10, bio = 10, rad = FALSE)

/////////////////////////////

/obj/item/clothing/head/chief_hat
	name = "酋长帽"
	desc = "一顶用羽毛制成的帽子.由部落领袖穿着."
	icon_state = "chief_hat"
	item_state = "chief_hat"
	flags_inv = BLOCKHEADHAIR

/obj/item/weapon/storage/backpack/quiver
	name = "箭袋"
	desc = "携带弓和箭的最佳方式."
	icon = 'icons/obj/storage.dmi'
	icon_state = "quiver"
	item_state = "quiver"
	slot_flags = SLOT_BACK | SLOT_BELT

/obj/item/weapon/storage/backpack/quiver/New()
		..()
		can_hold = list(/obj/item/ammo_casing/bolt, /obj/item/ammo_casing/arrow, /obj/item/weapon/gun/projectile/bow, /obj/item/weapon/material/pilum)

/obj/item/weapon/storage/backpack/quiver/full/New()
	..()
	can_hold = list(/obj/item/ammo_casing/bolt, /obj/item/ammo_casing/arrow, /obj/item/weapon/gun/projectile/bow, /obj/item/weapon/material/pilum)
	for (var/i=1, i<=14, i++)
		new /obj/item/ammo_casing/arrow/bronze(src)

/obj/item/weapon/storage/backpack/quiver/medieval/New()
	..()
	can_hold = list(/obj/item/ammo_casing/bolt, /obj/item/ammo_casing/arrow, /obj/item/weapon/gun/projectile/bow, /obj/item/weapon/material/pilum)
	for (var/i=1, i<=14, i++)
		new /obj/item/ammo_casing/arrow/iron(src)

/obj/item/weapon/storage/backpack/quiver/crossbow/New()
	..()
	can_hold = list(/obj/item/ammo_casing/bolt, /obj/item/ammo_casing/arrow, /obj/item/weapon/gun/projectile/bow, /obj/item/weapon/material/pilum)
	for (var/i=1, i<=14, i++)
		new /obj/item/ammo_casing/bolt/iron(src)

/obj/item/weapon/storage/backpack/quiver/poison/New()
	..()
	for (var/i=1, i<=10, i++)
		new /obj/item/ammo_casing/arrow/vial/poisonous(src)

/obj/item/clothing/under/leaves_skirt/au_naturel
	name = "天然树叶遮盖"
	desc = "树叶排列在身上以保持端庄"
	icon_state = "adam"
	item_state = "adam"

/obj/item/clothing/under/leaves_skirt/au_naturel/eve
	icon_state = "eve"
	item_state = "eve"

/obj/item/weapon/storage/backpack/quiver/modern/New()
	..()
	for (var/i=1, i<=14, i++)
		new /obj/item/ammo_casing/arrow/modern(src)