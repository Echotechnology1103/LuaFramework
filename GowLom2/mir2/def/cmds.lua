local cmds = {
	all = {
		{
			"@��غ�һ",
			"@��غ�һ"
		},
		{
			"@������غ�һ",
			"@������غ�һ"
		}
	},
	custom = {
		�سǸ��� = "@relive",
		��λ�ָ� = "@resetpoint"
	},
	get = function (key)
		for k, v in pairs(cmds.all) do
			if v[1] == key then
				return v[2]
			end
		end

		return 
	end
}

return cmds
