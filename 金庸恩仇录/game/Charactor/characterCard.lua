local characterCard = class("characterCard", function()
	local layer = display.newNode()
	return layer
end)

local ccs = ccs or {}
ccs.MovementEventType = {
START = 0,
COMPLETE = 1,
LOOP_COMPLETE = 2
}

local ANGER_ZORDER = 202
local HERO_IMAGE_ZORDER = 200
local HERO_BELOW_ZORDER = 195
local HERO_UPON_ZORDER = 205
local DOWN_SIDE = 1
local UP_SIDE = 2
local bone_id = 1

function characterCard:getPosID()
	return self.posId
end

function characterCard:changeNameState()
	if self.nameTouch == 0 then
		self.nameTouch = 1
		self.cardNameTTF:setVisible(false)
	else
		self.nameTouch = 0
		self.cardNameTTF:setVisible(self.isShowHpAndAnger)
	end
end

function characterCard:removeBuff(buffName)
	if buffName ~= nil and buffName ~= "" then
		if self.buffBones[buffName] ~= nil and self.buffNameTable[buffName] ~= nil then
			self.buffNameTable[buffName] = self.buffNameTable[buffName] - 1
			if self.buffNameTable[buffName] <= 0 then
				self.buffArma[buffName]:setScale(0)
			end
		else
		end
	elseif buffName == nil then
	elseif buffName == "" then
	end
end

function characterCard:removeAllBuff()
	for k, v in pairs(self.buffBones) do
		self:removeBuff(k)
	end
	self.buffNameTable = {}
end

function characterCard:addBuff(buffName)
	if buffName ~= nil and buffName ~= "" then
		if self.buffNameTable[buffName] == nil then
			self.buffNameTable[buffName] = 1
		else
			self.buffNameTable[buffName] = self.buffNameTable[buffName] + 1
		end
		if self.buffBones[buffName] == nil then
			local buffEff = ResMgr.createArma({
			resType = ResMgr.NORMAL_EFFECT,
			armaName = buffName,
			finishFunc = function()
			end,
			isRetain = true
			})
			self.buffArma[buffName] = buffEff
			self.buffBones[buffName] = CCBone:create(buffName)
			self.buffBones[buffName]:setIgnoreMovementBoneData(true)
			self.buffBones[buffName]:addDisplay(buffEff, 0)
			self.buffBones[buffName]:changeDisplayWithIndex(0, true)
			self.buffBones[buffName]:setZOrder(10000)
			self.cardBg:addBone(self.buffBones[buffName], "tongyong")
		else
			self.buffBones[buffName]:changeDisplayWithIndex(0, true)
			self.buffBones[buffName]:setPosition(0, 0)
		end
		self.buffArma[buffName]:setScale(1)
	elseif buffName == nil then
		GameAssert(false, "buff name is nil")
	elseif buffName == "" then
		GameAssert(false, "buff name is nil")
	end
end

function characterCard:addLife(life)
	self.curLife = self.curLife + life
	if self.curLife > self.maxLife then
		self.curLife = self.maxLife
	end
	self:setLife(self.curLife)
end

function characterCard:addAnger(anger)
	self.rageNum = self.rageNum + anger
	self:setStars(self.rageNum)
end

function characterCard:getStar()
	return self.star
end

function characterCard:getSideID()
	return self.sideID
end

function characterCard:playTinyShow(name)
	if self.tinyAngerBg == nil then
		self.tinyAngerBg = ResMgr.createArma({
		resType = ResMgr.UI_EFFECT,
		armaName = "nuqidonghua",
		finishFunc = function()
			self.tinyAngerBg:setScale(0)
		end,
		isRetain = true
		})
		self.angerNameTTF = ui.newTTFLabelWithShadow({
		text = name,
		size = 20,
		align = ui.TEXT_ALIGN_LEFT,
		font = FONTS_NAME.font_fzcy,
		color = FONT_COLOR.WHITE,
		shadowColor = FONT_COLOR.BLACK,
		})
		self.angerNameTTF:align(display.LEFT_CENTER, 0, 0)
		self:addAnim(self.tinyAngerBg, "rage_bg", self.angerNameTTF, "anger_ttf")
		self.tinyRageBone = CCBone:create("tiny_rage")
		self.tinyRageBone:setIgnoreMovementBoneData(true)
		self.tinyRageBone:addDisplay(self.tinyAngerBg, 0)
		self.tinyRageBone:changeDisplayWithIndex(0, true)
		self.tinyRageBone:setZOrder(900)
		self.tinyAngerBg:setScale(1.4)
		self.cardBg:addBone(self.tinyRageBone, "tongyong")
	else
		self.tinyAngerBg:setScale(1.4)
		self.tinyAngerBg:getAnimation():playWithIndex(0)
	end
end

function characterCard:addAnim(parent, parentBoneName, child, childBoneName)
	local childBone = CCBone:create(childBoneName)
	childBone:setIgnoreMovementBoneData(true)
	childBone:addDisplay(child, 0)
	childBone:changeDisplayWithIndex(0, true)
	childBone:setZOrder(900)
	parent:addBone(childBone, parentBoneName)
end

function characterCard:playFitShow(delays, actCardPosX, leftPosY, FIT_ZORDER)
	local actCardMoveTo = CCMoveTo:create(0.1, cc.p(actCardPosX, leftPosY))
	local actCardScaleTo = CCScaleTo:create(0.1, 1.2)
	local actCardCallfunc = CCCallFunc:create(function()
		self:setZOrder(self:getZOrder() + FIT_ZORDER)
	end)
	local actCardSpawn = CCSpawn:createWithTwoActions(actCardMoveTo, actCardScaleTo)
	self:runAction(transition.sequence({
	CCDelayTime:create(delays),
	actCardCallfunc,
	actCardSpawn
	}))
end

function characterCard:playShow(specialData)
	self.heroImage:stopAllActions()
	self.cardNameTTF:setZOrder(HERO_IMAGE_ZORDER - 10)
	self.nameBone:setZOrder(HERO_IMAGE_ZORDER - 10)
	local biggerTime = 0.2
	local stayTime = 0.8
	local smallTime = 0.1
	if specialData ~= nil then
		biggerTime = specialData.rage_bigger / 1000
		stayTime = specialData.rage_stay / 1000
		smallTime = specialData.rage_smaller / 1000
	end
	local heroHeight = display.height / 6
	if self.sideID == UP_SIDE then
		heroHeight = display.height * 3 / 4
	end
	local cPos = self:convertToNodeSpace(cc.p(display.width / 2, heroHeight))
	local orX = self.baseNode:getPositionX()
	local orY = self.baseNode:getPositionY()
	local bgMoveTo = CCMoveTo:create(biggerTime, cPos)
	local bgDelay = CCDelayTime:create(stayTime)
	local bgBackTo = CCMoveTo:create(smallTime, cc.p(orX, orY))
	local ccF = CCCallFunc:create(function()
	end)
	self.baseNode:runAction(transition.sequence({
	bgMoveTo,
	bgDelay,
	bgBackTo,
	ccF
	}))
	local bigerAndMove = CCScaleTo:create(biggerTime, 2)
	local beBiger = CCEaseIn:create(bigerAndMove, 0.5)
	local bigDelay = CCDelayTime:create(stayTime)
	local beSmaller = CCScaleTo:create(smallTime, 1)
	local stop = CCCallFunc:create(function()
	end)
	self.heroImage:runAction(transition.sequence({
	beBiger,
	bigDelay,
	beSmaller
	}))
	local setRight = CCCallFunc:create(function()
		self.befCloud:setVisible(true)
		self.befCloud:setScale(0.13)
		self.befCloud:setOpacity(255)
		self.befCloud:setPosition(0, 0)
	end)
	local befFadeIn = CCFadeTo:create(biggerTime, 255)
	local befScale = CCScaleTo:create(biggerTime, 2)
	local befBiggerSpawn = CCSpawn:createWithTwoActions(befFadeIn, befScale)
	local befmoveToLeft = CCMoveBy:create(stayTime, cc.p(-40, 0))
	local befFadeOut = CCFadeTo:create(smallTime, 0)
	local befSmaller = CCScaleTo:create(smallTime, 0.2)
	local befSmallSpawn = CCSpawn:createWithTwoActions(befFadeOut, befSmaller)
	local befrev = CCCallFunc:create(function()
		self.befCloud:setVisible(false)
		self.cardNameTTF:setZOrder(HERO_IMAGE_ZORDER + 10)
		self.nameBone:setZOrder(HERO_IMAGE_ZORDER + 10)
	end)
	self.befCloud:runAction(transition.sequence({
	setRight,
	befBiggerSpawn,
	befmoveToLeft,
	befSmallSpawn,
	befrev
	}))
	local setRight = CCCallFunc:create(function()
		self.aftCloud:setVisible(true)
		self.aftCloud:setScale(0.13)
		self.aftCloud:setOpacity(255)
		self.aftCloud:setPosition(0, 0)
	end)
	local aftFadeIn = CCFadeTo:create(biggerTime, 255)
	local aftScale = CCScaleTo:create(biggerTime, 2)
	local aftBiggerSpawn = CCSpawn:createWithTwoActions(aftFadeIn, aftScale)
	local aftmoveToLeft = CCMoveBy:create(stayTime, cc.p(40, 0))
	local aftFadeOut = CCFadeTo:create(smallTime, 0)
	local aftSmaller = CCScaleTo:create(smallTime, 0.2)
	local aftSmallSpawn = CCSpawn:createWithTwoActions(aftFadeOut, aftSmaller)
	local aftrev = CCCallFunc:create(function()
		self.aftCloud:setVisible(false)
	end)
	self.aftCloud:runAction(transition.sequence({
	setRight,
	aftBiggerSpawn,
	aftmoveToLeft,
	aftSmallSpawn,
	aftrev
	}))
	local function createParticle(dir)
		math.newrandomseed()
		local yTa = {}
		for i = -100, 100 do
			yTa[#yTa + 1] = i
		end
		local yRan = yTa[math.random(1, #yTa)] * 2.5
		local spRan = math.abs(yRan) / 100
		local path = "#guang.png"
		if yRan / 10 % 2 == 0 then
			path = "#guang.png"
		end
		local endX = -display.width
		local startX = display.width
		local zor = HERO_UPON_ZORDER
		if dir == 1 then
			startX = -display.width
			endX = display.width
			zor = HERO_BELOW_ZORDER
		else
			endX = display.width
			startX = -display.width
			zor = HERO_UPON_ZORDER
		end
		local sprite = display.newSprite(path)
		local st = CCCallFunc:create(function()
			sprite:setPosition(startX, yRan)
		end)
		local move = CCMoveTo:create(0.3 * spRan, cc.p(endX, yRan))
		local rev = CCRemoveSelf:create(true)
		sprite:runAction(transition.sequence({
		st,
		move,
		rev
		}))
		sprite:setScaleY(0.8)
		self.cardBg:addChild(sprite, zor)
	end
	for i = 1, 30 do
		do
			local delay = CCDelayTime:create(i / 100 * (biggerTime + stayTime + smallTime))
			local func = CCCallFunc:create(function()
				if i % 3 == 0 then
					createParticle(0)
				end
				createParticle(1)
			end)
			local rev = CCRemoveSelf:create(true)
			local node = display.newNode()
			node:runAction(transition.sequence({
			delay,
			func,
			rev
			}))
			self:addChild(node)
		end
	end
end

function characterCard:onExit()
	CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("ccs/cardBg/" .. self.armaName .. ".ExportJson")
	CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("ccs/cardHeros/" .. self.cardImageFile .. ".ExportJson")
	ResMgr.removeSpriteFramesWithFile("ui/card_yun.plist", "ui/card_yun.png")
	ResMgr.removeSpriteFramesWithFile("ui/ui_battle.plist", "ui/ui_battle.png")
	ResMgr.removeSpriteFramesWithFile("ui/ui_jobIcon.plist", "ui/ui_jobIcon.png")
	self:removeAllChildrenWithCleanup(true)
end

function characterCard:setLife(life)
	if self.isDie ~= true then
		self.curLife = life
		local percent = life / self.maxLife
		if percent > 1 then
			percent = 1
		end
		self.lifeBar:setVisible(self.isShowHpAndAnger)
		self.lifeBarBg:setVisible(self.isShowHpAndAnger)
		self.lifeBar:setPercentage(percent * 100)
	end
	if life == 0 then
		self.isDie = true
	end
end

function characterCard:getLife()
	return self.curLife
end

function characterCard:getMaxLife()
	return self.maxLife
end

function characterCard:setMaxLife(value)
	self.maxLife = value
end

function characterCard:setFullLife()
	self:setLife(self.maxLife)
end

function characterCard:boundingBox()
end

function characterCard:updateCardScale(Scale)
	self.curScale = Scale
	if self.cardResId == 4901 or self.cardResId == 4902 then
		self.heroImage:setScale(0.9 * self.curScale)
	end
	if self.cardBg ~= nil then
		self.cardBg:setScale(0.9 * self.curScale)
	end
end

function characterCard:subLife(damageLife)
	local curLife = self.maxLife - damageLife
	if curLife < 0 then
		curLife = 0
	end
	self:setLife(curLife)
end

function characterCard:playWithIndex(index)
	self.heroImage:getAnimation():playWithIndex(index)
	self.cardBg:getAnimation():playWithIndex(index)
end

function characterCard:setLifePercent(percent)
	self.lifeBar:setPercentage(percent)
end

function characterCard:getResId()
	return self.cardResId
end

function characterCard:getCls()
	return self.cls
end

function characterCard:ctor(param)
	self.buffNameTable = {}
	ResMgr.setMetatableByKV(self.buffNameTable)
	ResMgr.addSpriteFramesWithFile("ui/ui_battle.plist", "ui/ui_battle.png")
	ResMgr.addSpriteFramesWithFile("ui/ui_jobIcon.plist", "ui/ui_jobIcon.png")
	ResMgr.addSpriteFramesWithFile("ui/card_yun.plist", "ui/card_yun.png")
	local isExit = param.isExist
	self.battleCBFunc = nil
	self.frameCBFunc = nil
	self.tinyAngerBg = nil
	self.actFrameFunc = nil
	self.actEndFunc = nil
	self:setNodeEventEnabled(true)
	self.formationIndex = param.formationIndex
	self.maxLife = param.maxLife or 1
	self.curLife = self.maxLife
	self.cls = param.cls or 0
	self.buffTable = {}
	ResMgr.setMetatableByKV(self.buffTable)
	if param.isShowHpAndAnger == nil then
		self.isShowHpAndAnger = true
	else
		self.isShowHpAndAnger = param.isShowHpAndAnger
	end
	self.baseNode = display.newSprite("#unvisibleBg.png", x, y, param)
	self:addChild(self.baseNode)
	local id = param.id
	local isMove = param.isMove
	self.curScale = param.scale or 1
	local isTouchAble = param.isTouchAble or false
	if isTouchAble then
	end
	local touchEndListener = param.touchEndListener
	self.posId = param.posId
	self.cardResId = id
	self.fashionId = param.fashionId
	self.sideID = param.side
	self.star = param.star or 1
	self.armaName = "anim_card_kadi_st0" .. self.star
	local anger = param.anger or 0
	if isExit == true then
		self:setTouchEnabled(true)
		self.curAct = "stop"
		do
			local isAnim = isMove or true
			local cardData = ResMgr.getCardData(id)
			ResMgr.showAlert(cardData, common:getLanguageString("@ListLock", id))
			self.job = cardData.job
			local cardImage = cardData.arr_image[self.cls + 1]
			--dump("__________________________fashionId: " ..self.fashionId)
			--dump(self.fashionId )
			if self.fashionId and 0 < self.fashionId then
				local data_fashion_fashion = require("data.data_item_item")
				cardImage = data_fashion_fashion[self.fashionId].image[self.cardResId]
			end
			self.cardImageFile = cardImage
			if param.name then
				self.cardName = param.name
			else
				self.cardName = cardData.name
				if id == 1 or id == 2 then
					self.cardName = game.player.m_name or common:getLanguageString("@ZhouXiaoYan")
					if self:getSideID() == 2 then
						self.cardName = ResMgr.oppName
					end
				end
			end
			CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("ccs/cardBg/" .. self.armaName .. ".ExportJson")
			CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("ccs/cardBg/" .. self.armaName .. ".ExportJson")
			self.stars = {}
			self.angerBones = {}
			self.buffBones = {}
			self.buffArma = {}
			ResMgr.setMetatableByKV(self.stars)
			ResMgr.setMetatableByKV(self.angerBones)
			ResMgr.setMetatableByKV(self.buffBones)
			ResMgr.setMetatableByKV(self.buffArma)
			self.cardBg = CCArmature:create(self.armaName)
			self.cardBg:setScale(0.9 * self.curScale)
			self.cardBg:getAnimation():play(self.curAct)
			self.baseNode:addChild(self.cardBg)
			self.posIndex = 1
			self.lastX = 0
			self.lastY = 0
			self.cardWidth = self.cardBg:getContentSize().width
			self.cardHeight = self.cardBg:getContentSize().height
			self:setContentSize(cc.size(self.cardWidth, self.cardHeight))
			self.cardBg:setPosition(self.cardWidth / 2, self.cardHeight / 2)
			self:setEventCallfunc(self.battleCBFunc)
			self:setFrameCallFunc(self.frameCBFunc)
			
			self.cardNameTTF = ui.newTTFLabelWithOutline({
			text = self.cardName,
			size = 20,
			font = FONTS_NAME.font_fzcy,
			align = ui.TEXT_ALIGN_LEFT,
			color = NAME_COLOR[self.star],
			outlineColor = FONT_COLOR.BLACK,
			})
			
			self.cardNameTTF:setZOrder(HERO_IMAGE_ZORDER + 10)
			self.cardNameTTF:align(display.CENTER, 0, self.cardHeight * 0.6)
			
			self.nameBone = CCBone:create("nameBone")
			self.nameBone:setIgnoreMovementBoneData(true)
			self.nameBone:addDisplay(self.cardNameTTF, 0)
			self.nameBone:changeDisplayWithIndex(0, false)
			self.nameBone:setZOrder(HERO_IMAGE_ZORDER + 10)
			self.cardBg:addBone(self.nameBone, "tongyong")
			self.nameTouch = 0
			self:changeNameState()
			if isMove == true then
			end
			local boundBox = self.cardBg:boundingBox()
			local bgBone = self.cardBg:getBone("tongyong")
			local function onTouchEvent(event, x, y)
				local name = event.name
				local x = event.x
				local y = event.y
				local pos = bgBone:convertToNodeSpace(cc.p(x, y))
				if name == "began" then
					if bgBone:getDisplayManager():getBoundingBox():containsPoint(bgBone:convertToNodeSpace(cc.p(x, y))) then
						self:runAction(CCScaleTo:create(0.1, 1.1))
						self:setZOrder(self:getZOrder() + 1)
						return true
					else
						return false
					end
				elseif name == "moved" then
					self:setPosition(self:getParent():convertToNodeSpace(cc.p(x, y)))
				elseif name == "ended" then
					self:runAction(CCScaleTo:create(0.1, 1))
					self:setZOrder(self:getZOrder() - 1)
					touchEndListener(self)
				end
			end
			if isTouchAble == true then
				self:setTouchEnabled(true)
				self:addNodeEventListener(cc.NODE_TOUCH_EVENT, onTouchEvent)
			else
				self:setTouchEnabled(false)
			end
			CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("ccs/cardHeros/" .. cardImage .. ".ExportJson")
			CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("ccs/cardHeros/" .. cardImage .. ".ExportJson")
			self.heroImage = CCArmature:create(cardImage)
			self.heroImage:getAnimation():play(self.curAct)
			self.heroImage:setPosition(0, 5)
			if self.cardResId == 4901 or self.cardResId == 4902 then
				self.cardBg:setVisible(false)
				self.heroImage:setScale(0.9 * self.curScale)
				self.heroImage:setPosition(self.cardWidth / 2, self.cardHeight / 2)
				self.baseNode:addChild(self.heroImage, HERO_IMAGE_ZORDER)
			else
				self.cardBg:addChild(self.heroImage, HERO_IMAGE_ZORDER)
			end
			self.lifeBarBg = display.newSprite("#battle_bar_red.png")
			self.lifeBarBg:setAnchorPoint(cc.p(0, 0.5))
			self.lifeBarBgBone = CCBone:create("lifeBg")
			self.lifeBarBgBone:setIgnoreMovementBoneData(true)
			self.lifeBarBgBone:addDisplay(self.lifeBarBg, 0)
			self.lifeBarBgBone:changeDisplayWithIndex(0, false)
			self.lifeBarBg:setVisible(self.isShowHpAndAnger)
			self.lifeBarBgBone:setZOrder(ANGER_ZORDER)
			local lifeBarX = self.cardBg:getContentSize().width * -0.34
			local lifeBarY = self.cardBg:getContentSize().height * -0.45
			self.lifeBarBg:setPosition(cc.p(lifeBarX, lifeBarY))
			self.cardBg:addBone(self.lifeBarBgBone, "tongyong")
			self.buffNode = display.newNode()
			local buffBone = CCBone:create("buffBone")
			buffBone:setIgnoreMovementBoneData(true)
			buffBone:addDisplay(self.buffNode, 0)
			buffBone:changeDisplayWithIndex(0, true)
			buffBone:setZOrder(10000)
			self.cardBg:addBone(buffBone, "tongyong")
			local Bar = display.newSprite("#battle_bar_green.png")
			self.lifeBar = CCProgressTimer:create(Bar)
			self.lifeBar:setBarChangeRate(cc.p(1, 0))
			self.lifeBar:setType(1)
			self.lifeBar:setVisible(self.isShowHpAndAnger)
			self.lifeBar:setAnchorPoint(cc.p(0, 0.5))
			self.lifeBar:setMidpoint(cc.p(0, 0.5))
			self.lifeBar:setPercentage(ANGER_ZORDER)
			self.lifeBarBone = CCBone:create("lifeBar")
			self.lifeBarBone:addDisplay(self.lifeBar, 0)
			self.lifeBarBone:changeDisplayWithIndex(0, false)
			self.lifeBarBone:setIgnoreMovementBoneData(true)
			self.lifeBarBone:setZOrder(ANGER_ZORDER)
			local lifeBarX = self.cardBg:getContentSize().width * -0.34
			local lifeBarY = self.cardBg:getContentSize().height * -0.45
			self.lifeBar:setPosition(cc.p(lifeBarX, lifeBarY))
			self.cardBg:addBone(self.lifeBarBone, "tongyong")
			local starOraX = self.cardBg:getContentSize().width * -0.33
			local starOraY = self.cardBg:getContentSize().height * -0.33
			local offsetStarX = self.cardBg:getContentSize().width * 0.115
			for starNum = 1, 4 do
				local star = display.newSprite("#battle_nuqi_red.png", x, y)
				local bigger = CCScaleTo:create(1, 1.2)
				local smaller = CCScaleTo:create(1, 1)
				local seq = transition.sequence({bigger, smaller})
				local rep = CCRepeatForever:create(seq)
				self.angerBones[starNum] = CCBone:create("star" .. starNum)
				self.angerBones[starNum]:setIgnoreMovementBoneData(true)
				self.angerBones[starNum]:addDisplay(star, 0)
				self.angerBones[starNum]:changeDisplayWithIndex(0, false)
				self.angerBones[starNum]:setZOrder(ANGER_ZORDER)
				star:setPosition(cc.p(starOraX, starOraY))
				starOraX = starOraX + offsetStarX
				self.cardBg:addBone(self.angerBones[starNum], "tongyong")
			end
			local star = display.newSprite("#battle_nuqi_red.png", x, y)
			self.extraAnger = CCBone:create("star" .. 5)
			self.extraAnger:setIgnoreMovementBoneData(true)
			self.extraAnger:addDisplay(star, 0)
			self.extraAnger:changeDisplayWithIndex(0, false)
			self.extraAnger:setZOrder(ANGER_ZORDER)
			star:setPosition(cc.p(starOraX, starOraY))
			starOraX = starOraX + offsetStarX
			self.cardBg:addBone(self.extraAnger, "tongyong")
			self.angerLabel = ui.newBMFontLabel({
			text = "X0",
			font = "fonts/font_fb_lv_title.fnt"
			})
			self.angerLabel:setScale(0.7)
			self.angerLabel:setPosition(starOraX - 8, starOraY - 10)
			self.angerLabel:setAnchorPoint(cc.p(0, 0.5))
			self.labelBone = CCBone:create("angerLabel")
			self.labelBone:setIgnoreMovementBoneData(true)
			self.labelBone:addDisplay(self.angerLabel, 0)
			self.labelBone:changeDisplayWithIndex(0, false)
			self.labelBone:setZOrder(ANGER_ZORDER)
			self.cardBg:addBone(self.labelBone, "tongyong")
			self.rageNum = 0
			self:setStars(anger)
		end
	else
		self:setTouchEnabled(false)
	end
	self.befCloud = display.newSprite("#qian.png")
	self.befCloud:setPosition(-10000, -10000)
	self.cardBg:addChild(self.befCloud, HERO_UPON_ZORDER)
	self.aftCloud = display.newSprite("#hou.png")
	self.aftCloud:setPosition(-10000, -10000)
	self.cardBg:addChild(self.aftCloud, HERO_BELOW_ZORDER)
	if ResMgr.isShowCharName == true then
		self:changeNameState()
	end
end

function characterCard:playWalk(downSound)
	local function bgWalk(node)
		node:stopAllActions()
		local beBiger = CCScaleTo:create(0.16, 1.05)
		local smaller = CCScaleTo:create(0.15, 0.9)
		local walkDownSound = CCCallFunc:create(function()
			if downSound ~= nil then
				downSound()
			end
		end)
		local beNormal = CCScaleTo:create(0.13, 1)
		local seq = transition.sequence({
		beBiger,
		smaller,
		walkDownSound,
		beNormal
		})
		local forever = CCRepeatForever:create(seq)
		node:runAction(forever)
	end
	bgWalk(self.cardBg)
end

function characterCard:removeFunc()
	self.actFrameFunc = nil
	self.actEndFunc = nil
end

function characterCard:playAct(actName, atkFunc, finFunc, speed)
	dump("acctttt " .. actName)
	if self.actFrameFunc ~= nil then
		self.actFrameFunc()
		self.actFrameFunc = nil
	end
	self.actFrameFunc = atkFunc
	if self.actEndFunc ~= nil then
		self.actEndFunc()
		self.actEndFunc = nil
	end
	self.actEndFunc = finFunc
	local curSpeed = speed or 1
	if atkFunc ~= nil then
		self:setFrameCallFunc(function(bone, evt, originFrameIndex, currentFrameIndex)
			if evt == "atkEff" then
				atkFunc()
			end
		end)
	end
	self.cardBg:getAnimation():setMovementEventCallFunc(function(armatureBack, movementType, movementID)
		if movementType == ccs.MovementEventType.COMPLETE then
			self.actEndFunc = nil
			self.actFrameFunc = nil
			if finFunc ~= nil then
				finFunc()
			end
			for k, v in ipairs(self.buffBones) do
				v:setScale(1)
			end
			self.heroImage:getAnimation():setSpeedScale(1)
			self.cardBg:getAnimation():setSpeedScale(1)
		end
	end)
	self.curAct = actName
	if self.cardBg ~= nil and self.curAct ~= "walk" then
		self.heroImage:stopAllActions()
		self.cardBg:stopAllActions()
		if self.cardResId ~= 4902 and self.cardResId ~= 4901 then
			self.heroImage:setScale(1)
		end
		self.cardBg:setScale(0.9 * self.curScale)
		self.heroImage:getAnimation():setSpeedScale(curSpeed)
		self.cardBg:getAnimation():setSpeedScale(curSpeed)
		self.heroImage:getAnimation():play(self.curAct)
		self.cardBg:getAnimation():play(self.curAct)
	else
	end
end

function characterCard:setEventCallfunc(animationEvent)
	self.battleCBFunc = animationEvent
	if self.cardBg ~= nil and animationEvent ~= nil then
		self.cardBg:getAnimation():setMovementEventCallFunc(animationEvent)
	end
end

function characterCard:setFrameCallFunc(frameEvent)
	self.frameCBFunc = frameEvent
	if self.cardBg ~= nil and frameEvent ~= nil then
		self.cardBg:getAnimation():setFrameEventCallFunc(frameEvent)
	end
end

function characterCard:getContentSize()
	return self.cardBg:getContentSize()
end

function characterCard:addStars(num)
	self.rageNum = self.rageNum + num
	self:setStars(self.rageNum)
end

function characterCard:setStars(num)
	local boneZorder = 0
	if self.isShowHpAndAnger ~= true then
		boneZorder = -1
	end
	self.rageNum = num
	for i = 1, #self.angerBones do
		if i > self.rageNum then
			self.angerBones[i]:changeDisplayWithIndex(-1, false)
		else
			self.angerBones[i]:changeDisplayWithIndex(boneZorder, false)
		end
	end
	self.angerLabel:setString("X" .. num)
	if self.rageNum > 4 then
		self.angerLabel:setVisible(self.isShowHpAndAnger)
		self.extraAnger:changeDisplayWithIndex(boneZorder, false)
	else
		self.angerLabel:setVisible(false and self.isShowHpAndAnger)
		self.extraAnger:changeDisplayWithIndex(-1, false)
	end
end

function characterCard:setColor(c)
	self.heroImage:setColor(c)
	self.cardBg:setColor(c)
end

return characterCard