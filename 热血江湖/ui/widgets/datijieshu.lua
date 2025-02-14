--version = 1
local l_fileType = "node"

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
			etype = "Grid",
			name = "dati",
			posX = 0.5,
			posY = 0.5,
			anchorX = 0.5,
			anchorY = 0.5,
			sizeX = 0.4859375,
			sizeY = 0.7361111,
		},
		children = {
		{
			prop = {
				etype = "Image",
				name = "dta",
				varName = "rootImage",
				posX = 0.5,
				posY = 0.5,
				anchorX = 0.5,
				anchorY = 0.5,
				sizeX = 1,
				sizeY = 0.9716981,
				image = "b#d2",
				scale9 = true,
				scale9Left = 0.45,
				scale9Right = 0.45,
				scale9Top = 0.45,
				scale9Bottom = 0.45,
			},
			children = {
			{
				prop = {
					etype = "Image",
					name = "dt2",
					posX = 0.5,
					posY = 0.5301692,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.9169337,
					sizeY = 0.1135783,
					image = "d#bt",
					alpha = 0.5,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "wzsm2",
					posX = 0.2009364,
					posY = 0.5301691,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.3486934,
					sizeY = 0.1464902,
					text = "您的排名：",
					color = "FF966856",
					fontSize = 24,
					fontOutlineColor = "FF102E21",
					hTextAlign = 2,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "wzsm3",
					varName = "rank",
					posX = 0.6861406,
					posY = 0.5323909,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.419288,
					sizeY = 0.1464902,
					text = "666名",
					fontSize = 22,
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "js",
					posX = 0.5,
					posY = 0.820567,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.4774919,
					sizeY = 0.1902913,
					image = "dati#dtjs",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "pmz",
					varName = "firstDigit",
					posX = 0.4451631,
					posY = 0.5276683,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.07073955,
					sizeY = 0.1165049,
					image = "dati#1",
				},
			},
			{
				prop = {
					etype = "Image",
					name = "pmz2",
					varName = "secondDigit",
					posX = 0.5016127,
					posY = 0.5276683,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.07073955,
					sizeY = 0.1165049,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "pmz3",
					varName = "thirdDigit",
					posX = 0.5580624,
					posY = 0.5276684,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.07073955,
					sizeY = 0.1165049,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "pmz4",
					varName = "fourthDigit",
					posX = 0.614512,
					posY = 0.5276683,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.07073955,
					sizeY = 0.1165049,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "pmz5",
					varName = "fifthDigit",
					posX = 0.6709617,
					posY = 0.5276683,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.07073955,
					sizeY = 0.1165049,
				},
			},
			{
				prop = {
					etype = "Label",
					name = "wzsm4",
					varName = "getExp",
					posX = 0.6209821,
					posY = 0.6502628,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.229025,
					sizeY = 0.1464902,
					text = "+15324",
					color = "FFFFF25D",
					fontSize = 24,
					fontOutlineEnable = true,
					fontOutlineColor = "FF27221D",
					vTextAlign = 1,
				},
			},
			{
				prop = {
					etype = "Image",
					name = "js2",
					posX = 0.4500026,
					posY = 0.6499345,
					anchorX = 0.5,
					anchorY = 0.5,
					sizeX = 0.08038586,
					sizeY = 0.09708738,
					image = "ty#exp",
				},
			},
			{
				prop = {
					etype = "Grid",
					name = "jljd",
					varName = "nohaverank_bg",
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
						posY = 0.2509855,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.9169337,
						sizeY = 0.2997369,
						image = "b#d2",
						scale9 = true,
						scale9Left = 0.45,
						scale9Right = 0.45,
						scale9Top = 0.45,
						scale9Bottom = 0.45,
					},
					children = {
					{
						prop = {
							etype = "Image",
							name = "taz",
							posX = 0.5,
							posY = 1,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3261254,
							sizeY = 0.2332142,
							image = "chu1#top2",
						},
						children = {
						{
							prop = {
								etype = "Label",
								name = "jlz",
								posX = 0.5,
								posY = 0.4722222,
								anchorX = 0.5,
								anchorY = 0.5,
								sizeX = 0.842118,
								sizeY = 1.17881,
								text = "获得奖励",
								color = "FFF1E9D7",
								fontOutlineEnable = true,
								fontOutlineColor = "FFA47848",
								fontOutlineSize = 2,
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
						etype = "Image",
						name = "dj1",
						varName = "item_bg",
						posX = 0.2361426,
						posY = 0.2404924,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.1511254,
						sizeY = 0.1825243,
						image = "djk#ktong",
					},
					children = {
					{
						prop = {
							etype = "Button",
							name = "an1",
							varName = "Btn1",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "djt",
							varName = "item_icon",
							posX = 0.4947355,
							posY = 0.5363846,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8091878,
							sizeY = 0.8007717,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "sl",
							varName = "item_count",
							posX = 0.5496499,
							posY = 0.3440697,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7203518,
							sizeY = 0.5201941,
							text = "x100",
							fontOutlineEnable = true,
							hTextAlign = 2,
							vTextAlign = 2,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "suo",
							varName = "Item_suo",
							posX = 0.1951497,
							posY = 0.2277778,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3157895,
							sizeY = 0.3225806,
							image = "tb#suo",
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dj2",
						varName = "item_bg2",
						posX = 0.4129353,
						posY = 0.2404924,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.1511254,
						sizeY = 0.1825243,
						image = "djk#ktong",
					},
					children = {
					{
						prop = {
							etype = "Button",
							name = "an2",
							varName = "Btn2",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "djt2",
							varName = "item_icon2",
							posX = 0.4947355,
							posY = 0.5363846,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8091878,
							sizeY = 0.8007717,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "sl2",
							varName = "item_count2",
							posX = 0.5496499,
							posY = 0.3440697,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7203518,
							sizeY = 0.5201941,
							text = "x100",
							fontOutlineEnable = true,
							hTextAlign = 2,
							vTextAlign = 2,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "suo2",
							varName = "Item_suo2",
							posX = 0.1951497,
							posY = 0.2277778,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3157895,
							sizeY = 0.3225806,
							image = "tb#suo",
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dj3",
						varName = "item_bg3",
						posX = 0.5897277,
						posY = 0.2404924,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.1511254,
						sizeY = 0.1825243,
						image = "djk#ktong",
					},
					children = {
					{
						prop = {
							etype = "Button",
							name = "an3",
							varName = "Btn3",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "djt3",
							varName = "item_icon3",
							posX = 0.4947355,
							posY = 0.5363846,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8091878,
							sizeY = 0.8007717,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "sl3",
							varName = "item_count3",
							posX = 0.5496499,
							posY = 0.3440697,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7203518,
							sizeY = 0.5201941,
							text = "x100",
							fontOutlineEnable = true,
							hTextAlign = 2,
							vTextAlign = 2,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "suo3",
							varName = "Item_suo3",
							posX = 0.1951497,
							posY = 0.2277778,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3157895,
							sizeY = 0.3225806,
							image = "tb#suo",
						},
					},
					},
				},
				{
					prop = {
						etype = "Image",
						name = "dj4",
						varName = "item_bg4",
						posX = 0.7665203,
						posY = 0.2404924,
						anchorX = 0.5,
						anchorY = 0.5,
						visible = false,
						sizeX = 0.1511254,
						sizeY = 0.1825243,
						image = "djk#ktong",
					},
					children = {
					{
						prop = {
							etype = "Button",
							name = "an4",
							varName = "Btn4",
							posX = 0.5,
							posY = 0.5,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 1,
							sizeY = 1,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "djt4",
							varName = "item_icon4",
							posX = 0.4947355,
							posY = 0.5363846,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.8091878,
							sizeY = 0.8007717,
						},
					},
					{
						prop = {
							etype = "Label",
							name = "sl4",
							varName = "item_count4",
							posX = 0.5496499,
							posY = 0.3440697,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.7203518,
							sizeY = 0.5201941,
							text = "x100",
							fontOutlineEnable = true,
							hTextAlign = 2,
							vTextAlign = 2,
						},
					},
					{
						prop = {
							etype = "Image",
							name = "suo4",
							varName = "Item_suo4",
							posX = 0.1951497,
							posY = 0.2277778,
							anchorX = 0.5,
							anchorY = 0.5,
							sizeX = 0.3157895,
							sizeY = 0.3225806,
							image = "tb#suo",
						},
					},
					},
				},
				{
					prop = {
						etype = "Label",
						name = "tsz",
						posX = 0.4903191,
						posY = 0.05986615,
						anchorX = 0.5,
						anchorY = 0.5,
						sizeX = 0.8483698,
						sizeY = 0.129613,
						text = "获得奖励通过通过信件发奖",
						color = "FF966856",
						hTextAlign = 1,
						vTextAlign = 1,
					},
				},
				},
			},
			{
				prop = {
					etype = "Image",
					name = "wsb",
					varName = "noHaveRank_label",
					posX = 0.5564501,
					posY = 0.5230561,
					anchorX = 0.5,
					anchorY = 0.5,
					visible = false,
					sizeX = 0.2180937,
					sizeY = 0.07852194,
					image = "dati#wsb",
				},
			},
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
}
--EDITOR animations end tag
local function create()
return UIUtil.createNode(l_fileType, eleRoot, l_animations)
end
return create
