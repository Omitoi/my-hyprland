

-- SUPER + Tab: Top-level dispatcher via hyprctl
hl.bind("SUPER + Tab", hl.dsp.workspace.swap_monitors({ monitor1 = "0", monitor2 = "1" }))

-- ALT + Tab: Swap current focused window with Master
hl.bind("ALT + Tab", hl.dsp.layout("swapwithmaster master"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
closeWindowBind = hl.bind("SUPER + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd(menu), { release = true })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast copy area"))

-- Move focus with "SUPER" + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Switch / Swap workspaces on current active screen with "SUPER" + physical number row keys
-- Move active window to a workspace with "SUPER" + SHIFT + physical number row keys
for i = 1, 10 do
    local code = 9 + (i % 10 == 0 and 10 or i % 10) -- Keycodes: 1->10 (key 1), 2->11 (key 2)... 0->19 (key 0)
    hl.bind("SUPER + code:" .. code,         hl.dsp.exec_cmd("/home/omitoi/.config/hypr/swap-keybind-ws.py " .. i))
    hl.bind("SUPER + SHIFT + code:" .. code, hl.dsp.window.move({ workspace = tostring(i) }))
end






-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))

-- Scroll through existing workspaces with "SUPER" + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with "SUPER" + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })