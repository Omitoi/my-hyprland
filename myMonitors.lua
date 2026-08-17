hl.monitor({
	output	=	"HDMI-A-1",
	mode	=	"1920x1080@60",
	position	=	"0x0",
	scale	=	"1",
})

hl.monitor({
	output	=	"eDP-1",
	mode	=	"1920x1080@144",
	position	=	"-1920x0",
	scale	=	"1",
})

-- Dynamic workspace assignment across screens


-- Send Steam to Workspace 1 (Main BenQ Screen)
hl.window_rule({
  match = { class = "^([Ss]team)$" },
  workspace = "1",
})

-- Send Discord to Workspace 2 (Laptop Screen)
hl.window_rule({
  match = { class = "^([Dd]iscord|vesktop|WebCord)$" },
  workspace = "2",
})