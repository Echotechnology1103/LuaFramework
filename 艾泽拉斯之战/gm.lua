

--�߻�ֻҪ��gm ָ����˫�����������ŵ�����ı������ok�ˣ� �����˶��š�
GM = 
{ 
"for i=0,3 do player:addmoney(i, 99999999) end",
"for i=1,5 do player:addmagicexp(i, 500) end",
"for i=1,5 do player:addcardexp(i,9999) end",
"player:setplayerlevel(30)",
"player:setrmb(20000)",
"for j=259, 264 do player:additem(0, j, 6) end",
}

GM.call = function()
	for i,v in ipairs (GM) do
		sendGm(v)
	end
end

GM.call()




----------------------�޸ĺ� ���������ͻ���







 -------------������������--------------------
GM__Test =
{
	"for i=0,3 do player:addmoney(i, 2000) end",
}
GM__Test.call = function()
	for i,v in ipairs (GM__Test) do
		sendGm(v)
	end
end
GM__Test.call()

 -------------������������--------------------
