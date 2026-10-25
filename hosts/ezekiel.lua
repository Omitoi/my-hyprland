-------------------------------------
---- HOST CONFIGURATION: EZEKIEL ----
-------------------------------------

-- Built-in Laptop Display
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})

-- External Display Fallback
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-- Intel UHD 620 VA-API Hardware Video Decoding
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("VDPAU_DRIVER", "va_gl")
