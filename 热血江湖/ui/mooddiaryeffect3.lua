-------------------------------------------------------
module(..., package.seeall)

local require = require;

local ui = require("ui/base");

-------------------------------------------------------
wnd_moodDiaryEffect3 = i3k_class("wnd_moodDiaryEffect3", ui.wnd_base)

function wnd_moodDiaryEffect3:ctor()

end

function wnd_moodDiaryEffect3:configure()
	local widgets = self._layout.vars
	widgets.btn:onClick(self, self.onBtn)
	self._count = 0
end

function wnd_moodDiaryEffect3:refresh(msg)
	local widgets = self._layout.vars
	widgets.tipWord:setText(msg)
end

function wnd_moodDiaryEffect3:onShow()
	local anis = self._layout and self._layout.anis and self._layout.anis.c_dakai
	if anis then
		anis.stop()
		anis.play(function ()
			g_i3k_ui_mgr:CloseUI(eUIID_MoodDiaryEffect3)
		end)
	end
end

function wnd_moodDiaryEffect3:onBtn(sender)
	self._count = self._count + 1
	if self._count >= 2 then
		g_i3k_ui_mgr:CloseUI(eUIID_MoodDiaryEffect3)
	end
end

function wnd_create(layout, ...)
	local wnd = wnd_moodDiaryEffect3.new()
	wnd:create(layout, ...)
	return wnd;
end
