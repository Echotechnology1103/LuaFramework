local GUIList=class("GUIList")
-- params.list:需要复用的list,类型是ListView
-- params.layout{repeatY,repeatX,spaceX,spaceY} (可选 repeatX,spaceX,spaceY)
-- params.updateItemfunc:刷新item函数 
-- params.selectItemfunc:选中item函数 （可选）
-- params.data:数据源  item.index;item.data

-- 说明：将list第一个Item作为Model
-- 注意：list:getItem(0) 从0开始！！！

function GUIList:ctor(params)
	if not params.list or not params.list:getItem(0) then return end
	if params.list:getDescription()~="ListView" then return end

	self._list=params.list
	self._repeatX=params.layout.repeatX or 1  --几列
	self._repeatY=params.layout.repeatY  --几行
	self._spaceX=params.layout.spaceX or 1 --间距x
	self._spaceY=params.layout.spaceY or 1 --间距y
	self._cellH=0
	self._updateItemFunc=type(params.updateItemfunc)=="function" and params.updateItemfunc or nil
	self._selectItemFunc=type(params.selectItemfunc)=="function" and params.selectItemfunc or nil
	self._data=params.data --数据源
	self._haveSelectedImg=false
	self._selectedItem=nil
	self.index=1 --当前显示页 完整显示的第一项item 序号

	self._list:setItemsMargin(self._spaceY)
	-- self._list:addEventListenerScroll(function ( list,event_type )
	-- 	self:handlerScrollChange(list,event_type)
	-- end)
	self:setRenderItem()
	self:setData(self._data)
end

function GUIList:setData(data)
	if data and type(data)=="table" then
		self._data=data

		local dataCount=self:getDataCount()
		local needLength=dataCount<=self._repeatY and dataCount or self._repeatY+1

		local curLength=#self._list:getItems()
		if curLength<needLength then
			for i=1,needLength-curLength do
				self._list:pushBackDefaultItem()
			end
		else
			for i=1,curLength-needLength do
				self._list:removeLastItem()
			end
		end

		for i=0,#self._list:getItems()-1 do
			self:updateItem(self._list:getItem(i), i+1)
		end
	end
end

function GUIList:getData()
	return self._data
end

-- function GUIList:getItemByIndex( realindex )
-- 	local allItem=self._list:getItems()
-- 	for k,v in pairs(allItem) do
-- 		for n=1,self._repeatX do
-- 			local item=v:getChildByName("item_"..n)
-- 			print(item.index,realindex,"==?")
-- 			if item and item.index==realindex then
-- 				return item
-- 			end
-- 		end	
-- 	end
-- 	return nil
-- end

function GUIList:getDataByIndex(realindex)
	if self._data[realindex] then
		return self._data[realindex] 
	elseif self._data[tostring(realindex)] then
		return self._data[tostring(realindex)]
	end
	return nil
end

function GUIList:ScrollTo(realindex)
	if not realindex or realindex=="" then return end

	local index = math.ceil(realindex/self._repeatX)
	if (self.index<=tonumber(index) and tonumber(index)<=(self.index+#self._list:getItems()-1)) then 
		return 
	end

	local dataCount=self:getDataCount()
	index= tonumber(index)<1 and 1 or tonumber(index)
	index=tonumber(index)>dataCount and dataCount or tonumber(index)

	if index >= self.index + #self._list:getItems()-1 then
		for i=1,index-(self.index + #self._list:getItems()-1)+1 do
			self._list:removeItem(0)
			self.index=self.index+1
			self._list:pushBackDefaultItem()
			self._list:jumpToBottom()
			local item=self._list:getItem(#self._list:getItems()-1) 
			self:updateItem(item,self.index+#self._list:getItems()-1)
		end
	elseif index < self.index then
		for i=1,self.index-index do
			self._list:removeLastItem()
			self._list:insertDefaultItem(0) 
			self._list:jumpToTop()
			self.index=self.index-1
			self:updateItem(self._list:getItem(0),self.index)
		end
	end
end

function GUIList:getSelectedItem(  )
	return self._selectedItem and self._selectedItem or nil
end

function GUIList:getSelectedIndex(  )
	return self._selectedItem and self._selectedItem.index or -1
end

function GUIList:setSelectedIndex(realindex)
	self._selectedItem=nil
	self:ScrollTo(realindex)
	--处理选中样式
	if self._haveSelectedImg then
		for m=0, #self._list:getItems()-1 do
			local rowBox=self._list:getItem(m)
			if rowBox then
				for n=1,self._repeatX do
					local item=rowBox:getChildByName("item_"..n)
					if item then
						item:getChildByName("img_selected"):hide()
					end
				end	
			end
		end
	end


	local selBox=self._list:getItem(math.ceil((realindex-(self.index-1)*self._repeatX)/self._repeatX)-1) --根据realindex 得到Item
	if selBox then
		local iIndex=realindex%self._repeatX==0 and self._repeatX or (realindex%self._repeatX)
		local selItem=selBox:getChildByName("item_"..iIndex)
		if selItem then
			if self._haveSelectedImg then
				selItem:getChildByName("img_selected"):show()
			end

			-- 处理单元格选中事件
			self._selectedItem=selItem
			if self._selectItemFunc then
				self._selectItemFunc(selItem)
			end
		end
	end
end

function GUIList:clearSelectedStyle( ... )
	self._selectedItem=nil
	for m=0, #self._list:getItems()-1 do
		local rowBox=self._list:getItem(m)
		if rowBox then
			for n=1,self._repeatX do
				local item=rowBox:getChildByName("item_"..n)
				if item then
					item:getChildByName("img_selected"):hide()
				end
			end	
		end
	end
end

function GUIList:updateItem(rItem,index)
	if self._updateItemFunc then
		for i=1,self._repeatX do
			local item=rItem:getChildByName("item_"..i)
			if item then
				item.index=(index-1)*self._repeatX+i
				if self._data[item.index] then
					item.data=self._data[item.index]
				elseif self._data[tostring(item.index)] then
					item.data=self._data[tostring(item.index)]
				end
				self._updateItemFunc(item)
			end
		end
	end
end

function GUIList:setRenderItem()
	local renderitem =self._list:getItem(0)
	if renderitem then
		if renderitem:getChildByName("img_selected") then
			renderitem:getChildByName("img_selected"):hide()
			self._haveSelectedImg=true
		end
		renderitem:retain()
		self._list:removeItem(0)
		local tempW=renderitem:getContentSize().width
		local tempH=renderitem:getContentSize().height

		if self._repeatX >=1 then
			local renderBox=ccui.Layout:create()
				:setAnchorPoint(cc.p(0,1))
				:setContentSize(cc.size(self._repeatX*(tempW+self._spaceX)+self._spaceX,tempH))
				:setTouchEnabled(false)

			for i=1,self._repeatX do
				local item=renderitem:clone()
				local xx=(i-1)*(tempW+self._spaceX)
				local yy=tempH
				item:setName("item_"..i)
				item:setAnchorPoint(cc.p(0,1))
				item:setPosition(cc.p(xx,yy))
				item:setTouchEnabled(true)
				item:addClickEventListener(function (sender)
					-- 处理选中样式
					if self._haveSelectedImg then
						for i,v in ipairs(self._list:getItems()) do
							for n=1,self._repeatX do
								local item=v:getChildByName("item_"..n)
								if item then
									item:getChildByName("img_selected"):hide()
								end
							end
						end
						sender:getChildByName("img_selected"):show()
					end
					-- 处理单元格选中事件
					self._selectedItem=sender
					if self._selectItemFunc then
						self._selectItemFunc(sender)
					end
				end)
				renderBox:addChild(item)
			end
			renderitem:release()
			self._list:setItemModel(renderBox)
			self._cellH=renderBox:getContentSize().height
		end
	end
end

function GUIList:handlerScrollChange( list,eventType )
	if not self._data then return end

	if math.ceil(self:getDataCount()/self._repeatX) <=self._repeatY then return end

	local beginPos=list:getTouchBeganPosition().y
	local movePos=list:getTouchMovePosition().y
	local scrollValue=movePos-beginPos

	if eventType==ccui.ScrollviewEventType.scrollToTop and self.index >1 then
		if scrollValue%(self._cellH+self._spaceY)>(self._cellH+self._spaceY)/2 then
			--print("↓ 0+ L-",self.index-1)
			list:insertDefaultItem(0)
			self.index = self.index -1
			list:removeLastItem()
			list:jumpToBottom()
			-- list:setInnerContainerSize(cc.size(list:getInnerContainer().width,list:getInnerContainer().height))
			self:updateItem(self._list:getItem(0),self.index)
			--print("↓ 0+ L-",tostring(self.index).."  ----end","index="..self.index..",num="..tostring(#self._list:getItems()))
		end
	elseif eventType==ccui.ScrollviewEventType.scrollToBottom 
		-- and self.index+#self._list:getItems()-1 <= math.ceil(self:getDataCount()/self._repeatX) then
		and self.index+#self._list:getItems()-1 < math.ceil(self:getDataCount()/self._repeatX) then
		if scrollValue%(self._cellH+self._spaceY)>(self._cellH+self._spaceY)/2 then
			list:pushBackDefaultItem()
			--print("↑ 0- L+",self.index+#self._list:getItems()-1)
			-- if self.index>1 or #self._list:getItems()>=self._repeatY+2 then
			if self.index>1 or #self._list:getItems()>self._repeatY+2 then
				list:removeItem(0)
				self.index=self.index+1
			end
			list:jumpToTop()
			self:updateItem(self._list:getItem(#self._list:getItems()-1),self.index+#self._list:getItems()-1)
			--print("↑ 0- L+",tostring(self.index+#self._list:getItems()-1).."-----end","index="..self.index..",num="..tostring(#self._list:getItems()))
		end
	end
end

function GUIList:getDataCount()
	local tabCount=0
	for _,v in pairs(self._data) do
		tabCount=tabCount+1
	end
	return tabCount
end

-- function GUIList:setInertiaScrollEnabled( flag )
-- 	self._list:setInertiaScrollEnabled(flag)
-- end

-- function GUIList:setDirection( dir )
-- 	self._list:setDirection(dir)
-- end

function GUIList:dispose( ... )
	self._list=nil
	self._repeatX=1
	self._repeatY=0
	self._spaceX=1
	self._spaceY=1
	self._updateItemFunc=nil
	self._selectItemFunc=nil
	self._data=nil
	self._haveSelectedImg=false
	self.index=1 
end

return GUIList