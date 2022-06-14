local skillchoice = class( "skillchoice", layout );

global_event.SKILLCHOICE_SHOW = "SKILLCHOICE_SHOW";
global_event.SKILLCHOICE_HIDE = "SKILLCHOICE_HIDE";

function skillchoice:ctor( id )
	skillchoice.super.ctor( self, id );
	self:addEvent({ name = global_event.SKILLCHOICE_SHOW, eventHandler = self.onShow});
	self:addEvent({ name = global_event.SKILLCHOICE_HIDE, eventHandler = self.onHide});
end

function skillchoice:onShow(event)
	if self._show then
		return;
	end

	self:Show();
	
	self.alphaValue = 1;
	self.alphaOperator = -1;
		
	function skillchoiceAlphaTick(dt)
		self:updateProgressAlpha(dt);
	end
	
	-- ����һ��alpha����ļ�ʱ�� 
	self.alphaTimer = scheduler.scheduleGlobal(skillchoiceAlphaTick, 0);
		
	function onskillchoiceClickGain(args)
		local window = LORD.toWindowEventArgs(args).window;
		local magicID = window:GetUserData();
		
		if magicID > 0 then
			sendChooseMagicResult(magicID);
			self:onHide();
		end
		
	end
	
	-- �׿�
	self.skillchoice_skill = {};
	-- ����
	self.skillchoice_skill_name = {};
	-- ͼ��
	self.skillchoice_skill_tu = {};
	-- ��ȡ��ť
	self.skillchoice_skill_button = {};
	-- ��Ƭ����
	self.skillchoice_skill_suipiannum = {};
	-- ����
	self.skillchoice_skill_new = {};
	-- exp
	self.skillchoice_skill_exp_bar = {};
	-- star
	self.skillchoice_skill_star = {};
	
	-- ��ȡ��3����ѡ������
	local magicChoiceData = event.choosesData;
	
	-- Ʒ�ʿ�
	local skillchoice_skill_equity = {};
	
	-- 
	local skillchoice_skill_exp_barthen = {};
	
	for i=1, 3 do

		-- �׿�
		self.skillchoice_skill[i] = self:Child("skillchoice-skillcard"..i.."-dw");
		-- ����
		self.skillchoice_skill_name[i] = self:Child("skillchoice-skill"..i.."-name");
		-- ͼ��
		self.skillchoice_skill_tu[i] = LORD.toStaticImage(self:Child("skillchoice-skill"..i.."-tu"));
		-- ��ȡ��ť
		self.skillchoice_skill_button[i] = self:Child("skillchoice-skill"..i.."-button");
		
		self.skillchoice_skill_button[i]:subscribeEvent("ButtonClick", "onskillchoiceClickGain");
		
		-- �Ǽ���Ӧ�ľ���
		self.skillchoice_skill_suipiannum[i] = self:Child("skillchoice-skill"..i.."-suipiannum");
		-- ����
		self.skillchoice_skill_new[i] = self:Child("skillchoice-skill"..i.."-new");
		-- exp
		self.skillchoice_skill_exp_bar[i] = self:Child("skillchoice-skill"..i.."-exp-bar");
		-- star
		self.skillchoice_skill_star[i] = {};
		for j=1, 5 do
			self.skillchoice_skill_star[i][j] = self:Child("skillchoice-skill"..i.."-star"..j);
		end
		
		-- Ʒ�ʿ�
		skillchoice_skill_equity[i] = LORD.toStaticImage(self:Child("skillchoice-skill"..i.."-equity"));
		
		-- Ԥ������������
		skillchoice_skill_exp_barthen[i] = self:Child("skillchoice-skill"..i.."-exp-barthen");
		
		if magicChoiceData[i] then
			-- ����������û���������
			self.skillchoice_skill[i]:SetVisible(true);
			
			local magicID = magicChoiceData[i].id;
			self.skillchoice_skill_button[i]:SetUserData(magicID);
			
			local magicStar = magicChoiceData[i].star;
			
			local magicInstance = dataManager.kingMagic:getMagic(magicID);
			local magicInfo = dataConfig.configs.magicConfig[magicID];
			
			
			if magicInfo and magicInstance then
			
				-- ˢ��ui�ϵ���Ϣ
				self.skillchoice_skill_name[i]:SetText(magicInfo.name);
				self.skillchoice_skill_tu[i]:SetImage(magicInfo.icon);
				
				self.skillchoice_skill_tu[i]:SetUserData(magicInfo.id);
				
				local userdata2 = 0;
				
				if magicInstance:isActive() then
					userdata2 = dataManager.kingMagic:mergeLevelIntelligence(magicInstance:getStar(), dataManager.playerData:getIntelligence());
				else
					userdata2 = dataManager.kingMagic:mergeLevelIntelligence(magicStar, dataManager.playerData:getIntelligence());
				end
				
				self.skillchoice_skill_tu[i]:SetUserData2(userdata2);
				global.onSkillTipsShow(self.skillchoice_skill_tu[i], "magic", "free");
				global.onTipsHide(self.skillchoice_skill_tu[i]);
		
				
				-- ��ʾ��ҵ�ǰ��ӵ�еĸ�ħ����Ʒ�ʣ���������δ��ø�ħ�����ջ��ħ��Ʒ����ʾ
				if magicInstance:isActive() then
					
					skillchoice_skill_equity[i]:SetImage(itemManager.getImageWithStar(magicInstance:getStar()));

				else
					
					skillchoice_skill_equity[i]:SetImage(itemManager.getImageWithStar(magicStar));
					
				end
				
				-- ��ʾ��ҵ�ǰ��ӵ�еĸ�ħ�����Ǽ�����������δ��ø�ħ�����ջ��ħ���Ǽ���ʾ��
				if magicInstance:isActive() then								
					
					for k = 1, 5 do
						self.skillchoice_skill_star[i][k]:SetVisible(k <= magicInstance:getStar());
					end
				
				else
					
					for k = 1, 5 do
						self.skillchoice_skill_star[i][k]:SetVisible(k <= magicStar);
					end
									
				end
				
				-- ��ʾ��ҵ�ǰ��ӵ�еĸ�ħ���������ȣ������飩�Ľ��ȣ���������δ��ø�ħ�����տ���ʾ
				local currentExp = magicInstance:getCurrentExp();
				local nextExp = magicInstance:getNextExp();
				local configInfo = dataConfig.configs.ConfigConfig[0].magicLevelExp;
				local chooseMagicExp = configInfo[magicStar];
				-- �����µ��Ǽ�
				local newStar = dataManager.kingMagic:getStarByExp(magicInstance:getExp()+chooseMagicExp);
				
				--��ʾ��ҵ�ǰ��ӵ�еĸ�ħ���������ȵ����֣�AAA/BBB��AAAΪ��ǰ���֣�BBBΪ�����������֣���������δ��ø�ħ������0/XX��ʾ,XXΪ���ħ��Ʒ�ʵľ�������
				local skillchoice_skill_exp_text = self:Child("skillchoice-skill"..i.."-exp-text");
													
				if magicInstance:isActive() then	
					
					self.skillchoice_skill_exp_bar[i]:SetProperty("Progress", currentExp/nextExp);
					
					skillchoice_skill_exp_text:SetText(currentExp.."/"..nextExp);
									
				else
					
					self.skillchoice_skill_exp_bar[i]:SetProperty("Progress", 0);
					
					local newgetCurrentExp, newgetNextExp = dataManager.kingMagic:getCurrentAndNextByExp(chooseMagicExp);
					
					skillchoice_skill_exp_text:SetText("0/"..newgetNextExp);
					
				end
				
				-- ������λ����ʾԤ���������������ѡ���ѡ�������������ӵ�еĳ���
				skillchoice_skill_exp_barthen[i]:SetProperty("Progress", (currentExp+chooseMagicExp)/nextExp);
				skillchoice_skill_exp_barthen[i]:SetVisible(magicInstance:isActive());
				
				-- ��ڤ��ѡ��Ϊ�����δ���ħ��ʱ��1�ǵĶ�û������δ��ã�����ʾ�ÿؼ�����Ӧskillchoice-skillX-suipian��skillchoice-skillX-jinghua����
				local skillchoice_skill_newget = self:Child("skillchoice-skill"..i.."-newget");
				skillchoice_skill_newget:SetVisible(not magicInstance:isActive());
				
				-- ��ڤ��ѡ��Ϊ����ѻ��ħ������ħ���Ǽ��Ѵ�����ʱ������ʾ�ÿؼ�����������ľ����ǻ����ħ�������������ӿؼ�skillchoice-skill1-jinghuanum����ʾ
				local skillchoice_skill_jinghua = self:Child("skillchoice-skill"..i.."-jinghua");
				skillchoice_skill_jinghua:SetVisible(magicInstance:isTopLevel());
				local skillchoice_skill_jinghuanum = self:Child("skillchoice-skill"..i.."-jinghuanum");
				skillchoice_skill_jinghuanum:SetVisible(magicInstance:isTopLevel());
				skillchoice_skill_jinghuanum:SetText(chooseMagicExp);
				
				--��ڤ��ѡ��Ϊ����ѻ��ħ��ʱ����ԭ���߼��еĻ�õ��Ǽ�ħ������ɾ��飨�������ȣ����ӿؼ�skillchoice-skill1��3-suipiannum����ʾ��Ӧ���֡�
				local skillchoice_skill_suipian = self:Child("skillchoice-skill"..i.."-suipian");
				skillchoice_skill_suipian:SetVisible(not magicInstance:isTopLevel() and magicInstance:isActive());				
				local skillchoice_skill_suipiannum = self:Child("skillchoice-skill"..i.."-suipiannum");
				skillchoice_skill_suipiannum:SetText(chooseMagicExp);
				
				-- ������ѡ���ѡ����Ƕ�Ӧħ�������Ǽ�������ʾ�ÿؼ���
				
				local showspecial2 = (magicInstance:getStar() == #configInfo-1 and ( newStar == #configInfo) and chooseMagicExp > (nextExp-currentExp));
				
				local skillchoice_skill_speicaltext = self:Child("skillchoice-skill"..i.."-speicaltext");
				skillchoice_skill_speicaltext:SetVisible( magicInstance:isActive() and chooseMagicExp >= (nextExp-currentExp) and not magicInstance:isTopLevel() and not showspecial2 );
				
				-- ������ѡ���ѡ���ʹ��Ӧħ������5�ǣ�����ӯ�ྭ��ֵ������ʾ�ÿؼ���
				local skillchoice_skill_speicaltext2 = self:Child("skillchoice-skill"..i.."-speicaltext2");
				
				skillchoice_skill_speicaltext2:SetVisible(showspecial2);
				
			end
			
		else
			self.skillchoice_skill[i]:SetVisible(false);
		end
		
	end
	
end

function skillchoice:onHide(event)
	
	if self.alphaTimer and self.alphaTimer > 0 then
		
		scheduler.unscheduleGlobal(self.alphaTimer);
		self.alphaTimer = nil;
	end
	
	self:Close();
end

function skillchoice:updateProgressAlpha(dt)
	
	if not self._show then
		
		return;
		
	end
	
	self.alphaValue = self.alphaValue + self.alphaOperator*dt*2;
	
	if self.alphaValue > 1 then
		self.alphaValue = 1;
		self.alphaOperator =  self.alphaOperator * -1;
	end

	if self.alphaValue < 0 then
		self.alphaValue = 0;
		self.alphaOperator =  self.alphaOperator * -1;
	end
		
	for i=1, 3 do
		
		local window = self:Child("skillchoice-skill"..i.."-exp-barthen");
		if window then
			window:SetAlpha(self.alphaValue);
		end
	end
	
end

return skillchoice;
