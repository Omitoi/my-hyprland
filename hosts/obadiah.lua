-------------------------------------
---- HOST CONFIGURATION: OBADIAH ----
-------------------------------------

-- Built-in Laptop Display (144Hz)
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@144",
    position = "-1920x0",
    scale    = "1",
})

-- External BenQ Monitor (60Hz)
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1",
})
