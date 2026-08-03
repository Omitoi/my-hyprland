bg_dark        = "rgb(1F2329)"       -- Primary dark base (#1F2329)
circuit_green  = "rgb(B6FF2E)"       -- Secondary vibrant accent (#B6FF2E)
circuit_dim    = "rgb(3D5017)"       -- Muted secondary accent for inactive borders
flame_core     = "rgb(B6FF2E)"       -- Secondary accent
flame_outer    = "rgb(1F2329)"       -- Primary dark

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = flame_core,
            inactive_border = circuit_dim,
        },
        layout = "master",
        resize_on_border    =  true,
        no_focus_fallback   =  true,
        allow_tearing   = false,
    },
    master = {
        new_status = "master",
        mfact = 0.75,              
    },
    decoration = {
        rounding = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        dim_inactive = true,
        dim_strength = 0.1,
        shadow = {
            enabled = false,
            range = 8,
            render_power = 50,
            color = flame_outer,
        },
        blur = {
            enabled = false,
            new_optimizations = true,
        },
    },
    group = {
        col = {
            border_active = {
                colors = { flame_core, flame_outer },
                angle = 45,
            },
            border_inactive = circuit_dim,
        },
        groupbar = {
            col = {
                active = circuit_green,
                inactive = circuit_dim,
            },
            text_color = bg_dark,
        },
    },
    animations = {
        enabled = false,
    },
})