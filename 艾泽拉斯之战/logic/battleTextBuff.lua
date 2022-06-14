local battleTextBase = include("battleTextBase");
local battleTextBuff = class("battleTextBuff", battleTextBase);

battleTextBuff.HIT_RISE_SPEED = 50;
battleTextBuff.HIT_RISE_TIME = 1000;
battleTextBuff.HIT_RISE_STAYTIME = 700; --��͸��ʱ�䣬��ֵӦС����ʱ��

function battleTextBuff:ctor(effectType, text, unitIndex, fontName, delayTime)
	battleTextBuff.super.ctor(self, effectType, text, unitIndex, fontName, delayTime);
end

function battleTextBuff:update(dt)
		--print("battleTextBuff:update(dt) "..dt);
		--�����Ƿ�ɾ��

		-- ��Ϊ��������ܱ䣬����ÿһ֡��Ҫ�㡣����
		self.initPos = self:calcInitPos();
		
		if (self.timestamp <= battleTextBuff.HIT_RISE_TIME) then
		
			local percent = (self.timestamp * 1.0 / battleTextBuff.HIT_RISE_TIME);
			
			self.pos.y = self.initPos.y - self.timestamp*battleTextBuff.HIT_RISE_SPEED*0.001;
			
			if (self.timestamp > battleTextBuff.HIT_RISE_STAYTIME) then
				self.color.a = 1 - (self.timestamp-battleTextBuff.HIT_RISE_STAYTIME) * 1.0 / (battleTextBuff.HIT_RISE_TIME - battleTextBuff.HIT_RISE_STAYTIME);
			end
		else
			return true;
		end

		self.timestamp = self.timestamp + dt;
		-- �����仯��Ϣλ��
		local width = self.font:GetTextExtent(self.text, self.scale);
		local height = self.font:GetTextHigh(self.text, self.scale);
		self.pos.x = self.initPos.x - width / 2;

		return false;
end

return battleTextBuff;
