hl.on("hyprland.start", function ()
    -- Launch Lockscreen Immediately on Session Startup
    hl.exec_cmd("hyprlock --immediate-render &")

    -- Background Services & Core Apps
    hl.exec_cmd("hyprlauncher --daemon &")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")

    hl.exec_cmd("systemctl --user start hyprpolkitagent &")
    hl.exec_cmd("hyprpaper &")


    -- Reset EWW & Start Daemon
    hl.exec_cmd("killall -q eww; eww daemon &")
    hl.exec_cmd("sleep 0.5 && eww open bar_0; eww open bar_1; eww open verse_splash_0; eww open verse_splash_1 &")
    hl.exec_cmd("~/.config/eww/scripts/popup-daemon.py &")




    -- Autostart Steam Silently in Background
    hl.exec_cmd("steam -silent &")
end)