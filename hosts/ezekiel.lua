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
