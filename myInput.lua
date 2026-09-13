---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "cz,us,ru,no",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:shift_caps_toggle",
        kb_rules   = "",
        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

