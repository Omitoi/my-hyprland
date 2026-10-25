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

-- YouTube TV Kiosk Window Rules (Workspace 1, Fullscreen)
hl.window_rule({
    name       = "youtube-tv-kiosk",
    match      = { class = "^(youtube-tv)$" },
    workspace  = "1",
    fullscreen = true,
})

-- DLNA/Universal Media Player Window Rules
hl.window_rule({
    name       = "vlc-dlna-fullscreen",
    match      = { class = "^(vlc)$" },
    workspace  = "1",
    fullscreen = true,
})

-- Shortcut: SUPER + Y launches/focuses YouTube TV
hl.bind("SUPER + Y", hl.dsp.exec_cmd("~/.local/bin/youtube-tv"))

-- Power & Display: Maintain standby screen without DPMS sleep
hl.config({
    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms  = true,
    },
})
