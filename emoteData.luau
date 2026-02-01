local emoteConfig = {
	["Default Dance"] = {
		Id = 107266862552760,
		Sound = "outrageEmoteMusic/defaultdance.ogg",
		SongRegion = NumberRange.new(0, 6.72),
	},
	["Xavier Dance"] = {
		Id = 133458285619167,
		Sound = "outrageEmoteMusic/xavierdance.mp3",
		SongEndOffset = 0.04,
	},
	["Dance With Eyes Closed"] = {
		Id = 117991470645633,
		Sound = "outrageEmoteMusic/dancewitheyesclosed.mp3",
		SongEndOffset = 0.06,
		DWECAura = true,
	},
	["Hugo"] = {
		Id = 104248876465825,
		Sound = "outrageEmoteMusic/hugo.mp3",
		SongEndOffset = 0.04,
		AnimRegion = NumberRange.new(0, 2.02),
	},
	["Griddy"] = {
		Id = 81913798511136,
		Sound = "outrageEmoteMusic/griddie.mp3",
		SongEndOffset = 0.04,
	},
	["Billy Bounce"] = {
		Id = 133394554631338,
		Sound = "outrageEmoteMusic/billybounce.mp3",
		SongEndOffset = 0.04,
	},
	["Boppin"] = {
		Id = 118800950867852,
		Sound = "outrageEmoteMusic/boppin.mp3",
		AnimStartOffset = -0.716,
		SongEndOffset = 0.04,
	},
	["Who Is You"] = {
		Id = 112292128222180,
		Sound = "outrageEmoteMusic/whoisyou.mp3",
		AnimSpeed = 1.012,
		SongEndOffset = 0.04,
	}
}

local emoteOrder = {
	"Dance With Eyes Closed",
	"Hugo",
	"Griddy",
	"Who Is You",
	"Default Dance",
	"Billy Bounce",
	"Boppin",
	"Xavier Dance",
}

return emoteConfig, emoteOrder
