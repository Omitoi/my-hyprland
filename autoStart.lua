hl.on("hyprland.start", function ()
    -- Background Services & Core Apps
    hl.exec_cmd("hyprlauncher --daemon &")
    hl.exec_cmd("systemctl --user start hyprpolkitagent &")
    hl.exec_cmd("hyprpaper &")

    -- Reset EWW & Start Daemon
    hl.exec_cmd("killall -q eww; eww daemon &")
    hl.exec_cmd("sleep 0.5 && eww open bar_0 && eww open bar_1 &")
end)