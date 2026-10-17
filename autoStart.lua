hl.on("hyprland.start", function ()
    -- Launch Lockscreen Immediately on Session Startup
    hl.exec_cmd("hyprlock --immediate-render &")

    -- Background Services & Core Apps
    hl.exec_cmd("hyprlauncher --daemon &")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")

    hl.exec_cmd("systemctl --user start hyprpolkitagent &")
    
    -- Daily Wallpaper & Hyprpaper
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh && hyprpaper &")

    -- Reset EWW & Start Daemon
    hl.exec_cmd("killall -q eww; LOCPATH=/home/omitoi/.local/share/locale LC_TIME=en_GB.UTF-8 eww daemon &")
    hl.exec_cmd("sleep 0.5 && ~/.config/eww/scripts/launch-bars.sh &")
    hl.exec_cmd("~/.config/eww/scripts/popup-daemon.py &")

    -- Autostart Steam Silently in Background (disabled on media device 'ezekiel')
    local raw_hostname = io.popen("uname -n"):read("*l") or ""
    local hostname = string.lower(raw_hostname:gsub("%s+", ""))
    if hostname ~= "ezekiel" then
        hl.exec_cmd("steam -silent &")
    end
end)