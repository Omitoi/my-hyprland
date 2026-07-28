hl.monitor({
	output	=	"HDMI-A-1",
	mode	=	"1920x1080@60",
	position	=	"0x0",
	scale	=	"1",
})

hl.monitor({
	output	=	"eDP-1",
	mode	=	"1920x1080@144",
	position	=	"-1536x216",
	scale	=	"1.25",
})

-- Bind workspaces 1-5 to BenQ as default
for i = 1, 5 do
    hl.workspace_rule({ workspace = i, monitor = "HDMI-A-1", default = true })
end