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

-- Shortcut: SUPER + Y launches YouTube in a new window on next empty workspace
hl.bind("SUPER + Y", hl.dsp.exec_cmd("/usr/bin/python3 /home/omitoi/.local/bin/open-url-on-empty-ws.py https://youtube.com"))

-- Power & Display: Maintain standby screen without DPMS sleep
hl.config({
    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms  = true,
    },
})
