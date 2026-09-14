hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
        layout = "master",
        resize_on_border = true,
        no_focus_fallback = true,
        allow_tearing = false,
    },
    master = {
        new_status = "master",
        mfact = 0.75,
    },
    decoration = {
        rounding = 0,
        active_opacity = 1,
        inactive_opacity = 0.9,
        dim_inactive = true,
        dim_strength = 0.1,
        shadow = { enabled = false },
        blur = { enabled = false },
    },
    animations = {
        enabled = false,
    },
})