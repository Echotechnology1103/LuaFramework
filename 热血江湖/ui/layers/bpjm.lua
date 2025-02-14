--version = 1
local l_fileType = "layer"

local UIUtil = require "ui/common/UIUtil"

--EDITOR elements start tag
local eleRoot = 
{
	prop = {
		etype = "Layer",
		name = "root",
		posX = 0,
		posY = 0,
		anchorX = 0,
		anchorY = 0,
	},
	children = {
	{
		prop = {
			etype = "Image",
			name = "ddd",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
			image = "b#dd",
			scale9 = true,
			scale9Left = 0.3,
			scale9Right = 0.3,
			scale9Top = 0.3,
			scale9Bottom = 0.3,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "dz",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
			},
		},
		},
	},
	{
		prop = {
			etype = "Grid",
			name = "dd",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "dt",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 1,
				image = "a",
				scale9 = true,
				scale9Left = 0.3,
				scale9Right = 0.3,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
			},
			children = {
			{
				prop = {
					etype = "Grid",
					name = "chylb",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1,
					sizeY = 1,
				},
				children = {
				{
					prop = {
						etype = "Scroll",
						name = "bpcyl",
						varName = "bg_scroll",
						posX = 0.5,
						posY = 0.4982029,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 1,
						sizeY = 0.9964057,
						horizontal = true,
					},
				},
				},
			},
			},
		},
		},
	},
	{
		prop = {
			etype = "Image",
			name = "btk",
			posX = 0.6257856,
			posY = 0.9112589,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1.25,
			sizeY = 0.170813,
			image = "bp#top3",
			scale9 = true,
			scale9Left = 0.7,
			scale9Right = 0.1,
			layoutType = 7,
			layoutTypeW = 7,
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "z3",
				varName = "members_label",
				posX = 0.133514,
				posY = 0.4225526,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1358988,
				sizeY = 0.3658874,
				text = "成员:123/888",
				fontOutlineEnable = true,
				fontOutlineColor = "FF27221D",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "mjd",
				posX = 0.03007708,
				posY = 0.634129,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.0625,
				sizeY = 0.7758065,
				image = "bp#bp_txd.png",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "tx",
					varName = "faction_icon",
					posX = 0.5,
					posY = 0.5096154,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.9512472,
					sizeY = 0.9892902,
					image = "bptb2#101",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "tx3",
					varName = "faction_bg",
					posX = 0.518119,
					posY = 0.4907712,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9150091,
					sizeY = 0.9892902,
				},
			},
			},
		},
		{
			prop = {
				etype = "Label",
				name = "bmz",
				varName = "faction_name",
				posX = 0.1682165,
				posY = 0.8117405,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2053037,
				sizeY = 0.4276728,
				text = "帮派名字",
				color = "FFFFF554",
				fontSize = 26,
				fontOutlineEnable = true,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Image",
				name = "cyd2",
				posX = 0.0905716,
				posY = 0.044438,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1707791,
				sizeY = 0.3394495,
				image = "d#tyd",
				alpha = 0.7,
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "z4",
					varName = "qq_label",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9673676,
					sizeY = 1.134291,
					text = "QQ群：25094762",
					fontOutlineEnable = true,
					fontOutlineColor = "FF27221D",
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		},
	},
	{
		prop = {
			etype = "Grid",
			name = "xys",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
			layoutType = 2,
			layoutTypeW = 2,
		},
		children = {
		{
			prop = {
				etype = "Button",
				name = "an2",
				varName = "set_btn",
				posX = 0.9520569,
				posY = 0.07916461,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#bp_sz.png",
				layoutType = 2,
				imageNormal = "bp#bp_sz.png",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "zz",
				posX = 0.5194874,
				posY = 0.07916462,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.6551515,
				sizeY = 0.06944446,
				image = "b#xyd",
				scale9 = true,
				scale9Left = 0.41,
				scale9Right = 0.37,
				scale9Top = 0.3,
				scale9Bottom = 0.3,
				layoutType = 2,
			},
			children = {
			{
				prop = {
					etype = "Button",
					name = "xg",
					varName = "creed_btn",
					posX = 1.063096,
					posY = 0.4999999,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.08824296,
					sizeY = 1.48,
					image = "bp#bp_xg.png",
					imageNormal = "bp#bp_xg.png",
					soundEffectClick = "audio/rxjh/UI/anniu.ogg",
				},
			},
			{
				prop = {
					etype = "Scroll",
					name = "lb",
					varName = "scroll",
					posX = 0.5,
					posY = 0.5,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.97,
					sizeY = 1,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an3",
				varName = "flag_btn",
				posX = 0.05195559,
				posY = 0.1070773,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.08203124,
				sizeY = 0.1388889,
				image = "bp#bpdq",
				layoutType = 2,
				imageNormal = "bp#bpdq",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "bt",
					posX = 0.2227305,
					posY = 0.8546105,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.2476191,
					sizeY = 0.26,
					image = "bp#sld",
				},
			},
			{
				prop = {
					etype = "Label",
					name = "slz",
					varName = "flagCount",
					posX = 0.2234213,
					posY = 0.8511029,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.4645522,
					sizeY = 0.4136407,
					text = "3",
					color = "FFFFFF00",
					fontSize = 22,
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an4",
				varName = "garrison_btn",
				posX = 0.9512755,
				posY = 0.2194084,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#zd",
				layoutType = 2,
				imageNormal = "bp#zd",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "xhd",
					posX = 0.7563411,
					posY = 0.8103004,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.3648649,
					sizeY = 0.3783783,
					image = "zdte#hd",
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an5",
				varName = "luckyStarBtn",
				posX = 0.9512755,
				posY = 0.3469764,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#xyx",
				layoutType = 2,
				imageNormal = "bp#xyx",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "xhd2",
					posX = 0.7563411,
					posY = 0.8103004,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.3648649,
					sizeY = 0.3783783,
					image = "zdte#hd",
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an6",
				varName = "fcbsBtn",
				posX = 0.137114,
				posY = 0.107081,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.08203123,
				sizeY = 0.1388889,
				image = "bp#bpsl",
				layoutType = 2,
				imageNormal = "bp#bpsl",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an7",
				varName = "factionWareHouse",
				posX = 0.8884006,
				posY = 0.2180195,
				anchorX = 0.5,
				anchorY = 0.5,
				visible = false,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#cangku",
				layoutType = 2,
				imageNormal = "bp#cangku",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "xhd3",
					posX = 0.7563411,
					posY = 0.8103004,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.3648649,
					sizeY = 0.3783783,
					image = "zdte#hd",
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an8",
				varName = "photoBtn",
				posX = 0.8884006,
				posY = 0.3469764,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bphz#hezhao",
				layoutType = 2,
				imageNormal = "bphz#hezhao",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "xhd4",
					posX = 0.7563411,
					posY = 0.8103004,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.3648649,
					sizeY = 0.3783783,
					image = "zdte#hd",
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "an9",
				varName = "faction_card",
				posX = 0.8907629,
				posY = 0.4634143,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "smkp#kp",
				imageNormal = "smkp#kp",
			},
		},
		},
	},
	{
		prop = {
			etype = "Grid",
			name = "xjd",
			posX = 0.5,
			posY = 0.919416,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 0.1544992,
			layoutType = 9,
			layoutTypeW = 9,
		},
		children = {
		{
			prop = {
				etype = "Label",
				name = "z1",
				varName = "faction_lvl",
				posX = 0.3141081,
				posY = 0.7747464,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.101668,
				sizeY = 0.5193434,
				text = "等级:15",
				color = "FFFFFF00",
				fontSize = 22,
				fontOutlineEnable = true,
				fontOutlineColor = "FF27221D",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Label",
				name = "z7",
				varName = "up_time_label",
				posX = 0.3859127,
				posY = 0.3522346,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.2452771,
				sizeY = 0.5193434,
				text = "剩余时间:22时55分",
				fontOutlineEnable = true,
				fontOutlineColor = "FF27221D",
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Button",
				name = "sj",
				varName = "uplvl_btn",
				posX = 0.4128751,
				posY = 0.7547398,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.07516163,
				sizeY = 0.4045328,
				image = "chu1#sn1",
				imageNormal = "chu1#sn1",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "js",
					varName = "uplvl_label",
					posX = 0.5,
					posY = 0.5392156,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9409001,
					sizeY = 0.9704051,
					text = "升 级",
					color = "FF914A15",
					fontSize = 24,
					fontOutlineColor = "FFD1CB6F",
					fontOutlineSize = 2,
					hTextAlign = 1,
					vTextAlign = 1,
				},
			},
			},
		},
		{
			prop = {
				etype = "Image",
				name = "jsg",
				varName = "acImg",
				posX = 0.4127946,
				posY = 0.7443432,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.09582823,
				sizeY = 0.5511156,
				image = "bp#bp_tx.png",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "wp4",
				posX = 0.726956,
				posY = 0.7690181,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.1209375,
				sizeY = 0.4045328,
				image = "tong#sld",
				scale9 = true,
				scale9Left = 0.4,
				scale9Right = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "sl4",
					varName = "my_label",
					posX = 1.041833,
					posY = 0.5000001,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.49625,
					sizeY = 1.222222,
					text = "994245",
					color = "FFFFFF00",
					fontSize = 22,
					fontOutlineEnable = true,
					fontOutlineColor = "FF27221D",
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "tb4",
					posX = 0.1269764,
					posY = 0.4877726,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.3262309,
					sizeY = 1.077855,
					image = "tb#tb_banggong.png",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "dj",
					varName = "faction_sect_btn",
					posX = 0.5079999,
					posY = 0.47194,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.027691,
					sizeY = 1.173896,
				},
			},
			},
		},
		{
			prop = {
				etype = "Button",
				name = "ht",
				varName = "closeBtn",
				posX = 0.9741886,
				posY = 0.6772594,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.05234375,
				sizeY = 0.683211,
				image = "chu1#gb",
				layoutType = 1,
				imageNormal = "chu1#gb",
				soundEffectClick = "audio/rxjh/UI/ui_guanbi.ogg",
			},
		},
		{
			prop = {
				etype = "Image",
				name = "wp5",
				posX = 0.8615875,
				posY = 0.7690181,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.1209375,
				sizeY = 0.4045328,
				image = "tong#sld",
				scale9 = true,
				scale9Left = 0.4,
				scale9Right = 0.4,
			},
			children = {
			{
				prop = {
					etype = "Label",
					name = "sl5",
					varName = "my_label2",
					posX = 0.8573371,
					posY = 0.5000001,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.147982,
					sizeY = 1.222222,
					text = "994245",
					color = "FFFFFF00",
					fontSize = 22,
					fontOutlineEnable = true,
					fontOutlineColor = "FF27221D",
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "tb5",
					posX = 0.1269764,
					posY = 0.4877726,
					anchorX = 0.5,
					anchorY = 0.5,
					lockHV = true,
					sizeX = 0.3262309,
					sizeY = 1.077855,
					image = "items6#longjing",
				},
			},
			{
				prop = {
					etype = "Button",
					name = "dj2",
					varName = "faction_sect_btn2",
					posX = 0.5079999,
					posY = 0.47194,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 1.027691,
					sizeY = 1.173896,
				},
			},
			},
		},
		},
	},
	{
		prop = {
			etype = "Grid",
			name = "ysjm",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 1,
			sizeY = 1,
		},
		children = {
		{
			prop = {
				etype = "RichText",
				name = "fwb",
				varName = "shootMsg1",
				posX = 0.4976605,
				posY = 0.6373032,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb2",
				varName = "shootMsg2",
				posX = 0.4976605,
				posY = 0.7607844,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb3",
				varName = "shootMsg3",
				posX = 0.4976605,
				posY = 0.6064329,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb4",
				varName = "shootMsg4",
				posX = 0.4976605,
				posY = 0.5755625,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb5",
				varName = "shootMsg5",
				posX = 0.4976605,
				posY = 0.5446922,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb6",
				varName = "shootMsg6",
				posX = 0.4976605,
				posY = 0.5138218,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb7",
				varName = "shootMsg7",
				posX = 0.4976605,
				posY = 0.4829516,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb8",
				varName = "shootMsg8",
				posX = 0.4976605,
				posY = 0.4520812,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb9",
				varName = "shootMsg9",
				posX = 0.4976605,
				posY = 0.4212109,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb10",
				varName = "shootMsg10",
				posX = 0.4976605,
				posY = 0.6990438,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb11",
				varName = "shootMsg11",
				posX = 0.4976605,
				posY = 0.7299141,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb12",
				varName = "shootMsg12",
				posX = 0.4976605,
				posY = 0.3286,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb13",
				varName = "shootMsg13",
				posX = 0.4976605,
				posY = 0.2977296,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb14",
				varName = "shootMsg14",
				posX = 0.4976605,
				posY = 0.2668593,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb15",
				varName = "shootMsg15",
				posX = 0.4976605,
				posY = 0.235989,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb16",
				varName = "shootMsg16",
				posX = 0.4976605,
				posY = 0.2051187,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb17",
				varName = "shootMsg17",
				posX = 0.4976605,
				posY = 0.3903406,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb18",
				varName = "shootMsg18",
				posX = 0.4976605,
				posY = 0.6681735,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb19",
				varName = "shootMsg19",
				posX = 0.4976605,
				posY = 0.3594703,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "RichText",
				name = "fwb20",
				varName = "shootMsg20",
				posX = 0.4976605,
				posY = 0.1742483,
				anchorX = 0,
				anchorY = 0.5,
				sizeX = 0.9801322,
				sizeY = 0.06399019,
				vTextAlign = 1,
			},
		},
		{
			prop = {
				etype = "Button",
				name = "plcs2",
				varName = "shootMsg_btn",
				posX = 0.9512756,
				posY = 0.5858271,
				anchorX = 0.5,
				anchorY = 0.5,
				lockHV = true,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#fdm",
				imageNormal = "bp#fdm",
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
		},
		{
			prop = {
				etype = "Button",
				name = "qh6",
				varName = "showMsgBtn",
				posX = 0.9512756,
				posY = 0.4634143,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 0.0578125,
				sizeY = 0.1027778,
				image = "bp#dm2",
				imageNormal = "bp#dm2",
				imagePressed = "bp#dm1",
				imageDisable = "bp#dm2",
				disablePressScale = true,
				soundEffectClick = "audio/rxjh/UI/anniu.ogg",
			},
		},
		},
	},
	},
}
--EDITOR elements end tag
--EDITOR animations start tag
local l_animations =
{
	ss = {
		jsg = {
			alpha = {{0, {1}}, {400, {0.3}}, {800, {1}}, },
		},
	},
	gy = {
	},
	gy3 = {
	},
	gy2 = {
	},
	gy4 = {
	},
	gy5 = {
	},
	gy6 = {
	},
	gy7 = {
	},
	gy8 = {
	},
	gy9 = {
	},
	gy10 = {
	},
	gy11 = {
	},
	gy12 = {
	},
	gy13 = {
	},
	gy14 = {
	},
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
