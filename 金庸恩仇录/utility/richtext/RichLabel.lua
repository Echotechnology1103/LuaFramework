--[[--


local str = "[color=0FFFFF number=998]����һ����������[/color][color=F0FF00]Ч����ok��[/color][image=wsk1.png]��[/image][color=FF0F00]+�﹥[/color][color=F0FF00]*[0.4][/color][image=wsk1.png]��[/image][color=F0FF00]*[0.4][/color][color=0FFFFF]����������и���״̬������о���/�°볡�����׵�,���[/color][color=F0FF00][360][/color][image=wsk1.png]��[/image][color=FF0F00]+�﹥[/color][color=F0FF00]*[0.4][/color][image=wsk1.png]��[/image][color=F0FF00]*[0.4][/color]"

str:�ַ��� fontSize:�����С  rowWidth:�п� rowSpace:�м��

local ricLab = RichLabel.new({str=str, font="Microsoft Yahei", fontSize=24, rowWidth=280, rowSpace = -4})
ricLab:setPosition(ccp(display.cx-200, display.height-50))
self:addChild(ricLab)
-- ����¼���������
local function listener(button, params)
	print(params.text, params.tag, params.number)
	if params.number == 998 then
		print("ԤԼ�¼�")
	end
end
ricLab:setClilckEventListener(listener)

]]



local ChineseSize = 3 -- �������ȱ��(��Χ:3~4)
local RichLabel = class("RichLabel", function ()
	return display.newLayer()
end)



function RichLabel:ctor(param)
	param.str = param.str or common:getLanguageString("@chuan")
	param.font = param.font or "Microsoft Yahei"
	param.fontSize = param.fontSize or 14
	param.rowWidth = param.rowWidth or 280
	param.rowSpace = param.rowSpace or -4
	local textTab = self:initData(param.str, param.font, param.fontSize, param.rowWidth)
	self:setContentSize(CCSize(1, 1)) -- richlabelͳһ�ڵ��Ҳ�Ӱ������
	local ptab, copyVar = self:tab_addtext(textTab)
	
	local ocWidth = 0  -- ��ǰռ��
	local ocRow   = 1  -- ��ǰ��
	local ocHeight = 0 -- ��ǰ�߶�
	local btn,useWidth,useHeight = 0,0,0
	for k,v in pairs(copyVar) do
		local params = {}
		self:tab_addDataTo(params, v)
		-- ����ʵ����Ⱦ���
		if params.row == ocRow then
			ocWidth = ocWidth+useWidth
		else
			ocRow = params.row
			ocWidth = 0
			-- ����ʵ����Ⱦ�߶�
			ocHeight = ocHeight + useHeight + param.rowSpace --�����߶ȼ��
		end
		local maxsize = params.size
		local byteSize = math.floor((maxsize+2)/ChineseSize)
		params.width  = byteSize*params.breadth     -- �ؼ����
		params.height = maxsize                     -- �ؼ��߶�
		params.x = ocWidth       					-- �ؼ�x����
		params.y = -(ocHeight)                      -- �ؼ�y����
		params.scene = self
		btn,useWidth,useHeight = self:tab_createButton(params)
	end
end

-- ��ʼ������
function RichLabel:initData(str, font, fontSize, rowWidth)
	local tab = self:parseString(str, {font = font, size = fontSize})
	local var = {}
	var.tab = tab         -- �ı��ַ�
	var.width = rowWidth  -- ָ�����
	return var
end

-- ��ȡһ����ʽ����ĸ�����
local function str_formatToNumber(number, num)
	local s = "%." .. num .. "f"
	return tonumber(string.format(s, number))
end

-- ȫ�� ���
function RichLabel:accountTextLen(str, tsize)
	local list = self:tab_cutText(str)
	local aLen = 0
	for k,v in pairs(list) do
		local a = string.len(v)
		-- ����д����������
		local label = ui.newTTFLabel({text = v, size = tsize})
		a = tsize/(label:getContentSize().width)
		local b = str_formatToNumber(ChineseSize/a, 4)
		aLen = aLen + b
		label:release()
	end
	return aLen
end

function RichLabel:addDataToRenderTab(copyVar, tab, text, index, current)
	local tag = #copyVar+1
	copyVar[tag] = {}
	self:tab_addDataTo(copyVar[tag], tab)
	copyVar[tag].text = text
	copyVar[tag].index = index
	copyVar[tag].row = current
	copyVar[tag].breadth = self:accountTextLen(text, tab.size)
	copyVar[tag].tag = tag	-- Ψһ�±�
end

function RichLabel:tab_addtext(var)
	local allTab = {}
	-- local endRowUse = 0
	local copyVar = {}
	local useLen = 0
	local str = ""
	local current = 1
	for ktb,tab in ipairs(var.tab) do
		local txtTab, member = self:tab_cutText(tab.text)
		local num = math.floor( (var.width)/ math.ceil((tab.size+2)/ChineseSize) )
		
		if useLen > 0 then
			local remain = num - useLen
			local txtLen = self:accountTextLen(tab.text, tab.size)--string.len(tab.text)
			if txtLen <= remain then
				allTab[current] = allTab[current] .. tab.text
				self:addDataToRenderTab(copyVar, tab, tab.text, (useLen+1), current)
				useLen = useLen + txtLen
				txtTab = {}
			else
				local cTag = 0
				local mstr = ""
				local sIndex = useLen+1
				for k,element in pairs(txtTab) do
					local sLen = self:accountTextLen(element, tab.size)--string.len(element)
					if (useLen + sLen) <= num then
						useLen = useLen + sLen
						cTag = k
						mstr = mstr .. element
					else
						if string.len(mstr) > 0 then
							allTab[current] = allTab[current] .. mstr
							self:addDataToRenderTab(copyVar, tab, mstr, (sIndex), current)
						end
						current = current+1
						useLen = 0
						str = ""
						break
					end
				end
				for i=1,cTag do
					table.remove(txtTab, 1)
				end
			end
		end
		-- ����ַ�
		local maxRow = math.ceil((member/num))
		for k,element in pairs(txtTab) do
			local sLen = self:accountTextLen(element, tab.size)--string.len(element)
			if (useLen + sLen) <= num then
				useLen = useLen + sLen
				str = str .. element
			else
				allTab[current] =  str
				self:addDataToRenderTab(copyVar, tab, str, 1, current)
				current = current + 1
				useLen = sLen
				str = element
			end
			if k == #txtTab and useLen <= num then
				allTab[current] = str
				self:addDataToRenderTab(copyVar, tab, str, 1, current)
			end
		end
	end
	return allTab, copyVar
end

-- ��ֳ������ַ�
function RichLabel:tab_cutText(str)
	local list = {}
	local len = string.len(str)
	local i = 1
	while i <= len do
		local c = string.byte(str, i)
		local shift = 1
		if c > 0 and c <= 127 then
			shift = 1
		elseif (c >= 192 and c <= 223) then
			shift = 2
		elseif (c >= 224 and c <= 239) then
			shift = 3
		elseif (c >= 240 and c <= 247) then
			shift = 4
		end
		local char = string.sub(str, i, i+shift-1)
		i = i + shift
		table.insert(list, char)
	end
	return list, len
end

function RichLabel:tab_createButton(params)
	--ui/texture/
	local btn = cc.ui.UIPushButton.new("wsk.png", {scale9 = true})
	:setButtonSize(params.width, params.height)
	:setButtonLabel("normal", ui.newTTFLabel({
	text  = params.text,
	size  = params.size,
	color = params.color,
	font  = params.font,
	}))
	:onButtonPressed(function (event)
		event.target:getButtonLabel("normal"):setPosition(ccp(0, 0))
	end)
	:onButtonClicked(function (event)
		event.target:getButtonLabel("normal"):setPosition(ccp(0, 0))
		if self.listener then self.listener(event.target, params) end
	end)
	:onButtonRelease(function (event)
		event.target:getButtonLabel("normal"):setPosition(ccp(0, 0))
	end)
	:align(display.LEFT_TOP, params.x, params.y)
	:addTo(params.scene)
	btn:setButtonLabelAlignment(display.TOP_LEFT)
	local normalLab = btn:getButtonLabel("normal")
	normalLab:setPosition(ccp(0, 0))
	local useWidth = normalLab:getBoundingBox().size.width
	local useHeight = normalLab:getBoundingBox().size.height
	if params.image then
		self:imageManage(btn, params, useWidth)
	end
	return btn,useWidth,useHeight
end

-- ͼƬ��ǩ����
function RichLabel:imageManage(object, params, useWidth)
	local g = display.newSprite(params.image, 0, -4)
	g:setScaleX(useWidth / g:getContentSize().width)
	g:setScaleY(params.size / g:getContentSize().height)
	g:setAnchorPoint(ccp(0, 1))
	object:addChild(g, 1)
	object:setButtonLabelString("normal", "")
	local move1 = CCMoveBy:create(0.5, ccp(0, 2))
	local move2 = CCMoveBy:create(0.5, ccp(0, -2))
	g:runAction(CCRepeatForever:create(CCSequence:createWithTwoActions(move1, move2)))
	object.imageSprite = g
end

function RichLabel:tab_addDataTo(tab, src)
	for k,v in pairs(src) do
		tab[k] = v
	end
end

-- string.split()
function RichLabel:strSplit(str, flag)
	local tab = {}
	while true do
		local n = string.find(str, flag)
		if n then
			local first = string.sub(str, 1, n-1)
			str = string.sub(str, n+1, #str)
			table.insert(tab, first)
		else
			table.insert(tab, str)
			break
		end
	end
	return tab
end

-- ����������ı�
function RichLabel:parseString(str, param)
	local clumpheadTab = {} -- ��ǩͷ
	for w in string.gfind(str, "%b[]") do
		if  string.sub(w,2,2) ~= "/" then-- ȥβ
			table.insert(clumpheadTab, w)
		end
	end
	-- ������ǩ
	local totalTab = {}
	for k,ns in pairs(clumpheadTab) do
		local tab = {}
		local tStr
		-- ��һ���Ⱥ�ǰΪ���ǩ��
		string.gsub(ns, string.sub(ns, 2, #ns-1), function (w)
			local n = string.find(w, "=")
			if n then
				local temTab = self:strSplit(w, " ") -- ֧�ֱ�ǩ��Ƕ
				for k,pstr in pairs(temTab) do
					local temtab1 = self:strSplit(pstr, "=")
					
					local pname = temtab1[1]
					if k == 1 then tStr = pname end -- ��ǩͷ
					
					local js = temtab1[2]
					local p = string.find(js, "[^%d.]")
					if not p then js = tonumber(js) end
					if pname == "color" then
						tab[pname] = self:GetTextColor(js)
					else
						tab[pname] = js
					end
				end
			end
		end)
		if tStr then
			-- ȡ���ı�
			local beginFind,endFind = string.find(str, "%[%/"..tStr.."%]")
			local endNumber = beginFind-1
			local gs = string.sub(str, #ns+1, endNumber)
			if string.find(gs, "%[") then
				tab["text"] = gs
			else
				string.gsub(str, gs, function (w)
					tab["text"] = w
				end)
			end
			-- �ص��Ѿ��������ַ�
			str = string.sub(str, endFind+1, #str)
			if param then
				if not tab.number then  param.number = k end -- δָ��number���Զ�����
				self:tab_addDataTo(tab, param)
			end
			table.insert(totalTab, tab)
		end
	end
	-- ��ͨ��ʽlabel��ʾ
	if table.nums(clumpheadTab) == 0 then
		local ptab = {}
		ptab.text = str
		if param then
			param.number = 1
			self:tab_addDataTo(ptab, param)
		end
		table.insert(totalTab, ptab)
	end
	return totalTab
end

--[[����16������ɫrgbֵ]]
function  RichLabel:GetTextColor(xStr)
	if string.len(xStr) == 6 then
		local tmp = {}
		for i = 0,5 do
			local str =  string.sub(xStr,i+1,i+1)
			if (str >= '0' and str <= '9') then
				tmp[6-i] = str - '0'
			elseif (str == 'A' or str == 'a') then
				tmp[6-i] = 10
			elseif (str == 'B' or str == 'b') then
				tmp[6-i] = 11
			elseif (str == 'C' or str == 'c') then
				tmp[6-i] = 12
			elseif (str == 'D' or str == 'd') then
				tmp[6-i] = 13
			elseif (str == 'E' or str == 'e') then
				tmp[6-i] = 14
			elseif (str == 'F' or str == 'f') then
				tmp[6-i] = 15
			else
				print("Wrong color value.")
				tmp[6-i] = 0
			end
		end
		local r = tmp[6] * 16 + tmp[5]
		local g = tmp[4] * 16 + tmp[3]
		local b = tmp[2] * 16 + tmp[1]
		return cc.c3b(r,g,b)
	end
	return cc.c3b(255,255,255)
end

-- ���ü�������
function  RichLabel:setClilckEventListener(eventName)
	self.listener = eventName
end

return RichLabel