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

-- Workspace 1 stays on the BenQ main monitor
hl.workspace_rule({ workspace = 1, monitor = "HDMI-A-1", default = true })

-- Workspace 2 stays on the laptop monitor
hl.workspace_rule({ workspace = 2, monitor = "eDP-1" })

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