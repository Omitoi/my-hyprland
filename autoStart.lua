hl.on("hyprland.start", function ()
    -- Background Services & Core Apps (run asynchronously using &)
    hl.exec_cmd("hyprlauncher --help > /dev/null &")
    hl.exec_cmd("systemctl --user start hyprpolkitagent &")
    hl.exec_cmd("hyprpaper &")

    -- Reset EWW & Start Daemon
    hl.exec_cmd("killall -q eww; eww daemon &")

    -- Non-blocking monitor check via background process
    hl.exec_cmd([[
        sh -c '
            sleep 0.5
            MON_COUNT=$(hyprctl monitors -j | grep -c '"'"'"id"'"'"':)
            if [ "$MON_COUNT" -gt 1 ]; then
                eww open bar_0 && eww open bar_1
            else
                eww open bar_0
            fi
        ' &
    ]])
end)