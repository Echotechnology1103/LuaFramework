
MingJiangObj = MingJiangObj or BaseClass(Character)

-- 名将
function MingJiangObj:__init(mingjiang_vo)
	self.obj_type = SceneObjType.MingJianObj
	self.draw_obj:SetObjType(self.obj_type)
	self:SetObjId(mingjiang_vo.mingjiang_used_id)
	self.vo = mingjiang_vo
	self.vo.move_speed = self.vo.move_speed - 100
	self.origin_speed = self.vo.move_speed
	self.obj_speed = self.vo.move_speed
	self.peri_next_update_time = 0
	self.do_move_time = 0
	self.hit_num = 1
end

function MingJiangObj:__delete()
	self.peri_next_update_time = nil
	self.do_move_time = nil
	self.obj_type = nil
	self.obj_speed = nil
	self.origin_speed = nil
	self.load_call_back = nil
	--if self.draw_obj then
		--GameObject.Destroy(self.draw_obj:GetRoot().gameObject)
	--end
	if self.bobble_timer_quest then
		GlobalTimerQuest:CancelQuest(self.bobble_timer_quest)
		self.bobble_timer_quest = nil
	end
	if self.release_timer then
		GlobalTimerQuest:CancelQuest(self.release_timer)
		self.release_timer = nil
	end
end

function MingJiangObj:InitShow()
	-- self:ShowFirstBubble()
	Character.InitShow(self)

	self:SetLogicPos(self.vo.pos_x, self.vo.pos_y)
	-- if self.vo.mingjiang_used_id ~= nil and self.vo.mingjiang_used_id ~= 0 then
		-- local spirit_cfg = SpiritData.Instance:GetSpiritResIdByItemId(self.vo.mingjiang_used_id)
		-- if spirit_cfg and  spirit_cfg.res_id and spirit_cfg.res_id > 0 then
			-- self.vo.name = spirit_cfg.name
			self:ChangeModel(SceneObjPart.Main, ResPath.GetMingJiangRes(10012))
			self:ShowFollowUi()
			self:GetFollowUi():SetName(Language.YuHun.MingjiangName)
			self.follow_ui:SetHpVisiable(false)
		-- end
	-- end
end

function MingJiangObj:SetMingJiangName(spirit_name)
	-- if self.vo.mingjiang_used_id ~= nil and self.vo.mingjiang_used_id ~= 0 then
	-- 	local spirit_cfg = SpiritData.Instance:GetSpiritResIdByItemId(self.vo.mingjiang_used_id)
	-- 	if spirit_cfg and  spirit_cfg.res_id and spirit_cfg.res_id > 0 then
	-- 		spirit_name = spirit_name ~= "" and spirit_name or spirit_cfg.name
	-- 		self:GetFollowUi():SetName(spirit_name)
	-- 	end
	-- end
end

-- function MingJiangObj:SetLoadCallBack(call_back)
-- 	self.load_call_back = call_back
-- end

-- function MingJiangObj:LoadOver()
-- 	local is_hide = SettingData.Instance:GetSettingList()[SETTING_TYPE.SHIELD_SPIRIT]
-- 	if is_hide then
-- 		self:GetDrawObj():SetVisible(not is_hide)
-- 		self:GetFollowUi():Hide()
-- 	end
-- 	if self.load_call_back then
-- 		self.load_call_back()
-- 	end
-- end

function MingJiangObj:Update(now_time, elapse_time)
	Character.Update(self, now_time, elapse_time)

	if self.peri_next_update_time and now_time >= self.peri_next_update_time then
		self.peri_next_update_time = now_time + 0.02
		local obj = self.parent_scene:GetObjectByObjId(self.vo.owner_obj_id)
		if nil ~= obj and obj:IsRole() and obj:GetRoleId() == self.vo.owner_role_id then
			if obj:GetVo().move_speed ~= self.obj_speed then
				self.origin_speed = obj:GetVo().move_speed - 100
				self.obj_speed = obj:GetVo().move_speed
			end
			if obj:IsStand() and self:IsStand() then
				if self.do_move_time < now_time then
					local target_x, target_y = math.random(-5,5), math.random(-5,5)
					local obj_x, obj_y = obj:GetLogicPos()
					target_x = obj_x + target_x
					target_y = obj_y + target_y
					if not AStarFindWay:IsBlock(target_x, target_y) then
						self:DoMove(target_x, target_y)
						self.do_move_time = now_time + 5
					end
				end
			end
		end

		-- if not self:IsStand() then
		-- 	return
		-- end

		self:CheckMove()
	end
end

-- 检查是否需要移动，返回是否移动
function MingJiangObj:CheckMove()
	local obj = self.parent_scene:GetObjectByObjId(self.vo.owner_obj_id)
	if nil == obj or not obj:IsRole() or obj:GetRoleId() ~= self.vo.owner_role_id then
		return false
	end

	local target_transfrom = obj:GetRoot().transform
	if nil == target_transfrom then
		return false
	end
	local target_x, target_y = target_transfrom.position.x, target_transfrom.position.z

	local self_transform = self:GetRoot().transform
	if nil == self_transform then
		return false
	end
	local self_x, self_y = self_transform.position.x, self_transform.position.z
	target_x, target_y = GameMapHelper.WorldToLogic(target_x, target_y)
	self_x, self_y = GameMapHelper.WorldToLogic(self_x, self_y)

	local delta_pos = u3d.vec2(target_x - self_x, target_y - self_y)
	self.distance = math.floor(u3d.v2Length(delta_pos))
	target_x, target_y = AStarFindWay:GetTargetXY(self_x, self_y, target_x, target_y, 1)

	if self.distance > 9 then
		local x, y = math.random(1,5), math.random(1,5)
		if self.distance < 20 and self.distance > 10 then
			self.vo.move_speed = self.vo.move_speed + 0.5 * self.distance
		elseif self.distance <= 10 then
			self.vo.move_speed = self.origin_speed
		end
		if self.distance > 20 then
			self:ChangeToCommonState()
			self:SetLogicPos(target_x + x, target_y + y)
			return
		end
		self:DoMove(target_x + x, target_y + y)
		return true
	end

	return false
end

-- 镖车不可战斗
function MingJiangObj:IsCharacter()
	return false
end

function MingJiangObj:GetOwerRoleId()
	return self.vo.owner_role_id
end

function MingJiangObj:MoveEnd()
	if nil == self.distance then
		return false
	end
	return self.distance <= 6
end

function MingJiangObj:IsMingjiang()
	return true
end

function MingJiangObj:SetMingjiangVisible(is_visible)
	self.is_visible = is_visible
	local draw_obj = self:GetDrawObj()
	if draw_obj then
		draw_obj:SetVisible(is_visible)
		if is_visible then
			self:GetFollowUi():Show()
		else
			self:GetFollowUi():Hide()
		end
	end
end

function MingJiangObj:GetRandBubbletext()
	local bubble_cfg = ConfigManager.Instance:GetAutoConfig("bubble_list_auto").bubble_jingling_list

	local temp_list = {}
	for k,v in pairs(bubble_cfg) do
		if v.jingling_scene_id == 0 then
			table.insert(temp_list,v)
		end
	end

	if #temp_list > 0 then
		math.randomseed(os.time())
		local bubble_text_index = math.random(1, #temp_list)
		return temp_list[bubble_text_index].bubble_jingling_text
	else
		return ""
	end
end

function MingJiangObj:GetFirstBubbleText()
	local bubble_cfg = ConfigManager.Instance:GetAutoConfig("bubble_list_auto").bubble_jingling_list
	local scene_id = Scene.Instance:GetSceneId()
	for k,v in pairs(bubble_cfg) do
		if v.jingling_scene_id == scene_id then
			return v.bubble_jingling_text
		end
	end
end

function MingJiangObj:ShowFirstBubble()
	if nil == self.release_timer then
		self.release_timer = GlobalTimerQuest:AddDelayTimer(function()
			self.release_timer = nil
			if nil ~= self.follow_ui and self:IsMySpirit() then
				local text = self:GetFirstBubbleText()
				if nil ~= text then
					self.follow_ui:ChangeBubble(text)
				end
			end
			self:UpdataTimer()
		end, 8)
	end
end

function MingJiangObj:UpdataBubble()
	if nil ~= self.follow_ui then
		local text = self:GetRandBubbletext()
		self.follow_ui:ChangeBubble(text)
	end
end

function MingJiangObj:UpdataTimer()
	local exist_time = ConfigManager.Instance:GetAutoConfig("bubble_list_auto").other[1].exist_time
	local jingling_interval = ConfigManager.Instance:GetAutoConfig("bubble_list_auto").other[1].jingling_interval
	self.bobble_timer_quest = GlobalTimerQuest:AddDelayTimer(function() self:UpdataTimer() end, exist_time)

	if self.timer and nil ~= self.follow_ui and self:IsMySpirit() then
		if self.timer >= jingling_interval then
			self.timer = self.timer - jingling_interval
			local rand_num = math.random(1, 10)
			local jingling_odds = ConfigManager.Instance:GetAutoConfig("bubble_list_auto").other[1].jingling_odds
			if rand_num * 0.1 <= jingling_odds then
				self:UpdataBubble()
				self.follow_ui:ShowBubble()
			end
		else
			self.follow_ui:HideBubble()
		end
	end
	self.timer = self.timer and self.timer + exist_time or exist_time
end

function MingJiangObj:IsMySpirit()
	local obj = self.parent_scene:GetObjectByObjId(self.vo.owner_obj_id)
	local role_id = GameVoManager.Instance:GetMainRoleVo().role_id
	if nil ~= obj and obj:IsRole() and role_id == self.vo.owner_role_id then
		return true
	end
	return false
end

function MingJiangObj:EnterStateAttack()
	local anim_name = "combo1_" .. self.hit_num
	self.hit_num = self.hit_num >= 3 and 1 or self.hit_num + 1
	Character.EnterStateAttack(self, anim_name)
end